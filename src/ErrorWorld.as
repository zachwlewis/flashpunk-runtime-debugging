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
	 * ...
	 * @author Zachary Lewis (http://zacharylew.is)
	 */
	public class ErrorWorld extends World 
	{
		protected var _testArray:Vector.<uint>;
		protected var _nullEntity:Entity;
		protected var _updatingEntity:Entity;
		protected var _speed:Point = new Point(200, 300);
		
		public function ErrorWorld() 
		{
			
		}
		
		override public function begin():void 
		{
			addGraphic(new Text("A demonstration of runtime error handling with FlashPunk.\n< I > Cause an index-out-of-bounds error.\n< N > Cause a null object reference error.\n< T > Throw a generic error."), 0, 50, 50);
			_updatingEntity = add(new Entity(400, 300, new Image(new BitmapData(20, 20, true, 0xffaaaaaa))));
			_testArray = new <uint>[1,2,3,4,5];
			super.begin();
		}
		
		override public function update():void 
		{
			// Create errors!
			// (Not recommended in production code.)
			if (Input.pressed(Key.I))
			{
				_testArray[7] = 6;
			}
			
			if (Input.pressed(Key.N))
			{
				_nullEntity.layer = 0;
			}
			
			if (Input.pressed(Key.T))
			{
				throw new Error("A generic error with default error ID.");
			}
			
			// Update an entity to prove the game doesn't die.
			_updatingEntity.moveBy(_speed.x * FP.elapsed, _speed.y * FP.elapsed);
			if (_updatingEntity.x < 0)
			{
				_updatingEntity.x = 0;
				_speed.x *= -1;
			}
			else if (_updatingEntity.x > 780)
			{
				_updatingEntity.x = 780;
				_speed.x *= -1;
			}
			
			if (_updatingEntity.y < 0)
			{
				_updatingEntity.y = 0;
				_speed.y *= -1;
			}
			else if (_updatingEntity.y > 580)
			{
				_updatingEntity.y = 580;
				_speed.y *= -1;
			}
			
			super.update();
		}
		
	}

}