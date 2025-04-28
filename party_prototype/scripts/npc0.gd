extends CharacterBody2D

@onready var chat_prompt: Label = %ChatOption
@onready var chat_bg: Sprite2D = %ChatOptionBg

func _ready():
	$AnimatedSprite2D.play("idle")
	set_chat_option_visibility(false);

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		#print("chatting w npc")
		pass
		
func _on_body_entered(body: Node2D) -> void:
	#print(body.name + "enter")
	Globals.in_chat_zone = true
	print(Globals.npc_target)
	#Globals.npc_target = 0
	#Globals.npc_state = npc1_state;
	if (Globals.npc0_state <= 2):
		set_chat_option_visibility(true)
	# show press space to chat
	# Replace with function body.

func _on_chat_detection_area_body_exited(body: Node2D) -> void:
	#print(body.name + "exit")
	Globals.in_chat_zone = false
	if (chat_prompt.visible):
		set_chat_option_visibility(false)
	
	# show press space to chat
	# Replace with function body.

func set_chat_option_visibility(status: bool):
	chat_prompt.visible = status
	chat_bg.visible = status
