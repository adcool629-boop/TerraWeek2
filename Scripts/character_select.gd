extends Node2D

#var fishable: bool = false
var moveable: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Character1.visible = false
	$Character2.visible = false
	$Character3.visible = false
	$Character4.visible = false
	$Character5.visible = false
	$Character6.visible = false
	$CloseButton.visible = false
	pass
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed('Fishing'):
		if not MainCharacter.fishables:
			return
	#else: moveable = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_1_pressed() -> void:
	$Sprite2D2.queue_free()
	$Sprite2D3.queue_free()
	$Sprite2D4.queue_free()
	$Sprite2D5.queue_free()
	$Sprite2D6.queue_free()
	
	$Character2.queue_free()
	$Character3.queue_free()
	$Character4.queue_free()
	$Character5.queue_free()
	$Character6.queue_free()
	$Sprite2D/Button1.queue_free()
	$Label.text = ('Character 1 Selected!!')
	$CloseButton.visible = true
	$Character1.visible = true
	MainCharacter.chosen_character = 1
func _on_button_2_pressed() -> void:
	$Sprite2D2/Button2.queue_free()
	$Sprite2D.queue_free()
	$Sprite2D3.queue_free()
	$Sprite2D4.queue_free()
	$Sprite2D5.queue_free()
	$Sprite2D6.queue_free()
	$Character1.queue_free()
	$Character3.queue_free()
	$Character4.queue_free()
	$Character5.queue_free()
	$Character6.queue_free()
	$Label.text = ('Character 2 Selected!')
	$CloseButton.visible = true
	$Character2.visible = true
	MainCharacter.chosen_character = 2
func _on_button_3_pressed() -> void:
	$Sprite2D.queue_free()
	$Sprite2D2.queue_free()
	$Sprite2D4.queue_free()
	$Sprite2D5.queue_free()
	$Sprite2D6.queue_free()
	$Character1.queue_free()
	$Character2.queue_free()
	$Character4.queue_free()
	$Character5.queue_free()
	$Character6.queue_free()
	$Sprite2D3/Button3.queue_free()
	$Label.text = ('Character 3 Selected!')
	$CloseButton.visible = true
	$Character3.visible = true
	MainCharacter.chosen_character = 3
func _on_button_4_pressed() -> void:
	$Sprite2D.queue_free()
	$Sprite2D2.queue_free()
	$Sprite2D3.queue_free()
	$Sprite2D5.queue_free()
	$Sprite2D6.queue_free()
	$Character1.queue_free()
	$Character2.queue_free()
	$Character3.queue_free()
	$Character5.queue_free()
	$Character6.queue_free()
	$Sprite2D4/Button4.queue_free()
	$Label.text = ('Character 4 Selected!')
	$CloseButton.visible = true
	$Character4.visible = true
	MainCharacter.chosen_character = 4
func _on_button_5_pressed() -> void:
	$Sprite2D.queue_free()
	$Sprite2D2.queue_free()
	$Sprite2D3.queue_free()
	$Sprite2D4.queue_free()
	$Sprite2D6.queue_free()
	$Character1.queue_free()
	$Character2.queue_free()
	$Character3.queue_free()
	$Character4.queue_free()
	$Character6.queue_free()
	$Sprite2D5/Button5.queue_free()
	$Label.text = ('Character 5 Selected!')
	$CloseButton.visible = true
	$Character5.visible = true
	MainCharacter.chosen_character = 5
func _on_button_6_pressed() -> void:
	$Sprite2D.queue_free()
	$Sprite2D2.queue_free()
	$Sprite2D3.queue_free()
	$Sprite2D4.queue_free()
	$Sprite2D5.queue_free()
	$Character1.queue_free()
	$Character2.queue_free()
	$Character3.queue_free()
	$Character4.queue_free()
	$Character5.queue_free()
	$Sprite2D6/Button6.queue_free()
	$Label.text = ('Character 6 Selected!')
	$CloseButton.visible = true
	$Character6.visible = true
	MainCharacter.chosen_character = 6
func _on_close_button_pressed() -> void:
	moveable = true
	var chosen_character: Node = null
	if is_instance_valid($Character1) and $Character1.visible: chosen_character = $Character1
	elif is_instance_valid($Character2) and $Character2.visible: chosen_character = $Character2
	elif is_instance_valid($Character3) and $Character3.visible: chosen_character = $Character3
	elif is_instance_valid($Character4) and $Character4.visible: chosen_character = $Character4
	elif is_instance_valid($Character5) and $Character5.visible: chosen_character = $Character5
	elif is_instance_valid($Character6) and $Character6.visible: chosen_character = $Character6
	if chosen_character != null:
		var main_scene = get_parent()
		remove_child(chosen_character)
		main_scene.add_child(chosen_character)
		if main_scene.has_node('SpawnPoint'):
			chosen_character.global_position = main_scene.get_node('SpawnPoint').global_position
	chosen_character.scale = Vector2(4.0,4.0)
	queue_free()
