extends Timer

func _process(delta: float) -> void:
	if (Globals.on_the_run):
		print("timer ready")
		%CaughtTimer.start()
		Globals.on_the_run = false
