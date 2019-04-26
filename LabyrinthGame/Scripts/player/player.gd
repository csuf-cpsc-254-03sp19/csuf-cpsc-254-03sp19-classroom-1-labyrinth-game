extends Sprite

onready var ray = $RayCast2D

var speed = 256
var tile_size = 64 

var last_position = self.position
var target_position = self.position
var movedir = Vector2(0,0)
var goalPosition = Vector2(64, 128)

func _ready():
	# Snaps player to the grid
	position = target_position.snapped(Vector2(tile_size, tile_size))
	last_position = position 
	target_position = position

func get_movedir():
	# Define directions player can move
	var LEFT = Input.is_action_pressed("ui_left")
	var RIGHT = Input.is_action_pressed("ui_right")
	var UP = Input.is_action_pressed("ui_up")
	var DOWN = Input.is_action_pressed("ui_down")
	
	# prevents the player from trying to move in multiple directions
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)
	
	# prevents the player from moving diagonally
	if(movedir.x != 0 && movedir.y != 0):
		movedir = Vector2(0, 0)
		
	#
	if(movedir != Vector2(0, 0)):
		ray.cast_to = movedir * tile_size /2


func _process(delta):
	# records the current positon of the player when idle and checks what direction the player wants to move
	if(self.position != goalPosition):
		if (position == target_position):
			get_movedir()
			last_position = position
			target_position += movedir * tile_size
			
		else:
			#if the player wants to move in a direction that has a wall, sets the position back to its last position
			if(ray.is_colliding()):
				target_position = last_position
				
			# otherwise move the player to the new location 
			else:
				position += speed * movedir * delta
				var distance = (position - last_position).abs().length()
				if(distance > tile_size - speed * delta):
					position = target_position
	else:
		var label = find_node("Label")
		label.show()
		

