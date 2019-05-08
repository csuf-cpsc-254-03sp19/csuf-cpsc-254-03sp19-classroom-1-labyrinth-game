extends Sprite

var speed = 256
var tile_size = 64 

var start = Vector2(5, -2)
var last_position = self.position
var target_position = self.position
var movedir3
var movedir2 = Vector2(0,0)
var path
var GoalLocation = Vector2(1,2)
var graph = AStar.new()
var play = false
var aiID
var goalID

func _ready():
	# Snaps AI to the grid
	position = target_position.snapped(Vector2(tile_size, tile_size))
	#last_position = position 
	#target_position = position
	pass


func _process(delta):
	if(!GameState.playerWin && !GameState.aiWin and get_node("/root/Node2D/player").position/64 != GoalLocation):
		if(GameState.playing):
			if(GameState.aiShift):
				graph = get_parent().getGrid()
				var points = graph.get_points()
				var path
				for point in points:
					if(graph.get_point_position(point) == Vector3(position.x/64, position.y/64, 0)):
						aiID = point
					if(graph.get_point_position(point) == Vector3(GoalLocation.x, GoalLocation.y, 0)):
						goalID = point
				path = graph.get_id_path(aiID, goalID)
				if(graph.get_point_weight_scale(path[1]) > 1):
					#if there are walls in the way shift walls near the AI
					GameState.aiShift = false
					GameState.aiMove = true
					pass
				else:
					#if there are no walls in the way shift wall near player
					GameState.aiShift = false
					GameState.aiMove = true
					pass
			if(GameState.aiMove):
				graph = get_parent().getGrid()
				var points = graph.get_points()
				var path
				for point in points:
					if(graph.get_point_position(point) == Vector3(position.x/64, position.y/64, 0)):
						aiID = point
					if(graph.get_point_position(point) == Vector3(GoalLocation.x, GoalLocation.y, 0)):
						goalID = point
				path = graph.get_id_path(aiID, goalID)
				if(graph.get_point_weight_scale(path[1]) > 1):
					movedir3 = graph.get_point_position(graph.get_closest_point(Vector3(position.x/64, position.y/64, 0)))
				else:
					movedir3 = graph.get_point_position(path[1])
				movedir2 = Vector2(movedir3.x,movedir3.y)
				position = movedir2 * 64
				GameState.aiMove = false
				print(position/64)
				print(GoalLocation)
				if(position/64 == GoalLocation):
					GameState.aiWin = true
					get_node("/root/Node2D/player/HUD").show_message("You loose!")
				else:
					get_node("/root/Node2D/TileMap").random_shift()
					#show message for AI winning
					
	pass


