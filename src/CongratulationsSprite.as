package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Alehsandro Emanuel
	 */
	public class CongratulationsSprite extends FlxSprite
	{
		
		[Embed(source = "../assets/WinState.png")] private var bgwin:Class;

		public function CongratulationsSprite(X: int, Y:int) 
		{
			super(X, Y, bgwin);
		}
		
	}

}