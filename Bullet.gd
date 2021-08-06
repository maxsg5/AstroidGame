extends Area2D


# Declare member variables here.
var speed = 10
var movement = Vector2()
onready var playerpos = get_parent().position
onready var mouse_pos = null
var distanceBetween = 0;

func _ready():
	mouse_pos = get_local_mouse_position()
	

func _physics_process(delta):
	
	distanceBetween = DistanceBetweenTwoPoints(playerpos,position)
	print(distanceBetween)
	if(distanceBetween >= 100):
		movement = movement.move_toward(playerpos,delta)
	else:
		movement = movement.move_toward(mouse_pos,delta)
	movement = movement.normalized() * speed
	position = position + movement

func _on_Bullet_body_entered(body):
	pass
	#queue_free()

func DistanceBetweenTwoPoints(point1,point2):
	var distance = sqrt(pow(point2.x-point1.x,2) + pow(point2.y-point1.y,2) )
	#print(distance)
	return distance
