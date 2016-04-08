#define enemyCollision
// enemyCollision(enemy, way, obj)

switch(argument1) {
    case WAY.LEFT:
        enemyCollisionLeft(argument0, argument2);
        break;
    case WAY.RIGHT:
        enemyCollisionRight(argument0, argument2)
}

#define enemyCollisionLeft
// enemyCollisionLeft(enemy, obj)
leftBlock = enemyCheckCollisionDir(argument0.currentDir, WAY.LEFT, argument1);
if (leftBlock != noone) {
    patrolDirection = WAY.RIGHT;
    with(argument0) {
        // Move immidately to the right of the block:
        //x = leftBlock.x + leftBlock.sprite_width + (sprite_width / 2);
        x = leftBlock.bbox_right + 1 + (sprite_width / 2);
    }
    deactivateLineOfSight();
}

#define enemyCollisionRight
// enemyCollisionRight(enemy, obj)
rightBlock = enemyCheckCollisionDir(argument0.currentDir, WAY.RIGHT, argument1);
if (rightBlock != noone) {
patrolDirection = WAY.LEFT;
    with(argument0) {
        // Move immidately to the left of the block
        //x = rightBlock.x - (sprite_width / 2);
        x = rightBlock.bbox_left - (sprite_width / 2);
    }
    deactivateLineOfSight();
}

#define enemyCheckCollisionDir
// enemyCheckCollisionDir(DIR, WAY, object to check for)

lrOffset = 0;
udOffset = 0;

// whether all these collisions are pixel-wise or bounding box
precise = false;

// constants for bbox offsets from the player
padFromTop = 0;
padFromBottom = 5;
// defines how far to the side the box should check
padSideFar = enemySpeed;
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

#define deactivateLineOfSight
if not(lineOfSightToPlayer) {
    if (lineOfSightActive) {
        lineOfSightActive = false;
        toActiveLineOfSightCounter = irandom(toActiveLineOfSightMaxSpace - toActiveLineOfSightMinSpace) + toActiveLineOfSightMinSpace;
    }
}

#define updateLineOfSightStatus
// updateLineOfSightStatus(distanceMoved)
toActiveLineOfSightCounter  -= argument0;
if (toActiveLineOfSightCounter <= 0) {
    lineOfSightActive = true;
}
distanceSinceLastPause += argument0;
if (distanceSinceLastPause >= minDistanceBeforeNextPause) {
    pauseActive = true;
}
#define enemyCollisionDoor
// stdCollision(player, way, obj)
switch(argument1) {
    case WAY.LEFT:
        enemyCollisionLeftDoor(argument0, argument2);
        break;
    case WAY.RIGHT:
        enemyCollisionRightDoor(argument0, argument2);
        break;
}

#define enemyCollisionLeftDoor
// stdCollisionLeft(player, obj)
leftDoor = enemyCheckCollisionDir(argument0.currentDir, WAY.LEFT, argument1);
if (leftDoor != noone && !leftDoor.is_on) {
    patrolDirection = WAY.RIGHT;
    with(argument0) {
        // Move immidately to the right of the block
        x = leftDoor.bbox_right + 1 + (sprite_width / 2);
    }
    deactivateLineOfSight();
}

#define enemyCollisionRightDoor
// stdCollisionRight(player, obj)
rightDoor = enemyCheckCollisionDir(argument0.currentDir, WAY.RIGHT, argument1);
if (rightDoor != noone && !rightDoor.is_on) {
    patrolDirection = WAY.LEFT;
    with(argument0) {
        // Move immidately to the left of the block
        hspeed = 0;
        x = rightDoor.bbox_left - (sprite_width / 2);
    }
    deactivateLineOfSight();
}
#define lineOfSightToPlayerFunction
if not(instance_exists(obj_Character)) {
    return false;
}
//offsets from the center of the charater
xLineOfSightOffset = 0;
yLineOfSightOffset = 0;
if (playerDirection == DIR.NORTH or playerDirection == DIR.SOUTH) { //account for rotated player
    yLineOfSightOffset = lineOfSightOffset;
} else {
    xLineOfSightOffset = lineOfSightOffset;
}
//There are two sight lines, one to head and one to feet.  Sight is blocked if both of these lines are blocked.
var lineOneBlocked = collision_line(x, y-16, cx + xLineOfSightOffset, cy + yLineOfSightOffset, obj_Floor, false, true) or collision_line(x, y-16, cx + xLineOfSightOffset, cy + yLineOfSightOffset, obj_Magnet, false, true);
var lineTwoBlocked = collision_line(x, y-16, cx - xLineOfSightOffset, cy - yLineOfSightOffset, obj_Floor, false, true) or collision_line(x, y-16, cx - xLineOfSightOffset, cy - yLineOfSightOffset, obj_Magnet, false, true);

var i;
for (i = 0; i < instance_number(obj_SideDoor); i += 1) { //check if sight blocked by closed side door
    var sideDoor = instance_find(obj_SideDoor, i);
    if not(sideDoor.is_on) { //if door is not open
        if collision_line(x, y-16, cx + xLineOfSightOffset, cy + yLineOfSightOffset, obj_SideDoor, false, true) {
            lineOneBlocked = true;
        }
        if collision_line(x, y-16, cx - xLineOfSightOffset, cy - yLineOfSightOffset, obj_SideDoor, false, true) {
            lineTwoBlocked = true;
        }
    }
}

return not(lineOneBlocked and lineTwoBlocked);