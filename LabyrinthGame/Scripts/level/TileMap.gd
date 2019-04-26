extends TileMap

var gridSet = []  # a list that will hold each value of the play field
var playerLocation = Vector2(-3, 6)
var aiLocation = Vector2(5, -2)
var goalLocation = Vector2(1, 2)

func _ready():
	
	# populate gridSet with vectors that represent each cell in the playfield
	#for i in range(-3, 6):      # for some reason the 0,0 location is in the middle of the playfield so the 
	#	for j in range(-2, 7):   # y //top left area of the grid is located at (-3,-2)
	#		gridSet.append(Vector2(i, j))
	
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
			if(rand < 6):
				set_cellv(gridSet[i], 0)
	
	pass


func convert_pos(position):
	return Vector2(position.x/64, position.y/64)
	
func shift_helper_horizontal(start,end):
	var tempSet = []
	for x in range (start,end+1):
		tempSet.append(get_cellv(gridSet[x]))
	for x in range (start+1,end+1):
		set_cellv(gridSet[x],tempSet[x-(start+1)])
	set_cellv(gridSet[start],tempSet[8])
	
func _on_HUD_Shift_63_71():
	shift_helper_horizontal(63,71)


func _on_HUD_Shift_45_53():
	shift_helper_horizontal(45,53)
	
func _on_HUD_Shift_27_35():
	shift_helper_horizontal(27,35)


func _on_HUD_Shift_9_17():
	shift_helper_horizontal(9,17)
