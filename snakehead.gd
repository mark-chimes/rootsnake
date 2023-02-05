extends Node2D

signal collide

var VEL = 100.0

var SPEEDUP_FACTOR = 2

var turn_speed = 100.0

var num_players = 1
var other_player = null

export var is_fake = false
export var is_control_inverted = false
export var player_num = 1

export var action_left = "p1_left"
export var action_right = "p1_right"
export var angle = 75
export var display_name = "DEFAULT"

export(Color) var color

const MAX_DIST = 800.0
const MIN_DIST = 12.0

const PARTICLE_CHANGE_TIME = 5
var time_since_last_change = 0

var game_started = false

onready var particles = get_node("Particles1")

var MIN_TIME_TO_TURN = 0
var MAX_TIME_TO_TURN = 3
var fake_turn_countdown = 8

var fake_turn_speed = 0

func start_game():
	fake_turn_countdown = 5 + rand_range(0,5)
	game_started = true
	if player_num == 1:
		particles = $Particles1
		$Particles2.queue_free()
	else: 
		$Particles1.queue_free()
		particles = $Particles2
	$Sprite.modulate = color

func _process(delta):
	time_since_last_change += delta
	if time_since_last_change > PARTICLE_CHANGE_TIME:
		particles.lifetime *= 0.95
		time_since_last_change = 0
	VEL = VEL + delta * SPEEDUP_FACTOR
	turn_speed = turn_speed + delta * SPEEDUP_FACTOR
	
	if is_fake:
		fake_turn_countdown -= delta 
		angle += fake_turn_speed * delta
		if fake_turn_countdown <= 0: 
			var rand = randi() % 3
			if rand == 0: 
				fake_turn_speed = -turn_speed
			elif rand == 1: 
				fake_turn_speed = turn_speed
			else: 
				fake_turn_speed = 0 
			
			fake_turn_countdown = rand_range(MIN_TIME_TO_TURN, MAX_TIME_TO_TURN)
			
	else:
		if is_control_inverted: 
			if Input.is_action_pressed(action_left):
				angle += turn_speed * delta
			elif Input.is_action_pressed(action_right):
				angle -= turn_speed * delta
		else: 
			if Input.is_action_pressed(action_right):
				angle += turn_speed * delta
			elif Input.is_action_pressed(action_left):
				angle -= turn_speed * delta
	reset_angle_and_rotate()

func _physics_process(delta):
	if not game_started: 
		return
		
	var vel = VEL
	if num_players == 1: 
		position += Vector2(1, 0).rotated(deg2rad(angle)) * VEL * delta
	elif num_players == 2: 
		if other_player.position.y > position.y + MIN_DIST:
			var vertical_component = sin(deg2rad(angle))
			var dist_ratio = (other_player.position.y + MIN_DIST*2 - position.y)/MAX_DIST
			vel = VEL*(1 + sqrt(dist_ratio) * vertical_component)
			
		position += Vector2(1, 0).rotated(deg2rad(angle)) * vel * delta

func _on_Area2D_area_entered(area):
	angle = 180 - angle
	position += Vector2(1, 0).rotated(deg2rad(angle)) * VEL/16
	reset_angle_and_rotate()

func _on_Area2D2_area_entered(area):
	var coll_angle = rad2deg(area.global_position.angle_to_point(global_position))
	angle = 2 * coll_angle + 180 - angle
	reset_angle_and_rotate()
	position += Vector2(1, 0).rotated(deg2rad(angle)) * VEL/16

func reset_angle_and_rotate(): 
	angle = fmod(angle, 360)
	rotation_degrees = angle

func _on_Area2D3_area_entered(area):
	emit_signal("collide")
