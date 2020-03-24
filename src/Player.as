package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxControl;
	import org.flixel.plugin.photonstorm.FlxControlHandler;
	/**
	 * ...
	 * @author Alehsandro Emanuel
	 */
	public class Player extends FlxSprite
	{
		[Embed(source = "../assets/Player.png")] private var ImgPlayer:Class;
		
		private var _move_speed:int = 400;
		
		public var _hurt_counter:Number = 0;
		
		private var dead:Boolean;
		
		private var _attack_counter:Number = 0;
		public var counter:Number = 0;

		
		//sons
	
		//colisao coins
		[Embed(source="../assets/ataqueheroi.mp3")] protected var ataque007:Class;
		
		
		public function Player(X:Number,Y:Number) 
		{
			super(X, Y);
			loadGraphic(ImgPlayer, true, true, 32.7, 64);

            //Set the player health
            health = 10;
						
			addAnimation("andar", [2, 3, 4, 5], 10);
			addAnimation("jump", [10]);
			addAnimation("soco", [7], 10);
			addAnimation("tiro", [13],10);
			addAnimation("parar", [0]);
			addAnimation("hurt", [0, 1], 10);
			addAnimation("dead", [12, 12, 12], 5);
					
			dead = false;
			
			if (FlxG.getPlugin(FlxControl) == null)
			{
				FlxG.addPlugin(new FlxControl);
			}
			
			FlxControl.create(this, FlxControlHandler.MOVEMENT_ACCELERATES, FlxControlHandler.STOPPING_DECELERATES, 1, true, false);
			
			FlxControl.player1.setCursorControl(false, false, true, true);
			
			FlxControl.player1.setJumpButton("SPACE", FlxControlHandler.KEYMODE_PRESSED, 200, FlxObject.FLOOR, 250, 200);

			FlxControl.player1.setBounds(20, 0, 3970, 400);
			
			FlxControl.player1.setMovementSpeed(400, 0, 100, 200, 400, 0);
			
			FlxControl.player1.setGravity(0, 600);
			
			facing = FlxObject.RIGHT; 
		}
		
		override public function update():void
		{
			if(dead)
            {
                if(finished) exists = false;
                else
                    super.update();
                return;
            }
				
			
			if (FlxG.keys.pressed("RIGHT")||("LEFT"))
			{
				if (velocity.x != 0)
					{
						play("andar");
					}
					else
					{
						play("parar")
					}
					
				if (velocity.y != 0)
				{
					play("jump");
				}	
			}
			
			if (FlxG.keys.pressed("X"))
			{
				counter += FlxG.elapsed;
				
				if (counter <= 1)
				{
					counter = 0;
					velocity.x = 0;
					play("tiro");
				}	
			} 
			
			
			
			
			if (FlxG.keys.pressed("Z"))
			{
				counter += FlxG.elapsed;
				
				if (counter <= 1)
				{
					counter = 0;
					velocity.x = 0;
					play("soco")
				}
			}
			if (FlxG.keys.justPressed("Z"))
			{
				FlxG.play(ataque007, 1, false);
			}
			
			
			
			super.update();			
			
		}

		override public function kill():void
        {
        	dead = true;
			velocity.x = 0;
			velocity.y = 0;
			FlxControl.player1.setCursorControl(false, false, false, false);
			angle = 90;
			play("dead");
        }
		
	}

}
