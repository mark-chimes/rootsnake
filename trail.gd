extends Node2D

var trail_piece_res = load("res://trailpiece.tscn")


var SPAWN_TIME = 0.05
var countdown = SPAWN_TIME

func _ready():
	pass

func _physics_process(delta):
	countdown -= delta
	if countdown <= 0: 
		countdown = SPAWN_TIME
		spawn_piece()

func spawn_piece(): 
	var snakehead = get_parent().get_node("snakehead")
	var trail_piece = trail_piece_res.instance()
	trail_piece.position = snakehead.position
	trail_piece.rotation_degrees = snakehead.rotation_degrees
	add_child(trail_piece)
