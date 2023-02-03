extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

enum Dir {
	UP, DOWN, LEFT, RIGHT
} 

var GRID_SIZE = 16.0

var VEL = 64.0
var dir = Dir.RIGHT
var next_dir = Dir.RIGHT

func _ready():
	pass

var timer = 0.0
var CHANGE_TIME = GRID_SIZE/VEL

func _process(delta):
	timer += delta
	
	if Input.is_action_just_pressed("right"):
		dir = Dir.RIGHT
	elif Input.is_action_just_pressed("down"):
		dir = Dir.DOWN
	elif Input.is_action_just_pressed("left"):
		dir = Dir.LEFT
	elif Input.is_action_just_pressed("up"):
		dir = Dir.UP
		
	if dir == Dir.RIGHT:
		position.x += VEL*delta
		$Sprite.rotation_degrees = 0
	elif dir == Dir.DOWN: 
		position.y += VEL*delta
		$Sprite.rotation_degrees = 90
	elif dir == Dir.LEFT: 
		position.x -= VEL*delta
		$Sprite.rotation_degrees = 180
	elif dir == Dir.UP: 
		position.y -= VEL*delta
		$Sprite.rotation_degrees = 270
