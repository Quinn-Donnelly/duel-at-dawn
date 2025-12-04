class_name HitFlash
extends Node

@export var health_component: HealthComponent
@export var animation_player: AnimationPlayer

func _ready() -> void:
	if not health_component:
		health_component = owner.get_meta(Constants.HEALTH_COMPONENT)
	
	assert(health_component, "Hit Flash requires a hurtbox")
	assert(animation_player, "Hit Flash requires an animation player")
	health_component.health_lowered.connect(self._animate_flash)

func _animate_flash(_amount: int) -> void:
	animation_player.play("flash")
