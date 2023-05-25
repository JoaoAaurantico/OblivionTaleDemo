extends Node

func _ready():
	if get_tree().current_scene.name == "level":
		if Global.checkpoint != Vector2(0,0):
				$player.global_position = Global.checkpoint
