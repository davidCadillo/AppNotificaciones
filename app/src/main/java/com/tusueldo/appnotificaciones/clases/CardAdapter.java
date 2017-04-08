package com.tusueldo.appnotificaciones.clases;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.tusueldo.appnotificaciones.R;

import java.util.List;

import butterknife.BindView;

/**
 * Created by David on 28/11/2016.
 */

public class CardAdapter extends RecyclerView.Adapter<CardAdapter.ViewHolder> {

    private List<Curso> listaCursos;
    private Context context;

    public CardAdapter(List<Curso> listaCursos, Context context) {
        super();
        this.listaCursos = listaCursos;
        this.context = context;
    }

    @Override
    public CardAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.list_curso, parent, false);
        ViewHolder viewHolder = new ViewHolder(v);
        return viewHolder;
    }

    @Override
    public void onBindViewHolder(CardAdapter.ViewHolder holder, int position) {

        Curso curso = listaCursos.get(position);
        holder.nombreCurso.setText(curso.getNombreCurso());
        holder.aula.setText(curso.getAula());
        holder.ciclo.setText(curso.getCiclo());
        holder.dia.setText(curso.getDia());
        holder.hora.setText(curso.getHora());
        holder.tipoClase.setText(curso.getTipoClase());

    }

    @Override
    public int getItemCount() {
        return listaCursos.size();
    }

    class ViewHolder extends RecyclerView.ViewHolder {


        private TextView tipoClase;
        private TextView nombreCurso;
        private TextView aula;
        private TextView ciclo;
        private TextView dia;
        private TextView hora;

        public ViewHolder(View itemView) {
            super(itemView);
            nombreCurso = (TextView) itemView.findViewById(R.id.nombreCurso);
            aula = (TextView) itemView.findViewById(R.id.aula);
            ciclo = (TextView) itemView.findViewById(R.id.ciclo);
            dia = (TextView) itemView.findViewById(R.id.dia);
            hora = (TextView) itemView.findViewById(R.id.hora);
            tipoClase = (TextView) itemView.findViewById(R.id.tipoClase);
        }
    }


}
