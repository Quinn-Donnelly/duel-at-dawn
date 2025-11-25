class_name UI
extends Node

@onready var playerHealthBar: HealthBar = $CombatUi/PlayerHealthBar
@onready var opponenetHealthBar: HealthBar = $CombatUi/OpponentHealthBar
@onready var combatUi: CanvasLayer = $CombatUi

func _ready() -> void:
	EventBus.level_start.connect(self._on_level_start)
	combatUi.hide()

func _on_level_start() -> void:
	combatUi.show()
	var level: Level = GameManager.get_current_level()
	playerHealthBar.fighter = level.get_player()
	opponenetHealthBar.fighter = level.get_opponent()
	
