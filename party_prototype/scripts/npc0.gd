extends CharacterBody2D

@onready var chat_prompt: Label = %ChatOption
@onready var chat_bg: Sprite2D = %ChatOptionBg

@onready var pp_prompt: Label = %PickpocketOption
@onready var pp_bg: Sprite2D = %PickpocketBg


func _ready():
	$AnimatedSprite2D.play("idle")
	set_chat_option_visibility(false)
	set_pp_option_visibility(false)

func _process(delta):
	# how to make it so that when chatting, remove talk 
	if (Globals.is_chatting):
		#print("hello")
		set_chat_option_visibility(false)
		
func _on_body_entered(body: Node2D) -> void:
	#print(body.name + "enter")
	Globals.in_chat_zone = true
	Globals.in_pp_npc0 = true
	Globals.npc_target = 0
	print(Globals.npc_target)
	#Globals.npc_state = npc1_state;
	if (Globals.npc0_state <= 2):
		set_chat_option_visibility(true)
	if (Globals.can_pp_npc0):
		set_pp_option_visibility(true)
	# show press space to chat
	# Replace with function body.

func _on_chat_detection_area_body_exited(body: Node2D) -> void:
	#print(body.name + "exit")
	Globals.in_chat_zone = false
	Globals.in_pp_npc0 = false
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
