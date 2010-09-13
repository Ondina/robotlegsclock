/*
 * Copyright (c) 2010 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */
package org.robotlegs.examples.robotlegsclock.utils
{
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import spark.components.Group;
	import spark.components.Label;
	import spark.components.RichText;

	public class TextUtils
	{
		public function TextUtils()
		{
		}

		public static function makeLabel(text:String, textPosition:Rectangle, fontSize:Number, fontFamily:String, fontColor:Number):Label
		{
			var someLabel:Label=new Label();
			someLabel.text=text;
			var textSize:Array=TextUtils.getTextSize(text, fontSize, fontFamily);
			someLabel.x=textPosition.x - textSize[0] / 2;
			someLabel.y=textPosition.y - textSize[1] / 2;
			someLabel.setStyle("color", fontColor);
			someLabel.setStyle("fontSize", fontSize);
			someLabel.setStyle("fontWeight", "bold");
			return someLabel;
		}

		public static function drawCurvedText(target:Group, text:String, textSize:Number, textColors:Array, center:Rectangle, radius:Number, angularOffset:Number):void
		{//todo: fontsize & spacing & leading for longer text
			var spacing:Number=7;
			var angleLeading:Number=5;
			var diffX:Number;
			var diffY:Number;
			var angle:Number;
			var curvedText:RichText;
			var textLength:uint=text.length;			
			for (var pos:uint=0; pos < textLength; pos++)
			{
				curvedText=new RichText();
				curvedText.setStyle("fontSize", textSize);
				curvedText.setStyle("fontWeight", "bold");				
				if (pos == 0 || pos == text.length - 1)
					curvedText.setStyle("color", textColors[0]);
				else
					curvedText.setStyle("color", textColors[1]);

				curvedText.x=radius * Math.cos(GeometryUtils.degreesToRadians(pos * spacing + angularOffset)) + center.x;
				curvedText.y=radius * Math.sin(GeometryUtils.degreesToRadians(pos * spacing + angularOffset)) + center.y;
				diffX=center.x - curvedText.x;
				diffY=center.y - curvedText.y;
				angle=Math.atan2(diffY, diffX);

				curvedText.rotation=GeometryUtils.radiansToDegrees(angle) - 90 + angleLeading;
				curvedText.text=text.charAt(pos);
				target.addElement(curvedText);
			}
		}

		public static function getTextSize(text:String, textSize:Number, textFont:String):Array
		{
			var format:TextFormat=new TextFormat();
			format.font=textFont;
			format.size=textSize;
			format.bold=true;
			var txtField:TextField=new TextField();
			txtField.autoSize=TextFieldAutoSize.LEFT;
			txtField.defaultTextFormat=format;
			txtField.text=text;
			return [txtField.textWidth, txtField.textHeight];
		}
	}
}