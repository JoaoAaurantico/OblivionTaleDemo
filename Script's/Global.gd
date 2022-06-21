extends Node

var linguagemAtual: int = 0
var chao = false
var portal = false
var inverse = false
var chave = false
var teleporte = false
var lampiao: int = 0
var espelho: int = 0
var mortes: int = 0
var checkpoint = Vector2(0,0)
var dict_lamp = {}

func add_lampiao():
	lampiao += 1 

func add_espelho():
	espelho += 1

func add_morte():
	mortes += 1
	#lampfase = 0

func remove_morte():
	mortes -= 1

func morto():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Script's/Gui and Stuff/Telamorte.tscn")


# ========================= Idiomas ========================= #

var idioma = {
	Menu = {
		"language": "0",
		"play": "1",
		"continue": "2",
		"credits": "3",
		"exit": "4"
	},
	Pause = {
		"resume": "5",
		"save": "6",
		"memory": "7",
		"exit": "8" 
	},
	ShiAnimacao = {
		"animacao": "9"
	},
	TelaMorte = {
		0: "10",
		1: "11",
		2: "12"
	}
}

const PTBR = {
	Menu = {
		"language": "PT-BR",
		"play": "Iniciar",
		"continue": "Continuar",
		"credits": "Creditos",
		"exit": "Sair"
	},
	Pause = {
		"resume": "Resumir",
		"save": "Salvar",
		"memory": "Memorias",
		"exit": "Sair" 
	},
	ShiAnimacao = {
		"animacao": "Tradução em português"
	},
	TelaMorte = {
		0: "morte1",
		1: "morte2",
		2: "morte3"
	}
}

const ENUS = {
	Menu = {
		"language": "EN-US",
		"play": "Play",
		"continue": "Continue",
		"credits": "Credits",
		"exit": "Quit"
	},
	Pause = {
		"resume": "Resume",
		"save": "Save",
		"memory": "Memories",
		"exit": "Quit" 
	},
	ShiAnimacao = {
		"animacao": "Tradução Inglês"
	},
	TelaMorte = {
		0: "morte1en",
		1: "morte2en",
		2: "morte3en"
	}
}

func idiomaAtual():
	if Global.linguagemAtual == 0:
		Global.idioma = Global.PTBR
	elif Global.linguagemAtual == 1:
		Global.idioma = Global.ENUS
