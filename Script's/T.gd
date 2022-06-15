extends Node2D

var iniciou = false
#T

func _unhandled_input(_event):
	if Input.is_action_just_pressed("ui_inverse") && iniciou == true:
		$AnimationPlayer.play("Fade")

func _on_Area2D_area_entered(_area):
	iniciou = true


func _on_Area2D_area_exited(_area):
	iniciou = false


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Fade":
		get_parent().get_node("Mapa").scale.y *= -1
		get_parent().get_node("ParallaxBackground/Sprite").scale.y *= -1
		$AnimationPlayer.play("Fade2")
