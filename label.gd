extends Label

var gameManager : GameManager

func _ready() -> void:
	gameManager=$"../../GameManager"

func _process(delta: float) -> void:
	text = str(gameManager.score * 1000)
