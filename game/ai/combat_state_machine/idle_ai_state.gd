class_name IdleAiState
extends State

## Range on the punch that should look to take action

@export var punch_cooldown: Timer
var combatStateMachine: AiCombatStateMachine
var state_transitioning: bool = false

func _ready() -> void:
	assert(punch_cooldown, "must have punch cooldown")
	combatStateMachine = get_parent() as AiCombatStateMachine
	assert(combatStateMachine is AiCombatStateMachine, "AiIdle must have an AiStateMachine")

func enter() -> void:
	state_transitioning = false

func physics_process(_delta: float) -> void:
	var distance_to_player: float = abs(combatStateMachine.get_distance_to_player())
	if distance_to_player <= combatStateMachine.state.punch_range and punch_cooldown.is_stopped():
		_transition_to("Attack")
	
	if punch_cooldown.is_stopped():
		_transition_to("MoveToward")
	else:
		_transition_to("MoveAway")

func _transition_to(state_name: String) -> void:
	if not state_transitioning:
		state_transitioning = true
		combatStateMachine.change_state(state_name)
