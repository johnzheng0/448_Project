extends Node2D



func _on_playagain_pressed():
	get_tree().change_scene("res://Scenes/Board.tscn")


func _on_exitgame_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
