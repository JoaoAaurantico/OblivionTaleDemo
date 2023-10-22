extends Node2D

var iniciou = false
export (NodePath) onready var destino
onready var node 
#T

func _ready():
	if (destino): node = get_node(destino)

func _unhandled_input(_event):
	if Input.is_action_just_pressed("ui_interaction") && iniciou == true:
		$AnimationPlayer.play("Fade")

func _on_Area2D_area_entered(_area):
	iniciou = true


func _on_Area2D_area_exited(_area):
	iniciou = false


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Fade":
		get_parent().get_node("player").desativar_suavidade_camera()
		get_parent().get_node("player").global_position = Vector2(node.global_position)
		$AnimationPlayer.play("Fade2")
	if anim_name == "Fade2":
		get_parent().get_node("player").ativar_suavidade_camera()
