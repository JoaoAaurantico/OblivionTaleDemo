extends Node2D

var iniciado = 1

func _ready():
	alterartexto()
	$AnimationPlayer.play("Entrada Shi")

func alterartexto():
	pass

func _unhandled_input(event):
	if event.is_action_pressed("ui_end") && iniciado == 1:
		$AnimationPlayer.play("Entrada Shi", 0, 100)
		iniciado -= 1

func _on_AnimationPlayer_animation_finished(_anim_name):
	SceneChanger.change_scene("res://Script's/Gui and Stuff/Menu.tscn")
