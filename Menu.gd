extends Node2D

signal start_single_player
signal start_multi_player
signal help
signal credits

func _on_StartButton_button_click():
	emit_signal("start_single_player")

func _on_MultiplayerButton_button_click():
	emit_signal("start_multi_player")

func _on_HelpButton_button_click():
	emit_signal("help")

func _on_CreditButton_button_click():
	emit_signal("credits")

func _on_ExitButton_button_click():
	get_tree().quit()
