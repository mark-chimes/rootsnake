extends Node2D

var trail_piece_1_res = load("res://trailpiece_p1.tscn")
var trail_piece_2_res = load("res://trailpiece_p2.tscn")

var SPAWN_TIME = 0.05
var countdown = SPAWN_TIME

func _ready():
	pass

func _physics_process(delta):
	countdown -= delta
	if countdown <= 0: 
		countdown = SPAWN_TIME
		spawn_piece(get_parent().get_node("snakehead1"), trail_piece_1_res)
		spawn_piece(get_parent().get_node("snakehead2"), trail_piece_2_res)
		
func spawn_piece(snakehead, trail_res): 
	var trail_piece = trail_res.instance()
	trail_piece.position = snakehead.position
	trail_piece.rotation_degrees = snakehead.rotation_degrees
	add_child(trail_piece)
