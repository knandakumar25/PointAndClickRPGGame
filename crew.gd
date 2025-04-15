extends Area2D

@onready var parent = get_parent() as PathFollow2D
var health := 3

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if parent is PathFollow2D:
		parent.set_progress(parent.get_progress() + 50 * delta)
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().reload_current_scene()

func take_damage(amount: int):
	health -= amount
	if health <= 0:
		queue_free()
