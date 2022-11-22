extends Node2D

func _ready():
	
	SoundController.playMusic("res://Sound/musicMainMenu.mp3")



func _on_button_newgame_pressed():
	SoundController.playSound("res://Sound/click.mp3")
	get_tree().change_scene("res://Scenes/Game/NewGame.tscn")


func _on_button_pvp_pressed():
	SoundController.playSound("res://Sound/click.mp3")
	get_tree().change_scene("res://Scenes/Game/GameVersus.tscn")


func _on_button_settings_pressed():
	SoundController.playSound("res://Sound/click.mp3")
	get_tree().change_scene("res://Scenes/Settings.tscn")


func _on_button_quit_pressed():
	SoundController.playSound("res://Sound/click.mp3")
	get_tree().quit()
