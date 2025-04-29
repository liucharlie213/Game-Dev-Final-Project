extends CharacterBody2D

@onready var chat_prompt: Label = %ChatOption
@onready var chat_bg: Sprite2D = %ChatOptionBg

@onready var pp_prompt: Label = %PickpocketOption
@onready var pp_bg: Sprite2D = %PickpocketBg

func _ready():
	$AnimatedSprite2D.play("idle")
	set_chat_option_visibility(false);
	set_pp_option_visibility(false)
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
	if (Globals.can_pp_npc1):
		set_pp_option_visibility(true)
		body.can_pickpocket = self

func _on_chat_detection_area_body_exited(body: Node2D) -> void:
	print(body.name + " exit")
	Globals.in_chat_zone = false
	Globals.npc_target = -1
	if (chat_prompt.visible):
		set_chat_option_visibility(false)
	if (pp_prompt.visible):
		set_pp_option_visibility(false)

func set_chat_option_visibility(status: bool):
	chat_prompt.visible = status
	chat_bg.visible = status
		
func set_pp_option_visibility(status: bool):
	pp_prompt.visible = status
	pp_bg.visible = status
