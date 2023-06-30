extends hackable

@export var Theta = 0.0 # how many degrees the camera will sweep left and right.  1/2 of the total angle it sweeps.  Setting this to 0 means the camera is static
@export var SweepSpeed = 1.0
@export var SweepPauseLength = 2.0
var pauseTimer = 0.0
var sweepingLeft = true
var startingRot : float

func _ready():
	startingRot = self.rotation
	Theta = deg_to_rad(Theta)
	if(!self.has_node("VisionCone2D")):
		assert("No vision cone is present in Camera " + self.name)
	if(!self.has_node("VisionCone2D/VisionConeArea")):
		assert("No vision area is present in Camera " + self.name)
		
func _physics_process(delta):
	if(!self.disabled):
		pauseTimer -= delta
		if(pauseTimer < 0.0):
			if(rotation > (startingRot - Theta) && rotation < (startingRot + Theta)):
				if(sweepingLeft):
					rotation -= delta * SweepSpeed
				else:
					rotation += delta * SweepSpeed
			else:
				if(rotation > startingRot + Theta):
					rotation = startingRot + Theta - 0.001
				if(rotation < startingRot - Theta):
					rotation = startingRot - Theta + 0.001
				sweepingLeft = !sweepingLeft
				pauseTimer = SweepPauseLength

func on_hack():
	var node = self.get_node("VisionCone2D")
	var areaCol = self.get_node("VisionCone2D/VisionConeArea/VisionConeCollider")
	node.set_process(!node.can_process())
	node.hide()
	areaCol.disabled = true
	self.disabled = true
