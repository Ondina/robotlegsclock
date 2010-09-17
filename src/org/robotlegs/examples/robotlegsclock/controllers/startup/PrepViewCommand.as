package org.robotlegs.examples.robotlegsclock.controllers.startup
{
	import org.robotlegs.examples.robotlegsclock.views.components.clock.AnalogClock;
	import org.robotlegs.examples.robotlegsclock.views.components.clockstylist.ClocksStylist;
	import org.robotlegs.examples.robotlegsclock.views.components.clockstylist.TimeZone;
	import org.robotlegs.examples.robotlegsclock.views.mediators.AnalogClockMediator;
	import org.robotlegs.examples.robotlegsclock.views.mediators.ClocksStylistMediator;
	import org.robotlegs.examples.robotlegsclock.views.mediators.RobotlegsClockMediator;
	import org.robotlegs.examples.robotlegsclock.views.mediators.TimeZoneMediator;
	import org.robotlegs.mvcs.Command;
	
	public class PrepViewCommand extends Command
	{
		public function PrepViewCommand()
		{
			super();
		}
		override public function execute():void
		{
			mediatorMap.mapView(RobotlegsClock, RobotlegsClockMediator, null, true, false); //don't remove the mediator
			mediatorMap.mapView(AnalogClock, AnalogClockMediator);
			mediatorMap.mapView(ClocksStylist, ClocksStylistMediator);
			mediatorMap.mapView(TimeZone, TimeZoneMediator);
		}
	}
}