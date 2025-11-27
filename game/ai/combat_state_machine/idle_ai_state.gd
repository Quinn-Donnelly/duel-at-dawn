class_name IdleAiState
extends State

var combatStateMachine: AiCombatStateMachine

func _ready() -> void:
	combatStateMachine = get_parent() as AiCombatStateMachine
	assert(combatStateMachine is AiCombatStateMachine, "AiIdle must have an AiStateMachine")

func physics_process(_delta: float) -> void:
	if combatStateMachine.get_distance_to_player() < 100:
		state_machine.change_state("MoveAway")
