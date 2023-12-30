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

var hiLampiao: int
var hiMortes: int
var hiMS: int
var hiS: int
var hiM: int

var mouseLock = true

func save_record():
	hiLampiao = lampiao
	hiMortes = mortes
	hiMS = GlobalTimer.ms
	hiS = GlobalTimer.s
	hiM = GlobalTimer.m

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


func _unhandled_input(_event):
	if Input.is_action_just_pressed("ui_end"):
		 get_tree().quit()

func toggleCapturarMouse():
	mouseLock = not mouseLock
	if mouseLock:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

# ========================= Idiomas ========================= #

var idioma = {
	Menu = {
		"language": "PT-BR1",
		"play": "Iniciar1",
		"continue": "Continuar1",
		"credits": "Creditos1",
		"options": "Opções1",
		"extra": "Extras1",
		"exit": "Sair1",
		"lastime": "Ultimo Tempo"
	},
	
	Desc = {
		"idiom": "Idioma1",
		"extra": "Extras1"
	},
	
	Pause = {
		"resume": "Resumir1",
		"save": "Salvar1",
		"restart": "Reiniciar1",
		"memory": "Memorias1",
		"exit": "Sair1" 
	},
	ShiAnimacao = {
		"animacao": "9"
	},
	TelaMorte = {
		0: "Estamos a um passo de terminar tudo, não devemos parar agora.",
		1: "Cento e cinquenta, cento e cinquenta e um... isso não para de subir, encontramos!",
		2: "Eu disse que era possível, os recursos não foram desperdiçados.",
		3: "Espera... isso não deveria acontecer! Algo deu errado!",
		4: "O que é você?!",
		5: "Eu sou você, você é eu.",
		6: "Sua dor, minha dor."
	},
	Notes = {
		0: "Onde você morava era bem agradável.",
		1: "Então nós vamos começar daqui, a paisagem desse lugar é bem diferente da minha antiga casa.",
		2: "Você tem memórias ruins desse lugar?",
		3: "Eu também tenho memórias ruins de onde eu nasci.",
		4: "Não havia luz.",
		5: "Não havia som.",
		6: "Não havia nada.",
		7: "Mas ela me encontrou.",
		8: "E ela também estava sozinha."
	},
	Achievements = {
		1: "Conclua a fase em 45 segundos ou menos.",
		2: "Colete todos os 10 Lampiões e conclua a primeira fase.",
		3: "Conclua a primeira fase desde o inicio sem morrer."
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
		"exit": "Sair",
		"lastime": "Ultimo Tempo"
	},
	Desc = {
		"idiom": "Idioma",
		"extra": "Extras"
	},
	Pause = {
		"resume": "Resumir",
		"save": "Salvar",
		"restart": "Reiniciar",
		"memory": "Memorias",
		"exit": "Sair" 
	},
	ShiAnimacao = {
		"animacao": "Isso é uma demo de um jogo atualmente em produção, quaisquer bugs encontrados nessa build atual devem ser informadas diretamente ao seu criador original. Dito isso, obrigado por jogar!"
	},
	TelaMorte = {
		0: "Estamos a um passo de terminar tudo, não devemos parar agora.",
		1: "Cento e cinquenta, cento e cinquenta e um... isso não para de subir, encontramos!",
		2: "Eu disse que era possível, os recursos não foram desperdiçados.",
		3: "Espera... isso não deveria acontecer! Algo deu errado!",
		4: "O que é você?!",
		5: "Eu sou você, você é eu.",
		6: "Sua dor, minha dor."
	},
	Notes = {
		0: "Onde você morava era bem agradável.",
		1: "Então nós vamos começar daqui, a paisagem desse lugar é bem diferente da minha antiga casa.",
		2: "Você tem memórias ruins desse lugar?",
		3: "Eu também tenho memórias ruins de onde eu nasci.",
		4: "Não havia luz.",
		5: "Não havia som.",
		6: "Não havia nada.",
		7: "Mas ela me encontrou.",
		8: "E ela também estava sozinha."
	},
	Achievements = {
		1: "Conclua a fase em 45 segundos ou menos.",
		2: "Colete todos os 10 Lampiões e conclua a primeira fase.",
		3: "Conclua a primeira fase desde o inicio sem morrer."
	}

}

const ENUS = {
	Menu = {
		"language": "EN-US",
		"play": "Play",
		"continue": "Continue",
		"credits": "Credits",
		"options": "Options",
		"extra": "Extras",
		"exit": "Exit",
		"lastime": "Last Run"
	},
	Desc = {
		"idiom": "Language",
		"extra": "Extras"
	},
	Pause = {
		"resume": "Resume",
		"save": "Save",
		"restart": "Restart",
		"memory": "Memories",
		"exit": "Quit" 
	},
	ShiAnimacao = {
		"animacao": "This is a demo of a game currently in production, any bugs found in this current build should be reported directly to its original developer. That said, thanks for playing!"
	},
	TelaMorte = {
		0: "We are one step away from ending it all; we should not stop now.",
		1: "One hundred fifty, one hundred fifty-one... this keeps going up; we've found it!",
		2: "I said it was possible; the resources were not wasted.",
		3: "Wait... this shouldn't be happening! Something went wrong!",
		4: "What are you?!", 
		5: "I am you, you are me.",
		6: "Your pain, my pain."
	},
	Notes = {
		0: "You lived in a quite pleasant place.",
		1: "So we will start from here; the landscape of this place is quite different from my previous house.",
		2: "Do you have bad memories of this place?",
		3: "I also have bad memories of where I was born.",
		4: "There was no light.",
		5: "There was no sound.",
		6: "There was nothing.",
		7: "But she found me.",
		8: "And she was also alone."
	},
	Achievements = {
		1: "Finish the first level within 45 seconds or less.",
		2: "Get all 10 Lamps and finish the first level.",
		3: "Finish the first level from the beggining without dying once."
	}
}

func idiomaAtual():
	if Global.linguagemAtual == 0:
		Global.idioma = Global.PTBR
	elif Global.linguagemAtual == 1:
		Global.idioma = Global.ENUS
