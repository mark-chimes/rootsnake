extends Node2D


func _process(delta):
	position.y = get_parent().get_node("snakehead").position.y
