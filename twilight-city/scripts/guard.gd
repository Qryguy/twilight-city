extends RigidBody2D

#@export var vision_renderer: Polygon2D
#@export var alert_color: Color

@export_group("Rotation")
@export var is_rotating = false
@export var rotation_speed = 0.1
@export var rotation_angle = 90

@export_group("Movement")
@export var move_on_path: PathFollow2D
@export var movement_speed = 0.1
@onready var pos_start = position.x

#@onready var original_color = vision_renderer.color if vision_renderer else Color.WHITE
@onready var rot_start = rotation

func _on_guard_attack_body_entered(body):
	if body.name == "brawn"|| body.name == "brain":
		body.health -= 1
	print(body.name)

func _process(_delta):
	self.transform

func _physics_process(delta: float) -> void:
	if is_rotating:
		rotation = rot_start + sin(Time.get_ticks_msec()/1000. * rotation_speed) * deg_to_rad(rotation_angle/2.)
	if move_on_path:
		move_on_path.progress += movement_speed
		global_position = move_on_path.position
		rotation = move_on_path.rotation
