extends Node2D

var entered = false


func _on_body_entered(_body):
	entered = true


func _on_body_exited(_body):
	entered = false


func _physics_process(_delta):
	if entered == true:
		if Input.is_action_just_pressed("interact"):
			StageManager.changeStage(StageManager.PROLOGUE, 424, 353)
		
