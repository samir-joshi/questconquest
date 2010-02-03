

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import com.symphinity.questconquest.model.trail.Trail;
import com.symphinity.questconquest.model.challange.Challange;
import com.symphinity.questconquest.model.adventure.Adventure;

class BindableProperty
    implements flash.events.IEventDispatcher
{
	/**
	 * generated bindable wrapper for property adventure (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'adventure' moved to '_694094064adventure'
	 */

    [Bindable(event="propertyChange")]
    public function get adventure():Adventure
    {
        return this._694094064adventure;
    }

    public function set adventure(value:Adventure):void
    {
    	var oldValue:Object = this._694094064adventure;
        if (oldValue !== value)
        {
            this._694094064adventure = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "adventure", oldValue, value));
        }
    }

	/**
	 * generated bindable wrapper for property currentChallange (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'currentChallange' moved to '_1753602706currentChallange'
	 */

    [Bindable(event="propertyChange")]
    public function get currentChallange():Challange
    {
        return this._1753602706currentChallange;
    }

    public function set currentChallange(value:Challange):void
    {
    	var oldValue:Object = this._1753602706currentChallange;
        if (oldValue !== value)
        {
            this._1753602706currentChallange = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "currentChallange", oldValue, value));
        }
    }

	/**
	 * generated bindable wrapper for property currentTrail (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'currentTrail' moved to '_1458685965currentTrail'
	 */

    [Bindable(event="propertyChange")]
    public function get currentTrail():Trail
    {
        return this._1458685965currentTrail;
    }

    public function set currentTrail(value:Trail):void
    {
    	var oldValue:Object = this._1458685965currentTrail;
        if (oldValue !== value)
        {
            this._1458685965currentTrail = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "currentTrail", oldValue, value));
        }
    }


    //    IEventDispatcher implementation
    //
    private var _bindingEventDispatcher:flash.events.EventDispatcher =
        new flash.events.EventDispatcher(flash.events.IEventDispatcher(this));

    public function addEventListener(type:String, listener:Function,
                                     useCapture:Boolean = false,
                                     priority:int = 0,
                                     weakRef:Boolean = false):void
    {
        _bindingEventDispatcher.addEventListener(type, listener, useCapture,
                                                 priority, weakRef);
    }

    public function dispatchEvent(event:flash.events.Event):Boolean
    {
        return _bindingEventDispatcher.dispatchEvent(event);
    }

    public function hasEventListener(type:String):Boolean
    {
        return _bindingEventDispatcher.hasEventListener(type);
    }

    public function removeEventListener(type:String,
                                        listener:Function,
                                        useCapture:Boolean = false):void
    {
        _bindingEventDispatcher.removeEventListener(type, listener, useCapture);
    }

    public function willTrigger(type:String):Boolean
    {
        return _bindingEventDispatcher.willTrigger(type);
    }

}
