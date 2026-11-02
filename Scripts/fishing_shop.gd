extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".visible = false
	set_process(false)
	set_process_input(false)
	$CoinsAmount.text = ("Coins: " +str(MainCharacter.total_coins))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$CoinsAmount.text = ("Coins: " +str(MainCharacter.total_coins))
	

func _on_buy_message_timer_timeout() -> void:
	$BuyMessage.text = ("")

#Clownfish Lure
func _on_clownfish_button_pressed() -> void:
	if MainCharacter.total_coins >= 200:
		MainCharacter.total_coins = MainCharacter.total_coins - 200
		get_parent().CfL_amount += 1
		print("Clownfish Lure Bought")
		$BuyMessage.text = ("Clownfish Lure Bought")
		$BuyMessage/BuyMessageTimer.start()
		$CoinsAmount.text = ("Coins: " +str(MainCharacter.total_coins))
	else:
		$BuyMessage.text = ("Not enough Coins")
		$BuyMessage/BuyMessageTimer.start()


func _on_cod_button_pressed() -> void:
	if MainCharacter.total_coins >= 300:
		MainCharacter.total_coins = MainCharacter.total_coins - 300
		get_parent().CodL_amount += 1
		print("Cod Lure Bought")
		$BuyMessage.text = ("Cod Lure Bought")
		$BuyMessage/BuyMessageTimer.start()
		$CoinsAmount.text = ("Coins: " +str(MainCharacter.total_coins))
	else:
		$BuyMessage.text = ("Not enough Coins")
		$BuyMessage/BuyMessageTimer.start()


func _on_goldfish_button_pressed() -> void:
	if MainCharacter.total_coins >= 150:
		MainCharacter.total_coins = MainCharacter.total_coins - 150
		get_parent().GfL_amount += 1
		print("Goldfish Lure Bought")
		$BuyMessage.text = ("Goldfish Lure Bought")
		$BuyMessage/BuyMessageTimer.start()
		$CoinsAmount.text = ("Coins: " +str(MainCharacter.total_coins))
	else:
		$BuyMessage.text = ("Not enough Coins")
		$BuyMessage/BuyMessageTimer.start()


func _on_fat_chance_button_pressed() -> void:
	if MainCharacter.total_coins >= 500:
		MainCharacter.total_coins = MainCharacter.total_coins - 500
		get_parent().FC_amount += 1
		print("FatChance Bait Bought")
		$BuyMessage.text = ("FatChance Bait Bought")
		$BuyMessage/BuyMessageTimer.start()
		$CoinsAmount.text = ("Coins: " +str(MainCharacter.total_coins))
	else:
		$BuyMessage.text = ("Not enough Coins")
		$BuyMessage/BuyMessageTimer.start()


func _on_close_button_pressed() -> void:
	get_parent().done_shopping()
