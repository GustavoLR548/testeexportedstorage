extends Node2D
	
func spawn_sprite() -> void:
	print("spawn!!")
	var sprite = Sprite2D.new()
	
	sprite.texture = load("res://icon.svg")
	
	add_child(sprite)
