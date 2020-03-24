package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Alehsandro Emanuel
	 */
	public class MenuSobreSprite extends FlxSprite
	{
		[Embed(source = "../assets/MenuSobreState.png")] private var bgmenusobre:Class;
		
		public function MenuSobreSprite(X:Number, Y:Number) 
		{
			super(X, Y, bgmenusobre);
		}
		
	}

}