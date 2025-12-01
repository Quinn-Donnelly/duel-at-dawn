class_name AttackAiState
extends State

@export var punch_cooldown: Timer
@export var animation_player: AnimationPlayer
@export var attackDelay: Curve

var state_machine: AiCombatStateMachine
var isPunching: bool = false

func _ready() -> void:	
	state_machine = get_parent() as AiCombatStateMachine
	assert(state_machine is AiCombatStateMachine, "parent of state must be a state machine")
	assert(punch_cooldown, "attack ai state must have a punch cooldown")
	assert(animation_player, "attack ai state must have animation player")

func enter() -> void:
	animation_player.animation_finished.connect(self._on_animation_finished)
	
func process(_delta: float) -> void:
	if punch_cooldown.is_stopped() and not isPunching:
		# for now having cooldown at start to avoid potential race
		isPunching = true
		var delay = attackDelay.sample(randf())
		var timer = get_tree().create_timer(delay)
		timer.timeout.connect(_do_punch)

func exit() -> void:
	animation_player.animation_finished.disconnect(self._on_animation_finished)

func _do_punch() -> void:
	punch_cooldown.start()
	animation_player.play("punch")

func _on_animation_finished(animation_name: String) -> void:
	if animation_name == "punch":
		isPunching = false
		state_machine.change_state("Idle")
