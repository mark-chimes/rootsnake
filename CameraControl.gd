extends Node2D


func _process(delta):
	var snake_1_pos = get_parent().get_node("snakehead1").position
	var snake_2_pos = get_parent().get_node("snakehead2").position
	position.y = max(position.y, snake_1_pos.linear_interpolate(snake_2_pos, 0.5).y)
