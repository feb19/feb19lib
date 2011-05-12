package jp.feb19.ui
{
	import flash.display.Bitmap;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.utils.Dictionary;

	public class MouseCursorController
	{
		private var _stage:Stage;
		private var _cursorCollection:Dictionary;
		private var _cursorBitmap:Bitmap;
		private var _cursorOffsetX:int;
		private var _cursorOffsetY:int;
		
		private var _isMove:Boolean;
		
		public function MouseCursorController(stage:Stage)
		{
			_stage = stage;
			_cursorCollection = new Dictionary();
			_stage.addEventListener(Event.DEACTIVATE, _deactivateHandler);
		}
		
		public function dispose():void
		{
			setDefault();
			_stage.removeEventListener(Event.DEACTIVATE, _deactivateHandler);
			for each (var m:MouseCursorCollection in _cursorCollection)
			{
				m.dispose();
				m = null;
			}
			_cursorCollection = new Dictionary();
		}
		
		public function registerCursor(mouseCursor:IMouseCursor):void
		{
			if (!_cursorCollection[mouseCursor.name])
			{
				var bmp:Bitmap = new Bitmap(mouseCursor.bitmapData, "never", false);
				var offsetX:Number = mouseCursor.hotspot.x;
				var offsetY:Number = mouseCursor.hotspot.y;
				_cursorCollection[mouseCursor.name] = { bitmap:bmp, offsetX:offsetX, offsetY:offsetY };
				
			}
		}
		
		public function changeCursor(name:String):void
		{
			setDefault();
			
			if (_cursorCollection[name])
			{
				Mouse.hide();
				_stage.addEventListener(MouseEvent.MOUSE_MOVE, _mouseMoveHandler);
				
				_cursorBitmap = _cursorCollection[name].bitmap;
				_cursorOffsetX = _cursorCollection[name].offsetX;
				_cursorOffsetY = _cursorCollection[name].offsetY;
				_stage.addChild(_cursorBitmap);
				_cursorBitmap.x = _stage.mouseX - _cursorOffsetX;
				_cursorBitmap.y = _stage.mouseY - _cursorOffsetY;
				
				_isMove = true;
			}
		}
		
		public function setDefault():void
		{
			_stage.removeEventListener(MouseEvent.MOUSE_MOVE, _mouseMoveHandler);
			_isMove = false;
			Mouse.show();
			
			if (_cursorBitmap)
			{
				_stage.removeChild(_cursorBitmap);
				_cursorBitmap = null;
			}
		}
		
		private function _deactivateHandler(event:Event):void
		{
			setDefault();
		}
		
		private function _mouseMoveHandler(event:MouseEvent):void
		{
			_cursorBitmap.x = _stage.mouseX - _cursorOffsetX;
			_cursorBitmap.y = _stage.mouseY - _cursorOffsetY;
			_stage.setChildIndex(_cursorBitmap, _stage.numChildren - 1);
			
			event.updateAfterEvent();
		}
	}
}