extends Line2D

func _input(event):
   # Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		if event.pressed:
			clear_points()
			
	   #get position of player
	   #get position of the mouse when clicked.
	   #draw a line between the two points.
	   #print("player position: "+ str(position))
	   #print("Mouse Click/Unclick at: ", event.position)
			createLine(global_position,event.global_position)
   #elif event is InputEventMouseMotion:
	   #print("Mouse Motion at: ", event.position)

func createLine(from, to):
  print("From: "+ str(from))
  print("To: "+ str(to))
  add_point(from,0)
  add_point(to,1)
