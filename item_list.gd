class_name LifePoint
extends ItemList

var player : Player
var lifePoints

func _ready() -> void:
	player = $"../../player"
	lifePoints = get_tree().get_nodes_in_group("lifePointTexture")
	
func _process(delta: float) -> void:
	if(player.currentHealth==2):
		lifePoints[2].hide()
	if(player.currentHealth==1):
		lifePoints[1].hide()
	if(player.currentHealth==0):
		lifePoints[0].hide()	
