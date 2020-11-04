local L0, L1
L0 = 5625
MIN_FOLLOW_DIST_SQ = L0
L0 = 500
MAX_DIST_TO_LANE = L0
L0 = 22500
MIN_FIGHT_DIST_SQ = L0
L0 = 90000
MAX_FIGHT_DIST_SQ = L0
L0 = false
allBarracksStarted = L0
function L0(A0)
  local L1, L2, L3, L4, L5, L6, L7, L8, L9, L10, L11
  L1 = GetMinions
  L2 = GetTeam
  L2 = L2()
  L3 = A0.LaneID
  L1 = L1(L2, L3)
  L2 = GetMaxTravelDistSquared
  L2 = L2()
  L3 = nil
  for L7 = L4, L5, L6 do
    L8 = GetMinionDistanceToLane
    L9 = L1[L7]
    L8 = L8(L9)
    L9 = MAX_DIST_TO_LANE
    if L8 < L9 then
      L8 = GetDistSquared
      L9 = GetPos
      L9 = L9()
      L10 = GetPos
      L11 = L1[L7]
      L10, L11 = L10(L11)
      L8 = L8(L9, L10, L11)
      L9 = MIN_FOLLOW_DIST_SQ
      if L8 > L9 and L2 > L8 then
        L2 = L8
        L3 = L1[L7]
      end
    end
  end
  return L4, L5
end
FindNearestFriendlyMinion = L0
function L0(A0)
  local L1, L2, L3, L4, L5, L6, L7, L8, L9, L10, L11
  L1 = 0.3
  L2 = allBarracksStarted
  if not L2 then
    L2 = GetAreAllBarracksStarted
    L3 = GetTeam
    L3, L7, L8, L9, L10, L11 = L3()
    L2 = L2(L3, L4, L5, L6, L7, L8, L9, L10, L11)
    allBarracksStarted = L2
  end
  L2 = allBarracksStarted
  if L2 then
    L2 = 0
    L3 = GetHeroes
    L7, L8, L9, L10, L11 = L4()
    L3 = L3(L4, L5, L6, L7, L8, L9, L10, L11)
    for L7 = L4, L5, L6 do
      L8 = GetActiveTaskName
      L9 = L3[L7]
      L8 = L8(L9)
      L9 = A0.Name
      if L8 == L9 then
        L2 = L2 + 1
      end
    end
    if L5 == L6 then
      L2 = L2 - 1
    end
    if 0 < L6 then
      L7 = #L3
    end
    L7 = A0
    if L6 then
      L7 = GetDist
      L8 = GetPos
      L9 = L6
      L8 = L8(L9)
      L9 = GetPos
      L9, L10, L11 = L9()
      L7 = L7(L8, L9, L10, L11)
      L8 = math
      L8 = L8.sqrt
      L9 = GetMaxTravelDistSquared
      L9, L10, L11 = L9()
      L8 = L8(L9, L10, L11)
      L9 = L7 / L8
      L9 = 1 - L9
      L10 = L1 * L9
      L10 = L10 * 0.2
      L10 = L10 + 0.24
      L10 = L10 + L5
      L10 = L10 + L4
      L11 = math
      L11 = L11.random
      L11 = L11()
      L11 = L11 * 0.03
      L10 = L10 + L11
      A0.Priority = L10
    else
      A0.Priority = 0
    end
  else
    A0.Priority = 0
  end
end
UpdatePriority = L0
function L0(A0)
  local L1, L2, L3, L4, L5
  L2 = A0
  L1 = A0.FindNearestFriendlyMinion
  L1 = L1(L2)
  if L1 then
    L2 = SetStateAndMove
    L3 = AI_SOFTATTACK
    L4 = GetPos
    L5 = L1
    L4, L5 = L4(L5)
    L2(L3, L4, L5)
  end
end
FollowClosestMinion = L0
function L0(A0)
  local L1, L2
  L1 = TurnOffAutoAttack
  L2 = STOPREASON_TARGET_LOST
  L1(L2)
  L2 = A0
  L1 = A0.FollowClosestMinion
  L1(L2)
end
BeginTask = L0
function L0(A0, A1)
  local L2, L3
  L2 = GetMinionDistanceToLane
  L3 = A1
  L2 = L2(L3)
  L3 = MAX_DIST_TO_LANE
  L3 = L2 < L3
  return L3
end
IsMinionCloseToLane = L0
function L0(A0)
  local L1, L2, L3, L4
  L2 = A0
  L1 = A0.FindNearestFriendlyMinion
  L1, L2 = L1(L2)
  L3 = IsMoving
  L3 = L3()
  if not L3 then
    L3 = MAX_FIGHT_DIST_SQ
    if L2 > L3 then
      L4 = A0
      L3 = A0.FollowClosestMinion
      L3(L4)
  end
  else
    L3 = IsMoving
    L3 = L3()
    if L3 then
      L3 = MIN_FIGHT_DIST_SQ
      if L2 < L3 then
        L3 = StopMove
        L3()
      end
    end
  end
end
Tick = L0
function L0(A0)
  local L1
end
OnTargetLost = L0
