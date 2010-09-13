package org.robotlegs.examples.robotlegsclock.views.mediators
{
	import org.robotlegs.examples.robotlegsclock.events.ClocksStyleEvent;
	import org.robotlegs.examples.robotlegsclock.views.components.clockstylist.ClocksStylist;
	import org.robotlegs.mvcs.Mediator;

	public class ClocksStylistMediator extends Mediator
	{
		[Inject]
		public var view:ClocksStylist;

		public function ClocksStylistMediator()
		{
			super();
		}

		override public function onRegister():void
		{
			eventMap.mapListener(view, ClocksStyleEvent.CHANGE_CLOCKS_STYLE, dispatch);
		}
	}
}