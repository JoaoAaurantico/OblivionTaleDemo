extends Node

func _ready():
	Global.portal = false
	if get_tree().current_scene.name == "Fase01":
		if Global.checkpoint != Vector2(0,0):
			$Player.global_position = Global.checkpoint

func _on_Area2D_area_entered(_area):
	if get_tree().current_scene.name == "Fase01":
		$AnimationPlayer.play("Mapa")
