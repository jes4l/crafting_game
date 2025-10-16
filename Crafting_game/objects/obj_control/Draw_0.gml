// Draw Event
var margin = 16;
var box_width = 500;
var box_height = 400;
var box_x = room_width - box_width - margin;
var box_y = (room_height - box_height) / 2;

// Set box color and outline
var box_color = make_color_rgb(92, 153, 45);
draw_set_color(box_color);
draw_set_font(fntG);
draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, false);

// Change the outline color to the same as the box color
draw_set_color(box_color);
draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, true);

var max_name_width = string_width("Name");
var max_lvl_width = string_width("Level");
var max_coins_width = string_width("Coins");

if data != -1 {
    for (var i = 0; i < array_length(data); i++) {
        var _doc = data[i];
        var name_width = string_width(_doc.name);
        var lvl_width = string_width(string(_doc.lvl));
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
draw_set_color(c_white);
draw_text_transformed(box_x + margin, box_y + margin, "Leaderboard:", scale_factor, scale_factor, 0);
var header_y = box_y + margin + 32;
draw_text_transformed(box_x + margin, header_y, "Name", scale_factor, scale_factor, 0);
draw_text_transformed(box_x + margin + max_name_width + margin, header_y, "Level", scale_factor, scale_factor, 0);
draw_text_transformed(box_x + margin + max_name_width + max_lvl_width + 2 * margin, header_y, "Coins", scale_factor, scale_factor, 0);

if data != -1 {
    var highest_timestamp = -1;
    var highest_index = -1;

    // Find the entry with the highest timestamp
    for (var i = 0; i < array_length(data); i++) {
        var _doc = data[i];
        if (_doc.name == global.name && _doc.lvl == global.level && _doc.coins == global.coins) {
            var ts = struct_exists(_doc, "timestamp") ? _doc.timestamp : 0;
            if (ts > highest_timestamp) {
                highest_timestamp = ts;
                highest_index = i;
            }
        }
    }

    for (var i = 0; i < array_length(data) && i < 10; i++) {
        var _doc = data[i];
        var row_y = header_y + 32 + (24 * i);

        // Set text color to white initially
        draw_set_color(c_white);

        // Check if the current player is in the leaderboard and has the highest timestamp
        var is_current_player = (_doc.name == global.name && _doc.lvl == global.level && _doc.coins == global.coins);
        if (is_current_player && i == highest_index) {
            draw_set_color(c_black);
        }

        draw_text_transformed(box_x + margin, row_y, _doc.name, scale_factor, scale_factor, 0);
        draw_text_transformed(box_x + margin + max_name_width + margin, row_y, string(_doc.lvl), scale_factor, scale_factor, 0);
        draw_text_transformed(box_x + margin + max_name_width + max_lvl_width + 2 * margin, row_y, string(_doc.coins), scale_factor, scale_factor, 0);
    }
} else {
    draw_text_transformed(box_x + margin, header_y + 32, "Loading...", scale_factor, scale_factor, 0);
}