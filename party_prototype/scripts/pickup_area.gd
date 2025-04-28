extends Area2D

@onready var prompt: Label = $PickLabel
@onready var prompt_background: Sprite2D = $PickBackground

var pickedup: bool = false #check if itself is picked up

func _ready() -> void:
	set_label_visible(false)

func _on_body_entered(body: Node2D) -> void:
	print("pick")
	print(body.name)
	body.can_pickup_item = self
	set_label_visible(true)
	

func _on_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	set_label_visible(false)
	

func _process(delta: float) -> void:
	if pickedup:
		get_parent().queue_free()
		
		
func set_label_visible(status: bool):
	prompt.visible = status
	prompt_background.visible = status
