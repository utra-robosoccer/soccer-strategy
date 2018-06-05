package soccer_msgs;

public interface RobotGoal extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "soccer_msgs/RobotGoal";
  static final java.lang.String _DEFINITION = "Header header\nfloat32[20] trajectories";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  std_msgs.Header getHeader();
  void setHeader(std_msgs.Header value);
  float[] getTrajectories();
  void setTrajectories(float[] value);
}
