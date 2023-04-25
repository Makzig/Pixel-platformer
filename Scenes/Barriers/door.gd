extends StaticBody2D

@export_node_path("Crystal") var crystal

@onready var _crystal:Crystal = get_node(crystal)
@onready var _anim_player:AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	if _crystal:crystal.connect(_on_crystal_picked)




func _on_crystal_picked() -> void:
	_anim_player.play("Destroyed")

