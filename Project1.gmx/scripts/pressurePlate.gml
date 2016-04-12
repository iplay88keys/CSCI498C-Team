for (i = 0; i < ds_list_size(list_id); i++) {
    if (list_id[| i].is_on) {
        list_id[| i].is_on = false;
        with (list_id[| i]) {
            if (object_get_name(object_index) == "obj_Laser") {
                    remove_laser();
            }
        }
    } else {
        list_id[| i].is_on = true;
        with (list_id[| i]) {
            if (object_get_name(object_index) == "obj_Laser") {
                    create_laser();
            }
        }
    }
}
