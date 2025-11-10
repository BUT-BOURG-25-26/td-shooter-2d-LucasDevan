extends Control

func _on_stop_pressed() -> void:
	print("stop")
	get_tree().quit()
	pass # Replace with function body.

func _on_start_pressed() -> void:
	get_tree().reload_current_scene()
	pass # Replace with function body.
