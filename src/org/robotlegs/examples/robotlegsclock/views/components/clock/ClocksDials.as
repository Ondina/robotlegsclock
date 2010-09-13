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
	import spark.components.Label;

	public class ClocksDials extends Group
	{
		protected var bigRect:Rectangle=new Rectangle();
		protected var mediumRect:Rectangle=new Rectangle();
		protected var smallRect:Rectangle=new Rectangle();
		protected var _clocksStyleVO:ClocksStyleVO=new ClocksStyleVO();

		protected var clocksNumbers:Vector.<String>=new<String>["3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "1", "2"];	
		//protected var clocksNumbers:Array=new Array("3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "1", "2");

		public function ClocksDials()
		{
			super();
		}

		public function set clocksStyleVO(val:ClocksStyleVO):void
		{
			_clocksStyleVO=val;
		}

		protected function get clocksStyleVO():ClocksStyleVO
		{
			return _clocksStyleVO;
		}

		public function initDials():void
		{
			bigRect.width=GeometryUtils.percentualValue(this.width / 2, 97);
			bigRect.height=GeometryUtils.percentualValue(this.height / 2, 97);
			mediumRect.width=GeometryUtils.percentualValue(this.width / 2, 92);
			mediumRect.height=GeometryUtils.percentualValue(this.height / 2, 92);
			smallRect.width=GeometryUtils.percentualValue(this.width / 2, 80);
			smallRect.height=GeometryUtils.percentualValue(this.height / 2, 80);

			drawMinutesSymbols();
			drawHoursSymbols();
		}

		public function redoClocksDials():void
		{
			this.removeAllElements();
			drawMinutesSymbols();
			drawHoursSymbols();
		}

		protected function drawMinutesSymbols():void
		{
			var minuteAngle:Number;
			var radMinuteAngle:Number;
			for (var minute:int=0; minute < 60; minute++)
			{
				minuteAngle=minute * 6;
				radMinuteAngle=minuteAngle * Math.PI / 180;

				bigRect.x=Math.cos(radMinuteAngle) * bigRect.width;
				bigRect.y=Math.sin(radMinuteAngle) * bigRect.height;
				mediumRect.x=Math.cos(radMinuteAngle) * mediumRect.width;
				mediumRect.y=Math.sin(radMinuteAngle) * mediumRect.height;

				if (minute % 5 == 0)
					this.addElement(drawMinutesLines(bigRect, mediumRect, 4, _clocksStyleVO.minutesLinesColor));
				else
					this.addElement(drawMinutesLines(bigRect, mediumRect, 1, _clocksStyleVO.minutesLinesColor));
			}
		}

		protected function drawMinutesLines(startPosition:Rectangle, endPosition:Rectangle, lineThickness:Number, lineColor:Number):Group
		{
			var minutesLines:Group=new Group();
			minutesLines.graphics.lineStyle(lineThickness, lineColor, .8);
			minutesLines.graphics.moveTo(startPosition.x, startPosition.y);
			minutesLines.graphics.lineTo(endPosition.x, endPosition.y);
			return minutesLines;
		}

		protected function drawHoursSymbols():void
		{
			var hourAngle:Number;
			var radHourAngle:Number;
			var fontSize:Number=GeometryUtils.percentualValue(smallRect.width, 20);
			for (var hour:int=0; hour < clocksNumbers.length; hour++)
			{
				hourAngle=hour * 30;
				radHourAngle=hourAngle * Math.PI / 180;

				bigRect.x=Math.cos(radHourAngle) * bigRect.width;
				bigRect.y=Math.sin(radHourAngle) * bigRect.height;
				smallRect.x=Math.cos(radHourAngle) * smallRect.width;
				smallRect.y=Math.sin(radHourAngle) * smallRect.height;

				if (_clocksStyleVO.showDialsText)
					this.addElement(TextUtils.makeLabel(clocksNumbers[hour], smallRect, fontSize, _clocksStyleVO.fontFamily, _clocksStyleVO.dialsTextColor));
				if (_clocksStyleVO.showDialsCircle)
					this.addElement(makeCircles(bigRect));
			}
		}

		protected function makeCircles(positionOnCircle:Rectangle):ClocksCircle
		{
			var littleCircles:ClocksCircle=new ClocksCircle();
			littleCircles.ellipseHeight=GeometryUtils.percentualValue(this.width / 2, 8);
			littleCircles.ellipseWidth=GeometryUtils.percentualValue(this.height / 2, 8);
			littleCircles.x=positionOnCircle.x - littleCircles.ellipseWidth / 2;
			littleCircles.y=positionOnCircle.y - littleCircles.ellipseHeight / 2;
			littleCircles.gradientColor=_clocksStyleVO.dialsCircleColor;
			littleCircles.strokeColor=_clocksStyleVO.dialsCircleColor;
			littleCircles.gradientAlpha=.8;
			littleCircles.strokeWeight=1;
			return littleCircles;
		}
	}
}