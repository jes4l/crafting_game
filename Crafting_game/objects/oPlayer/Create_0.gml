// properties
moveSpeed = 1;

global.hp_jesal = 50;
hp = global.hp_jesal;
max_hp = global.hp_jesal;

// variables
moveX = 0;
moveY = 0;

// Create Pickaxe
heldItem = instance_create_layer(x, y, "Instances", oPickaxe);
// pickaxe flipper
global.flipEnabled = true; // Set to true to enable flipping by default

// Inventory
// Initialize startX and startY for inventory drawing
// Initialize cellWidth and cellHeight for inventory drawing
cellWidth = 36;
cellHeight = 50;

// Initialize startX and startY for inventory drawing
startX = 10;
startY = display_get_gui_height() - cellHeight - 10 + 20;
global.inventory = ds_grid_create(9, 1); // 9 cells (slots) in the inventory


//message
message = "";
alarm[0] = -1; // Initialize the alarm









