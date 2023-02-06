# calibre wide preferences

### Begin group: DEFAULT
 
# database path
# Path to the database in which books are stored
database_path = u'/storage/metadata.db'
 
# filename pattern
# Pattern to guess metadata from filenames
filename_pattern = u'(?P<title>.+) - (?P<author>[^_]+)'
 
# isbndb com key
# Access key for isbndb.com
isbndb_com_key = ''
 
# network timeout
# Default timeout for network operations (seconds)
network_timeout = 5
 
# library path
# Path to directory in which your library of books is stored
library_path = u'/storage/'
 
# language
# The language in which to display the user interface
language = 'en'
 
# output format
# The default output format for ebook conversions.
output_format = 'epub'
 
# input format order
# Ordered list of formats to prefer for input.
input_format_order = cPickle.loads('\x80\x02]q\x01(U\x04EPUBq\x02U\x04MOBIq\x03U\x03LITq\x04U\x03PRCq\x05U\x03FB2q\x06U\x04HTMLq\x07U\x03HTMq\x08U\x04XHTMq\tU\x05SHTMLq\nU\x05XHTMLq\x0bU\x03ZIPq\x0cU\x03ODTq\rU\x03RTFq\x0eU\x03PDFq\x0fU\x03TXTq\x10e.')
 
# read file metadata
# Read metadata from files
read_file_metadata = True
 
# worker process priority
# The priority of worker processes. A higher priority means they run faster and consume more resources. Most tasks like conversion/news download/adding books/etc. are affected by this setting.
worker_process_priority = 'normal'
 
# swap author names
# Swap author first and last names when reading metadata
swap_author_names = False
 
# add formats to existing
# Add new formats to existing book records
add_formats_to_existing = True
 
# check for dupes on ctl
# Check for duplicates when copying to another library
check_for_dupes_on_ctl = False
 
# installation uuid
# Installation UUID
installation_uuid = 'a3109374-4086-4b1e-9150-85dba802d6e0'
 
# new book tags
# Tags to apply to books added to the library
new_book_tags = cPickle.loads('\x80\x02]q\x01.')
 
# mark new books
# Mark newly added books. The mark is a temporary mark that is automatically removed when calibre is restarted.
mark_new_books = False
 
# saved searches
# List of named saved searches
saved_searches = cPickle.loads('\x80\x02}q\x01.')
 
# user categories
# User-created tag browser categories
user_categories = cPickle.loads('\x80\x02}q\x01.')
 
# manage device metadata
# How and when calibre updates metadata on the device.
manage_device_metadata = u'on_connect'
 
# limit search columns
# When searching for text without using lookup prefixes, as for example, Red instead of title:Red, limit the columns searched to those named below.
limit_search_columns = False
 
# limit search columns to
# Choose columns to be searched when not using prefixes, as for example, when searching for Red instead of title:Red. Enter a list of search/lookup names separated by commas. Only takes effect if you set the option to limit search columns above.
limit_search_columns_to = cPickle.loads('\x80\x02]q\x01(U\x05titleq\x02U\x07authorsq\x03U\x04tagsq\x04U\x06seriesq\x05U\tpublisherq\x06e.')
 
# use primary find in search
# Characters typed in the search box will match their accented versions, based on the language you have chosen for the calibre interface. For example, in  English, searching for n will match ñ and n, but if your language is Spanish it will only match n. Note that this is much slower than a simple search on very large libraries.
use_primary_find_in_search = True
 
# migrated
# For Internal use. Don't modify.
migrated = False
