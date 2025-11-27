class_name State
extends Node2D

var state_machine: StateMachine

func _ready() -> void:
	state_machine = get_parent() as StateMachine
	assert(state_machine is StateMachine, "parent of state must be a state machine")

func enter() -> void:
	pass

func exit() -> void:
	pass

func handle_input(_event: InputEvent) -> void:
	pass
	
func process(_delta: float) -> void:
	pass

func physics_process(_delta: float) -> void:
	pass
