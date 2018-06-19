package team_communication;

public interface game_state extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "team_communication/game_state";
  static final java.lang.String _DEFINITION = "char[4] header\nuint16 protocol_version\nuint8 packetNum\nuint8 playersPerTeam\nuint8 gameType\nuint8 state\nuint8 firsthalf\nuint8 kickoffTeam\nuint8 secondaryState\nchar[4] secondaryStateInfo\nuint8 dropInTeam\nuint16 dropInTime\nuint16 secsRemaining\nuint16 secondaryTime\nteam_communication/teamInfo[2] Teams\n";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  org.jboss.netty.buffer.ChannelBuffer getHeader();
  void setHeader(org.jboss.netty.buffer.ChannelBuffer value);
  short getProtocolVersion();
  void setProtocolVersion(short value);
  byte getPacketNum();
  void setPacketNum(byte value);
  byte getPlayersPerTeam();
  void setPlayersPerTeam(byte value);
  byte getGameType();
  void setGameType(byte value);
  byte getState();
  void setState(byte value);
  byte getFirsthalf();
  void setFirsthalf(byte value);
  byte getKickoffTeam();
  void setKickoffTeam(byte value);
  byte getSecondaryState();
  void setSecondaryState(byte value);
  org.jboss.netty.buffer.ChannelBuffer getSecondaryStateInfo();
  void setSecondaryStateInfo(org.jboss.netty.buffer.ChannelBuffer value);
  byte getDropInTeam();
  void setDropInTeam(byte value);
  short getDropInTime();
  void setDropInTime(short value);
  short getSecsRemaining();
  void setSecsRemaining(short value);
  short getSecondaryTime();
  void setSecondaryTime(short value);
  java.util.List<team_communication.teamInfo> getTeams();
  void setTeams(java.util.List<team_communication.teamInfo> value);
}
