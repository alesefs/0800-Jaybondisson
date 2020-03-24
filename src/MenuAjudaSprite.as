package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Alehsandro Emanuel
	 */
	public class MenuAjudaSprite extends FlxSprite
	{
		[Embed(source = "../assets/MenuAjudaState.png")] private var bgmenuajuda:Class;
		
		public function MenuAjudaSprite(X:Number, Y:Number) 
		{
			super(X, Y, bgmenuajuda);
		}
		
	}

}