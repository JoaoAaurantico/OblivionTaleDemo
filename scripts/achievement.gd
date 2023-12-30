extends Node

var LampAchievement = false
var TimeAchievement = false
var DeathAchievement = false

var secret = false

func secretHat():
	if TimeAchievement == true and DeathAchievement == true and LampAchievement == true:
			secret = true

func registerAch():
	print("Lampião = ", LampAchievement)
	print("Tempo = ", TimeAchievement)
	print("Morte = ", DeathAchievement)
	if Global.lampiao == 10:
		LampAchievement = true
	if GlobalTimer.s < 45 and GlobalTimer.m == 0:
		TimeAchievement = true
	if Global.mortes == 0:
		DeathAchievement = true
	secretHat()
