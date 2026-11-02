extends Node2D
#var fishable: bool = false
#var moveable: bool = false
var last_direction: Vector2 = Vector2.RIGHT
@onready var player = MainCharacter.chosen_character
#To do list
#Make an input for when fishing is fully completed and the fish is caught so moveable can be set to true.
#FIX FISHING GLITCH IT DONT WORK WELL RN

const characters = {
	1: preload("res://Scripts/character_1.gd"),
	2: preload("res://Scripts/character_2.gd"),
	3: preload("res://Scripts/character_3.gd"),
	4: preload("res://Scripts/character_4.gd"),
	5: preload("res://Scripts/character_5.gd"),
	6: preload("res://Scripts/character_6.gd")
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MainCharacter.moveables = true
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction := Input.get_vector("Left","Right","Down","Up")
	if direction != Vector2.ZERO:
		last_direction = direction
