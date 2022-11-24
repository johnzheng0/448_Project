extends Node


func playMusic(fileLocation):
	if (Global.read("BGM") == "1" and ($Music.stream != load(fileLocation) or !($Music.playing))):
		$Music.stream = load(fileLocation)
		$Music.play()

func volumeMusic(vol):
	$Music.volume_db = vol

func stopMusic():
	$Music.stop()

var selector = 1
func playSound(fileLocation):
	if (Global.read("SFX") == "1"):
		var sound = AudioStreamPlayer.new()
		add_child(sound)
		sound.stream = load(fileLocation)
		sound.play()
		yield(sound, "finished")
		sound.queue_free()
