extends Area2D

@export var lever_on_texture: Texture2D
@export var lever_off_texture: Texture2D
@onready var lever_sprite: Sprite2D = $Sprite2D

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		update_sprite()

func update_sprite() -> void:
	lever_sprite.texture = lever_on_texture
	$"../StaticBody2D6".queue_free()
	$"../BlackVeil2".hide()
	$"../../Label2".show()
	open_next_room()


func open_next_room():
	if (get_tree().current_scene.name == "Hall1"):
		await get_tree().create_timer(5).timeout  # Small delay for effect
		get_tree().change_scene_to_file("res://scenes/hall_2.tscn")
	elif (get_tree().current_scene.name == "Hall2"):
		await get_tree().create_timer(5).timeout  # Small delay for effect
		get_tree().change_scene_to_file("res://scenes/hall_3.tscn")
	elif (get_tree().current_scene.name == "Hall3"):
		await get_tree().create_timer(5).timeout  # Small delay for effect
		get_tree().change_scene_to_file("res://scenes/transition_scene_2.4.tscn")
