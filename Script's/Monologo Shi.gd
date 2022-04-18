extends Control
var iniciado = 1
func _ready():
	if Global.ingles == true:
		textUS()
	else: 
		textoPT()
	$CanvasLayer/AnimationPlayer.play("Teclando")

func textoPT():
	if Global.espelho == 0:
		$CanvasLayer/CenterContainer/Label.text = "Escuro, era tudo que eu via, a única cor que era enxergada em meu mundo era o preto da escuridão."
	elif Global.espelho == 1:
		$CanvasLayer/CenterContainer/Label.text = "Não era pela falta de luz, a luz sequer existia, não era um fundamento no meu universo, mas oque me assustava era minha própria solidão."
	elif Global.espelho == 2:
		$CanvasLayer/CenterContainer/Label.text = "Havia luz dentro de mim, por isso sabia oque era a luz, a luz de meus olhos, eu estava sozinho, na escuridão, sendo a única luz, em um universo escuro."
	elif Global.espelho == 3:
		$CanvasLayer/CenterContainer/Label.text = "Escuro sem luz, sem nada, sem coisas, sem criaturas, sem pessoas, apenas escuridão."
	elif Global.espelho == 4:
		$CanvasLayer/CenterContainer/Label.text = "Mas em algum momento, eu enxerguei uma luz, a luz não vinha de mim, vinha de um buraco, um buraco que levava a outro Lugar?"
	elif Global.espelho == 5:
		$CanvasLayer/CenterContainer/Label.text = "O buraco me chamava, alguém me chamava, um ser preto e branco, assim como eu, mas tinha outras cores, ele não era feito de luz e nem escuridão, era parecido, mas diferente."
	elif Global.espelho == 6:
		$CanvasLayer/CenterContainer/Label.text = "Um diferente bom, e um pouco ruim, ele queria entender o universo dele, e eu queria entender o meu, no dele tinha pessoas, tinha criaturas, tinha luz, tinha escuridão, tinha preto, tinha branco, tinha outras cores."
	elif Global.espelho == 7:
		$CanvasLayer/CenterContainer/Label.text = "Tinha coisas que eu nunca tinha visto, eram coisas boas e ruins, mas tanto ele quanto eu sabíamos, oque faltava em mim, ele tinha, e oque faltava nele, eu tinha, e agora nós somos completos."
	elif Global.espelho == 8:
		$CanvasLayer/CenterContainer/Label.text = "Preto, branco, cores, conhecimento, universo, esclarecimento, magia, sabedoria, tecnologia, raça de magia, sem magia?"
	elif Global.espelho == 9:
		$CanvasLayer/CenterContainer/Label.text = "Nós podemos dar a magia, para quem nunca pode ter, eu cederei a nossa escuridão, e darei a eles oque falta, e assim teremos mais de nós, mais do preto, mais do branco, e das cores."

func textUS():
	if Global.espelho == 0:
		$CanvasLayer/CenterContainer/Label.text = "Dark, was all I saw, the only color that was seen in my world was the black of darkness."
	elif Global.espelho == 1:
		$CanvasLayer/CenterContainer/Label.text = "It wasn't because of the lack of light, the light didn't even exist, it wasn't a foundation in my universe, but what scared me was my own loneliness."
	elif Global.espelho == 2: 
		$CanvasLayer/CenterContainer/Label.text = "There was light inside me, so I knew what light was, the light of my eyes, I was alone, in the darkness, being the only light, in a dark universe."
	elif Global.espelho == 3:
		$CanvasLayer/CenterContainer/Label.text = "Dark no light, no nothing, no things, no creatures, no people, just darkness."
	elif Global.espelho == 4:
		$CanvasLayer/CenterContainer/Label.text = "But at some point, I saw a light, wasn't the light coming from me, was it coming from a hole, a hole that led somewhere else?"
	elif Global.espelho == 5:
		$CanvasLayer/CenterContainer/Label.text = "The hole was calling me, someone was calling me, a black and white being, just like me, but it had other colors, it wasn't made of light or darkness, it was similar, but different."
	elif Global.espelho == 6:
		$CanvasLayer/CenterContainer/Label.text = "A different good, and a little bad, he wanted to understand his universe, and I wanted to understand mine, in his there were people, there were creatures, there was light, there was darkness, there was black, there was white, there were other colors."
	elif Global.espelho == 7:
		$CanvasLayer/CenterContainer/Label.text = "There were things I had never seen, good and bad, but both he and I knew, what was missing in me, he had, and what was missing in him, I had, and now we are complete."
	elif Global.espelho == 8:
		$CanvasLayer/CenterContainer/Label.text = "Black, white, colors, knowledge, universe, enlightenment, magic, wisdom, technology, race of magic, no magic?"
	elif Global.espelho == 9:
		$CanvasLayer/CenterContainer/Label.text = "We can give the magic to those who can never have, I will give in to our darkness, and I will give them what they lack, and so we will have more of us, more of the black, more of the white, and of the colors."

func _unhandled_input(event):
	if event.is_action_pressed("ui_end") && iniciado == 1:
		$CanvasLayer/AnimationPlayer.play("Teclando", 0, 100)
		iniciado -= 1
		

func _on_AnimationPlayer_animation_finished(_anim_name):
	if Global.espelho == 0:
		Global.portal = true
		SceneChanger.change_scene("res://Script's/Cenas/Fases/Fase01.tscn")
	if Global.espelho == 1:
		Global.portal = true
		SceneChanger.change_scene("res://Script's/Cenas/Fases/Fase02.tscn")
	if Global.espelho == 2:
		Global.portal = true
		SceneChanger.change_scene("res://Script's/Cenas/Fases/Fase03.tscn")
	if Global.espelho == 3:
		Global.portal = true
		SceneChanger.change_scene("res://Script's/Cenas/Fases/Fase04.tscn")
