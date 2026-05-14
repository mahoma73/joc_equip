extends CharacterBody2D

const velocitat = 100.0
var direccio = -1
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	velocity.x = direccio * velocitat

	move_and_slide()

	if is_on_wall():
		direccio *= -1
func anima(velocitat):
	if velocitat > 0:
		animated_sprite_2d.play("volar")
		animated_sprite_2d.flip_h = false
	elif velocitat < 0:
		animated_sprite_2d.play("volar")
		animated_sprite_2d.flip_h = true
func _on_area_entered(area: Area2D) -> void:
	area.resta_vida()

func _on_mort_champi_body_entered(body: Node2D) -> void:
	queue_free()


func _on_mort_jugador_body_entered(body: Node2D) -> void:
	if body.name == "Jugador":
		body.mor()
