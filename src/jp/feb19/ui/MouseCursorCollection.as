package jp.feb19.ui
{
	import flash.display.BitmapData;
	import flash.geom.Point;

	public class MouseCursorCollection
	{
		private var _bitmapData:BitmapData;
		
		public function MouseCursorCollection()
		{
		}
		
		protected function get data():Array
		{
			return [];
		}
		
		private function _createBitmapData(value:Array):BitmapData
		{
			const WHITE:uint = 0xffffffff;
			const BLACK:uint = 0xff000000;
			var h:uint = value.length;
			var w:uint = value[0].length;
			var bmd:BitmapData = new BitmapData(w, h, true, 0);
			bmd.lock();
			for (var i:uint = 0; i<	h; i++)
			{
				for (var j:uint = 0; j < w; j++)
				{
					switch(value[i][j])
					{
						case 2:
							bmd.setPixel32(j, i, WHITE);
							break;
						case 1:
							bmd.setPixel32(j, i, BLACK);
							break;
						default:
							
					}
				}
			}
			bmd.unlock();
			
			return bmd;
		}
		
		public function dispose():void
		{
			if (_bitmapData)
			{
				_bitmapData.dispose();
				_bitmapData = null;
			}
		}
		
		public function get bitmapData():BitmapData
		{
			if (!_bitmapData)
			{
				return _bitmapData = _createBitmapData(data);
			}
			else
			{
				return _bitmapData;
			}
			
		}
	}
}