package com.unico.plugin;

import com.acesso.acessobio_android.onboarding.AcessoBioConfigDataSource;
import androidx.annotation.NonNull;

public class UnicoConfigDefault implements AcessoBioConfigDataSource {
    @NonNull
    @Override
    public String getProjectNumber() {
        return "480761954839809349276448";
    }
    
    @NonNull
    @Override
    public String getProjectId() {
        return "Bene.com.vc";
    }
    
    @NonNull
    @Override
    public String getMobileSdkAppId() {
        return "1:320230:android";
    }
    
    @NonNull
    @Override
    public String getBundleIdentifier() {
        return "vc.com.bene.app";
    }
    
    @NonNull
    @Override
    public String getHostInfo() {
        return "nRMqSJJeWMZ0K4n9Dxs/Zhb5RslAxes+pmH0gJgmVtZImMYBRmw3bx3E0ehCDJnY";
    }
    
    @NonNull
    @Override
    public String getHostKey() {
        return "r930Imj0FlHBf/Y8DGRIIYIxhU5SYVm9+nG+kgCNmKGmwmyWhRVuI9vbBHnf6Jfm";
    }
}
