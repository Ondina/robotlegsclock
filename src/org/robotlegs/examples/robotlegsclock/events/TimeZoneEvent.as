package org.robotlegs.examples.robotlegsclock.events
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.examples.robotlegsclock.models.vos.ClocksStyleVO;

	public class TimeZoneEvent extends Event
	{		
		public static const GET_TIMEZONES:String="getTimeZones";
		public static const TIMEZONES_RECEIVED:String="timeZonesReceived";
		public static const TIMEZONE_CHANGED:String="timeZoneChanged";

		public var timeZoneOffset:Number;
		public var timeZones:ArrayCollection;

		public function TimeZoneEvent(type:String, timeZoneOffset:Number=0, timeZones:ArrayCollection=null )
		{
			this.timeZoneOffset=timeZoneOffset;
			this.timeZones=timeZones;
			super(type, false, false);
		}

		override public function clone():Event
		{
			return new TimeZoneEvent(type, timeZoneOffset);
		}
	}
}