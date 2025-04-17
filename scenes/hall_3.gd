extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "EscapePlayer":
		$Area2D.hide()


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.name == "EscapePlayer":
		$Area2D2.hide()


func _on_area_2d_3_body_entered(body: Node2D) -> void:
	if body.name == "EscapePlayer":
		open_next_room()

func open_next_room():
	if (get_tree().current_scene.name == "Hall1"):
		get_tree().change_scene_to_file("res://scenes/transition_scene_2.2.tscn")
	elif (get_tree().current_scene.name == "Hall2"):
		get_tree().change_scene_to_file("res://scenes/transition_scene_2.3.tscn")
	elif (get_tree().current_scene.name == "Hall3"):
		get_tree().change_scene_to_file("res://scenes/transition_scene_2.4.tscn")
