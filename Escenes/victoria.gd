extends Label
var a : bool = false
@onready var n = $"Jugador/n"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if a == true:
		if Input.is_action_just_pressed("Enter"):
			get_tree().change_scene_to_file("res://Escenes/Nivell_2.tscn")
			n.vides = 2
	return

func _on_clau_body_entered(body: Node2D) -> void:
	show()
	a = true
