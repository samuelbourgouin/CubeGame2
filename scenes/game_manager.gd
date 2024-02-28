extends Node

@onready var coins_label = %coinsLabel
@onready var key_label = %keyLabel

var current_checkpoint : Checkpoint
var player : main_character
var coins = 0
var key = 0

func add_coin():
	coins += 1
	print(coins)
	coins_label.text = "coins : " + str(coins)

func add_key():
	key += 1
	print(key)
	key_label.text = "key : " + str(key)

func remove_key(numberOfKey):
	key -= numberOfKey
	key_label.text = "key : " + str(key)

func respawn_player():
	if current_checkpoint != null:
		player.position = current_checkpoint.global_position
