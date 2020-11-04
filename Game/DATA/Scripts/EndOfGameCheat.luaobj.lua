local L0, L1
L0 = 0
TEAM_UNKNOWN = L0
L0 = 10
EOG_NEXUS_REVIVE_TIME = L0
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
  L2 = CloseShop
  L2()
  L2 = LuaForEachChampion
  L3 = TEAM_UNKNOWN
  L4 = "CheatChampionEoGCeremonyServer"
  L2(L3, L4)
  L2 = InitTimer
  L3 = "CheatDestroyNexusPhaseServer"
  L4 = GetEoGNexusExplosionTime
  L4 = L4()
  L5 = false
  L2(L3, L4, L5)
end
CheatEndOfGameCeremonyServer = L0
function L0(A0)
  local L1, L2, L3, L4
  L1 = MoveCameraFromCurrentPositionToPoint
  L2 = A0
  L3 = losingHQPosition
  L4 = GetEoGPanToHQTime
  L4 = L4()
  L1(L2, L3, L4)
  L1 = SetGreyscaleEnabledWhenDead
  L2 = A0
  L3 = false
  L1(L2, L3)
end
CheatChampionEoGCeremonyServer = L0
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
  L1 = "CheatStopRenderingMinionsPhaseServer"
  L2 = EOG_MINION_FADE_TIME
  L3 = false
  L0(L1, L2, L3)
  L0 = InitTimer
  L1 = "CheatRevertEoGSettingsServer"
  L2 = EOG_NEXUS_REVIVE_TIME
  L3 = false
  L0(L1, L2, L3)
end
CheatDestroyNexusPhaseServer = L0
function L0()
  local L0, L1, L2
  L0 = SetMinionsNoRender
  L1 = losingTeam
  L2 = true
  L0(L1, L2)
end
CheatStopRenderingMinionsPhaseServer = L0
function L0()
  local L0, L1, L2, L3
  L0 = SetBarracksSpawnEnabled
  L1 = true
  L0(L1)
  L0 = FadeMinions
  L1 = losingTeam
  L2 = 1
  L3 = 0.1
  L0(L1, L2, L3)
  L0 = SetHQCurrentSkin
  L1 = losingTeam
  L2 = EOG_ALIVE_NEXUS_SKIN
  L0(L1, L2)
end
CheatRevertEoGSettingsServer = L0
function L0()
  local L0, L1, L2, L3
  L0 = ClientCheat_ShowHud
  L1 = false
  L0(L1)
  L0 = InitTimer
  L1 = "CheatRevertEoGSettingsClient"
  L2 = GetEoGNexusExplosionTime
  L2 = L2()
  L3 = EOG_NEXUS_REVIVE_TIME
  L2 = L2 + L3
  L3 = false
  L0(L1, L2, L3)
end
CheatEndOfGameCeremonyClient = L0
function L0()
  local L0, L1
  L0 = ClientCheat_ShowHud
  L1 = true
  L0(L1)
end
CheatRevertEoGSettingsClient = L0
