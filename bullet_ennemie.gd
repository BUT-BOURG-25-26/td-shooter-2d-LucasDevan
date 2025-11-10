class_name BulletEnnemie
extends "res://bullet.gd"

func _ready() -> void:
	super()
	isFromPlayer = false
	
func _physics_process(delta: float) -> void:
	super(delta)
