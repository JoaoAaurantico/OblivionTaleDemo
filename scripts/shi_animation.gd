extends Node2D

func _ready():
	IdiomaShiAnm()
	$AnimationPlayer.play("Entrada Shi")

func _on_AnimationPlayer_animation_finished(_anim_name):
	SceneChanger.change_scene("res://other/menu.tscn")

func IdiomaShiAnm():
	$CanvasLayer/ShiText.text = Global.idioma.ShiAnimacao["animacao"]
