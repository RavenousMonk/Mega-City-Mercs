extends Node2D

const WORLD_MAP = "res://scenes/menu/map/WorldMap.tscn"
const LEVEL_SAC_DOWNTOWN = "res://scenes/game/levels/dis_level_sacramento/dis_level_Saramento.tscn"

func _input(event):
	if event.is_action_pressed("space"):
		get_tree().change_scene_to_file(WORLD_MAP)


func _on_btn_Downtown_pressed():
	get_tree().change_scene_to_file(LEVEL_SAC_DOWNTOWN)
