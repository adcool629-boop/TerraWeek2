extends CharacterBody2D


const SPEED = 300.0
var LastDirection: Vector2 = Vector2.RIGHT
var fishing: bool = false
var cast_finished: bool = false
var casting: bool = true
var reeling: bool = false
var shopping: bool = false
var perfect: bool = false
var good: bool = false
var meh: bool = false
var bad: bool = false
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var fishing_detector: RayCast2D = $FishingDetector
#-----------------------------------------------
#Baits
#-----------------------------------------------
var CfL_amount: int = 0
var CodL_amount: int = 0
var GfL_amount: int = 0
var FC_amount: int = 0

func _physics_process(delta: float) -> void:
	if fishing or shopping:
		velocity = Vector2.ZERO
		move_and_slide()
		return
	process_movement()
	process_animation()
	move_and_slide()
#-----------------------------------------------
#Movement and Animation
#-----------------------------------------------
 
func process_movement() -> void:
	
	var direction := Input.get_vector("Left","Right","Down","Up")
	
	if direction != Vector2.ZERO:
		velocity = direction * SPEED
		LastDirection = direction
		fishing_detector.target_position = direction * 32.0
		$FShopDetector.target_position = direction * 32.0
	else:
		velocity = Vector2.ZERO
func process_animation() -> void:
	if velocity != Vector2.ZERO:
		play_animation('Walk', LastDirection)
	else:
		play_animation('Idle', LastDirection)
		

func play_animation(prefix:String, dir: Vector2) -> void:
	if dir.x > 0:
		animated_sprite_2d.play(prefix + 'Right')
	elif dir.x < 0:
		animated_sprite_2d.play(prefix + 'Left')
	elif dir.y > 0:
		animated_sprite_2d.play(prefix + 'Down')
	elif dir.y < 0:
		animated_sprite_2d.play(prefix + 'Up')

#-----------------------------------------------
#Fishing
#-----------------------------------------------
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed('Fishing') and not fishing:
		if fishing_detector.is_colliding():
			start_fishing()
		else:
			$FishError.text = ('Get closer and face the water')
			$ErrorTimer.start()
			
	if $FShopDetector.is_colliding():
		$ShopHelp.text = ('Press F to Interact')
		if $FShopDetector.is_colliding() and event.is_action_pressed('Interact'):
			$FishingShop.set_process(true)
			$FishingShop.set_process_input(true)
			$FishingShop.visible = true
			shopping = true
	elif not $FShopDetector.is_colliding():
			$ShopHelp.text = ("")
			
			
#Making the fishing more organized
func start_fishing() -> void:
	$FishingSC.visible = true
	$FishingSC.set_process(true)
	$FishingSC.set_process_input(true)
	fishing = true
	casting = true
	process_cast()
func cast_end() -> void:
	$FishingSC.visible = false
	$FishingSC.set_process(false)
	$FishingSC.set_process_input(false)
	casting = false
	cast_finished = true
	process_wait()
	
	

func process_cast() -> void:
	if casting:
		play_cast('Cast', LastDirection)
func play_cast(prefix:String, dir: Vector2) -> void:
	if dir.x > 0:
		animated_sprite_2d.play(prefix + 'Right')
	elif dir.x < 0:
		animated_sprite_2d.play(prefix + 'Left')
	elif dir.y > 0:
		animated_sprite_2d.play(prefix + 'Down')
	elif dir.y < 0:
		animated_sprite_2d.play(prefix + 'Up')
	
func process_wait() -> void:
	if cast_finished:
		play_wait('Wait', LastDirection)
		wait_time()
func play_wait(prefix:String, dir: Vector2) -> void:
	if dir.x > 0:
		animated_sprite_2d.play(prefix + 'Right')
	elif dir.x < 0:
		animated_sprite_2d.play(prefix + 'Left')
	elif dir.y > 0:
		animated_sprite_2d.play(prefix + 'Down')
	elif dir.y < 0:
		animated_sprite_2d.play(prefix + 'Up')

func _on_error_timer_timeout() -> void:
	$FishError.text = ("")

#-----------------------------------------------
#Fishing Mini Games
#-----------------------------------------------
func wait_time() -> void:
	var waiting = randf() * 20
	$WaitTimer.wait_time = waiting
	$WaitTimer.start()


func _on_wait_timer_timeout() -> void:
	print("Mini-Game Start")
	reeling = true 
	minigame_select()
	process_reel()
func minigame_select() -> void:
	# When more minigames are made use this to randomly select one.
	quick_time_start()

func quick_time_start() -> void:
	if reeling:
		$MiniGame1.visible = true
		$MiniGame1.set_process(true)
		$MiniGame1.set_process_input(true)
		get_child(7).minigame_start()
func quick_time_end() -> void:
		reeling = false
		fishing = false
		$MiniGame1.visible = false
		$MiniGame1.set_process(false)
		$MiniGame1.set_process_input(false)
func process_reel() -> void:
	if reeling:
		play_reel('Reel', LastDirection)
		
func play_reel(prefix:String, dir: Vector2) -> void:
	if dir.x > 0:
		animated_sprite_2d.play(prefix + 'Right')
	elif dir.x < 0:
		animated_sprite_2d.play(prefix + 'Left')
	elif dir.y > 0:
		animated_sprite_2d.play(prefix + 'Down')
	elif dir.y < 0:
		animated_sprite_2d.play(prefix + 'Up')
		
func fish_caught() -> void:
	get_child(9).pick_fish()


#-----------------------------------------------
#Shops
#-----------------------------------------------
func done_shopping() -> void:
	$FishingShop.visible = false
	$FishingShop.set_process(false)
	$FishingShop.set_process_input(false)
	shopping = false
