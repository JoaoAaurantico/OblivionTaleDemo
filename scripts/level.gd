extends Node



func _ready():
	if GlobalTimer.timerInit == false:
		GlobalTimer.timerInit = true
		GlobalTimer.resetTimer()
	else:
		GlobalTimer.continueTimer()
	if get_tree().current_scene.name == "level":
		if Global.checkpoint != Vector2(0,0):
				$player.global_position = Global.checkpoint


func _on_Area2D_area_entered(area):
	if area.is_in_group("Player"): 
		GlobalTimer.stopTimer()
		SaveLoader.save_game()
		GlobalTimer.timerInit = false
		SceneChanger.change_scene("res://other/menu.tscn")
