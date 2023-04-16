extends Area2D

@export var move_speed : float = 300.0
@export var move_dir : Vector2

var target_pos : Vector2
var start_pos : Vector2

func _ready():
	target_pos = global_position + move_dir
	start_pos = global_position
	
	# set the "flip_h" property of the sprite based on the value of the "flipme" variable

func _process(delta):
	global_position = global_position.move_toward(target_pos, move_speed * delta)
	
	if global_position == target_pos:
		global_position = start_pos
	
	# this is to match velocity of player to the moving pads
	position += velocity * delta

func _on_body_entered(body):
	if body.is_in_group("Player"):
		
