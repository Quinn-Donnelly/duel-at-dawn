class_name MainMenu
extends Node

@onready var startGameButton: Button = $StartGameButton

func _ready() -> void:
	startGameButton.pressed.connect(self._on_start_game_pressed)
	
func _on_start_game_pressed() -> void:
	EventBus.start_game.emit()
