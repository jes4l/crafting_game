// Draw Event
draw_set_color(c_gray);
draw_rectangle(x1, y1, x2, y2, false);
draw_set_color(c_white);
draw_rectangle(x1, y1, x2, y2, true);
draw_set_font(fntGUI_small);
// Draw the top middle text
var top_text = "Enter your Name and Click the Egg to Hatch It!";
var top_text_width = string_width(top_text);
var top_text_x = (room_width - top_text_width) / 2;
draw_text(top_text_x, 50, top_text);
var display_text = global.name;
if (writable || (is_browser && string_length(global.name) > 0)) { // Blink cursor only when active (non-browser) or after input (browser)
   display_text += cursor;
}
// Calculate the width of the text
var text_width = string_width(display_text);
// Calculate the starting x position to center the text
var start_x = (x1 + x2) / 2 - text_width / 2;
if (string_length(global.name) == 0 && !writable) {
    draw_set_color(c_white);
    draw_text(x1 + 1, y1 + 4, " Enter Name"); // Keep "Enter Name" in its original position
} else {
    draw_text(start_x, y1 + 4, display_text); // Center the entered text
}
if (error_message != "") {
    draw_text(x1, y2 + 6, error_message);
}
if (invalid_char_message != "") {
    draw_text(x1, y2 + 6, invalid_char_message);
}
draw_set_font(-1);
if (!is_browser) { // Only run cursor changes on non-HTML5 platforms
    if (point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2)) {
        window_set_cursor(cr_beam);
    } else {
        window_set_cursor(cr_default);
    }
}