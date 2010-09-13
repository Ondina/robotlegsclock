/*
 * Copyright (c) 2010 the original author or authors
 * 
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */
package org.robotlegs.examples.robotlegsclock.utils
{
	import flash.display.Graphics;
	import flash.geom.Rectangle;

	import spark.components.Group;

	public class GeometryUtils
	{
		public function GeometryUtils()
		{
		}

		public static function drawCircleSectors(target:Graphics, center:Rectangle, startDegrees:Number, arcDegrees:Number, xRadius:Number, yRadius:Number=NaN, sectorHeight:Number=0):void
		{ //counterclockwise
			if (isNaN(yRadius))
				yRadius=xRadius;
			
			if (Math.abs(arcDegrees) > 360)
				arcDegrees=360;

			var segmentCount:int=Math.ceil(Math.abs(arcDegrees) / 45);
			var theta:Number=GeometryUtils.degreesToRadians(arcDegrees / segmentCount);
			var currentAngle:Number=GeometryUtils.degreesToRadians(startDegrees);
			var startX:Number=center.x + Math.cos(currentAngle) * xRadius;
			var startY:Number=center.y - Math.sin(currentAngle) * yRadius;
			var endX:Number;
			var endY:Number;
			var controlX:Number;
			var controlY:Number;
			var angleMid:Number;

			target.moveTo(startX, startY);

			if (segmentCount > 0)
			{
				for (var i:int=0; i < segmentCount; i++)
				{//draw outer circle
					currentAngle+=theta;
					// find the angle halfway between the last angle and the new
					angleMid=currentAngle - (theta / 2);
					controlX=center.x + Math.cos(angleMid) * (xRadius / Math.cos(theta / 2));
					controlY=center.y - Math.sin(angleMid) * (yRadius / Math.cos(theta / 2));
					endX=center.x + Math.cos(currentAngle) * xRadius;
					endY=center.y - Math.sin(currentAngle) * yRadius;
					// draw the arc segment
					target.curveTo(controlX, controlY, endX, endY);
				}
				if (sectorHeight != 0)
				{
					xRadius=xRadius - sectorHeight;
					yRadius=yRadius - sectorHeight;
					
					currentAngle=GeometryUtils.degreesToRadians(startDegrees);
					currentAngle=currentAngle + segmentCount * theta;
					var startInnerX:Number=center.x + Math.cos(currentAngle) * xRadius;
					var startInnerY:Number=center.y - Math.sin(currentAngle) * yRadius;				
					target.lineTo(startInnerX, startInnerY);
					currentAngle=currentAngle + (theta / 2);
					
					for (var j:int=0; j < segmentCount; j++)
					{//draw inner circle
						currentAngle-=theta;
						angleMid=currentAngle - (theta / 2);						
						controlX=center.x + Math.cos(currentAngle) * (xRadius / Math.cos(theta / 2));
						controlY=center.y - Math.sin(currentAngle) * (yRadius / Math.cos(theta / 2));
						endX=center.x + Math.cos(angleMid) * xRadius;
						endY=center.y - Math.sin(angleMid) * yRadius;
						target.curveTo(controlX, controlY, endX, endY);
					}
					target.lineTo(startX, startY);
				}
			}
		}

		public static function drawTriangle(target:Group, center:Rectangle, triangleHeight:Number, triangleWidth:Number, triangleColor:Number=0xFFFFFF):void
		{
			triangleWidth=GeometryUtils.percentualValue(center.x, triangleWidth);
			triangleHeight=GeometryUtils.percentualValue(center.x, triangleHeight);
			var commands:Vector.<int>=new Vector.<int>(5, true);
			commands[0]=1;
			commands[1]=2;
			commands[2]=2;
			commands[3]=2;
			commands[4]=2;
			var coord:Vector.<Number>=new Vector.<Number>(8, true);
			coord[0]=center.x; //x
			coord[1]=center.y - triangleHeight; //y 
			coord[2]=center.x + triangleWidth; //x
			coord[3]=center.y; //y
			coord[4]=center.x - triangleWidth; //x
			coord[5]=center.y; //y
			coord[6]=center.x; //x
			coord[7]=center.y - triangleHeight; //y
			target.graphics.beginFill(triangleColor);
			target.graphics.drawPath(commands, coord);
			target.transformX=center.x;
			target.transformY=center.y;
		}

		public static function set clocksHandsHeight(val:Number):void
		{
			clocksHandsHeight=percentualValue(val, 90);
		}

		public static function percentualValue(val:Number, percent:Number):Number
		{
			val=(val * percent) / 100;
			return val;
		}

		public static function radiansToDegrees(radians:Number):Number
		{
			return radians * 180 / Math.PI;
		}

		public static function degreesToRadians(degrees:Number):Number
		{
			return degrees * Math.PI / 180;
		}
	}
}