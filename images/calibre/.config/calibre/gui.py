# preferences for the calibre GUI

### Begin group: DEFAULT
 
# send to storage card by default
# Send file to storage card instead of main memory by default
send_to_storage_card_by_default = False
 
# confirm delete
# Confirm before deleting
confirm_delete = False
 
# main window geometry
# Main window geometry
main_window_geometry = cPickle.loads('\x80\x02csip\n_unpickle_type\nq\x01U\x0cPyQt4.QtCoreq\x02U\nQByteArrayU.\x01\xd9\xd0\xcb\x00\x01\x00\x00\x00\x00\x07\xe8\x00\x00\x004\x00\x00\x0e\xa5\x00\x00\x04G\x00\x00\x07\xea\x00\x00\x00K\x00\x00\x0e\xa3\x00\x00\x04C\x00\x00\x00\x01\x00\x00\x85\x87Rq\x03.')
 
# new version notification
# Notify when a new version is available
new_version_notification = True
 
# use roman numerals for series number
# Use Roman numerals for series number
use_roman_numerals_for_series_number = True
 
# sort tags by
# Sort tags list by name, popularity, or rating
sort_tags_by = 'name'
 
# match tags type
# Match tags by any or all.
match_tags_type = 'any'
 
# cover flow queue length
# Number of covers to show in the cover browsing mode
cover_flow_queue_length = 6
 
# LRF conversion defaults
# Defaults for conversion to LRF
LRF_conversion_defaults = cPickle.loads('\x80\x02]q\x01.')
 
# LRF ebook viewer options
# Options for the LRF ebook viewer
LRF_ebook_viewer_options = None
 
# internally viewed formats
# Formats that are viewed using the internal viewer
internally_viewed_formats = cPickle.loads('\x80\x02]q\x01(U\x03LRFq\x02U\x04EPUBq\x03U\x03LITq\x04U\x04MOBIq\x05U\x03PRCq\x06U\x03AZWq\x07U\x04HTMLq\x08U\x03FB2q\tU\x03PDBq\nU\x02RBq\x0bU\x03SNBq\x0ce.')
 
# column map
# Columns to be displayed in the book list
column_map = cPickle.loads('\x80\x02]q\x01(U\x05titleq\x02U\x08ondeviceq\x03U\x07authorsq\x04U\x04sizeq\x05U\ttimestampq\x06U\x06ratingq\x07U\tpublisherq\x08U\x04tagsq\tU\x06seriesq\nU\x07pubdateq\x0be.')
 
# autolaunch server
# Automatically launch content server on application startup
autolaunch_server = False
 
# oldest news
# Oldest news kept in database
oldest_news = 60
 
# systray icon
# Show system tray icon
systray_icon = True
 
# upload news to device
# Upload downloaded news to device
upload_news_to_device = True
 
# delete news from library on upload
# Delete news books from library after uploading to device
delete_news_from_library_on_upload = False
 
# separate cover flow
# Show the cover flow in a separate window instead of in the main calibre window
separate_cover_flow = False
 
# disable tray notification
# Disable notifications from the system tray icon
disable_tray_notification = False
 
# default send to device action
# Default action to perform when send to device button is clicked
default_send_to_device_action = 'DeviceAction:main::False:False'
 
# asked library thing password
# Asked library thing password at least once.
asked_library_thing_password = False
 
# search as you type
# Start searching as you type. If this is disabled then search will only take place when the Enter or Return key is pressed.
search_as_you_type = False
 
# highlight search matches
# When searching, show all books with search results highlighted instead of showing only the matches. You can use the N or F3 keys to go to the next match.
highlight_search_matches = False
 
# save to disk template history
# Previously used Save to Disk templates
save_to_disk_template_history = cPickle.loads('\x80\x02]q\x01.')
 
# send to device template history
# Previously used Send to Device templates
send_to_device_template_history = cPickle.loads('\x80\x02]q\x01X!\x00\x00\x00{author_sort}/{title} - {authors}q\x02a.')
 
# main search history
# Search history for the main GUI
main_search_history = cPickle.loads('\x80\x02]q\x01(X\x10\x00\x00\x00Pool of Radianceq\x02X\x0e\x00\x00\x00Benedict Jackaq\x03X\x06\x00\x00\x00Hiddenq\x04X\x17\x00\x00\x00author:"Benedict Jacka"q\x05X\x10\x00\x00\x00author:"Dashner"q\x06X\x17\x00\x00\x00author:"Dashner, James"q\x07X\x16\x00\x00\x00author:"Veronica Roth"q\x08X\x14\x00\x00\x00author:"Jim Butcher"q\tX*\x00\x00\x00title:"Skin Game" and author:"Jim Butcher"q\nX\t\x00\x00\x00Skin Gameq\x0bX\x1e\x00\x00\x00title:"The Second Machine Age"q\x0cX\x16\x00\x00\x00the second machine ageq\rX\x1a\x00\x00\x00author:"Patricia Cornwell"q\x0eX\x15\x00\x00\x00author:"James Gleick"q\x0fX\x0f\x00\x00\x00title:"pro git"q\x10X\x03\x00\x00\x00gitq\x11X\x07\x00\x00\x00pro gitq\x12X\x06\x00\x00\x00progitq\x13X\x17\x00\x00\x00author:"Terry Goodkind"q\x14X\x12\x00\x00\x00author:"Lee Child"q\x15X\x10\x00\x00\x00The Tiger\'s Wifeq\x16X\x08\x00\x00\x00Sed  Awkq\x17X\t\x00\x00\x00Sed & Awkq\x18X\x0f\x00\x00\x00Python for Unixq\x19X\x1a\x00\x00\x00Managing projects with Gnuq\x1ae.')
 
# viewer search history
# Search history for the ebook viewer
viewer_search_history = cPickle.loads('\x80\x02]q\x01.')
 
# lrf viewer search history
# Search history for the LRF viewer
lrf_viewer_search_history = cPickle.loads('\x80\x02]q\x01.')
 
# scheduler search history
# Search history for the recipe scheduler
scheduler_search_history = cPickle.loads('\x80\x02]q\x01.')
 
# plugin search history
# Search history for the plugin preferences
plugin_search_history = cPickle.loads('\x80\x02]q\x01(X\n\x00\x00\x00duplicatesq\x02X\t\x00\x00\x00duplicateq\x03e.')
 
# shortcuts search history
# Search history for the keyboard preferences
shortcuts_search_history = cPickle.loads('\x80\x02]q\x01.')
 
# jobs search history
# Search history for the tweaks preferences
jobs_search_history = cPickle.loads('\x80\x02]q\x01.')
 
# tweaks search history
# Search history for tweaks
tweaks_search_history = cPickle.loads('\x80\x02]q\x01.')
 
# worker limit
# Maximum number of simultaneous conversion/news download jobs. This number is twice the actual value for historical reasons.
worker_limit = 6
 
# get social metadata
# Download social metadata (tags/rating/etc.)
get_social_metadata = True
 
# overwrite author title metadata
# Overwrite author and title with new metadata
overwrite_author_title_metadata = True
 
# auto download cover
# Automatically download the cover, if available
auto_download_cover = True
 
# enforce cpu limit
# Limit max simultaneous jobs to number of CPUs
enforce_cpu_limit = True
 
# gui layout
# The layout of the user interface. Wide has the book details panel on the right and narrow has it at the bottom.
gui_layout = 'wide'
 
# show avg rating
# Show the average rating per item indication in the tag browser
show_avg_rating = True
 
# disable animations
# Disable UI animations
disable_animations = False
 
# tag browser hidden categories
# tag browser categories not to display
tag_browser_hidden_categories = cPickle.loads('\x80\x02c__builtin__\nset\nq\x01]\x85Rq\x02.')
 


