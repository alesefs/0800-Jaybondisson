package  
{
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxRect;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.plugin.photonstorm.FlxBar;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	import flash.display.*;
	/**
	 * ...
	 * @author Alehsandro Emanuel
	 */
	public class StageOneState extends FlxState
	{
		//cenario e colisao de cenario
		private var bgscene1:StageOneSprite;
		private var collidescene1:CollisionStageOne;
		private var bgscenealpha1:StageOneAlpha;
		
		
		
		//hud UI
		
		public var hud_player:Hud;
		
		public var score:FlxText;
		
		public var exp:FlxText;
		private var experienceBar:FlxBar;
		
		public var hp:FlxText;
		public var _playerHealthBar:FlxBar;
		
		public var life_count:Number;
		public var life_txt:FlxText;
		
		public var hpE:FlxText;
		public var hpE2:FlxText;
		
		public var count_bala:FlxText;
		
		
		
		
		//player e bala do player
		private var _player:Player;
		private var bala:Bala;
		private var n_bala:Number = 10;
		
		//inimigo 1
		private var _enemies1:Array;
		protected var _grpEnemies:FlxGroup;
		public var counter_enemy_1:Number = 0;

		//inimigos 2
		private var _enemies2:Array;
		protected var _grpEnemies2:FlxGroup;
		public var counter_enemy_2:Number = 0;
		
		//coins
		private var _coins:Array;
		protected var _grpcoins:FlxGroup;
		

		//sons
	
		//colisao coins
		[Embed(source="../assets/beep.mp3")] protected var somColisao:Class;
		
		//com tiro
		[Embed(source="../assets/ataquetiro.mp3")] protected var somtiro:Class;
		
		//morte 007
		[Embed(source = "../assets/dorheroi.mp3")] protected var dorheroi:Class;
		
		//morte mob1
		[Embed(source="../assets/dormob1.mp3")] protected var dormob1:Class;

		//morte mob2
		[Embed(source = "../assets/dormob2.mp3")] protected var dormob2:Class;
		
		//bg sound
		[Embed(source="../assets/fundoscene1.mp3")] protected var bgsound1:Class;
		
		
		public function StageOneState() 
		{	
		}
		
		override public function create():void
		{
			FlxG.stage.scaleMode = StageScaleMode.EXACT_FIT;
			
			//cor de fundo
			FlxG.bgColor = 0xff1E90FF;
		   
			//FlxG.stream("../assets/fundoscene1.mp3", .5, true);
			FlxG.play(bgsound1, .5, true);
			
			//cenario
			bgscene1 = new StageOneSprite(0, 0);
			bgscene1.antialiasing = true;
			add(bgscene1);
			
			//colisoes de cenario
			collidescene1 = new CollisionStageOne();
			add(collidescene1);
			
			
			//player
			_player = new Player(50, 295);
			add(_player);
			
			//bala player
			bala = new Bala("bala", _player, "x", "y");
			bala.makePixelBullet(1, 5, 2, 0xffdcb451, 0, 0);
			bala.bounds.make(-20, -20, bgscene1.width + 20, bgscene1.height + 20);
			add(bala.group);
			
			
			//inimigo 1
			_enemies1 = new Array;
			_grpEnemies = new FlxGroup();
			
            _enemies1.push(add(new Enemy1(320, 295, _player)));
			_enemies1.push(add(new Enemy1(800, 295, _player)));
			_enemies1.push(add(new Enemy1(1420, 295, _player)));
			_enemies1.push(add(new Enemy1(1620, 295, _player)));
			_enemies1.push(add(new Enemy1(2200, 295, _player)));
			_enemies1.push(add(new Enemy1(2500, 295, _player)));
			_enemies1.push(add(new Enemy1(2700, 295, _player)));
			_enemies1.push(add(new Enemy1(3200, 295, _player)));
			
			_grpEnemies.add(_enemies1[0]);
			_grpEnemies.add(_enemies1[1]);
			_grpEnemies.add(_enemies1[2]);
			_grpEnemies.add(_enemies1[3]);
			_grpEnemies.add(_enemies1[4]);
			_grpEnemies.add(_enemies1[5]);
			_grpEnemies.add(_enemies1[6]);
			_grpEnemies.add(_enemies1[7]);
			
			add(_grpEnemies);
			
			
			
			//inimigos 2
			_enemies2 = new Array;
			_grpEnemies2 = new FlxGroup();
			
            _enemies2.push(add(new Enemy2(1720, 295, _player)));
			_enemies2.push(add(new Enemy2(2350, 295, _player)));
			_enemies2.push(add(new Enemy2(2600, 295, _player)));
			_enemies2.push(add(new Enemy2(2800, 295, _player)));
			_enemies2.push(add(new Enemy2(3350, 295, _player)));
			
			
			_grpEnemies2.add(_enemies2[0]);
			_grpEnemies2.add(_enemies2[1]);
			_grpEnemies2.add(_enemies2[2]);
			_grpEnemies2.add(_enemies2[3]);
			_grpEnemies2.add(_enemies2[4]);
			
			add(_grpEnemies2);
			
			
			
			//coins
			_coins = new Array;
			_grpcoins = new FlxGroup();
			
			_coins.push(add(new Orquidea(1720, 315)));
			_coins.push(add(new Orquidea(2350, 315)));
			_coins.push(add(new Orquidea(2600, 315)));
			_coins.push(add(new Orquidea(2800, 315)));
			_coins.push(add(new Orquidea(3350, 315)));
			
			_coins.push(add(new Orquidea(320, 315)));
			_coins.push(add(new Orquidea(480, 315)));
			_coins.push(add(new Orquidea(670, 270)));
			_coins.push(add(new Orquidea(800, 315)));
			_coins.push(add(new Orquidea(1400, 315)));
			
			_coins.push(add(new Orquidea(1090, 295)));
			_coins.push(add(new Orquidea(1160, 245)));
			_coins.push(add(new Orquidea(1505, 285)));
			_coins.push(add(new Orquidea(2950, 285)));
			_coins.push(add(new Orquidea(3750, 315)));
			
			_grpcoins.add(_coins[0]);
			_grpcoins.add(_coins[1]);
			_grpcoins.add(_coins[2]);
			_grpcoins.add(_coins[3]);
			_grpcoins.add(_coins[4]);
			
			_grpcoins.add(_coins[5]);
			_grpcoins.add(_coins[6]);
			_grpcoins.add(_coins[7]);
			_grpcoins.add(_coins[8]);
			_grpcoins.add(_coins[9]);
			
			_grpcoins.add(_coins[10]);
			_grpcoins.add(_coins[11]);
			_grpcoins.add(_coins[12]);
			_grpcoins.add(_coins[13]);
			_grpcoins.add(_coins[14]);
						
			add(_grpcoins);
			
			
			
			
			
			//cenario
			bgscenealpha1 = new StageOneAlpha(0, 0);
			bgscenealpha1.antialiasing = true;
			add(bgscenealpha1);
			
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
			
			
			//hud pontos
			score = new FlxText(10, 50, 120);
			score.shadow = 0xff000000;
			score.setFormat(null, 16, 0xffffff, "right", 3);
			score.text = "" + (_grpcoins.countDead());
			score.scrollFactor.x = score.scrollFactor.y = 0;
			add(score);
			
	
			//hud count_bala
			count_bala = new FlxText(15, 72, 120);
			count_bala.shadow = 0xff000000;
			count_bala.setFormat(null, 16, 0xffffff, "center", 3);
			count_bala.text = "10 / " + (n_bala);
			count_bala.scrollFactor.x = count_bala.scrollFactor.y = 0;
			add(count_bala);
			
			

			
			//experience bar
			experienceBar = new FlxBar(68, 43, FlxBar.FILL_LEFT_TO_RIGHT, 110, 5);
			experienceBar.createFilledBar(0x00000000, 0xffffff00, false);
			experienceBar.scrollFactor.x = experienceBar.scrollFactor.y = 0;
			experienceBar.setRange(0, 36);
			experienceBar.percent = 0;
			add(experienceBar);
			
			//hud exp
			exp = new FlxText(20, 36, 120);
			exp.shadow = 0xff000000;
			exp.setFormat(null, 12, 0xffffff, "right", 1);
			exp.text = "13 / " + (_grpEnemies.countDead() + _grpEnemies2.countDead());
			exp.scrollFactor.x = exp.scrollFactor.y = 0;
			add(exp);
			
			
			
			
			
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
			
			
			
			
			//hud hpE
			hpE = new FlxText(350, 20, 200);
			hpE.shadow = 0xff000000;
			hpE.setFormat(null, 16, 0xffffff, "center", 3);
			hpE.text = "vida inimigo : " + 2;
			hpE.exists = false;
			hpE.scrollFactor.x = hpE.scrollFactor.y = 0;
			add(hpE);
			
			//hud hpE2
			hpE2 = new FlxText(350, 50, 200);
			hpE2.shadow = 0xff000000;
			hpE2.setFormat(null, 16, 0xffffff, "center", 3);
			hpE2.text = "vida inimigo : " + 3;
			hpE2.exists = false;
			hpE2.scrollFactor.x = hpE2.scrollFactor.y = 0;
			add(hpE2);
			
			
			
			
			
			//parte tecnica de câmera
			FlxG.worldBounds = new FlxRect(0, 0, 4050, bgscene1.height);
			FlxG.camera.setBounds(0, 0, 4050, bgscene1.height);			
			FlxG.camera.follow(_player, FlxCamera.STYLE_LOCKON);
		}
		
		override public function update():void
		{
			super.update();
			
			//bala player
			if (FlxG.keys.justPressed("X") && n_bala > 0)
			{
				if (_player.facing == FlxObject.RIGHT && _player.x > 0 && _player.x < 4000)
					{  
					    bala.setBulletOffset(25, 10);
					    bala.setBulletDirection(FlxWeapon.BULLET_RIGHT, 180);
					    bala.bounds.width = _player.x + 350;
					    bala.bounds.height = _player.y + 350;
						n_bala -= 1;
				}
					
				if (_player.facing == FlxObject.LEFT && _player.x > 0 && _player.x < 4000)
					{
						bala.setBulletOffset(5,10);
						bala.setBulletDirection(FlxWeapon.BULLET_LEFT, 180);
						bala.bounds.width = _player.x + 350;
						bala.bounds.height = _player.y + 350;
						n_bala -= 1;
					}
				count_bala.text = "10 / " + (n_bala);
				if (n_bala < 11 && n_bala > 0)
				{
					FlxG.play(somtiro, 5, false);
					bala.fire();
				}	
			}	
			
			
			//colisoes bala
			FlxG.overlap(bala.group, collidescene1, hitwall);	
			FlxG.overlap(bala.group, _grpEnemies, hitenemy1);
			FlxG.overlap(bala.group, _grpEnemies2, hitenemy2);
			
			//colisoes do player
			FlxG.overlap(_player, _grpEnemies, hit_e1);
			FlxG.overlap(_player, _grpEnemies2, hit_e2);

			//colisoes no cenario
			FlxG.collide(_player, collidescene1);
			FlxG.collide(_grpEnemies, collidescene1);
			FlxG.collide(_grpEnemies2, collidescene1);
			
			//colisão dos coins
			FlxG.overlap(_grpcoins, _player, getCoin);
			
			
			
			// passa de estagio e vai para o boss
			if (_grpEnemies.countLiving() + _grpEnemies2.countLiving() == 0 && _player.x > 3950 && _grpcoins.countLiving() < 5) {
				FlxG.fade(0xff000000, 3, BossState);
			}
			
			
			//reseta estágio se cair
			if (_player.y > FlxG.height + _player.height*1.5)
			{
				if (life_count > 0)
				{
					FlxG.play(dorheroi, 5, false);
					life_count -= 1;
					_player.x = 50;
					_player.y = 295;
					_player.health = 10;
					n_bala = 10;
					count_bala.text = "10 / " + (n_bala);	
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
		
		

		//coins x player
		public function getCoin(coin:FlxSprite,player:FlxSprite):void
		{
			score.text = "" + (10 + _grpcoins.countDead() * 10);
			FlxG.play(somColisao, 10);
			coin.kill();
		}

		
		//player x inimigo1
		private function hit_e1 (player:FlxObject, inimigos1:Enemy1):void
		{	

			
			if (_player.x <= inimigos1.x + 15 || _player.x >= inimigos1.x - 15)
			{
				counter_enemy_1 += FlxG.elapsed;
				if (counter_enemy_1 >= 2.5) {
					_player.health -= 1;
					counter_enemy_1 = 0;
				}
			}
			
			if (_player.x <= inimigos1.x + 15 && FlxG.keys.justPressed("Z")|| _player.x >= inimigos1.x - 15 && FlxG.keys.justPressed("Z"))
			{	
				inimigos1.health -= .25;
				
				if (inimigos1.health < 0.1)
				{
					FlxG.play(dormob1, 5, false);
					inimigos1.kill();
					hpE.exists = false;
					experienceBar.percent = _grpEnemies.countDead() + _grpEnemies2.countDead();
				}
			}
						
			if (_player.health < 1)
			{
				_player.x = bgscene1.width * 0;
				_player.y = 255;
				if (life_count > 0)
				{
					FlxG.play(dorheroi, 5, false);
					_player.revive();
					life_count -= 1;
					_player.health = 10;
					n_bala = 10;
					count_bala.text = "10 / " + (n_bala);
					hp.text = "10 / " + (_player.health);
					life_txt.text = "" + (life_count);
				}
				else
				{
					FlxG.play(dorheroi, 5, false);
					_player.kill();
					FlxG.fade(0xff000000, 3, GameOver);
				}
			}
			
			exp.text = "13 / " + (_grpEnemies.countDead() + _grpEnemies2.countDead());
			hp.text = "10 / " + (_player.health);
			hpE.text = "vida inimigo : " + (inimigos1.health);
			hpE.exists = true;
		}		
			
			
			
		//player x inimigo2
		private function hit_e2 (player:FlxObject, inimigos2:Enemy2):void
		{
			if (_player.x <= inimigos2.x + 15 || _player.x >= inimigos2.x - 15)
			{
				counter_enemy_2 += FlxG.elapsed;
				if (counter_enemy_2 >= 2.5) {
					_player.health -= 1;
					counter_enemy_2 = 0;
				}
			}
			
			if (_player.x <= inimigos2.x + 15 && FlxG.keys.justPressed("Z")|| _player.x >= inimigos2.x - 15 && FlxG.keys.justPressed("Z"))
			{	
				inimigos2.health -= .25;
				
				if (inimigos2.health < 0.1)
				{
					FlxG.play(dormob2, 5, false);
					inimigos2.kill();
					hpE2.exists = false;
					experienceBar.percent = _grpEnemies.countDead() + _grpEnemies2.countDead();
				}
			}
						
			if (_player.health < 1)
			{
				_player.x = bgscene1.width * 0;
				_player.y = 255;
				if (life_count > 0)
				{
					FlxG.play(dorheroi, 5, false);
					_player.revive();
					life_count -= 1;
					_player.health = 10;
					n_bala = 10;
					count_bala.text = "10 / " + (n_bala);
					hp.text = "10 / " + (_player.health);
					life_txt.text = "" + (life_count);
				}
				else
				{
					FlxG.play(dorheroi, 5, false);
					_player.kill();
					FlxG.fade(0xff000000, 3, GameOver);
				}
			}	
			
			exp.text = "13 / " + (_grpEnemies.countDead() + _grpEnemies2.countDead());
			hp.text = "10 / " + (_player.health);
			hpE2.text = "vida inimigo : " + (inimigos2.health);
			hpE2.exists = true;
		}	
		
			
			
		//bala x inimigo 1
		private function hitenemy1 (bala:FlxObject, inimigos:FlxObject):void
		{
			exp.text = "13 / " + (1 + _grpEnemies.countDead() + _grpEnemies2.countDead());
			experienceBar.percent = 1 + _grpEnemies.countDead() + _grpEnemies2.countDead();
			FlxG.play(dormob1, 5, false);
			inimigos.kill();
			bala.kill();
		}
		
		//bala x inimigo2
		private function hitenemy2 (bala:FlxObject, inimigos2:FlxObject):void
		{
			exp.text = "13 / " + (1 + _grpEnemies.countDead() + _grpEnemies2.countDead());
			experienceBar.percent = 1 + _grpEnemies.countDead() + _grpEnemies2.countDead();
			FlxG.play(dormob2, 5, false);			
			inimigos2.kill();
			bala.kill();
		}
		
		//bala x parede
		private function hitwall (bala:FlxObject, collidescene1:FlxObject):void
		{
			bala.exists = false;
		}
		
		
		
		//função gameover
		private function BossState():void
		{
			FlxG.switchState(new StageTwoState());
		}
		
		//função gameover
		private function GameOver():void
		{
			FlxG.switchState(new GameOverState());
		}
		
	}

}