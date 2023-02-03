extends Node2D


const LIFETIME = 60.0
var countdown = LIFETIME

var growth_time = 0.0
const GROWTH_TIME = 10.0
const GROWTH_ADD = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	countdown -= delta
	if countdown <= 0: 
		queue_free()
		
	if growth_time < GROWTH_TIME: 
		growth_time += delta
	else: 
		growth_time = GROWTH_TIME
	
	var size = 1.0 + GROWTH_ADD * growth_time/LIFETIME
	$Sprite.scale = Vector2(size,size)
	$Sprite.modulate = Color(1,1,1,countdown / LIFETIME)
