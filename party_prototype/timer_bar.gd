extends Line2D

signal made_it_home;

func _inc():
	points[1].x += 50
	
func _reached_home():
	return points[1].x == 760

func _on_timer_timeout() -> void:
	if _reached_home(): 
		$Timer.stop()
		emit_signal("made_it_home")
	else:
		_inc();
	pass # Replace with function body.
