extends Node2D

signal collide

var VEL = 64.0

var turn_speed = 180.0

export var is_control_inverted = false

export var action_left = "p1_left"
export var action_right = "p1_right"
export var angle = 75
export var display_name = "DEFAULT"

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
	# position.x += rand_range(-20*delta,20*delta)

	if angle > 360: 
		angle -= 360
	if angle < 0: 
		angle += 360
	rotation_degrees = angle

func _physics_process(delta):
	position += Vector2(1, 0).rotated(deg2rad(angle)) * VEL * delta


func _on_Area2D_area_entered(area):
	print(str(display_name) + "Collision!")
	emit_signal("collide")
