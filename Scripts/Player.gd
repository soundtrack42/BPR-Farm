extends CharacterBody2D


const SPEED = 30.0;
var x;
var y;
var waterRod = 0;
var flux = 0;
var inventory = {
	"m": 0,
}
@onready var animation = $AnimationPlayer;
@export var mappa : TileMap;

func _ready():
	inventory.get("m")

func _increment_dict(value):
	inventory

func _physics_process(delta):
	
	if Input.is_key_pressed(KEY_W):
		y-=SPEED;
		animation.play("move_up");
	elif Input.is_key_pressed(KEY_S):
		y+=SPEED;
		animation.play("move_down");
	elif Input.is_key_pressed(KEY_A):
		x-=SPEED;
		animation.play("move_left");
	elif Input.is_key_pressed(KEY_D):
		x+=SPEED;
		animation.play("move_right");
	elif Input.is_key_pressed(KEY_S) && Input.is_key_pressed(KEY_L):
		x-=SPEED;
		y+=SPEED;
		animation.play("move_up_right");
	elif Input.is_key_pressed(KEY_S) && Input.is_key_pressed(KEY_D):
		x+=SPEED;
		y+=SPEED;
		animation.play("move_down_right");
	elif Input.is_key_pressed(KEY_W) && Input.is_key_pressed(KEY_A):
		x-=SPEED;
		y-=SPEED;
		animation.play("move_up_left");
	elif Input.is_key_pressed(KEY_W) && Input.is_key_pressed(KEY_D):
		x+=SPEED;
		y-=SPEED;
		animation.play("move_down_left");
	elif Input.is_key_pressed(KEY_Z):
		if mappa.world_to_map(mappa.to_local(Vector2(x,y))) == "":
			animation.play("zappa");
		
	elif Input.is_key_pressed(KEY_X):
		if mappa.world_to_map(mappa.to_local(Vector2(x,y))) == "":
			animation.play("annaffia");
		
		
	elif Input.is_key_pressed(KEY_C):
		if mappa.world_to_map(mappa.to_local(Vector2(x,y))) == "":
			animation.play("raccogli");
		
	else:
		animation.play("idle");
	
	
