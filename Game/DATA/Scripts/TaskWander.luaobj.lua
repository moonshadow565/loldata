local L0, L1, L2
L0 = {}
L0.x = 0
L0.y = 0
L0.z = 0
L1 = 0
L2 = 0
AI_MOVE = L2
L2 = 1
AI_STOP = L2
function L2(A0)
  local L1
  A0.Priority = 0.001
end
UpdatePriority = L2
function L2(A0)
  local L1, L2
  L1 = TurnOffAutoAttack
  L2 = STOPREASON_TARGET_LOST
  L1(L2)
end
BeginTask = L2
function L2(A0)
  local L1, L2, L3, L4
  L1 = _UPVALUE0_
  L2 = os
  L2 = L2.time
  L2 = L2()
  if L1 < L2 then
    L1 = os
    L1 = L1.time
    L1 = L1()
    L2 = math
    L2 = L2.random
    L3 = 2
    L4 = 4
    L2 = L2(L3, L4)
    L1 = L1 + L2
    _UPVALUE0_ = L1
    L1 = MakeWanderPoint
    L2 = GetPos
    L2 = L2()
    L3 = 250
    L1 = L1(L2, L3)
    _UPVALUE1_ = L1
  end
  L1 = GetState
  L1 = L1()
  L2 = AI_MOVE
  if L1 == L2 then
    L1 = GetDist
    L2 = _UPVALUE1_
    L3 = GetPos
    L3, L4 = L3()
    L1 = L1(L2, L3, L4)
    if L1 < 80 then
      L1 = StopMove
      L1()
      L1 = SetState
      L2 = AI_STOP
      L1(L2)
    end
  end
  L1 = GetState
  L1 = L1()
  L2 = AI_STOP
  if L1 == L2 then
    L1 = GetDist
    L2 = _UPVALUE1_
    L3 = GetPos
    L3, L4 = L3()
    L1 = L1(L2, L3, L4)
    if 80 <= L1 then
      L1 = SetStateAndMove
      L2 = AI_MOVE
      L3 = _UPVALUE1_
      L1(L2, L3)
    end
  end
end
Tick = L2
function L2(A0)
  local L1
end
OnTargetLost = L2
