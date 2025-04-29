extends CanvasLayer

@onready var timer = $Timer

func _ready():
	timer.start()
	print('timer start') # Start the timer

func _on_timer_timeout():
	print('timeout')
	get_tree().change_scene_to_file("res://scenes/endlessRunner.tscn")
