extends Node2D


func _fail(n=1):
	_failLeft(n)
	_failRight(n)

func _failLeft(n=1):
	$Left._fail(n)
	
func _failRight(n=1):
	$Right._fail(n)
	
