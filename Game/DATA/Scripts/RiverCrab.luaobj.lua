local L0, L1, L2
L0 = DoLuaShared
L1 = "RiverRegions"
L0(L1)
L0 = DoLuaShared
L1 = "AIComponentSystem"
L0(L1)
L0 = AddComponent
L1 = "OutOfCombatRegen"
L0(L1)
L0 = AddComponent
L1 = "DefaultFearBehavior"
L0(L1)
L0 = AddComponent
L1 = "DefaultFleeBehavior"
L0(L1)
L0 = AddComponent
L1 = "NonAggressiveTauntBehavior"
L0(L1)
L0 = AddComponent
L1 = "WanderAlongPath"
L0(L1)
L0 = AddComponent
L1 = "SkittishMonster"
L0(L1)
L0 = AddComponent
L1 = "LockMovementToRiver"
L0(L1)
L0 = {}
RiverCrab = L0
L0 = RegisterForEvent
L1 = "RiverCornered"
L2 = RiverCrab
L0(L1, L2)
L0 = RegisterForEvent
L1 = "MeleeAttacked"
L2 = RiverCrab
L0(L1, L2)
L0 = RegisterForEvent
L1 = "RangeAttacked"
L2 = RiverCrab
L0(L1, L2)
function L0(A0)
  local L1, L2, L3, L4
  L1 = CreateRiverRegions
  L1()
  L1 = Event
  L2 = "ComponentInit"
  L1(L2)
  L1 = SetState
  L2 = AI_ATTACK
  L1(L2)
  L1 = SetMyLeashedPos
  L1()
  L1 = SetMyLeashedOrientation
  L1()
  L1 = InitTimer
  L2 = "TimerRetreat"
  L3 = 0.5
  L4 = true
  L1(L2, L3, L4)
  L1 = InitTimer
  L2 = "TimerAttack"
  L3 = 0
  L4 = true
  L1(L2, L3, L4)
  L1 = SpellIncLevel
  L2 = 0
  L1(L2)
  L1 = SpellIncLevel
  L2 = 1
  L1(L2)
  L1 = Event
  L2 = "WanderPause"
  L1(L2)
  L1 = RiverCrab
  L1.InMelee = true
end
OnInit = L0
function L0()
  local L0, L1
  L0 = Event
  L1 = "ComponentHalt"
  L0(L1)
  L0 = StopTimer
  L1 = "TimerRetreat"
  L0(L1)
  L0 = StopTimer
  L1 = "TimerAttack"
  L0(L1)
  L0 = TurnOffAutoAttack
  L1 = STOPREASON_IMMEDIATELY
  L0(L1)
  L0 = NetSetState
  L1 = AI_HALTED
  L0(L1)
end
HaltAI = L0
L0 = RiverCrab
function L1(A0)
  local L1
  A0.InMelee = true
end
L0.MeleeAttacked = L1
L0 = RiverCrab
function L1(A0)
  local L1
  A0.InMelee = false
end
L0.RangeAttacked = L1
L0 = RiverCrab
function L1(A0)
  local L1, L2, L3, L4, L5, L6, L7
  L1 = SetStateAndMove
  L2 = AI_MOVE
  L3 = River
  L3 = L3.CenterPos
  L1(L2, L3)
  L1 = A0.InMelee
  if L1 == true then
    L1 = ServerCastSpellOnPos
    L2 = 0
    L3 = River
    L3 = L3.CenterPos
    L1(L2, L3)
  else
    L1 = ServerCastSpellOnPos
    L2 = 1
    L3 = River
    L3 = L3.CenterPos
    L1(L2, L3)
  end
  L1 = GetWaypoint
  L1 = L1()
  L2 = GetMyPos
  L2 = L2()
  L3 = River
  L3 = L3.CenterPos
  L3 = L2 - L3
  L4 = L3
  L3 = L3.normalize
  L3 = L3(L4)
  L3 = L3 * 400
  L3 = L2 + L3
  L4 = GetDistSquared
  L5 = L2
  L6 = L1
  L4 = L4(L5, L6)
  L5 = GetDistSquared
  L6 = L3
  L7 = L1
  L5 = L5(L6, L7)
  if L4 > L5 then
    L6 = River
    L7 = River
    L7 = L7.Dir
    L7 = L7 * -1
    L6.Dir = L7
  end
end
L0.RiverCornered = L1
function L0()
  local L0, L1, L2
  L0 = Event
  L1 = "WanderPause"
  L0(L1)
  L0 = Event
  L1 = "SkittishPause"
  L0(L1)
  L0 = SetStateAndMove
  L1 = AI_MOVE
  L2 = GetMyPos
  L2 = L2()
  L0(L1, L2)
end
StopAI = L0
function L0()
  local L0, L1, L2
  L0 = Event
  L1 = "WanderResume"
  L0(L1)
  L0 = Event
  L1 = "SkittishResume"
  L0(L1)
  L0 = SetStateAndMove
  L1 = AI_MOVE
  L2 = GetWaypoint
  L2 = L2()
  L0(L1, L2)
end
StartAI = L0
function L0()
  local L0, L1
  L0 = StopAI
  L0()
end
StopLeashing = L0
function L0()
  local L0, L1
  L0 = StartAI
  L0()
end
StartLeashing = L0
