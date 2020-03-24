package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Alehsandro Emanuel
	 */
	public class Boss extends FlxSprite
	{
		[Embed(source = "../assets/Boss.png")] private var ImgBoss:Class;
		
		private var _move_speed:int = 400;
        private var _jump_power:int = 800;   
        private var _hurt_counter:Number = 0;
        private var _can_jump:Boolean = true;
        private var _last_jump:Number = 0;
		private var xspeed:Number = 1;
		private var _player:Player;
		
		private var dead:Boolean = false;	
		private var _attack_counter:Number = 0;
		private var _sound_counter:Number = 0;

		//sons
	
		//colisao coins
		[Embed(source = "../assets/ataqueboss.mp3")] protected var ataqueboss:Class;
		
		
		public function Boss(X:Number, Y:Number, ThePlayer:Player) 
		{
			super(X, Y);
			loadGraphic(ImgBoss, true, true, 35.5, 75);
            
			_player = ThePlayer;
			
			maxVelocity.x = 1;
            maxVelocity.y = 200;
            drag.x = 300;
            acceleration.y = 420;            
			antialiasing = true;
			
			health = 15;
			
			addAnimation("normal", [2, 3, 4, 5], 5);
			addAnimation("attack", [6, 7], 2);
			addAnimation("dead", [0]);			
		}
		
		override public function update():void
        {
			if (_player.x > x - 50 && _player.x < x + 50)
			{
				play("attack");
				_sound_counter += FlxG.elapsed;
				if (_sound_counter >= 1.3)
				{
					FlxG.play(ataqueboss, 0.5, false);
					_sound_counter = 0;
				}
			} 
			else
			{
				play("normal");
			}
			
			if (x + xspeed > 105 && x + xspeed < 430 && _player.x <= x - 20 || x + xspeed > 105 && x + xspeed < 430 && _player.x >= x + 20)
			{
				x += xspeed;

				//grupo 1
				if (x + xspeed < 110 && x + xspeed > 105)
				{
					xspeed *= -1;
					facing = FlxObject.RIGHT;
				}
				if (x + xspeed > 395 && x + xspeed < 400) 
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
            if (dead == true)
                return;
            super.kill();
        }
		
	}

}