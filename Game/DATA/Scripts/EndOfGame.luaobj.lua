local L0, L1
L0 = 0
TEAM_UNKNOWN = L0
L0 = 3
EOG_PAN_TO_NEXUS_TIME = L0
L0 = EOG_PAN_TO_NEXUS_TIME
L0 = L0 + 0.5
EOG_NEXUS_EXPLOSION_TIME = L0
L0 = 5
EOG_SCOREBOARD_PHASE_DELAY_TIME = L0
L0 = 10
EOG_NEXUS_REVIVE_TIME = L0
L0 = 1
EOG_MAIN_SFX_FADE_DELAY_TIME = L0
L0 = 2
EOG_MAIN_SFX_FADE_DURATION = L0
L0 = 0
EOG_ALIVE_NEXUS_SKIN = L0
L0 = 1
EOG_DESTROYED_NEXUS_SKIN = L0
L0 = 0
EOG_MINION_FADE_AMOUNT = L0
L0 = 2
EOG_MINION_FADE_TIME = L0
function L0(A0, A1)
  local L2, L3, L4, L5
  winningTeam = A0
  L2 = winningTeam
  L3 = TEAM_ORDER
  if L2 == L3 then
    L2 = TEAM_CHAOS
    losingTeam = L2
  else
    L2 = TEAM_ORDER
    losingTeam = L2
  end
  L2 = GetPosition
  L3 = A1
  L2 = L2(L3)
  losingHQPosition = L2
  L2 = GetHQ
  L3 = TEAM_ORDER
  L2 = L2(L3)
  orderHQ = L2
  L2 = SetInvulnerable
  L3 = orderHQ
  L4 = true
  L2(L3, L4)
  L2 = SetTargetable
  L3 = orderHQ
  L4 = false
  L2(L3, L4)
  L2 = SetBuildingHealthRegenEnabled
  L3 = orderHQ
  L4 = false
  L2(L3, L4)
  L2 = GetHQ
  L3 = TEAM_CHAOS
  L2 = L2(L3)
  chaosHQ = L2
  L2 = SetInvulnerable
  L3 = chaosHQ
  L4 = true
  L2(L3, L4)
  L2 = SetTargetable
  L3 = chaosHQ
  L4 = false
  L2(L3, L4)
  L2 = SetBuildingHealthRegenEnabled
  L3 = chaosHQ
  L4 = false
  L2(L3, L4)
  L2 = SetInputLockingFlag
  L3 = INPUT_CAMERALOCKING
  L4 = true
  L2(L3, L4)
  L2 = SetInputLockingFlag
  L3 = INPUT_CAMERAMOVEMENT
  L4 = true
  L2(L3, L4)
  L2 = SetInputLockingFlag
  L3 = INPUT_ABILITIES
  L4 = true
  L2(L3, L4)
  L2 = SetInputLockingFlag
  L3 = INPUT_SUMMONERSPELLS
  L4 = true
  L2(L3, L4)
  L2 = SetInputLockingFlag
  L3 = INPUT_MOVEMENT
  L4 = true
  L2(L3, L4)
  L2 = SetInputLockingFlag
  L3 = INPUT_SHOP
  L4 = true
  L2(L3, L4)
  L2 = SetInputLockingFlag
  L3 = INPUT_MINIMAPMOVEMENT
  L4 = true
  L2(L3, L4)
  L2 = DisableHUDForEndOfGame
  L2()
  L2 = SetBarracksSpawnEnabled
  L3 = false
  L2(L3)
  L2 = CloseShop
  L2()
  L2 = HaltAllAI
  L2()
  L2 = LuaForEachChampion
  L3 = TEAM_UNKNOWN
  L4 = "ChampionEoGCeremony"
  L2(L3, L4)
  L2 = InitTimer
  L3 = "FadeOutMainSFXPhase"
  L4 = EOG_MAIN_SFX_FADE_DELAY_TIME
  L5 = false
  L2(L3, L4, L5)
  L2 = InitTimer
  L3 = "DestroyNexusPhase"
  L4 = EOG_NEXUS_EXPLOSION_TIME
  L5 = false
  L2(L3, L4, L5)
end
EndOfGameCeremony = L0
function L0(A0)
  local L1, L2, L3, L4
  L1 = MoveCameraFromCurrentPositionToPoint
  L2 = A0
  L3 = losingHQPosition
  L4 = EOG_PAN_TO_NEXUS_TIME
  L1(L2, L3, L4)
  L1 = SetGreyscaleEnabledWhenDead
  L2 = A0
  L3 = false
  L1(L2, L3)
end
ChampionEoGCeremony = L0
function L0()
  local L0, L1
  L0 = FadeOutMainSFX
  L1 = EOG_MAIN_SFX_FADE_DURATION
  L0(L1)
end
FadeOutMainSFXPhase = L0
function L0()
  local L0, L1, L2, L3
  L0 = SetHQCurrentSkin
  L1 = losingTeam
  L2 = EOG_DESTROYED_NEXUS_SKIN
  L0(L1, L2)
  L0 = FadeMinions
  L1 = losingTeam
  L2 = EOG_MINION_FADE_AMOUNT
  L3 = EOG_MINION_FADE_TIME
  L0(L1, L2, L3)
  L0 = InitTimer
  L1 = "StopRenderingMinionsPhase"
  L2 = EOG_MINION_FADE_TIME
  L3 = false
  L0(L1, L2, L3)
  L0 = InitTimer
  L1 = "ScoreboardPhase"
  L2 = EOG_SCOREBOARD_PHASE_DELAY_TIME
  L3 = false
  L0(L1, L2, L3)
end
DestroyNexusPhase = L0
function L0()
  local L0, L1, L2
  L0 = SetMinionsNoRender
  L1 = losingTeam
  L2 = true
  L0(L1, L2)
end
StopRenderingMinionsPhase = L0
function L0()
  local L0, L1, L2
  L0 = SetInputLockingFlag
  L1 = INPUT_CHAT
  L2 = true
  L0(L1, L2)
  L0 = EndGame
  L1 = winningTeam
  L0(L1)
end
ScoreboardPhase = L0
function L0()
  local L0, L1, L2
  L0 = SetHQCurrentSkin
  L1 = losingTeam
  L2 = EOG_ALIVE_NEXUS_SKIN
  L0(L1, L2)
end
TestReviveNexus = L0
