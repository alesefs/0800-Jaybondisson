package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Alehsandro Emanuel
	 */
	public class GameOverSprite extends FlxSprite
	{
		[Embed(source = "../assets/GameOverState.png")] private var bggameover:Class;
		
		public function GameOverSprite(X:Number, Y:Number) 
		{
			super(X, Y, bggameover);
		}
		
	}

}