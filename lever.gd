extends Area2D

@export var lever_on_texture: Texture2D
@export var lever_off_texture: Texture2D
@export var door_closed_texture: Texture2D
@export var door_open_texture: Texture2D
@onready var lever_sprite: Sprite2D = $Sprite2D
@onready var door_sprite: Sprite2D = $Door/Sprite2D

var is_on = false

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		toggle_lever()

func toggle_lever() -> void:
	is_on = !is_on
	update_sprite()
	
	if is_on:
		open_next_room()

func update_sprite() -> void:
	if is_on:
		lever_sprite.texture = lever_on_texture
		door_sprite.texture = door_open_texture
	else:
		lever_sprite.texture = lever_off_texture
		door_sprite.texture = door_closed_texture

func open_next_room():
	if (get_tree().current_scene.name == "Level 1"):
		await get_tree().create_timer(5).timeout  # Small delay for effect
		get_tree().change_scene_to_file("res://scenes/EscapeRoomLevel2.tscn")
	elif (get_tree().current_scene.name == "Level 2"):
		await get_tree().create_timer(5).timeout  # Small delay for effect
		get_tree().change_scene_to_file("res://scenes/EscapeRoomLevel3.tscn")


func _on_mouse_entered() -> void:
	$Control/Label.show()


func _on_mouse_exited() -> void:
	$Control/Label.hide()
