extends CanvasLayer

onready var escrito = $AnimationPlayer/Label

var iniciado = 1

var pt = [
	"Não desista",
	"Você não pode morrer, não aqui",
	"Recupere todas",
	"Ela não foi justa com você",
	"Seja igual a mim",
	"Suas memorias são a chave",
	"Se esforce um pouco mais",
	"Você só queria seguir seu sonho", 
	"Ela te criou, mas nunca te amou", 
	"Você perdeu alguém importante por conta dela", 
	"Eu sinto sua raiva e sua angustia",
	"Estou acompanhando seus passos"
] 

var texto = [
	
]

func _ready():
	randomize()
	if Global.mortes > 0:
		alterarTexto()
	$AnimationPlayer.play("Texto")

func alterarTexto():
		texto = pt
		escrito.set_text(texto[randi()%texto.size()]) 

func _unhandled_input(event):
	if iniciado == 1 && event.is_action_pressed("ui_end"):
		$AnimationPlayer.play("Texto", 0, 100)
		iniciado -= 1

func _on_AnimationPlayer_animation_finished(_anim_name):
	SceneChanger.change_scene("res://Script's/Cenas/Main.tscn")
