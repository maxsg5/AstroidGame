extends Node2D

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
	# magic key to the line
	$MyLine.global_position=Vector2(0,0)
func _input(event):
	
	 # Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		if event.pressed:
			# We clicked the mouse -> shoot()
			$Chain.shoot(event.position - get_viewport().size * 0.5)
			createLine(global_position,get_global_mouse_position())
		else:
			# We released the mouse -> release()
			$Chain.release()
  
	#press esc to clear line points DEBUGGING purposes.
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ESCAPE:
			$MyLine.clear_points()
			
	   #get position of player
	   #get position of the mouse when clicked.
	   #draw a line between the two points.
			

func createLine(from, to):
  print("From: "+ str(from))
  print("To: "+ str(to))
  $MyLine.add_point(from,0)
  $MyLine.add_point(to,1)

func removeLine():
	$MyLine.points = []
	
