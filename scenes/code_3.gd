extends Area2D

@export var correct_code: String  # The code the player must enter
@onready var code_input_area: LineEdit = $LineEdit  # LineEdit for code entry
@onready var feedback_label: Label = $FeedbackLabel  # Label for feedback

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
		give_feedback("Correct code!")
	else:
		give_feedback("Incorrect code! Try again.")
		code_input_area.clear()  # Optional: Clear input field on incorrect code

func update_door_sprite() -> void:
	if is_code_correct:
		$"../StaticBody2D6".queue_free()
		$"../BlackVeil2".queue_free()
		$"../../Label2".show()
		open_next_room()


func open_next_room():
	if (get_tree().current_scene.name == "Hall1"):
		await get_tree().create_timer(5).timeout  # Small delay for effect
		get_tree().change_scene_to_file("res://scenes/hall_2.tscn")
	elif (get_tree().current_scene.name == "Hall2"):
		await get_tree().create_timer(5).timeout  # Small delay for effect
		get_tree().change_scene_to_file("res://scenes/EscapeRoomLevel2.tscn")
	elif (get_tree().current_scene.name == "Hall3"):
		await get_tree().create_timer(5).timeout  # Small delay for effect
		get_tree().change_scene_to_file("res://scenes/hall_4.tscn")
	elif (get_tree().current_scene.name == "Hall4"):
		await get_tree().create_timer(5).timeout  # Small delay for effect
		get_tree().change_scene_to_file("res://scenes/EscapeRoomLevel3.tscn")

func give_feedback(message: String) -> void:
	feedback_label.text = message
	await get_tree().create_timer(2.0).timeout
	feedback_label.text = ""


func _on_mouse_entered() -> void:
	$Label.show()


func _on_mouse_exited() -> void:
	$Label.hide()
