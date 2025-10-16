var _browser_w = browser_width;
var _browser_h = browser_height;

if (_browser_w != global.browser_w || _browser_h != global.browser_h) {
    global.browser_w = _browser_w;
    global.browser_h = _browser_h;
    
    var _base_w = camera_get_view_width(view_camera[0]) > 0 ? camera_get_view_width(view_camera[0]) : room_width;
    var _base_h = camera_get_view_height(view_camera[0]) > 0 ? camera_get_view_height(view_camera[0]) : room_height;
    
    var _scale = 1;
    
    var _display_w = _base_w * _scale;
    var _display_h = _base_h * _scale;
    surface_resize(application_surface, _base_w, _base_h);
    view_wport[0] = _display_w;
    view_hport[0] = _display_h;
   
    camera_set_view_size(view_camera[0], _base_w, _base_h);
    
    window_set_size(_display_w, _display_h);
    window_center();
}