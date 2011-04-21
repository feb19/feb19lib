package jp.feb19.utils
{
	/**
	 * 
	 * @author Meditation
	 */
	public class ArrayUtils
	{
		/**
		 * 
		 */
		public function ArrayUtils()
		{
		}
		
		/**
		 * 与えた配列を複製してシャッフルした配列を返します
		 * @param array 元にする配列
		 * @return シャッフル済みの配列
		 */
		public static function shuffle(array:Array):Array
		{
			var a:Array = [].concat(array);
			return a.sort(shuffleSort);
		}
		
		private static function shuffleSort(a:*, b:*):int
		{
			var random:int;
			while(random == 0)
			{
				random = MathUtils.getRandomInt(-1, 1);
			}
			return random;
		}
		
		/**
		 * 配列の a と b を入れ替える
		 * @param array
		 * @param a
		 * @param b
		 * @return 
		 */
		public static function swap(array:Array, a:int, b:int):Array
		{
			var temp:* = array[a];
			array[a] = array[b];
			array[b] = temp;
			return array;
		}
		
		/**
		 * 重複を削除して新しい配列で返す
		 * @param array
		 * @return 
		 */
		public static function unique(array:Array):Array
		{
			var obj:Object = new Object();
			var i:Number = array.length;
			var a:Array = [];
			var t:*;
			while(i--)
			{
				t = array[i];
				obj[t] = t;
			}
			for each(var item:* in obj) { a.push(item); }
			return a;
		}
		
		/**
		 * 引数に与えるデータが、指定の配列に存在しているかどうかを判定します。
		 * @param	data	確認するデータ
		 * @param	list	確認する配列
		 * @return	存在していた場合 true
		 */
		public static function hasData(data:*, list:Array):Boolean
		{
			if (searchDataIndex(data, list) >= 0)
				return true;
			else
				return false;
		}
		
		/**
		 * 引数に与えるデータが、指定の配列の何インデックス番目に存在しているかを判定します。
		 * @param	data	確認するデータ
		 * @param	list	確認する配列
		 * @return	存在していない場合は -1
		 */
		public static function searchDataIndex(data:*, list:Array):int
		{
			var l:uint = list.length;
			for( var i:int = 0; i < l; i++)
			{
				if (list[i] === data)
				{
					return i;
				}
			}
			
			return -1;
		}
		
		/**
		 * 配列内の指定のオブジェクトを切り取る（対象のオブジェクトを配列からsplice）
		 * 内部的に == で判別します。
		 * @param	arr	配列
		 * @param	value	削除するオブジェクト
		 * @return	削除された配列
		 */
		public static function remove(arr:Array, value:*):Array
		{
			var l:uint;
			var i:int;
			l = arr.length;
			i = l;
			while (i-- > -1)
			{
				if (arr[i] == value)
				{
					arr.splice(i, 1);
				}
			}
			
			return arr;
		}
		
		/**
		 * 指定の配列を空にします。
		 * @param	arr	配列
		 * @return	空の配列
		 */
		public static function clear(arr:Array):Array
		{
			while (arr.length)
			{
				arr.pop();
			}
			return arr;
		}
	}
}