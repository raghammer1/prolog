% State of the robot's world = state(RobotLocation, BasketLocation, RubbishLocation)
% action(Action, State, NewState): Action in State produces NewState
% We assume robot never drops rubbish on floor and never pushes rubbish around

action( pickup,						% Pick up rubbish from floor
	state(Pos1, Pos2, floor(Pos1)),			% Before action, robot and rubbish both at Pos1
	state(Pos1, Pos2, held)).			% After action, rubbush held by robot

action( drop,						% Drop rubbish into basket
	state(Pos, Pos, held),				% Before action, robot and basket both at Pos
	state(Pos, Pos, in_basket)).			% After action, rubbish in basket

action( push(Pos, NewPos),				% Push basket from Pos to NewPos
	state(Pos, Pos, Loc),				% Before action, robot and basket both at Pos
	state(NewPos, NewPos, Loc)).			% After action, robot and basket at NewPos

action( go(Pos1, NewPos1),				% Go from Pos1 to NewPos1
	state(Pos1, Pos2, Loc),				% Before action, robot at Pos1
	state(NewPos1, Pos2, Loc)).			% After action, robot at Pos2

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







  % % % State of the robot's world = state(RLoc, RHC, SWC, MW, RHM)
% % % action(Action, State, NewState): Action in State produces NewState

% % % mc - move clockwise
% % action(mc, state(lab, false, SWC, MW, RHM), state(mr, false, SWC, MW, RHM)).
% % action(mc, state(mr, false, SWC, MW, RHM), state(cs, false, SWC, MW, RHM)).
% % action(mc, state(cs, false, SWC, MW, RHM), state(off, false, SWC, MW, RHM)).
% % action(mc, state(off, false, SWC, MW, RHM), state(lab, false, SWC, MW, RHM)).

% % % mcc - move counterclockwise
% % action(mcc, state(lab, false, SWC, MW, RHM), state(off, false, SWC, MW, RHM)).
% % action(mcc, state(off, false, SWC, MW, RHM), state(cs, false, SWC, MW, RHM)).
% % action(mcc, state(cs, false, SWC, MW, RHM), state(mr, false, SWC, MW, RHM)).
% % action(mcc, state(mr, false, SWC, MW, RHM), state(lab, false, SWC, MW, RHM)).

% % % puc - pickup coffee
% % action(puc, state(cs, false, true, MW, RHM), state(cs, true, false, MW, RHM)).

% % % dc - deliver coffee
% % action(dc, state(Loc, true, false, MW, RHM), state(Loc, false, false, MW, RHM)).

% % % pum - pickup mail
% % action(pum, state(Loc, RHC, SWC, true, false), state(Loc, RHC, SWC, false, true)).

% % % dm - deliver mail
% % action(dm, state(Loc, RHC, SWC, false, true), state(Loc, RHC, SWC, false, false)).

% % % mc and mcc actions to handle wrapping around the rooms
% % action(mc, state(lab, false, SWC, MW, RHM), state(corridor, false, SWC, MW, RHM)).
% % action(mcc, state(lab, false, SWC, MW, RHM), state(corridor, false, SWC, MW, RHM)).
% % action(mc, state(corridor, false, SWC, MW, RHM), state(office, false, SWC, MW, RHM)).
% % action(mcc, state(corridor, false, SWC, MW, RHM), state(office, false, SWC, MW, RHM)).
% % action(mc, state(office, false, SWC, MW, RHM), state(kitchen, false, SWC, MW, RHM)).
% % action(mcc, state(office, false, SWC, MW, RHM), state(kitchen, false, SWC, MW, RHM)).
% % action(mc, state(kitchen, false, SWC, MW, RHM), state(lab, false, SWC, MW, RHM)).
% % action(mcc, state(kitchen, false, SWC, MW, RHM), state(lab, false, SWC, MW, RHM)).

% % % plan(StartState, FinalState, Plan)

% % plan(State, State, []).				% To achieve State from State itself, do nothing

% % plan(State1, GoalState, [Action1 | RestofPlan]) :-
% % 	action(Action1, State1, State2),		% Make first action resulting in State2
% % 	plan(State2, GoalState, RestofPlan). 		% Find rest of plan

% % % Iterative deepening planner
% % % Backtracking to "append" generates lists of increasing length
% % % Forces "plan" to ceate fixed length plans

% % id_plan(Start, Goal, Plan) :-
% %     append(Plan, _, _),
% %     plan(Start, Goal, Plan).

% % % This test should succeed without the neeed for iterative deepening
% % test1(Plan) :-
% % 	plan(state(door, corner, floor(middle)), state(_, _, in_basket), Plan).

% % % This test will hit Prolog's stack size limit and cause an error
% % % The planer gets caught in infinite recursion 
% % test2(Plan) :-
% % 	plan(state(door, corner, floor(middle)), state(door, corner1, in_basket), Plan).

% % % Iterative deeepning allows the planner to find a shortest length plan.
% % test3(Plan) :-
% % 	id_plan(state(door, corner, floor(middle)), state(door, corner1, in_basket), Plan).







% % % State of the robot's world = state(RLoc, RHC, SWC, MW, RHM)
% % % action(Action, State, NewState): Action in State produces NewState
% % % We assume robot never drops mail or coffee on the floor and never pushes mail or coffee around

% % % % Move clockwise
% % % action(mc,
% % % state(RLoc, RHC, SWC, MW, RHM),
% % % state(NewRLoc, RHC, SWC, MW, RHM)) :-
% % % (
% % % RLoc = lab, NewRLoc = office;
% % % RLoc = office, NewRLoc = kitchen;
% % % RLoc = kitchen, NewRLoc = corner;
% % % RLoc = corner, NewRLoc = lab
% % % ).

% % % % Move counterclockwise
% % % action(mcc,
% % % state(RLoc, RHC, SWC, MW, RHM),
% % % state(NewRLoc, RHC, SWC, MW, RHM)) :-
% % % (
% % % RLoc = lab, NewRLoc = corner;
% % % RLoc = office, NewRLoc = lab;
% % % RLoc = kitchen, NewRLoc = office;
% % % RLoc = corner, NewRLoc = kitchen
% % % ).

% % % % Pick up coffee
% % % action(puc,
% % % state(RLoc, false, SWC, MW, RHM),
% % % state(RLoc, true, SWC, MW, RHM)) :-
% % % RLoc = kitchen, SWC = true.

% % % % Deliver coffee
% % % action(dc,
% % % state(RLoc, true, false, MW, RHM),
% % % state(RLoc, false, false, MW, RHM)) :-
% % % RLoc = office.

% % % % Pick up mail
% % % action(pum,
% % % state(RLoc, RHC, SWC, true, false),
% % % state(RLoc, RHC, SWC, false, true)) :-
% % % RLoc = lab.

% % % % Deliver mail
% % % action(dm,
% % % state(RLoc, RHC, SWC, MW, true),
% % % state(RLoc, RHC, SWC, false, false)) :-
% % % RLoc = office.

% % % % plan(StartState, FinalState, Plan)

% % % plan(State, State, []).				% To achieve State from State itself, do nothing

% % % plan(State1, GoalState, [Action1 | RestofPlan]) :-
% % % 	action(Action1, State1, State2),		% Make first action resulting in State2
% % % 	plan(State2, GoalState, RestofPlan). 		% Find rest of plan

% % % % Iterative deepening planner
% % % % Backtracking to "append" generates lists of increasing length
% % % % Forces "plan" to ceate fixed length plans

% % % id_plan(Start, Goal, Plan) :-
% % %     append(Plan, _, _),
% % %     plan(Start, Goal, Plan).

% % % % This test should succeed without the neeed for iterative deepening
% % % test1(Plan) :-
% % % 	plan(state(door, corner, floor(middle)), state(_, _, in_basket), Plan).

% % % % This test will hit Prolog's stack size limit and cause an error
% % % % The planer gets caught in infinite recursion 
% % % test2(Plan) :-
% % % 	plan(state(door, corner, floor(middle)), state(door, corner1, in_basket), Plan).

% % % % Iterative deeepning allows the planner to find a shortest length plan.
% % % test3(Plan) :-
% % % 	id_plan(state(door, corner, floor(middle)), state(door, corner1, in_basket), Plan).








% % State of the robot's world = state(RobotLocation, BasketLocation, RubbishLocation)
% % action(Action, State, NewState): Action in State produces NewState
% % We assume robot never drops rubbish on floor and never pushes rubbish around

% action( pickup,						% Pick up rubbish from floor
% 	state(Pos1, Pos2, floor(Pos1)),			% Before action, robot and rubbish both at Pos1
% 	state(Pos1, Pos2, held)).			% After action, rubbush held by robot

% action( drop,						% Drop rubbish into basket
% 	state(Pos, Pos, held),				% Before action, robot and basket both at Pos
% 	state(Pos, Pos, in_basket)).			% After action, rubbish in basket

% action( push(Pos, NewPos),				% Push basket from Pos to NewPos
% 	state(Pos, Pos, Loc),				% Before action, robot and basket both at Pos
% 	state(NewPos, NewPos, Loc)).			% After action, robot and basket at NewPos

% action( go(Pos1, NewPos1),				% Go from Pos1 to NewPos1
% 	state(Pos1, Pos2, Loc),				% Before action, robot at Pos1
% 	state(NewPos1, Pos2, Loc)).			% After action, robot at Pos2

% clockwise(office, lab).
% clockwise(lab, mail_room).
% clockwise(mail_room, coffee_shop).
% clockwise(coffee_shop, office).

% counterclockwise(office, coffee_shop).
% counterclockwise(coffee_shop, mail_room).
% counterclockwise(mail_room, lab).
% counterclockwise(lab, office).



% action(puc,
%        state(RLoc, false, SWC, MW, RHM),
%        state(RLocNEW, true, SWC, MW, RHM)) :-
% 		clockwise(RLoc, RLocNEW),
%     RLoc \= RLocNEW,
%     RLocNEW = coffee_shop.

% action(mc,
%        state(office, RHC, SWC, MW, RHM),
%        state(coffee_shop, RHC, SWC, MW, RHM)) :-
%     % Define the clockwise order of the locations
%     clockwise(office, lab),
%     clockwise(lab, mail_room),
%     clockwise(mail_room, coffee_shop),
%     clockwise(coffee_shop, office).

% action(mcc,
%        state(office, RHC, SWC, MW, RHM),
%        state(coffee_shop, RHC, SWC, MW, RHM)) :-
%     % Define the counterclockwise order of the locations
%     counterclockwise(office, coffee_shop),
%     counterclockwise(coffee_shop, mail_room),
%     counterclockwise(mail_room, lab),
%     counterclockwise(lab, office).