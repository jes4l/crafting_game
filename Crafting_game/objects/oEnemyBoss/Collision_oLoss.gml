if(global.life == 2 || global.life == 3){
    global.life = 1;
    global.coins = 100;
    instance_destroy();
}

else if(global.life == 1){
    room_goto(rmEnd);
    instance_destroy();
}


instance_create_layer(x, y, "Instances", oKey);
// Set message on oPlayer
oPlayer.message = "Use key to unlock gate";
oPlayer.alarm[0] = room_speed * 2; // Set the alarm to clear the message after 2 seconds
show_debug_message("Message set: " + oPlayer.message);
