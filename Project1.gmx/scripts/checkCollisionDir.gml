#define checkCollisionDir
// checkCollisionDir(DIR, WAY, object to check for)

// constants for bbox offsets from the player
padFromBottom = 0;
// defines how far to the side the box should check
padSideFar = 4;
padSideNear = 1;

precise = false;


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
}

#define checkCollisionDirLeft
// checkCollisionDir(DIR, WAY, object to check for)

switch(argument0) {
case DIR.NORTH:
    return collision_rectangle(bbox_left - padSideFar, bbox_top, bbox_left - padSideNear, bbox_bottom, argument2, precise, true);
case DIR.SOUTH:
case DIR.EAST:
case DIR.WEST:
}

#define checkCollisionDirRight
// checkCollisionDir(DIR, WAY, object to check for)

#define checkCollisionDirAbove
// checkCollisionDir(DIR, WAY, object to check for)

#define checkCollisionDirBelow
// checkCollisionDir(DIR, WAY, object to check for)
