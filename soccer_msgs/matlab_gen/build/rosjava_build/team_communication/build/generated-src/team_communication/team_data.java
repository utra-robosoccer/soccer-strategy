package team_communication;

public interface team_data extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "team_communication/team_data";
  static final java.lang.String _DEFINITION = "team_communication/local_model[5] team_models\n";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  java.util.List<team_communication.local_model> getTeamModels();
  void setTeamModels(java.util.List<team_communication.local_model> value);
}
