{
	'chapter' : u"//*[((name()='h1' or name()='h2') and re:test(., 'chapter|book|section|part|prologue|epilogue\\s+', 'i')) or @class = 'chapter']",
	'remove_first_image' : False,
	'chapter_mark' : u'pagebreak',
	'insert_metadata' : False,
	'page_breaks_before' : u"//*[name()='h1' or name()='h2']",
	'remove_fake_margins' : True,
}