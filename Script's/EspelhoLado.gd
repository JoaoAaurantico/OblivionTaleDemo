extends Node2D

var proximoportal = true
export var number = 1
var valoranterior = 1

func _process(_delta):
	if Global.chave == true:
		$AnimationPlayer.play("Ativado")
	else:
		$AnimationPlayer.play("Idle")
func _ready():
	if number == 1:
		Global.teleposicao1 = $Ponto.global_position
	elif number == 2:
		Global.teleposicao2 = $Ponto.global_position

func tp ():
	if Global.chave == true && number == 1 && proximoportal == true:
		get_parent().get_node("Player").global_position = Global.teleposicao2
		proximoportal = false
		Global.teleporte = true
		$TimerPortal.start()
	elif Global.chave == true && number == 2 && proximoportal == true:
		get_parent().get_node("Player").global_position = Global.teleposicao1
		proximoportal = false
		Global.teleporte = true
		$TimerPortal.start()

func _on_Area2D_area_entered(_area):
	valoranterior = number
	if Global.chave == true && proximoportal == true:
		$Fades.play("Fade in")
	
func _on_Area2D_area_exited(_area):
	number = valoranterior

func _on_TimerPortal_timeout():
	$Fades.play("Fade out")
	Global.teleporte = false
	proximoportal = true

func _on_Fades_animation_finished(anim_name):
	if anim_name == "Fade in":
		valoranterior = number
		tp()
