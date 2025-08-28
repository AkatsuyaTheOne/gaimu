# Player scene - uses player module for behavior
extends Area2D

@onready var player_module = $PlayerModule

func _ready() -> void:
	if player_module != null:
		player_module.initialize()

func _process(delta: float) -> void:
	if player_module != null:
		player_module.update(delta)