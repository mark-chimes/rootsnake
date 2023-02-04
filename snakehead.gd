extends Node2D

signal collide

var VEL = 64.0

var turn_speed = 180.0

var num_players = 1
var other_player = null

export var is_control_inverted = false

export var action_left = "p1_left"
export var action_right = "p1_right"
export var angle = 75
export var display_name = "DEFAULT"

const MAX_DIST = 200.0
const MIN_DIST = 4.0

func start_game():
	pass

func _process(delta):
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

	if angle > 360: 
		angle -= 360
	if angle < 0: 
		angle += 360
	rotation_degrees = angle

func _physics_process(delta):
	var vel = VEL
	if num_players == 1: 
		position += Vector2(1, 0).rotated(deg2rad(angle)) * VEL * delta
	else: 
		if other_player.position.y > position.y + MIN_DIST:
			var vertical_component = sin(deg2rad(angle))
			var dist_ratio = (other_player.position.y + MIN_DIST*2 - position.y)/MAX_DIST
			print(dist_ratio)
			vel = VEL*(1 + sqrt(dist_ratio) * vertical_component)
			
		position += Vector2(1, 0).rotated(deg2rad(angle)) * vel * delta

func _on_Area2D_area_entered(area):
	print(str(display_name) + "Collision!")
	emit_signal("collide")
