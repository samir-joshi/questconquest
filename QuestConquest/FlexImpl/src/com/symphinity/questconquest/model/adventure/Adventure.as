package com.symphinity.questconquest.model.adventure
{
	import mx.collections.ArrayCollection;

	import com.symphinity.questconquest.model.topic.Topic;	
	import com.symphinity.questconquest.model.challange.Challange;
	import com.symphinity.questconquest.model.factoid.Factoid;
	import com.symphinity.questconquest.model.trail.Trail;
	
	/**
	 * ...
	 * @author Samir Joshi
	 */
	[Bindable]
	[RemoteClass]
	public class Adventure 
	{
		public var title : String;
		public var description: String;
		public var topicSet : ArrayCollection;		
		public var factSet : ArrayCollection;
		public var challangeSet : ArrayCollection;
		public var trailSet: ArrayCollection;
		
		
		public function Adventure() 
		{
			topicSet = new ArrayCollection();			
			factSet = new ArrayCollection();
			challangeSet = new ArrayCollection();
			trailSet = new ArrayCollection();
		}



		
		public function addFactoid(factoid:Factoid):void {
			if (factoid == null) {
				trace(" Adventure.addFactoid() - No factoid provided for addition.");
			}else {
				factSet.addItem(factoid);				
			}

		}
		
		public function addChallange(challange: Challange):void {
			if (challange == null) {
				trace(" Adventure.addChallange() - No challange provided for addition.");
			}else {
				challangeSet.addItem(challange);				
			}

		}
		
		public function getChallangeSet() : ArrayCollection {
			return challangeSet;
		}
		
		public function removeChallange(challange: Challange) : Boolean {
			var index:int;
			index = challangeSet.getItemIndex(challange);
			if ( index != -1) {
				challangeSet.removeItemAt(index);
				return true;
			}
			return false;			
		}
		
		public function addTrail(trail: Trail):void {
			if (trail == null) {
				trace(" Null argument to Adventure.addTrail() - No trail provided for addition.");
			}else {
				trailSet.addItem(trail);				
			}

		}
		
		public function getTrailSet() : ArrayCollection {
			return trailSet;
		}
		
		public function removeTrail(trail: Trail) : Boolean {
			var index:int;
			index = trailSet.getItemIndex(trail);
			if ( index != -1) {
				trailSet.removeItemAt(index);
				return true;
			}
			return false;			
		}
		

	}
		
		
}
	
