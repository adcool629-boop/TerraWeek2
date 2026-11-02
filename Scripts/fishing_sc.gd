extends CanvasLayer


@onready var bar: TextureRect = $Background/Bar
@onready var pin: ColorRect = $Background/Bar/Pin
@export var pin_speed: float = 800.0
@onready var rating: Label = $Label

var pin_position: float
var pin_direction: float = 1.0
var is_active: bool = false
var perfect: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process(false)
	set_process_input(false)
	$".".visible = false
	MainCharacter.fishables = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if pin_position >= 400.0:
		pin_direction = -1.0
	elif pin_position <= 8:
		pin_direction = 1.00
	pin.position.y += pin_speed * delta * pin_direction
	pin_position = pin.position.y
func _input(event: InputEvent) -> void:
	
	if event.is_action_released('Fishing'):
		if pin_position <= 21:
			print('Perfect')
			rating.text = ('Perfect!')
			get_parent().perfect = true
		elif pin_position <= 51:
			print('Good')
			rating.text = ('Good!')
			get_parent().good = true
		elif pin_position <= 115:
			print('Meh')
			rating.text = ('Meh')
			get_parent().meh = true
		else:
			print('Bad')
			rating.text = ('Bad :(')
			get_parent().bad = true
		set_process(false)
		set_process_input(false)
		$Timer.start()
		


func _on_timer_timeout() -> void:
	get_parent().cast_end()
	pin.position.y = 400.0
	pin_position = 400
	pin_direction = -1.0
