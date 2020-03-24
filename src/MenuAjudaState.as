package  
{
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import flash.display.*;
	/**
	 * ...
	 * @author Alehsandro Emanuel
	 */
	public class MenuAjudaState extends FlxState
	{
		private var bgajuda:MenuAjudaSprite;
		
		private var startButton:FlxButton;
		private var menuButton:FlxButton;
		
		//bg sound
		[Embed(source = "../assets/trilhamenu.mp3")] protected var bgsoundmenuajuda:Class;
		
		public function MenuAjudaState() 
		{
		}
		
		override public function create():void {
			super.create();
			//Suas inicializações Aqui
			FlxG.stage.scaleMode = StageScaleMode.EXACT_FIT;
			
			bgajuda = new MenuAjudaSprite (0, 0);
			add(bgajuda);
			
			//FlxG.stream("../assets/trilhamenu.mp3", .5, true);
			FlxG.play(bgsoundmenuajuda, .5, true);
			
			FlxG.mouse.show();

			startButton = new FlxButton(207, 365, "JOGAR", startGame);
			startButton.color = 0xffa7a566
			startButton.scale.x = 2; 
			startButton.scale.y = 2; 
			startButton.label.color = 0xff000000;
			startButton.label.size = 16;
			startButton.labelOffset.y = -2;
			add(startButton);
			
			menuButton = new FlxButton(startButton.x + 195, startButton.y, "MENU", menu);
			menuButton.color = 0x00a7a566
			menuButton.scale.x = 2; 
			menuButton.scale.y = 2; 
			menuButton.label.color = 0xff000000;
			menuButton.label.size = 16;
			menuButton.labelOffset.y = -2;
			add(menuButton);
		}
		
		private function startGame():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new StageOneState);
		}
		
		private function menu():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new MenuPrincipalState);
		}
		
	}

}