# Base module class for all game modules
# All modules should inherit from this class to ensure consistent interface
class_name BaseModule
extends Node

# Called when the module is initialized
func initialize() -> void:
	pass

# Called when the module is cleaned up
func cleanup() -> void:
	pass

# Called each frame
func update(delta: float) -> void:
	pass

# Insert here your new module-specific methods
# func your_custom_method() -> void:
#     pass