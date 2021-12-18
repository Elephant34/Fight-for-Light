extends Node2D


var player_preload = preload("res://assets/sprites/player/Player.tscn")

func _ready():
	var player0_instance = player_preload.instance()
	var player1_instance = player_preload.instance()
	
	player0_instance.setup(0)
	player1_instance.setup(1)
	
	player0_instance.position = Vector2(100,100)
	
	add_child(player0_instance)
	add_child(player1_instance)
