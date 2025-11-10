extends Node2D

var player : Player
var menue : Control
var label : Label
var lifeBar : ItemList

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	menue = $Menue
	label=$CanvasLayer/Label
	lifeBar=$CanvasLayer/ItemList
	menue.hide()
	Engine.time_scale=1
	
func _process(delta: float) -> void:
	if(player.currentHealth<=0):
		menue.show()
		label.hide()
		lifeBar.hide()
		Engine.time_scale=0
