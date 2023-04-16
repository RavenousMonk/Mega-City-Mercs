extends CharacterBody2D

@export var move_speed : float = 100
@export var sprint_speed_factor : float = 3.0
@export var starting_direction : Vector2 = Vector2(0, 1)

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

func _ready():
	update_animation_parameters(starting_direction)

func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	# Check if sprint key is pressed
	if Input.is_action_pressed("ui_shift"):
	# Multiply velocity by sprint speed factor if shift is pressed
		velocity = input_direction * move_speed * sprint_speed_factor
	else:
		velocity = input_direction * move_speed
	update_animation_parameters(input_direction)
	
	# update velocity
#	velocity = input_direction * move_speed
	
	move_and_slide()
	
	pick_new_state()

func update_animation_parameters(move_input : Vector2):
	# don't change animation parameters if there is no move input
	if(move_input != Vector2.ZERO):
		animation_tree.set("parameters/Walk/blend_position", move_input)
		animation_tree.set("parameters/Idle/blend_position", move_input)

# choose state based on what is happening with the player
func pick_new_state():
	if(velocity != Vector2.ZERO):
		state_machine.travel("Walk")
	else:
		state_machine.travel("Idle")

