class_name EnnemieType3
extends Ennemie

func _ready() -> void:
	super()
	sideMovementRange = 0
	speed = 100
	health = 3
	
func _physics_process(delta: float) -> void:
	super(delta)
	
