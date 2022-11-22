extends Node2D



func _on_playagain_pressed():
	SoundController.playSound("res://Sound/click.mp3")
	get_tree().reload_current_scene()


func _on_exitgame_pressed():
	SoundController.playSound("res://Sound/click.mp3")
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
