

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import String;
import com.symphinity.questconquest.model.challange.ChallangeType;

class BindableProperty
    implements flash.events.IEventDispatcher
{
	/**
	 * generated bindable wrapper for property topic (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'topic' moved to '_110546223topic'
	 */

    [Bindable(event="propertyChange")]
    public function get topic():String
    {
        return this._110546223topic;
    }

    public function set topic(value:String):void
    {
    	var oldValue:Object = this._110546223topic;
        if (oldValue !== value)
        {
            this._110546223topic = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "topic", oldValue, value));
        }
    }

	/**
	 * generated bindable wrapper for property newTopic (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'newTopic' moved to '_1367029615newTopic'
	 */

    [Bindable(event="propertyChange")]
    public function get newTopic():Topic
    {
        return this._1367029615newTopic;
    }

    public function set newTopic(value:Topic):void
    {
    	var oldValue:Object = this._1367029615newTopic;
        if (oldValue !== value)
        {
            this._1367029615newTopic = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "newTopic", oldValue, value));
        }
    }

	/**
	 * generated bindable wrapper for property text (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'text' moved to '_3556653text'
	 */

    [Bindable(event="propertyChange")]
    public function get text():String
    {
        return this._3556653text;
    }

    public function set text(value:String):void
    {
    	var oldValue:Object = this._3556653text;
        if (oldValue !== value)
        {
            this._3556653text = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "text", oldValue, value));
        }
    }

	/**
	 * generated bindable wrapper for property imageFile (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'imageFile' moved to '_878580361imageFile'
	 */

    [Bindable(event="propertyChange")]
    public function get imageFile():String
    {
        return this._878580361imageFile;
    }

    public function set imageFile(value:String):void
    {
    	var oldValue:Object = this._878580361imageFile;
        if (oldValue !== value)
        {
            this._878580361imageFile = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "imageFile", oldValue, value));
        }
    }

	/**
	 * generated bindable wrapper for property audioFile (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'audioFile' moved to '_187771506audioFile'
	 */

    [Bindable(event="propertyChange")]
    public function get audioFile():String
    {
        return this._187771506audioFile;
    }

    public function set audioFile(value:String):void
    {
    	var oldValue:Object = this._187771506audioFile;
        if (oldValue !== value)
        {
            this._187771506audioFile = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "audioFile", oldValue, value));
        }
    }

	/**
	 * generated bindable wrapper for property videoFile (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'videoFile' moved to '_1332529303videoFile'
	 */

    [Bindable(event="propertyChange")]
    public function get videoFile():String
    {
        return this._1332529303videoFile;
    }

    public function set videoFile(value:String):void
    {
    	var oldValue:Object = this._1332529303videoFile;
        if (oldValue !== value)
        {
            this._1332529303videoFile = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "videoFile", oldValue, value));
        }
    }

	/**
	 * generated bindable wrapper for property challangeType (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'challangeType' moved to '_806544065challangeType'
	 */

    [Bindable(event="propertyChange")]
    public function get challangeType():ChallangeType
    {
        return this._806544065challangeType;
    }

    public function set challangeType(value:ChallangeType):void
    {
    	var oldValue:Object = this._806544065challangeType;
        if (oldValue !== value)
        {
            this._806544065challangeType = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "challangeType", oldValue, value));
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
