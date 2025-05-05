extends Area2D



func _on_body_entered(body: Node2D) -> void:
	%CaughtTimer.stop()
	get_tree().change_scene_to_file("res://scenes/endlessRunner.tscn")
