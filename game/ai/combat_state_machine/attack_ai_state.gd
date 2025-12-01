class_name AttackAiState
extends State

@export var punch_cooldown: Timer
@export var animation_player: AnimationPlayer


var state_machine: AiCombatStateMachine

func _ready() -> void:	
	state_machine = get_parent() as AiCombatStateMachine
	assert(state_machine is AiCombatStateMachine, "parent of state must be a state machine")
	assert(punch_cooldown, "attack ai state must have a punch cooldown")
	assert(animation_player, "attack ai state must have animation player")

func enter() -> void:
	animation_player.animation_finished.connect(self._on_animation_finished)
	
func process(_delta: float) -> void:
	if punch_cooldown.is_stopped() and animation_player.current_animation != "punch":
		# for now having cooldown at start to avoid potential race
		punch_cooldown.start()
		animation_player.play("punch")

func exit() -> void:
	animation_player.animation_finished.disconnect(self._on_animation_finished)

func _on_animation_finished(animation_name: String) -> void:
	if animation_name == "punch":
		state_machine.change_state("Idle")
