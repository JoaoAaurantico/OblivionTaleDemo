extends Node2D

export var cor : Color

func _ready():
	$Particulas/Triangulo.modulate = cor
	$Label.text = Global.idioma.NPC[1]


func _on_Area2D_area_entered(area):
	if area.is_in_group("Player"):
		$Text.play("Text")


func _on_Area2D_area_exited(area):
	if area.is_in_group("Player"):
		$Text.play("RESET")
