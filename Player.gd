extends StaticBody


func _ready():
    $ClippedCamera/UI.connect("move_forward", self, "move_forward")
    $ClippedCamera/UI.connect("turn", self, "rotate_y")
    

func _input(event):
    if event.is_action_pressed("ui_accept"):
        pass

func move_forward():
    var grid_map : GridMap = get_parent()
    var curr_pos = translation
    
    var map_pos = grid_map.world_to_map(to_global($forward.translation))
    var new_pos = grid_map.map_to_world(map_pos.x, map_pos.y, map_pos.z)
#    print("curr map: " + String(curr_pos))
#    print("moving to map: " + String(map_pos))
#    print("new pos: " + String(new_pos))
    $AnimationPlayer.play("forward")
    yield($AnimationPlayer, "animation_finished")
    $ClippedCamera.translation = Vector3(0,8,0)
    translation.x = new_pos.x #+ grid_map.cell_size.x / 2
    translation.z = new_pos.z #+ grid_map.cell_size.z / 2

