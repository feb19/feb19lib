package jp.feb19.net
{
	import flash.events.EventDispatcher;
	import flash.events.NetStatusEvent;
	import flash.net.SharedObject;
	import flash.net.SharedObjectFlushStatus;

	public class SharedObjectController extends EventDispatcher
	{
		private var _sharedObject:SharedObject;

		public function SharedObjectController(sharedObejctName:String)
		{
			// constructor code
			_sharedObject = SharedObject.getLocal(sharedObejctName,"/");
			_sharedObject.addEventListener(NetStatusEvent.NET_STATUS , _netStatusHandler);
		}
		
		public function release():void
		{
			if (_sharedObject)
			{
				_sharedObject.removeEventListener(NetStatusEvent.NET_STATUS , _netStatusHandler);
				_sharedObject = null;
			}
		}

		public function clear():void
		{
			if (_sharedObject)
			{
				_sharedObject.clear();
			}
		}

		public function getValue(key:String):*
		{
			if (_sharedObject && _sharedObject.data[key]) {
				return _sharedObject.data[key];
			} else {
				return null;
			}
		}

		public function setValue(key:String, value:*):void
		{
			if (_sharedObject)
			{

				_sharedObject.data[key] = value;
				
				try
				{
					switch (_sharedObject.flush())
					{
						case SharedObjectFlushStatus.FLUSHED:
							trace("正常にハードディスクに書き込めました。");
							break;
						case SharedObjectFlushStatus.PENDING:
							trace("ユーザーにハードディスク書き込み要求を出します。 _netStatusHandler を受けて処理を行います")
							break;
					}
				}
				catch (e:Error)
				{
					trace("書き込みに失敗しました。");
				}
			}
		}
		
		private function _netStatusHandler(event:NetStatusEvent):void
		{
			switch (event.info.code)
			{
				case "SharedObject.Flush.Success" :
					trace("ユーザーがハードディスク書き込み許可ボタンを押した");
					break;
				case "SharedObject.Flush.Failed" :
					trace("ユーザーがハードディスク書き込み拒否ボタンを押した");
					break;
				default :
					trace("その他のイベントコード:" + event.info.code);
			}
		}
	}

}