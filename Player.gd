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
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

func _input(event):
   # Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		if event.pressed:
			$MyLine.clear_points()
	   #get position of player
	   #get position of the mouse when clicked.
	   #draw a line between the two points.
	   #print("player position: "+ str(position))
	   #print("Mouse Click/Unclick at: ", event.position)
			createLine(position,event.position)
   #elif event is InputEventMouseMotion:
	   #print("Mouse Motion at: ", event.position)

func createLine(from, to):
  print("From: "+ str(from))
  print("To: "+ str(to))
  $MyLine.add_point(from,0)
  $MyLine.add_point(to,1)

	


func removeLine():
  $MyLine.points = []

	
	
	
