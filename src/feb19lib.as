package
{
	import flash.display.Sprite;
	import flash.text.TextField;
	
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
		}
	}
}