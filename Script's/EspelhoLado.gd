extends Node2D

export (NodePath) onready var destino
onready var node 

var proximoportal = true
export var cadeadonome = ""
var ativo = false

func _ready():
	if (destino): node = get_node(destino)

func atividade():
	if Global.chavenome == cadeadonome:
		ativo = true

func _process(_delta):
	atividade()
	if Global.chave == true && ativo == true:
		$AnimationPlayer.play("Ativado")
	else:
		$AnimationPlayer.play("Idle")

func tp ():
	if Global.chave == true && proximoportal == true && ativo == true:
		get_parent().get_node("Player").global_position = Vector2(node.global_position) 
		proximoportal = false
		Global.teleporte = true
		$TimerPortal.start()
		

func _on_Area2D_area_entered(_area):
	if Global.chave == true && proximoportal == true && ativo == true:
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
