extends CanvasLayer


func _process(_delta):
	idiomaAtualMenu()
	if $Creditos.visible == true:
		$Idioma.text = "<--"

func _on_Play_pressed():
	$FadeM.play("FadeMenu")
	newgame()
# warning-ignore:return_value_discarded
	SceneChanger.change_scene("res://other/death_screen.tscn")

func _on_Quit_pressed():
	get_tree().quit()

func _on_Continue_pressed():
# warning-ignore:return_value_discarded
	$FadeM.play("FadeMenu")
	SceneChanger.change_scene("res://scenes/world/level.tscn")

func _on_mouse_entered():
	pass

func _on_Credits_pressed():
	$Creditos.visible = true

func newgame():
	Global.mortes = 0
	Global.espelho = 0
	Global.lampiao = 0
	Global.checkpoint = Vector2(0,0)
	Global.chave = false
	Global.dict_lamp = {}

func _on_Idioma_pressed():
	if !$Idioma.text == "<--":
		idiomaSelec()
		idiomaMenu()
	elif $Idioma.text == "<--":
		idiomaMenu()
		$Creditos.visible = false

func idiomaSelec():
	idiomaAtualMenu()
	print(Global.linguagemAtual)
	Global.linguagemAtual += 1
	if Global.linguagemAtual > 1:
		Global.linguagemAtual = 0


func idiomaAtualMenu():
	idiomaMenu()
	Global.idiomaAtual()

func idiomaMenu():
	$Idioma.text = Global.idioma.Menu["language"]
	$Menu/HBoxContainer/CenterContainer/VBoxContainer/Play.text = Global.idioma.Menu["play"]
	$Menu/HBoxContainer/CenterContainer/VBoxContainer/Continue.text = Global.idioma.Menu["continue"]
	$Menu/HBoxContainer/CenterContainer/VBoxContainer/Credits.text = Global.idioma.Menu["credits"]
	$Menu/HBoxContainer/CenterContainer/VBoxContainer/Quit.text = Global.idioma.Menu["exit"]
