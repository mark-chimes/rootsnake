extends Node2D

signal lose_1
signal lose_2

signal screen_moved

var num_players = 1

var is_game_continuing = false

const SCREEN_SIZE = 2000
var current_movement = 0
var last_pos = 0

func start_game(): 
	is_game_continuing = true
	last_pos = position.y

func _process(delta):
	var snake_1_pos = get_parent().get_node("snakehead1").position
	if num_players == 2:
		var snake_2_pos = get_parent().get_node("snakehead2").position
		var top_pos = min(snake_1_pos.y, snake_2_pos.y)
		var bot_pos = max(snake_1_pos.y, snake_2_pos.y)
		var mid_pos = 0.3*top_pos + 0.7*bot_pos
		if mid_pos > position.y:
			position.y = mid_pos
		
		if is_game_continuing:
			if mid_pos - snake_1_pos.y > 800: 
				is_game_continuing = false
				emit_signal("lose_1")
			if mid_pos - snake_2_pos.y > 800: 
				is_game_continuing = false
				emit_signal("lose_2")
	else:
		if snake_1_pos.y > position.y:
			position.y = snake_1_pos.y
	
	if position.y > last_pos + SCREEN_SIZE:
		emit_signal("screen_moved")
		print("reached position " + str(position.y))
		last_pos = position.y
