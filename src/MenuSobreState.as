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
	public class MenuSobreState extends FlxState
	{
		
		private var bgsobre:MenuSobreSprite;
		
		private var startButton:FlxButton;
		private var menuButton:FlxButton;
		
		//bg sound
		[Embed(source = "../assets/trilhamenu.mp3")] protected var bgsoundmenusobre:Class;
		
		public function MenuSobreState() 
		{
		}
		
		override public function create():void {
			super.create();
			//Suas inicializações Aqui
			FlxG.stage.scaleMode = StageScaleMode.EXACT_FIT;
			
			bgsobre = new MenuSobreSprite (0, 0);
			add(bgsobre);
			
			//FlxG.stream("../assets/trilhamenu.mp3", .5, true);
			FlxG.play(bgsoundmenusobre, .5, true);
			
			FlxG.mouse.show();

			startButton = new FlxButton(107, 362, "JOGAR", startGame);
			startButton.color = 0xffb7b7b7;
			startButton.scale.x = 2; 
			startButton.scale.y = 2; 
			startButton.label.color = 0xff000000;
			startButton.label.size = 16;
			startButton.labelOffset.y = -2;
			add(startButton);
			
			menuButton = new FlxButton(startButton.x + 195, startButton.y, "MENU", menu);
			menuButton.color = 0x00b7b7b7;
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