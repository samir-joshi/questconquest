package com.symphinity.questconquest.model.challange
{
	import com.symphinity.questconquest.model.topic.Topic;
	
	/**
	 * ...
	 * @author Samir Joshi
	 */
	[Bindable]
	[RemoteClass]	
	 public class Challange 
	{
		public var topic: String;
		public var newTopic: Topic;		
		public var text: String;

		public var imageFile: String;
		public var audioFile: String;
		public var videoFile: String;
		
		public var challangeType: ChallangeType;
		
		public function Challange() 
		{
			
		}
		
	}
	
}