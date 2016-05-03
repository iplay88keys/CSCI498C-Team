#define gameWindowSize
// reposition so the resize is from the center
window_set_position(display_get_width()/2 - (1024-192) / 2,
                    display_get_height()/2 - (768-96)/ 2);
                    
// new aspect ratio
surface_resize(application_surface, 1024, 768);

// actual size change
window_set_size(1024-192, 768-96);


#define menuWindowSize
// reposition so the resize is from the center
/*window_set_position(window_get_x() - (768 - window_get_width()) / 2,
                    window_get_y() - (384 - window_get_height()) / 2);*/
window_set_position(display_get_width()/2 - (768) / 2,
                    display_get_height()/2 - (384)/ 2);

// new aspect ratio
surface_resize(application_surface, 768, 384);

// actual size change
window_set_size(768, 384);
