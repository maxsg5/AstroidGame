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
	var y1 = 0#-spacing
	var y2 = 0#screen_size.y + spacing
	# gives asteroids their starting position and path to follow
	print(self.global_position)
	
	
