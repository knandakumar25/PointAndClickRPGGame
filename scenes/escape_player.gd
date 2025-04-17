extends CharacterBody2D

@export var speed := 200.0

func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1

	# Move the character
	velocity = direction.normalized() * speed
	move_and_slide()

	# Handle animation
	var is_moving = direction != Vector2.ZERO
	if is_moving:
		$AnimatedSprite2D.play("Walk")

		# Flip sprite based on horizontal movement
		if direction.x != 0:
			$AnimatedSprite2D.flip_h = direction.x < 0
	else:
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.frame = 1  # idle frame (assumes middle frame is best for standing)
