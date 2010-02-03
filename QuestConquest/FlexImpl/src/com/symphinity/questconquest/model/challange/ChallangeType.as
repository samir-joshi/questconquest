package com.symphinity.questconquest.model.challange
{
	
	/**
	 * ...
	 * @author Samir Joshi
	 */
	
	[Bindable]
	[RemoteClass]	
	public class ChallangeType 
	{
		public  var type: String;
		
		//Locale specific data
		public var displayName: String;		
		public var description: String;
		
		protected var _data: Object;
		
		public function ChallangeType() 
		{
			
		}
		
		public function get data():Object {
			return _data;
		}
		
		public function set data(argData: Object): void {
			_data = argData;
		}
		
		
	}
	
}