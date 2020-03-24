package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.plugin.photonstorm.FlxBar;
	import flash.display.*;
	/**
	 * ...
	 * @author Alehsandro Emanuel
	 */
	public class StageTwoState extends FlxState
	{
		//cenario
		private var bgstage2:StageTwoSprite;
		private var collidescene2:CollisionStageTwo;
		
		
		//hud
		
		public var hud_player:Hud;

		
		public var hp:FlxText;
		public var _playerHealthBar:FlxBar;
		
		public var life_count:Number;
		public var life_txt:FlxText;
		
		public var hpboss:FlxText;
		public var _bossHealthBar:FlxBar;
		
		
		//player e bala do player
		private var _player:Player;
		
		//boss
		private var _boss:Boss;
		public var counter_boss:Number = 0;

		//sons
		
		//morte 007
		[Embed(source = "../assets/dorheroi.mp3")] protected var dorheroi:Class;
		
		//defeated jaws
		[Embed(source = "../assets/dorboss.mp3")] protected var dorboss:Class;
		
		//morte jaws
		[Embed(source = "../assets/morteboss.mp3")] protected var morteboss:Class;
		
		//bg sound
		[Embed(source="../assets/fundoscene2.mp3")] protected var bgsound2:Class;
		
		public function StageTwoState() 
		{	
		}
		
		override public function create():void
		{
			FlxG.stage.scaleMode = StageScaleMode.EXACT_FIT;
			
			FlxG.bgColor = 0xffff00c0;
		   
			//FlxG.stream("../assets/fundoscene2.mp3", .5, true);
			FlxG.play(bgsound2, .5, true);
			
			//imagem cenario 2
			bgstage2 = new StageTwoSprite (0, 0);
			add(bgstage2);
			
			//colisoes de cenario
			collidescene2 = new CollisionStageTwo();
			add(collidescene2);
			
			//player
			_player = new Player(150, 230);
			add(_player);
			
			
			//boss
			_boss = new Boss(300, 200, _player);
			add(_boss);
			
			
			
			//hud_player
			hud_player = new Hud(10, 10);
			hud_player.antialiasing = true;
			hud_player.scrollFactor.x = hud_player.scrollFactor.y = 0;
			add(hud_player);
			
			
			
			
			
			//hud life
			life_count = new Number(3);
			life_txt = new FlxText(43, 6, 120);
			life_txt.shadow = 0xff000000;
			life_txt.setFormat(null, 16, 0xffffff, "center", 3);
			life_txt.text = "" + (life_count);
			life_txt.scrollFactor.x = life_txt.scrollFactor.y = 0;
			add(life_txt);
			
			
			
			//hud barra de HP
			_playerHealthBar = new FlxBar(68, 31, FlxBar.FILL_LEFT_TO_RIGHT, 110, 5, _player, "health", 0, 10, false);
            _playerHealthBar.createFilledBar(0x00000000, 0xffff0000, false);
			_playerHealthBar.scrollFactor.x = _playerHealthBar.scrollFactor.y = 0;
			add(_playerHealthBar);
			
			//hud hp
			hp = new FlxText(25, 24, 120);
			hp.shadow = 0xff000000;
			hp.setFormat(null, 12, 0xffffff, "right", 1);
			hp.text = "10 / " + (_player.health);
			hp.scrollFactor.x = hp.scrollFactor.y = 0;
			add(hp);
			
			
			
			
			
			
			
			
			
			
			//hud barra de HP
			_bossHealthBar = new FlxBar(320, 30, FlxBar.FILL_LEFT_TO_RIGHT, 200, 10, _boss, "health", 0, 15, false);
            _bossHealthBar.createGradientBar([0xff000000], [0xffFFFF00, 0xffFF8B17, 0xffFF0000], 1, 180, true, 0xffc0c0c0);
			_bossHealthBar.scrollFactor.x = _bossHealthBar.scrollFactor.y = 0;
			add(_bossHealthBar);
			
			//hud hpboss
			hpboss = new FlxText(320, 12, 200);
			hpboss.shadow = 0xff000000;
			hpboss.setFormat(null, 12, 0xffffff, "center", 1);
			hpboss.text = "Dente de Lata: 15 / " + (_boss.health);
			hpboss.scrollFactor.x = hpboss.scrollFactor.y = 0;
			add(hpboss);
		}
		
		override public function update():void
		{
			super.update();
			
			//colisões de cenario
			FlxG.collide(_player, collidescene2);
			FlxG.collide(_boss, collidescene2);
			
			//colisoes do player
			FlxG.overlap(_player, _boss, hit_boss);
			
			
			//reseta estágio se cair
			if (_player.y > 350)
			{
				if (life_count > 0)
				{
					FlxG.play(dorheroi, 5, false);
					life_count -= 1;
					_player.x = 150;
					_player.y = 230;
					_boss.x = 300;
					_boss.y = 200;
					_player.health = 10;
					_boss.health = 15;
					hp.text = "10 / " + (_player.health);
					life_txt.text = "" + (life_count);
				}
				else
				{
					FlxG.play(dorheroi, 5, false);
					FlxG.fade(0xff000000, 3, GameOver);
				}
			}
		}
		
		
		
		//player x inimigo1
		private function hit_boss (player:Player, boss:Boss):void
		{	
			if (_player.x <= _boss.x + 15 || _player.x >= _boss.x - 15)
			{
				counter_boss += FlxG.elapsed;
				if (counter_boss >= 2.25) {
					_player.health -= 1;
					counter_boss = 0;
				}
			}
			
			if (_player.x <= _boss.x + 15 && FlxG.keys.justPressed("Z") || _player.x >= _boss.x - 15 && FlxG.keys.justPressed("Z") ||
			_player.x <= _boss.x + 15 && FlxG.keys.justPressed("X")|| _player.x >= _boss.x - 15 && FlxG.keys.justPressed("X") )
			{	
				FlxG.play(dorboss, 5, false);
				_boss.health -= .5;
				
				if (_boss.health < 0.1)
				{
					FlxG.play(morteboss, 10, false);
					_boss.kill();
					hpboss.exists = false;
					FlxG.fade(0xff000000, 3, winState);
				}
			}
						
			if (_player.health < 1)
			{
				_player.x = 150;
				_player.y = 230;
				_boss.x = 300;
				_boss.y = 200;
				if (life_count > 0)
				{
					FlxG.play(dorheroi, 5, false);
					_player.revive();
					life_count -= 1;
					_player.health = 10;
					_boss.health = 15;
					hpboss.text = "Dente de Lata:  15 / " + (_player.health);
					life_txt.text = "" + (life_count);
				}
				else
				{
					FlxG.play(dorheroi, 5, false);
					player.kill();
					FlxG.fade(0xff000000, 3, GameOver);
				}
			}
			
			hp.text = "10 / " + (_player.health);
			hpboss.text = "Dente de Lata:  15 / " + (_boss.health);
			hpboss.exists = true;
		}
		
		
		
		private function winState():void
		{
			FlxG.switchState(new CongratulationsState());
		}
		
		private function GameOver():void
		{
			FlxG.switchState(new GameOverState());
		}
		
	}

}