extends Node2D


enum State {
	Easy,
	Hard
}

var current_state = State.Easy

func _change_state(new_state: int) -> void:
	var current_state = new_state
	match current_state:
		State.Easy:
			$TextureProgress.max_value = 90
		State.Hard:
			$TextureProgress.max_value = 30

func _on_Timer_timeout():
	$TextureProgress.value += 0.1
	

func _is_Full() -> bool:
	return ($TextureProgress.value == $TextureProgress.max_value)

func _reset_timer():
	$TextureProgress.value = 0
