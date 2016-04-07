#define stdCollisionDoor
// stdCollision(player, way, obj)
switch(argument1) {
    case WAY.LEFT:
        stdCollisionLeftDoor(argument0, argument2);
        break;
    case WAY.RIGHT:
        stdCollisionRightDoor(argument0, argument2);
        break;
}

#define stdCollisionLeftDoor
// stdCollisionLeft(player, obj)
leftDoor = checkCollisionDir(argument0.currentDir, WAY.LEFT, argument1);
if (leftDoor != noone && !leftDoor.is_on) {
    with(argument0) {
        // Move immidately to the right of the block
        hspeed = 0;
        switch(argument0.currentDir) {
            case DIR.NORTH:
                x = leftDoor.bbox_right + 1 + (sprite_width / 2);
                break;
            case DIR.EAST:
                y = leftDoor.bbox_bottom + 1 + (sprite_width / 2);
                break;
            case DIR.SOUTH:
                x = leftDoor.bbox_left - (sprite_width / 2);
                break;
            case DIR.WEST:
                y = leftDoor.bbox_top - (sprite_width / 2);
                break; 
        }
    }
}

#define stdCollisionRightDoor
// stdCollisionRight(player, obj)
rightDoor = checkCollisionDir(argument0.currentDir, WAY.RIGHT, argument1);
if (rightDoor != noone && !rightDoor.is_on) {
    with(argument0) {
        // Move immidately to the left of the block
        hspeed = 0;
        switch(argument0.currentDir) {
            case DIR.NORTH:
                x = rightDoor.bbox_left - (sprite_width / 2);
                break;
            case DIR.EAST:
                y = rightDoor.bbox_top - (sprite_width / 2);
                break;
            case DIR.SOUTH:
                x = rightDoor.bbox_right + 1 + (sprite_width / 2);
                break;
            case DIR.WEST:
                y = rightDoor.bbox_bottom + 1 + (sprite_width / 2);
                break;
        }
    }
}