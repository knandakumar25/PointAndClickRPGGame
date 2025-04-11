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
		$"../StaticBody2D3".queue_free()
		$"../BlackVeil".queue_free()

func give_feedback(message: String) -> void:
	feedback_label.text = message
	await get_tree().create_timer(2.0).timeout
	feedback_label.text = ""


func _on_mouse_entered() -> void:
	$Label.show()


func _on_mouse_exited() -> void:
	$Label.hide()
