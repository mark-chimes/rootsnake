extends Node2D


func _process(delta):
	var snake_1_pos = get_parent().get_node("snakehead1").position
	var snake_2_pos = get_parent().get_node("snakehead2").position
	position.y = max(position.y, 
		0.3*min(snake_1_pos.y, snake_2_pos.y) + 0.7*max(snake_1_pos.y, snake_2_pos.y))
