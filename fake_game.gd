extends Node2D

signal single_player
signal multi_player
signal exit

var is_game_over = false

export var num_players = 2

func _ready(): 
	start_game()

func _process(delta):
	pass

	
func start_game(): 
	$CameraController.num_players = num_players
	$snakehead1.num_players = num_players
	if num_players == 1: 
		$snakehead2.queue_free()
		$snakehead1.start_game()
	else: 
		$snakehead1.num_players = 2
		$snakehead1.player_num = 1
		$snakehead2.num_players = 2
		$snakehead2.player_num = 2
		$snakehead1.other_player = $snakehead2
		$snakehead2.other_player = $snakehead1
		$snakehead1.start_game()
		$snakehead2.start_game()
	$CameraController.start_game()

func _on_snakehead1_collide():
	print("Snakehead 1 game end!")
	snake_1_loses()

func _on_snakehead2_collide():
	print("Snakehead 2 game end!")
	snake_2_loses()

func _on_CameraControl_lose_1():
	print("Camera 1 game end!")
	snake_1_loses()

func _on_CameraControl_lose_2():
	print("Camera 2 game end!")
	snake_2_loses()

func snake_1_loses(): 
	get_tree().reload_current_scene()

func snake_2_loses(): 
	get_tree().reload_current_scene()


func _on_Menu_start_single_player():
	emit_signal("single_player")

func _on_Menu_start_multi_player():
	emit_signal("multi_player")
