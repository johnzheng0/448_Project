extends Node


func playMusic(fileLocation):
	if (Global.read("BGM") == "1" and ($Music.stream != load(fileLocation) or !($Music.playing))):
		$Music.stream = load(fileLocation)
		$Music.play()

func stopMusic():
	$Music.stop()

var selector = 1
func playSound(fileLocation):
	if (Global.read("SFX") == "1"):
		get_node(".").get_child(selector).stream = load(fileLocation)
		get_node(".").get_child(selector).play()
		selector += 1
		if (selector == get_node(".").get_child_count()):
			selector = 1

func stopSound():
	for n in get_node(".").get_children():
		n.stop()
