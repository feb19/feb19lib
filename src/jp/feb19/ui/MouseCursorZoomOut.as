package jp.feb19.ui
{
	import flash.geom.Point;
	
	public class MouseCursorZoomOut extends MouseCursorCollection implements IMouseCursor
	{
		public function MouseCursorZoomOut()
		{
			super();
		}
		
		public function get hotspot():Point
		{
			return new Point(5, 5);
		}
		
		public function get name():String
		{
			return "MouseCursorZoomOut";
		}
		
		override protected function get data():Array
		{
			return [
				[0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0],
				[0, 0, 1, 1, 2, 2, 2, 2, 1, 1, 0, 0, 0, 0, 0, 0],
				[0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 1, 0, 0, 0, 0, 0],
				[0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 1, 0, 0, 0, 0, 0],
				[1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 0, 0, 0, 0],
				[1, 2, 2, 1, 1, 1, 1, 1, 1, 2, 2, 1, 0, 0, 0, 0],
				[1, 2, 2, 1, 1, 1, 1, 1, 1, 2, 2, 1, 0, 0, 0, 0],
				[1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 0, 0, 0, 0],
				[0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 1, 0, 0, 0, 0, 0],
				[0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 1, 0, 0, 0, 0, 0],
				[0, 0, 1, 1, 2, 2, 2, 2, 1, 1, 1, 1, 0, 0, 0, 0],
				[0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0],
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0],
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0],
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1],
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0]
			];
		}
	}
}