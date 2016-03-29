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
        x = leftBlock.x + leftBlock.sprite_width + (sprite_width / 2);
        break;
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
        x = rightBlock.x - (sprite_width / 2);
        break;
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
        toActiveLineOfSightCounter = toActiveLineOfSightSpace;
    }
}

#define updateLineOfSightStatus
// updateLineOfSightStatus(distanceMoved)
toActiveLineOfSightCounter  -= argument0;
if (toActiveLineOfSightCounter <= 0) {
    lineOfSightActive = true;
}