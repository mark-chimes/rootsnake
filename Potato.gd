extends Node2D

var angle 
var vel 

func _ready():
	vel = rand_range(0, 20)
	angle = rand_range(0, 360)
	rotation_degrees = rand_range(0,360)
	modulate = Color(rand_range(0.7,1), rand_range(0.7, 1), rand_range(0.7, 1))
	
func _process(delta):
	if position.x < -680: 
		position.x += 4
		angle = angle + 180
		position += Vector2(1, 0).rotated(deg2rad(angle)) * vel * 0.5
	elif position.x > 680: 
		position.x -= 4
		angle = angle + 180
		position += Vector2(1, 0).rotated(deg2rad(angle)) * vel * 0.5
	position += Vector2(1, 0).rotated(deg2rad(angle)) * vel * delta
