// Async - Dialog Event
var dialog_id = ds_map_find_value(async_load, "id");
if (dialog_id == global.name_dialog_id) { // Optional: Ensures this is our specific dialog (skip this if-block if you don't want the ID check)
    var result = ds_map_find_value(async_load, "result");
    var status = ds_map_find_value(async_load, "status"); // 1 = OK, 0 = Cancel
   
    if (status == 1) { // OK pressed
        // Filter invalid chars
        var filtered_name = "";
        var allowed_chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        var new_invalid_char_detected = false;
       
        for (var i = 1; i <= string_length(result); i++) {
            var char = string_char_at(result, i);
            if (string_pos(char, allowed_chars) > 0) {
                filtered_name += char;
            } else {
                new_invalid_char_detected = true;
            }
        }
       
        if (new_invalid_char_detected) {
            invalid_char_message = "Invalid character!";
            invalid_char_timer = invalid_char_display_duration;
            audio_play_sound(snd_button, 1, false);
            // Re-prompt if invalid
            global.name_dialog_id = get_string_async("Enter your Name (up to 10 alphanumeric chars):", filtered_name);
            return;
        }
       
        if (string_length(filtered_name) > max_length) {
            filtered_name = string_copy(filtered_name, 1, max_length);
            error_message = "Character limit Hit!";
            error_timer = error_display_duration;
            audio_play_sound(snd_button, 1, false);
            // Re-prompt with truncated
            global.name_dialog_id = get_string_async("Enter your Name (up to 10 alphanumeric chars):", filtered_name);
            return;
        }
       
        global.name = (filtered_name == "") ? "Anonymous" : filtered_name;
        show_debug_message("Name set from prompt: " + global.name);
    } else {
        // Cancel: Set to Anonymous if empty
        if (string_length(global.name) == 0) {
            global.name = "Anonymous";
            show_debug_message("No name entered. Set to Anonymous.");
        }
    }
}