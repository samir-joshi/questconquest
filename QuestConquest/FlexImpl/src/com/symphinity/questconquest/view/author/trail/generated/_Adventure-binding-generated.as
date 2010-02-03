

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import String;

class BindableProperty
    implements flash.events.IEventDispatcher
{
	/**
	 * generated bindable wrapper for property title (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'title' moved to '_110371416title'
	 */

    [Bindable(event="propertyChange")]
    public function get title():String
    {
        return this._110371416title;
    }

    public function set title(value:String):void
    {
    	var oldValue:Object = this._110371416title;
        if (oldValue !== value)
        {
            this._110371416title = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "title", oldValue, value));
        }
    }

	/**
	 * generated bindable wrapper for property description (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'description' moved to '_1724546052description'
	 */

    [Bindable(event="propertyChange")]
    public function get description():String
    {
        return this._1724546052description;
    }

    public function set description(value:String):void
    {
    	var oldValue:Object = this._1724546052description;
        if (oldValue !== value)
        {
            this._1724546052description = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "description", oldValue, value));
        }
    }

	/**
	 * generated bindable wrapper for property topicSet (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'topicSet' moved to '_957303629topicSet'
	 */

    [Bindable(event="propertyChange")]
    public function get topicSet():ArrayCollection
    {
        return this._957303629topicSet;
    }

    public function set topicSet(value:ArrayCollection):void
    {
    	var oldValue:Object = this._957303629topicSet;
        if (oldValue !== value)
        {
            this._957303629topicSet = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "topicSet", oldValue, value));
        }
    }

	/**
	 * generated bindable wrapper for property factSet (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'factSet' moved to '_1091910058factSet'
	 */

    [Bindable(event="propertyChange")]
    public function get factSet():ArrayCollection
    {
        return this._1091910058factSet;
    }

    public function set factSet(value:ArrayCollection):void
    {
    	var oldValue:Object = this._1091910058factSet;
        if (oldValue !== value)
        {
            this._1091910058factSet = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "factSet", oldValue, value));
        }
    }

	/**
	 * generated bindable wrapper for property challangeSet (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'challangeSet' moved to '_857299963challangeSet'
	 */

    [Bindable(event="propertyChange")]
    public function get challangeSet():ArrayCollection
    {
        return this._857299963challangeSet;
    }

    public function set challangeSet(value:ArrayCollection):void
    {
    	var oldValue:Object = this._857299963challangeSet;
        if (oldValue !== value)
        {
            this._857299963challangeSet = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "challangeSet", oldValue, value));
        }
    }

	/**
	 * generated bindable wrapper for property trailSet (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'trailSet' moved to '_1276038268trailSet'
	 */

    [Bindable(event="propertyChange")]
    public function get trailSet():ArrayCollection
    {
        return this._1276038268trailSet;
    }

    public function set trailSet(value:ArrayCollection):void
    {
    	var oldValue:Object = this._1276038268trailSet;
        if (oldValue !== value)
        {
            this._1276038268trailSet = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "trailSet", oldValue, value));
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
