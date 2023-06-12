extends CharacterBody2D
#probably should have just made these separate scripts but whatever
@export var unitName: String
@export var speed = 300.0
@export var health = 1

var playerControl: String


func _ready():
	#set unit controls and settings, set brawn as default? to avoid annoying errors
	if len(unitName) == 0:
		unitName = "brawn"
	if unitName == "brawn":
		playerControl = "player1"
	if unitName == "brain":
		playerControl = "player2"
	print(playerControl)

#process for standard inputs, actually should probably change this to some kind of collider?
func _process(_delta):
	_input_map(unitName)
	if health == 0:
		#gameover
		get_tree().change_scene_to_file("res://twilight-city/scenes/menus/gameOver.tscn")

#physics for movement
func _physics_process(_delta):
	##use delta for time based 
	var xDirection = Input.get_axis(playerControl+"_left", playerControl+"_right")
	if xDirection:
		velocity.x = xDirection * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	var yDirection = Input.get_axis(playerControl+"_up", playerControl+"_down")
	if yDirection:
		velocity.y = yDirection * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)

	move_and_slide() #seems to apply the actual movement

func _input_map(unit):
	#have this var be the input key instead?
	#var keyPress =
	if Input.is_action_just_pressed("back_menu"):
		#sets the pause menu, but does this get called...might need to move this out of the player character?
		#not really sure the best way to do this, I might have approached this poorly from the start as well.
		get_tree().paused = not get_tree().paused
		#instantiate this scene atop the scene
		get_tree().change_scene_to_file("res://twilight-city/scenes/menus/gameOver.tscn")
		
	
	#might need to add a bunch of logic and what not for interaction...might be it's own function set(s)
	if unit == "":
		pass
	
