// Serves as a globally accessable set of enumerations

// which way the player's head is pointing
enum DIR {
    NORTH,
    SOUTH,
    EAST,
    WEST
}

// where a hitbox should be checked relative to the player
// eg. LEFT when the player is on the ceiling (SOUTH) checks in the +x direction
enum WAY {
    LEFT,
    RIGHT,
    ABOVE,
    BELOW,
    SELF
}
