package  
{
	import com.greensock.events.TweenEvent;
	import com.greensock.TweenMax;
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class TweenManager
	{

		private static var _tweens:Array = [];
		
		private static var _currentTween:TweenMax = null;
		
		private static function performTweenFromObject(obj:Object):void 
		{
			var vars:Object = obj.vars;
			vars.onCompleteListener = onTweenComplete;
			var tween:TweenMax = new TweenMax(obj.target, obj.duration, obj.vars);
			tween.play();
			_currentTween = tween;
		}
		
		private static function onTweenComplete(e:TweenEvent):void
		{
			if (e.type == TweenEvent.COMPLETE)
			{
				var tweenObj:Object = _tweens[0];
				if ("onFinished" in tweenObj)
				{
					var finished:Function = tweenObj.onFinished as Function;
					finished();
				}
				_currentTween = null;
				_tweens.splice(0, 1);
				if (_tweens.length > 0)
				{
					performTweenFromObject(_tweens[0]);
				}
			}
		}
		
		public static function chain(...tweens):void 
		{
			for (var i:int = 0; i < tweens.length; i++)
			{
				if (tweens[i] is Object)
				{
					if (!("target" in tweens[i]) || !("duration" in tweens[i]) || !("vars" in tweens[i]))
					{
						continue;
					}
					var tweenObj:Object = tweens[i] as Object;
					_tweens.push(tweenObj);
				}
			}
			if (_tweens.length > 0)
			{
				performTweenFromObject(_tweens[0]);
			}
		}
		
	}

}