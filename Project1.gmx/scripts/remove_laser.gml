image_index = 0;
offset = 0;
offset_vertical = 0;
laser_block = self;

while (laser_block != noone) {
    laser_block = checkCollisionDir(facing_direction, check_direction, obj_Laser, offset, offset_vertical);
    
    if (laser_block != noone && laser_block != self) {
        with(laser_block) {
            instance_destroy()
        }   
        switch(check_direction) {
            case WAY.RIGHT:
                offset += sprite_width;
                break;
            case WAY.LEFT:
                offset -= sprite_width
                break;
            case WAY.ABOVE:
                offset_vertical -= sprite_height;
                break;
            case WAY.BELOW:
                offset_vertical += sprite_height;
        }
            
    }
}
