extends Sprite

var speed = 256
var tile_size = 64 

var target_position = self.position
var movedir3 #the direction the AI will move as a Vector3
var movedir2 = Vector2(0,0) #the direction the AI will move as a vector 2
var path
var GoalLocation = Vector2(1,2)
var graph = AStar.new()
var aiID
var goalID

func _ready():
	# Snaps AI to the grid
	position = target_position.snapped(Vector2(tile_size, tile_size))
	pass


func _process(delta):
	#Checks if a player has won yet
	if(!GameState.playerWin && !GameState.aiWin and get_node("/root/Node2D/player").position/64 != GoalLocation):
		#if the game is being played
		if(GameState.playing):
			#checks if its the AIs turn to shift the grid
			if(GameState.aiShift):
				#Gets the grid and finds the path to the goal if avaliable
				graph = get_parent().getGrid()
				var points = graph.get_points()
				var path
				for point in points:
					if(graph.get_point_position(point) == Vector3(position.x/64, position.y/64, 0)):
						aiID = point
					if(graph.get_point_position(point) == Vector3(GoalLocation.x, GoalLocation.y, 0)):
						goalID = point
				path = graph.get_id_path(aiID, goalID)
				#ToDo Create logic to have the AI shift near the player if the AI has a path to the goal, or near the AI if the AI does not have a path to the goal
				if(graph.get_point_weight_scale(path[1]) > 1):
					GameState.aiShift = false
					GameState.aiMove = true
					pass
				else:
					GameState.aiShift = false
					GameState.aiMove = true
					pass
			#checks if its the AI's turn to move
			if(GameState.aiMove):
				#gets the grid an the path to the goal
				graph = get_parent().getGrid()
				var points = graph.get_points()
				var path
				for point in points:
					if(graph.get_point_position(point) == Vector3(position.x/64, position.y/64, 0)):
						aiID = point
					if(graph.get_point_position(point) == Vector3(GoalLocation.x, GoalLocation.y, 0)):
						goalID = point
				path = graph.get_id_path(aiID, goalID)
				#if there is no path to the goal, get a point that moves the AI to the closest point it can
				if(graph.get_point_weight_scale(path[1]) > 1):
					movedir3 = graph.get_point_position(graph.get_closest_point(Vector3(position.x/64, position.y/64, 0)))
				#otherwise follow the path to the goal
				else:
					movedir3 = graph.get_point_position(path[1])
				#convert the vector3 movement to vector2
				movedir2 = Vector2(movedir3.x,movedir3.y)
				position = movedir2 * 64
				GameState.aiMove = false
				#checks if the AI has won
				if(position/64 == GoalLocation):
					GameState.aiWin = true
					get_node("/root/Node2D/player/HUD").show_message("You loose!")
				else:
					get_node("/root/Node2D/TileMap").random_shift()
					#show message for AI winning
					
	pass


