extends Node2D

export var inicio: int
export var final: int
var next: int
var estado: int = 3
var proximo = false

func _process(_delta):
	if proximo == false && estado == 1:
		$Text.play("Finish")
		estado = 3
		

func _ready():
	next = inicio
	$CanvasLayer.visible = true
	$Select.visible = false
	$CanvasLayer/Control/RichTextLabel.bbcode_text = Global.idioma.Notes[inicio]

func _unhandled_input(_event):
	if Input.is_action_just_pressed("ui_interaction"):
		ativo()

func ativo():
	if proximo == true:
		if estado == 1 && $CanvasLayer/Control/RichTextLabel.bbcode_text == Global.idioma.Notes[final]:
			next = inicio
			estado = 0
			animacao()
		elif estado == 1 && !$CanvasLayer/Control/RichTextLabel.bbcode_text == Global.idioma.Notes[final]:
			next += 1
			$CanvasLayer/Control/RichTextLabel.bbcode_text = Global.idioma.Notes[next]
		else:
			estado = 1
			animacao()


func animacao():
	match estado:
		1:
			$Text.play("Start")
		0:
			$Text.play("Finish")
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



func _on_Text_animation_finished(anim_name):
	if anim_name == "Finish":
		$CanvasLayer/Control/RichTextLabel.bbcode_text = Global.idioma.Notes[inicio]
