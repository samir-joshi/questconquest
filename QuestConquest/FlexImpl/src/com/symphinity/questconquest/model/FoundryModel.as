package com.symphinity.questconquest.model 
{
	import com.symphinity.questconquest.model.adventure.Adventure;
	import com.symphinity.questconquest.model.challange.Challange;
	import com.symphinity.questconquest.model.world.World;
	import com.symphinity.questconquest.model.trail.Trail;
	import com.symphinity.questconquest.service.repository.ImageRepostitory;
	
	/**
	 * ...
	 * @author Samir Joshi
	 */
	[Bindable]
	public class FoundryModel 
	{
		public var adventure: Adventure;
		public var world: World;
		public var currentChallange: Challange;
		public var currentTrail: Trail;
		public var imageRepository: ImageRepostitory;
		
		public function FoundryModel() 
		{
			setupInitialModel();
		}
		
		public function setupInitialModel() :void {
			adventure = new Adventure();
			world = new World();
			
		}
		
		public function updateCurrentChallange(challange: Challange): void {
			currentChallange = challange;
		}

		public function updateCurrentChallangeFromIndex(index: int): void {
			currentChallange = Challange(adventure.getChallangeSet().getItemAt(index));
		}
		
	}
	
}