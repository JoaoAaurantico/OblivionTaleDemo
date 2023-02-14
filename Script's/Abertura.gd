extends Node2D

var iniciado = 1

func _ready():
	SaveLoader.load_game()
	Global.idiomaAtual()
	$AnimationPlayer.play("Logo")

func _unhandled_input(event):
	if event.is_action_pressed("ui_end") and iniciado == 1:
		$AnimationPlayer.play("Logo", 0, 100)
		iniciado -= 1

func _on_AnimationPlayer_animation_finished(_anim_name):
	SceneChanger.change_scene("res://Gui and Stuff/Shi Animação.tscn")
