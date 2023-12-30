extends Node

func _ready():
	AudioSFX.level1("play")
	if GlobalTimer.timerInit == false:
		GlobalTimer.resetTimer()
		GlobalTimer.timerInit = true
	else:
		GlobalTimer.continueTimer()
	if get_tree().current_scene.name == "level":
		if Global.checkpoint != Vector2(0,0):
				#Globaltimer init dentro do checkpoint
				$player.global_position = Global.checkpoint

func _on_Area2D_area_entered(area):
	if area.is_in_group("Player"):
		AudioSFX.level1("stop")
		Global.toggleCapturarMouse()
		Achievement.registerAch() 
		GlobalTimer.stopTimer()
		Global.save_record()
		SaveLoader.save_game()
		GlobalTimer.timerInit = false
		SceneChanger.change_scene("res://other/menu.tscn")
