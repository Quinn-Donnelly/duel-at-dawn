class_name HealthBar
extends Control

@onready var progressBar: ProgressBar = $ProgressBar
@export var fighter: Fighter:
	set(value):
		if fighter:
			var old_health_component: HealthComponent = fighter.get_meta(Constants.HEALTH_COMPONENT)
			old_health_component.health_lowered.disconnect(self._on_lower_health)
		_fighter_health_component = value.get_health_component()
		assert(_fighter_health_component, "fighter must have a health compoennt")
		_fighter_health_component.health_lowered.connect(self._on_lower_health)
		max_health = _fighter_health_component.get_current_health()
		progressBar.max_value = max_health
		progressBar.min_value = 0
		progressBar.ratio = 1
	

var _fighter_health_component: HealthComponent
var max_health: int
	
func _on_lower_health(_loweredBy: int) -> void:
	progressBar.ratio = _fighter_health_component.get_current_health() / float(max_health)
