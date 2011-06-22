package jp.feb19.display
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class View extends Sprite implements IView
	{
		public function View()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, _addedToStageHandler);
		}
		
		private function _addedToStageHandler(event:Event):void
		{
			addedToStage();
			removeEventListener(Event.ADDED_TO_STAGE, _addedToStageHandler);
			addEventListener(Event.REMOVED_FROM_STAGE, _removedFromStageHandler);
		}
		
		private function _removedFromStageHandler(event:Event):void
		{
			removedFromStage();
			removeEventListener(Event.REMOVED_FROM_STAGE, _removedFromStageHandler);
		}
		
		protected function addedToStage():void
		{
			resize();
		}
		
		protected function removedFromStage(isRetain:Boolean = false):void
		{
			if (isRetain)
				addEventListener(Event.ADDED_TO_STAGE, _addedToStageHandler);
		}
		
		public function activate():void
		{
			
		}
		
		public function deactivate():void
		{
			
		}
		
		public function resize():void
		{
			
		}
	}
}