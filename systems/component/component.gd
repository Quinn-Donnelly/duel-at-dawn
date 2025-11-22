class_name Component
extends Node

func _ready() -> void:
	owner.set_meta(get_class(), self)
	
func _exit_tree() -> void:
	owner.remove_meta(get_class())
