extends Node2D


func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://scenes/game/new_game/NewGame01.tscn")
	
