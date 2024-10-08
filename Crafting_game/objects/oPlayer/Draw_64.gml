draw_set_font(fntGUI_smallest);

for (var i = 0; i < 9; i++) // Updated to 9 slots
{
    var itemQuantity = global.inventory[# i, 0];
    var itemSprite;
    var scale = 1; // Default scale

    switch (i)
    {
        case 0: // Cell 1 (Key)
            itemSprite = sKey;
            break;		
        case 1: // Cell 2 (Wood)
            itemSprite = sWood;
            break;
        case 2: // Cell 3 (Stone)
            itemSprite = sStone;
            break;
        case 3: // Cell 4 (Titanium)
            itemSprite = sTitanium;
            break;
        case 4: // Cell 5 (Electricity)
            itemSprite = sLightning;
            break;
	    case 5: // Cell 6 (Water)
            itemSprite = sWater;
            break;
        case 6: // Cell 7 (Spikes)
            itemSprite = sSpikes;
            break;
        case 7: // Cell 8 (Bomb)
            itemSprite = sBomb;
            scale = 0.5; // Scale down the bomb sprite
            break;
        case 8: // Cell 9 (EMP)
            itemSprite = sEMP;
            scale = 0.9; // Scale down the EMP sprite
            break;
        default:
            itemSprite = sDefault;
            break;
    }

    // Define the box's top-left and bottom-right coordinates
    var box_x1 = startX + i * cellWidth;
    var box_y1 = startY + 4;
    var box_x2 = startX + (i + 1) * cellWidth;
    var box_y2 = startY + cellHeight - 12 - 4;

    // Center position for the sprite within the box
    var box_center_x = (box_x1 + box_x2) / 2;
    var box_center_y = (box_y1 + box_y2) / 2;

    // Calculate the sprite's top-left corner to align its center with the box center
    var itemX = box_center_x - (sprite_get_width(itemSprite) * scale) / 2 + 6;
    var itemY = box_center_y - (sprite_get_height(itemSprite) * scale) / 2 + 6;

    // Draw smaller grey box with translucency
    draw_set_color(c_dkgray);
    draw_set_alpha(0.6); // Set alpha to 0.5 for translucency
    draw_rectangle(box_x1, box_y1, box_x2, box_y2, false);
    draw_set_alpha(1); // Reset alpha to 1 for other drawings

    // Draw the item sprite inside the box
    draw_sprite_ext(itemSprite, 0, itemX, itemY, scale, scale, 0, c_white, 1);

    // Display the item quantity slightly lower and to the right
    draw_set_color(c_white);
    var quantityX = box_center_x + 0.5;
    var quantityY = box_center_y - (sprite_get_height(itemSprite) * scale) / 2 + 10;

    draw_text(quantityX, quantityY, string(itemQuantity));

    // Draw white outline around the smaller grey box
    draw_set_color(c_dkgray);
    var outline_thickness = 0.5;

    draw_rectangle(box_x1 - outline_thickness, box_y1 - outline_thickness, box_x2 + outline_thickness, box_y1 + outline_thickness, false); // Top
    draw_rectangle(box_x1 - outline_thickness, box_y2 - outline_thickness, box_x2 + outline_thickness, box_y2 + outline_thickness, false); // Bottom
    draw_rectangle(box_x1 - outline_thickness, box_y1 - outline_thickness, box_x1 + outline_thickness, box_y2 + outline_thickness, false); // Left
    draw_rectangle(box_x2 - outline_thickness, box_y1 - outline_thickness, box_x2 + outline_thickness, box_y2 + outline_thickness, false); // Right
}

draw_set_font(-1);
draw_set_color(-1);
