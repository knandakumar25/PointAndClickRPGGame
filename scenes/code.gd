extends Area2D

@export var correct_code: String = "1234"  # The code the player must enter
@export var door_closed_texture: Texture2D
@export var door_open_texture: Texture2D
@onready var door_sprite: Sprite2D = $Door/Sprite2D
@onready var code_input_area: LineEdit = $LineEdit  # LineEdit for code entry
@onready var feedback_label: Label = $FeedbackLabel  # Label for feedback
@onready var spike_timer: Timer = $"../SpikeTimer"
@onready var timer_label: Label = $"../CanvasLayer/TimerLabel"
@onready var spikes: Node = $"../Spikes"  # adjust this path if needed
@export var spike_landing_y: float = 1000.0  # Where spikes should land

var is_code_correct = false

func _ready() -> void:
	feedback_label.text = ""  # Clear feedback at the start
	code_input_area.connect("text_submitted", Callable(self, "_on_code_entered"))  # Connect the signal

# Signal handler for when the player presses Enter
func _on_code_entered(code: String) -> void:
	check_code_input(code)

func check_code_input(entered_code: String) -> void:
	if entered_code == correct_code:
		is_code_correct = true
		update_door_sprite()
		give_feedback("Correct code! Proceeding...")
		open_next_room()
	else:
		give_feedback("Incorrect code! Try again.")
		code_input_area.clear()  # Optional: Clear input field on incorrect code

func update_door_sprite() -> void:
	if is_code_correct:
		spike_timer.stop()
		door_sprite.texture = door_open_texture
	else:
		door_sprite.texture = door_closed_texture

func give_feedback(message: String) -> void:
	feedback_label.text = message
	await get_tree().create_timer(2.0).timeout
	feedback_label.text = ""

func open_next_room():
	if (get_tree().current_scene.name == "Level 1"):
		await get_tree().create_timer(5).timeout  # Small delay for effect
		get_tree().change_scene_to_file("res://scenes/EscapeRoomLevel2.tscn")
	elif (get_tree().current_scene.name == "Level 2"):
		await get_tree().create_timer(5).timeout  # Small delay for effect
		get_tree().change_scene_to_file("res://scenes/EscapeRoomLevel3.tscn")
	else:
		await get_tree().create_timer(5).timeout  # Small delay for effect
		get_tree().change_scene_to_file("res://scenes/transition_scene_2.1.tscn")

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
