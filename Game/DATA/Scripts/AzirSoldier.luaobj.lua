local L0_0, L1_1
function L0_0()
  SetState(AI_IDLE)
  InitTimer("Update", 0.15, true)
  Active = true
  SearchForTargets = true
  SearchIgnoresAzirMovement = false
  return false
end
OnInit = L0_0
function L0_0(A0_2, A1_3, A2_4)
  local L3_5
  L3_5 = GetState
  L3_5 = L3_5()
  if L3_5 == AI_HALTED then
    L3_5 = true
    return L3_5
  end
  L3_5 = ORDER_PETHARDATTACK
  if A0_2 == L3_5 then
    L3_5 = Active
    if L3_5 == false then
      L3_5 = true
      Active = L3_5
      L3_5 = GetGoldRedirectTarget
      L3_5 = L3_5()
      IssueOrder(L3_5, ORDER_PETHARDATTACK, GetPos(L3_5), L3_5)
    end
  else
    L3_5 = ORDER_PETHARDRETURN
    if A0_2 == L3_5 then
      L3_5 = false
      Active = L3_5
    else
      L3_5 = ORDER_MOVETO
      if A0_2 == L3_5 then
        L3_5 = true
        SearchForTargets = L3_5
        L3_5 = false
        SearchIgnoresAzirMovement = L3_5
        L3_5 = TurnOffAutoAttack
        L3_5(STOPREASON_MOVING)
      else
        L3_5 = ORDER_ATTACKMOVE
        if A0_2 == L3_5 then
          L3_5 = true
          SearchForTargets = L3_5
          L3_5 = true
          SearchIgnoresAzirMovement = L3_5
          L3_5 = Update
          L3_5()
        else
          L3_5 = ORDER_HOLD
          if A0_2 == L3_5 then
            L3_5 = false
            SearchForTargets = L3_5
            L3_5 = false
            SearchIgnoresAzirMovement = L3_5
          else
            L3_5 = ORDER_STOP
            if A0_2 == L3_5 then
              L3_5 = false
              SearchForTargets = L3_5
              L3_5 = false
              SearchIgnoresAzirMovement = L3_5
              L3_5 = TurnOffAutoAttack
              L3_5(STOPREASON_TARGET_LOST)
            else
              L3_5 = ORDER_CASTSPELL
              if A0_2 == L3_5 then
                L3_5 = false
                SearchForTargets = L3_5
                L3_5 = false
                SearchIgnoresAzirMovement = L3_5
                L3_5 = Active
                if L3_5 == true then
                  L3_5 = TurnOnAutoAttack
                  L3_5(A1_3, true)
                end
              end
            end
          end
        end
      end
    end
  end
  L3_5 = true
  return L3_5
end
OnOrder = L0_0
function L0_0()
  local L0_6
  L0_6 = GetGoldRedirectTarget
  L0_6 = L0_6()
  if L0_6 == nil then
    Die(me, DAMAGESOURCE_INTERNALRAW)
    return
  end
  if Active == false then
    return
  end
  if SearchForTargets == true and (SearchIgnoresAzirMovement == true or TargetIsMoving(L0_6) == false and IsAutoAcquireTargetEnabled()) and FindTargetInAcR() ~= nil then
    IssueOrder(L0_6, ORDER_PETHARDMOVE, GetPos(L0_6))
  end
end
Update = L0_0
function L0_0()
  StopTimer("Update")
  TurnOffAutoAttack(STOPREASON_IMMEDIATELY)
  NetSetState(AI_HALTED)
end
HaltAI = L0_0
