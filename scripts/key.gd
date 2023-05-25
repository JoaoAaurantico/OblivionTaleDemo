extends Node2D

export var chavenome = "nome"

func _ready():
	if Global.chave == true:
		queue_free()

func _on_Area2D_area_entered(_area):
	Global.chave = true
	$AnimationPlayer.play("Coletado")
	Global.chavenome = chavenome


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Coletado":
		queue_free()
