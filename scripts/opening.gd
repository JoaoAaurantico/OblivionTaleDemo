extends Node2D


func _ready():
	SaveLoader.load_game()
	Global.idiomaAtual()
	$AnimationPlayer.play("Logo")


func _on_AnimationPlayer_animation_finished(_anim_name):
	SceneChanger.change_scene("res://other/shi_animation.tscn")
