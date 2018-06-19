package team_communication;

public interface team_local_model extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "team_communication/team_local_model";
  static final java.lang.String _DEFINITION = "uint8 roboID\nteam_communication/local_model model\n";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  byte getRoboID();
  void setRoboID(byte value);
  team_communication.local_model getModel();
  void setModel(team_communication.local_model value);
}
