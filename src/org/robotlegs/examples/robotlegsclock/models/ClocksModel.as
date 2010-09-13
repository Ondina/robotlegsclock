package org.robotlegs.examples.robotlegsclock.models
{
	import org.robotlegs.examples.robotlegsclock.events.ClocksStyleEvent;
	import org.robotlegs.examples.robotlegsclock.models.vos.ClocksStyleVO;
	import org.robotlegs.mvcs.Actor;

	public class ClocksModel extends Actor
	{
		private var _clocksStyleVO:ClocksStyleVO;

		public function ClocksModel()
		{
			super();
		}

		public function get clocksStyleVO():ClocksStyleVO
		{
			return _clocksStyleVO;
		}

		public function set clocksStyleVO(val:ClocksStyleVO):void
		{
			_clocksStyleVO=val;
			if (!val)
				return;
			dispatch(new ClocksStyleEvent(ClocksStyleEvent.CLOCKS_STYLE_CHANGED, clocksStyleVO));
		}
	}
}