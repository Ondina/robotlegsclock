package org.robotlegs.examples.robotlegsclock
{
	import flash.display.DisplayObjectContainer;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.examples.robotlegsclock.controllers.startup.PrepControllerCommand;
	import org.robotlegs.examples.robotlegsclock.controllers.startup.PrepModelCommand;
	import org.robotlegs.examples.robotlegsclock.controllers.startup.PrepViewCommand;
	import org.robotlegs.mvcs.Context;

	public class ClocksContext extends Context
	{
		public function ClocksContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}

		override public function startup():void
		{

			commandMap.mapEvent(ContextEvent.STARTUP, PrepControllerCommand, ContextEvent, false);
			commandMap.mapEvent(ContextEvent.STARTUP, PrepModelCommand, ContextEvent, false);
			commandMap.mapEvent(ContextEvent.STARTUP, PrepViewCommand, ContextEvent, false);
			this.dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
	}
}