package global;

public class Constants {

    /* Constants for Debug */
    public static final boolean DEBUG=true;

    /** Constants for db connection */
    public static final String DB_USER_NAME = "root";
    public static final String DB_PASSWORD  = "root";
    public static final String DB_CONNECTION_STRING = "jdbc:mysql://localhost:8000/Kozel100?user="+DB_USER_NAME+"&password="+DB_PASSWORD;

    /* Constants for log files*/
    //public final static String LOG_DIR = "/home/pi/log";
    public static final String LOG_DIR = "/Volumes/Dati/Desktop/";
    public static final String FRONTEND_ERROR_LOG_FILE = LOG_DIR + "frontenderror.log";
    public static final String FATAL_LOG_FILE = LOG_DIR + "fatalerror.log";
    public static final String GENERAL_LOG_FILE = LOG_DIR + "generalerror.log";
    public static final String GENERAL_EXCEPTION_LOG_FILE = LOG_DIR + "generalexception.log";
    public static final String WARNING_LOG_FILE = LOG_DIR + "warning.log";
    public static final String DATABASE_SERVICE_LOG_FILE = LOG_DIR + "databaseservice.log";

}
