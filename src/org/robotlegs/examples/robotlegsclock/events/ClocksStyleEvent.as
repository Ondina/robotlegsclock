package org.robotlegs.examples.robotlegsclock.events
{
	import flash.events.Event;

	import org.robotlegs.examples.robotlegsclock.models.vos.ClocksStyleVO;

	public class ClocksStyleEvent extends Event
	{		
		public static const CHANGE_CLOCKS_STYLE:String="changeClocksStyle";
		public static const CLOCKS_STYLE_CHANGED:String="clocksStyleChanged";

		public var clocksStyleVO:ClocksStyleVO;

		public function ClocksStyleEvent(type:String, clocksStyleVO:ClocksStyleVO=null)
		{
			this.clocksStyleVO=clocksStyleVO;
			super(type, false, false);
		}

		override public function clone():Event
		{
			return new ClocksStyleEvent(type, clocksStyleVO);
		}
	}
}