path_start(Path1, global.spd_homelander, 0, 1);
hp = global.hp_homelander;
max_hp = global.hp_homelander;

range = 130;
fire_rate = room_speed / 3.2;
shooting = false;
objectToShoot = noone;


stored_position = 0;

// Spikes
in_contact_with_spikes = false;

// Change colour shader
if (global.level == 5 || global.level == 6) {
    color_pink = true; // Set a flag to indicate the color change
} else {
    color_pink = false;
}