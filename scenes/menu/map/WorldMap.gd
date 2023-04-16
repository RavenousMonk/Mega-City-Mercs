extends Node2D

# Setup vars to store the scene, so that the script keeps working if the scene path changes
#@export var scene_RegionNAmerica: PackedScene
const MAP_DIS_SACRAMENTO = preload("res://scenes/menu/map/districts/dis_map_Sacramento.tscn")


func _on_btn_dis_sacramento_pressed():
	get_tree().change_scene_to_packed(MAP_DIS_SACRAMENTO)
