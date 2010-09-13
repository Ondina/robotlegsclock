package org.robotlegs.examples.robotlegsclock.views.mediators
{
	import org.robotlegs.examples.robotlegsclock.events.ClocksStyleEvent;
	import org.robotlegs.examples.robotlegsclock.views.components.clock.AnalogClock;
	import org.robotlegs.mvcs.Mediator;

	public class AnalogClockMediator extends Mediator
	{
		[Inject]
		public var view:AnalogClock;

		public function AnalogClockMediator()
		{
			super();
		}

		override public function onRegister():void
		{
			addContextListener(ClocksStyleEvent.CLOCKS_STYLE_CHANGED, onStyleChanged);
		}

		protected function onStyleChanged(event:ClocksStyleEvent):void
		{
			view.clocksStyleVO=event.clocksStyleVO;
			view.changeClocksStyles();
		}
	}
}