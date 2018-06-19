package team_communication;

public interface robotInfo extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "team_communication/robotInfo";
  static final java.lang.String _DEFINITION = "uint8 penalty\nuint8 secsTillUnpenalised\nuint8 yellowCardCount\nuint8 redCardCount\n";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  byte getPenalty();
  void setPenalty(byte value);
  byte getSecsTillUnpenalised();
  void setSecsTillUnpenalised(byte value);
  byte getYellowCardCount();
  void setYellowCardCount(byte value);
  byte getRedCardCount();
  void setRedCardCount(byte value);
}
