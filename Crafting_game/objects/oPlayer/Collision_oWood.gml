// OWOOD COLLISION EVENT
instance_destroy(other);
var itemType = "Wood"; // Change this based on the item type
var cellIndex = 0; // Cell 1 (adjust as needed)

// Increment the quantity in the inventory cell
global.inventory[# cellIndex, 0] += 1;
show_debug_message("Inventory " + itemType + ": " + string(global.inventory[# cellIndex, 0]));
