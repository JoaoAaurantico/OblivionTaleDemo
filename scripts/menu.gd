extends CanvasLayer

func _ready():
	AudioSFX.GUI("menuplay")
	$Menu/HBoxContainer/CenterContainer/VBoxContainer/play.grab_focus()
	idiomaAtualMenu()
	if GlobalTimer.timervisible == true:
		$"Opções/CenterContainer/HBoxContainer/VBoxContainer/CheckButton".pressed = true

func idiomaSelec():
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

func _unhandled_input(event):
	if event.is_action_pressed("ui_end") && $Creditos.visible == true:
		$Creditos.visible = false
		$Menu/HBoxContainer/CenterContainer/VBoxContainer/credits.grab_focus()
	elif event.is_action_pressed("ui_end") && $"Opções".visible == true:
		$"Opções".visible = false
		$Menu/HBoxContainer/CenterContainer/VBoxContainer/options.grab_focus()




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
	$Rank/CenterContainer/VBoxContainer/LastTime.text = Global.idioma.Menu["lastime"]
	$Rank/CenterContainer/VBoxContainer/HBoxContainer/Deaths.text = String(Global.hiMortes)
	$Rank/CenterContainer/VBoxContainer/HBoxContainer2/Lamps.text = String(Global.hiLampiao)
	$Rank/CenterContainer/VBoxContainer/HBoxContainer3/Time.text = String(str(Global.hiM) + ":" + str(Global.hiS) + ":" + str(Global.hiMS))

func _on_Play_pressed():
	AudioSFX.GUI("press")
	AudioSFX.GUI("menustop")
	$FadeM.play("FadeMenu")
	newgame()
# warning-ignore:return_value_discarded
	SceneChanger.change_scene("res://other/death_screen.tscn")

func _on_Quit_pressed():
	AudioSFX.GUI("press")
	get_tree().quit()

func _on_Continue_pressed():
	AudioSFX.GUI("press")
	AudioSFX.GUI("menustop")
# warning-ignore:return_value_discarded
	$FadeM.play("FadeMenu")
	SceneChanger.change_scene("res://scenes/world/level.tscn")

func _on_Credits_pressed():
	AudioSFX.GUI("press")
	$Creditos.visible = true
	$Creditos/CenterContainer/HBoxContainer/VBoxContainer/Back1.grab_focus()

func _on_Idioma_pressed():
	AudioSFX.GUI("press")
	idiomaSelec()
	idiomaMenu()

func _on_options_pressed():
	AudioSFX.GUI("press")
	$"Opções".visible = true
	$"Opções"/CenterContainer/HBoxContainer/VBoxContainer/Idioma.grab_focus()

func _on_extras_pressed():
	$Extras.visible = true
	$Back.visible = true

func _on_CheckButton_toggled(button_pressed):
	AudioSFX.GUI("press")
	GlobalTimer.visibleTimer(button_pressed)

func _on_Back1_pressed():
	AudioSFX.GUI("press")
	$Creditos.visible = false
	$Menu/HBoxContainer/CenterContainer/VBoxContainer/credits.grab_focus()

func _on_Back2_pressed():
	AudioSFX.GUI("press")
	$"Opções".visible = false
	$Menu/HBoxContainer/CenterContainer/VBoxContainer/options.grab_focus()


func _on_focus_entered():
	AudioSFX.GUI("select")
