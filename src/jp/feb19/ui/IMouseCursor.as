package jp.feb19.ui
{
	import flash.display.BitmapData;
	import flash.geom.Point;

	public interface IMouseCursor
	{
		function get hotspot():Point;
		function get bitmapData():BitmapData;
		function get name():String;
	}
}