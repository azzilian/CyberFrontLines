extends Node

signal start_game

# Called when the node enters the scene tree for the first time.
func _ready():
	var new_game_button = $GameName/NewGameButton
	new_game_button.connect("pressed", Callable(self, "_on_new_game_button_pressed"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_new_game_button_pressed():
	var all_menu_nodes = get_tree().get_nodes_in_group("Menu")
	for node in all_menu_nodes:
		node.hide()
	start_game.emit()
	
	var new_scene_path = "res://Scenes/HUD/fields/BattleZone.tscn"
	var new_scene = load(new_scene_path)
	if new_scene:
		get_tree().change_scene_to_file(new_scene_path)
	else:
		print("Failed to load scene:", new_scene_path)


func _on_exit_button_pressed():
	get_tree().quit() # Replace with function body.
