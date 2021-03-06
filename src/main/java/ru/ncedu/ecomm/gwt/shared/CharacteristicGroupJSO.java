package ru.ncedu.ecomm.gwt.shared;

import com.google.gwt.core.client.JavaScriptObject;
import com.google.gwt.core.client.JsArray;


public class CharacteristicGroupJSO extends JavaScriptObject {

    protected CharacteristicGroupJSO() {
    }

    public final native double getId() /*-{ return this.characteristicGroupId }-*/;

    public final native String getName() /*-{ return this.characteristicGroupName; }-*/;

    public final native JsArray<CharacteristicJSO> getCharacteristics() /*-{ return this.characteristics; }-*/;
}
