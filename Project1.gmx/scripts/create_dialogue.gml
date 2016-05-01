#define create_dialogue
///create_dialog(tag)
global.tag = argument0;
disable_controls();
instance_create(0, 0, obj_text);

#define create_dialogue_obj
///create_dialogue(tag)

var width = 576
var height = 192

x = 0;//128;
y = 0;//352;

//Create a dialogue box to attach to.
var boxX = window_get_width()/2 - width/2;
var boxY = window_get_height()/2 + 2*height/3;
var boxInst = scr_juju_dialogue(boxX, boxY, argument0, "default_category");

//Sirona
with(scr_juju_portrait( boxInst, boxX/2 + 11, boxY/2 + 16, spr_Sirona_Head, 0, 0, 1, "L")) {
    scr_juju_animate(id, 0.04, x, y, 0, x, y, 1, scr_juju_ease_cubic_in);
}

//Terisa
with(scr_juju_portrait( boxInst, boxX/2 + 226, boxY/2 + 16, spr_Terisa_Head, 0, 0, 1, "R")) {
    scr_juju_animate(id, 0.04, x, y, 0, x, y, 1, scr_juju_ease_cubic_in);
}
