% IP Addresses for robots
rosshutdown;

localIp = '100.64.47.163';
gazeboIp = '100.64.46.158';
robotIp = '172.20.10.4';

useRobot = 0;

if useRobot
    setenv('ROS_IP', localIp)
    setenv('ROS_MASTER_URI',strcat('http://', robotIp, ':11311'))
    rosinit(robotIp, 'NodeHost', localIp)
else
    setenv('ROS_IP', localIp)
    setenv('ROS_MASTER_URI',strcat('http://', gazeboIp, ':11311'))
    rosinit(gazeboIp, 'NodeHost', localIp)
end