extends CharacterBody2D


const GRAVITY = 5200.0
const JUMP_SPEED = -1800.0


func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta
	if is_on_floor():
		if Input.is_action_pressed("ui_accept"):
			velocity.y = JUMP_SPEED
		else:
			%AnimatedSprite2D.play("run")
	else:
		%AnimatedSprite2D.play("jump")
			

	move_and_slide()
	
