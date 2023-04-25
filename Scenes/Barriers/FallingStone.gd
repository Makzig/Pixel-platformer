extends Area2D

@onready var _detect_ray:RayCast2D = $RayCast2D

var is_fall:bool = false

func _ready() -> void:
	body_entered.connect(_on_entered)


func _physics_process(delta):
	if _detect_ray.is_colliding():
		if _detect_ray.get_collider().is_in_group("Player"):
			is_fall = true
	if is_fall:
		position.y += 100 * delta


func _on_entered(_body) -> void:
	queue_free()



