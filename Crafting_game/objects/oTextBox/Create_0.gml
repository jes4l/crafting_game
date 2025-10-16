// Create Event
box_width = 90; // Initial width
box_height = 20;
x1 = (room_width - box_width) / 2;
y1 = (room_height - box_height) / 2;
x2 = x1 + box_width;
y2 = y1 + box_height;
global.name = "";
max_length = 10;
writable = false;
cursor = "|";
cursor_timer = 0;
cursor_blink_speed = 30;
error_message = "";
error_timer = 0;
error_display_duration = 120;
invalid_char_message = "";
invalid_char_timer = 0;
invalid_char_display_duration = 120;
invalid_char_detected = false;
// Detect if running in browser (HTML5)
is_browser = (os_browser != browser_not_a_browser);
global.name_dialog_id = -1;