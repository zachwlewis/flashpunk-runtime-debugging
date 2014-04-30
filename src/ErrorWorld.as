package  
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	
	/**
	 * This is the worst class I've ever written.
	 * @author Zachary Lewis (http://zacharylew.is)
	 */
	public class ErrorWorld extends World 
	{
		/** An array for us to index out of bounds. */
		protected var _testArray:Vector.<uint>;
		
		/** A null Entity that we're going to set properties on. */
		protected var _nullEntity:Entity;
		
		/** A real Entity we're going to update to prove this is for real. */
		protected var _updatingEntity:Entity;
		
		/** The speed of the real Entity. Boing boing boing. Boing. */
		protected var _speed:Point = new Point(200, 300);
		
		public function ErrorWorld() 
		{
			
		}
		
		override public function begin():void 
		{
			// Instructions for nerds.
			addGraphic(new Text("A demonstration of runtime error handling with FlashPunk.\n< I > Cause an index-out-of-bounds error.\n< N > Cause a null object reference error.\n< T > Throw a generic error."), 0, 50, 50);
			
			// Boing boing.
			_updatingEntity = add(new Entity(400, 300, new Image(new BitmapData(20, 20, true, 0xffaaaaaa))));
			
			// This array is going to get fucked up.
			_testArray = new <uint>[1,2,3,4,5];
			
			super.begin();
		}
		
		override public function update():void 
		{
			// Create errors!
			// (Not recommended in production code.)
			if (Input.pressed(Key.I))
			{
				// There's not seven items in there. Teehee.
				_testArray[7] = 6;
			}
			
			if (Input.pressed(Key.N))
			{
				// This Entity doesn't exist yet. Huehuehuehue.
				_nullEntity.layer = 0;
			}
			
			if (Input.pressed(Key.T))
			{
				// This is just lazy error generation. Hah.
				throw new Error("A generic error with default error ID.");
			}
			
			// Update an entity to prove the game doesn't die.
			_updatingEntity.moveBy(_speed.x * FP.elapsed, _speed.y * FP.elapsed);
			if (_updatingEntity.x < 0)
			{
				// Boing!
				_updatingEntity.x = 0;
				_speed.x *= -1;
			}
			else if (_updatingEntity.x > 780)
			{
				// Boing!
				_updatingEntity.x = 780;
				_speed.x *= -1;
			}
			
			if (_updatingEntity.y < 0)
			{
				// Boing!
				_updatingEntity.y = 0;
				_speed.y *= -1;
			}
			else if (_updatingEntity.y > 580)
			{
				// Boing!
				_updatingEntity.y = 580;
				_speed.y *= -1;
			}
			
			super.update();
		}
		
	}

}
