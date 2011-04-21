package jp.feb19.utils
{
	public class ColorUtils
	{
		public function ColorUtils()
		{
		}
		
		public static function hexToRGB(hex:Number):Object
		{
			return {r:hex >> 16, g:(hex >> 8) & 0xff, b:hex & 0xff};
		}
		
		public static function getHexStr(prefix:String, r:Number, g:Number, b:Number):String
		{
			return prefix + twoDigit(r.toString(16)) + twoDigit(g.toString(16)) + twoDigit(b.toString(16));
		}
		
		public static function getHex(r:Number, g:Number, b:Number):Number
		{
			return r << 16 | g << 8 | b;
		}
		
		public static function twoDigit(str:String):String
		{
			return str.length == 1 ? ("0" + str) : str;
		}
		
		public static function getRandomHue(hex:Number, offsetHex:Number):Number
		{
			var color:Number = ((Math.random() * 0xffffff) & hex) | offsetHex;
			return color;
		}
		
		/**
		 * 指定のディスプレイオブジェクトを、着色します。
		 * 
		 * @param displayObject	着色するディスプレイオブジェクト
		 * @param color	着色する色デフォルト値0xff0000
		 */
		public static function paint(displayObject:DisplayObject, color:int = 0xff0000):void
		{
			var cl:ColorTransform = displayObject.transform.colorTransform;
			cl.redMultiplier = 0;
			cl.greenMultiplier = 0;
			cl.blueMultiplier = 0;
			cl.redOffset = color >> 16 & 0xff;
			cl.greenOffset = color >> 8 & 0xff;
			cl.blueOffset = color & 0xff;
			displayObject.transform.colorTransform = cl;
		}
		
		/**
		 * BitmapData 内の指定のエリアにある色の平均を求めます。
		 * 
		 * @param bmd	ビットマップデータ
		 * @param rect	平均を取るエリア
		 */
		public static function avarage(bmd:BitmapData, rect:Rectangle):uint
		{
			var r:uint = 0;
			var g:uint = 0;
			var b:uint = 0;
			
			var l:uint = rect.bottom;
			var m:uint = rect.right;
			for (var y:int = rect.top; y < l; y++)
			{
				for (var x:int = rect.left; x < m; x++)
				{
					var c:uint = bmd.getPixel(x, y);
					r += 0x0000ff & c >> 16;
					g += 0x0000ff & c >> 8;
					b += 0x0000ff & c >> 0;
				}
			}
			
			r /= rect.width * rect.height;
			g /= rect.width * rect.height;
			b /= rect.width * rect.height;
			
			return int(r) << 16 | int(g) << 8 | int(b);
		}
		
		/**
		 * HSL 2 RGB
		 */
		private function hsl2rgb(h:Number, s:Number=1, l:Number):uint {
			
			if (h == 360){ h = 0;}
			
			//
			// based on C code from http://astronomy.swin.edu.au/~pbourke/colour/hsl/
			//
			
			while (h < 0){ h += 360; }
			while (h > 360){ h -= 360; }
			var r :Number, g :Number, b :Number;
			if (h < 120){
				r = (120 - h) / 60;
				g = h / 60;
				b = 0;
			}else if (h < 240){
				r = 0;
				g = (240 - h) / 60;
				b = (h - 120) / 60;
			}else{
				r = (h - 240) / 60;
				g = 0;
				b = (360 - h) / 60;
			}
			
			r = Math.min(r, 1);
			g = Math.min(g, 1);
			b = Math.min(b, 1);
			
			r = 2 * s * r + (1 - s);
			g = 2 * s * g + (1 - s);
			b = 2 * s * b + (1 - s);
			
			if (l < 0.5){
				r = l * r;
				g = l * g;
				b = l * b;
			}else{
				r = (1 - l) * r + 2 * l - 1;
				g = (1 - l) * g + 2 * l - 1;
				b = (1 - l) * b + 2 * l - 1;
			}
			
			return int (r * 255) * 65536 + int (g * 255) * 256 + int (b * 255);
		}
	}
}