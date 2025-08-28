extends Node2D

func _ready():
	# Create a simple visual representation for the game icon
	var viewport = get_tree().get_root().get_viewport()
	var size = viewport.size
	
	# Draw a simple circle with a border
	var bg = Color(0.2, 0.2, 0.2)
	var fg = Color(0.8, 0.8, 0.8)
	var border = Color(0.5, 0.5, 0.5)
	
	# Draw background
	draw_rect(Rect2(Vector2(), size), bg, true)
	
	# Draw circle
	var center = size / 2
	var radius = min(size.x, size.y) / 3
	draw_circle(center, radius, fg)
	
	# Draw border
	draw_circle(center, radius + 2, border)
	draw_circle(center, radius - 2, border)