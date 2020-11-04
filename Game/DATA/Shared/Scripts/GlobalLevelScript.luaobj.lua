local L0, L1
L0 = 30
EVENT_STAGE_WELCOME_TIME = L0
L0 = 60
EVENT_STAGE_PREANNOUNCE_TIME = L0
L0 = 0
EVENT_STAGE_FINISHED = L0
L0 = 1
EVENT_STAGE_WELCOME = L0
L0 = 2
EVENT_STAGE_PREANNOUNCE = L0
L0 = EVENT_STAGE_WELCOME
NextEventStage = L0
function L0(A0)
  local L1, L2
  L1 = NextEventStage
  L2 = EVENT_STAGE_FINISHED
  if L1 == L2 then
    return
  else
    L1 = NextEventStage
    L2 = EVENT_STAGE_WELCOME
    if L1 == L2 then
      L1 = EVENT_STAGE_WELCOME_TIME
      if A0 >= L1 then
        L1 = NotifyGlobalEvent
        L2 = "OnStartGameMessage1"
        L1(L2)
        L1 = EVENT_STAGE_PREANNOUNCE
        NextEventStage = L1
      end
    else
      L1 = NextEventStage
      L2 = EVENT_STAGE_PREANNOUNCE
      if L1 == L2 then
        L1 = EVENT_STAGE_PREANNOUNCE_TIME
        if A0 >= L1 then
          L1 = NotifyGlobalEvent
          L2 = "OnStartGameMessage2"
          L1(L2)
          L1 = EVENT_STAGE_FINISHED
          NextEventStage = L1
        end
      end
    end
  end
end
UpdateEventTimers = L0
