package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxTileblock;
	/**
	 * ...
	 * @author Alehsandro Emanuel
	 */
	public class CollisionStageOne extends FlxGroup
	{
		//chão
		private var beginwall:FlxTileblock;
		private var endwall:FlxTileblock;
		
		//chão
		private var floor1:FlxTileblock;
		private var floor2:FlxTileblock;
		private var floor3:FlxTileblock;
		
		//top stage
		private var top1:FlxTileblock;
		private var top2:FlxTileblock;
		private var top3:FlxTileblock;
		
		//obstaculo1
		private var box1:FlxTileblock;
		
		//obstaculo2
		private var box2:FlxTileblock;
		private var box2_1:FlxTileblock;
		private var table1:FlxTileblock;
		private var box2_2:FlxTileblock;
		private var box2_3:FlxTileblock;
		
		//obstaculo3
		private var box3:FlxTileblock;
		private var box3_1:FlxTileblock;
		private var box3_2:FlxTileblock;
		
		//obstaculo4
		private var box4:FlxTileblock;
		
		//obstaculo5
		private var box5:FlxTileblock;
		
		//obstaculo6
		private var box6:FlxTileblock;
		private var box6_1:FlxTileblock;
		private var table2:FlxTileblock;
		private var box6_2:FlxTileblock;
		private var box6_3:FlxTileblock;
		
		//obstaculo7
		private var box7:FlxTileblock;
		private var box7_1:FlxTileblock;
		private var box7_2:FlxTileblock;
		private var box7_3:FlxTileblock;
		
		public function CollisionStageOne() 
		{
			super();
			
			//beginwall
			beginwall = new FlxTileblock(0, 0, 1, 1);
			beginwall.makeGraphic(10, 400, 0x00f689c16);
			add(beginwall);

			//endwall
			endwall = new FlxTileblock(4000, 0, 1, 1);
			endwall.makeGraphic(10, 400, 0x00f689c16);
			add(endwall);
			
			//floor1
			floor1 = new FlxTileblock(0, 357, 1, 1);
			floor1.makeGraphic(1175, 1, 0x00f689c16);
			add(floor1);
			
			//floor2
			floor2 = new FlxTileblock(1260, 357, 1, 1);
			floor2.makeGraphic(1120, 1, 0x00689c16);
			add(floor2);
			
			//floor3
			floor3 = new FlxTileblock(2430, 357, 1, 1);
			floor3.makeGraphic(1450, 1, 0x00689c16);
			add(floor3);
			
			
			//top stage
			top1 = new FlxTileblock(1260, 358, 1, 1);
			top1.makeGraphic(2, 2, 0x00689c16);
			add(top1);
			
			
			//obstaculo 1
			//box1
			box1 = new FlxTileblock(230, 330, 1, 1);
			box1.makeGraphic(25, 25, 0x00689c16);
			add(box1);
			
			
			//obstaculo 2
			//box2
			box2 = new FlxTileblock(560, 330, 1, 1);
			box2.makeGraphic(25, 25, 0x006e457a);
			add(box2);
			//box2_1
			box2_1 = new FlxTileblock(590, 302, 1, 1);
			box2_1.makeGraphic(25, 50, 0x006e457a);
			add(box2_1);
			//table1
			table1 = new FlxTileblock(590, 298, 1, 1);
			table1.makeGraphic(170, 5, 0x006e457a);
			add(table1);
			//box2_2
			box2_2 = new FlxTileblock(735, 302, 1, 1);
			box2_2.makeGraphic(25, 50, 0x006e457a);
			add(box2_2);
			//box2_3
			box2_3 = new FlxTileblock(770, 330, 1, 1);
			box2_3.makeGraphic(25, 25, 0x006e457a);
			add(box2_3);
			
			
			//obstaculo 3
			//box3
			box3 = new FlxTileblock(1085, 330, 1, 1);
			box3.makeGraphic(25, 25, 0x00ff057a);
			add(box3);
			//box3_1
			box3_1 = new FlxTileblock(1115, 302, 1, 1);
			box3_1.makeGraphic(25, 50, 0x00ff057a);
			add(box3_1);
			//box3_2
			box3_2 = new FlxTileblock(1150, 275, 1, 1);
			box3_2.makeGraphic(25, 75, 0x00ff057a);
			add(box3_2);
			
			
			//obstaculo 4
			//box4
			box4 = new FlxTileblock(1505, 330, 1, 1);
			box4.makeGraphic(25, 25, 0x0000057a);
			add(box4);
			
			
			//obstaculo 5
			//box5
			box5 = new FlxTileblock(1965, 330, 1, 1);
			box5.makeGraphic(25, 25, 0x000ae57a);
			add(box5);
			
			////estamos aqui
			
			//obstaculo 6
			//box6
			box6 = new FlxTileblock(2950, 330, 1, 1);
			box6.makeGraphic(25, 25, 0x006e4cff);
			add(box6);
			//box6_1
			box6_1 = new FlxTileblock(2980, 302, 1, 1);
			box6_1.makeGraphic(25, 50, 0x006e4cff);
			add(box6_1);
			//table2
			table2 = new FlxTileblock(2980, 298, 1, 1);
			table2.makeGraphic(170, 5, 0x006e4cff);
			add(table2);
			//box6_2
			box6_2 = new FlxTileblock(3125, 302, 1, 1);
			box6_2.makeGraphic(25, 50, 0x006e4cff);
			add(box6_2);
			//box6_3
			box6_3 = new FlxTileblock(3160, 330, 1, 1);
			box6_3.makeGraphic(25, 25, 0x006e4cff);
			add(box6_3);
			
			
			//obstaculo 7
			//box7
			box7 = new FlxTileblock(3873, 343, 1, 1);
			box7.makeGraphic(25, 15, 0x00cf55ca);
			add(box7);
			//box7_1
			box7_1 = new FlxTileblock(3900, 330, 1, 1);
			box7_1.makeGraphic(25, 25, 0x00cf55ca);
			add(box7_1);
			//box7_2
			box7_2 = new FlxTileblock(3927, 315, 1, 1);
			box7_2.makeGraphic(25, 40, 0x00cf55ca);
			add(box7_2);
			//box7_3
			box7_3 = new FlxTileblock(3950, 300, 1, 1);
			box7_3.makeGraphic(50, 60, 0x00cf55ca);
			add(box7_3);
		}
		
	}

}