extends Node2D

export (int) var x_start = 45
export (int) var y_start = 170
export (int) var x_off = 90
export (int) var y_off = 90

var random = RandomNumberGenerator.new()

var tiles = [
	preload("res://Scenes/BlankTile.tscn"),
	preload("res://Scenes/TileTopRight.tscn"),
	preload("res://Scenes/TileTopLeft.tscn"),
	preload("res://Scenes/TileBottomRight.tscn"),
	preload("res://Scenes/TileBottomLeft.tscn"),
	preload("res://Scenes/TileHorizontal.tscn"),
	preload("res://Scenes/TileVertical.tscn")
]

# Initial grid
var level_grid = [
	[0, 1, 1, 1, 1],
	[2, 3, 4, 5, 6],
	[2, 3, 4, 5, 6],
	[2, 3, 4, 5, 6],
	[2, 3, 4, 5, 6]
]

# Called when the node enters the scene tree for the first time.
func _ready():
	rearrange()
	draw_level()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

var blankboxposition
#var state = 0
#
#func _process(delta):
#	if(state == 0):
#		check_input()
#	check_input()
		
		

func grid_to_pixel(x, y):
	return Vector2(x * x_off + x_start, y * y_off + y_start)	
#	return Vector2(x * x_off + x_off * 0.5, y * y_off + y_off * 0.5)

func draw_level():
	delete_level()
	
	for i in range(level_grid.size()):
		for j in range(level_grid[0].size()):
			if (level_grid[i][j] == 0):
				var tile = tiles[0].instance()
				add_child(tile)
				var pos = grid_to_pixel(i, j)
				tile.position = Vector2(pos[0], pos[1])
				tile.z_index = 2
				blankboxposition = Vector2(i, j)
			elif (level_grid[i][j] == 1):
				var tile = tiles[1].instance()
				add_child(tile)
				var pos = grid_to_pixel(i, j)
				tile.position = Vector2(pos[0], pos[1])
				tile.z_index = 2
			elif (level_grid[i][j] == 2):
				var tile = tiles[2].instance()
				add_child(tile)
				var pos = grid_to_pixel(i, j)
				tile.position = Vector2(pos[0], pos[1])
				tile.z_index = 2
			elif (level_grid[i][j] == 3):
				var tile = tiles[3].instance()
				add_child(tile)
				var pos = grid_to_pixel(i, j)
				tile.position = Vector2(pos[0], pos[1])
				tile.z_index = 2
			elif (level_grid[i][j] == 4):
				var tile = tiles[4].instance()
				add_child(tile)
				var pos = grid_to_pixel(i, j)
				tile.position = Vector2(pos[0], pos[1])
				tile.z_index = 2
			elif (level_grid[i][j] == 5):
				var tile = tiles[5].instance()
				add_child(tile)
				var pos = grid_to_pixel(i, j)
				tile.position = Vector2(pos[0], pos[1])
				tile.z_index = 2
			elif (level_grid[i][j] == 6):
				var tile = tiles[6].instance()
				add_child(tile)
				var pos = grid_to_pixel(i, j)
				tile.position = Vector2(pos[0], pos[1])
				tile.z_index = 2
	
# Function to reset the board
func delete_level():
#	for n in get_node(".").get_children():
#		if(n != get_node(".").get_child(0) && n != get_node(".").get_child(1) && n != get_node(".").get_child(2)):
#			get_node(".").remove_child(n)
#			n.queue_free()
	for n in range (0,get_node(".").get_child_count()-1):
		get_node(".").remove_child(get_node(".").get_child(0))
		get_node(".").get_child(0).queue_free()

func move(dir):
	if (dir != Vector2(0, 0)):
		var target = Vector2(blankboxposition[0] + dir[0], blankboxposition[1] + dir[1])
		if(target[0] == -1 or target[0] == 5 or target[1] == -1 or target[1] == 5):
			return
		else:
			SoundController.playSound("res://Sound/slide.mp3")
			var target_value = level_grid[target[0]][target[1]]
			level_grid[target[0]][target[1]] = 0
			level_grid[blankboxposition[0]][blankboxposition[1]] = target_value
			blankboxposition[0] = target[0]
			blankboxposition[1] = target[1]
			draw_level()

func moveRight():
	move(Vector2(-1, 0))

func moveLeft():
	move(Vector2(1, 0))
	
func moveUp():
	move(Vector2(0, 1))
	
func moveDown():
	move(Vector2(0, -1))

func check_inputs():
	# Calculate the direction the player is trying to go
	var dir = Vector2(0, 0)
	if (Input.is_action_just_pressed("ui_right")):
		dir = Vector2(-1, 0)
	elif (Input.is_action_just_pressed("ui_left")):
		dir = Vector2(1, 0)
	elif (Input.is_action_just_pressed("ui_up")):
		dir = Vector2(0, 1)
	elif (Input.is_action_just_pressed("ui_down")):
		dir = Vector2(0, -1)
	elif (Input.is_action_just_pressed("ui_accept")):
		var win = checkWinCondition('A','1')
		if(win):
			SoundController.playSound("res://Sound/correct.mp3")
#			points += 1
#			generateGoal()
			rearrange()
			draw_level()
		else:
			SoundController.playSound("res://Sound/wrong.mp3")
#			var alertnode = alert.instance()
#			add_child(alertnode)
#			alertnode.z_index = 3
		
	# Move the player to the new position
	if (dir != Vector2(0, 0)):
		var target = Vector2(blankboxposition[0] + dir[0], blankboxposition[1] + dir[1])
		if(target[0] == -1 or target[0] == 5 or target[1] == -1 or target[1] == 5):
			return
		else:
			SoundController.playSound("res://Sound/slide.mp3")
			var target_value = level_grid[target[0]][target[1]]
			level_grid[target[0]][target[1]] = 0
			level_grid[blankboxposition[0]][blankboxposition[1]] = target_value
			blankboxposition[0] = target[0]
			blankboxposition[1] = target[1]
			draw_level()
		
	# Set direction back to nothing
	dir = Vector2(0, 0)

func rearrange():
	for i in range(1000):
		random.randomize()
		var x1 = random.randi_range(0, 4)
		random.randomize()
		var y1 = random.randi_range(0, 4)
		random.randomize()
		var x2 = random.randi_range(0, 4)
		random.randomize()
		var y2 = random.randi_range(0, 4)

		var target = level_grid[x2][y2]

		level_grid[x2][y2] = level_grid[x1][y1]
		level_grid[x1][y1] = target

func checkWinCondition(goalNumber, goalLetter):
	
	#initialize variable coordinates for runner
	var checkX = 0
	var checkY = 0
	
	#initailize goal coorindate
	var goalX
	var goalY
	
	#initialize variables used for checking
	var checkDir = 'D'
	var endState = false
	
	#set starting coordinates
	if (goalLetter == 'A'):
		checkX = 0
	elif (goalLetter == 'B'):
		checkX = 1
	elif (goalLetter == 'C'):
		checkX = 2
	elif (goalLetter == 'D'):
		checkX = 3
	elif (goalLetter == 'E'):
		checkX = 4
		
	#set goal coordinates
	if (goalNumber == '1'):
		goalX = -1
		goalY = 1
	elif (goalNumber == '2'):
		goalX = -1
		goalY = 3
	elif (goalNumber == '3'):
		goalX = 1
		goalY = 5
	elif (goalNumber == '4'):
		goalX = 3
		goalY = 5
	elif (goalNumber == '5'):
		goalX = 5
		goalY = 3
	elif (goalNumber == '6'):
		goalX = 5
		goalY = 1
	
	#run through path starting from letter to end of path
	while (true):
		if (checkDir == 'D' and checkY != 5):
			if (level_grid[checkX][checkY] == 1):
				checkDir = 'R'
				checkX += 1
			elif (level_grid[checkX][checkY] == 2):
				checkDir = 'L'
				checkX -= 1
			elif (level_grid[checkX][checkY] == 6):
				checkDir = 'D'
				checkY += 1
			else:
				break
		elif (checkDir == 'R' and checkX != 5):
			if (level_grid[checkX][checkY] == 2):
				checkDir = 'U'
				checkY -= 1
			elif (level_grid[checkX][checkY] == 4):
				checkDir = 'D'
				checkY += 1
			elif (level_grid[checkX][checkY] == 5):
				checkDir = 'R'
				checkX += 1
			else:
				break
		elif (checkDir == 'L' and checkX != -1):
			if (level_grid[checkX][checkY] == 1):
				checkDir = 'U'
				checkY -= 1
			elif (level_grid[checkX][checkY] == 3):
				checkDir = 'D'
				checkY += 1
			elif (level_grid[checkX][checkY] == 5):
				checkDir = 'L'
				checkX -= 1
			else:
				break
		elif (checkDir == 'U' and checkY != -1):
			if (level_grid[checkX][checkY] == 3):
				checkDir = 'R'
				checkX += 1
			elif (level_grid[checkX][checkY] == 4):
				checkDir = 'L'
				checkX -= 1
			elif (level_grid[checkX][checkY] == 6):
				checkDir = 'U'
				checkY -= 1
			else:
				break
		else:
			break
	
	#set endState true if goal is reached
	if (checkX == goalX):
		if (checkY == goalY):
			endState = true
	
	#return endState which is if win condition is met
	return endState
