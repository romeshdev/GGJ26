extends RigidBody2D

func _process(_delta):
	global_position = get_global_mouse_position()

	if Input.is_action_pressed("click"):
		$AnimatedSprite2D.play("Close_open")
		
		# $AnimatedSprite2D.play("Open_hold")
		if Input.is_action_just_released("click"):
			$AnimatedSprite2D.play("Close")
	else:
		$AnimatedSprite2D.stop()
		
		
func _physics_process(delta: float) -> void:
	var velocity : Vector2
	var speed_fac : float = 1.0
	var accel : float = 0.05
	var collision = move_and_collide(velocity * delta * speed_fac)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		speed_fac += speed_fac * accel
