extends Node2D

export var numero = 1
var estado: int = 3
var proximo = false

func _process(_delta):
	if proximo == false && estado == 1:
		$Text.play("RESET")
		estado = 3
		

func _ready():
	$CanvasLayer.visible = true
	$Select.visible = false
	$CanvasLayer/Control/RichTextLabel.text = Global.idioma.Notes[numero]

func _unhandled_input(_event):
	if Input.is_action_just_pressed("ui_inverse"):
		ativo()

func ativo():
	if proximo == true:
		if estado == 1:
			estado = 0
		else:
			estado = 1
	animacao()


func animacao():
	match estado:
		1:
			$Text.play("Text")
		0:
			$Text.play("RESET")
		3:
			$Text.play("Idle")

func _on_Area2D_area_entered(area):
	$Select.visible = true
	if area.is_in_group("Player"):
		proximo = true


func _on_Area2D_area_exited(area):
	$Select.visible = false
	if area.is_in_group("Player"):
		proximo = false

