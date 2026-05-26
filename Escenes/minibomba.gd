extends CharacterBody2D
var pot_fer_mal: bool = true
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	animated_sprite_2d.play("minibomba_animacio")

func _physics_process(delta: float) -> void:

	if not is_on_floor():
		velocity += get_gravity() * delta

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Jugador" and pot_fer_mal:
		pot_fer_mal = false
		var node_vida = body.get_node_or_null("vides" + str(body.vides))
		if node_vida:
			node_vida.restar_vida()
		body.restar_vida()
		await get_tree().create_timer(1.0).timeout
		pot_fer_mal = true
