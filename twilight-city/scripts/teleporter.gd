extends Area2D
class_name Teleporter

@export var partnerObject : Teleporter
@export var cooldown = 5.0
var timer = 0.0

# Using Physics Process because swapping two hitboxes on normal process led to some jankiness.
func _physics_process(delta):
	# Dim and brighten the sprite based on how much of the cooldown has elapsed
	timer -= delta
	if(timer < 0):
		get_node("Sprite2D").modulate = Color(.3, 1, .3, 1)
	else:
		var cdp = 1.0 - (max(0, timer) / cooldown) #cooldownPercentage
		get_node("Sprite2D").modulate = Color(cdp, cdp, cdp, 1)
	
	# Check that we have things to teleport
	if(self.get_overlapping_bodies().size() > 0 and partnerObject.get_overlapping_bodies().size() > 0 and self.timer < 0.0):
		var thisbodies = self.get_overlapping_bodies()
		var otherbodies = partnerObject.get_overlapping_bodies()
		for body in thisbodies:
			body.position = partnerObject.position
		for body in otherbodies:
			body.position = self.position
		timer = cooldown
