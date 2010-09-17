package org.robotlegs.examples.robotlegsclock.controllers.clock
{
	import org.robotlegs.examples.robotlegsclock.events.TimeZoneEvent;
	import org.robotlegs.examples.robotlegsclock.models.TimeZoneModel;
	import org.robotlegs.mvcs.Command;

	public class GetTimeZonesCommand extends Command
	{
		[Inject]
		public var event:TimeZoneEvent;

		[Inject]
		public var timeZoneModel:TimeZoneModel;

		override public function execute():void
		{
			timeZoneModel.timeZonesResults();
		}
	}
}