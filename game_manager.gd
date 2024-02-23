extends Node

@onready var coins_label = %CoinsLabel
@onready var key_label = %keyLabel

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
