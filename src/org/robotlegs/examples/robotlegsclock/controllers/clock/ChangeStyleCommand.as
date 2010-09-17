package org.robotlegs.examples.robotlegsclock.controllers.clock
{
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.examples.robotlegsclock.models.ClocksModel;
	import org.robotlegs.examples.robotlegsclock.events.ClocksStyleEvent;

	public class ChangeStyleCommand extends Command
	{
		[Inject]
		public var event:ClocksStyleEvent;
		
		[Inject]
		public var clocksModel:ClocksModel;

		override public function execute():void
		{
			clocksModel.clocksStyleVO=event.clocksStyleVO;
		}
	}
}