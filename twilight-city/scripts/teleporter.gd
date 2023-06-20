extends Area2D

var partnerObject
var timer = 0.0
var cooldown = 5.0

# Called when the node enters the scene tree for the first time.
func _ready():
	# This is hella janky, but in order to get the other teleporter that this one swaps its cargo to, you have to create a metadata
	# object on each teleporter in the editor, type NodePath, pointing to the other teleporter, and you specifically have to name
	# that metadata "PartnerPath".  I'm sure there's a better way to link two objects together, this seems unsustainable.
	var partnerString = get_meta("PartnerPath")
	partnerObject = get_node(partnerString)

# Using Physics Process because swapping two hitboxes on normal process led to some jankiness.
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
