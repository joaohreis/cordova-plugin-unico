package com.unico.plugin;

import android.Manifest;
import android.content.pm.PackageManager;
import android.os.Build;
import android.util.Log;
import android.widget.Toast;
import android.app.Activity;
import android.content.Context;
import android.app.LocalActivityManager;

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

import com.unico.plugin.UnicoConfigDefault;

import static androidx.core.app.ActivityCompat.requestPermissions;

public class UnicoCheckModule extends CordovaPlugin implements AcessoBioListener, iAcessoBioSelfie, iAcessoBioDocument {

    //private static ReactApplicationContext reactContext;
    private static Logger logger = Logger.getLogger(UnicoCheckModule.class.getName());
    private static UnicoConfigDefault unicoConfigDefault = new UnicoConfigDefault();
    private static UnicoTheme unicoTheme  = new UnicoTheme();
	private CallbackContext callbackContext;

    protected final static String[] permissions = { Manifest.permission.CAMERA };

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
	
    /*
    private void show(final CallbackContext callbackContext) {
        this.cordova.getActivity().runOnUiThread(new Runnable() {
            @Override
            public void run() {
                getStatus(callbackContext);
            }
        });
    }*/
	
	@Override
    public boolean execute(String action, JSONArray data, CallbackContext callbackContext) throws JSONException {

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
            
			callbackContext.error("TESTE INICIAL FALHOU");
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
        if (hasPermission()) {

            cordova.getActivity().runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    if (mode == CameraMode.SMART) {
                        build(true);
                        unicoCheckCamera.prepareCamera(unicoConfigDefault, new CameraListener() {

                        /*
                           Para gerar o arquivo JSON é necessário criar uma API key. Siga os passos abaixo:
                            - Acesse o portal do cliente da unico com suas credenciais;
                            - Navegue em Configurações > Integração > API Key;
                            - Crie ou edite uma nova API Key;
                            - Marque o campo "Utiliza liveness ativo" como SIM caso queira habilitar a câmera Prova de Vidas ou NÃO caso queira utilizar a Câmera Normal ou Inteligente;
                            - Marque o campo "Utiliza autenticação segura na SDK" como SIM;
                            - Expanda a seção SDK iOS, adicione o nome de sua aplicação iOS e o Bundle ID;
                            - Salve as alterações.
                            - Neste momento, retornará para a página de API Key e ao lado da API Key desejada, pressione o botão de download do Bundle;
                            - Selecione a opção iOS;
                            - Clique em "Gerar";
                            Atenção: Uma nova aba será aberta contendo informações do projeto em formato JSON.
                            Caso a nova aba não abra, por favor, verifique se o seu navegador está bloqueando os popups.
                            - Salve o conteúdo desta nova aba em um novo arquivo JSON;
                            - Adicione o arquivo salvo na pasta assets do seu projeto android"
                        */

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
                    } else if (mode == CameraMode.OUT_FRONT) {
                        build(false);
                        unicoCheckCamera.prepareDocumentCamera(unicoConfigDefault, new DocumentCameraListener() {
                            @Override
                            public void onCameraReady(UnicoCheckCameraOpener.Document cameraOpener) {
                                //cameraOpener.open(DocumentType.None, UnicoCheckModule.this);
                            }

                            @Override
                            public void onCameraFailed(String message) {
                                Toast.makeText(cordova.getActivity(), message, Toast.LENGTH_LONG).show();
                            }
                        });
                    } else if (mode == CameraMode.OUT_BACK){
                        build(false);
                        unicoCheckCamera.prepareDocumentCamera(unicoConfigDefault, new DocumentCameraListener() {
                            @Override
                            public void onCameraReady(UnicoCheckCameraOpener.Document cameraOpener) {
                                //cameraOpener.open(DocumentType.None, UnicoCheckModule.this);
                            }

                            @Override
                            public void onCameraFailed(String message) {
                                Toast.makeText(cordova.getActivity(), message, Toast.LENGTH_LONG).show();
                            }
                        });
                    }
                }

            });

        }
    }

    
    public boolean hasPermission() {
        for(String p : permissions)
        {
            if(!PermissionHelper.hasPermission(this, p))
            {
                return false;
            }
        }
        return true;
    }

    private void requestPermission(int requestCode) {
        PermissionHelper.requestPermissions(this, requestCode, permissions);
    }


    @Override
    public void onErrorAcessoBio(ErrorBio errorBio) {
        callbackContext.error(errorBio.getDescription());
    }

    @Override
    public void onUserClosedCameraManually() {
        callbackContext.error("Usuário fechou a câmera manualmente");
    }

    @Override
    public void onSystemClosedCameraTimeoutSession() {
        callbackContext.error("Timeout de sessão excedido");
    }

    @Override
    public void onSystemChangedTypeCameraTimeoutFaceInference() {
        callbackContext.error("Timeout de inferencia inteligente de face excedido.");
    }

    @Override
    public void onSuccessSelfie(ResultCamera resultCamera) {
        //sendEvent(reactContext, "onSuccess", resultCamera.getBase64()); //base64
        // sendEvent(reactContext, "onSuccess", resultCamera.getEncrypted()); //JWT
        // sendEvent(reactContext, "onSuccess", "Selfie capturada com sucesso");
		//callbackContext.sendPluginResult(resultCamera.getBase64());
		
		HashMap status = new HashMap();
        status.put("data64",resultCamera.getBase64());

        JSONObject obj = new JSONObject(status);
        PluginResult result = new PluginResult(PluginResult.Status.OK, obj);
        callbackContext.sendPluginResult(result);
    }

    @Override
    public void onErrorSelfie(ErrorBio errorBio) {
        callbackContext.error(errorBio.getDescription());
    }

    @Override
    public void onSuccessDocument(ResultCamera result) {
        //sendEvent(reactContext, "onSuccess", result.getBase64()); //base64
        // sendEvent(reactContext, "onSuccess", resultCamera.getEncrypted()); //JWT
        // sendEvent(reactContext, "onSuccess", "Documento capturado com sucesso");
		//callbackContext.sendPluginResult(result.getBase64());
		
		HashMap status_doc = new HashMap();
        status_doc.put("data64",result.getBase64());

        JSONObject obj = new JSONObject(status_doc);
        PluginResult res = new PluginResult(PluginResult.Status.OK, obj);
        callbackContext.sendPluginResult(res);
    }

    @Override
    public void onErrorDocument(String s) {
        callbackContext.error(s);
    }


}
