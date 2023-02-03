extends Node2D

func _on_snakehead1_collide():
	print("Snakehead 1 game end!")
	get_tree().paused = true
	$CameraControl/Winscreen.visible = true
	var winscreenlabel = $CameraControl/Winscreen/Label
	winscreenlabel.text = "Player 2\nWins!"
	winscreenlabel.set("custom_colors/font_color", Color8(178,57,15))


func _on_snakehead2_collide():
	print("Snakehead 2 game end!")
	get_tree().paused = true
	var winscreenlabel = $CameraControl/Winscreen/Label
	$CameraControl/Winscreen.visible = true
	winscreenlabel.text = "Player 1\nWins!"
	winscreenlabel.set("custom_colors/font_color", Color(0.1,0.5,0.1))
	
