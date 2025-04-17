extends Node

func _ready():
	$Next.connect("pressed", Callable(self, "_on_NextButton_pressed"))

func _on_NextButton_pressed():
	get_tree().change_scene_to_file("res://BeachScene1.tscn")
