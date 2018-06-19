package team_communication;

public interface local_model extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "team_communication/local_model";
  static final java.lang.String _DEFINITION = "uint8 x\nuint8 y\nuint8 z\n";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  byte getX();
  void setX(byte value);
  byte getY();
  void setY(byte value);
  byte getZ();
  void setZ(byte value);
}
