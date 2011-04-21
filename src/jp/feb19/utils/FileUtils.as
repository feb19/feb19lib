package jp.feb19.utils
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	/**
	 * FileUtilities
	 * @author Nobuhiro Takahashi
	 * 
	 * File についてのユーティリティクラスです。
	 */
	public class FileUtils
	{
		/**
		 * ファイルの内容をストリングで取得します。読み込みは UTF8 で行います。
		 * @param	file	ファイルインスタンス。
		 * @return	ファイルの内容
		 */
		public static function readFile(file:File):String
		{
			var stream:FileStream = new FileStream();
			stream.open(file, FileMode.READ);
			var data:String = stream.readUTFBytes(stream.bytesAvailable);
			stream.close();
			return data;
		}
	}
}