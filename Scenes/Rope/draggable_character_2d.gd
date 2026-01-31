extends CharacterBody2D

@export var use_arrow_keys: bool = false
@export var speed: float = 300.0

@export var drag_subject: PathFollow2D
var is_dragging = false
var offset = Vector2.ZERO

func _ready() -> void:
	NativeRopeServer.on_pre_pre_update.connect(_update)

func _update():
	if is_dragging:
		global_position = get_global_mouse_position() + offset

func _on_draggable_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			is_dragging = true
			offset = global_position - get_global_mouse_position()
		else:
			is_dragging = false
