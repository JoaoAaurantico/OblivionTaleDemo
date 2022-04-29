extends Node2D

var iniciado = 1

func _ready():
	alterartexto()
	$AnimationPlayer.play("Entrada Shi")

func alterartexto():
	if Global.ingles == true:
		$CanvasLayer/Voce1.text = "You are still incomplete, but do not worry... I will help you to evolve..."
		$CanvasLayer/Voce2.text = "I promise..."

func _unhandled_input(event):
	if event.is_action_pressed("ui_end") && iniciado == 1:
		AudioGeral.emit_signal("iniciar", "LoopMenu")
		$AnimationPlayer.play("Entrada Shi", 0, 100)
		iniciado -= 1

func _on_AnimationPlayer_animation_finished(_anim_name):
	SceneChanger.change_scene("res://Script's/Gui and Stuff/Menu.tscn")
