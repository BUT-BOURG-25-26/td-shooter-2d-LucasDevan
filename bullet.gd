extends Area2D

var isFromPlayer : bool = false

func _physics_process(delta: float) -> void:
	if(isFromPlayer):
		global_position.y=global_position.y-delta
	else:
		global_position.y=global_position.y+delta
