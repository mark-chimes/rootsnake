extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var angle = 0
var vel = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	angle = rand_range(0, 360)
	reset_angle_and_rotate()
	modulate = Color(rand_range(0.7,1), rand_range(0.7, 1), rand_range(0.7,1))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.x < -680: 
		position.x += 4
		angle = angle + 180
		reset_angle_and_rotate()
		position += Vector2(1, 0).rotated(deg2rad(angle)) * vel * 0.5
	elif position.x > 680: 
		position.x -= 4
		angle = angle + 180
		reset_angle_and_rotate()
		position += Vector2(1, 0).rotated(deg2rad(angle)) * vel * 0.5
	position += Vector2(1, 0).rotated(deg2rad(angle)) * vel * delta

		

func reset_angle_and_rotate(): 
	angle = fmod(angle, 360)
	rotation_degrees = angle
