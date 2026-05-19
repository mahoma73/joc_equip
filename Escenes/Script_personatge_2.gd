extends CharacterBody2D

const SPEED = 300
const JUMP_VELOCITY = -400.0
var vides: int = 3
var playing : bool = true
var n = 0

func _physics_process(delta: float) -> void:
	if playing == false:
		velocity.x = 0
		if Input.is_action_just_pressed("Enter"):
			get_tree().reload_current_scene()
		return
		
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
	if playing == false:
		return
		
	var nom_cor = "Vides_" + str(vides - 1)
	if has_node(nom_cor):
		get_node(nom_cor).queue_free()
	
	vides -= 1
	if vides <= 0:
		mor()

func mor() -> void:
	playing = false
	$GO.text = "GAME OVER, press ENTER to try again"

func _on_moneda_1_body_entered(body: Node2D) -> void:
	if body.name == "Jugador": 
		n = n + 1
		$Coins.text = "Monedes:" + str(n)
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	n = n + 1
	$Coins.text = "Monedes:" + str(n)

func _on_moneda_4_body_entered(body: Node2D) -> void:
	n = n + 1
	$Coins.text = "Monedes:" + str(n)
