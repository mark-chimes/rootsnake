extends Node2D

signal lose_1
signal lose_2

var num_players = 1

var is_game_continuing = false

func start_game(): 
	is_game_continuing = true

func _process(delta):
	var snake_1_pos = get_parent().get_node("snakehead1").position
	if num_players == 2:
		var snake_2_pos = get_parent().get_node("snakehead2").position
		var top_pos = min(snake_1_pos.y, snake_2_pos.y)
		var bot_pos = max(snake_1_pos.y, snake_2_pos.y)
		var mid_pos = 0.3*top_pos + 0.7*bot_pos
		position.y = mid_pos
		
		if is_game_continuing:
			if mid_pos - snake_1_pos.y > 200: 
				is_game_continuing = false
				emit_signal("lose_1")
			if mid_pos - snake_2_pos.y > 200: 
				is_game_continuing = false
				emit_signal("lose_2")
		
		# print(snake_1_pos.y - mid_pos)
	else:
		position.y = snake_1_pos.y
