extends Control

const STARTING_VALUES = {
	"Cybernaut": [8, 6, 7, 6, 4, 6],
	"Netweaver": [4, 7, 6, 5, 8, 5],
	"Thaumaturge": [5, 6, 5, 8, 6, 4],
	"Mechmaster": [6, 5, 8, 4, 5, 7]
}

var archetype : String
var save_file_path = "user://"
var save_file_name = "PlayerSave.tres"

# This is created a new instance of the PlayerData custom resource (from PlayerData.gd)
var playerData = PlayerData.new()

# Verify file directory so that we can pass in our file path.
# It uses the function defined below "verify_save_directory"
func _ready():
	verify_save_directory(save_file_path)


# if the folder doesn't exist, create it
func verify_save_directory(path : String):
	DirAccess.make_dir_absolute(path)


func _on_continue_button_pressed():
	playerData.character_name = $MarginContainer/VBoxContainer/CharacterName.text
	match archetype:
		"Cybernaut":
			playerData.att_muscles = 5
			playerData.att_finesse = 3
			playerData.att_toughness = 3
			playerData.att_presence = 2
			playerData.att_acumen = 2
			playerData.att_resolve = 3
		"Netweaver":
			playerData.att_muscles = 2
			playerData.att_finesse = 3
			playerData.att_toughness = 3
			playerData.att_presence = 2
			playerData.att_acumen = 5
			playerData.att_resolve = 3
		"Thaumaturge":
			playerData.att_muscles = 2
			playerData.att_finesse = 2
			playerData.att_toughness = 3
			playerData.att_presence = 3
			playerData.att_acumen = 3
			playerData.att_resolve = 5
		"Mechmaster":
			playerData.att_muscles = 3
			playerData.att_finesse = 3
			playerData.att_toughness = 3
			playerData.att_presence = 2
			playerData.att_acumen = 5
			playerData.att_resolve = 2
			
	ResourceSaver.save(playerData, save_file_path + save_file_name)
	
	# Instantiate the Player
	var player = load("res://scenes/game/characters/player.tscn").instantiate()
	get_node("/root").add_child(player)
	# Set the player's position
	player.set_position(Vector2(424, 376))

# Change stage to the Prologue
	StageManager.startPrologue(StageManager.PROLOGUE)

func _on_btn_cybernaut_pressed():
	archetype = "Cybernaut"


func _on_btn_netweaver_pressed():
	archetype = "Netweaver"


func _on_btn_thaumaturge_pressed():
	archetype = "Thaumaturge"


func _on_btn_mechmaster_pressed():
	archetype = "Mechmaster"
