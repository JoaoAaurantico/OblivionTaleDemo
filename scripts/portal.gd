extends Node2D

func _on_Area2D_area_entered(_area):
	$Portal.play("EntrandoPortal")
	Global.portal = true
	SceneChanger.change_scene("res://other/shi_speak.tscn")
