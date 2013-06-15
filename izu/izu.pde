import processing.serial.*;
import de.bezier.data.sql.*;  
  
MySQL mx;  
public String user     = DB_USER;
public String pass     = DB_PASSWORD;
public String database = DB_NAME;
public String dbhost   = DB_HOST;

Serial port;

int onoff;

float interval = 0.5;
int lastTime;

void setup () {
  size (10, 10);
  frameRate (10);
  
  mx = new MySQL( this, dbhost, database, user, pass );   
    if( mx.connect() ){  
        // now read it back out  
        mx.query( "select * from izuTB;" );  
          
        while (mx.next()){  
            int n = mx.getInt("id");  
            int s = mx.getInt("onoff");  
            println(n + "   " + s);  
        }  
    }  
    else{  
        // connection failed !  
    }  
    
  //println (Serial.list());
  
  String arduinoPort = Serial.list ()[5];
  port = new Serial (this, arduinoPort, 9600);
  
  lastTime = 0;
}

void draw () {
  port.write (onoff);
  float n = (interval - ((millis () - lastTime) / 1000));
  
  if (n <= 0) {
    fetchData();
    lastTime = millis();
  }
}

void fetchData() {
  if( mx.connect() ){  
    // now read it back out  
    mx.query( "select onoff from izuTB  where id = 1;" );  
    
    while (mx.next()){
      onoff = mx.getInt("onoff");
      println(onoff); 
    }
  } else {
    // connection failed !
  }  
}
