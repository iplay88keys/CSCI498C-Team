#define create_dialogue
//create_dialog(tag)
global.tag = argument0;
disable_controls();
instance_create(0, 0, obj_text);

#define create_dialogue_obj
//create_dialogue(tag)

var width = 576
var height = 192

x = 128;
y = 352;

//Create a dialogue box to attach to.
var boxInst = scr_juju_dialogue(window_get_width()/2 - width/2,window_get_height()/2 + 2*height/3, argument0, "default_category");

//Sirona
with(scr_juju_portrait( boxInst, x - 5, y - 90, spr_Sorona_Neutral_Right, 0, 0, 1, "L")) {
    scr_juju_animate(id, 0.04, x, y, 0, x, y, 1, scr_juju_ease_cubic_in);
}

//Terisa
with(scr_juju_portrait( boxInst, x + 210, y - 90, spr_Terisa_Head_Neutral_Left, 0, 0, 1, "R")) {
    scr_juju_animate(id, 0.04, x, y, 0, x, y, 1, scr_juju_ease_cubic_in);
}