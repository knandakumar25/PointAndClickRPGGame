extends Node2D

@onready var path_follow = $Path2D/PathFollow2D
@onready var path = $Path2D.curve 

func _process(delta):
	if path_follow.progress >= path.get_baked_length():
		get_tree().change_scene_to_file("res://scenes/transition_scene_2.1.tscn")
