package jp.feb19.utils
{
	public class NumberUtils
	{
		public function NumberUtils()
		{
		}
		
		/**
		 * 指定のNumberを、一桁目から一文字ごとに配列に格納する
		 * 
		 * @param	number:Number	対象のNumber
		 * @return	分解され一の位から順番に格納された配列
		 */
		public static function toArray(num:int, digit:int = 0):Array
		{
			var result:Array = [];
			while (num >= 1)
			{
				var s:int = num % 10;
				result.push(s);
				num /= 10;
			}
			if (result.length < digit)
			{
				for (var i:int = result.length; i < digit; i++)
				{
					result.push(0);
				}
			}
			
			return result;
		}
		
		/**
		 * 指定のNumberを、指定の桁数にして、頭に0をつける
		 * 
		 * @param	numberToFormat	変換したいNumber
		 * @param	minLength	最低桁数
		 * @param	thouDelim	3桁毎に挿入する文字
		 * @param	fillChar	最低桁数を下回る場合、頭につく文字列（デフォルト0）
		 * @return	フォーマットされた数字文字列
		 * 
		 * trace(NumberUtilities.format(1234567, 8, ",")); // 出力： 01,234,567
		 * trace(NumberUtilities.format(1234567, 8)); // 出力： 01234567
		 */
		public static function format(numberToFormat:Number, minLength:Number = NaN, thouDelim:String = "", fillChar:String = ""):String
		{
			var num:String = numberToFormat.toString();
			var len:Number = num.length;
			
			if (thouDelim != "") {
				var numSplit:Array = num.split('');
				var counter:Number = 3;
				var i:Number       = numSplit.length;
				
				while (--i > 0) {
					counter--;
					if (counter == 0) {
						counter = 3;
						numSplit.splice(i, 0, thouDelim);
					}
				}
				
				num = numSplit.join('');
			}
			
			if (!isNaN(minLength)) {
				if (len < minLength) {
					minLength -= len;
					
					var addChar:String = (fillChar == "") ? '0' : fillChar;
					
					while (minLength--)
						num = addChar + num;
				}
			}
			
			return num;
		}
		
		/**
		 * formatされている数字の文字列を、ごく一般的な数値に変換する
		 * 
		 * @param	formatToNumber	変換したい数字文字列
		 * @return	一般的な数字
		 */
		public static function unformat(formatToNumber:String):Number
		{
			var numberString:String = StringUtils.ignoreLetter(StringUtilities.ignoreWhite(formatToNumber), ",");
			var number:Number = Number(numberString)
			
			return number;
		}
		
		/**
		 * 与えられた自然数を序数形式の文字列にして返す
		 * 
		 * @param	number	自然数
		 * @return	序数
		 */
		public static function ordinal(num:uint):String
		{
			var number:String = num.toString();
			if (num > 10 && number.substr( -2, 1))
			{
				number += "th";
			}
			else if (number.substr( -1, 1) == "1")
			{
				number += "st";
			}
			else if (number.substr( -1, 1) == "2")
			{
				number += "nd";
			}
			else if (number.substr( -1, 1) == "3")
			{
				number += "rd";
			}
			else
			{
				number += "th";
			}
			
			return number;
		}
		
		/**
		 * 序数形式の文字列を自然数にして返す
		 * 
		 * @param	string	序数
		 * @return	自然数
		 */
		public static function unordinal(string:String):uint
		{
			return uint(string.substr(0, string.length - 2));
		}
	}
}