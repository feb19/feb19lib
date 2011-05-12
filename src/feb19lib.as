package
{
	import flash.display.Sprite;
	import flash.text.TextField;
	
	import jp.feb19.net.MultipleLoader;
	import jp.feb19.net.SharedObjectController;
	import jp.feb19.ui.MouseCursorController;
	import jp.feb19.ui.MouseCursorHandClose;
	import jp.feb19.ui.MouseCursorHandOpen;
	import jp.feb19.ui.MouseCursorHandPush;
	import jp.feb19.ui.MouseCursorPointerBlack;
	import jp.feb19.ui.MouseCursorPointerWhite;
	import jp.feb19.ui.MouseCursorZoomIn;
	import jp.feb19.ui.MouseCursorZoomOut;
	import jp.feb19.ui.NativeMouseCursorController;
	import jp.feb19.utils.ArrayUtils;
	import jp.feb19.utils.ButtonUtils;
	import jp.feb19.utils.ColorUtils;
	import jp.feb19.utils.DisplayUtils;
	import jp.feb19.utils.MathUtils;
	import jp.feb19.utils.NumberUtils;
	import jp.feb19.utils.StringUtils;
	import jp.feb19.utils.SystemUtils;
	
	public class feb19lib extends Sprite
	{
		public function feb19lib()
		{
			var a:Array = [1,2,3,4];
			var b:Array = ArrayUtils.shuffle(a);
			
			var tf:TextField = new TextField();
				tf.text = b.toString();
			addChild(tf);
			
			var mouseCursor:MouseCursorController = new MouseCursorController(stage);
			
			// hero (sdk 4.5 / flash player 10.2)
			// var mouseCursor:NativeMouseCursorController = new NativeMouseCursorController();
			var mouseCursorHandOpen:MouseCursorHandOpen = new MouseCursorHandOpen();
			var mouseCursorHandClose:MouseCursorHandClose = new MouseCursorHandClose();
			var mouseCursorHandPush:MouseCursorHandPush = new MouseCursorHandPush();
			var mouseCursorPointerBlack:MouseCursorPointerBlack = new MouseCursorPointerBlack();
			var mouseCursorPointerWhite:MouseCursorPointerWhite = new MouseCursorPointerWhite();
			var mouseCursorZoomIn:MouseCursorZoomIn = new MouseCursorZoomIn();
			var mouseCursorZoomOut:MouseCursorZoomOut = new MouseCursorZoomOut();
			
				mouseCursor.registerCursor(mouseCursorHandOpen);
				mouseCursor.registerCursor(mouseCursorHandClose);
				mouseCursor.registerCursor(mouseCursorHandPush);
				mouseCursor.registerCursor(mouseCursorPointerBlack);
				mouseCursor.registerCursor(mouseCursorPointerWhite);
				mouseCursor.registerCursor(mouseCursorZoomIn);
				mouseCursor.registerCursor(mouseCursorZoomOut);
				
				mouseCursor.changeCursor(mouseCursorHandOpen.name);
				mouseCursor.changeCursor(mouseCursorHandClose.name);
				mouseCursor.changeCursor(mouseCursorHandPush.name);
				mouseCursor.changeCursor(mouseCursorPointerBlack.name);
				mouseCursor.changeCursor(mouseCursorPointerBlack.name);
				mouseCursor.changeCursor(mouseCursorZoomIn.name);
				mouseCursor.changeCursor(mouseCursorZoomOut.name);
		}
	}
}