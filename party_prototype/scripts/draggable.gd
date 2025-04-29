extends Sprite2D

var is_dragging = false
var mouse_offset 
var delay = 70

func _physics_process(delta: float) -> void:
	if is_dragging == true:
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", get_global_mouse_position()-mouse_offset, delay * delta)
	

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if get_rect().has_point(to_local(event.position)):
				print('clicked on sprite')
				is_dragging = true
				mouse_offset = get_global_mouse_position() - global_position
		else:
			is_dragging = false
