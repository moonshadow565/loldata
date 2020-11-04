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
  local L1, L2, L3, L4, L5, L6
  A0.Priority = 0
  L1 = GetHeroes
  L2 = GetOtherTeam
  L2, L3, L4, L5, L6 = L2()
  L1 = L1(L2, L3, L4, L5, L6)
  L2 = #L1
  L3 = A0.HeroIDIndex
  if L2 >= L3 then
    L2 = math
    L2 = L2.max
    L3 = GetDist
    L4 = GetPos
    L4 = L4()
    L5 = GetPos
    L6 = A0.HeroIDIndex
    L6 = L1[L6]
    L5, L6 = L5(L6)
    L3 = L3(L4, L5, L6)
    L4 = 1
    L2 = L2(L3, L4)
    L3 = IsDead
    L4 = A0.HeroIDIndex
    L4 = L1[L4]
    L3 = L3(L4)
    if not L3 then
      L3 = HERO_ENGAGE_DIST
      if L2 < L3 then
        A0.Priority = 0.5
      else
        L3 = HERO_ENGAGE_DIST
        L3 = L3 * 2
        if L2 < L3 then
          L3 = HERO_ENGAGE_DIST
          L3 = L2 - L3
          L4 = HERO_ENGAGE_DIST
          L3 = L3 / L4
          L3 = 1 - L3
          L3 = 0.5 * L3
          A0.Priority = L3
        end
      end
    end
  end
end
UpdatePriority = L0
function L0(A0)
  local L1, L2, L3, L4, L5
  L1 = GetHeroes
  L2 = GetOtherTeam
  L2, L3, L4, L5 = L2()
  L1 = L1(L2, L3, L4, L5)
  L2 = #L1
  L3 = A0.HeroIDIndex
  if L2 >= L3 then
    L2 = TurnOffAutoAttack
    L3 = STOPREASON_MOVING
    L2(L3)
    L2 = SetStateAndCloseToTarget
    L3 = AI_FOLLOW_HERO
    L4 = A0.HeroIDIndex
    L4 = L1[L4]
    L2(L3, L4)
    L2 = GetTargetHealth
    L2 = L2()
    TargetHealth = L2
    L2 = InitTimer
    L3 = "AntiKiteTimer"
    L4 = 2
    L5 = true
    L2(L3, L4, L5)
  end
end
BeginTask = L0
function L0(A0)
  local L1, L2, L3, L4, L5, L6
  L1 = GetState
  L1 = L1()
  L2 = GetHeroes
  L3 = GetOtherTeam
  L3, L4, L5, L6 = L3()
  L2 = L2(L3, L4, L5, L6)
  L3 = #L2
  L4 = A0.HeroIDIndex
  if L3 >= L4 then
    L3 = GetDist
    L4 = GetPos
    L4 = L4()
    L5 = GetPos
    L6 = A0.HeroIDIndex
    L6 = L2[L6]
    L5, L6 = L5(L6)
    L3 = L3(L4, L5, L6)
    L4 = AI_FOLLOW_HERO
    if L1 == L4 then
      L4 = HERO_FIGHT_DIST
      if L3 < L4 then
        L4 = SetStateAndCloseToTarget
        L5 = AI_ATTACK_HERO
        L6 = A0.HeroIDIndex
        L6 = L2[L6]
        L4(L5, L6)
      else
        L4 = SetStateAndCloseToTarget
        L5 = AI_FOLLOW_HERO
        L6 = A0.HeroIDIndex
        L6 = L2[L6]
        L4(L5, L6)
      end
    else
      L4 = AI_ATTACK_HERO
      if L1 == L4 then
        L4 = HERO_FIGHT_DIST
        if L3 < L4 then
          L4 = TurnOnAutoAttack
          L5 = A0.HeroIDIndex
          L5 = L2[L5]
          L4(L5)
        else
          L4 = TurnOffAutoAttack
          L5 = STOPREASON_MOVING
          L4(L5)
          L4 = SetStateAndCloseToTarget
          L5 = AI_FOLLOW_HERO
          L6 = A0.HeroIDIndex
          L6 = L2[L6]
          L4(L5, L6)
        end
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
