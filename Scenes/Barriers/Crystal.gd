extends Area2D
class_name Crystal

@onready var _animation_player:AnimationPlayer = $AnimationPlayer

signal picked

func _ready() -> void:
	body_entered.connect(_on_entered)



func _on_entered(body) -> void:
	if body.is_in_group("Player"):
		_animation_player.play("Picked")
