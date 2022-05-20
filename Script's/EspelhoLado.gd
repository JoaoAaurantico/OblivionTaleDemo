extends Node2D

export (NodePath) onready var destino
onready var node = get_node(destino)

var proximoportal = true

func _process(_delta):
	if Global.chave == true:
		$AnimationPlayer.play("Ativado")
	else:
		$AnimationPlayer.play("Idle")

func tp ():
	if Global.chave == true && proximoportal == true:
		get_parent().get_node("Player").global_position = Vector2(node.global_position) 
		proximoportal = false
		Global.teleporte = true
		$TimerPortal.start()
		

func _on_Area2D_area_entered(_area):
	if Global.chave == true && proximoportal == true:
		$Fades.play("Fade in")

func _on_TimerPortal_timeout():
	$Fades.play("Fade out")
	Global.teleporte = false
	proximoportal = true

func _on_Fades_animation_finished(anim_name):
	if anim_name == "Fade in":
		tp()


func _on_Area2D_area_exited(_area):
	if $Fades.is_playing():
		$Fades.play("RESET")
