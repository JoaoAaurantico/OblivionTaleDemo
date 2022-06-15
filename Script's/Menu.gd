extends CanvasLayer

var entrou = false

func _process(_delta):
	if $Creditos.visible == true:
		$Idioma.text = "<--"

func _ready():
	pass
func _on_Play_pressed():
	$FadeM.play("FadeMenu")
	Global.mortes = 0
	Global.espelho = 0
	Global.lampiao = 0
	Global.checkpoint = Vector2(0,0)
	Global.chave = false
	Global.dict_lamp = {}
# warning-ignore:return_value_discarded
	SceneChanger.change_scene("res://Script's/Gui and Stuff/Telamorte.tscn")


func _on_Quit_pressed():
	get_tree().quit()


func _on_Continue_pressed():
# warning-ignore:return_value_discarded
	$FadeM.play("FadeMenu")
	SceneChanger.change_scene("res://Script's/Cenas/Main.tscn")
	

func _on_Idioma_pressed():
	if $Idioma.text == "<--":
		$Creditos.visible = false
		$Idioma.text = "PT-BR"

func _on_mouse_entered():
	pass

func _on_Credits_pressed():
	$Creditos.visible = true
