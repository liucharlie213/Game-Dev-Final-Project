extends Node2D

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/splashscreen.tscn")


func _on_next_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/controls2.tscn")
