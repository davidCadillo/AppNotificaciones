package com.tusueldo.appnotificaciones;

import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.tusueldo.appnotificaciones.clases.ContractLogin;
import com.tusueldo.appnotificaciones.clases.Curso;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;


public class ActivityLogin extends AppCompatActivity {

    public static ArrayList<Curso> cursos = new ArrayList<>();
    private Toolbar toolbar;
    private static final String TAG = "ActivityLogin";
    private RequestQueue requestQueue;
    private StringRequest stringRequest;
    @BindView(R.id.usuario)
    EditText usuario;
    @BindView(R.id.contrasenia)
    EditText contrasenia;
    @BindView(R.id.botonIngresar)
    Button botonIngresar;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        ButterKnife.bind(this);
        requestQueue = Volley.newRequestQueue(this);


    }


    @OnClick(R.id.botonIngresar)
    void ingresar() {
        if (!validarLogin()) {
            return;
        }

        stringRequest = new StringRequest(Request.Method.POST, ContractLogin.URL_CHECK_USER, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {

                try {
                    JSONObject jsonObject = new JSONObject(response);
                    int estado = jsonObject.getInt("estado");
                    int tipoUsuario = jsonObject.getInt("tipoUsuario");


                    if (estado == ContractLogin.OK) {
                        if (tipoUsuario == ContractLogin.DOCENTE) {
                            String nombreUsuario = jsonObject.getString("nombreUsuario");
                            Intent startDocente = new Intent(getApplicationContext(), ActivityDocente.class);
                            Bundle bundle = new Bundle();
                            bundle.putString("idUsuario", usuario.getText().toString());
                            bundle.putString("nombreUsuario", nombreUsuario);
                            startDocente.putExtras(bundle);
                            startActivity(startDocente);
                        } else if (tipoUsuario == ContractLogin.SEGURIDAD || tipoUsuario == ContractLogin.TECNICO) {
                            Intent startSeguridad = new Intent(getApplicationContext(), ActivitySeguridad.class);
                            String nombreUsuario = jsonObject.getString("nombreUsuario");
                            Bundle bundle = new Bundle();
                            bundle.putString("idUsuario", usuario.getText().toString());
                            bundle.putString("nombreUsuario", nombreUsuario);
                            startActivity(startSeguridad);
                        }
                    } else if (estado == ContractLogin.ERROR) {

                        createSimpleDialog().show();
                    }

                } catch (JSONException e) {
                    e.printStackTrace();
                }


            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

            }
        }) {
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> hashMap = new HashMap<String, String>();
                hashMap.put("idUsuario", usuario.getText().toString());
                hashMap.put("password", contrasenia.getText().toString());
                return hashMap;
            }
        };
        requestQueue.add(stringRequest);

    }

    @Override
    public void onBackPressed() {
        moveTaskToBack(true);
    }

    private boolean validarLogin() {

        boolean valid = true;
        String usuario = this.usuario.getText().toString();
        String contrasenia = this.contrasenia.getText().toString();

        if (usuario.isEmpty()) {
            this.usuario.setError("Usuario no válido");
            valid = false;
        } else if (usuario.length() != 9) {
            this.usuario.setError("Usuario no tiene 9 dígitos");
            valid = false;
        } else {
            this.usuario.setError(null);
        }

        if (contrasenia.isEmpty()) {
            this.contrasenia.setError("No ha ingresado su contraseña");
            valid = false;
        } else

        {
            this.contrasenia.setError(null);
        }

        return valid;
    }

    public void onLoginSuccess() {
        botonIngresar.setEnabled(true);
        finish();
    }

    public void onLoginFailed() {
        Toast.makeText(getBaseContext(), "No se pudo iniciar", Toast.LENGTH_LONG).show();
        botonIngresar.setEnabled(true);
    }


    public AlertDialog createSimpleDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);

        builder.setTitle("Error")
                .setMessage("Combinación de usario/contraseña inválida")
                .setPositiveButton("OK",
                        new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {

                            }
                        });

        return builder.create();
    }


}
