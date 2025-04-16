extends Path2D

@onready var crew = $PathFollow2D/Crew
@onready var player = $PathFollow2D/Player
@export var spawn_interval := 5
var spawn_timer := 0.0
var speed := 75.0 

func _ready():
	if crew is Area2D:
		crew.monitoring = true
		crew.monitorable = true

func _process(delta):
	spawn_timer += delta
	if spawn_timer >= spawn_interval:
		spawn_timer = 0.0
		spawn_enemy()

func spawn_enemy():
	var directions = ["up", "down", "left", "right"]
	var dir = directions.pick_random()
	var distance := 700
	var spawn_pos: Vector2 = crew.global_position

	match dir:
		"up": spawn_pos += Vector2(0, -distance)
		"down": spawn_pos += Vector2(0, distance)
		"left": spawn_pos += Vector2(-distance, 0)
		"right": spawn_pos += Vector2(distance, 0)

	var enemy = create_enemy(crew, spawn_pos)
	enemy.connect("area_entered", Callable(self, "_on_enemy_area_entered").bind(enemy))
	add_child(enemy)

func create_enemy(crew_node: Node2D, spawn_position: Vector2) -> Area2D:
	var enemy = Area2D.new()
	enemy.add_to_group("Enemy")
	enemy.name = "Enemy"
	enemy.global_position = spawn_position

	enemy.collision_layer = 1
	enemy.collision_mask = 1

	var sprite = Sprite2D.new()
	sprite.texture = preload("res://PlayerPlaceholder.png")
	sprite.scale = Vector2(0.1, 0.1)
	enemy.add_child(sprite)

	var collision = CollisionShape2D.new()
	var shape = CircleShape2D.new()
	shape.radius = 8
	collision.shape = shape
	enemy.add_child(collision)

	var enemy_script := GDScript.new()
	enemy_script.source_code = """
extends Area2D

var crew_node: Node2D
var speed := 100.0
var health := 3

func _process(delta):
	if is_instance_valid(crew_node):
		var direction = (crew_node.global_position - global_position).normalized()
		global_position += direction * speed * delta
func take_damage(amount: int):
	health -= amount
	if health <= 0:
		queue_free()
"""
	enemy_script.reload()
	enemy.set_script(enemy_script)
	enemy.set("crew_node", crew_node)

	return enemy

func _on_enemy_area_entered(area: Area2D, enemy: Node) -> void:
	if area == crew:
		if crew.has_method("take_damage"):
			crew.call("take_damage", 1)
		enemy.queue_free()
