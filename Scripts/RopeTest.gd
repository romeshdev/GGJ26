extends Node2D

@onready var path_follow: PathFollow2D = $Path2D/PathFollow2D
@onready var line_2d = $Line2D # The Line2D node
@onready var path_2d = $Path2D

@export var drag_subject: PathFollow2D
var is_dragging = false
var offset = Vector2.ZERO

func _process(delta):
	if is_dragging:
		$Draggable.global_position = get_global_mouse_position() + offset

func _on_draggable_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			is_dragging = true
			offset = $Draggable.global_position - get_global_mouse_position()
		else:
			is_dragging = false
