extends Node2D
var potato_res = load("res://Potato.tscn")
var potato_big_res = load("res://Potato_big.tscn")

var potato_store_1 = []

var genpos_counter = 2

func _ready():
	for i in range(20):
		generate_potato(500, 4000)
		generate_big_potato(500, 4000)

func generate_potato(start_y, end_y): 
	var potato = potato_res.instance()
	potato.position = Vector2(rand_range(-700, 700), rand_range(start_y, end_y))
	add_child(potato)
	potato_store_1.push_back(potato)
	
func generate_big_potato(start_y, end_y): 
	var potato = potato_big_res.instance()
	potato.position = Vector2(rand_range(-700, 700), rand_range(start_y, end_y))
	add_child(potato)
	potato_store_1.push_back(potato)

func _on_CameraControl_screen_moved():
	print("Generating potatoes from " + str(2000 * genpos_counter))
	for i in range(20):
		generate_potato(2000 * genpos_counter, 2000 * (genpos_counter + 1))
		generate_big_potato(2000 * genpos_counter, 2000 * (genpos_counter + 1))
	genpos_counter += 1
