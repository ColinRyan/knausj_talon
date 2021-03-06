# TODO:
# - need a generic for any clicking zoom overlay to trigger the click

settings():
    #stop continuous scroll/gaze scroll with a pop
    user.mouse_enable_pop_stops_scroll = 0
    #enable pop click with 'control mouse' mode
    user.mouse_enable_pop_click = 1
    #hide cursor when mouse_wake is called to enable zoom mouse
    user.mouse_wake_hides_cursor = 1
    user.mouse_enable_zoom_auto_click = 0
    user.mouse_zoom_auto_click_timeout = 1.2
    # eye detection suspend settings
    user.mouse_sleep_tracker_timeout_frames = 200
    user.mouse_sleep_tracker_suspend_screen = 1
    user.mouse_sleep_tracker_enter_sleep_mode = 1

###
# Configuration
###
mouse sleep:
    user.mouse_sleep()
# sometimes the tobii stops tracking when awake, and triggering wake again won't fix it
mouse wake:
    user.mouse_sleep()
    user.mouse_wake()
control mouse: user.mouse_toggle_control_mouse()
camera overlay: eye_mouse.camera_overlay.toggle()
(mouse|run) calibration: user.mouse_calibrate()
[(enable|disable)] zoom mouse: user.mouse_toggle_zoom_mouse()
[(enable|disable)] auto click: user.mouse_toggle_zoom_auto_click()
[(enable|disable)] blink click: user.mouse_toggle_blink_click()
[(enable|disable)] sleep tracker: user.mouse_toggle_eye_mouse_sleep_tracker()

###
# General clicking and movement
###
# single click
(touch|chiff): user.mouse_click(0, 1)
# right click
(righty|rick): user.mouse_click(1, 1)
# middle click
midclick: user.mouse_click(2, 1)
# double click
dyke: user.mouse_click(0, 2)
# triple click
trike: user.mouse_click(0, 3)


#see keys.py for modifiers.
#defaults
#command
#control
#option = alt
#shift
#super = windows key

<user.modifiers> (touch|chiff):
    key("{modifiers}:down")
    user.mouse_click(0, 1)
    key("{modifiers}:up")
<user.modifiers> (righty|rick):
    key("{modifiers}:down")
    user.mouse_click(1, 1)
    key("{modifiers}:up")

# move to eye location without clicking
hover: user.mouse_move_cursor()

# zoom and then move to designated location without clicking

###
# Scrolling and dragging
###
wheel down: user.mouse_scroll_down()
wheel tiny [down]: mouse_scroll(20)
wheel downer: user.mouse_scroll_down_continuous()
wheel up: user.mouse_scroll_up()
wheel tiny up: mouse_scroll(-20)
wheel upper: user.mouse_scroll_up_continuous()
wheel gaze: user.mouse_gaze_scroll()
wheel stop: user.mouse_scroll_stop()
wheel left: mouse_scroll(0, -40)
wheel tiny left: mouse_scroll(0, -20)
wheel right: mouse_scroll(0, 40)
wheel tiny right: mouse_scroll(0, 20)
curse (show|yes): user.mouse_show_cursor()
curse (hide|no): user.mouse_hide_cursor()
drag: user.mouse_drag()

###
# Coordinate capturing
###
mouse trap: user.mouse_capture_coordinates()
log mouse clicks: user.mouse_log_clicks()

###
# Zoom features
###
# disables zoom without clicking in case it fails
cancel zoom: user.mouse_cancel_zoom_mouse()

# zoom single click - auto clicks if enabled
(kiff|eagle): user.mouse_zoom_single_click()

# zoom single click - auto click even if autoclick setting disabled
#kick: user.mouse_zoom_auto_single_click()

# relocate cursor to clicked location
#portal: user.mouse_zoom_move_cursor()

# auto relocate cursor to clicked location
auto portal: user.mouse_zoom_auto_move_cursor()

drift: user.mouse_zoom_drag()
