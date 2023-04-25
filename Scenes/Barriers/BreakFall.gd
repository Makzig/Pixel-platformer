extends AnimatableBody2D


@onready var _sprite:Sprite2D = $Sprite2D
@onready var _timer:Timer = $Timer
@onready var _player_detect:Area2D = $Area2D



var _is_fall:bool = false
var _is_player:bool = false

func _ready() -> void:
	_timer.timeout.connect(_on_timeout)
	_player_detect.body_entered.connect(_on_player_detect)


func _process(_delta):
	if _is_player:_sprite.offset = get_random_offset()



func get_random_offset() -> Vector2:
	var lenght_offset:float = 5.0
	return Vector2(
		lenght_offset * randf_range(-1,1),
		lenght_offset * randf_range(-1,1)
	)

func _on_timeout() -> void:
	_is_fall = true

func _on_player_detect(body) -> void:
	if body.is_in_group("Player"):
		_is_player = true
		_timer.start()
