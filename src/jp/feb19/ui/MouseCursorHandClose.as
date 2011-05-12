package jp.feb19.ui
{
	import flash.geom.Point;

	public class MouseCursorHandClose extends MouseCursorCollection implements IMouseCursor
	{
		public function MouseCursorHandClose()
		{
			super();
		}
		
		public function get hotspot():Point
		{
			return new Point(5, 0);
		}
		
		public function get name():String
		{
			return "MouseCursorHandClose";
		}
		
		override protected function get data():Array
		{
			return [
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				[0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0],
				[0, 0, 0, 1, 2, 2, 1, 2, 2, 1, 2, 2, 1, 1, 0, 0],
				[0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 1, 0],
				[0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 0],
				[0, 0, 0, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 0],
				[0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 0],
				[0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 0],
				[0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 0, 0],
				[0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 0, 0],
				[0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 1, 0, 0, 0],
				[0, 0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 1, 0, 0, 0],
				[0, 0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 1, 0, 0, 0]
			];
		}
	}
}