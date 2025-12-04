class_name HitStop
extends Node

## How long in seconds to apply the slow down
@export var stop_duration: float
## How much to slow time
@export var stop_time_scale: float

func hit_stop(time_scale: float = stop_time_scale, duration: float = stop_duration) -> void:
	var original_time_scale = Engine.time_scale
	Engine.time_scale = time_scale
	await get_tree().create_timer(duration * time_scale).timeout
	Engine.time_scale = original_time_scale
