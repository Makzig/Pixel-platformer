extends Control


@onready var _buttons:Control = $Buttons
@onready var _label:Label = $Label

var _is_taped:bool = false


func _ready() -> void:
	_buttons.visible = false

func _input(event):
	if event is InputEventScreenTouch and !_is_taped:
		_is_taped = true
		anim_start()


func anim_start() -> void:
	var tween := create_tween().set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_IN_OUT)
	_label.scale = Vector2.ONE * 1.3
	tween.tween_property(_label, "scale", Vector2.ZERO, 1)
	await tween.finished
	_buttons.visible = true
