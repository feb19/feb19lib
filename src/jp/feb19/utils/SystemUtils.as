package jp.feb19.utils
{
	import flash.net.LocalConnection;
	import flash.system.Capabilities;
	import flash.system.Security;
	import flash.system.System;

	public class SystemUtils
	{
		public function SystemUtils()
		{
		}
		
		public static function get isInBrowser():Boolean
		{
			return Capabilities.playerType == "PlugIn" || Capabilities.playerType == "ActiveX";
		}
		
		private var _domain:String;
		public static function get domain():String
		{
			if (!_domain)
				_domain = new LocalConnection().domain;
			return _domain;
		}
		
		public static function get isLocal():Boolean
		{
			return domain == "localhost";
		}
		
		public static function get isAIR():Boolean
		{
			return Capabilities.playerType == "Desktop";
		}
		
		public static function get isOnServer():Boolean
		{
			return Security.sandboxType = Security.REMOTE;
		}
		
		/**
		 * 強制ガベージコレクションを行います。
		 */
		public static function gc():void
		{
			trace("System.totalMemory: " + System.totalMemory);
			
			try {
				new LocalConnection().connect("foo");
				new LocalConnection().connect("foo");
			} catch (e:*) {}
			
			trace("System.totalMemory: " + System.totalMemory);
		}
		
		/**
		 * 使用されているFlashPlayerのバージョンが、対象のバージョン以上かどうかを判定します
		 * 
		 * @param	targetVersion	対象とするバージョン（9,0,112,0のような感じで記述して渡す）
		 * @return	対象バージョン以上のときは、true。対象バージョン未満のときはfalseを返す。
		 */
		public static function checkVersion(targetVersion:String):Boolean
		{
			var version:String = Capabilities.version.split(" ").reverse()[0];
			
			if (version == targetVersion)
				return true;
			
			var ver1:Array = version.split(",");
			var ver2:Array = targetVersion.split(",");
			
			if (int(ver1[0]) > int(ver2[0]))
			{
				return true;
			}
			else if(int(ver1[0]) == int(ver2[0]))
			{
				if (int(ver1[1]) > int(ver2[1]))
				{
					return true;
				}
				else if(int(ver1[1]) == int(ver2[1]))
				{
					if (int(ver1[2]) > int(ver2[2]))
					{
						return true;
					}
					else if(int(ver1[2]) == int(ver2[2]))
					{
						if (int(ver1[3]) >= int(ver2[3]))
						{
							return true;
						}
					}
				}
			}
			
			return false;
		}
		
		/**
		 * 使用されているOSが対象のOSかどうかを判定します。
		 * 
		 * @param	targetOs	対象とするOS(WIN, MACなど)
		 * @return	対象のOSかどうかを返します。
		 */
		public static function checkOS(targetOs:String):Boolean
		{
			var os:String = Capabilities.version.split(" ").reverse()[1];
			
			if (os == targetOs)
				return true;
			else
				return false;
		}
		
		/**
		 * 使用されているOSがWindowsかどうかを判定します。
		 */
		public static function isWIN():Boolean
		{
			return checkOS("WIN");
		}
		
		/**
		 * 使用されているOSがMac OSかどうかを判定します。
		 */
		public static function isMac():Boolean
		{
			return checkOS("MAC");
		}
	}
}