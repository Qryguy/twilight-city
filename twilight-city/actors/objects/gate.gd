extends StaticBody2D

#simple script that opens or closes a door based on the interaction area for a given terminal or whatever

@export var interactArea: Area2D

var collider: CollisionShape2D

func _ready():
	collider = get_node("CollisionShape2D")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	collider.disabled = interactArea.isActive
	print(collider.disabled)
