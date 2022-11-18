extends Control



func _on_SettingsButton_pressed():
	get_tree().change_scene("res://Scenes/Settings.tscn")


func _on_NewGameButton_pressed():
	get_tree().change_scene("res://Scenes/Board.tscn")
