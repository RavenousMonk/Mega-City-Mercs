extends Node2D

var transition_entered = false


func _on_body_entered(_body):
	transition_entered = true

func _on_body_exited(_body):
	transition_entered = false

func _on_entry_gun_shop_02_body_entered(_body):
	transition_entered = true

func _on_entry_gun_shop_02_body_exited(_body):
	transition_entered = false


func _physics_process(_delta):
	if transition_entered == true:
		if Input.is_action_just_pressed("interact"):
			StageManager.changeStage(StageManager.GUN_SHOP_01, 272, 335)

# function to change scene

