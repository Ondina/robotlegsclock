/*
 * Copyright (c) 2010 the original author or authors
 * 
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */
package org.robotlegs.examples.robotlegsclock.models.vos
{

	[Bindable]
	public class ClocksStyleVO
	{
		public var showLegs:Boolean=true;
		public var showDialsText:Boolean=true;
		public var showDialsCircle:Boolean=false;

		public var darkColor:uint=0x424242;
		public var lightColor:uint=0xFFFFFF;
		public var accentColor:uint=0xb12121;
		public var shadowColor:uint=0xCCCCCC;

		public var dialsCircleColor:uint=0xFFFFFF;
		public var dialsTextColor:uint=0xFFFFFF;
		public var minutesLinesColor:uint=0xFFFFFF;

		public var secondsHandColor:uint=0xb12121;
		public var minutesHandColor:uint=0xFFFFFF;
		public var hoursHandColor:uint=0xFFFFFF;

		public var fontFamily:String="MyriadPro";

		public var showClocksLogo:Boolean=true;
		public var clocksLogoText:String="[analog-clock]";
		public var clocksLogoStartAngle:Number=220;

		public var resizeClock:Number=100;
		public var appWidth:Number=500;
		public var appHeight:Number=500;

		public function ClocksStyleVO()
		{
		}
	}
}