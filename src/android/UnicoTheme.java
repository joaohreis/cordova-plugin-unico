package com.unico.plugin;

import com.acesso.acessobio_android.onboarding.IAcessoBioTheme;

public class UnicoTheme implements IAcessoBioTheme {

    @Override
    public Object getColorBackground() {
        return "#808080";
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
        return "#0000FF";
    }

    @Override
    public Object getColorTextPopupError() {
        return "#000000";
    }

    @Override
    public Object getColorBackgroundButtonPopupError() {
        return "#0000FF";
    }

    @Override
    public Object getColorTextButtonPopupError() {
        return "#000000";
    }

    @Override
    public Object getColorBackgroundTakePictureButton() {
        return "#0000FF";
    }

    @Override
    public Object getColorIconTakePictureButton() {
        return "#000000";
    }

    @Override
    public Object getColorBackgroundBottomDocument() {
        return "#0000FF";
    }

    @Override
    public Object getColorTextBottomDocument() {
        return "#000000";
    }

    @Override
    public Object getColorSilhouetteSuccess() {
        return "#00FF00";
    }

    @Override
    public Object getColorSilhouetteError() {
        return "#FFA500";
    }

    @Override
    public Object getColorSilhouetteNeutral() {
        return "#FFFFFF";
    }
}
