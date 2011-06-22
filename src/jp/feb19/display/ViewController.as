package jp.feb19.display
{
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class ViewController extends EventDispatcher
	{
		private var _views:Array;
		private static var _instance:ViewController;
		
		public static function getInstance():ViewController
		{
			if (!_instance)
				_instance = new ViewController(new SingletonEnforcer());
			
			return _instance;
		}
		
		public function ViewController(enforcer:SingletonEnforcer = null)
		{
			if (!enforcer)
				throw new Error("use ViewController.getInstance()");
			
			_views = [];
			super();
		}
		
		public function addView(view:IView):void
		{
			_views.push(view);
		}
		
		public function get views():Array
		{
			return _views;
		}
		
		public function removeView(view:IView):void
		{
			var views:Array = _views,
				l:uint = views.length;
			for (var i:uint = 0;i <l;i++)
			{
				if (views[i] === view)
				{
					views.splice(i, 1);
					_views = views;
					return;
				}
			}
		}
		
		public function activate():void
		{
			var views:Array = _views,
				l:uint = views.length;
			for (var i:uint = 0;i <l;i++)
			{
				if (views[i].parent)
					views[i].activate();
			}
		}
		
		public function deactivate():void
		{
			var views:Array = _views,
				l:uint = views.length;
			for (var i:uint = 0;i <l;i++)
			{
				if (views[i].parent)
					views[i].deactivate();
			}
		}
		
		public function resize():void
		{
			var views:Array = _views,
				l:uint = views.length;
			for (var i:uint = 0;i <l;i++)
			{
				if (views[i].parent)
					views[i].resize();
			}
		}
	}
}

class SingletonEnforcer {}