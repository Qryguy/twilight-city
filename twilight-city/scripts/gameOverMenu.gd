extends CanvasLayer

#var currentLevel = get_tree().get_current_scene()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_restart_level_pressed():
	pass
	get_tree().reload_current_scene()
	#get_tree().change_scene_to_packed(currentLevel)

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://twilight-city/scenes/menus/mainMenu.tscn")
