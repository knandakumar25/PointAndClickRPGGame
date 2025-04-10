extends Node


func _on_next_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/EscapeRoomLevel1.tscn")


func _on_next_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/EscapeRoomLevel2.tscn")


func _on_next_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/EscapeRoomLevel3.tscn")


func _on_next_4_pressed() -> void:
	get_tree().quit()
