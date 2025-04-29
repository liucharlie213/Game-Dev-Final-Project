extends CharacterBody2D

func _ready():
	$AnimatedSprite2D.play("idle")

func _on_chat_detection_area_body_entered(body: Node2D) -> void:
	print(body.name + " enter")
	Globals.in_chat_zone = true
	Globals.npc_target = 1
	pass # Replace with function body.


func _on_chat_detection_area_body_exited(body: Node2D) -> void:
	print(body.name + " exit")
	Globals.in_chat_zone = false
	Globals.npc_target = -1
	pass # Replace with function body.
