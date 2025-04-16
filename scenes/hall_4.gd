extends Node2D


func _on_area_2d_mouse_entered() -> void:
	$Area2D.hide()
	$Hint.show()


func _on_area_2d_2_mouse_entered() -> void:
	$Area2D2.hide()
	$Hint.show()
	$Hint.hide()
	$Hint.position = Vector2(250, 575)
	$Hint.show()
