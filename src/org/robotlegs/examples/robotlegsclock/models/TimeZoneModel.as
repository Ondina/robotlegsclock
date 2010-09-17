package org.robotlegs.examples.robotlegsclock.models
{
	import mx.collections.ArrayCollection;

	import org.robotlegs.examples.robotlegsclock.events.TimeZoneEvent;
	import org.robotlegs.mvcs.Actor;

	public class TimeZoneModel extends Actor
	{
		//this should come from a server
		protected var timeZones:ArrayCollection=new ArrayCollection([{label: "Here", data: 0}, {label: "offset -6", data: -6}, {label: "offset +3", data: 3}]);

		public function timeZonesResults():void
		{
			dispatch(new TimeZoneEvent(TimeZoneEvent.TIMEZONES_RECEIVED, 0, timeZones));
		}
	}
}