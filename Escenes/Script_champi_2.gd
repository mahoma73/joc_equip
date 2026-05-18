extends CharacterBody2D

const SPEED = 100.0
var direccio = -1
var pot_fer_mal: bool = true
var pot_canviar_direccio: bool = true

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	velocity.x = direccio * SPEED
	
	if is_on_wall():
		direccio *= -1
		
	anima(velocity.x)
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var body = collision.get_collider()
		
		if body and body.name == "Jugador":
			if pot_canviar_direccio:
				pot_canviar_direccio = false
				direccio *= -1
				desenganxar_del_jugador()
				
			if body.playing and pot_fer_mal:
				pot_fer_mal = false
				body.restar_vida()
				await get_tree().create_timer(1.0).timeout
				pot_fer_mal = true

func desenganxar_del_jugador() -> void:
	await get_tree().create_timer(0.2).timeout
	pot_canviar_direccio = true

func anima(velocitat):
	if velocitat > 0:
		$AnimatedSprite2D.play("animacio_champi")
		$AnimatedSprite2D.flip_h = false
	elif velocitat < 0:
		$AnimatedSprite2D.play("animacio_champi")
		$AnimatedSprite2D.flip_h = true

func _on_mort_champi_body_entered(body: Node2D) -> void:
	if body.name == "Jugador":
		queue_free()
