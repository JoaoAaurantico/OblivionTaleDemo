extends Node

func _ready():
	Global.portal = false
	if get_tree().current_scene.name == "Fase01":
		if Global.checkpoint != Vector2(0,0):
			$Player.global_position = Global.checkpoint


func _unhandled_input(_event):
	if get_tree().current_scene.name == "Fase01":
		if Input.is_action_just_pressed("ui_inverse") && Global.inverse == true:
			$Mapa.scale.y *= -1
