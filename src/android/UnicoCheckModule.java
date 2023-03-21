package com.unico;

import android.Manifest;
import android.content.pm.PackageManager;
import android.os.Build;
import android.util.Log;
import android.widget.Toast;
import android.app.Activity;
import android.content.Context;
import android.app.LocalActivityManager;
import android.view.Window;

import androidx.annotation.RequiresApi;
import androidx.core.content.ContextCompat;

import com.acesso.acessobio_android.AcessoBioListener;
import com.acesso.acessobio_android.iAcessoBioDocument;
import com.acesso.acessobio_android.iAcessoBioSelfie;
import com.acesso.acessobio_android.onboarding.AcessoBio;
import com.acesso.acessobio_android.onboarding.IAcessoBioBuilder;
import com.acesso.acessobio_android.onboarding.camera.CameraListener;
import com.acesso.acessobio_android.onboarding.camera.UnicoCheckCamera;
import com.acesso.acessobio_android.onboarding.camera.UnicoCheckCameraOpener;
import com.acesso.acessobio_android.onboarding.camera.document.DocumentCameraListener;
import com.acesso.acessobio_android.onboarding.types.DocumentType;
import com.acesso.acessobio_android.services.dto.ErrorBio;
import com.acesso.acessobio_android.services.dto.ResultCamera;

import org.apache.cordova.*;

import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;

import java.io.IOException;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;

import java.util.logging.Logger;

import com.unico.UnicoConfigDefault;

import static androidx.core.app.ActivityCompat.requestPermissions;

public class UnicoCheckModule extends CordovaPlugin implements AcessoBioListener, iAcessoBioSelfie, iAcessoBioDocument {

    //private static ReactApplicationContext reactContext;
    private static Logger logger = Logger.getLogger(UnicoCheckModule.class.getName());
    private static UnicoConfigDefault unicoConfigDefault = new UnicoConfigDefault();
    private static UnicoTheme unicoTheme  = new UnicoTheme();
	public CallbackContext callbackContext;

    private static final String [] permissions = {
		Manifest.permission.CAMERA
	};

    protected static final int REQUEST_CAMERA_PERMISSION = 1;

    public enum CameraMode {
        SMART,
        LIVENESS,
        CNH_FRONT,
        CNH_BACK,
        RG_FRONT,
        RG_BACK,
		OUT_FRONT,
		OUT_BACK
    }

    private IAcessoBioBuilder acessoBioBuilder;
    private UnicoCheckCamera unicoCheckCamera;
	
    private void sendSucess() {

        this.cordova.getThreadPool().execute(new Runnable() {
            public void run() {
                callbackContext.success();
            }
        });

    }
	
	private void sendError(String status) {

        this.cordova.getThreadPool().execute(new Runnable() {
            public void run() {
                callbackContext.error(status);
            }
        });

    }
	
	@Override
    public boolean execute(String action, JSONArray data, CallbackContext callbackContext) throws JSONException {

		Window window = activity.getWindow();
		window.setStatusBarColor(ContextCompat.getColor(activity,Color.parseColor("#951AD6")));
	
		this.callbackContext = callbackContext;
		
		if (!cordova.hasPermission(permissions[0])) 
		{
			cordova.requestPermissions(this, 0, permissions);
		}
		
        if (action.equals("startCameraSmart")) {
			
			callSmartCamera();
			return true;
			
        } else if (action.equals("startCameraLiveness")) {
			
			callLivenessCamera();
			return true;
			
        } else if (action.equals("startCameraCNHFront")) {
			
			callDocumentCNHFrontCamera();
			return true;
			
        } else if (action.equals("startCameraCNHBack")) {
			
			callDocumentCNHBackCamera();
			return true;
			
        } else if (action.equals("startCameraRGFront")) {
			
			callDocumentRGFrontCamera();
			return true;
			
        } else if (action.equals("startCameraRGBack")) {
			
			callDocumentRGBackCamera();
			return true;
			
        } else if (action.equals("startCameraOUTFront")) {
			
			callDocumentOUTFrontCamera();
			return true;
			
        } else if (action.equals("startCameraOUTBack")) {
			
			callDocumentOUTBackCamera();
			return true;
			
        } else {
            
			sendError("4 | " + "Opcao invalida");
			return false;
        }
	
    }
    
    private void callSmartCamera() {
        this.openCamera(CameraMode.SMART);
    }
    
    private void callLivenessCamera() {
        this.openCamera(CameraMode.LIVENESS);
    }
    
    private void callDocumentCNHFrontCamera() {
        this.openCamera(CameraMode.CNH_FRONT);
    }
      
    private void callDocumentCNHBackCamera() {
        this.openCamera(CameraMode.CNH_BACK);
    }
	
	private void callDocumentRGFrontCamera() {
        this.openCamera(CameraMode.RG_FRONT);
    }
    
    private void callDocumentRGBackCamera() {
        this.openCamera(CameraMode.RG_BACK);
    }
	
	private void callDocumentOUTFrontCamera() {
        this.openCamera(CameraMode.OUT_FRONT);
    }
    
    private void callDocumentOUTBackCamera() {
        this.openCamera(CameraMode.OUT_BACK);
    }
    
    private void build(boolean hasSmart) {
        acessoBioBuilder = new AcessoBio(cordova.getActivity(), UnicoCheckModule.this);
        unicoCheckCamera = acessoBioBuilder.setSmartFrame(hasSmart).setAutoCapture(hasSmart).setTheme(unicoTheme).build();
    }

    
    private void openCamera(CameraMode mode) {
        if (cordova.hasPermission(permissions[0])) {
			
            cordova.getActivity().runOnUiThread(new Runnable() {
                @Override
                public void run() {
					
					
                    if (mode == CameraMode.SMART) {
                        build(true);
                        unicoCheckCamera.prepareCamera(unicoConfigDefault, new CameraListener() {
                            @Override
                            public void onCameraReady(UnicoCheckCameraOpener.Camera cameraOpener) {
                                cameraOpener.open(UnicoCheckModule.this);
                            }

                            @Override
                            public void onCameraFailed(String message) {
                                Toast.makeText(cordova.getActivity(), message, Toast.LENGTH_LONG).show();
                            }
                        });
                    } else if (mode == CameraMode.LIVENESS) {
                        build(false);
                        unicoCheckCamera.prepareCamera(unicoConfigDefault, new CameraListener() {
                            @Override
                            public void onCameraReady(UnicoCheckCameraOpener.Camera cameraOpener) {
                                cameraOpener.open(UnicoCheckModule.this);
                            }

                            @Override
                            public void onCameraFailed(String message) {
                                Toast.makeText(cordova.getActivity(), message, Toast.LENGTH_LONG).show();
                            }
                        });
                    } else if (mode == CameraMode.CNH_FRONT) {
                        build(false);
                        unicoCheckCamera.prepareDocumentCamera(unicoConfigDefault, new DocumentCameraListener() {
                            @Override
                            public void onCameraReady(UnicoCheckCameraOpener.Document cameraOpener) {
                                cameraOpener.open(DocumentType.CNH_FRENTE, UnicoCheckModule.this);
                            }

                            @Override
                            public void onCameraFailed(String message) {
                                Toast.makeText(cordova.getActivity(), message, Toast.LENGTH_LONG).show();
                            }
                        });
                    } else if (mode == CameraMode.CNH_BACK){
                        build(false);
                        unicoCheckCamera.prepareDocumentCamera(unicoConfigDefault, new DocumentCameraListener() {
                            @Override
                            public void onCameraReady(UnicoCheckCameraOpener.Document cameraOpener) {
                                cameraOpener.open(DocumentType.CNH_VERSO, UnicoCheckModule.this);
                            }

                            @Override
                            public void onCameraFailed(String message) {
                                Toast.makeText(cordova.getActivity(), message, Toast.LENGTH_LONG).show();
                            }
                        });
                    } else if (mode == CameraMode.RG_FRONT) {
                        build(false);
                        unicoCheckCamera.prepareDocumentCamera(unicoConfigDefault, new DocumentCameraListener() {
                            @Override
                            public void onCameraReady(UnicoCheckCameraOpener.Document cameraOpener) {
                                cameraOpener.open(DocumentType.RG_FRENTE, UnicoCheckModule.this);
                            }

                            @Override
                            public void onCameraFailed(String message) {
                                Toast.makeText(cordova.getActivity(), message, Toast.LENGTH_LONG).show();
                            }
                        });
                    } else if (mode == CameraMode.RG_BACK){
                        build(false);
                        unicoCheckCamera.prepareDocumentCamera(unicoConfigDefault, new DocumentCameraListener() {
                            @Override
                            public void onCameraReady(UnicoCheckCameraOpener.Document cameraOpener) {
                                cameraOpener.open(DocumentType.RG_VERSO, UnicoCheckModule.this);
                            }

                            @Override
                            public void onCameraFailed(String message) {
                                Toast.makeText(cordova.getActivity(), message, Toast.LENGTH_LONG).show();
                            }
                        });
                    } else if (mode == CameraMode.OUT_FRONT || mode == CameraMode.OUT_BACK) {
                        build(false);
                        unicoCheckCamera.prepareDocumentCamera(unicoConfigDefault, new DocumentCameraListener() {
                            @Override
                            public void onCameraReady(UnicoCheckCameraOpener.Document cameraOpener) {
                                cameraOpener.open(DocumentType.NONE, UnicoCheckModule.this);
                            }

                            @Override
                            public void onCameraFailed(String message) {
                                Toast.makeText(cordova.getActivity(), message, Toast.LENGTH_LONG).show();
                            }
                        });
                    }
                }

            });

        }else{
			Toast.makeText(cordova.getActivity(), "É necessário dar acesso a câmera para fazer a captura das imagens.", Toast.LENGTH_LONG).show();
		}
    }

    private void requestPermission(int requestCode) {
        PermissionHelper.requestPermissions(this, requestCode, permissions);
    }

    @Override
    public void onErrorAcessoBio(ErrorBio errorBio) {
        sendError(errorBio.getCode() + " | " + errorBio.getDescription());
    }

    @Override
    public void onUserClosedCameraManually() {
        sendError("4 | " + "Usuário fechou a câmera manualmente");
    }

    @Override
    public void onSystemClosedCameraTimeoutSession() {
        sendError("3 | " + "Timeout de sessão excedido");
    }

    @Override
    public void onSystemChangedTypeCameraTimeoutFaceInference() {
        sendError("2 | " + "Timeout de inferencia inteligente de face excedido.");
    }

    @Override
    public void onSuccessSelfie(ResultCamera result) {
        //sendEvent(reactContext, "onSuccess", result.getBase64()); //base64
        // sendEvent(reactContext, "onSuccess", result.getEncrypted()); //JWT
		
		HashMap status = new HashMap();
        status.put("data64",result.getBase64());
		status.put("jwt",result.getEncrypted());

        JSONObject obj = new JSONObject(status);
        PluginResult res = new PluginResult(PluginResult.Status.OK, obj);
        callbackContext.sendPluginResult(res);
    }

    @Override
    public void onErrorSelfie(ErrorBio errorBio) {
        sendError("1 | " + errorBio.getDescription());
    }

    @Override
    public void onSuccessDocument(ResultCamera result) {
        //sendEvent(reactContext, "onSuccess", result.getBase64()); //base64
        // sendEvent(reactContext, "onSuccess", resultCamera.getEncrypted()); //JWT
		
		HashMap status_doc = new HashMap();
        status_doc.put("data64",result.getBase64());
		status_doc.put("jwt",result.getEncrypted());

        JSONObject obj = new JSONObject(status_doc);
        PluginResult res = new PluginResult(PluginResult.Status.OK, obj);
        callbackContext.sendPluginResult(res);
    }

    @Override
    public void onErrorDocument(String s) {
        sendError("0 | " + s);
    }


}
