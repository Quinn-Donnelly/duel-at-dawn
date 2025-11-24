class_name Fighter
extends Node

## Emitted when fighter health depleted
signal died

var healthComponent: HealthComponent
var fighterManager: FighterManager

func _ready() -> void:
	healthComponent = owner.get_meta(Constants.HEALTH_COMPONENT)
	assert(healthComponent, "Fighter's parent must have health component. Check tree order")
	healthComponent.health_depleted.connect(self._on_health_depleted)
	fighterManager = GameManager.get_fighter_manager()
	assert(fighterManager, "fighter failed to wire fighter manager")
	fighterManager.add_fighter(self)

func _exit_tree() -> void:
	fighterManager.remove_fighter(self)

func _knocked_out() -> void:
	died.emit()

func _on_health_depleted() -> void:
	_knocked_out()
