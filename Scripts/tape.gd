extends RigidBody2D

@export var speed_fac: float = 1.0
@export var accel: float = 0.05


func _ready():
	$AnimatedSprite2D.play()
	

func _physics_process(delta: float) -> void:
	var velocity : Vector2
	var collision = move_and_collide(velocity * delta * speed_fac)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		speed_fac += speed_fac * accel
	
