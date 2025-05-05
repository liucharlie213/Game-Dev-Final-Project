extends CharacterBody2D

var noise = FastNoiseLite.new()
var noise_time := 0.0

@export var shake_strength: float = 10.0
@export var shake_speed: float = 0.5  # lower = slower drift


func _ready() -> void:
	noise.seed = randi()
	noise.noise_type = FastNoiseLite.TYPE_SIMPLEX
	noise.frequency = 0.5
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _process(delta: float) -> void:
	noise_time += delta * shake_speed
	var target = get_global_mouse_position()
	var offset = Vector2(
		noise.get_noise_1d(noise_time) * shake_strength,
		noise.get_noise_1d(noise_time + 100.0) * shake_strength  # shift second axis
	)
	target += offset
	global_position = global_position.lerp(target, 0.2)
	var clamped_position = target.clamp(Vector2.ZERO, get_viewport_rect().size)
	global_position = clamped_position
	

func _on_duck_body_entered(body: Node2D) -> void:
	print('in duck')
	get_tree().change_scene_to_file("res://scenes/duck_caught.tscn") # Replace with function body.


func _on_scissors_body_entered(body: Node2D) -> void:
	print('in scissors')
	get_tree().change_scene_to_file("res://scenes/scissors_caught.tscn") # Replace with function body.


func _on_chips_body_entered(body: Node2D) -> void:
	print('in chips')
	get_tree().change_scene_to_file("res://scenes/scissors_caught.tscn")


func _on_bbq_body_entered(body: Node2D) -> void:
	print('in bbq') # Replace with function body.
	get_tree().change_scene_to_file("res://scenes/scissors_caught.tscn")
