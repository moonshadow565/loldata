local L0, L1, L2
L0 = {}
L0.TimerCallbackName = "TimerSkittishMonster"
SkittishMonster = L0
L0 = RegisterForEvent
L1 = "ComponentInit"
L2 = SkittishMonster
L0(L1, L2)
L0 = RegisterForEvent
L1 = "LeashedCallForHelp"
L2 = SkittishMonster
L0(L1, L2)
L0 = RegisterForEvent
L1 = "ComponentHalt"
L2 = SkittishMonster
L0(L1, L2)
L0 = SkittishMonster
function L1(A0)
  local L1, L2, L3, L4
  A0.timerDuration = 0.5
  L1 = InitTimer
  L2 = A0.TimerCallbackName
  L3 = A0.timerDuration
  L4 = true
  L1(L2, L3, L4)
  L1 = StopTimer
  L2 = A0.TimerCallbackName
  L1(L2)
  L1 = {}
  A0.Attackers = L1
  A0.attackDuration = 5
end
L0.ComponentInit = L1
L0 = SkittishMonster
function L1(A0)
  local L1, L2
  L1 = Event
  L2 = "WanderPause"
  L1(L2)
  L1 = ResetAndStartTimer
  L2 = A0.TimerCallbackName
  L1(L2)
end
L0.Start = L1
L0 = SkittishMonster
function L1(A0)
  local L1, L2
  L1 = Event
  L2 = "WanderResume"
  L1(L2)
  L1 = StopTimer
  L2 = A0.TimerCallbackName
  L1(L2)
end
L0.Stop = L1
L0 = SkittishMonster
function L1(A0, A1, A2)
  local L3, L4, L5, L6, L7, L8
  for L6, L7 in L3, L4, L5 do
    L8 = L7.attacker
    if L8 == A2 then
      L8 = A0.attackDuration
      L7.remainingTime = L8
      return
    end
  end
  if L3 == 0 then
    L3(L4)
  end
  L5.attacker = A2
  L6 = A0.attackDuration
  L5.remainingTime = L6
  L3[L4] = L5
end
L0.LeashedCallForHelp = L1
L0 = SkittishMonster
function L1(A0)
  local L1, L2
  L1 = StopTimer
  L2 = A0.TimerCallbackName
  L1(L2)
end
L0.ComponentHalt = L1
function L0()
  local L0, L1
  L0 = SkittishMonster
  L1 = L0
  L0 = L0.Timer
  L0(L1)
end
TimerSkittishMonster = L0
L0 = SkittishMonster
function L1(A0)
  local L1, L2, L3, L4, L5, L6, L7, L8, L9
  L1 = GetState
  L1 = L1()
  L2 = AI_HALTED
  if L1 == L2 then
    return
  end
  L2 = 1
  while true do
    L3 = A0.Attackers
    L3 = #L3
    if not (L2 <= L3) then
      break
    end
    L3 = A0.Attackers
    L3 = L3[L2]
    L4 = L3.remainingTime
    L5 = A0.timerDuration
    L4 = L4 - L5
    L3.remainingTime = L4
    L4 = L3.remainingTime
    if L4 <= 0 then
      L4 = RemoveElement
      L5 = A0.Attackers
      L6 = L2
      L4(L5, L6)
      L4 = A0.Attackers
      L4 = #L4
      if L4 == 0 then
        L5 = A0
        L4 = A0.Stop
        L4(L5)
        return
      end
    else
      L2 = L2 + 1
    end
  end
  L3 = GetPos
  L4 = A0.Attackers
  L4 = L4[1]
  L4 = L4.attacker
  L3 = L3(L4)
  L4 = GetMyPos
  L4 = L4()
  L5 = L4 - L3
  L6 = L5
  L5 = L5.normalize
  L5 = L5(L6)
  L6 = 400 * L5
  L6 = L4 + L6
  L7 = SetStateAndMove
  L8 = AI_MOVE
  L9 = L6
  L7(L8, L9)
end
L0.Timer = L1
function L0(A0, A1)
  local L2, L3, L4, L5, L6, L7
  for L5 = L2, L3, L4 do
    L6 = L5 - 1
    L7 = A0[L5]
    A0[L6] = L7
  end
  A0[L2] = nil
end
RemoveElement = L0
