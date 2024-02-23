extends Node

@onready var coins_label = %CoinsLabel
var coins = 0

func add_coin():
	coins += 1
	print(coins)
	coins_label.text = "coins : " + str(coins)
