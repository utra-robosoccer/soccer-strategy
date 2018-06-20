classdef team_data < robotics.ros.Message
    %team_data MATLAB implementation of team_communication/team_data
    %   This class was automatically generated by
    %   robotics.ros.msg.internal.gen.MessageClassGenerator.
    
    %   Copyright 2014-2018 The MathWorks, Inc.
    
    %#ok<*INUSD>
    
    properties (Constant)
        MessageType = 'team_communication/team_data' % The ROS message type
    end
    
    properties (Constant, Hidden)
        MD5Checksum = 'c1fa23228aa3515a1e2da4ba43db5fcf' % The MD5 Checksum of the message definition
    end
    
    properties (Access = protected)
        JavaMessage % The Java message object
    end
    
    properties (Constant, Access = protected)
        TeamCommunicationLocalModelClass = robotics.ros.msg.internal.MessageFactory.getClassForType('team_communication/local_model') % Dispatch to MATLAB class for message type team_communication/local_model
    end
    
    properties (Dependent)
        TeamModels
    end
    
    properties (Access = protected)
        Cache = struct('TeamModels', []) % The cache for fast data access
    end
    
    properties (Constant, Hidden)
        PropertyList = {'TeamModels'} % List of non-constant message properties
        ROSPropertyList = {'team_models'} % List of non-constant ROS message properties
    end
    
    methods
        function obj = team_data(msg)
            %team_data Construct the message object team_data
            import com.mathworks.toolbox.robotics.ros.message.MessageInfo;
            
            % Support default constructor
            if nargin == 0
                obj.JavaMessage = obj.createNewJavaMessage;
                return;
            end
            
            % Construct appropriate empty array
            if isempty(msg)
                obj = obj.empty(0,1);
                return;
            end
            
            % Make scalar construction fast
            if isscalar(msg)
                % Check for correct input class
                if ~MessageInfo.compareTypes(msg(1), obj.MessageType)
                    error(message('robotics:ros:message:NoTypeMatch', obj.MessageType, ...
                        char(MessageInfo.getType(msg(1))) ));
                end
                obj.JavaMessage = msg(1);
                return;
            end
            
            % Check that this is a vector of scalar messages. Since this
            % is an object array, use arrayfun to verify.
            if ~all(arrayfun(@isscalar, msg))
                error(message('robotics:ros:message:MessageArraySizeError'));
            end
            
            % Check that all messages in the array have the correct type
            if ~all(arrayfun(@(x) MessageInfo.compareTypes(x, obj.MessageType), msg))
                error(message('robotics:ros:message:NoTypeMatchArray', obj.MessageType));
            end
            
            % Construct array of objects if necessary
            objType = class(obj);
            for i = 1:length(msg)
                obj(i,1) = feval(objType, msg(i)); %#ok<AGROW>
            end
        end
        
        function teammodels = get.TeamModels(obj)
            %get.TeamModels Get the value for property TeamModels
            if isempty(obj.Cache.TeamModels)
                javaArray = obj.JavaMessage.getTeamModels;
                array = obj.readJavaArray(javaArray, obj.TeamCommunicationLocalModelClass);
                obj.Cache.TeamModels = feval(obj.TeamCommunicationLocalModelClass, array);
            end
            teammodels = obj.Cache.TeamModels;
        end
        
        function set.TeamModels(obj, teammodels)
            %set.TeamModels Set the value for property TeamModels
            validateattributes(teammodels, {obj.TeamCommunicationLocalModelClass}, {'vector', 'numel', 5}, 'team_data', 'TeamModels');
            
            javaArray = obj.JavaMessage.getTeamModels;
            array = obj.writeJavaArray(teammodels, javaArray, obj.TeamCommunicationLocalModelClass);
            obj.JavaMessage.setTeamModels(array);
            
            % Update cache if necessary
            if ~isempty(obj.Cache.TeamModels)
                obj.Cache.TeamModels = [];
                obj.Cache.TeamModels = obj.TeamModels;
            end
        end
    end
    
    methods (Access = protected)
        function resetCache(obj)
            %resetCache Resets any cached properties
            obj.Cache.TeamModels = [];
        end
        
        function cpObj = copyElement(obj)
            %copyElement Implements deep copy behavior for message
            
            % Call default copy method for shallow copy
            cpObj = copyElement@robotics.ros.Message(obj);
            
            % Clear any existing cached properties
            cpObj.resetCache;
            
            % Create a new Java message object
            cpObj.JavaMessage = obj.createNewJavaMessage;
            
            % Recursively copy compound properties
            cpObj.TeamModels = copy(obj.TeamModels);
        end
        
        function reload(obj, strObj)
            %reload Called by loadobj to assign properties
            TeamModelsCell = arrayfun(@(x) feval([obj.TeamCommunicationLocalModelClass '.loadobj'], x), strObj.TeamModels, 'UniformOutput', false);
            obj.TeamModels = vertcat(TeamModelsCell{:});
        end
    end
    
    methods (Access = ?robotics.ros.Message)
        function strObj = saveobj(obj)
            %saveobj Implements saving of message to MAT file
            
            % Return an empty element if object array is empty
            if isempty(obj)
                strObj = struct.empty;
                return
            end
            
            strObj.TeamModels = arrayfun(@(x) saveobj(x), obj.TeamModels);
        end
    end
    
    methods (Static, Access = {?matlab.unittest.TestCase, ?robotics.ros.Message})
        function obj = loadobj(strObj)
            %loadobj Implements loading of message from MAT file
            
            % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = robotics.ros.custom.msggen.team_communication.team_data.empty(0,1);
                return
            end
            
            % Create an empty message object
            obj = robotics.ros.custom.msggen.team_communication.team_data;
            obj.reload(strObj);
        end
    end
end