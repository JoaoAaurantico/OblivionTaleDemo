extends Node2D

export (NodePath) onready var destino
onready var node 

var proximoportal = false

func _ready():
	if (destino): node = get_node(destino)

func tp ():
	if proximoportal == true:
		get_parent().get_node("Player").global_position = Vector2(node.global_position) 
		proximoportal = false

func _unhandled_input(_event):
	if Input.is_action_just_pressed("ui_inverse") && proximoportal == true:
		tp()

func _on_Area2D_area_entered(_area):
	proximoportal = true
	


func _on_Area2D_area_exited(_area):
	proximoportal = false
