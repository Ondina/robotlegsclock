package org.robotlegs.examples.robotlegsclock.views.mediators
{
	import org.robotlegs.examples.robotlegsclock.events.TimeZoneEvent;
	import org.robotlegs.examples.robotlegsclock.views.components.clockstylist.TimeZone;
	import org.robotlegs.mvcs.Mediator;

	public class TimeZoneMediator extends Mediator
	{
		[Inject]
		public var view:TimeZone;

		override public function onRegister():void
		{
			addContextListener(TimeZoneEvent.TIMEZONES_RECEIVED, onTimeZonesReceived);
			addViewListener(TimeZoneEvent.TIMEZONE_CHANGED, dispatch);
			dispatch(new TimeZoneEvent(TimeZoneEvent.GET_TIMEZONES));
		}

		protected function onTimeZonesReceived(event:TimeZoneEvent):void
		{
			view.timeZones.dataProvider=event.timeZones;
		}
	}
}