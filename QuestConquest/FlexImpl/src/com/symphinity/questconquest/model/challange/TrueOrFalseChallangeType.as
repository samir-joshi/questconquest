package com.symphinity.questconquest.model.challange 
{
	import mx.collections.ArrayList;
	
	/**
	 * ...
	 * @author Samir Joshi
	 */
	
	[Bindable]
	[RemoteClass]	
	public class TrueOrFalseChallangeType extends ChallangeType
	{
		public var answer: Boolean;
		
		public function TrueOrFalseChallangeType() 
		{
			super();
			this.type = "TrueOrFalseChallangeType";
			_data = answer;
		}
		
	}
	
}