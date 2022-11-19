extends Control


func write(fileName,content):
	var file = File.new()
	file.open("user://"+fileName, File.WRITE)
	file.store_string(content)
	file.close()
	
func read(fileName):
	var file = File.new()
	file.open("user://"+fileName, File.READ)
	var content = file.get_as_text()
	file.close()
	return content

func tempPrint():
	print("SFX: "+read("SFX.cfg")+"\nBGM: "+read("BGM.cfg")+"\nDIFF: "+read("DIFF.cfg"))

func _ready():
	pass
	

func _on_SoundButton_pressed():
	if (read("SFX.cfg") == "off"):
		write("SFX.cfg","on")
	else:
		write("SFX.cfg","off")
	tempPrint()
	
	
func _on_BGMButton_pressed():
	if (read("BGM.cfg") == "off"):
		write("BGM.cfg","on")
		MusicController.playMusic("res://Sound/musicMainMenu.mp3")
	else:
		write("BGM.cfg","off")
		MusicController.stopMusic()
	tempPrint()
	
	
func _on_DifficultyButton_pressed():
	var difficulty = read("DIFF.cfg")
	if (difficulty == "0"):
		write("DIFF.cfg","1")
	elif (difficulty == "1"):
		write("DIFF.cfg","2")
	elif (difficulty == "2"):
		write("DIFF.cfg","3")
	else:
		write("DIFF.cfg","0")
	tempPrint()


func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")


func _on_CreditsButton_pressed():
	get_tree().change_scene("res://Scenes/Credits.tscn")


