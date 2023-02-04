extends Node2D

var is_game_over = false

func _process(delta):
	if is_game_over:
		if Input.is_action_just_pressed("action_restart"):
			get_tree().paused = false
			get_tree().reload_current_scene()
		

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
