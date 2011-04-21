package jp.feb19.utils
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.FrameLabel;
	import flash.display.MovieClip;
	import flash.geom.Point;

	public class DisplayUtils
	{
		public function DisplayUtils()
		{
		}

		public static function ignoreMouse(displayObjectContainer:DisplayObjectContainer):void
		{
			if (displayObjectContainer.mouseEnabled)
				displayObjectContainer.mouseEnabled = false;
			if (displayObjectContainer.mouseChildren)
				displayObjectContainer.mouseChildren = false;

			if (displayObjectContainer.numChildren && displayObjectContainer.numChildren > 0)
			{
				var l:uint = displayObjectContainer.numChildren;
				for (var i:int = 0; i < l; i++)
				{
					if (displayObjectContainer.mouseEnabled)
						DisplayUtils.ignoreMouse(displayObjectContainer.getChildAt(i) as DisplayObjectContainer);
				}
			}
		}

		public static function respondToMouse(displayObjectContainer:DisplayObjectContainer):void
		{
			if (!displayObjectContainer.mouseEnabled)
				displayObjectContainer.mouseEnabled = true;
			if (!displayObjectContainer.mouseChildren)
				displayObjectContainer.mouseChildren = true;

			if (displayObjectContainer.numChildren && displayObjectContainer.numChildren > 0)
			{
				var l:uint = displayObjectContainer.numChildren;
				for (var i:int = 0; i < l; i++)
				{
					if (displayObjectContainer.mouseEnabled)
						DisplayUtils.respondToMouse(displayObjectContainer.getChildAt(i) as DisplayObjectContainer);
				}
			}
		}

		public static function stopAllChildren(mc:MovieClip):void
		{
			mc.stop();
			var l:uint = mc.numChildren;
			for (var i:int = 0; i < l; i++)
			{
				if (mc.getChildAt(i))
				{
					if (mc.getChildAt(i).hasOwnProperty("currentFrame"))
					{
						stopAllChildren(MovieClip(mc.getChildAt(i)));
					}
				}
			}
		}

		public static function playAllChildren(mc:MovieClip):void
		{
			// var doNotPlay:Boolean = true; を置いておくとその MovieClip は影響を受けない。
			if (!mc.doNotPlay)
				mc.play();
			var l:uint = mc.numChildren;
			for (var i:int = 0; i < l; i++)
			{
				if (mc.getChildAt(i))
				{
					if (mc.getChildAt(i).hasOwnProperty("currentFrame"))
					{
						playAllChildren(MovieClip(mc.getChildAt(i)));
					}
				}
			}
		}

		public static function generateFrameObject(mc:MovieClip):Object
		{
			var labels:Array = mc.currentLabels;
			var frameLabelObject:Object = new Object();
			var l:uint = labels.length;
			for (var i:uint = 0; i < l; i++)
			{
				var label:FrameLabel = labels[i];
				frameLabelObject[label.name] = label.frame;
			}
			return frameLabelObject;
		}
		
		/**
		 * 対象の DisplayObjectContainer の子を全て表示ツリーから削除します。
		 * @param	container	親の DislpayObjectContainer
		 */
		public static function removeAllChildren(displayObjectContainer:DisplayObjectContainer):Boolean
		{
			while (displayObjectContainer.numChildren)
				displayObjectContainer.removeChildAt(0);
			if (displayObjectContainer.numChildren == 0)
				return true;
			return false;
		}
		
		/**
		 * 対象の DisplayObject 内の座標から別の DisplayObject 内の座標へ、変換を行います。 localToGlobal() と globalToLocal() を内部で用いています。
		 * @param	point	ローカル座標
		 * @param	from	変換前の座標空間
		 * @param	to		変換後の座標空間
		 * @return	変換済み座標
		 */
		public static function convertCoord(point:Point, from:DisplayObject, to:DisplayObject):Point {
			return to.globalToLocal(from.localToGlobal(point));
		}
		
		/**
		 * 対象の DisplayObject を現在の表示リストから外し、任意の親の子にします。
		 * 内部で removeChild と addChild が行われるため、 Event.ADDED_TO_STAGE などのハンドラを設定している場合影響があります。
		 * rotation や transform の結果はサポートしていませんが、位置は内部で DisplayUtils.convertCoord() が実行されるため、ステージ絶対位置は変更されません。
		 * @param	target	対象の DisplayObject
		 * @param	newParent	新しい親とする DisplayObjectContainer
		 * @return	
		 */
		public static function changeParentTo(target:DisplayObject, newParent:DisplayObjectContainer):DisplayObject {
			// TODO: Support rotation and other transform props. (matrix or so)
			var gp:Point = convertCoord(new Point(target.x, target.y), target.parent, newParent);
			target.x = gp.x;
			target.y = gp.y;
			target.parent.removeChild(target);
			return newParent.addChild(target);
		}
	}
}