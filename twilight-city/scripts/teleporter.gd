extends Area2D

var partnerObject
var timer = 0.0
var cooldown = 5.0

# Called when the node enters the scene tree for the first time.
func _ready():
	var partnerString = get_meta("PartnerPath")
	partnerObject = get_node(partnerString)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var cdp = 1.0 - (max(0, timer) / cooldown) #cooldownPercentage
	get_node("Sprite2D").modulate = Color(cdp, cdp, cdp, 1)
	timer -= delta
	if(self.has_overlapping_bodies and partnerObject.has_overlapping_bodies and timer < 0.0):
		var thisbodies = self.get_overlapping_bodies()
		var otherbodies = partnerObject.get_overlapping_bodies()
		for body in thisbodies:
			body.position = partnerObject.position
		for body in otherbodies:
			body.position = self.position
		timer = cooldown
