class_name Door
extends RigidBody2D

func _on_body_entered(body):
	apply_central_impulse(body.velocity)
