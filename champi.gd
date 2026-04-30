extends CharacterBody2D

const SPEED = 100.0
var direction = -1  # 1 es dreta, -1 es esquerra

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	velocity.x = direction * SPEED

	move_and_slide()

	if is_on_wall():
		direction *= -1
