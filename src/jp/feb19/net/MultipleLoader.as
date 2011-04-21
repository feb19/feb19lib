package jp.feb19.net
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.media.Sound;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;

	public class MultipleLoader extends EventDispatcher
	{
		public static const LOAD_PROGRESS:String = "ml_loadProgress";
		public static const LOAD_FRAGMENT:String = "ml_loadFragment";
		public static const LOAD_COMPLETE:String = "ml_loadComplete";

		private var _items:Array;
		private var _loaders:Array;

		private var _loadedItems:uint;
		private var _totalItems:uint;

		private var _fragmentPercent:Number;
		private var _fragmentLoadedBytes:Number;
		private var _fragmentTotalBytes:Number;

		private var _loadedBytes:uint;
		private var _totalBytes:uint;

		private var _autoResume:Boolean;
		
		private var _loadedPercent:Number;

		public function MultipleLoader(items:Array = null)
		{
			_items = items;
		}

		public function get items():Array
		{
			return _items;
		}

		public function set items(value:Array):void
		{
			_items = value;
		}

		public function start(autoResume:Boolean = false):Boolean
		{
			if (items.length > 0)
			{
				_loadedItems = 0;
				_totalItems = items.length;
				_fragmentPercent = 100 / _totalItems;
				_fragmentLoadedBytes = 0;
				_fragmentTotalBytes = 0;
				_loadedBytes = 0;
				_totalBytes = 0;
				_loadedPercent = 0;
				_loaders = [];
				_autoResume = autoResume;
				
				loadItem();
				
				return true;
			}
			else
			{
				return false;
			}
			
		}

		public function stop():void
		{
			_loaders[_loadedItems].removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			_loaders[_loadedItems].removeEventListener(ProgressEvent.PROGRESS, progressHandler);
			_loaders[_loadedItems].removeEventListener(Event.COMPLETE, completeHandler);
		}

		public function get fragmentLoadedBYtes():uint
		{
			return _fragmentLoadedBytes;
		}

		public function get fragmentTotalByes():uint
		{
			return _fragmentTotalBytes;
		}

		public function get loadedFragments():uint
		{
			return _loadedItems;
		}

		public function get totalFragments():uint
		{
			return _totalItems;
		}

		public function get loadedBytes():uint
		{
			return _fragmentLoadedBytes + _loadedBytes;
		}

		public function get totalBytes():uint
		{
			return _fragmentTotalBytes + _totalBytes;
		}

		public function get percent():Number
		{
			return _loadedPercent;
		}

		public function get loaders():Array
		{
			return _loaders;
		}

		private function loadItem():void
		{
			var itemURL:String = _items[_loadedItems];
			var request:URLRequest = new URLRequest(itemURL);
			_fragmentLoadedBytes = 0;
			_fragmentTotalBytes = 0;

			if (itemURL.substr(-4) == ".txt" || itemURL.substr(-4) == ".xml" || itemURL.substr(-5) == ".json")
			{
				var urlLoader:URLLoader = new URLLoader();
				urlLoader.dataFormat = URLLoaderDataFormat.TEXT;
				urlLoader.addEventListener(ProgressEvent.PROGRESS, progressHandler);
				urlLoader.addEventListener(Event.COMPLETE, completeHandler);
				urlLoader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
				urlLoader.load(request);
				_loaders[_loadedItems] = urlLoader;
			}
			else if (itemURL.substr(-4) == ".mp3")
			{
				var sound:Sound = new Sound();
				sound.addEventListener(ProgressEvent.PROGRESS, progressHandler);
				sound.addEventListener(Event.COMPLETE, completeHandler);
				sound.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
				sound.load(request);
				_loaders[_loadedItems] = sound;
			}
			else
			{
				var context:LoaderContext = new LoaderContext();
				context.applicationDomain = ApplicationDomain.currentDomain;

				var loader:Loader = new Loader();
				loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, progressHandler);
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
				loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
				loader.load(request, context);
				_loaders[_loadedItems] = loader;
			}
		}

		private function progressHandler(event:ProgressEvent):void
		{
			var per:Number = event.bytesLoaded / event.bytesTotal;
			_loadedPercent = (_loadedItems + per) * _fragmentPercent;

			_fragmentLoadedBytes = event.bytesLoaded;
			_fragmentTotalBytes = event.bytesTotal;

			dispatchEvent(new Event(MultipleLoader.LOAD_PROGRESS));
		}

		private function ioErrorHandler(event:IOErrorEvent):void
		{
			var target:Object = event.currentTarget;
			target.removeEventListener(ProgressEvent.PROGRESS, progressHandler);
			target.removeEventListener(Event.COMPLETE, completeHandler);
			target.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);

			dispatchEvent(event);
			
			if (_autoResume)
			{
				_fragmentLoadedBytes = 0;
				_fragmentTotalBytes = 0;
				_loadedPercent = _loadedItems * _fragmentPercent;
				
				loadItem();
			}
		}

		private function completeHandler(event:Event):void
		{
			_fragmentLoadedBytes = _fragmentTotalBytes;
			_loaderBytes += _fragmentTotalBytes;
			_totalBytes += _fragmentTotalBytes;

			dispatchEvent(new Event(MultipleLoader.LOAD_PROGRESS));


			_fragmentLoadedBytes = 0;
			_fragmentTotalBytes = 0;

			var target:Object = event.currentTarget;
			target.removeEventListener(ProgressEvent.PROGRESS, progressHandler);
			target.removeEventListener(Event.COMPLETE, completeHandler);
			target.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);

			_loadedItems++;
			_loadedPercent = _loadedItems * _fragmentPercent;

			dispatchEvent(new Event(MultipleLoader.LOAD_FRAGMENT));
			
			if (totalItems != _loadedItems)
				loadItem();
			else
				dispatchEvent(new Event(MultipleLoader.LOAD_COMPLETE));
		}
	}
}