extends CanvasLayer

var entrou = false

func _process(_delta):
	if $Creditos.visible == true:
		$Idioma.text = "<--"
	if Global.ingles == true && !$Creditos.visible == true:
		$Idioma.text = "EN-US"
	elif Global.ingles == false && !$Creditos.visible == true:
		$Idioma.text = "PT-BR"


func _ready():
	if Global.ingles == true:
		$Idioma.text = "EN-US"
		$Pause/HBoxContainer/CenterContainer/VBoxContainer/Play.text = "Play"
		$Pause/HBoxContainer/CenterContainer/VBoxContainer/Continue.text = "Continue"
		$Pause/HBoxContainer/CenterContainer/VBoxContainer/Credits.text = "Credits"
		$Pause/HBoxContainer/CenterContainer/VBoxContainer/Quit.text = "Quit"
	else:
		$Idioma.text = "PT-BR"
		$Pause/HBoxContainer/CenterContainer/VBoxContainer/Play.text = "Iniciar"
		$Pause/HBoxContainer/CenterContainer/VBoxContainer/Continue.text = "Continuar"
		$Pause/HBoxContainer/CenterContainer/VBoxContainer/Credits.text = "Creditos"
		$Pause/HBoxContainer/CenterContainer/VBoxContainer/Quit.text = "Sair"

func _on_Play_pressed():
	$FadeM.play("FadeMenu")
	AudioGeral.emit_signal("iniciar", "fadein soundtrack")
	AudioGeral.emit_signal("iniciar", "click")
	Global.mortes = 0
	Global.espelho = 0
	Global.checkpoint = Vector2(0,0)
	Global.chave = false
# warning-ignore:return_value_discarded
	SceneChanger.change_scene("res://Script's/Gui and Stuff/Telamorte.tscn")


func _on_Quit_pressed():
	AudioGeral.emit_signal("iniciar", "click")
	get_tree().quit()


func _on_Continue_pressed():
# warning-ignore:return_value_discarded
	$FadeM.play("FadeMenu")
	AudioGeral.emit_signal("iniciar", "click")
	AudioGeral.emit_signal("iniciar", "fadein soundtrack")
	SceneChanger.change_scene("res://Script's/Cenas/Main.tscn")
	

func _on_Idioma_pressed():
	AudioGeral.emit_signal("iniciar", "click")
	if $Idioma.text == "<--":
		$Creditos.visible =  false
	if Global.ingles == true && !$Idioma.text == "<--":
		Global.ingles = false
		$Idioma.text = "PT-BR"
		$Pause/HBoxContainer/CenterContainer/VBoxContainer/Play.text = "Iniciar"
		$Pause/HBoxContainer/CenterContainer/VBoxContainer/Continue.text = "Continuar"
		$Pause/HBoxContainer/CenterContainer/VBoxContainer/Credits.text = "Creditos"
		$Pause/HBoxContainer/CenterContainer/VBoxContainer/Quit.text = "Sair"
	elif Global.ingles == false && !$Idioma.text == "<--":
		Global.ingles = true
		$Idioma.text = "EN-US"
		$Pause/HBoxContainer/CenterContainer/VBoxContainer/Play.text = "Play"
		$Pause/HBoxContainer/CenterContainer/VBoxContainer/Continue.text = "Continue"
		$Pause/HBoxContainer/CenterContainer/VBoxContainer/Credits.text = "Credits"
		$Pause/HBoxContainer/CenterContainer/VBoxContainer/Quit.text = "Quit"


func _on_mouse_entered():
	AudioGeral.emit_signal("iniciar", "hover")

func _on_Credits_pressed():
	AudioGeral.emit_signal("iniciar", "click")
	$Creditos.visible = true
