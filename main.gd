extends Node2D

var is_game_over = false

export var num_players = 1

func _ready(): 
	start_game()

func _process(delta):
	if is_game_over:
		num_players = 1
		if Input.is_action_just_pressed("action_restart"):
			get_tree().paused = false
			get_tree().reload_current_scene()
		
func start_game(): 
	$CameraControl.num_players = num_players
	$trail.num_players = num_players
	if num_players == 1: 
		$snakehead2.queue_free()
	$trail.start_game()

func _on_snakehead1_collide():
	print("Snakehead 1 game end!")
	get_tree().paused = true
	$CameraControl/Winscreen.visible = true
	var winscreenlabel = $CameraControl/Winscreen/Label
	winscreenlabel.text = "Player 2\nWins!"
	winscreenlabel.set("custom_colors/font_color", Color8(178,57,15))
	is_game_over = true


func _on_snakehead2_collide():
	print("Snakehead 2 game end!")
	get_tree().paused = true
	var winscreenlabel = $CameraControl/Winscreen/Label
	$CameraControl/Winscreen.visible = true
	winscreenlabel.text = "Player 1\nWins!"
	winscreenlabel.set("custom_colors/font_color", Color(0.1,0.5,0.1))
	is_game_over = true
