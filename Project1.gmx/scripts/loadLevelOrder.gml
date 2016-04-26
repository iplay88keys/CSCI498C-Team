#define loadLevelOrder
global.levels = ds_list_create();
global.levelDoors = ds_list_create();

addLevel(rm_Start, inst_5B03032E); //this needs to be here because it is level 0
addLevel(rm_Level_Jump_Tower, inst_05E1338B);
addLevel(rm_Get_Boots, inst_EDC288F2);
addLevel(rm_Level1_1, inst_B894C4BB);
addLevel(rm_Level1_2, inst_DEA3E53B);
addLevel(rm_LevelNP_1, inst_A76659AF);
addLevel(rm_LevelNP_2, inst_0EABE797);
addLevel(rm_End_Credits, "");

#define addLevel
//addLevel(room, door_id)
ds_list_add(global.levels, argument0);
ds_list_add(global.levelDoors, argument1);

#define advanceLevel
level += 1;
gotoLevel(level);

#define gotoLevel
//gotoLevel(levelNumber)
level = argument0;
var levelsListId = global.levels;
var levelDoorsListId = global.levelDoors;
door_id = levelDoorsListId[| level];
room_goto(levelsListId[| level]);

//save game
if (level > 0) {
    if (file_exists(global.saveFile)){
     file_delete(global.saveFile)
    }
    ini_open(global.saveFile);
    var savedLevel = base64_encode(string(level));
    var savedMagnetBoots = "false";
    if  (hasMagnetBoots)
    {
        savedMagnetBoots = "true";
    }
    savedMagnetBoots = base64_encode(savedMagnetBoots);
    ini_write_string("Save", "Level", savedLevel);
    ini_write_string("Save", "MagnetBoots", savedMagnetBoots);
    ini_close();
}
//TODO delete save file upon game completion
//(Also probably remove character object from the game on end credits or whatever we have)

#define loadSavedLevel
//will load and goto saved level if save file exists
if (global.loadSavedGame and file_exists(global.saveFile)) {
    ini_open(global.saveFile);
    var loadedLevel = ini_read_string("Save", "Level", "0");
    var loadedMagnetBoots = ini_read_string("Save", "MagnetBoots", "false");
    
    loadedLevel = real(base64_decode(loadedLevel));
    loadedMagnetBoots = base64_decode(loadedMagnetBoots);
    
    instance_create(0, 0, obj_Character);
    with(obj_Character) {
        gotoLevel(loadedLevel);
        if (loadedMagnetBoots == "true")
        {
            hasMagnetBoots = true;
        }
    }
}