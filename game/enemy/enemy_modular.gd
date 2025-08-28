# Enemy scene - uses enemy module for behavior
extends Area2D

@onready var enemy_module = $EnemyModule

func _ready() -> void:
	if enemy_module != null:
		enemy_module.initialize()

func _process(delta: float) -> void:
	if enemy_module != null:
		enemy_module.update(delta)