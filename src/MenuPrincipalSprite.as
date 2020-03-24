package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Alehsandro Emanuel
	 */
	public class MenuPrincipalSprite extends FlxSprite
	{
		[Embed(source = "../assets/MenuPrincipalState.png")] private var bgmenuprincipal:Class;
		
		public function MenuPrincipalSprite(X:Number, Y:Number) 
		{
			super(X, Y, bgmenuprincipal);
		}	
	}
}