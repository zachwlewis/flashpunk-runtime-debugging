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
			catchRuntimeErrors = true;
			FP.console.enable();
		}
		
		override public function init():void 
		{
			FP.world = new ErrorWorld();
		}
		
	}
	
}