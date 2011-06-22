package jp.feb19.utils
{
	public class StringUtils
	{
		public function StringUtils()
		{
		}

		/**
		 * 半角スペースを排除します。
		 *
		 * @param	原文
		 * @return	排除された文字列
		 */
		public static function ignoreWhite(string:String):String
		{
			return StringUtils.ignoreLetter(string, " ");
		}

		/**
		 * 第一引数に与えるStringに含まれる任意の文字を排除します。
		 *
		 * @param	原文
		 * @param	排除したい任意の文字列
		 * @return	排除された文字列
		 */
		public static function ignoreLetter(string:String, letter:String):String
		{
			var array:Array = string.split(letter);
			var result:String = "";
			for (var i:int = 0; i < array.length; i++)
			{
				result += array[i];
			}

			return result;
		}

		/**
		 * URLからファイル名（最後の/以降に含まれている文字列）を抽出します。
		 *
		 * @param	string	URL
		 * @return	URLに含まれるファイル名
		 */
		public static function getFileName(string:String):String
		{
			//return string.substr(string.lastIndexOf("\\") + 1);

			var fileName:String = string;
			if (string.lastIndexOf("\\") > -1)
				fileName = string.substr(string.lastIndexOf("\\") + 1);
			else
				fileName = string.substr(string.lastIndexOf("/") + 1);

			return fileName;
		}

		/**
		 * URLを抽出するための正規表現
		 */
		public static const URL_REG_EXP:RegExp = /(https?:\/\/[0-9a-z-\/._?=&%\[\]~;]+)/ig;

		/**
		 * 指定されたパターンを文字列と照合し、新しい文字列を返します。
		 * パターンと最初に一致した部分が置換する文字列に置き換えられます。
		 *
		 * @param	str	照合する文字列
		 * @param	pattern	照合するパターンの文字列
		 * @param	replaceStr	置換する文字列
		 * @return	置換後の文字列
		 */
		public static function replaceAll(str:String, pattern:String, replceStr:String):String
		{
			//フラグ「g」(全て置換する)を指定する
			return str.replace(new RegExp(pattern, "g"), replceStr);
		}
	}
}