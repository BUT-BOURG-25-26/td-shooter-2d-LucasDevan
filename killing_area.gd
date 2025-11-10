extends Area2D

func _on_area_entered(node:Node2D)->void:
	node.free()

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	body.free() # Replace with function body.


func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	area.free() # Replace with function body.
