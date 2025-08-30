extends Node2D

# Base weapon class for Xistra

class_name Weapon

# Weapon properties
var weapon_name = "Weapon"
var damage = 10
var speed = 1.0
var cooldown = 0.5
var description = ""

# Artifact enhancements
var artifacts = []

func _init(weapon_name, weapon_damage, weapon_speed, weapon_cooldown, weapon_description):
	self.weapon_name = weapon_name
	damage = weapon_damage
	speed = weapon_speed
	cooldown = weapon_cooldown
	description = weapon_description

func apply_artifact(artifact_name):
	# Apply artifact bonuses to weapon
	if not artifact_name in artifacts:
		artifacts.append(artifact_name)
		enhance_with_artifact(artifact_name)

func enhance_with_artifact(artifact_name):
	# Enhance weapon based on artifact
	match artifact_name:
		"figa_1":
			damage += 5
		"figa_2":
			# Special enhancement for Sacho
			if weapon_name == "Sacho":
				# Add ability to throw worms
				pass
		"toxo_1":
			# Special enhancement for Fouce
			if weapon_name == "Fouce":
				# Add ability to imprison enemies
				pass
		"onda_1":
			# Special enhancement for Áncora
			if weapon_name == "Áncora":
				# Add ability to unleash sea wave
				pass