extends KinematicBody2D

export var PlayerMoveSpeed = 400
export var PlayerJumpVelocity = -1000
export var PlayerGravity = 30
export var PlayerWinCoinAmmount = 5

var velocity = Vector2(0,0)
var coins = 0

func _physics_process(delta): #this runs 60 tps because of delta
	#Walk Right
	if Input.is_action_pressed("Movement_right"):
		velocity.x = PlayerMoveSpeed
		
	#Walk Left
	elif Input.is_action_pressed("Movement_left"):
		velocity.x = -PlayerMoveSpeed
	
	#Idle Animation

	#Jump
	if Input.is_action_just_pressed("Movement_up") and is_on_floor():
		velocity.y = PlayerJumpVelocity
	velocity.y = velocity.y + PlayerGravity
	
	velocity = move_and_slide(velocity,Vector2.UP)
	
	#print(velocity.y)
	
	velocity.x = lerp(velocity.x,0,0.1)

