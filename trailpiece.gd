extends Node2D


const LIFETIME = 60.0
var countdown = LIFETIME

var growth_time = 0.0
const GROWTH_TIME = 5.0
const GROWTH_ADD = 3.0

var lifetime = 0.0
var COLLISION_TIME = 0.5
var has_activated_collisions = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
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
	var size = 1.0 + GROWTH_ADD * growth_factor
	scale = Vector2(size,size)
	
	var start_color = Color(0.5,0.5,0.1)
	var end_color = Color(0.8,0.4,0.05)
	
	$Sprite.modulate = start_color.linear_interpolate(end_color, growth_factor)
