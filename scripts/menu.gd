extends CanvasLayer

func _ready():
	idiomaAtualMenu()

func idiomaSelec():
	print(Global.linguagemAtual)
	Global.linguagemAtual += 1
	if Global.linguagemAtual > 1:
		Global.linguagemAtual = 0
	idiomaAtualMenu()

func newgame():
	Global.mortes = 0
	Global.espelho = 0
	Global.lampiao = 0
	Global.checkpoint = Vector2(0,0)
	Global.chave = false
	Global.dict_lamp = {}
	GlobalTimer.timerInit = false

func idiomaAtualMenu():
	idiomaMenu()
	Global.idiomaAtual()

func idiomaMenu():
	$"Opções/CenterContainer/HBoxContainer/VBoxContainer/Idioma".text = Global.idioma.Menu["language"]
	$Menu/HBoxContainer/CenterContainer/VBoxContainer/play.text = Global.idioma.Menu["play"]
	$Menu/HBoxContainer/CenterContainer/VBoxContainer/continue.text = Global.idioma.Menu["continue"]
	$Menu/HBoxContainer/CenterContainer/VBoxContainer/credits.text = Global.idioma.Menu["credits"]
	$Menu/HBoxContainer/CenterContainer/VBoxContainer/options.text = Global.idioma.Menu["options"]
	$"Opções/CenterContainer/HBoxContainer/VBoxContainer/IdiomaDesc".text = Global.idioma.Desc["idiom"]
	#$Extras/CenterContainer/HBoxContainer/VBoxContainer/ExtraDesc.text =
	$Menu/HBoxContainer/CenterContainer/VBoxContainer/extras.text = Global.idioma.Menu["extra"]
	$Menu/HBoxContainer/CenterContainer/VBoxContainer/quit.text = Global.idioma.Menu["exit"]

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

func _on_Credits_pressed():
	$Back.visible = true
	$Creditos.visible = true

func _on_Idioma_pressed():
	idiomaSelec()
	idiomaMenu()

func _on_options_pressed():
	$"Opções".visible = true
	$Back.visible = true

func _on_extras_pressed():
	$Extras.visible = true
	$Back.visible = true


func _on_Back_pressed():
	if $Extras.visible == true:
		$Extras.visible = false
		$Back.visible = false
	if $"Opções".visible == true:
		$"Opções".visible = false
		$Back.visible = false
	if $Creditos.visible == true:
		$Creditos.visible = false
		$Back.visible = false


func _on_CheckButton_toggled(button_pressed):
	GlobalTimer.visibleTimer(button_pressed)
	print(GlobalTimer.timervisible)
