package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Alehsandro Emanuel
	 */
	public class StageTwoSprite extends FlxSprite
	{
		[Embed(source = "../assets/scene2.png")] private var bgstage2:Class;
		
		public function StageTwoSprite(X:int, Y:int) 
		{
			super(X, Y, bgstage2);
		}
		
	}

}