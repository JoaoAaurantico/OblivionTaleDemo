extends Node

const SAVE_DIR = "user://saves/"
var salvar_nomeArquivo = SAVE_DIR + "save_game.dat"

func save_game():
	var data = {
	"mortes": Global.mortes,
	"espelhos": Global.espelho,
	"checkpoint": Global.checkpoint,
	"chave": Global.chave,
	"lampiao": Global.lampiao,
	"dictlamp": Global.dict_lamp,
	"lingua": Global.linguagemAtual,
	"milissegundos": GlobalTimer.ms,
	"segundos": GlobalTimer.s,
	"minutos": GlobalTimer.m,
	"timer": GlobalTimer.timerInit,
	"RecoLamp": Global.hiLampiao,
	"RecoMortes": Global.hiMortes,
	"RecoMS": Global.hiMS,
	"RecoS": Global.hiS,
	"RecoM": Global.hiM,
	"Achievement1": Achievement.LampAchievement,
	"Achievement2": Achievement.TimeAchievement,
	"Achievement3": Achievement.DeathAchievement
}
	var dir = Directory.new()
	if !dir.dir_exists(SAVE_DIR):
		dir.make_dir_recursive(SAVE_DIR)
	var file = File.new()
	var erro = file.open(salvar_nomeArquivo,File.WRITE)
	if erro == OK:
		file.store_var(data)
		file.close()

func load_game():
	var file = File.new()
	if file.file_exists(salvar_nomeArquivo):
		var error = file.open(salvar_nomeArquivo, File.READ)
		if error == OK:
			var player_data = file.get_var()
			file.close()
			Global.mortes = player_data.mortes
			Global.espelho = player_data.espelhos
			Global.checkpoint = player_data.checkpoint
			Global.chave = player_data.chave
			Global.lampiao = player_data.lampiao
			Global.dict_lamp = player_data.dictlamp
			Global.linguagemAtual = player_data.lingua
			GlobalTimer.ms = player_data.milissegundos
			GlobalTimer.s = player_data.segundos
			GlobalTimer.m = player_data.minutos
			GlobalTimer.timerInit = player_data.timer
			Global.hiLampiao = player_data.RecoLamp
			Global.hiMortes = player_data.RecoMortes
			Global.hiMS = player_data.RecoMS
			Global.hiS = player_data.RecoS
			Global.hiM = player_data.RecoM
			Achievement.LampAchievement = player_data.Achievement1
			Achievement.TimeAchievement = player_data.Achievement2
			Achievement.DeathAchievement = player_data.Achievement3
