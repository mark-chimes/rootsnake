extends Node2D

signal button_click

export(String) var button_text = "Button Text"

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			print("LEFT CLICK " + button_text)
			modulate = Color(0.6,0,0)
			emit_signal("button_click")

func _on_Area2D_mouse_entered():
	modulate = Color(0,1,0)

func _on_Area2D_mouse_exited():
	modulate = Color(0.6,0,0)
	
func _ready():
	$Label.text = button_text
