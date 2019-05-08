extends TileMap

var gridSet = []  # a list that will hold each value of the play field
var playerLocation = Vector2(-3, 6)
var aiLocation = Vector2(5, -2)
var goalLocation = Vector2(1, 2)

func _ready():
	
	
	# (Switched x and y to ensure right counting) populate gridSet with vectors that represent each cell in the playfield
	for i in range(-2, 7):      # for some reason the 0,0 location is in the middle of the playfield so the 
		for j in range(-3, 6):  # top left area of the grid is located at (-3,-2)
			gridSet.append(Vector2(j, i))
			
	
	#generate a random seed for each time the game is opened
	randomize()
	# populate the new gridset with randomly generated walls
	for i in range(len(gridSet)):
		print(i)
		var rand = randf()*11+1		
		# check if location is a designated to player, ai, or goal
		if(gridSet[i] != playerLocation && gridSet[i] != aiLocation && gridSet[i] != goalLocation):
			#Based on a random number, set the tile to black (not usable) or white
			if(rand < 6):
				set_cellv(gridSet[i], 0)
	
	pass

#func getGrid():
#	var grid = AStar.new()
#	var id = 0
#	for i in range(len(gridSet)):
#		if(get_cellv(gridSet[i]) != 0):
#			grid.add_point(id, Vector3(gridSet[i].x, gridSet[i].y, 0), 1)
#			id = id + 1
#	grid.add_point(id, Vector3(aiLocation.x, aiLocation.y, 0), 1)
#	var points = grid.get_points()
#
#	for point in points:
#		for otherPoint in points:
#			if(grid.get_point_position(point).distance_squared_to(grid.get_point_position(otherPoint)) == 1):
#				grid.connect_points(point, otherPoint)
#	return grid
func getGrid():
	var grid = AStar.new()
	var id = 0
	for i in range (len(gridSet)):
		if(get_cellv(gridSet[i]) != 0):
			grid.add_point(id, Vector3(gridSet[i].x, gridSet[i].y, 0), 1)
			id = id + 1
		else:
			grid.add_point(id, Vector3(gridSet[i].x, gridSet[i].y, 0), 999)
			id = id + 1
	grid.add_point(id, Vector3(aiLocation.x, aiLocation.y, 0), 1)
	var points = grid.get_points()
	
	for point in points:
		for otherPoint in points:
			if(grid.get_point_position(point).distance_squared_to(grid.get_point_position(otherPoint)) == 1):
				grid.connect_points(point, otherPoint)
				
	return grid

#converts the game Position to the approtiative grid position
func convert_pos(position):
	return Vector2(position.x/64, position.y/64)
	
#performs the grid movement based on the input.
func shift_helper_horizontal(start,end):
	get_node("/root/Node2D/player/HUD").show_message("")
	#Store actual grid plan in case of shifting a plate ON the player, what is not allowed
	var restoreSet = []
	for i in range (0,81):
		restoreSet.append(get_cellv(gridSet[i]))
	
	#perform grid movement
	if (end > start):
		#Left to rigth
		var tempSet = []
		for x in range (start,end+1):
			tempSet.append(get_cellv(gridSet[x]))
		for x in range (start+1,end+1):
			set_cellv(gridSet[x],tempSet[x-(start+1)])
		set_cellv(gridSet[start],tempSet[8])
	else:
		var tempSet = []
		#Note: Start might be 17 and end might be lower, e.g. 9
		#Right to left
		for x in range (end,start+1):
			tempSet.append(get_cellv(gridSet[x]))
		for x in range (end,start):
			set_cellv(gridSet[x],tempSet[x-(end-1)])
		set_cellv(gridSet[start],tempSet[0])
	
	#If a plate was shifted on the player, it will be revoked and a warning message will be send out
	if(get_cellv(convert_pos(get_node("/root/Node2D/player").position)) == 0):
		get_node("/root/Node2D/player/HUD").show_message("Don't try killin' me!")
		for i in range (0,81):
			set_cellv(gridSet[i],restoreSet[i])
	if(get_cellv(convert_pos(get_node("/root/Node2D/TileMap/AI").position)) == 0):
		get_node("/root/Node2D/player/HUD").show_message("Don't try killin' me!")
		for i in range (0,81):
			set_cellv(gridSet[i],restoreSet[i])


	
#This function realizes the random tile shift
func random_shift():
	var rando = range(1,16)[randi()%range(1,16).size()]
	if (rando == 1):
		_on_HUD_Shift_63_71()
	if (rando == 2):
		_on_HUD_Shift_45_53()
	if (rando == 3):
		_on_HUD_Shift_27_35()
	if (rando == 4):
		_on_HUD_Shift_9_17()
	if (rando == 5):
		_on_HUD_Shift_17_9()
	if (rando == 6):
		_on_HUD_Shift_35_27()
	if (rando == 7):
		_on_HUD_Shift_53_45()
	if (rando == 8):
		_on_HUD_Shift_71_63()
	if (rando == 9):
		_on_HUD_ShiftDown1()
	if (rando == 10):
		_on_HUD_ShiftDown3()
	if (rando == 11):
		_on_HUD_ShiftDown5()
	if (rando == 12):
		_on_HUD_ShiftDown7()
	if (rando == 13):
		_on_HUD_ShiftDownN1()
	if (rando == 14):
		_on_HUD_ShiftDownN3()
	if (rando == 15):
		_on_HUD_ShiftDownN5()
	if (rando == 16):
		_on_HUD_ShiftDownN7()

#implementing Shifting
func _on_HUD_Shift_63_71():
	shift_helper_horizontal(63,71)

func _on_HUD_Shift_45_53():
	shift_helper_horizontal(45,53)
	
func _on_HUD_Shift_27_35():
	shift_helper_horizontal(27,35)

func _on_HUD_Shift_9_17():
	shift_helper_horizontal(9,17)

func _on_HUD_Shift_17_9():
	shift_helper_horizontal(17,9)

func _on_HUD_Shift_35_27():
	shift_helper_horizontal(35,27)

func _on_HUD_Shift_53_45():
	shift_helper_horizontal(53,45)

func _on_HUD_Shift_71_63():
	shift_helper_horizontal(71,63)

func shift_helper_vertical(column):
	get_node("/root/Node2D/player/HUD").show_message("")
	#Store actual grid plan in case of shifting a plate ON the player, what is not allowed
	var restoreSet = []
	for i in range (0,81):
		restoreSet.append(get_cellv(gridSet[i]))
	
	#perform grid movement
	if (column > 0):
		#Perform grid down movement
		var tempSet = []
		for i in range(column,(81+column),9):
			tempSet.append(get_cellv(gridSet[i]))
		for i in range((column+9),(81+column),9):
			set_cellv(gridSet[i],tempSet[(i-10)/9])
		set_cellv(gridSet[column],tempSet[8])
	else:
		#Perform grid up movement
		var tempSet = []
		column = -column
		for i in range(column,(81+column),9):
			tempSet.append(get_cellv(gridSet[i]))
		for i in range((column),(72+column),9):
			set_cellv(gridSet[i],tempSet[(i+10)/9])
		set_cellv(gridSet[column+72],tempSet[0])
		
	
	#If a plate was shifted on the player, it will be revoked and a warning message will be send out
	if(get_cellv(convert_pos(get_node("/root/Node2D/player").position)) == 0):
		get_node("/root/Node2D/player/HUD").show_message("Don't try killin' me!")
		for i in range (0,81):
			set_cellv(gridSet[i],restoreSet[i])
	if(get_cellv(convert_pos(get_node("/root/Node2D/TileMap/AI").position)) == 0):
		get_node("/root/Node2D/player/HUD").show_message("Don't try killin' me!")
		for i in range (0,81):
			set_cellv(gridSet[i],restoreSet[i])
	pass
	
func _on_HUD_ShiftDown1():
	shift_helper_vertical(1)


func _on_HUD_ShiftDown3():
	shift_helper_vertical(3)


func _on_HUD_ShiftDown5():
	shift_helper_vertical(5)


func _on_HUD_ShiftDown7():
	shift_helper_vertical(7)


func _on_HUD_ShiftDownN1():
	shift_helper_vertical(-1)


func _on_HUD_ShiftDownN3():
	shift_helper_vertical(-3)


func _on_HUD_ShiftDownN5():
	shift_helper_vertical(-5)


func _on_HUD_ShiftDownN7():
	shift_helper_vertical(-7)

