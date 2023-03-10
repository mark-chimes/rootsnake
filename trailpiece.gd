extends Node2D


const LIFETIME = 12.0
var countdown = LIFETIME

var growth_time = 0.0
const GROWTH_TIME = 4.0
const COLOR_TIME = 2.0
const GROWTH_ADD = 3.0

var lifetime = 0.0
var COLLISION_TIME = 0.5
var has_activated_collisions = false

export var start_col = Color(0,0,0)
export var end_col = Color(0,0,0)

var camera_controller = null

# Called when the node enters the scene tree for the first time.
func _ready():
	camera_controller = get_tree().root.get_node("game_control").get_node("CameraController")

func _process(delta):
	if position.y < camera_controller.position.y - 800:
		queue_free()
	
	countdown -= delta
	if countdown <= 0: 
		queue_free()
		
	if lifetime < COLLISION_TIME: 
		lifetime += delta
	elif not has_activated_collisions:
		has_activated_collisions = true
		$Area2D/CollisionPolygon2D.disabled = false 
		
	if growth_time < GROWTH_TIME: 
		growth_time += delta
	else: 
		growth_time = GROWTH_TIME
	
	var growth_factor =  growth_time/GROWTH_TIME
	var color_factor = min(1, growth_time/COLOR_TIME)
	var size = 1.0 + GROWTH_ADD * growth_factor
	scale = Vector2(size,size)
	
	$Sprite.modulate = start_col.linear_interpolate(end_col, color_factor)
