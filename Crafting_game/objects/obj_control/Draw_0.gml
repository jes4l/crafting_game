// Draw Event
var margin = 16;
var box_width = 500;
var box_height = 400;
var box_x = room_width - box_width - margin;
var box_y = (room_height - box_height) / 2;

draw_set_color(c_black);
draw_set_font(fntG);
draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, false);
draw_set_color(c_white);
draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, true);

var max_name_width = string_width("Name");
var max_lvl_width = string_width("Level");
var max_coins_width = string_width("Coins");

if data != -1 {
    for (var i = 0; i < array_length(data); i++) {
        var _doc = data[i];
        var name_width = string_width(_doc.name);
        var lvl_width = string_width(_doc.lvl);
        var coins_width = string_width(string(_doc.coins));
        
        if (name_width > max_name_width) {
            max_name_width = name_width;
        }
        
        if (lvl_width > max_lvl_width) {
            max_lvl_width = lvl_width;
        }
        
        if (coins_width > max_coins_width) {
            max_coins_width = coins_width;
        }
    }
}

var scale_factor = 0.75;

draw_text_transformed(box_x + margin, box_y + margin, "Leaderboard:", scale_factor, scale_factor, 0);

var header_y = box_y + margin + 32;
draw_text_transformed(box_x + margin, header_y, "Name", scale_factor, scale_factor, 0);
draw_text_transformed(box_x + margin + max_name_width + margin, header_y, "Level", scale_factor, scale_factor, 0);
draw_text_transformed(box_x + margin + max_name_width + max_lvl_width + 2 * margin, header_y, "Coins", scale_factor, scale_factor, 0);

if data != -1 {
    for (var i = 0; i < array_length(data) && i < 10; i++) {
        var _doc = data[i];
        var row_y = header_y + 32 + (24 * i);

        if (row_y + 16 < box_y + box_height) {
            draw_text_transformed(box_x + margin, row_y, _doc.name, scale_factor, scale_factor, 0);
            draw_text_transformed(box_x + margin + max_name_width + margin, row_y, _doc.lvl, scale_factor, scale_factor, 0);
            draw_text_transformed(box_x + margin + max_name_width + max_lvl_width + 2 * margin, row_y, string(_doc.coins), scale_factor, scale_factor, 0);
        } else {
            break;
        }
    }
} else {
    draw_text_transformed(box_x + margin, header_y + 32, "Loading...", scale_factor, scale_factor, 0);
}