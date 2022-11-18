extends Control



func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")


func _on_CreditsButton_pressed():
	get_tree().change_scene("res://Scenes/Credits.tscn")
