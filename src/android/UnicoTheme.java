package com.unico.plugin;

import com.acesso.acessobio_android.onboarding.IAcessoBioTheme;

public class UnicoTheme implements IAcessoBioTheme {

    @Override
    public Object getColorBackground() {
        return "#FFFFFF";
    }

    @Override
    public Object getColorBoxMessage() {
        return "#FFFFFF";
    }

    @Override
    public Object getColorTextMessage() {
        return "#000000";
    }

    @Override
    public Object getColorBackgroundPopupError() {
        return "#951AD6";
    }

    @Override
    public Object getColorTextPopupError() {
        return "#000000";
    }

    @Override
    public Object getColorBackgroundButtonPopupError() {
        return "#951AD6";
    }

    @Override
    public Object getColorTextButtonPopupError() {
        return "#000000";
    }

    @Override
    public Object getColorBackgroundTakePictureButton() {
        return "#951AD6";
    }

    @Override
    public Object getColorIconTakePictureButton() {
        return "#FFFFFF";
    }

    @Override
    public Object getColorBackgroundBottomDocument() {
        return "#951AD6";
    }

    @Override
    public Object getColorTextBottomDocument() {
        return "#000000";
    }

    @Override
    public Object getColorSilhouetteSuccess() {
        return "#CECECE";
    }

    @Override
    public Object getColorSilhouetteError() {
        return "#FF0000";
    }

    @Override
    public Object getColorSilhouetteNeutral() {
        return "#FFFFFF";
    }
}
