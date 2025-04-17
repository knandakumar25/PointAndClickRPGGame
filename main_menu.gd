extends Node

func _ready():
	$Next.connect("pressed", Callable(self, "_on_NextButton_pressed"))
	$Difficulty.connect("pressed", Callable(self, "_on_Difficulty_pressed"))

func _on_NextButton_pressed():
	get_tree().change_scene_to_file("res://transition_scene_1.tscn")
	
func _on_Difficulty_pressed():
	get_tree().change_scene_to_file("res://difficulty.tscn")
