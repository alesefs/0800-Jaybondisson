package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Alehsandro Emanuel
	 */
	public class Hud extends FlxSprite
	{
		[Embed(source = "../assets/hud_player.png")] private var hud_player:Class;

		public function Hud(X:int, Y:int) 
		{
			super(X, Y, hud_player);
		}
		
	}

}