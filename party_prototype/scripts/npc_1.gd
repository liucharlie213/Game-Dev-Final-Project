extends CharacterBody2D

# want some global variable that tells which character
# the cat has just started talking to 

#var chat_option : bool = false

#var player
#var chat_zone = false

func _ready():
	$AnimatedSprite2D.play("idle")

	#
#func _on_body_entered(body):
	#print("body entered");
	#chat_option = true
	##set the global var to shwo that is talking to npc 1
	 ##the moment the nbody EXITS the zone tho need to reset to not talking to anyone
#
#func on_body_exited(body):
	#print("body_exited");
	#chat_option = false
	#
