extends CanvasLayer

signal move_forward
signal turn(degrees)


func _process(delta):
    var player = get_parent().get_parent()
    
    var pos = player.get_parent().world_to_map(player.translation)
    $HUD/HBoxContainer/controls/Label.text = "x: " + String(pos.x) + " z: " + String(pos.z)
func direction_pressed(direction):
    match direction:
        "up":
            emit_signal("move_forward")
        "down":
            emit_signal("turn", deg2rad(180))
        "left":
            emit_signal("turn", deg2rad(90))
        "right":
            emit_signal("turn", deg2rad(270))
