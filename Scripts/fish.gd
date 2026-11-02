extends Node2D
var clownfish_base = 25
var cod_base = 25
var goldfish_base = 15
var total: float = 0 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Cod.visible = false
	$Clownfish.visible = false
	$Goldfish.visible = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func pick_fish() -> void:	
	var pick = randf()
	if get_parent().CfL_amount > 0:
		get_parent().CfL_amount += -1
		if pick > 0.3:
			$Clownfish.visible = true
			clownfish_picked()
			$ShowFish.start()
			$Label.text = ('You caught a Clownfish!')
		if pick < 0.15:
			$Cod.visible = true
			cod_picked()
			$ShowFish.start()
			$Label.text = ('You caught a Cod!')
		if pick > 0.15 and pick < 0.3:
			$Goldfish.visible = true
			goldfish_picked()
			$ShowFish.start()
			$Label.text = ('You caught a Goldfish!')
		if pick == 0.3 or pick == 0.15:
			pick_fish()
			
			
	elif get_parent().CodL_amount > 0:
		get_parent().CodL_amount += -1
		if pick > 0.15 and pick < 0.3:
			$Clownfish.visible = true
			clownfish_picked()
			$ShowFish.start()
			$Label.text = ('You caught a Clownfish!')
		if pick > 0.3:
			$Cod.visible = true
			cod_picked()
			$ShowFish.start()
			$Label.text = ('You caught a Cod!')
		if pick < 0.15:
			$Goldfish.visible = true
			goldfish_picked()
			$ShowFish.start()
			$Label.text = ('You caught a Goldfish!')
		if pick == 0.3 or pick == 0.15:
			pick_fish()
			
			
	elif get_parent().GfL_amount > 0:
		get_parent().GfL_amount += -1
		if pick < 0.15:
			$Clownfish.visible = true
			clownfish_picked()
			$ShowFish.start()
			$Label.text = ('You caught a Clownfish!')
		if pick > 0.15 and pick < 0.3:
			$Cod.visible = true
			cod_picked()
			$ShowFish.start()
			$Label.text = ('You caught a Cod!')
		if pick > 0.3:
			$Goldfish.visible = true
			goldfish_picked()
			$ShowFish.start()
			$Label.text = ('You caught a Goldfish!')
		if pick == 0.3 or pick == 0.15:
			pick_fish()
			
			
	else:
		if pick < 0.33:
			$Clownfish.visible = true
			clownfish_picked()
			$ShowFish.start()
			$Label.text = ('You caught a Clownfish!')
		if pick > 0.66:
			$Cod.visible = true
			cod_picked()
			$ShowFish.start()
			$Label.text = ('You caught a Cod!')
		if pick > 0.33 and pick< 0.66:
			$Goldfish.visible = true
			goldfish_picked()
			$ShowFish.start()
			$Label.text = ('You caught a Goldfish!')
		else:
			pick_fish()
func _on_show_fish_timeout() -> void:
	$Clownfish.visible = false
	$Cod.visible = false
	$Goldfish.visible = false
	$Label.text = ('')
func clownfish_picked() -> void:
	var weight = randf() * 2.50
	if get_parent().FC_amount > 0:
		get_parent().FC_amount += -1
		weight = weight * 3
		print('Weight is',str(weight))
		if get_parent().perfect:
			total = clownfish_base * weight * 2
		elif get_parent().good:
			total = clownfish_base * weight * 1.5
		elif get_parent().meh:
			total = clownfish_base * weight
		elif get_parent().bad:
			total = clownfish_base * weight * 0.5
	else:
		print('Weight is',str(weight))
		if get_parent().perfect:
			total = clownfish_base * weight * 2
		elif get_parent().good:
			total = clownfish_base * weight * 1.5
		elif get_parent().meh:
			total = clownfish_base * weight
		elif get_parent().bad:
			total = clownfish_base * weight * 0.5
	print(total)
	convert_to_coins()
	
func cod_picked() -> void:
	var weight = randf() * 5.00
	if get_parent().FC_amount > 0:
		get_parent().FC_amount += -1
		weight = weight * 3
		print('Weight is', str(weight))
		if get_parent().perfect:
			total = cod_base * weight * 2
		elif get_parent().good:
			total = cod_base * weight * 1.5
		elif get_parent().meh:
			total = cod_base * weight
		elif get_parent().bad:
			total = cod_base * weight * 0.5
			
			
	else:
		print('Weight is',str(weight))
		if get_parent().perfect:
			total = cod_base * weight * 2
		elif get_parent().good:
			total = cod_base * weight * 1.5
		elif get_parent().meh:
			total = cod_base * weight
		elif get_parent().bad:
			total = cod_base * weight * 0.5
	print(total)
	convert_to_coins()
	
func goldfish_picked() -> void:
	var weight = randf() * 3.00
	if get_parent().FC_amount > 0:
		get_parent().FC_amount += -1
		weight = weight * 3
		print('Weight is', str(weight))
		if get_parent().perfect:
			total = goldfish_base * weight * 2
		elif get_parent().good:
			total = goldfish_base * weight * 1.5
		elif get_parent().meh:
			total = goldfish_base * weight
		elif get_parent().bad:
			total = goldfish_base * weight * 0.5
			
			
	else:
		print('Weight is',str(weight))
		if get_parent().perfect:
			total = goldfish_base * weight * 2
		elif get_parent().good:
			total = goldfish_base * weight * 1.5
		elif get_parent().meh:
			total = goldfish_base * weight
		elif get_parent().bad:
			total = goldfish_base * weight * 0.5
	print(total)
	convert_to_coins()
	

func convert_to_coins() -> void:
	#until you can store the value for each caught fish 
	MainCharacter.total_coins = int(total) + MainCharacter.total_coins
	$Coins.text = ("Coins: " +str(MainCharacter.total_coins))
	print(MainCharacter.total_coins)
	total = 0
