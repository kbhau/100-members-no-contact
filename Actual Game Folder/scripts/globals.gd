extends Node

# I know this is a dirty way to manage states, but this might be the fastest
# and easiest to understand

var MENU_SCREN_PATH = "/root/World/Menu"
var GAMEPLAY_SCREEN_PATH = "/root/World/Gameplay"

var SCREENS = [
	MENU_SCREN_PATH,
	GAMEPLAY_SCREEN_PATH
]

func _hide_all_screens():
	SCREENS.map(func(s):
		# Reference for 'process_mode'
		# Link: https://forum.godotengine.org/t/how-to-disable-enable-a-node/22387/6
		get_node(s).process_mode = 4 # Disabled
		get_node(s).hide()
	)

func _show_screen(screen_path: String):
	get_node(screen_path).process_mode = 0 # Inherit
	get_node(screen_path).show()

# Whenever we want to change the screen, menu to gameplay or whatever
# We'll use this, but issue with this is, this will not have any animation
# If someone wants to, they can maybe hack around this, or better state machine
# for changing screens
func change_screen(screen_path: String):
	_hide_all_screens()
	_show_screen(screen_path)
