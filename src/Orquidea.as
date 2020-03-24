package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Alehsandro Emanuel
	 */
	public class Orquidea extends FlxSprite
	{
		
		[Embed(source = "../assets/orquidea.png")] private var orquidea:Class;
		
		public function Orquidea(X:Number, Y:Number) 
		{
			super(X, Y, orquidea);
		}
		
	}

}