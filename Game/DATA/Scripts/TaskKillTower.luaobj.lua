local L0, L1
L0 = GetAttackRange
L0 = L0()
L0 = L0 + 200
MIN_FIGHT_DIST = L0
L0 = MIN_FIGHT_DIST
L1 = MIN_FIGHT_DIST
L0 = L0 * L1
MIN_FIGHT_DIST_SQ = L0
L0 = GetAttackRange
L0 = L0()
L0 = L0 + 800
MIN_ENGAGE_DIST = L0
L0 = MIN_ENGAGE_DIST
L1 = MIN_ENGAGE_DIST
L0 = L0 * L1
MIN_ENGAGE_DIST_SQ = L0
L0 = 0
AI_ATTACK = L0
L0 = 1
AI_FOLLOW = L0
function L0(A0)
  local L1, L2, L3, L4, L5, L6, L7, L8, L9, L10, L11
  L1 = GetStructures
  L2 = GetOtherTeam
  L2, L3, L7, L8, L9, L10, L11 = L2()
  L1 = L1(L2, L3, L4, L5, L6, L7, L8, L9, L10, L11)
  L2 = nil
  L3 = GetMaxTravelDistSquared
  L3 = L3()
  for L7 = L4, L5, L6 do
    L8 = GetObject
    L9 = L1[L7]
    L8 = L8(L9)
    L9 = GetDistSquared
    L10 = GetPos
    L11 = L8
    L10 = L10(L11)
    L11 = GetPos
    L11 = L11()
    L9 = L9(L10, L11)
    L10 = IsDead
    L11 = L8
    L10 = L10(L11)
    if not L10 then
      L10 = MIN_ENGAGE_DIST_SQ
      if L9 < L10 and L3 > L9 then
        L2 = L8
        L3 = L9
      end
    end
  end
  return L2
end
FindNearestTower = L0
function L0(A0)
  local L1, L2, L3, L4
  A0.Priority = 0
  L2 = A0
  L1 = A0.FindNearestTower
  L1 = L1(L2)
  if L1 then
    L2 = GetHP
    L3 = L1
    L2 = L2(L3)
    L3 = GetMaxHP
    L4 = L1
    L3 = L3(L4)
    L2 = L2 / L3
    if L2 < 0.2 then
      L3 = 1 - L2
      A0.Priority = L3
    else
      A0.Priority = 0.4
    end
  end
end
UpdatePriority = L0
function L0(A0)
  local L1, L2
  L1 = TurnOffAutoAttack
  L2 = STOPREASON_TARGET_LOST
  L1(L2)
end
BeginTask = L0
function L0(A0)
  local L1
end
OnTargetLost = L0
function L0(A0)
  local L1, L2, L3, L4, L5, L6, L7
  L1 = GetState
  L1 = L1()
  L3 = A0
  L2 = A0.FindNearestTower
  L2 = L2(L3)
  if L2 then
    L3 = GetPos
    L4 = L2
    L3 = L3(L4)
    L4 = GetDistSquared
    L5 = GetPos
    L5 = L5()
    L6 = L3
    L4 = L4(L5, L6)
    L5 = AI_FOLLOW
    if L1 == L5 then
      L5 = MIN_FIGHT_DIST_SQ
      if L4 < L5 then
        L5 = SetStateAndCloseToTarget
        L6 = AI_ATTACK
        L7 = L2
        L5(L6, L7)
      else
        L5 = SetStateAndMove
        L6 = AI_FOLLOW
        L7 = L3
        L5(L6, L7)
      end
    else
      L5 = AI_ATTACK
      if L1 == L5 then
        L5 = TargetInAttackRange
        L5 = L5()
        if L5 then
          L5 = TurnOnAutoAttack
          L6 = L2
          L5(L6)
        else
          L5 = TurnOffAutoAttack
          L6 = STOPREASON_MOVING
          L5(L6)
          L5 = SetStateAndMove
          L6 = AI_FOLLOW
          L7 = L3
          L5(L6, L7)
        end
      end
    end
  end
end
Tick = L0
