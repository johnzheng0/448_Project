extends Node2D


func _on_button_back_pressed():
	SoundController.playSound("res://Sound/click.mp3")
	get_tree().change_scene("res://Scenes/MainMenu.tscn")


func _on_TextureButton_pressed():
	SoundController.playSound("res://Sound/click.mp3")
	get_tree().change_scene("res://Scenes/Credits.tscn")
