package com.example.plugin;

import com.acesso.acessobio_android.onboarding.AcessoBioConfigDataSource;
import androidx.annotation.NonNull;

public class UnicoConfigDefault implements AcessoBioConfigDataSource {
    @NonNull
    @Override
    public String getProjectNumber() {
        return "";
    }
    
    @NonNull
    @Override
    public String getProjectId() {
        return "";
    }
    
    @NonNull
    @Override
    public String getMobileSdkAppId() {
        return "";
    }
    
    @NonNull
    @Override
    public String getBundleIdentifier() {
        return "";
    }
    
    @NonNull
    @Override
    public String getHostInfo() {
        return "";
    }
    
    @NonNull
    @Override
    public String getHostKey() {
        return "";
    }
}
