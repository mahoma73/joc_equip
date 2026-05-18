extends CharacterBody2D

var pot_fer_mal: bool = true
const VELOCITAT = 100.0
var direccio = -1

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	velocity.x = direccio * VELOCITAT
	move_and_slide()
	if is_on_wall():
		direccio *= -1
	anima(velocity.x)

func anima(vel: float) -> void:
	animated_sprite_2d.play("animacio_champi")
	animated_sprite_2d.flip_h = vel < 0

func _on_mort_champi_body_entered(body: Node2D) -> void:
	if body.name == "Jugador":
		queue_free()

func _on_mort_jugador_body_entered(body: Node2D) -> void:
	if body.name == "Jugador" and pot_fer_mal:
		pot_fer_mal = false
		var node_vida = body.get_node_or_null("vides" + str(body.vides))
		if node_vida:
			node_vida.restar_vida()
		body.restar_vida()
		await get_tree().create_timer(1.0).timeout
		pot_fer_mal = true
