package team_communication;

public interface teamInfo extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "team_communication/teamInfo";
  static final java.lang.String _DEFINITION = "uint8 teamNum\nuint8 teamColour\nuint8 score\nuint8 penaltyShot\nuint16 singleShots\nuint8 coachSequence\nchar[253] coachMessage\nteam_communication/robotInfo coach\nteam_communication/robotInfo[11] players\n";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  byte getTeamNum();
  void setTeamNum(byte value);
  byte getTeamColour();
  void setTeamColour(byte value);
  byte getScore();
  void setScore(byte value);
  byte getPenaltyShot();
  void setPenaltyShot(byte value);
  short getSingleShots();
  void setSingleShots(short value);
  byte getCoachSequence();
  void setCoachSequence(byte value);
  org.jboss.netty.buffer.ChannelBuffer getCoachMessage();
  void setCoachMessage(org.jboss.netty.buffer.ChannelBuffer value);
  team_communication.robotInfo getCoach();
  void setCoach(team_communication.robotInfo value);
  java.util.List<team_communication.robotInfo> getPlayers();
  void setPlayers(java.util.List<team_communication.robotInfo> value);
}
