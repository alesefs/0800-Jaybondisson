package  
{
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.plugin.photonstorm.FlxButtonPlus;
	import flash.display.*;
	/**
	 * ...
	 * @author Alehsandro Emanuel
	 */
	public class MenuPrincipalState extends FlxState
	{
		private var bgmenu:MenuPrincipalSprite;
		
		private var startButton:FlxButton;
		private var ajudaButton:FlxButton;
		private var sobreButton:FlxButton;

		
		
		//bg sound
		[Embed(source = "../assets/trilhamenu.mp3")] protected var bgsoundmenuprincipal:Class;
		
		public function MenuPrincipalState() 
		{	
		}
		
		override public function create():void {
			super.create();
			//Suas inicializações Aqui
			FlxG.stage.scaleMode = StageScaleMode.EXACT_FIT;
			
			bgmenu = new MenuPrincipalSprite(0, 0);
			add(bgmenu);
			
			//FlxG.stream("../assets/trilhamenu.mp3", .5, true);
			FlxG.play(bgsoundmenuprincipal, .5, true);
			
			FlxG.mouse.show();


			
			startButton = new FlxButton(375, 175, "JOGAR", startGame);
			startButton.label.color = 0xff000000;
			startButton.label.size = 16;
			startButton.labelOffset.y = -1;
			startButton.color = 0xffffffff;
			startButton.scale.x = 1.3;
			startButton.scale.y = 1.3;
			add(startButton);
			
			ajudaButton = new FlxButton(startButton.x, startButton.y + 50, "AJUDA", ajuda);
			ajudaButton.label.color = 0xff000000;
			ajudaButton.label.size = 16;
			ajudaButton.labelOffset.y = -1;
			ajudaButton.color = 0xffffffff;
			ajudaButton.scale.x = 1.3;
			ajudaButton.scale.y = 1.3;
			add(ajudaButton);
			
			sobreButton = new FlxButton(startButton.x, startButton.y + 100, "SOBRE", sobre);
			sobreButton.label.color = 0xff000000;
			sobreButton.label.size = 16;
			sobreButton.labelOffset.y = -1;
			sobreButton.color = 0xffffffff;
			sobreButton.scale.x = 1.3;
			sobreButton.scale.y = 1.3;
			add(sobreButton);
		}
		
		private function startGame():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new StageOneState);
		}
		
		private function ajuda():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new MenuAjudaState);
		}
		
		private function sobre():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new MenuSobreState);
		}
	}
}