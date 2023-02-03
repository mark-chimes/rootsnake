extends Node2D




# Declare member variables here. Examples:
# var a = 2
# var b = "text"

enum Dir {
	UP, DOWN, LEFT, RIGHT
} 

var VEL = 64.0
var angle = 0.0
var turn_speed = 180.0

func _ready(): 
	angle = 75

func _process(delta):
	if Input.is_action_pressed("right"):
		angle += turn_speed * delta
	elif Input.is_action_pressed("left"):
		angle -= turn_speed * delta
	
	if angle > 360:
		angle -= 360
	elif angle < 0:
		angle += 360
	
	rotation_degrees = angle

func _physics_process(delta):
	position += Vector2(1, 0).rotated(deg2rad(angle)) * VEL * delta


func _on_Area2D_area_entered(area):
	print("Collision!")
