extends Control
var iniciado = 1
func _ready():
	$CanvasLayer/AnimationPlayer.play("Teclando")

func texto():
	pass

func _unhandled_input(event):
	if event.is_action_pressed("ui_end") && iniciado == 1:
		$CanvasLayer/AnimationPlayer.play("Teclando", 0, 100)
		iniciado -= 1
		

func _on_AnimationPlayer_animation_finished(_anim_name):
	Global.portal = true
	SceneChanger.change_scene("res://Cenas/Fases/Fase.tscn")

