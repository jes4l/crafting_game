// Scale the image up
image_xscale += scale_speed;
image_yscale += scale_speed;
audio_play_sound(snd_fire, 1, false);
// Check if all oE1, oE2, oE3, and oE4 objects are destroyed
if (instance_number(oE1) == 0 && instance_number(oE2) == 0 && instance_number(oE3) == 0 && instance_number(oE4) == 0) {
    // Go to the rmBegin room
    room_goto(rmPlayer);
}
// Start the path for all instances of oE1
