@tool
extends Node2D

@export_storage var outro_node : Node2D

func _get_configuration_warnings() -> PackedStringArray:
	
	var errors : PackedStringArray = []
	
	if not outro_node:
		errors.append("Erro, node não foi configurado")
	
	return errors

func _ready() -> void:
	
	if Engine.is_editor_hint():
		child_entered_tree.connect(when_child_entered_tree)
		child_exiting_tree.connect(when_child_is_exiting_tree)
		return
		
	outro_node.spawn_sprite()
	
func when_child_entered_tree(node: Node):
	
	if node is Node2D:
		outro_node = node
		notify_property_list_changed()
		
func when_child_is_exiting_tree(node: Node):
	
	if node == outro_node:
		outro_node = null
		notify_property_list_changed()
