package soccer_msgs;

public interface RobotState extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "soccer_msgs/RobotState";
  static final java.lang.String _DEFINITION = "Header header\nfloat32[20] joint_angles";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  std_msgs.Header getHeader();
  void setHeader(std_msgs.Header value);
  float[] getJointAngles();
  void setJointAngles(float[] value);
}
