extends Node

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

func _ready():
	var file = File.new()
	if !(file.file_exists("user://SFX")):
		write("SFX","1")
	if !(file.file_exists("user://BGM")):
		write("BGM","1")
	if !(file.file_exists("user://DIFF")):
		write("DIFF","0")
	file.close()
