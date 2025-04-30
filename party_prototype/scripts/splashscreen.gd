extends Node2D

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/story.tscn")

func _on_controls_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/controls.tscn")
