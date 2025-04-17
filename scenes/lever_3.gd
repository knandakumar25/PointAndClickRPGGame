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
