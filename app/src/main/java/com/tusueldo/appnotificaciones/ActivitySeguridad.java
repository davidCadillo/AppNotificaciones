package com.tusueldo.appnotificaciones;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;

import com.tusueldo.appnotificaciones.clases.Curso;

import java.util.ArrayList;

import butterknife.BindView;

public class ActivitySeguridad extends AppCompatActivity {

    @BindView(R.id.textoSeguridad)
    TextView seguridad;
    @BindView(R.id.listView)
    ListView listView;
    ArrayAdapter<Curso> adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_seguridad);
        listView = (ListView) findViewById(R.id.listView);
        adapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, ActivityLogin.cursos);
        listView.setAdapter(adapter);
    }
}
