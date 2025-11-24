class_name AiController
extends Node

@onready var fighter: Fighter = $Fighter
var healthComponent: HealthComponent

func _ready() -> void:
	healthComponent = get_meta(Constants.HEALTH_COMPONENT)
	assert(healthComponent, "AiController Must have a health component")
	healthComponent.health_depleted.connect(self._on_health_depleted)

func get_fighter() -> Fighter:
	return fighter
	
func _on_health_depleted() -> void:
	queue_free()
