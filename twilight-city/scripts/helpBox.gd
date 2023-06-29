extends CanvasLayer
class_name textBox
#This should fade in when a player touches a certain space.

const characterReadRate = 0.5

@onready var textboxContainer = $TextboxContainer
@onready var label = $TextboxContainer/MarginContainer/HBoxContainer/Label

@export_multiline var labelText

# Called when the node enters the scene tree for the first time.
func _ready():
	hide_textbox()

func hide_textbox():
	label.text = ""
	textboxContainer.hide()

func show_textbox():
	add_text(labelText)
	
func add_text(next_text):
	label.text = next_text
	textboxContainer.show()
	
	var tween = Tween.new();
	#tween.tween_property(label, "visibility_ratio")
	tween.tween_property(label, "visible_ratio", 1.0, len(next_text) * characterReadRate)

func _on_area_2d_body_entered(body):
	add_text(labelText)

func _on_area_2d_body_exited(body):
	hide_textbox()
