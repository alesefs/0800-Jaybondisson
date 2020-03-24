package 
{
	import org.flixel.*;

	/**
	 * ...
	 * @author Alehsandro Emanuel
	 */
	
	[SWF(width = "600", height = "400", backgroundColor = "#000000")]
	[Frame(factoryClass="Preloader")]
	
	public class Main extends FlxGame
	{
		public function Main()
		{
			super(600, 400, MenuPrincipalState, 1, 60, 60);
			forceDebugger = false;
		}
	}
	
}