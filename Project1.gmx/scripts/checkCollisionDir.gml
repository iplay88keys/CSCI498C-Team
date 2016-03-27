#define checkCollisionDir
// checkCollisionDir(DIR, WAY, object to check for, optional:{leftRightOffset, upDownOffset})

// Handle optional arguments
if(argument_count == 5) {
    lrOffset = argument[3];
    udOffset = argument[4];
} else {
    lrOffset = 0;
    udOffset = 0;
}

// whether all these collisions are pixel-wise or bounding box
precise = false;

// constants for bbox offsets from the player

// how far from the top and bottom of the sprite to check for side collisions
padFromBottom = 5;
padFromTop = 5;

// defines how far to the side the box should check
padSideFar = 4;
padSideNear = 1;

// how far in from the sides of the sprite for vertical checks
padSideVert = 1;

// how far to above/below to check
padVertFar = 2;
padVertNear = 1;

// how far from the sides to look for 'self' collisions
// where two objects are occupying the same space on top of one another (not differing y coords)
padSelf = 12;

// deletate the actual work to one of the child scripts
switch(argument[1]) {
case WAY.LEFT:
    return checkCollisionDirLeft(argument[0], argument[2], lrOffset, udOffset);
case WAY.RIGHT:
    return checkCollisionDirRight(argument[0],argument[2], lrOffset, udOffset);
case WAY.ABOVE:
    return checkCollisionDirAbove(argument[0], argument[2], lrOffset, udOffset);
case WAY.BELOW:
    return checkCollisionDirBelow(argument[0], argument[2], lrOffset, udOffset);
case WAY.SELF:
    return checkCollisionDirSelf(argument[0], argument[2]);
}

#define checkCollisionDirLeft
// checkCollisionDir(DIR, object to check for, leftRightOffset, upDownOffset)

switch(argument0) {
case DIR.NORTH: // left
    return collision_rectangle(bbox_left - padSideFar + argument2,
                               bbox_top + padFromTop + argument3,
                               bbox_left - padSideNear + argument2,
                               bbox_bottom - padFromBottom + argument3,
                               argument1, precise, true);
case DIR.SOUTH: // right
    return collision_rectangle(bbox_right + padSideNear - argument2,
                               bbox_top + padFromBottom - argument3,
                               bbox_right + padSideFar - argument2,
                               bbox_bottom - padFromTop - argument3,
                               argument1, precise, true);
case DIR.EAST: // up
    return collision_rectangle(bbox_left + padFromBottom - argument3,
                               bbox_top - padSideFar + argument2,
                               bbox_right - padFromTop - argument3,
                               bbox_top - padSideNear + argument2,
                               argument1, precise, true);
case DIR.WEST: // down
    return collision_rectangle(bbox_left + padFromTop + argument3,
                               bbox_bottom + padSideNear - argument2,
                               bbox_right - padFromBottom + argument3,
                               bbox_bottom + padSideFar - argument2,
                               argument1, precise, true);
}

#define checkCollisionDirRight
// checkCollisionDir(DIR, object to check for, leftRightOffset, upDownOffset)

switch(argument0) {
case DIR.NORTH: // right
    return collision_rectangle(bbox_right + padSideNear + argument2,
                               bbox_top + padFromTop + argument3,
                               bbox_right + padSideFar + argument2,
                               bbox_bottom - padFromBottom + argument3,
                               argument1, precise, true);
case DIR.SOUTH: // left
    return collision_rectangle(bbox_left - padSideFar - argument2,
                               bbox_top + padFromBottom - argument3,
                               bbox_left - padSideNear - argument2,
                               bbox_bottom - padFromTop - argument3,
                               argument1, precise, true);
case DIR.EAST: // down
    return collision_rectangle(bbox_left + padFromBottom - argument3,
                               bbox_bottom + padSideNear + argument2,
                               bbox_right - padFromTop - argument3,
                               bbox_bottom + padSideFar + argument2,
                               argument1, precise, true);
case DIR.WEST: // up
    return collision_rectangle(bbox_left + padFromTop + argument3,
                               bbox_top - padSideFar - argument2,
                               bbox_right - padFromBottom + argument3,
                               bbox_top - padSideNear - argument2,
                               argument1, precise, true);
}

#define checkCollisionDirAbove
// checkCollisionDir(DIR, object to check for, leftRightOffset, upDownOffset)

switch(argument0) {
case DIR.NORTH: // up
    return collision_rectangle(bbox_left + padSideVert + argument2,
                               bbox_top - padVertFar + argument3,
                               bbox_right - padSideVert + argument2,
                               bbox_top - padVertNear + argument3,
                               argument1, precise, true);
case DIR.SOUTH: // down
    return collision_rectangle(bbox_left + padSideVert - argument2,
                               bbox_bottom + padVertNear - argument3,
                               bbox_right - padSideVert - argument2,
                               bbox_bottom + padVertFar - argument3,
                               argument1, precise, true);
case DIR.EAST: // right
    return collision_rectangle(bbox_right + padVertNear - argument3,
                               bbox_top + padSideVert + argument2,
                               bbox_right + padVertFar - argument3,
                               bbox_bottom - padSideVert + argument2,
                               argument1, precise, true);
case DIR.WEST: // left
    return collision_rectangle(bbox_left - padVertFar + argument3,
                               bbox_top + padSideVert - argument2,
                               bbox_left - padVertNear + argument3,
                               bbox_bottom - padSideVert - argument2,
                               argument1, precise, true);
}

#define checkCollisionDirBelow
// checkCollisionDir(DIR, object to check for, leftRightOffset, upDownOffset)
a = argument2;
b = argument3;

switch(argument0) {
case DIR.NORTH: // down
    return collision_rectangle(bbox_left + padSideVert + argument2,
                               bbox_bottom + padVertNear + argument3,
                               bbox_right - padSideVert + argument2,
                               bbox_bottom + padVertFar + argument3,
                               argument1, precise, true);
case DIR.SOUTH: // up
    return collision_rectangle(bbox_left + padSideVert - argument2,
                               bbox_top - padVertFar - argument3,
                               bbox_right - padSideVert - argument2,
                               bbox_top - padVertNear - argument3,
                               argument1, precise, true);
case DIR.EAST: // left
    return collision_rectangle(bbox_left - padVertFar - argument3,
                               bbox_top + padSideVert + argument2,
                               bbox_left - padVertNear - argument3,
                               bbox_bottom - padSideVert + argument2,
                               argument1, precise, true);
case DIR.WEST: // right
    return collision_rectangle(bbox_right + padVertNear + argument3,
                               bbox_top + padSideVert - argument2,
                               bbox_right + padVertFar + argument3,
                               bbox_bottom - padSideVert - argument2,
                               argument1, precise, true);
}

#define checkCollisionDirSelf
// checkCollisionDir(DIR, object to check for)
// Note that there are no offsets for self collisions, as they can be handled by the directional types

switch(argument0) {
// vertical
case DIR.NORTH:
case DIR.SOUTH:
    return collision_rectangle(bbox_left + padSelf,
                               bbox_top,
                               bbox_right - padSelf,
                               bbox_bottom,
                               argument1, precise, true);
// horizontal
case DIR.EAST:
case DIR.WEST:
    return collision_rectangle(bbox_left,
                               bbox_top + padSelf,
                               bbox_right,
                               bbox_bottom - padSelf,
                               argument1, precise, true);
}