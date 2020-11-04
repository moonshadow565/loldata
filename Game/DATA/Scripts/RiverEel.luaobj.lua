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
L1 = "DefaultTauntBehavior"
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
RiverEel = L0
L0 = RegisterForEvent
L1 = "RiverCornered"
L2 = RiverEel
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
L0 = RiverEel
function L1(A0)
  local L1, L2, L3
  L1 = SetStateAndMove
  L2 = AI_MOVE
  L3 = River
  L3 = L3.CenterPos
  L1(L2, L3)
  L1 = ServerCastSpellOnPos
  L2 = 0
  L3 = River
  L3 = L3.CenterPos
  L1(L2, L3)
end
L0.RiverCornered = L1
