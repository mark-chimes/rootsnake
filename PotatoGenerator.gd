extends Node2D
var potato_res = load("res://Potato.tscn")
var potato_big_res = load("res://Potato_big.tscn")
var beetle_res = load("res://Beetle.tscn")

var object_store_index = 0
var object_stores = []

var genpos_counter = 2

export var is_fake = false

func _ready():
	object_stores.append([])
	object_stores.append([])
	object_stores.append([])
	if is_fake: 
		return
	for i in range(10):
		generate_potato(500, 4000)
		generate_big_potato(500, 4000)
	for i in range(1): 
		generate_beetle(500, 4000)

func generate_potato(start_y, end_y): 
	var potato = potato_res.instance()
	potato.position = Vector2(rand_range(-700, 700), rand_range(start_y, end_y))
	add_child(potato)
	object_stores[object_store_index].push_back(potato)
	
func generate_big_potato(start_y, end_y): 
	var potato = potato_big_res.instance()
	potato.position = Vector2(rand_range(-700, 700), rand_range(start_y, end_y))
	add_child(potato)
	object_stores[object_store_index].push_back(potato)

func generate_beetle(start_y, end_y): 
	var beetle = beetle_res.instance()
	beetle.position = Vector2(rand_range(-700, 700), rand_range(start_y, end_y))
	add_child(beetle)
	object_stores[object_store_index].push_back(beetle)

func _on_CameraControl_screen_moved():

	if object_store_index == 2: 
		object_store_index = 0
	else:
		object_store_index += 1
		
	print("New object store index is: " + str(object_store_index))
	print("Generating potatoes from " + str(2000 * genpos_counter))
	print("Freeing objects in index"+ str(object_store_index))
	
	for object in object_stores[object_store_index]:
		object.queue_free()
	object_stores[object_store_index] = []

	for i in range(10 + genpos_counter):
		generate_potato(2000 * genpos_counter, 2000 * (genpos_counter + 1))
		generate_big_potato(2000 * genpos_counter, 2000 * (genpos_counter + 1))
	for i in range(1 + genpos_counter): 
		generate_beetle(2000 * genpos_counter, 2000 * (genpos_counter + 1))
	genpos_counter += 1
