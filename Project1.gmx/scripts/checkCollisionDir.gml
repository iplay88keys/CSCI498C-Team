#define checkCollisionDir
// checkCollisionDir(DIR, WAY, object to check for)

// whether all these collisions are pixel-wise or bounding box
precise = false;

// constants for bbox offsets from the player
padFromBottom = 0;
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
switch(argument1) {
case WAY.LEFT:
    return checkCollisionDirLeft(argument0, argument1, argument2);
case WAY.RIGHT:
    return checkCollisionDirRight(argument0, argument1, argument2);
case WAY.ABOVE:
    return checkCollisionDirAbove(argument0, argument1, argument2);
case WAY.BELOW:
    return checkCollisionDirBelow(argument0, argument1, argument2);
case WAY.SELF:
    return checkCollisionDirSelf(argument0, argument1, argument2);
}

#define checkCollisionDirLeft
// checkCollisionDir(DIR, WAY, object to check for)

switch(argument0) {
case DIR.NORTH: // left
    return collision_rectangle(bbox_left - padSideFar, bbox_top, bbox_left - padSideNear, bbox_bottom, argument2, precise, true);
case DIR.SOUTH: // right
    return collision_rectangle(bbox_right + padSideNear, bbox_top, bbox_right + padSideFar, bbox_bottom, argument2, precise, true);
case DIR.EAST: // up
    return collision_rectangle(bbox_left, bbox_top - padSideFar, bbox_right, bbox_top - padSideNear, argument2, precise, true);
case DIR.WEST: // down
    return collision_rectangle(bbox_left, bbox_bottom + padSideNear, bbox_right, bbox_bottom + padSideFar, argument2, precise, true);
}

#define checkCollisionDirRight
// checkCollisionDir(DIR, WAY, object to check for)

switch(argument0) {
case DIR.NORTH: // right
    return collision_rectangle(bbox_right + padSideNear, bbox_top, bbox_right + padSideFar, bbox_bottom, argument2, precise, true);
case DIR.SOUTH: // left
    return collision_rectangle(bbox_left - padSideFar, bbox_top, bbox_left - padSideNear, bbox_bottom, argument2, precise, true);
case DIR.EAST: // down
    return collision_rectangle(bbox_left, bbox_bottom + padSideNear, bbox_right, bbox_bottom + padSideFar, argument2, precise, true);
case DIR.WEST: // up
    return collision_rectangle(bbox_left, bbox_top - padSideFar, bbox_right, bbox_top - padSideNear, argument2, precise, true);
}

#define checkCollisionDirAbove
// checkCollisionDir(DIR, WAY, object to check for)

switch(argument0) {
case DIR.NORTH: // up
    return collision_rectangle(bbox_left + padSideVert, bbox_top - padVertFar, bbox_right - padSideVert, bbox_top - padVertNear, argument2, precise, true);
case DIR.SOUTH: // down
    return collision_rectangle(bbox_left + padSideVert, bbox_bottom + padVertNear, bbox_right - padSideVert, bbox_bottom + padVertFar, argument2, precise, true);
case DIR.EAST: // right
    return collision_rectangle(bbox_right + padVertNear, bbox_top + padSideVert, bbox_right + padVertFar, bbox_bottom - padSideVert, argument2, precise, true);
case DIR.WEST: // left
    return collision_rectangle(bbox_left - padVertFar, bbox_top + padSideVert, bbox_left - padVertNear, bbox_bottom - padSideVert, argument2, precise, true);
}

#define checkCollisionDirBelow
// checkCollisionDir(DIR, WAY, object to check for)

switch(argument0) {
case DIR.NORTH: // down
    return collision_rectangle(bbox_left + padSideVert, bbox_bottom + padVertNear, bbox_right - padSideVert, bbox_bottom + padVertFar, argument2, precise, true);
case DIR.SOUTH: // up
    return collision_rectangle(bbox_left + padSideVert, bbox_top - padVertFar, bbox_right - padSideVert, bbox_top - padVertNear, argument2, precise, true);
case DIR.EAST: // left
    return collision_rectangle(bbox_left - padVertFar, bbox_top + padSideVert, bbox_left - padVertNear, bbox_bottom - padSideVert, argument2, precise, true);
case DIR.WEST: // right
    return collision_rectangle(bbox_right + padVertNear, bbox_top + padSideVert, bbox_right + padVertFar, bbox_bottom - padSideVert, argument2, precise, true);
}

#define checkCollisionDirSelf
// checkCollisionDir(DIR, WAY, object to check for)

switch(argument0) {
// vertical
case DIR.NORTH:
case DIR.SOUTH:
    return collision_rectangle(bbox_left + padSelf, bbox_top, bbox_right - padSelf, bbox_bottom, argument2, precise, true);
// horizontal
case DIR.EAST:
case DIR.WEST:
    return collision_rectangle(bbox_left, bbox_top + padSelf, bbox_right, bbox_bottom - padSelf, argument2, precise, true);
}
