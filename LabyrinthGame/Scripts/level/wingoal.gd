extends Sprite

var tile_size = 64

func _ready():
	position = self.position.snapped(Vector2(tile_size, tile_size))
	pass

