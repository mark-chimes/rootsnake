extends Node2D

var trail_res = load("res://trailpiece.tscn")

var num_players = 1

var MIN_SPAWN = 0.05
var addition = 0.2
var SPAWN_TIME = 0.25
var countdown = SPAWN_TIME
var s1_start_col = Color(0.1,0.7,0.1)
var s1_end_col = Color(0.5,0.4,0.05)
var s2_start_col = Color(0.8,0.2,0.15)
var s2_end_col = Color(0.3,0.175,0.3)

func _ready():
	pass

func start_game(): 
	get_parent().get_node("snakehead1").get_node("Sprite").modulate = s1_start_col
	if num_players > 1:
		get_parent().get_node("snakehead2").get_node("Sprite").modulate = s2_start_col

func _process(delta):
	SPAWN_TIME = MIN_SPAWN + addition
	if addition > 0.0001:
		addition = addition * (1-delta/50)

func _physics_process(delta):
	countdown -= delta
	if countdown <= 0: 
		countdown = SPAWN_TIME
		spawn_piece(get_parent().get_node("snakehead1"), s1_start_col, s1_end_col)
		if num_players > 1:
			spawn_piece(get_parent().get_node("snakehead2"), s2_start_col, s2_end_col)
		
func spawn_piece(snakehead, start_col, end_col): 
	var trail_piece = trail_res.instance()
	trail_piece.position = snakehead.position
	trail_piece.rotation_degrees = snakehead.rotation_degrees
	trail_piece.start_col = start_col
	trail_piece.end_col = end_col
	add_child(trail_piece)
