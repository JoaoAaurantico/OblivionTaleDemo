extends Node2D

func _ready():
	if Global.chave == true:
		queue_free()

func _on_Area2D_area_entered(_area):
	Global.chave = true
	$AnimationPlayer.play("Coletado")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Coletado":
		queue_free()
