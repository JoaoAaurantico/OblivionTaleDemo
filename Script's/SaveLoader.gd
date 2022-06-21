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
	"lingua": Global.linguagemAtual

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
