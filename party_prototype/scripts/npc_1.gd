extends CharacterBody2D

@onready var chat_prompt: Label = %ChatOption
@onready var chat_bg: Sprite2D = %ChatOptionBg

func _ready():
	$AnimatedSprite2D.play("idle")
	set_chat_option_visibility(false);
	#
#func _process(delta: float) -> void:
	#if (Globals.is_chatting):
		#set_chat_option_visibility(false)

func _on_chat_detection_area_body_entered(body: Node2D) -> void:
	print(body.name + " enter")
	Globals.in_chat_zone = true
	Globals.npc_target = 1
	if (Globals.npc1_state <= 1):
		set_chat_option_visibility(true)

func _on_chat_detection_area_body_exited(body: Node2D) -> void:
	print(body.name + " exit")
	Globals.in_chat_zone = false
	Globals.npc_target = -1
	if (chat_prompt.visible):
		set_chat_option_visibility(false)

func set_chat_option_visibility(status: bool):
	chat_prompt.visible = status
	chat_bg.visible = status
