extends CanvasLayer
var new_letter: String = ""
var input_allowed: bool = true 
var count: int = 0
@export var progress_timer: float = 2.5
var allowed = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process(false)
	set_process_input(false)
	$".".visible = false
	
	
func minigame_start()-> void:
	allowed = true
	random_letter()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if allowed:
		if input_allowed and $TextureProgressBar.value > 0:
			$TextureProgressBar.value -= 1.0
			print($TextureProgressBar.value)
	
func _unhandled_input(event: InputEvent) -> void:
	if allowed:
		if not event is InputEventKey:
			return
		if event.is_action_pressed('PressQ') and new_letter == 'Q' and input_allowed:
			print('Correct')
			$Cooldown.start()
			input_allowed = false
			$Label.text = ("")
			count += 1
			print(count)
			$TextureProgressBar.value += 100
		if event.is_action_pressed('PressE') and new_letter == 'E' and input_allowed:
			print('Correct')
			$Cooldown.start()
			input_allowed = false
			$Label.text = ("")
			count += 1
			print(count)
			$TextureProgressBar.value += 100
		if not event.is_action_pressed('PressE') and not event.is_action_pressed('PressQ') and input_allowed:
			print('Wrong')
			input_allowed = false
		
			$Label.text = ("You Lose")
func random_letter() -> void:
	if allowed:
		if count == 10:
			$Timer.stop()
			win()
			return
		var letter = randf() 
		if letter < 0.50:
			$Label.text = ("Q")
			new_letter = "Q"
		elif letter > 0.5:
			new_letter = "E"
			$Label.text = ("E")
		else:
			random_letter()
		input_allowed = true
		$Timer.start()
		
			
func _on_cooldown_timeout() -> void:
	random_letter()
	


func _on_timer_timeout() -> void:
	print("You ran out of time")
	$Label.text = ("You Lose")
	$EndTimer.start()
func win() -> void:
	print("You Win!")
	$Label.text = ("You Win!")
	$WinTimer.start()
func _on_end_timer_timeout() -> void:
	get_parent().quick_time_end()
	count = 0


func _on_win_timer_timeout() -> void:
	get_parent().fish_caught()
	get_parent().quick_time_end()
	count = 0
