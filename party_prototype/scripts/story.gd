extends Node2D

func _on_party_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/party.tscn")
