extends Area2D

@onready var bullet_label: Label = $"../../../CanvasLayer/BulletLabel"
@onready var parent = get_parent() as PathFollow2D
var bullet_speed := 400.0
var bullets_left := 6
var max_bullets := 6
var is_reloading := false
var reload_popup: Label
var reload_timer: Timer

func _ready():
	# Create the popup label
	reload_popup = Label.new()
	reload_popup.text = ""
	reload_popup.visible = false
	reload_popup.set_position(Vector2(0, -50))
	add_child(reload_popup)

	# Timer for reload
	reload_timer = Timer.new()
	reload_timer.wait_time = 3.0
	reload_timer.one_shot = true
	reload_timer.connect("timeout", Callable(self, "_on_reload_complete"))
	add_child(reload_timer)
	
	update_bullet_label()

func _process(delta: float) -> void:
	if parent is PathFollow2D:
		parent.set_progress(parent.get_progress() + 1 * delta)

	if Input.is_action_just_pressed("ui_accept"):
		get_tree().reload_current_scene()

	var direction = get_current_click_area()
	if Input.is_action_just_pressed("click"):

		if bullets_left <= 0:
			start_reload()
			return

		if direction != "":
			var target = get_global_mouse_position()
			if can_shoot_toward(direction, target):
				shoot_bullet(target)
				bullets_left -= 1
				update_bullet_label()
				if bullets_left == 0:
					start_reload()

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
	var shape = RectangleShape2D.new()
	shape.size = Vector2(6, 6)
	collision.shape = shape
	bullet.add_child(collision)

	get_tree().current_scene.call_deferred("add_child", bullet)

func start_reload():
	if is_reloading:
		return
	is_reloading = true
	update_bullet_label()
	reload_timer.start()

func _on_reload_complete():
	is_reloading = false
	bullets_left = max_bullets
	update_bullet_label()

func get_current_click_area() -> String:
	var path_follow = get_parent() as PathFollow2D
	if not path_follow:
		return ""

	var directions = ["up", "down", "left", "right"]
	for dir in directions:
		var area_name = "click_" + dir
		var area = path_follow.get_node_or_null(area_name)
		if area and area is Area2D:
			if area.get_overlapping_areas().has(self):
				return dir
	return ""

func can_shoot_toward(direction: String, target_pos: Vector2) -> bool:
	var path_follow = get_parent() as PathFollow2D
	if not path_follow:
		return false

	var area_name = "click_" + direction
	var area = path_follow.get_node_or_null(area_name)
	if not area:
		return false

	var center = area.global_position

	match direction:
		"left":
			return target_pos.x < center.x
		"right":
			return target_pos.x > center.x
		"up":
			return target_pos.y < center.y
		"down":
			return target_pos.y > center.y

	return false

func update_bullet_label():
	if is_reloading:
		bullet_label.text = "Reloading..."
	else:
		bullet_label.text = "Bullets: %d / %d" % [bullets_left, max_bullets]
