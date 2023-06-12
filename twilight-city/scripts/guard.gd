extends RigidBody2D

func _on_guard_attack_body_entered(body):
	if body.name == "brawn"|| body.name == "brain":
		body.health -= 1
	print(body.name)
