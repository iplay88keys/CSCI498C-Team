for (i = 0; i < ds_list_size(list_id); i++) {
    if (list_id[| i].is_on) {
        list_id[| i].is_on = false;
        with (list_id[| i]) {
            if (object_get_name(object_index) == "obj_Laser") {
                remove_laser();
            } else if (object_get_name(object_index) == "obj_SideDoor" or object_get_name(object_index) == "obj_Door") {
                audio_play_sound_at(snd_Door_Close, x, y, 0, global.falloff_ref, global.falloff_max, global.falloff_factor, false, 1);
            }
        }
    } else {
        list_id[| i].is_on = true;
        with (list_id[| i]) {
            if (object_get_name(object_index) == "obj_Laser") {
                create_laser();
            }  else if (object_get_name(object_index) == "obj_SideDoor" or object_get_name(object_index) == "obj_Door") {
                audio_play_sound_at(snd_Door_Open, x, y, 0, global.falloff_ref, global.falloff_max, global.falloff_factor, false, 1);
            }
        }
    }
    
    //update the status of lasers if a side door was toggled
    with (list_id[| i]) {
        if (object_get_name(object_index) == "obj_SideDoor") {
            var j;
            for (j = 0; j < instance_number(obj_Laser); j+= 1) {
                with (instance_find(obj_Laser, j)) {
                    if (is_on and parent == true) {
                        remove_laser();
                        create_laser();
                    }
                }
            }
        }
    }
}
