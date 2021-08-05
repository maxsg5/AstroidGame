extends KinematicBody2D

export var speed = 400  # How fast the player will move (pixels/sec).
var screen_size  # Size of the game window.



# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2()  # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		# the global_position method tells you where the node is on the screen
		# the position method tells were you are compared to the starting point of this node
		global_position += velocity * delta
	global_position.x = clamp(global_position.x, 50, screen_size.x-50)
	global_position.y = clamp(global_position.y, 34, screen_size.y-34)


func removeLine():
	$MyLine.points = []
	
