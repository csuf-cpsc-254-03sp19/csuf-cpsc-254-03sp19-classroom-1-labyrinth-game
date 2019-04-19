extends Sprite

var speed = 256
var tile_size = 16

var last_position = self.position
var target_position = self.position
var movedir = Vector2(0,0)

func _ready():
	position = target_position.snapped(Vector2(tile_size, tile_size))
	last_position = position 
	target_position = position

func get_movedir():
	var LEFT = Input.is_action_pressed("ui_left")
	var RIGHT = Input.is_action_pressed("ui_right")
	var UP = Input.is_action_pressed("ui_up")
	var DOWN = Input.is_action_pressed("ui_down")
	
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)
	
	if(movedir.x != 0 && movedir.y != 0):
		movedir = Vector2(0, 0)


func _process(delta):
	if (position == target_position):
		get_movedir()
		last_position = position
		target_position += movedir * tile_size
		
	else:
		position += speed * movedir * delta
		var distance = (position - last_position).abs().length()
		if(distance > tile_size - speed * delta):
			position = target_position

