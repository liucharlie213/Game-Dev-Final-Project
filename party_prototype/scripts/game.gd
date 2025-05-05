extends Node2D

var box_scene = preload("res://scenes/box.tscn")
var garbage_scene = preload("res://scenes/garbage.tscn")
var streelight_scene = preload("res://scenes/street_light.tscn")
var bench_scene = preload("res://scenes/bench.tscn")
var wiz_scene = preload("res://scenes/wiz.tscn")
var const_scene = preload("res://scenes/const.tscn")
var worker_scene = preload("res://scenes/worker.tscn")
var stopsign_scene = preload("res://scenes/stopsign.tscn")
var hydrant_scene = preload("res://scenes/hydrant.tscn")
var obstacle_types = [box_scene, garbage_scene]
var s_d_types = [wiz_scene, const_scene, worker_scene, stopsign_scene, hydrant_scene]
var obstacles : Array 
var street_decor : Array

const START_POS := Vector2i(100, 0)
const MOUSE_START_POS := Vector2i(-300, 0)
const CAM_START_POS := Vector2i(650, -350)

var speed : float
const START_SPEED : float = 8.0
const MAX_SPEED : int = 25
var screen_size : Vector2i
var ground_height : int
var last_obs
var last_s_d
var obstacles_hit = 0
var street_light
var bench

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_window().size
	ground_height = $road.get_node("Sprite2D").texture.get_height()
	new_game()

func new_game():
	%Player.position = START_POS
	$Mouse.position = MOUSE_START_POS
	%Player.velocity= Vector2i(0, 0)
	$Camera2D.position = CAM_START_POS
	$road.position = Vector2i(0,0)
	street_light = streelight_scene.instantiate()
	bench = bench_scene.instantiate()
	
	street_light.position = Vector2i(-400,150)
	bench.position = Vector2i(-550,200)
	
	add_child(street_light)
	add_child(bench)
	
	$GameOverFail.hide()
	$GameOverSuccess.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	speed = START_SPEED
	
	generate_obs()
	generate_s_d()
	
	%Player.position.x += speed
	$Camera2D.position.x += speed
	%Mouse.position.x += speed
	
	if $Camera2D.position.x - $road.position.x > screen_size.x * 0.5:
		$road.position.x += screen_size.x
		
	if $Camera2D.position.x - street_light.position.x > screen_size.x * 1:
		street_light.position.x += screen_size.x * 2
		
	if $Camera2D.position.x - bench.position.x > screen_size.x * 1:
		bench.position.x += screen_size.x * 2
		
	#pass

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
		if last_obs.position.x < $Camera2D.position.x:
			obstacles.remove_at(0)
		

func add_obs(obs, x, y):
	obs.position = Vector2i(x, y)
	obs.body_entered.connect(hit_obs.bind(obs))
	add_child(obs)
	obstacles.append(obs)
	
func generate_s_d():
	if street_decor.is_empty() or last_s_d.position.x < $Camera2D.position.x + randi_range(20, 200):
		var s_d_type = s_d_types[randi() % s_d_types.size()]
		var s_d
		s_d = s_d_type.instantiate()
		var s_d_height = s_d.get_node("Sprite2D").texture.get_height()
		var s_d_scale = s_d.get_node("Sprite2D").scale
		var s_d_x = $Camera2D.position.x + screen_size.x + randi_range(100, 400)
		var s_d_y = screen_size.y - ground_height - (s_d_height * s_d_scale.y /2 ) + 5
		last_s_d = s_d 
		add_s_d(s_d, s_d_x, randi_range(80, 250))
		if last_s_d.position.x < $Camera2D.position.x:
			street_decor.remove_at(0)

func add_s_d(obs, x, y):
	obs.position = Vector2i(x, y)
	#obs.body_entered.connect(hit_obs.bind(obs))
	add_child(obs)
	street_decor.append(obs)

func hit_obs(body, obs):
	if body.name == "Player" && obs.visible:
		obstacles_hit+=1
		if obstacles_hit == 1:
			%Player.position.x -= 200
			#make obstacle disseapear
			obs.visible = false;
		else:
			game_over()
		

func game_over():
	get_tree().paused = true
	%Timer.stop();
	$GameOverFail.show()

func _on_timer_bar_2_made_it_home() -> void:
	get_tree().paused = true
	%Timer.stop();
	$GameOverSuccess.show()
