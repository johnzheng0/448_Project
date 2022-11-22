extends Node2D


onready var ChickenNest = get_node("ChickenNest")
onready var Points = get_node("Points")
onready var TimerNode = get_node("Timer")
onready var Fail = get_node("Fail")
onready var LoseScreen = get_node("LoseScreen")

# Random Number Generator
var random = RandomNumberGenerator.new()

var difficulty = int(Global.read("DIFF"))
var points = 0

var goal = ""


func _ready():
	SoundController.playMusic("res://Sound/musicGame.mp3")
	generateGoal() 
	$Board.goalUpdate(goal)
	TimerNode._change_state(difficulty)

var state = 0

# Check for input every frame
func _process(delta):
	if(state == 0):
		check_input()
		if (TimerNode._is_Full()):
			lose()

		
# Function for checking input	
func check_input():
	if (Input.is_action_just_pressed("ui_right")):
		$Board.moveRight()
	elif (Input.is_action_just_pressed("ui_left")):
		$Board.moveLeft()
	elif (Input.is_action_just_pressed("ui_up")):
		$Board.moveUp()
	elif (Input.is_action_just_pressed("ui_down")):
		$Board.moveDown()
	elif (Input.is_action_just_pressed("ui_accept")):
		var win = $Board.checkWinCondition(goal[0], goal[1])
		if(win):
			SoundController.playSound("res://Sound/correct.mp3")
			points += 1
			Points._update_point(points)
			$Board.rearrange()
			generateGoal()
			$Board.goalUpdate(goal)
			TimerNode._reset_timer()
		else:
			SoundController.playSound("res://Sound/wrong.mp3")
			Fail._fail()
	
	
# Function to generate goal
func generateGoal():
	random.randomize()
	var number = random.randi_range(1,6)
	random.randomize()
	var letter = random.randi_range(1,5)
	match letter:
		1: 
			letter = 'A'
		2:
			letter = 'B'
		3:
			letter = 'C'
		4:
			letter = 'D'
		5:
			letter = 'E'
	goal = str(number) + letter
	
func lose():
	state = 1
	LoseScreen.visible = true
	
