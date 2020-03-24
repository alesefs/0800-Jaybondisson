package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxTileblock;
	/**
	 * ...
	 * @author Alehsandro Emanuel
	 */
	public class CollisionStageTwo extends FlxGroup
	{
		//chão
		private var floor1:FlxTileblock;
		private var floor2:FlxTileblock;
		
		public function CollisionStageTwo() 
		{
			super();
			
			//floor1
			floor1 = new FlxTileblock(110, 293, 1, 1);
			floor1.makeGraphic(310, 5, 0x00f689c16);
			add(floor1);
			
			//floor2
			floor2 = new FlxTileblock(110, 350, 1, 1);
			floor2.makeGraphic(310, 5, 0x00f689c16);
			add(floor2);
			
		}
		
	}

}