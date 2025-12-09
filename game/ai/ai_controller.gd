class_name AiController
extends CharacterBody2D

@onready var fighter: Fighter = $Fighter
var healthComponent: HealthComponent
@onready var particles: GPUParticles2D = $GPUParticles2D

func _ready() -> void:
	healthComponent = get_meta(Constants.HEALTH_COMPONENT)
	assert(healthComponent, "AiController Must have a health component")
	healthComponent.health_depleted.connect(self._on_health_depleted)
	healthComponent.health_lowered.connect(self._on_health_lowered)

func get_fighter() -> Fighter:
	return fighter
	
func _on_health_depleted() -> void:
	queue_free()

func _on_health_lowered(_amount: int) -> void:
	var pm: ParticleProcessMaterial = particles.process_material
	pm.direction = Vector3(1, 0, 0) # this is how I could change it based on direction of hit
	particles.restart()

func _process(_delta: float) -> void:
	move_and_slide()
