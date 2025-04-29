extends CharacterBody2D

func _physics_process(delta: float) -> void:
	var vel : Vector2 = get_global_mouse_position() - global_position
	velocity = vel
	move_and_slide()


func _on_duck_body_entered(body: Node2D) -> void:
	print('in duck')
	get_tree().change_scene_to_file("res://scenes/duck_caught.tscn") # Replace with function body.


func _on_scissors_body_entered(body: Node2D) -> void:
	print('in scissors')
	get_tree().change_scene_to_file("res://scenes/scissors_caught.tscn") # Replace with function body.
