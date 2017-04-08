package com.tusueldo.appnotificaciones;

import android.app.ProgressDialog;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.support.v7.widget.helper.ItemTouchHelper;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.TextView;


import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.firebase.iid.FirebaseInstanceId;
import com.google.firebase.messaging.*;
import com.tusueldo.appnotificaciones.clases.CardAdapter;
import com.tusueldo.appnotificaciones.clases.ContractLogin;
import com.tusueldo.appnotificaciones.clases.Curso;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;

public class ActivityDocente extends AppCompatActivity {

    @BindView(R.id.idDocente)
    TextView idDocente;
    @BindView(R.id.nombreDocente)
    TextView nombreDocente;

    private Toolbar toolbar;

    private StringRequest stringRequest;
    private ArrayList<Curso> listaCursos;
    private RecyclerView recyclerView;
    private RecyclerView.LayoutManager layoutManager;
    private RecyclerView.Adapter adapter;
    private String idUsuario;

    public ActivityDocente() {
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_docente);
        FirebaseMessaging.getInstance().subscribeToTopic("test");
        FirebaseInstanceId.getInstance().getToken();
        toolbar = (Toolbar) findViewById(R.id.tool_bar);
        toolbar.setTitle("Horario de clases");
        setSupportActionBar(toolbar);
        getSupportActionBar().setTitle("Horario de clase");
        ButterKnife.bind(this);
        recyclerView = (RecyclerView) findViewById(R.id.recyclerView);
        recyclerView.setHasFixedSize(true);
        layoutManager = new LinearLayoutManager(this);
        recyclerView.setLayoutManager(layoutManager);
        listaCursos = new ArrayList<>();
        Bundle b = this.getIntent().getExtras();
        idUsuario = b.getString("idUsuario").toString();
        idDocente.setText(idUsuario);
        nombreDocente.setText(b.getString("nombreUsuario").toString());
        mostrarCursos();


    }


    public void mostrarCursos() {
        final ProgressDialog loading = ProgressDialog.show(this, "Cargando cursos", "Espere un momento...", false, false);

        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(Request.Method.GET, ContractLogin.URL_GET_DOCENTE + idUsuario, new Response.Listener<JSONObject>() {
            @Override
            public void onResponse(JSONObject response) {
                loading.dismiss();
                parseData(response);
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

            }
        });
        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(jsonObjectRequest);
    }


    private void parseData(JSONObject response) {

        try {
            JSONArray jsonArray = response.getJSONArray("cursosDocente");
            for (int i = 0; i < jsonArray.length(); i++) {
                Curso curso = new Curso();
                JSONObject json = jsonArray.getJSONObject(i);
                curso.setNombreCurso(json.getString("nombreCurso"));
                curso.setAula(json.getString("pabellon") + "-" + json.getString("aula"));
                String dia = json.getString("dia");
                curso.setDia(dia.substring(0, 1).toUpperCase() + dia.substring(1));
                curso.setHora(json.getString("hora"));
                curso.setCiclo(json.getString("anio") + "-" + json.getString("ciclo"));
                curso.setTipoClase(json.getString("tipoClase"));
                listaCursos.add(curso);

            }
            ActivityLogin.cursos.addAll(listaCursos);


        } catch (JSONException e) {
            e.printStackTrace();
        }

        adapter = new CardAdapter(listaCursos, this);
        recyclerView.setAdapter(adapter);

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main_menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {


        switch (item.getItemId()) {

            case R.id.action_user:

                stringRequest = new StringRequest(Request.Method.POST, ContractLogin.URL_SEND_NOTIFICATION, new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        JSONObject jsonObject = null;
                        try {
                            jsonObject = new JSONObject(response);
                            int estado = jsonObject.getInt("success");
                            Log.d("VALOR, ", estado + "");
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
                        Curso c = listaCursos.get(0);
                        String anuncio = "Clase en el " + c.getAula();
                        hashMap.put("mensaje", anuncio);
                        return hashMap;
                    }
                };
                RequestQueue requestQueue = Volley.newRequestQueue(this);
                requestQueue.add(stringRequest);
                return true;
            default:
                return super.onOptionsItemSelected(item);


        }

    }


}
