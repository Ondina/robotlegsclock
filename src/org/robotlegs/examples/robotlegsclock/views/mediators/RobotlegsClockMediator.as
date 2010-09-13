package org.robotlegs.examples.robotlegsclock.views.mediators
{
	import org.robotlegs.examples.robotlegsclock.events.ClocksStyleEvent;
	import org.robotlegs.mvcs.Mediator;

	public class RobotlegsClockMediator extends Mediator
	{
		[Inject]
		public var view:RobotlegsClock;

		public function RobotlegsClockMediator()
		{
			super();
		}

		override public function onRegister():void
		{
			addContextListener(ClocksStyleEvent.CLOCKS_STYLE_CHANGED, onStyleChanged);
		}

		protected function onStyleChanged(event:ClocksStyleEvent):void
		{
			var newWidth:Number=(event.clocksStyleVO.resizeClock*event.clocksStyleVO.appWidth)/100;
			var newHeight:Number=(event.clocksStyleVO.resizeClock*event.clocksStyleVO.appHeight)/100;
			view.changeClocksStyles(newWidth, newHeight);
		}
	}
}