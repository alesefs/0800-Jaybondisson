package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Alehsandro Emanuel
	 */
	public class StageOneSprite extends FlxSprite
	{
		[Embed(source = "../assets/scene1.png")] private var bgstage1:Class;
		
		public function StageOneSprite(X:int, Y:int) 
		{
			super(X, Y, bgstage1);
		}
		
	}

}