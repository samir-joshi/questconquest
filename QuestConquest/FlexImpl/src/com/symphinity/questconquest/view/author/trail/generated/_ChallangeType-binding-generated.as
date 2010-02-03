

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import String;
import Object;

class BindableProperty
    implements flash.events.IEventDispatcher
{
	/**
	 * generated bindable wrapper for property type (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'type' moved to '_3575610type'
	 */

    [Bindable(event="propertyChange")]
    public function get type():String
    {
        return this._3575610type;
    }

    public function set type(value:String):void
    {
    	var oldValue:Object = this._3575610type;
        if (oldValue !== value)
        {
            this._3575610type = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "type", oldValue, value));
        }
    }

	/**
	 * generated bindable wrapper for property displayName (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'displayName' moved to '_1714148973displayName'
	 */

    [Bindable(event="propertyChange")]
    public function get displayName():String
    {
        return this._1714148973displayName;
    }

    public function set displayName(value:String):void
    {
    	var oldValue:Object = this._1714148973displayName;
        if (oldValue !== value)
        {
            this._1714148973displayName = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "displayName", oldValue, value));
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
	 * generated bindable wrapper for property data (public)
	 * - generated setter
	 * - original getter left as-is
	 * - original public setter 'data' moved to '_3076010data'
	 */

    [Bindable(event="propertyChange")]
    public function set data(value:Object):void
    {
    	var oldValue:Object = this.data;
        if (oldValue !== value)
        {
            this._3076010data = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "data", oldValue, value));
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
