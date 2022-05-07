extends CanvasLayer

var entrou = false

func _ready():
	if Global.ingles == true:
		$Idioma.text = "EN-US"
		$Pause/HBoxContainer/CenterContainer/VBoxContainer/Play.text = "Play"
		$Pause/HBoxContainer/CenterContainer/VBoxContainer/Continue.text = "Continue"
		$Pause/HBoxContainer/CenterContainer/VBoxContainer/Quit.text = "Quit"
	else:
		$Idioma.text = "PT-BR"
		$Pause/HBoxContainer/CenterContainer/VBoxContainer/Play.text = "Iniciar"
		$Pause/HBoxContainer/CenterContainer/VBoxContainer/Continue.text = "Continuar"
		$Pause/HBoxContainer/CenterContainer/VBoxContainer/Quit.text = "Sair"

func _on_Play_pressed():
	$FadeM.play("FadeMenu")
	AudioGeral.emit_signal("iniciar", "click")
	AudioGeral.emit_signal("iniciar", "fadesoundtrack")
	Global.mortes = 0
	Global.espelho = 0
# warning-ignore:return_value_discarded
	SceneChanger.change_scene("res://Script's/Gui and Stuff/Telamorte.tscn")


func _on_Quit_pressed():
	AudioGeral.emit_signal("iniciar", "click")
	get_tree().quit()


func _on_Continue_pressed():
# warning-ignore:return_value_discarded
	AudioGeral.emit_signal("iniciar", "click")
	AudioGeral.emit_signal("iniciar", "fadesoundtrack")
	SceneChanger.change_scene("res://Script's/Cenas/Main.tscn")
	

func _on_Idioma_pressed():
	AudioGeral.emit_signal("iniciar", "click")
	if Global.ingles == true:
		Global.ingles = false
		$Idioma.text = "PT-BR"
		$Pause/HBoxContainer/CenterContainer/VBoxContainer/Play.text = "Iniciar"
		$Pause/HBoxContainer/CenterContainer/VBoxContainer/Continue.text = "Continuar"
		$Pause/HBoxContainer/CenterContainer/VBoxContainer/Quit.text = "Sair"
	else:
		Global.ingles = true
		$Idioma.text = "EN-US"
		$Pause/HBoxContainer/CenterContainer/VBoxContainer/Play.text = "Play"
		$Pause/HBoxContainer/CenterContainer/VBoxContainer/Continue.text = "Continue"
		$Pause/HBoxContainer/CenterContainer/VBoxContainer/Quit.text = "Quit"


func _on_mouse_entered():
	AudioGeral.emit_signal("iniciar", "hover")
