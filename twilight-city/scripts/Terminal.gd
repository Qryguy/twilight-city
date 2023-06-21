extends Node

enum TERMINAL_TYPE {UNKNOWN, INSTANT, TIMED_SUCCESS, CONSTANT}
# Determines how the terminal performs its hack
# INSTANT - The player just needs to approach the terminal and it instantly hacks whatever it's attached to (We're going to start with this one, maybe not even do the other two)
# TIMED_SUCCESS - The player needs to hack for a certain amount of time before the hack occurs
# CONSTANT - The player must constantly be hacking for the hack to occur; if the player stops hacking, the hacked item returns to its usual state

@export var pairObject : hackable
@export var termType = TERMINAL_TYPE.UNKNOWN
var hackComplete = false

func _ready():
	if(termType == TERMINAL_TYPE.UNKNOWN):
		push_warning("Terminal type not assigned, defaulting to INSTANT")
		termType = TERMINAL_TYPE.INSTANT
	
func _process(_delta):
	if(!hackComplete):
		var bodies = self.get_node("UsageBoundary").get_overlapping_bodies()
		for body in bodies:
			if(body.name == "brain"):
				print("Brain has hacked the " + pairObject.name)
				pairObject.on_hack()
				hackComplete = true
				break
