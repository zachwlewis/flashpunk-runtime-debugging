package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Zachary Lewis (http://zacharylew.is)
	 */
	public class Main extends Engine 
	{
		
		public function Main():void 
		{
			super(800, 600);
			
			// This is where the magic happens.
			catchRuntimeErrors = true;
			
			// This is where you see the magic.
			FP.console.enable();
		}
		
		override public function init():void 
		{
			// Start wrecking shit.
			FP.world = new ErrorWorld();
		}
		
	}
	
}
