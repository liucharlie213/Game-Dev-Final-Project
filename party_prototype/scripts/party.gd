extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%GameOverFail.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Globals.num_pp == 2):
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/npc0.dialogue"), "caught")
		Globals.num_pp += 1
		Globals.on_the_run = true
		print("globals on teh run: ")
		print(Globals.on_the_run)


func _on_caught_timer_timeout() -> void:
	print("TIMEOUT")
	get_tree().paused = true
	%GameOverFail.show()
	pass # Replace with function body.
