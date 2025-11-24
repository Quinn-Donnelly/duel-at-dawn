extends Node

var mainMenuScene: PackedScene = preload("res://game/main_menu/main_menu.tscn")
var levelScenes: Array[PackedScene] = [
	load("res://game/scratch/testing.tscn")
]

## Current level loaded with -1 indicating no level loaded
var _current_level: int = -1

func _ready() -> void:
	EventBus.start_game.connect(self._on_start_game)
	EventBus.level_end.connect(self._on_level_end)
	
func _load_level(number: int) -> void:
	assert(number<levelScenes.size(), "Attempted to load level that doesn't exist in GameManager")
	get_tree().change_scene_to_packed(levelScenes[number])
	_current_level = number

func _on_start_game() -> void:
	_load_level(0)

func _on_level_end(outcome: EventBus.LevelOutcome) -> void:
	var message: String = "Good work" if outcome == EventBus.LevelOutcome.Win else "Better luck next time"
	print(message)
