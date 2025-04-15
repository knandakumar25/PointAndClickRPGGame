extends Camera2D

@onready var player = $"../Path2D/PathFollow2D/Player"

@export var smoothing_speed: float = 5.0

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if player:
		global_position = global_position.lerp(player.global_position, smoothing_speed * delta)
