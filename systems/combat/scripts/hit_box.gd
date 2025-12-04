class_name HitBox
extends Area2D

@export var damage: int = 5

## fires when hit does not mean damage done
signal hit
signal damage_dealt(damage: int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	owner.set_meta(Constants.HIT_COMPONENT, self)
	area_entered.connect(self._on_hit)
	
func _on_hit(area: Area2D) -> void:
	if area is HurtBox and area.owner != owner:
		hit.emit()

func dealt_damage(damage_done: int) -> void:
	damage_dealt.emit(damage_done)

func get_damage() -> int:
	return damage
	
func _exit_tree() -> void:
	if owner:
		owner.remove_meta(Constants.HIT_COMPONENT)
