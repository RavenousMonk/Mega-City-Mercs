extends CanvasLayer

const NEW_GAME = preload("res://scenes/game/new_game/NewGame01.tscn")
const PROLOGUE = preload("res://scenes/game/levels/dis_level_sacramento/dis_level_Saramento.tscn")
const GUN_SHOP_01 = preload("res://scenes/game/levels/dis_level_sacramento/poi_gun_shop_01.tscn")


func _ready():
	get_node("bg").hide()

## This function accepts the stage_path argument, which is definted in the constants above.  It uses change_scene_to_file, which means it will kill the current scene to load the new scene.
func startPrologue(stage_path):
	get_node("bg").show()
	get_node("anim").play("TransIn")
	await get_node("anim").animation_finished

	var stage = stage_path.instantiate()
	get_tree().get_root().get_node("NewGame").queue_free()
	get_tree().get_root().add_child(stage)
	
	get_node("anim").play("TransOut")
	await get_node("anim").animation_finished
	get_node("bg").hide()	


func changeStage(stage_path, x, y):
	get_node("bg").show()
	get_node("anim").play("TransIn")
	await get_node("anim").animation_finished

	var stage = stage_path.instantiate()
	get_tree().get_root().get_child(2).queue_free()
	get_tree().get_root().get_node("Player").add_sibling(stage)
	get_tree().get_root().get_node("Player").position = Vector2(x, y)

	get_node("anim").play("TransOut")
	await get_node("anim").animation_finished
	get_node("bg").hide()	
