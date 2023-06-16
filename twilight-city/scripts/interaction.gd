extends Area2D

#setting as export in case the "active" option should be the default, player interaction should toggle this field
#had this as name but did not work
@export var isActive: bool = false
#set these up as active flags, with only two this isn't bad, also allows some settings to be either
@export var isBrain: bool = false
@export var isBrawn: bool = false

@export var activeTarget: Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
#what we need now is for a target to be triggered by the isActive bool
