package jp.feb19.ui
{
	import flash.display.BitmapData;
	import flash.ui.Mouse;
	import flash.ui.MouseCursorData;

	public class NativeMouseCursorController
	{
		public function NativeMouseCursorController()
		{
		}
		
		public function registerCursor(mouseCursor:IMouseCursor):void
		{
			var bitmapDatas:Vector.<BitmapData> = new Vector.<BitmapData>();
				bitmapDatas.push(mouseCursor.bitmapData);
			var cursorData:MouseCursorData = new MouseCursorData();
				cursorData.data = bitmapDatas;
				cursorData.hotSpot = mouseCursor.hotspot;
			Mouse.registerCursor(mouseCursor.name, cursorData);
		}
		
		public function changeCursor(name:String):void
		{
			Mouse.cursor = name;
		}
	}
}