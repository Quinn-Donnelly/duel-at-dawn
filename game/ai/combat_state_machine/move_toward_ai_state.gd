class_name MoveTowardAiState
extends State

var state_machine: AiCombatStateMachine

func _ready() -> void:
	state_machine = get_parent() as AiCombatStateMachine
	assert(state_machine, "parent must be an AiCombatStateMachine")

func enter() -> void:
	var timer: SceneTreeTimer = get_tree().create_timer(0.5)
	timer.timeout.connect(self._transition_out)
	owner.velocity.x -= state_machine.state.move_speed

func exit() -> void:
	owner.velocity = Vector2.ZERO
	
func _transition_out() -> void:
	state_machine.change_state("Idle")
