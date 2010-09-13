package org.robotlegs.examples.robotlegsclock.controllers.startup
{
	import org.robotlegs.examples.robotlegsclock.controllers.clock.ChangeStyleCommand;
	import org.robotlegs.examples.robotlegsclock.events.ClocksStyleEvent;
	import org.robotlegs.mvcs.Command;

	public class PrepControllerCommand extends Command
	{
		override public function execute():void
		{
			commandMap.mapEvent(ClocksStyleEvent.CHANGE_CLOCKS_STYLE, ChangeStyleCommand, ClocksStyleEvent);
		}
	}
}