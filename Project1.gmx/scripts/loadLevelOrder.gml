#define loadLevelOrder
global.levels = ds_list_create();
global.levelDoors = ds_list_create();

addLevel(rm_Start, inst_5B03032E); //this needs to be here because it is level 0
addLevel(rm_Level1_1, inst_B894C4BB);
addLevel(rm_Level1_2, inst_DEA3E53B);
addLevel(rm_Level_Jump_Tower, inst_05E1338B);
addLevel(rm_LevelNP_1, inst_A76659AF);
addLevel(rm_Test, inst_16B2379D);

#define addLevel
//addLevel(room, door_id)
ds_list_add(global.levels, argument0);
ds_list_add(global.levelDoors, argument1);

#define advanceLevel
level += 1;
var levelsListId = global.levels;
var levelDoorsListId = global.levelDoors;
door_id = levelDoorsListId[| level];
room_goto(levelsListId[| level]);
