extends Node2D

var player : Player

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	
func _process(delta: float) -> void:
	if(player.currentHealth<=0):
		get_tree().reload_current_scene()
	Engine.time_scale=1.0
