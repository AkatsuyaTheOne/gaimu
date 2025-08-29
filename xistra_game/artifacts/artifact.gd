extends Area2D

# Base artifact class

class_name Artifact

# Artifact properties
var name = "Artifact"
var description = ""
var effect = ""
var collected = false

func _on_body_entered(body):
	# When player collects artifact
	if body.name == "Xacinta" and not collected:
		collected = true
		collect()

func collect():
	# Handle artifact collection
	get_parent().get_node("GameManager").collect_artifact(name)
	queue_free()