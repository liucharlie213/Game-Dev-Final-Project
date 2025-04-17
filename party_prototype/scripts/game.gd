extends Node2D

var box_scene = preload("res://scenes/box.tscn")
var garbage_scene = preload("res://scenes/garbage.tscn")
var obstacle_types = [box_scene, garbage_scene]
var obstacles : Array 

const START_POS := Vector2i(0, 0)
const MOUSE_START_POS := Vector2i(-300, 0)
const CAM_START_POS := Vector2i(650, -350)

var speed : float
const START_SPEED : float = 8.0
const MAX_SPEED : int = 25
var screen_size : Vector2i
var ground_height : int
var last_obs

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_window().size
	ground_height = $road.get_node("Sprite2D").texture.get_height()
	new_game()
	pass # Replace with function body.

func new_game():
	%Player.position = START_POS
	$Mouse.position = MOUSE_START_POS
	%Player.velocity= Vector2i(0, 0)
	$Camera2D.position = CAM_START_POS
	$road.position = Vector2i(0,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	speed = START_SPEED
	
	generate_obs()
	
	%Player.position.x += speed
	$Camera2D.position.x += speed
	%Mouse.position.x += speed
	
	if $Camera2D.position.x - $road.position.x > screen_size.x * 0.8:
		$road.position.x += screen_size.x
		
	pass

func generate_obs():
	if obstacles.is_empty() or last_obs.position.x < $Camera2D.position.x + randi_range(20, 200):
		var obs_type = obstacle_types[randi() % obstacle_types.size()]
		var obs
		obs = obs_type.instantiate()
		var obs_height = obs.get_node("Sprite2D").texture.get_height()
		var obs_scale = obs.get_node("Sprite2D").scale
		var obs_x = $Camera2D.position.x + screen_size.x + randi_range(100, 400)
		var obs_y = screen_size.y - ground_height - (obs_height * obs_scale.y /2 ) + 5
		last_obs = obs
		add_obs(obs, obs_x, -100)

func add_obs(obs, x, y):
	obs.position = Vector2i(x, y)
	add_child(obs)
	obstacles.append(obs)
