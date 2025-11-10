class_name BulletEnnemie2
extends Bullet

func _ready() -> void:
	super()
	isFromPlayer = false
	
func _physics_process(delta: float) -> void:
	super(delta)
