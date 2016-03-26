image_index = 1;
offset = 0;
floor_block = noone;
magnet_block = noone;

while (floor_block == noone && magnet_block == noone) {
    floor_block = checkCollisionDir(facing_direction, check_direction, obj_Floor, offset, 0);
    magnet_block = checkCollisionDir(facing_direction, check_direction, obj_Magnet, offset, 0);

    var inst;
    switch (check_direction) {
        case WAY.RIGHT:
            offset += sprite_width;
            inst = instance_create(x + offset, y, obj_Laser);
            break;
        case WAY.LEFT:
            offset += sprite_width;
            inst = instance_create(x - offset, y, obj_Laser);
            break;
        case WAY.ABOVE:
            offset += sprite_height;
            inst = instance_create(x, y - offset, obj_Laser);
            break;
        case WAY.BELOW:
            offset += sprite_height;
            inst = instance_create(x, y + offset, obj_Laser);
            break;
    }
    inst.image_index = 2;
}
