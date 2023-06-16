extends CharacterBody2D
class_name playerController
#probably should have just made these separate scripts but whatever
@export var unitName: String
@export var speed = 300.0
@export var health = 1;

@onready var gameOverScreen: CanvasLayer = get_node("%Game Over Screen")

var playerControl: String
var partner: CharacterBody2D
var interactArea: Area2D #use this for guard weakpoint, interaction, etc

#states, use for animations later
var isLocked = false #set this to true when the player shouldn't be able to move or anything
var isIdling: bool
var isWalking: bool
var isUsing: bool
var isDowned: bool

func _ready():
	#set unit controls and settings, set brawn as default? to avoid annoying errors
	if len(unitName) == 0:
		print("NO UNIT SELECTED")
		get_tree().quit()
	if unitName == "brawn":
		playerControl = "player1"
		partner = get_node("%brain")
	if unitName == "brain":
		playerControl = "player2"
		partner = get_node("%brawn")

#process updates on every frame
func _process(_delta):
	playerUse()
	#should move gameover state to "game controller" and check that both players are downed
	if health == 0:
		#gameover		
		gameOverScreen.visible = true
		var new_paused_state = not get_tree().paused
		get_tree().paused = new_paused_state
		visible = new_paused_state

#physics for movement
func _physics_process(_delta):
	##use delta for time based physics e.g. gravity
	if not isLocked:
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

		move_and_slide()

#this is the input side of things, but what it needs now is to send this value to the area2D > activation target, e.g. gate/door/etc
	#need to work out the flags on this, isUsing should just be animation I think
	#when pressed, should toggle the target object
		#mash logic - probably shelve this for now
		#if mash required, should toggle object while pressing movement keys
		#when correct movement key is pressed, a new key should be chosen and the timer reset
		#toggles to original state if randkey not pressed for 2 sec or 
func playerUse(): #add delta here and pass in from process if doing anything with the mashing stuff
	if interactArea != null: #checks that the area is a valid object
		if Input.is_action_just_pressed(playerControl+"_use"):
			if self.name == "brawn" && not interactArea.isBrawn:
				return
			if self.name == "brain" && not interactArea.isBrain:
				return
			else:
				print("playerUsedKeyPressed")
				var new_active_state = not interactArea.isActive
				interactArea.isActive = new_active_state
				#play animation?
		#must mash which forces the player to press movement keys
#		if interactArea.mustMash:
#			var buttonArray = ["_up", "_down", "_left", "_right"]
#			#figure out how to add some time delay, like 2 secs or something
#			#should basically say if array action not pressed in X secs, set activated to false
#			isUsing = Input.is_action_just_pressed(playerControl+buttonArray[randi() % 3])
#			if isUsing: #if true, pressing again will disable - probably better way to reverse this toggle
#				isUsing = not isUsing
	#this is where the code for  

func _on_area_entered(area):
	interactArea = area

func _on_area_exited(area):
	#when leaving the space set to null
	interactArea = null
