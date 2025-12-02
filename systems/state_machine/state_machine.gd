class_name StateMachine
extends Node2D

## The inital state to load in the state machine will default to first state
@export var initalState: State

var _current_state: State
var _availible_states: Dictionary[String, State]

func _ready() -> void:
	for child in get_children():
		if child is State:
			_availible_states[child.name] = child
	
	_current_state = initalState
	if not initalState and _availible_states.size() > 1:
		_current_state = _availible_states.values()[0]
	
	assert(_current_state, "state must not be nil")

func change_state(state_name: String) -> void:
	var target_state: State = _availible_states[state_name]
	assert(target_state, "%s state does not exist in state machine" % state_name)
	if _current_state:
		_current_state.exit()
	target_state.enter()
	_current_state = target_state

func _process(delta: float) -> void:
	_current_state.process(delta)

func _physics_process(delta: float) -> void:
	_current_state.physics_process(delta)

func _unhandled_input(event: InputEvent) -> void:
	_current_state.handle_input(event)
