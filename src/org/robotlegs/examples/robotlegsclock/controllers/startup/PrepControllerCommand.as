package org.robotlegs.examples.robotlegsclock.controllers.startup
{
	import org.robotlegs.examples.robotlegsclock.controllers.clock.ChangeStyleCommand;
	import org.robotlegs.examples.robotlegsclock.controllers.clock.GetTimeZonesCommand;
	import org.robotlegs.examples.robotlegsclock.events.ClocksStyleEvent;
	import org.robotlegs.examples.robotlegsclock.events.TimeZoneEvent;
	import org.robotlegs.mvcs.Command;

	public class PrepControllerCommand extends Command
	{
		override public function execute():void
		{
			commandMap.mapEvent(ClocksStyleEvent.CHANGE_CLOCKS_STYLE, ChangeStyleCommand, ClocksStyleEvent);
			commandMap.mapEvent(TimeZoneEvent.GET_TIMEZONES, GetTimeZonesCommand, TimeZoneEvent);
		}
	}
}