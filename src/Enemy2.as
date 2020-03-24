package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Alehsandro Emanuel
	 */
	public class Enemy2 extends FlxSprite
	{
		[Embed(source = "../assets/Enemy2.png")] private var ImgEnemy2:Class;
		
		private var _move_speed:int = 400;
        private var _hurt_counter:Number = 0;
		private var xspeed:Number = 1;
		private var _player:Player;
		
		private var bala:Bala;
	
		private var dead:Boolean = false;	
		private var _attack_counter:Number = 0;
		private var _sound_counter:Number = 0;

		//sons
	
		//colisao coins
		[Embed(source = "../assets/ataquemob2.mp3")] protected var ataquemob2:Class;
		
		public function Enemy2(X:Number, Y:Number, ThePlayer:Player) 
		{
			super(X, Y);
			loadGraphic(ImgEnemy2, true, true, 32, 62);
            
			_player = ThePlayer;
			
			maxVelocity.x = 1;
            maxVelocity.y = 200;
            drag.x = 300;
            acceleration.y = 420;            
			antialiasing = true;
			
			health = 3;
			
			addAnimation("normal", [2, 3, 4, 5], 3);
			addAnimation("attack", [6, 7, 8], 3);
			addAnimation("hurt", [1, 1], 5);
			addAnimation("dead", [9, 9, 9], 5);			
		}
		
		override public function update():void
        {	
						
			if (_player.x > x - 30 && _player.x < x + 30 && _player.y < y + 5 && _player.y > y - 5)
			{
				play("attack");
				_sound_counter += FlxG.elapsed;
				if (_sound_counter >= 1.3)
				{
					FlxG.play(ataquemob2, 0.5, false);
					_sound_counter = 0;
				}
			} 
			else
			{
				play("normal");
			}


			if (x + xspeed > 50 && x + xspeed < 3980 && _player.x <= x - 20 || x + xspeed > 50 && x + xspeed < 3980 && _player.x >= x + 20)
			{
				x += xspeed;

				//grupo 1
				if (x + xspeed < 255 && x + xspeed > 250)
				{
					xspeed *= -1;
					facing = FlxObject.RIGHT;
				}
				if (x + xspeed > 530 && x + xspeed < 535) 
				{
					xspeed *= -1;
					facing = FlxObject.LEFT;
				}
				
				//grupo2
				if (x + xspeed < 800 && x + xspeed > 795) 
				{
					xspeed *= -1;
					facing = FlxObject.RIGHT;
				}
				if (x + xspeed > 1055 && x + xspeed < 1060) 
				{
					xspeed *= -1;
					facing = FlxObject.LEFT;
				}
				
				//grupo3
				if (x + xspeed < 1260 && x + xspeed > 1255) 
				{
					xspeed *= -1;
					facing = FlxObject.RIGHT;
				}
				if (x + xspeed > 1475 && x + xspeed < 1480) 
				{
					xspeed *= -1;
					facing = FlxObject.LEFT;
				}
				
				//grupo4
				if (x + xspeed < 1535 && x + xspeed > 1530) 
				{
					xspeed *= -1;
					facing = FlxObject.RIGHT;
				}
				if (x + xspeed > 1935 && x + xspeed < 1940) 
				{
					xspeed *= -1;
					facing = FlxObject.LEFT;
				}
				
				//grupo5
				if (x + xspeed < 1990 && x + xspeed > 1985) 
				{
					xspeed *= -1;
					facing = FlxObject.RIGHT;
				}
				if (x + xspeed > 2355 && x + xspeed < 2360) 
				{
					xspeed *= -1;
					facing = FlxObject.LEFT;
				}
				
				//grupo6
				if (x + xspeed < 2425 && x + xspeed > 2420) 
				{
					xspeed *= -1;
					facing = FlxObject.RIGHT;
				}
				if (x + xspeed > 2915 && x + xspeed < 2920) 
				{
					xspeed *= -1;
					facing = FlxObject.LEFT;
				}
				
				//grupo7
				if (x + xspeed < 3185 && x + xspeed > 3180) 
				{
					xspeed *= -1;
					facing = FlxObject.RIGHT;
				}
				if (x + xspeed > 3555 && x + xspeed < 3560) 
				{
					xspeed *= -1;
					facing = FlxObject.LEFT;
				}
			}
			else
			{		
				if(x > _player.x + 20)
				{
					x -= velocity.x;
					facing = FlxObject.LEFT;
					velocity.x -= _move_speed * FlxG.elapsed - 10;
				}
				if(x < _player.x - 20)
				{
					x += velocity.x;
					facing = FlxObject.RIGHT;
					velocity.x += _move_speed * FlxG.elapsed + 10; 
				}
			}
				
            super.update();			
		}
		      
		
		override public function kill():void
        {
            super.kill();
        }
		
		public function resetEnemy(X:Number, Y:Number):void
        {
            x = X;
            y = Y;
            dead = false;
            exists = true;
            visible = true;
            play("normal");
			
			//health = 1;
        }
	}
}