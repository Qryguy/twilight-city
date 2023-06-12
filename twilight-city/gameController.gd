##This is the script that manages the game settings and all that.
	#I think the way we would do this in Godot is to have this scene always running but instantiate the "child scenes" when selected...?

extends Node2D
#Determine the scene to Instantiate
var currentScene: SceneTree
#Determine a scene to overlay: Main HUD, Pause Menu or Game Over screen
var currentOverlay: SceneTree

# Config Class : https://docs.godotengine.org/en/stable/classes/class_configfile.html#class-configfile
## Create new ConfigFile object.
#var config = ConfigFile.new()
#
## Store some values.
#config.set_value("Player1", "player_name", "Steve")
#config.set_value("Player1", "best_score", 10)
#
## Save it to a file (overwrite if already exists).
#config.save("user://scores.cfg")

#Settings we should add:
	#Fullscreen
	#Game Size
	#Volume Slider(s)
	#Font Size?

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
