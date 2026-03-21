#!/opt/scripts/venv/bin/python3
import sys, os, re, json
from icalendar import Calendar, Event

try:
    import spacy
    nlp = spacy.load('en_core_web_sm')
except:
    import en_core_web_sm
    nlp = en_core_web_sm.load()

# 1. LOAD MAPPINGS
MAPPINGS_PATH = os.path.join(os.path.dirname(__file__), 'mappings.json')

def load_mappings():
    if os.path.exists(MAPPINGS_PATH):
        try:
            with open(MAPPINGS_PATH, 'r', encoding='utf-8') as f:
                return json.load(f)
        except Exception as e:
            print(f"Error loading mappings: {e}")
            return {}
    return {}

mappings = load_mappings()

# Flatten mappings into search terms and canonical tags
SEARCH_MAP = {}
WHITELIST = set()

for category in mappings.values():
    for canonical, terms in category.items():
        WHITELIST.add(canonical)
        for term in terms:
            SEARCH_MAP[term.upper()] = canonical

# 2. FILTERS
STOP_TAGS = {'BIN', 'SEA', 'DAY', 'ROAD', 'STUFF', 'ORDER', 'DUE', 'BACK', 'OFF', 'PICK', 'TIME', 'THE', 'AND', 'EVENT', 'GREEN', 'BLACK', 'WITH', 'FOR', 'OUT'}

# 3. EXPANSIONS
EXPANSIONS = {
    'KIDS': ['ALEXIS', 'ETHAN', 'ISAAC'],
    'BOYS': ['ETHAN', 'ISAAC'],
    'ALL': ['ALEXIS', 'ETHAN', 'ISAAC', 'ANNE', 'SIMON']
}

def get_categories(summary, existing_tags_str=''):
    # Clean input
    clean_summary = summary.replace('’s', '').replace("'s", '').replace('-', ' ')
    doc = nlp(clean_summary)
    tags = set()
    
    # 4. Collaborative: Keep existing user tags
    if existing_tags_str:
        # Split by comma but handle escaped commas if any
        for t in existing_tags_str.replace('\\,', ',').split(','):
            tag = t.strip().upper()
            if tag: tags.add(tag)

    # 5. Smart extraction
    for ent in doc.ents:
        if ent.label_ == 'PERSON':
            tags.add(ent.text.upper())
            
    for chunk in doc.noun_chunks:
        root_text = chunk.root.text.upper()
        if root_text in WHITELIST or (chunk.root.pos_ == 'PROPN' and root_text not in STOP_TAGS):
            tags.add(root_text)

    # 6. Abbreviations/Keywords/Mappings
    words = set(re.findall(r'\w+', clean_summary.upper()))
    for word in words:
        if word in WHITELIST:
            tags.add(word)
        if word in SEARCH_MAP:
            tags.add(SEARCH_MAP[word])
            
    # Check for multi-word search terms
    upper_summary = clean_summary.upper()
    for term, canonical in SEARCH_MAP.items():
        if ' ' in term and term in upper_summary:
            tags.add(canonical)

    # 7. Recursive Expansion (e.g. Kids -> Alexis, Ethan, Isaac)
    final_tags = set()
    for tag in tags:
        if tag in EXPANSIONS:
            final_tags.update(EXPANSIONS[tag])
        else:
            final_tags.add(tag)

    # 8. Final Cleanup
    result = sorted([t for t in final_tags if t not in STOP_TAGS and len(t) > 1])
    return result

def process_file(file_path):
    if not os.path.exists(file_path): return
    
    with open(file_path, 'rb') as f:
        try:
            content = f.read()
            cal = Calendar.from_ical(content)
        except Exception as e:
            print(f"Error parsing {file_path}: {e}")
            return
    
    modified = False
    last_summary = ""
    last_proposed = []
    
    for component in cal.walk():
        if component.name == "VEVENT":
            summary = str(component.get('SUMMARY', ''))
            last_summary = summary
            
            existing = component.get('CATEGORIES', [])
            if isinstance(existing, list):
                existing_str = ','.join(str(c) for c in existing)
            else:
                existing_str = str(existing)
            
            if not summary: continue
            proposed = get_categories(summary, existing_str)
            last_proposed = proposed
            
            if proposed:
                # Use a comma-separated string but wrapped in a way that avoid escaping if possible
                # Or just use multiple lines which is safer for iCalendar standards
                if 'CATEGORIES' in component:
                    del component['CATEGORIES']
                for p in proposed:
                    component.add('CATEGORIES', p)
                modified = True
    
    if modified:
        with open(file_path, 'wb') as f:
            # use_step=False to avoid unnecessary line folding for categories if possible
            f.write(cal.to_ical())
        print(f'Agentic v3: {last_summary} -> {",".join(last_proposed)}')

if __name__ == "__main__":
    for arg in sys.argv[1:]:
        process_file(arg)