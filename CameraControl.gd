extends Node2D

var num_players = 1

func _process(delta):
	var snake_1_pos = get_parent().get_node("snakehead1").position
	if num_players == 2:
		var snake_2_pos = get_parent().get_node("snakehead2").position
		position.y = max(position.y, 
			0.3*min(snake_1_pos.y, snake_2_pos.y) + 0.7*max(snake_1_pos.y, snake_2_pos.y))
	else:
		position.y = snake_1_pos.y
