extends Node
# Load the custom cursor image
var base_cursor: Texture2D = preload("res://Content/Art/SpriteSheets/claw_01/cursor.png")
var clicked_cursor: Texture2D = preload("res://Content/Art/SpriteSheets/claw_01/cursor_clicked.png")
var hotspot = Vector2(16, 16) # Example hotspot

func _ready():
	Input.set_custom_mouse_cursor(base_cursor, Input.CURSOR_ARROW, hotspot)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				Input.set_custom_mouse_cursor(clicked_cursor, Input.CURSOR_ARROW, hotspot)
			else:
				Input.set_custom_mouse_cursor(base_cursor, Input.CURSOR_ARROW, hotspot)
# Function to change the cursor
# func change_cursor():
#     Input.set_custom_mouse_cursor(custom_cursor, Input.CURSOR_ARROW, hotspot)

# # Function to revert to the system default cursor
# func revert_cursor():
#     Input.set_custom_mouse_cursor(null) # Passing null reverts to the default system cursor
