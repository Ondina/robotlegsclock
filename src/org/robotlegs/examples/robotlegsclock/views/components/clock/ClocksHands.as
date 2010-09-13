/*
 * Copyright (c) 2010 the original author or authors
 * 
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */
package org.robotlegs.examples.robotlegsclock.views.components.clock
{
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;
	import flash.utils.Timer;
	
	import org.robotlegs.examples.robotlegsclock.models.vos.ClocksStyleVO;
	import org.robotlegs.examples.robotlegsclock.utils.GeometryUtils;
	
	import spark.components.Group;

	public class ClocksHands extends Group
	{
		protected var _clocksStyleVO:ClocksStyleVO=new ClocksStyleVO();

		protected var secondsHand:Group=new Group();
		protected var minutesHand:Group=new Group();
		protected var hoursHand:Group=new Group();
		protected var _clocksRectangle:Rectangle=new Rectangle();

		protected var clocksTimer:Timer;

		public function ClocksHands()
		{
			super();
		}

		public function startTicking():void
		{
			drawClocksHands();
			time=new Date();
			createTimer();
			clocksTimer.start();
		}

		public function set clocksRectangle(val:Rectangle):void
		{
			_clocksRectangle=val;
		}

		public function set clocksStyleVO(val:ClocksStyleVO):void
		{
			_clocksStyleVO=val;
		}

		protected function get clocksStyleVO():ClocksStyleVO
		{
			return _clocksStyleVO;
		}

		public function redoClocksHands():void
		{
			this.graphics.clear();
			this.removeAllElements();
			drawClocksHands();
		}

		//////////////////
		//	CLOCK'S HANDS
		//////////////////
		protected function drawClocksHands():void
		{
			GeometryUtils.drawTriangle(hoursHand, _clocksRectangle, 54, 7.7, _clocksStyleVO.hoursHandColor);
			GeometryUtils.drawTriangle(minutesHand, _clocksRectangle, 74, 5, _clocksStyleVO.minutesHandColor);
			GeometryUtils.drawTriangle(secondsHand, _clocksRectangle, 81, 1.66, _clocksStyleVO.secondsHandColor);
			this.addElement(hoursHand);
			this.addElement(minutesHand);
			this.addElement(secondsHand);
		}

		//////////////////
		//	THE TIME
		//////////////////
		protected function set time(time:Date):void
		{
			var hours:Number=time.hours;
			hours+=(1 / 60 * time.minutes);
			hour=hours;
			minutes=time.minutes;
			seconds=time.seconds;
		}

		protected function set hour(hour:Number):void
		{
			if (hour > 12)
				hour-=12;
			hoursHand.rotation=360 / 12 * hour;
		}

		protected function set minutes(minutes:int):void
		{
			minutesHand.rotation=360 / 60 * minutes;
		}

		protected function set seconds(seconds:int):void
		{
			secondsHand.rotation=360 / 60 * seconds;
		}

		protected function createTimer():void
		{
			clocksTimer=new Timer(1000);
			clocksTimer.addEventListener(TimerEvent.TIMER, onClockTick);
		}

		protected function onClockTick(event:TimerEvent):void
		{
			time=new Date();
		}
	}
}