package com.symphinity.questconquest.model.topic 
{
	
	/**
	 * ...
	 * @author Samir Joshi
	 */
	[Bindable]
	[RemoteClass]
	public class Topic 
	{
		public var name: String;
		public var description: String;
		
		public function Topic() 
		{
			name = "" ;
			description = "";
		}
		
	}
	
}