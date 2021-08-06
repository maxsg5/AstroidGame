extends RigidBody2D
# a randomizer that returns a hole number between 1 and the value of number
func _rand(number=2):
	return(randi()%number+1)

# Called when the node enters the scene tree for the first time.
func _ready():
	# sets spawn locations for asteroids
	var screen_size = get_viewport_rect().size
	var spacing = 100
	var x1 = rand_range(screen_size.x/2,screen_size.x)
	var x2 = rand_range(0,screen_size.x/2)
	var y1 = -spacing
	var y2 = screen_size.y + spacing
	var pos1 = Vector2()
	var pos2 = Vector2()
	if _rand(2)==1:
		pos1.x=x1
		pos2.x=x2
	else:
		pos1.x=x2
		pos2.x=x1
	if _rand(2)==1:
		pos1.y=y1
		pos2.y=y2
	else:
		pos1.y=y2
		pos2.y=y1
	if _rand(2)==1:
		global_position=pos1
	else:
		global_position=pos2
