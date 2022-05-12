extends Node2D

#T




func _on_Area2D_area_entered(_area):
	Global.inverse = true


func _on_Area2D_area_exited(_area):
	Global.inverse = false
