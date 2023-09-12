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
		"language": "PT-BR1",
		"play": "Iniciar1",
		"continue": "Continuar1",
		"credits": "Creditos1",
		"options": "Opções1",
		"extra": "Extras1",
		"exit": "Sair1"
	},
	
	Desc = {
		"idiom": "Idioma1",
		"extra": "Extras1"
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
		0: "Onde você morava era bem agradavel.",
		1: "Então nós vamos começar daqui, a paisagem desse lugar é bem diferente da minha antiga casa.",
		2: "Você tem memórias ruins desse lugar?"
	}
}

const PTBR = {
	Menu = {
		"language": "PT-BR",
		"play": "Iniciar",
		"continue": "Continuar",
		"credits": "Creditos",
		"options": "Opções",
		"extra": "Extras",
		"exit": "Sair"
	},
	Desc = {
		"idiom": "Idioma",
		"extra": "Extras"
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
		0: "Onde você morava era bem agradavel.",
		1: "Então nós vamos começar daqui, a paisagem desse lugar é bem diferente da minha antiga casa.",
		2: "Você tem memórias ruins desse lugar?"
	}
}

const ENUS = {
	Menu = {
		"language": "EN-US",
		"play": "Play",
		"continue": "Continue",
		"credits": "Credits",
		"options": "Options",
		"extra": "Extra",
		"exit": "Exit"
	},
	Desc = {
		"idiom": "Language",
		"extra": "Extras"
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
		0: "Curioso.",
		1: "[color=red]Ela[/color] era muito importante para você, não é?",
		2: "Oque aconteceu para ela sumir de sua mente?"
	}
}

func idiomaAtual():
	if Global.linguagemAtual == 0:
		Global.idioma = Global.PTBR
	elif Global.linguagemAtual == 1:
		Global.idioma = Global.ENUS
