package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import flash.display.*;
	/**
	 * ...
	 * @author Alehsandro Emanuel
	 */
	public class GameOverState extends FlxState
	{
		private var bggameover:GameOverSprite;
		
		//bg sound
		[Embed(source = "../assets/die.mp3")] protected var bgsoundg_over:Class;
		
		public function GameOverState() 
		{
		}
		
		override public function create():void
		{
			FlxG.stage.scaleMode = StageScaleMode.EXACT_FIT;
			
			bggameover = new GameOverSprite(0, 0);
			add(bggameover);
			
			//FlxG.stream("../assets/die.mp3", .75, true);
			FlxG.play(bgsoundg_over, .75, true);
		}
		
		override public function update():void
		{
			super.update();
			
			if (FlxG.keys.any())
			{
				FlxG.fade(0xff888888, 1, MenuState);
			}
		}
		
		private function MenuState():void
		{
			FlxG.switchState(new MenuPrincipalState());
		}
		
	}

}