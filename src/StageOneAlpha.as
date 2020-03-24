package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Alehsandro Emanuel
	 */
	public class StageOneAlpha extends FlxSprite
	{
		[Embed(source = "../assets/scene1_alpha.png")] private var bgstagealpha1:Class;
		
		public function StageOneAlpha(X:int, Y:int) 
		{
			super(X, Y, bgstagealpha1);
		}
		
	}

}