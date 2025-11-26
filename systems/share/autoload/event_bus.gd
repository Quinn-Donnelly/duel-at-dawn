@warning_ignore_start("unused_signal")
extends Node

signal start_game

## Level
enum LevelOutcome {Win, Loss}
signal level_start
signal level_end(outcome: LevelOutcome)

@warning_ignore_restore("unused_signal")
