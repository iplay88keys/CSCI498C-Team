#define stdCollision
// stdCollision(player, way, obj)
switch(argument1) {
    case WAY.LEFT:
        stdCollisionLeft(argument0, argument2);
        break;
    case WAY.RIGHT:
        stdCollisionRight(argument0, argument2);
        break;
    case WAY.ABOVE:
        stdCollisionAbove(argument0, argument2);
        break;
}

#define stdCollisionLeft
// stdCollisionLeft(player, obj)
leftBlock = checkCollisionDir(argument0.currentDir, WAY.LEFT, argument1);
if (leftBlock != noone) {
    with(argument0) {
        // Move immidately to the right of the block
        hspeed = 0;
        switch(argument0.currentDir) {
            case DIR.NORTH:
                x = leftBlock.bbox_right + 1 + (sprite_width / 2);
                break;
            case DIR.EAST:
                y = leftBlock.bbox_bottom + 1 + (sprite_width / 2);
                break;
            case DIR.SOUTH:
                x = leftBlock.bbox_left - (sprite_width / 2);
                break;
            case DIR.WEST:
                y = leftBlock.bbox_top - (sprite_width / 2);
                break; 
        }
    }
}

#define stdCollisionRight
// stdCollisionRight(player, obj)
rightBlock = checkCollisionDir(argument0.currentDir, WAY.RIGHT, argument1);
if (rightBlock != noone) {
    with(argument0) {
        // Move immidately to the left of the block
        hspeed = 0;
        switch(argument0.currentDir) {
            case DIR.NORTH:
                x = rightBlock.bbox_left - (sprite_width / 2);
                break;
            case DIR.EAST:
                y = rightBlock.bbox_top - (sprite_width / 2);
                break;
            case DIR.SOUTH:
                x = rightBlock.bbox_right + 1 + (sprite_width / 2);
                break;
            case DIR.WEST:
                y = rightBlock.bbox_bottom + 1 + (sprite_width / 2);
                break;
        }
    }
}

#define stdCollisionAbove
// stdCollisionAbove(player, obj)
topBlock = checkCollisionDir(argument0.currentDir, WAY.ABOVE, argument1);
if (topBlock != noone) {
    with(argument0) {
        // only stop vertical upward movement
        if(vspeed < 0) {
            vspeed = 0;
            y = topBlock.bbox_bottom + 1 + (sprite_height / 2);
        }
    }
}
