extends KinematicBody2D


export var speed = 200

var setup_complete = false
# Determins the character number and thus which controls to use
var player_number:int


func _ready() -> void:
	if not setup_complete:
		Globals.Error(
			"Setup not completed before adding player",
			"Use player 0 setup"
		)
		setup(0)

func _physics_process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("player%s_up"%player_number):
		velocity.y -= 1
	if Input.is_action_pressed("player%s_down"%player_number):
		velocity.y += 1
	if Input.is_action_pressed("player%s_left"%player_number):
		velocity.x -= 1
	if Input.is_action_pressed("player%s_right"%player_number):
		velocity.x += 1
	
	var collisions = move_and_collide(velocity.normalized() * speed * delta)

	if collisions:
		print("Player%s: owch"%player_number)

func setup(player_no:int) -> void:
	player_number = player_no
	
	if player_number == 0:
		modulate = "#ff0000"
	else:
		modulate = "#00ff00"

	setup_complete = true
