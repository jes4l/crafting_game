function CostDisplay(cost_wood, cost_stone, cost_key, cost_water, cost_titanium, cost_coin, cost_lightning, sprite) {

    draw_self();
    
    if (mouse_x > x - sprite_width / 2 && mouse_x < x + sprite_width / 2 &&
        mouse_y > y - sprite_height / 2 && mouse_y < y + sprite_height / 2) {
        
        var y_offset = y - sprite_height / 2;
        var x_offset = x + sprite_width / 2 + 10;
        var text_y_offset = -11;
        var text_x_offset = + 10;
        
        // Set alpha to 1 to ensure the costs are drawn above everything else
        draw_set_alpha(1);
        
        // Display the costs with corresponding item sprites on the right-hand side of the object
        if (cost_wood > 0) {
            draw_sprite(sWood, 0, x_offset, y_offset);
            draw_text(x_offset + text_x_offset, y_offset + text_y_offset, string(cost_wood));
            y_offset += 20;
        }
        if (cost_stone > 0) {
            draw_sprite(sStone, 0, x_offset, y_offset);
            draw_text(x_offset + text_x_offset, y_offset + text_y_offset, string(cost_stone));
            y_offset += 20;
        }
        if (cost_key > 0) {
            draw_sprite(sKey, 0, x_offset, y_offset);
            draw_text(x_offset + text_x_offset, y_offset + text_y_offset, string(cost_key));
            y_offset += 20;
        }
        if (cost_water > 0) {
            draw_sprite(sWater, 0, x_offset, y_offset);
            draw_text(x_offset + text_x_offset, y_offset + text_y_offset, string(cost_water));
            y_offset += 20;
        }
        if (cost_titanium > 0) {
            draw_sprite(sTitanium, 0, x_offset, y_offset);
            draw_text(x_offset + text_x_offset, y_offset + text_y_offset, string(cost_titanium));
            y_offset += 20;
        }
        if (cost_coin > 0) {
            draw_sprite(sCoin, 0, x_offset, y_offset);
            draw_text(x_offset + text_x_offset, y_offset + text_y_offset, string(cost_coin));
            y_offset += 20;
        }
        if (cost_lightning > 0) {
            draw_sprite(sLightning, 0, x_offset, y_offset);
            draw_text(x_offset + text_x_offset, y_offset + text_y_offset, string(cost_lightning));
            y_offset += 20;
        }
        
        // Reset alpha to default
        draw_set_alpha(1);
    }
}