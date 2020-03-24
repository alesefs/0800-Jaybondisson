package  
{
	import org.flixel.FlxRect;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	/**
	 * ...
	 * @author Alehsandro Emanuel
	 */
	public class Bala extends FlxWeapon 
	{
		
		override public function Bala(name:String, parentRef:* = null, xVariable:String = "x", yVariable:String = "y"):void 
		{
			super(name, parentRef, xVariable, yVariable);
			setBulletBounds (new FlxRect(0, 0, 4000, 400));
		}
		
	}

}