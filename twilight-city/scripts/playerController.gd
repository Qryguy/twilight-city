extends CharacterBody2D
class_name playerController
#probably should have just made these separate scripts but whatever
@export var unitName: String
@export var speed = 300.0
@export var health = 1;

@onready var gameOverScreen: CanvasLayer = get_node("%Game Over Screen")

var playerControl: String

func _ready():
	#set unit controls and settings, set brawn as default? to avoid annoying errors
	if len(unitName) == 0:
		unitName = "brawn"
	if unitName == "brawn":
		playerControl = "player1"
	if unitName == "brain":
		playerControl = "player2"
	print(gameOverScreen.visible)

#process updates on every frame
func _process(_delta):
	if health == 0:
		#gameover		
		gameOverScreen.visible = true
		var new_paused_state = not get_tree().paused
		get_tree().paused = new_paused_state
		visible = new_paused_state

#physics for movement
func _physics_process(_delta):
	##use delta for time based physics e.g. gravity
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
