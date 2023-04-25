extends CharacterBody2D


@onready var health_area = $Area2D



var max_speed:float = 4500.0
var jump_force:float = 300.0
var gravity:float = 980.0

var _is_live:bool = true

func _ready() -> void:
	health_area.connect("area_entered", _on_hurt)

func _physics_process(_delta):
	if _is_live:
		movement()
		jump()
	falling()




func movement() -> void:
	var direction:float = Input.get_axis("move_left", "move_right")
	var delta_time:float = get_physics_process_delta_time()
	
	if direction:
		velocity.x = direction * max_speed * delta_time
	else:
		velocity.x = move_toward(velocity.x, 0, max_speed * delta_time)

	move_and_slide()

func jump() -> void:
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force

func falling() -> void:
	var delta_time:float = get_physics_process_delta_time()
	if not is_on_floor():
		velocity.y += gravity * delta_time


func _on_hurt(area) -> void:
	if area.is_in_group("Enemy"):
		_is_live = false
