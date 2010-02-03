package com.symphinity.questconquest.model.player
{
	import com.symphinity.questconquest.model.adventure.Adventure;
	import com.symphinity.questconquest.model.challange.Challange;
	import com.symphinity.questconquest.model.trail.Trail;
	
	/**
	 * ...
	 * @author Samir Joshi
	 */
	[Bindable]
	public class PlayerModel 
	{
		protected var adventure: Adventure;
		
		protected var currentChallange: Challange;
		protected var currentTrail: Trail;
		
		public var POS_FIRST :int = 0;
		public var POS_PREVIOUS :int = 1;
		public var POS_NEXT :int = 2;
		public var POS_LAST :int = 3;		
		
		
		public function PlayerModel() 
		{
			setupInitialModel();
		}
		
		public function setupInitialModel() :void {
			adventure = new Adventure();
			
		}
		
		public function getCurrentChallange(): Challange {
			return currentChallange;
		}
		
		public function setuCurrentChallange(challange: Challange): void {
			currentChallange = challange;
		}

		public function updateCurrentChallangeFromIndex(index: int): void {
			currentChallange = Challange(adventure.getChallangeSet().getItemAt(index));
		}
		
		
		public function isIndexWithinBounds(index :int): Boolean {
			if (  index >= 0
				&& index < adventure.challangeSet.length )
			{
				return true;
			}
			else {
				return false;
			}
			   
		}
		
		public function moveToNextChallange(): Boolean {

			var currentChallangeIndex: int = adventure.challangeSet.getItemIndex(currentChallange);
			if (currentChallangeIndex == -1) {
				trace("moveToNextChallange() invoked when the Player model is in inconsistent state");
				return false;
			}
			
			if (  isIndexWithinBounds(currentChallangeIndex + 1) ) {
				var challange: Challange = Challange( adventure.challangeSet.getItemAt(currentChallangeIndex + 1)) ;
				if ( challange != null) {
					currentChallange = challange;
					return true;
				}			
			}
			
			return false;
		}

		public function moveToPreviousChallange(): Boolean {

			var currentChallangeIndex: int = adventure.challangeSet.getItemIndex(currentChallange);
			if (currentChallangeIndex == -1) {
				trace("moveToPreviousChallange() invoked when the Player model is in inconsistent state");
				return false;
			}
			
			if ( isIndexWithinBounds( currentChallangeIndex - 1)) {
				var challange: Challange = Challange(adventure.challangeSet.getItemAt(currentChallangeIndex - 1));
				if ( challange != null) {
					currentChallange = challange;
					return true;
				}
			}
			return false;
		}
		
		
	
		public function setAdventure(anAdventure: Adventure): void {
			this.adventure = anAdventure;
			this.currentChallange = Challange( this.adventure.getChallangeSet().getItemAt(0));
		}
		
		public function getAdventure(): Adventure {
			return this.adventure;
		}
		
	}
	
}