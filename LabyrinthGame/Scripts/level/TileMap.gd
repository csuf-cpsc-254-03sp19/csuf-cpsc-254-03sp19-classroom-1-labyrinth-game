extends TileMap

var gridSet = []  # a list that will hold each value of the play field
var playerLocation = Vector2(-3, 6)
var aiLocation = Vector2(5, -2)
var goalLocation = Vector2(1, 2)

func _ready():
	
	# populate gridSet with vectors that represent each cell in the playfield
	for i in range(-3, 5):      # for some reason the 0,0 location is in the middle of the playfield so the 
		for j in range(-2, 6):  # top left area of the grid is located at (-3,-2)
			gridSet.append(Vector2(i, j))
			
	
	#generate a random seed for each time the game is opened
	randomize()
	# populate the new gridset with randomly generated walls
	for i in range(len(gridSet)):
		var rand = randf()*11+1		
		# check if location is a designated to player, ai, or goal
		if(gridSet[i] != playerLocation && gridSet[i] != aiLocation && gridSet[i] != goalLocation):
			if(rand < 6):
				set_cellv(gridSet[i], 0)
	
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
