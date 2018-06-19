classdef CustomMsgConsts
    %CustomMsgConsts This class stores all message types
    %   The message types are constant properties, which in turn resolve
    %   to the strings of the actual types.
    
    %   Copyright 2014-2018 The MathWorks, Inc.
    
    properties (Constant)
        soccer_msgs_RobotGoal = 'soccer_msgs/RobotGoal'
        soccer_msgs_RobotState = 'soccer_msgs/RobotState'
        team_communication_game_state = 'team_communication/game_state'
        team_communication_game_stateRes = 'team_communication/game_stateRes'
        team_communication_local_model = 'team_communication/local_model'
        team_communication_robotInfo = 'team_communication/robotInfo'
        team_communication_teamInfo = 'team_communication/teamInfo'
        team_communication_team_data = 'team_communication/team_data'
        team_communication_team_local_model = 'team_communication/team_local_model'
    end
    
    methods (Static, Hidden)
        function messageList = getMessageList
            %getMessageList Generate a cell array with all message types.
            %   The list will be sorted alphabetically.
            
            persistent msgList
            if isempty(msgList)
                msgList = cell(9, 1);
                msgList{1} = 'soccer_msgs/RobotGoal';
                msgList{2} = 'soccer_msgs/RobotState';
                msgList{3} = 'team_communication/game_state';
                msgList{4} = 'team_communication/game_stateRes';
                msgList{5} = 'team_communication/local_model';
                msgList{6} = 'team_communication/robotInfo';
                msgList{7} = 'team_communication/teamInfo';
                msgList{8} = 'team_communication/team_data';
                msgList{9} = 'team_communication/team_local_model';
            end
            
            messageList = msgList;
        end
        
        function serviceList = getServiceList
            %getServiceList Generate a cell array with all service types.
            %   The list will be sorted alphabetically.
            
            persistent svcList
            if isempty(svcList)
                svcList = cell(0, 1);
            end
            
            % The message list was already sorted, so don't need to sort
            % again.
            serviceList = svcList;
        end
        
        function actionList = getActionList
            %getActionList Generate a cell array with all action types.
            %   The list will be sorted alphabetically.
            
            persistent actList
            if isempty(actList)
                actList = cell(0, 1);
            end
            
            % The message list was already sorted, so don't need to sort
            % again.
            actionList = actList;
        end
    end
end
