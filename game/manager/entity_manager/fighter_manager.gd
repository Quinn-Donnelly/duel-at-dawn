class_name FighterManager
extends Node

var instances: Dictionary[int, Fighter]

func add_fighter(fighter: Fighter) -> void:
	instances[fighter.get_instance_id()] = fighter
	
func remove_fighter(fighter: Fighter) -> void:
	instances.erase(fighter.get_instance_id())
