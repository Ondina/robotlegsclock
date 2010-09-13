/*
 * Copyright (c) 2010 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */
package org.robotlegs.examples.robotlegsclock.views.components.clock
{
	import flash.geom.Rectangle;
	
	import org.robotlegs.examples.robotlegsclock.models.vos.ClocksStyleVO;
	import org.robotlegs.examples.robotlegsclock.utils.GeometryUtils;
	import org.robotlegs.examples.robotlegsclock.utils.TextUtils;
	
	import spark.components.Group;

	public class ClocksLogo extends Group
	{
		protected var _clocksStyleVO:ClocksStyleVO=new ClocksStyleVO();
		protected var _clocksRectangle:Rectangle=new Rectangle();

		public function ClocksLogo()
		{
			super();
		}

		public function set clocksStyleVO(val:ClocksStyleVO):void
		{
			_clocksStyleVO=val;
		}

		public function get clocksStyleVO():ClocksStyleVO
		{
			return _clocksStyleVO;
		}

		public function set clocksRectangle(val:Rectangle):void
		{
			_clocksRectangle=val;
		}

		public function redoClocksLogo():void
		{
			this.removeAllElements();
			if (_clocksStyleVO.showClocksLogo)
				drawClocksLogo();
		}

		public function drawClocksLogo():void
		{
			var fontSize:Number=GeometryUtils.percentualValue(_clocksRectangle.height / 2, 14);
			var radius:Number=_clocksRectangle.height / 2 + GeometryUtils.percentualValue(_clocksRectangle.height / 2, 17);
			
			TextUtils.drawCurvedText(this, _clocksStyleVO.clocksLogoText, fontSize, [_clocksStyleVO.lightColor,
				_clocksStyleVO.accentColor], _clocksRectangle, radius, _clocksStyleVO.clocksLogoStartAngle);
		}
	}
}