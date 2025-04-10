extends Area2D

@export var lever_on_texture: Texture2D
@export var lever_off_texture: Texture2D
@export var door_closed_texture: Texture2D
@export var door_open_texture: Texture2D
@onready var lever_sprite: Sprite2D = $Sprite2D
@onready var door_sprite: Sprite2D = $Door/Sprite2D
@onready var spike_timer: Timer = $"../SpikeTimer"
@onready var timer_label: Label = $"../CanvasLayer/TimerLabel"
@onready var spikes: Node = $"../Spikes"  # adjust this path if needed
@export var spike_landing_y: float = 1000.0  # Where spikes should land

var is_on = false

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		toggle_lever()

func toggle_lever() -> void:
	is_on = !is_on
	update_sprite()
	
	if is_on:
		spike_timer.stop()
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
		get_tree().change_scene_to_file("res://scenes/transition_scene_2.2.tscn")
	elif (get_tree().current_scene.name == "Level 2"):
		await get_tree().create_timer(5).timeout  # Small delay for effect
		get_tree().change_scene_to_file("res://scenes/transition_scene_2.3.tscn")
	else:
		await get_tree().create_timer(5).timeout  # Small delay for effect
		get_tree().change_scene_to_file("res://scenes/transition_scene_2.4.tscn")


func _on_mouse_entered() -> void:
	$Control/Label.show()
	$Sprite2D.show()


func _on_mouse_exited() -> void:
	$Control/Label.hide()

func _process(delta: float) -> void:
	update_timer_display()

func update_timer_display():
	if timer_label:
		timer_label.text = "Time left: " + str(int(spike_timer.time_left)) + "s"

func _on_spike_timer_timeout() -> void:
	# Drop the spikes
	var tween = get_tree().create_tween()
	var target_position = spikes.position
	target_position.y = spike_landing_y
	tween.tween_property(spikes, "position", target_position, 1.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	
	await tween.finished
	$"../CanvasLayer/Label2".text = "You have died!"
	await get_tree().create_timer(2.0).timeout
	get_tree().reload_current_scene()


func _on_area_2d_mouse_entered() -> void:
	$"../Area2D".queue_free()
