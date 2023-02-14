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
	if Global.espelho == 0:
		Global.portal = true
		SceneChanger.change_scene("res://Cenas/Fases/Fase01.tscn")
	if Global.espelho == 1:
		Global.portal = true
		SceneChanger.change_scene("res://Cenas/Fases/Fase02.tscn")
	if Global.espelho == 2:
		Global.portal = true
		SceneChanger.change_scene("res://Cenas/Fases/Fase03.tscn")
	if Global.espelho == 3:
		Global.portal = true
		SceneChanger.change_scene("res://Cenas/Fases/Fase04.tscn")
