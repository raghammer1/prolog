% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Assignment3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|

% Define the clockwise order of the locations
clockwise(off, lab).
clockwise(lab, mr).
clockwise(mr, cs).
clockwise(cs, off).

% Define the counterclockwise order of the locations
counterclockwise(off, cs).
counterclockwise(cs, mr).
counterclockwise(mr, lab).
counterclockwise(lab, off).

% Action to move robot clockwise
action(mc,
       state(RLoc, RHC, SWC, MW, RHM),
       state(RLocNew, RHC, SWC, MW, RHM)) :-
    % Define the clockwise order of the locations
    clockwise(RLoc, RLocNew),
    RLoc \= RLocNew.

action(dm,
       state(RLoc, RHC, SWC, MW, true),
       state(RLoc, RHC, SWC, false, false)) :-
    % Deliver mail if the robot has it
    RLoc = off.

action(dm_office,
       state(RLoc, RHC, SWC, MW, true),
       state(off, RHC, SWC, false, false)) :-
    % Deliver mail if the robot has it and is at the office
    RLoc = off.

action(dm,
       state(RLoc, RHC, SWC, MW, RHM),
       state(RLoc, RHC, SWC, false, false)) :-
    % Deliver mail if the robot has it and is at location off
    RLoc = off,
    RHM = true.

% Action to move robot counterclockwise
action(mcc,
       state(RLoc, RHC, SWC, MW, RHM),
       state(RLocNew, RHC, SWC, MW, RHM)) :-
    % Define the counterclockwise order of the locations
    counterclockwise(RLoc, RLocNew),
    RLoc \= RLocNew.

action(dm,
    state(RLoc, RHC, SWC, MW, RHM),
    state(RLoc, RHC, SWC, MW, false)) :-
% Deliver mail if the robot has it
% write("C"),
    RHM = true,
    RLoc = off.

% Action to pick up coffee
action(puc,
       state(RLoc, false, SWC, MW, RHM),
       state(RLoc, true, SWC, MW, RHM)) :-
    % Sam wants coffee and there is coffee in the coffee shop
    % write("D"),
    SWC = true,
    RLoc = cs.

% Action to deliver coffee
action(dc,
       state(RLoc, true, true, MW, RHM),
       state(RLoc, false, false, MW, RHM)) :-
    % Deliver coffee to Sam who wanted it
    % SWC = true,
    % write("A"),
	RLoc = off.

% Action to pick up mail
action(pum,
       state(RLoc, RHC, SWC, true, false),
       state(RLoc, RHC, SWC, false, true)) :-
    % Robot can pick up mail if there is any
    % write("B"),
    RLoc = mr.

% Action to deliver mail
action(dm,
       state(RLoc, RHC, SWC, MW, true),
       state(RLoc, RHC, SWC, MW, false)) :-
    % Deliver mail if the robot has it
    % write("C"),
    RLoc = off.
action(dm,
       state(RLoc, RHC, SWC, MW, RHM),
       state(RLoc, RHC, SWC, false, false)) :-
    % Deliver mail if the robot has it and is at location off
    % write("E"),
    RLoc = off,
    RHM = true.

% action(dm,
%        state(RLoc, RHC, SWC, MW, RHM),
%        state(RLoc, RHC, SWC, MW, RHM)) :-
%     % Deliver mail if the robot has it
    % write("D"),
%     RLoc = off.
% plan(StartState, FinalState, Plan)

plan(State, State, []).				% To achieve State from State itself, do nothing

plan(State1, GoalState, [Action1 | RestofPlan]) :-
	action(Action1, State1, State2),		% Make first action resulting in State2
	plan(State2, GoalState, RestofPlan). 		% Find rest of plan

% Iterative deepening planner
% Backtracking to "append" generates lists of increasing length
% Forces "plan" to ceate fixed length plans

id_plan(Start, Goal, Plan) :-
    append(Plan, _, _),
    plan(Start, Goal, Plan).

% This test should succeed without the neeed for iterative deepening
test1(Plan) :-
	plan(state(door, corner, floor(middle)), state(_, _, in_basket), Plan).

% This test will hit Prolog's stack size limit and cause an error
% The planer gets caught in infinite recursion 
test2(Plan) :-
	plan(state(door, corner, floor(middle)), state(door, corner1, in_basket), Plan).

% Iterative deeepning allows the planner to find a shortest length plan.
test3(Plan) :-
	id_plan(state(door, corner, floor(middle)), state(door, corner1, in_basket), Plan).

% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% END OF QUESTION 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|

% % % Question 2
% % :- op(500, xfy, <-).

% % % Question 2.1
% % intra_construction(X <- A, X <- B, X <- C, Z1 <- A1, Z1 <- B1) :-
% %     intersection(A, B, I),
% %     I \= [],
% %     gensym(z, Z1),
% %     subtract(A, I, A1),
% %     subtract(B, I, B1),
% %     append(I, [Z1], C).
    
% % % Question 2.2
% % absorption(X <- A, Z <- B, X <- C, Z <- B) :-
% %     intersection(A, B, I),
% %     subset(B, A),
% %     subtract(A, I, A1),
% %     append(A1, [Z], C).

% % % Question 2.3
% % truncation(X <- A, X <- B, X <- C) :-
% %     intersection(A, B, C).

% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% END OF QUESTION 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|

