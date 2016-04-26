#define create_laser
image_index = 1;
offset = 0;
floor_block = noone;
magnet_block = noone;
side_door = noone;
var inst;
changed = false;
while (floor_block == noone && magnet_block == noone && side_door == noone) {
    switch (check_direction) {
        case WAY.RIGHT:
            floor_block = checkCollisionDir(facing_direction, check_direction, obj_Floor, offset, -4);
            magnet_block = checkCollisionDir(facing_direction, check_direction, obj_Magnet, offset, -4);
            side_door = checkCollisionDir(facing_direction, check_direction, obj_SideDoor, offset + sprite_width/2, -4);
            break;
        case WAY.LEFT:
            floor_block = checkCollisionDir(facing_direction, check_direction, obj_Floor, -offset, -4);
            magnet_block = checkCollisionDir(facing_direction, check_direction, obj_Magnet, -offset, -4);
            side_door = checkCollisionDir(facing_direction, check_direction, obj_SideDoor, -offset - sprite_width/2, -4);
            break;
        case WAY.ABOVE:
            floor_block = checkCollisionDir(facing_direction, check_direction, obj_Floor, -4, -offset);
            magnet_block = checkCollisionDir(facing_direction, check_direction, obj_Magnet, -4, -offset);
            side_door = checkCollisionDir(facing_direction, check_direction, obj_SideDoor, -4, -offset - sprite_width);
            break;
        case WAY.BELOW:
            floor_block = checkCollisionDir(facing_direction, check_direction, obj_Floor, -4, offset);
            magnet_block = checkCollisionDir(facing_direction, check_direction, obj_Magnet, -4, offset);
            side_door = checkCollisionDir(facing_direction, check_direction, obj_SideDoor, -4, offset + sprite_width);
            break;
    }
    //place the laser in correct location if blocked by a side door
    if not(side_door == noone) {
        if (side_door.is_on and (check_direction == WAY.LEFT or check_direction == WAY.RIGHT)) {
            side_door = noone;
        } else {
            if (check_direction == WAY.RIGHT) {
                offset -= (sprite_width/2 + 4);
            } else if (check_direction  == WAY.LEFT) {
                offset -= (sprite_width/2 + 3);
            }
        }
    }
    
    //there is no if side_door == noone here because we need to know
    //where the side door is before placing the laser
    if (floor_block == noone && magnet_block == noone) {
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
        inst.parent = false;
        changed = true;
        with (inst) {
            setLaserDirection(other.check_direction);
        }
    }
}

if (changed) {
    inst.image_index = 3;
}

#define setLaserDirection
// setLaserDirection(WAY)
//this script currently only works if called once (in the instance creation code)
//(It cannot be used to currently to rotate a laser after creation)
//This script also assumes that the image_index of the laser is final

check_direction = argument0;
switch (argument0) {
    case (WAY.ABOVE):
        image_angle = 90;
        if (image_index == 1 or image_index == 0) {
            y+= sprite_height;
        }
        break;
    case (WAY.BELOW):
        image_angle = 270;
        if (image_index == 1 or image_index == 0) {
            x+= sprite_width;
        }
        break;
    case (WAY.LEFT):
        image_angle = 180;
        if (image_index == 1 or image_index == 0) {
            x+= sprite_width;
            y+= sprite_height;
        }
        break;        
}