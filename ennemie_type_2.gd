class_name EnnemieType2
extends Ennemie

func _ready() -> void:
	super()
	sideMovementRange = 6
	sideMovementSpeed = 400
	
func _physics_process(delta: float) -> void:
	super(delta)
	
func _on_timer_timeout() -> void:
	shoot()
