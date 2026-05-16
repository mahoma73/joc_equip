extends CanvasLayer

const CORS = [
	preload("res://Escenes/cors/buit_buit_buit.tscn"),
	preload("res://Escenes/cors/ple_buit_buit.tscn"),
	preload("res://Escenes/cors/ple_ple_buit.tscn"),
	preload("res://Escenes/cors/ple_ple_ple.tscn"),
]

var cors_instancia = null

func _ready() -> void:
	add_to_group("hud")
	actualitzar_vides(3)

func actualitzar_vides(vides: int) -> void:
	if cors_instancia:
		cors_instancia.queue_free()
	cors_instancia = CORS[vides].instantiate()
	add_child(cors_instancia)
	cors_instancia.position = Vector2(900, 20)
