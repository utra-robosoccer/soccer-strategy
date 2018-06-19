package team_communication;

public interface game_stateRes extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "team_communication/game_stateRes";
  static final java.lang.String _DEFINITION = "char[4] header\nuint8 protocol_version\nuint8 team\nuint8 player\nuint8 message\n";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  org.jboss.netty.buffer.ChannelBuffer getHeader();
  void setHeader(org.jboss.netty.buffer.ChannelBuffer value);
  byte getProtocolVersion();
  void setProtocolVersion(byte value);
  byte getTeam();
  void setTeam(byte value);
  byte getPlayer();
  void setPlayer(byte value);
  byte getMessage();
  void setMessage(byte value);
}
