#this script draws the lines on the screen to make the game more visually appealing

extends Node2D

#Gets the size of the tilemap
onready var tilemap_rect = get_parent().get_used_rect()
onready var tilemap_cell_size = get_parent().cell_size
onready var color = Color(0.0, 0.0, 0.0)

func _ready():
	position = tilemap_rect.position * tilemap_cell_size
	set_process(true)

func _process(delta):
	update()
	
#Draws the lines based on the size of the grid
func _draw():
	for y in range(0, tilemap_rect.size.y):
		draw_line(Vector2(0, y * tilemap_cell_size.y), Vector2(tilemap_rect.size.x * tilemap_cell_size.x, y * tilemap_cell_size.y), color)
	for x in range(0, tilemap_rect.size.x):
		draw_line(Vector2(x * tilemap_cell_size.x, 0), Vector2(x * tilemap_cell_size.x, tilemap_rect.size.y * tilemap_cell_size.y), color)