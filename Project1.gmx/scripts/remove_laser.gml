image_index = 0;
offset = 0;
laser_block = self;

while (laser_block != noone) {
    laser_block = checkCollisionDir(facing_direction, check_direction, obj_Laser, offset, 0);
    
    if (laser_block != noone && laser_block != self) {
        with(laser_block) {
            instance_destroy()
        }
        offset += sprite_width;
    }
}
