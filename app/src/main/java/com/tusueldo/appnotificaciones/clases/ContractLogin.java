package com.tusueldo.appnotificaciones.clases;

/**
 * Created by David on 27/11/2016.
 */

public final class ContractLogin {

    public static final String URL_CHECK_USER = "http://app.tusueldo.com/comprobarUsuario.php";
    public static final String URL_SEND_NOTIFICATION = "http://app.tusueldo.com/push_notification.php";
    public static final String URL_GET_DOCENTE = "http://app.tusueldo.com/obtenerDocente.php?idUsuario=";

    public static final int OK = 1;
    public static final int ERROR = 2;
    public static final int DOCENTE = 1;
    public static final int SEGURIDAD = 2;
    public static final int TECNICO = 3;


}
