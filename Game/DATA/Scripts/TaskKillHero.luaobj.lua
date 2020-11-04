local L0, L1
L0 = GetAttackRange
L0 = L0()
HERO_FIGHT_DIST = L0
L0 = GetAttackRange
L0 = L0()
L0 = L0 + 500
HERO_ENGAGE_DIST = L0
L0 = 0
AI_FOLLOW_HERO = L0
L0 = 1
AI_ATTACK_HERO = L0
L0 = 0
TargetHealth = L0
L0 = false
ReducePriority = L0
function L0(A0)
  local L1, L2, L3, L4, L5
  A0.Priority = 0
  L1 = math
  L1 = L1.max
  L2 = GetDist
  L3 = GetPos
  L3 = L3()
  L4 = GetPos
  L5 = A0.HeroID
  L4, L5 = L4(L5)
  L2 = L2(L3, L4, L5)
  L3 = 1
  L1 = L1(L2, L3)
  L2 = ReducePriority
  if L2 == true then
    A0.Priority = 0
    return
  end
  L2 = IsDead
  L3 = A0.HeroID
  L2 = L2(L3)
  if not L2 then
    L2 = HERO_ENGAGE_DIST
    if L1 < L2 then
      A0.Priority = 0.5
    else
      L2 = HERO_ENGAGE_DIST
      L2 = L2 * 2
      if L1 < L2 then
        L2 = HERO_ENGAGE_DIST
        L2 = L1 - L2
        L3 = HERO_ENGAGE_DIST
        L2 = L2 / L3
        L2 = 1 - L2
        L2 = 0.5 * L2
        A0.Priority = L2
      end
    end
  end
end
UpdatePriority = L0
function L0(A0)
  local L1, L2, L3, L4
  L1 = TurnOffAutoAttack
  L2 = STOPREASON_MOVING
  L1(L2)
  L1 = SetStateAndCloseToTarget
  L2 = AI_FOLLOW_HERO
  L3 = A0.HeroID
  L1(L2, L3)
  L1 = GetTargetHealth
  L1 = L1()
  TargetHealth = L1
  L1 = InitTimer
  L2 = "AntiKiteTimer"
  L3 = 2
  L4 = true
  L1(L2, L3, L4)
end
BeginTask = L0
function L0(A0)
  local L1, L2, L3, L4, L5
  L1 = GetState
  L1 = L1()
  L2 = GetDist
  L3 = GetPos
  L3 = L3()
  L4 = GetPos
  L5 = A0.HeroID
  L4, L5 = L4(L5)
  L2 = L2(L3, L4, L5)
  L3 = AI_FOLLOW_HERO
  if L1 == L3 then
    L3 = HERO_FIGHT_DIST
    if L2 < L3 then
      L3 = SetStateAndCloseToTarget
      L4 = AI_ATTACK_HERO
      L5 = A0.HeroID
      L3(L4, L5)
    else
      L3 = SetStateAndCloseToTarget
      L4 = AI_FOLLOW_HERO
      L5 = A0.HeroID
      L3(L4, L5)
    end
  else
    L3 = AI_ATTACK_HERO
    if L1 == L3 then
      L3 = HERO_FIGHT_DIST
      if L2 < L3 then
        L3 = TurnOnAutoAttack
        L4 = A0.HeroID
        L3(L4)
      else
        L3 = TurnOffAutoAttack
        L4 = STOPREASON_MOVING
        L3(L4)
        L3 = SetStateAndCloseToTarget
        L4 = AI_FOLLOW_HERO
        L5 = A0.HeroID
        L3(L4, L5)
      end
    end
  end
end
Tick = L0
function L0(A0)
  local L1, L2
  L1 = GetTargetHealth
  L1 = L1()
  L2 = TargetHealth
  L2 = L2 - 10
  if L1 >= L2 then
    L1 = IsMoving
    L1 = L1()
    if L1 then
      L1 = true
      ReducePriority = L1
      L1 = GetTargetHealth
      L1 = L1()
      TargetHealth = L1
      return
    end
  end
  L1 = ReducePriority
  if L1 == true then
    L1 = false
    ReducePriority = L1
    L1 = GetTargetHealth
    L1 = L1()
    TargetHealth = L1
    return
  end
  L1 = GetTargetHealth
  L1 = L1()
  TargetHealth = L1
end
AntiKiteTimer = L0
function L0(A0)
  local L1
end
OnTargetLost = L0
