extends Node2D

var menu_res = load("res://fake_game.tscn")
var game_res = load("res://game_control.tscn")

var game = null
var fake_game = null

# Called when the node enters the scene tree for the first time.
func _ready():
	fake_game = $fake_game

func _on_Menu_start_single_player():
	print("Menu start singleplayer")
	fake_game.queue_free()
	game = game_res.instance()
	game.num_players = 1
	add_child(game)
	game.connect("exit", self, "_on_game_exit")
	
func _on_Menu_start_multi_player():
	print("Menu start multiplayer")
	fake_game.queue_free()
	game = game_res.instance()
	game.num_players = 2
	add_child(game)
	game.connect("exit", self, "_on_game_exit")
	
func _on_game_exit(): 
	fake_game = menu_res.instance()
	add_child(fake_game)
	fake_game.connect("single_player", self, "_on_Menu_start_single_player")
	fake_game.connect("multi_player", self, "_on_Menu_start_multi_player")
	game.queue_free()
