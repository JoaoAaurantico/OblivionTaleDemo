extends Node2D

var iniciado = 1

func _ready():
	AudioGeral.emit_signal("iniciar", "abertura")
	AudioGeral.emit_signal("iniciar", "uiambience")
	SaveLoader.load_game()
	$AnimationPlayer.play("Logo")

func _unhandled_input(event):
	if event.is_action_pressed("ui_end") and iniciado == 1:
		$AnimationPlayer.play("Logo", 0, 100)
		iniciado -= 1

func _on_AnimationPlayer_animation_finished(_anim_name):
	SceneChanger.change_scene("res://Script's/Gui and Stuff/Shi Animação.tscn")
