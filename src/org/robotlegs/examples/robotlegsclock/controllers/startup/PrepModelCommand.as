package org.robotlegs.examples.robotlegsclock.controllers.startup
{
	import org.robotlegs.examples.robotlegsclock.models.ClocksModel;
	import org.robotlegs.examples.robotlegsclock.models.TimeZoneModel;
	import org.robotlegs.mvcs.Command;

	public class PrepModelCommand extends Command
	{
		public function PrepModelCommand()
		{
			super();
		}

		override public function execute():void
		{
			injector.mapSingleton(ClocksModel);
			injector.mapSingleton(TimeZoneModel);
		}
	}
}