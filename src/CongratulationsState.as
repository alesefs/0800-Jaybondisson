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
	public class CongratulationsState extends FlxState
	{
		private var bgcongratulations:CongratulationsSprite;
		
		//bg sound
		[Embed(source = "../assets/fimdejogo.mp3")] protected var bgsound_win:Class;		
		
		public function CongratulationsState() 
		{
		}
		
		override public function create():void
		{
			FlxG.stage.scaleMode = StageScaleMode.EXACT_FIT;
			
			bgcongratulations = new CongratulationsSprite(0, 0);
			add(bgcongratulations);

			//FlxG.stream("../assets/fimdejogo.mp3", 2, true);
			FlxG.play(bgsound_win, .5, true);
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