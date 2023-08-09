extends Node
tool

func _process(_delta):
	if Engine.editor_hint:
		idiomaAtual()

var chavenome = ""
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
var dict_mirror = {}
var dict_teleport = {}

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
	get_tree().change_scene("res://other/death_screen.tscn")


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
	},
	Notes = {
		1: "Texto bem estar de roberto",
		2: "14"
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
		"animacao": "Isso é uma demo de um jogo atualmente em produção, quaisquer bugs encontrados nessa build atual devem ser informadas diretamente ao seu criador original. Dito isso, obrigado por jogar!"
	},
	TelaMorte = {
		0: "Tela de morte atualmente em produção.",
		1: "Tela de morte atualmente em produção."
	},
	Notes = {
		1: "Obrigado por jogar, a demo para por aqui"
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
		"animacao": "This is a demo of a game currently in production, any bugs found in this current build should be reported directly to its original developer. That said, thanks for playing!"
	},
	TelaMorte = {
		0: "Screen of Death currently in production.",
		1: "Screen of Death currently in production."
	},
	Notes = {
		1: "Thanks for playing, the demo stops here."
	}
}

func idiomaAtual():
	if Global.linguagemAtual == 0:
		Global.idioma = Global.PTBR
	elif Global.linguagemAtual == 1:
		Global.idioma = Global.ENUS
