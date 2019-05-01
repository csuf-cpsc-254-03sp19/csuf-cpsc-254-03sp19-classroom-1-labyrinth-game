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
	if(GameState.playing):
		if(GameState.aiMove):
			graph = get_parent().getGrid()
			var points = graph.get_points()
			var path
			for point in points:
				if(graph.get_point_position(point) == Vector3(position.x/64, position.y/64, 0)):
					aiID = point
					print(aiID)
				if(graph.get_point_position(point) == Vector3(GoalLocation.x, GoalLocation.y, 0)):
					goalID = point
			path = graph.get_id_path(aiID, goalID)
			if(path == null):
				movedir3 = graph.get_closest_point(Vector3(position.x/64, position.y/64, 0))
			else:
				movedir3 = graph.get_point_position(path[1])
			movedir2 = Vector2(movedir3.x,movedir3.y)
			position = movedir2 * 64
			GameState.aiMove = false
			print(position/64)
	pass


