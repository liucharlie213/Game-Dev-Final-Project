extends CharacterBody2D

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _process(delta: float) -> void:
	var target = get_global_mouse_position()
	global_position = global_position.lerp(target, 0.2)
	var clamped_position = target.clamp(Vector2.ZERO, get_viewport_rect().size)
	global_position = clamped_position
	

func _on_duck_body_entered(body: Node2D) -> void:
	print('in duck')
	get_tree().change_scene_to_file("res://scenes/duck_caught.tscn") # Replace with function body.


func _on_scissors_body_entered(body: Node2D) -> void:
	print('in scissors')
	get_tree().change_scene_to_file("res://scenes/scissors_caught.tscn") # Replace with function body.
