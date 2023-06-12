extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	#may need this to instantiate some kind of game settings or whatever, depends on how we do configurations and all that
	pass # Replace with function body.

func _on_play_pressed():
	get_tree().change_scene_to_file("res://twilight-city/scenes/levels/level0.tscn")
	##Right now setting this to level0 as the test level, but thinking a mission select screen that unlocks over time, but scope and all that

func _on_option_pressed():
	#create an option menu that interacts with values
	pass

func _on_quit_pressed():
	get_tree().quit()
	#save prompt? if we have anything that saves data
