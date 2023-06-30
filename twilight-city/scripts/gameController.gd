extends Node

@onready var gameOverScreen: CanvasLayer = get_node("%Game Over Screen")
#@onready var playerBrain: playerController = get_node("%brain")
#@onready var playerBrawn: playerController = get_node("%brawn")
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
	print(gameOverScreen.name)
#	if playerBrain.health == 0 && playerBrawn.health == 0:
#		gameOverScreen.visible = true
#		var new_paused_state = not get_tree().paused
#		get_tree().paused = new_paused_state
