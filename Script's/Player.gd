extends KinematicBody2D

const NORMAL = Vector2(0,-1)
var motion = Vector2()
var GRAVITY = 30
var AlturaPulo = -600
var SPEED = 180
var Acc = 0

var SLIDE = 250
var PodeSlide =  false

var parede = false
var empurrando = false

func _physics_process(delta):
	_move(delta)
	
func jump():
	motion.y = AlturaPulo
	SPEED = SPEED + 20
	print(SPEED)

func jump_cut():
	if motion.y < -100:
		motion.y = -50

func _move(_delta):
	motion.y += GRAVITY
	if Input.is_action_just_released("ui_left") or Input.is_action_just_released("ui_right"):
		SPEED = 180
	
	if Input.is_action_pressed("ui_right") && PodeSlide == false:
		motion.x = SPEED
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left") && PodeSlide == false:
		motion.x = -SPEED
		$AnimatedSprite.flip_h = true
	else: motion.x = 0

	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		jump()
	elif Input.is_action_just_released("ui_up"):
		jump_cut()

	if Input.is_action_just_pressed("ui_down"):
		$TimerSlide.start()
		PodeSlide = true
		SPEED = SPEED + 10
		print(SPEED)

	if Input.is_action_pressed("ui_down") && $AnimatedSprite.flip_h == false && PodeSlide == true:
		motion.x = SLIDE
		PodeSlide = true
		$AnimationPlayer.play("CaixaSlide")
	elif Input.is_action_pressed("ui_down") && $AnimatedSprite.flip_h == true && PodeSlide == true:
		motion.x = -SLIDE
		PodeSlide = true
		$AnimationPlayer.play("CaixaSlide")
	else: 
		PodeSlide = false
		$AnimationPlayer.play("CaixaPadrão")

	if motion.x != 0 && is_on_floor() && empurrando==false && PodeSlide == false:
		$AnimatedSprite.play("Andando")
	elif !is_on_floor():
		$AnimatedSprite.play("Pulando")
	elif empurrando==true:
		$AnimatedSprite.play("Empurrando")
	elif PodeSlide ==true:
		$AnimatedSprite.play("Deslizando")
	else:
		$AnimatedSprite.play("Parado")

	motion = move_and_slide(motion, NORMAL)

func _on_Area2D_area_entered(area):
	if area.is_in_group("Dano"):
		Global.morto()

	if area.is_in_group("Desce_dano"):
		Global.morto()

	if area.is_in_group("Move") && is_on_floor():
		empurrando = true
		PodeSlide =  false
	
	if area.is_in_group("Portal"):
		SPEED = 0
		AlturaPulo = 0

func _on_Area2D_area_exited(area):
	if area.is_in_group("Move") and is_on_floor():
		empurrando = false
	else:
		empurrando = false

func _on_VisibilityNotifier2D_screen_exited():
	if Global.portal == false :
		avisar_morte()

func avisar_morte():
	Global.add_morte()
	Global.morto()
func _on_Timer_timeout():
	PodeSlide = false
