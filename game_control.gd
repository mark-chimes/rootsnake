extends Node2D

signal exit

var is_game_over = false

export var num_players = 1

func _ready(): 
	start_game()

func _process(delta):
	if Input.is_action_just_pressed("exit"):
		emit_signal("exit")
		
	if is_game_over:
		if Input.is_action_just_pressed("action_restart"):
			get_tree().paused = false
			get_tree().reload_current_scene()

	
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
	get_tree().paused = true
	$CameraController/Winscreen.visible = true
	var winscreenlabel = $CameraController/Winscreen/Label
	if num_players == 1: 
		winscreenlabel.text = str(stepify($CameraController.position.y/1000, 0.001)) + "\nmetres!"
		winscreenlabel.set("custom_colors/font_color", Color(0.1,0.5,0.1))
	else:
		winscreenlabel.text = "Player 2\nWins!"
		winscreenlabel.set("custom_colors/font_color", Color8(178,57,15))
	is_game_over = true

func snake_2_loses(): 
	get_tree().paused = true
	var winscreenlabel = $CameraController/Winscreen/Label
	$CameraController/Winscreen.visible = true
	winscreenlabel.text = "Player 1\nWins!"
	winscreenlabel.set("custom_colors/font_color", Color(0.1,0.5,0.1))
	is_game_over = true
