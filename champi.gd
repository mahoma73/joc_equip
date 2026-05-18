extends CharacterBody2D
var pot_fer_mal: bool = true
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
		animated_sprite_2d.play("animacio_champi")
		animated_sprite_2d.flip_h = false
	elif velocitat < 0:
		animated_sprite_2d.play("animacio_champi")
		animated_sprite_2d.flip_h = true

func _on_mort_champi_body_entered(body: Node2D) -> void:
	if body.name == "Jugador":
		queue_free()

func _on_mort_jugador_body_entered(body: Node2D) -> void:
	if body.name == "Jugador" and pot_fer_mal:
		pot_fer_mal = false
		var vides_jugador = body.vides
		body.get_node_or_null("vides" + str(vides_jugador)).resta_vida()
		body.restar_vida()
		await get_tree().create_timer(1.0).timeout
		pot_fer_mal = true
