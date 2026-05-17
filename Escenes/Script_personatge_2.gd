extends CharacterBody2D
const SPEED = 300
const JUMP_VELOCITY = -400.0
var vides: int = 2

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func restar_vida() -> void:
	vides -= 1
	if vides < 0:
		mor()

func mor() -> void:
	queue_free()
