class_name Level
extends Node

## Player charecter reference
@export var player: Player
## Enemy player
@export var enemy: AiController

var roundStart: bool = false
var playerFighter: Fighter
var oppenentFighter: Fighter

func _ready() -> void:
	assert(player, "Level must have a player configured")
	playerFighter = player.get_fighter()
	assert(playerFighter, "player must have a fighter configured")
	playerFighter.died.connect(self._on_player_died)
	assert(enemy, "Level must have an enemy configured")
	oppenentFighter = enemy.get_fighter()
	assert(oppenentFighter, "opponenet must have a fighter configured")
	oppenentFighter.died.connect(self._on_enemy_died)
	_round_start()

func get_player() -> Fighter:
	return playerFighter
	
func get_opponent() -> Fighter:
	return oppenentFighter

func _round_start() -> void:
	EventBus.level_start.emit()

func _round_end(didWin: bool) -> void:
	var outcome = EventBus.LevelOutcome.Win if didWin else EventBus.LevelOutcome.Loss
	EventBus.level_end.emit(outcome)

func _on_player_died() -> void:
	_round_end(false)

func _on_enemy_died() -> void:
	_round_end(true)
