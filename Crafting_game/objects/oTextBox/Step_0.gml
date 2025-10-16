// Step Event
if (!is_browser) {
    // Original non-browser input handling
    if (writable) {
        var filtered_name = "";
        var allowed_chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        var new_invalid_char_detected = false;
  
        for (var i = 1; i <= string_length(keyboard_string); i++) {
            var char = string_char_at(keyboard_string, i);
            if (string_pos(char, allowed_chars) > 0) {
                filtered_name += char;
            } else {
                new_invalid_char_detected = true;
                show_debug_message("Invalid character detected: " + char);
            }
        }
  
        global.name = filtered_name;
        show_debug_message("Filtered name: " + global.name);
  
        if (keyboard_check_pressed(vk_backspace) && string_length(global.name) > 0) {
            global.name = string_copy(global.name, 1, string_length(global.name) - 1);
            show_debug_message("Backspace pressed. Updated name: " + global.name);
        } else if (string_length(filtered_name) <= max_length) {
            global.name = filtered_name;
            show_debug_message("Name updated: " + global.name);
        } else if (string_length(filtered_name) > max_length) {
            keyboard_string = string_copy(filtered_name, 1, max_length);
            error_message = "Character limit Hit!";
            error_timer = error_display_duration;
            invalid_char_message = ""; // Clear invalid character message
            invalid_char_timer = 0; // Reset invalid character timer
            audio_play_sound(snd_button, 1, false);
            show_debug_message("Character limit reached. Error message set.");
        }
  
        if (new_invalid_char_detected && !invalid_char_detected) {
            invalid_char_message = "Invalid character!";
            audio_play_sound(snd_button, 1, false);
            invalid_char_timer = invalid_char_display_duration;
            error_message = ""; // Clear character limit message
            error_timer = 0; // Reset character limit timer
            invalid_char_detected = true;
            show_debug_message("Invalid character message set.");
        } else if (!new_invalid_char_detected) {
            invalid_char_detected = false;
        }
    }
    if (!writable) {
        keyboard_string = global.name;
        show_debug_message("Keyboard string synced with global.name: " + keyboard_string);
    }
}
// Common logic for both modes
draw_set_font(fntGUI_small);
// Calculate the new width based on the actual width of the input string
var text_width = string_width(global.name + cursor);
box_width = max(90, text_width + 10);
// Update the coordinates of the input box
x1 = (room_width - box_width) / 2;
x2 = x1 + box_width;
cursor_timer += 1;
if (cursor_timer >= cursor_blink_speed) {
    cursor_timer = 0;
    cursor = (cursor == "|") ? " " : "|";
    show_debug_message("Cursor toggled: " + cursor);
}
if (mouse_check_button_pressed(mb_left)) {
    if (point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2)) {
        audio_play_sound(snd_button, 1, false);
        if (is_browser) {
            // Trigger prompt in browser
            global.name_dialog_id = get_string_async("Enter your Name (up to 10 alphanumeric chars):", global.name);
            show_debug_message("Prompt triggered in browser.");
        } else {
            writable = true;
            show_debug_message("Text box activated.");
        }
    } else {
        if (!is_browser) {
            writable = false;
        }
        if (string_length(global.name) == 0) {
            global.name = "Anonymous";
            show_debug_message("No name entered. Set to Anonymous.");
            audio_play_sound(snd_button, 1, false);
        }
        show_debug_message("Text box deactivated.");
    }
}
if (error_timer > 0) {
    error_timer -= 1;
    if (error_timer <= 0) {
        error_message = "";
        show_debug_message("Error message hidden.");
    }
}
if (invalid_char_timer > 0) {
    invalid_char_timer -= 1;
    if (invalid_char_timer <= 0) {
        invalid_char_message = "";
        show_debug_message("Invalid character message hidden.");
        audio_play_sound(snd_button, 1, false);
    }
}