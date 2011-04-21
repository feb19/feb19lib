package jp.feb19.utils
{
	import flash.external.ExternalInterface;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.system.Capabilities;
	import flash.system.Security;
	
	public class BrowserUtils
	{
		public function BrowserUtils()
		{
		}
		
		/**
		 * BrowserUtilitiesが利用可能かどうか
		 */
		public static function get enabled():Boolean
		{
			//ドメインベースのサンドボックス下かどうか
			if (!isOnline)
				return false;
			
			//プレイヤータイプを判別
			switch( Capabilities.playerType ) {
				case "ActiveX" :
				case "PlugIn" :
					break;
				case "External" :
				case "StandAlone" :
				default :
					return false;
			}
			
			//ExternalInterfaceが使用可能かどうか
			if (!ExternalInterface.available)
				return false;
			
			//ExternalInterfaceが問題なく返り値を返すかどうか
			if (ExternalInterface.call("function() { return 'true'; }") != true)
				return false;
			
			return true;
		}
		
		/**
		 * 実行SWFがインターネットURLからのもので、ドメインベースのサンドボックス規則に従って機能するかどうか
		 */
		public static function get isOnline():Boolean
		{
			switch(Security.sandboxType)
			{
				case Security.REMOTE:
					return true;
					
				case Security.LOCAL_TRUSTED:
				case Security.LOCAL_WITH_FILE:
				case Security.LOCAL_WITH_NETWORK:
				default:
					return false;
			}
		}
		
		/**
		 * ExternalInterfaceをラップするJavaScriptコール関数
		 */
		public static function call(funcName:String, ... args:Array):String
		{
			if (!enabled)
				return "";
			
			args.unshift( funcName );
			
			var result:String = ExternalInterface.call.apply(null, args);
			return result ? result : "";
		}
		
		/**
		 * ブラウザのアラートウィンドウを呼び出す
		 */
		public static function alert(... messages:Array):void
		{
			trace.apply(null, messages);
			call( "function() { alert('" + messages.join( " " ) + "'); } " );
		}
		
		/**
		 * ブラウザを閉じる（fullScreenで呼び出された場合のみ可能）
		 */
		public static function close():void
		{
			call( "function() { window.close(); }" );
		}
		
		/**
		 * ブラウザをリロードする
		 */
		public static function reload():void
		{
			call( "function() { location.reload(); }" );
		}
		
		/**
		 * Javaが使用可能かどうかの論理値
		 */
		public static function get javaEnabled():Boolean { return ( call( 'function() { return navigator.javaEnabled(); }' ) == "true" ); }
		
		/**
		 * プラットフォームを示す文字列。 "Win32"、 "Linux i686"、 "MacPPC"、 "MacIntel" など。
		 */
		public static function get platform():String { return call( 'function() { return navigator.platform; }' ); }
		
		/**
		 * ユーザーエージェント
		 */
		public static function get userAgent():String { return call( 'function() { return navigator.userAgent; }' ); }
		
		/**
		 * ポップアップウィンドウを開く。Safariの場合はポップアップブロックがかかるのでただのnavigateToURL。
		 */
		public static function popup(url:String, width:int = 320, height:int = 240, center:Boolean = true, toolbar:Boolean = false, scrollbars:Boolean = false):void
		{
			var available:Boolean = ExternalInterface.available;
			if (!available)
			{
				navigateToURL(new URLRequest(url), "_blank");
				return;
			}
			
			var screenWidth:Number = ExternalInterface.call("function getCenterX(){ return screen.width; }");
			var screenHeight:Number = ExternalInterface.call("function getCenterY(){ return screen.height; }");
			var browserAgent:String = ExternalInterface.call("function getBrowser(){ return navigator.userAgent; }");
			var isSafari:Boolean = false;
			if (browserAgent.indexOf ("Safari") >= 0)
				isSafari = true;
			
			var options:Array = new Array();
			if (width)
				options.push("width=" + width);
			if (height)
				options.push("height=" + height);
			if (center && screenWidth && screenHeight && width && height)
				options.push("left=" + ((screenWidth - width) / 2) + ",top=" + ((screenHeight - height) / 2));
			if (toolbar)
				options.push("toolbar=yes");
			if (scrollbars)
				options.push("scrollbars=yes");
			
			var option:String = "";
			for (var i:int = 0; i < options.length; i++)
			{
				if (i == 0)
					option += options[i];
				else
					option += ", " + options[i];
			}
			
			if (!isSafari)
				ExternalInterface.call("window.open", url, "_blank", option);
			else
				navigateToURL(new URLRequest(url), "_blank");
		}
	}
}