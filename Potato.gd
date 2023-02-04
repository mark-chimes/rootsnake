extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	rotation_degrees = rand_range(0,360)
	modulate = Color(rand_range(0.7,1), rand_range(0.7, 1), rand_range(0.7, 1))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
