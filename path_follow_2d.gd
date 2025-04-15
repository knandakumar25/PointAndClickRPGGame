extends PathFollow2D

@export var speed: float = 100.0
@export var distance: float = 60.0
@export var zone_size: Vector2 = Vector2(30, 30)
@export var offset: float = 50.0

signal clicked_direction(direction)

func _ready():
	set_process(true)

func _process(delta):
	offset += speed * delta
	update_click_areas()

func update_click_areas():
	var directions = {
		"up": Vector2(0, -distance),
		"down": Vector2(0, distance),
		"left": Vector2(-distance, 0),
		"right": Vector2(distance, 0),
	}

	for dir in directions.keys():
		var name = "click_" + dir
		var area: Area2D = get_node_or_null(name)
		if not area:
			area = Area2D.new()
			area.name = name
			area.input_pickable = true

			var shape = CollisionShape2D.new()
			var rect = RectangleShape2D.new()
			rect.size = zone_size
			shape.shape = rect
			area.add_child(shape)

			var color_rect = ColorRect.new()
			color_rect.size = zone_size
			color_rect.position = -zone_size / 2
			color_rect.color = Color(0.2, 0.7, 1.0, 0.4)
			color_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
			area.add_child(color_rect)

			add_child(area)
			area.connect("input_event", Callable(self, "_on_click_area_input").bind(dir))

		area.position = directions[dir]

func _on_click_area_input(viewport, event, shape_idx, dir):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			emit_signal("clicked_direction", dir)
			var move_amount = distance
			var player = $Player
			match dir:
				"up":
					player.position = Vector2(0, 0)
					player.position += Vector2(0, -move_amount)
				"down":
					player.position = Vector2(0, 0)
					player.position += Vector2(0, move_amount)
				"left":
					player.position = Vector2(0, 0)
					player.position += Vector2(-move_amount, 0)
				"right":
					player.position = Vector2(0, 0)
					player.position += Vector2(move_amount, 0)
