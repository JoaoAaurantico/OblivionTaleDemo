extends CanvasLayer

onready var escrito = $AnimationPlayer/Label

var iniciado = 1

func _ready():
	randomize()
	alterarTexto()
	$AnimationPlayer.play("Texto")

func alterarTexto():
		escrito.set_text(Global.idioma.TelaMorte[randi()%Global.idioma.TelaMorte.size()]) 

func _unhandled_input(event):
	if iniciado == 1 && event.is_action_pressed("ui_end"):
		$AnimationPlayer.play("Texto", 0, 100)
		iniciado -= 1

func _on_AnimationPlayer_animation_finished(_anim_name):
	SceneChanger.change_scene("res://scenes/world/level.tscn")
