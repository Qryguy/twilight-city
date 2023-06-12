extends Control

#no idea how we get this yet, this will be a Scene data type
#will this work? currentScene = get_tree().get_current_scene() (.get_filename for file naming)
#var currentLevel

func _input(event):
	get_tree().paused = true

func _ready():
	#I think this will be needed to set the level to "paused"
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#don't think we need process
	pass

func _on_resume_pressed():
	#close this menu and return to the game, unsure if we need the current level value or not
	pass # Replace with function body.

func _on_options_pressed():
	#open the options menu on top of this
	#options will need to track which menu it came from, hoping we can instantiate it on top of the current menu and just close it when exiting
	#thinking about it I hope we can use the same logic for this pause menu: open it, stop gameplay; close it, continue gameplay (or switch those probably)
	pass # Replace with function body.

func _on_main_pressed():
	#add a prompt that level progress will be lost
	get_tree().change_scene_to_file("res://twilight-city/scenes/menus/mainMenu.tscn")

func _on_quit_pressed():
	#save prompt? if we have anything that saves data
	get_tree().quit()



