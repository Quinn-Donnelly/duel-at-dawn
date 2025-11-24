class_name Fighter
extends Node

## Emitted when fighter health depleted
signal died

var healthComponent: HealthComponent

func _ready() -> void:
	healthComponent = owner.get_meta(Constants.HEALTH_COMPONENT)
	assert(healthComponent, "Fighter's parent must have health component. Check tree order")
	healthComponent.health_depleted.connect(self._on_health_depleted)

func _knocked_out() -> void:
	died.emit()

func _on_health_depleted() -> void:
	_knocked_out()
