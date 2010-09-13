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

	public class ClocksLogoBackground extends Group
	{
		protected var _clocksStyleVO:ClocksStyleVO=new ClocksStyleVO();
		protected var _clocksRectangle:Rectangle=new Rectangle();

		public function ClocksLogoBackground()
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

		public function redoClocksLogoBackground():void
		{
			this.graphics.clear();
			if (_clocksStyleVO.showClocksLogo)
				drawClocksLogoBackground();
		}

		public function drawClocksLogoBackground():void
		{
			var ellipseWidth:Number=(_clocksStyleVO.appWidth * 52) / 100;
			var ellipseHeight:Number=(_clocksStyleVO.appHeight * 52) / 100;
			var sectorHeight:Number=(ellipseHeight * 38) / 100;
			var center:Rectangle=new Rectangle(_clocksRectangle.width/2, sectorHeight*2);
			
			this.graphics.beginFill(_clocksStyleVO.darkColor, 1);
			this.graphics.lineStyle(4, _clocksStyleVO.lightColor, 1);
			GeometryUtils.drawCircleSectors(this.graphics, center, 35, 110, ellipseWidth, ellipseHeight, sectorHeight);
			this.graphics.endFill();
		}
	}
}