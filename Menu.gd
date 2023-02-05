extends Node2D

signal start_single_player
signal start_multi_player

var main_buttons
var help_screen
var credits_screen

func _ready(): 
	main_buttons = $MainButtons
	help_screen = $HelpScreen
	credits_screen = $CreditsScreen
	remove_child(help_screen)
	remove_child(credits_screen)
	
func _on_StartButton_button_click():
	emit_signal("start_single_player")

func _on_MultiplayerButton_button_click():
	emit_signal("start_multi_player")

func _on_HelpButton_button_click():
	remove_child(main_buttons)
	help_screen.set_owner(self)
	add_child(help_screen)

func _on_CreditButton_button_click():
	remove_child(main_buttons)
	credits_screen.set_owner(self)
	add_child(credits_screen)

func _on_ExitButton_button_click():
	get_tree().quit()

func _on_ReturnButton1_button_click():
	add_child(main_buttons)
	main_buttons.set_owner(self)
	remove_child(help_screen)

func _on_ReturnButton2_button_click():
	add_child(main_buttons)
	main_buttons.set_owner(self)
	remove_child(credits_screen)

