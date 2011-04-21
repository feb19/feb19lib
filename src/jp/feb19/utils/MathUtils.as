package jp.feb19.utils
{
	public class MathUtils
	{
		public function MathUtils()
		{
		}
		
		public static function getRandomInt(min:Number, max:Number):int
		{
			min = Math.ceil(min);
			max = Math.floor(max);
			return min + Math.floor(Math.random() * (max + 1 - min));
		}
		
		public static function getRandomNumber(min:Number, max:Number):Number
		{
			return min + (Math.random() * (max - min));
		}
		
		public static function normalize(value:Number, min:Number, max:Number):Number
		{
			return (value - min) / (max - min);
		}
		
		public static function interpolate(normalValue:Number, min:Number, max:Number):Number
		{
			return min + (max - min) * normalValue;
		}
		
		public static function map(value:Number, min1:Number, max1:Number, min2:Number, max2:Number):Number
		{
			return interpolate( normalize(value, min1, max1), min2, max2);
		}
		
		public static function findPreferredRatio(width:Number, height:Number, maxWidth:Number, maxHeight:Number):Number
		{
			var dw:Number = maxWidth / width;
			var dh:Number = maxHeight / height;
			return dw < dh ? dw : dh;
		}
		
		public static function limit(value:Number, min:Number, max:Number):Number
		{
			return Math.min(Math.max(min, value), max);
		}
		
		public static function roundNumber(value:Number, digit:Number = 0):Number
		{
			var factor:Number = Math.pow(10, digit);
			return int(value * factor) / factor;
		}
		
		public static function degreeToRadians(degrees:Number):Number
		{
			return degrees * (Math.PI / 180);
		}
		
		public static function radiansToDegrees(radians:Number):Number
		{
			return radians * (180 * Math.PI);
		}
	}
}