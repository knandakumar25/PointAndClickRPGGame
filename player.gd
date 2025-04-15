extends Sprite2D

@onready var parent = get_parent() as PathFollow2D
var bullet_speed := 400.0

func _process(delta: float) -> void:
	if parent is PathFollow2D:
		parent.set_progress(parent.get_progress() + 10 * delta)

	if Input.is_action_just_pressed("ui_accept"):
		get_tree().reload_current_scene()

	if Input.is_action_just_pressed("click"):
		shoot_bullet(get_global_mouse_position())

func shoot_bullet(target_position: Vector2):
	var bullet = Area2D.new()
	bullet.name = "Bullet"
	bullet.global_position = global_position

	bullet.monitoring = true
	bullet.monitorable = true
	bullet.collision_layer = 2
	bullet.collision_mask = 1

	var direction = (target_position - global_position).normalized()

	var bullet_script := GDScript.new()
	bullet_script.source_code = """
extends Area2D

var direction = Vector2.ZERO
var speed := 400.0

func _ready():
	connect("area_entered", Callable(self, "_on_area_entered"))

func _process(delta):
	position += direction * speed * delta

func _on_area_entered(area):
	if area.is_in_group("Enemy"):
		if area.has_method("take_damage"):
			print("hit enemy")
			area.call("take_damage", 1)
		queue_free()
"""
	bullet_script.reload()
	bullet.set_script(bullet_script)
	bullet.set("direction", direction)

	var sprite = Sprite2D.new()
	sprite.texture = preload("res://PlayerPlaceholder.png")
	sprite.scale = Vector2(0.05, 0.05)
	bullet.add_child(sprite)

	var collision = CollisionShape2D.new()
	var shape = CircleShape2D.new()
	shape.radius = 4
	collision.shape = shape
	bullet.add_child(collision)

	get_tree().current_scene.call_deferred("add_child", bullet)
