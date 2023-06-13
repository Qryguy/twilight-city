extends CanvasLayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("back_menu"):
		var new_paused_state = not get_tree().paused
		get_tree().paused = new_paused_state
		visible = new_paused_state

func _on_resume_pressed():
	#same function as pressing menu again
	var new_paused_state = not get_tree().paused
	get_tree().paused = new_paused_state
	visible = new_paused_state

func _on_options_pressed():
	#open the options menu on top of this
	#options will need to track which menu it came from, think we can do the same as how pause menu is put over the level, toggle visibility of a child node in this scene
	pass # Replace with function body.

func _on_main_pressed():
	#add a prompt that level progress will be lost
	get_tree().change_scene_to_file("res://twilight-city/scenes/menus/mainMenu.tscn")

func _on_quit_pressed():
	#save prompt? if we have anything that saves data
	get_tree().quit()
