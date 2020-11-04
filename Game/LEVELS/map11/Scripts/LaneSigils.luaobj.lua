local L0, L1, L2, L3, L4, L5, L6
L0 = {}
L1 = {}
L1.Name = "Top"
L2 = Make3DPoint
L3 = 2721
L4 = 22.09
L5 = 11893.56
L2 = L2(L3, L4, L5)
L1.Pos = L2
L2 = {}
L2.Name = "Bot"
L3 = Make3DPoint
L4 = 11861.1
L5 = -44.44
L6 = 3208.69
L3 = L3(L4, L5, L6)
L2.Start = L3
L0[1] = L1
L0[2] = L2
LaneSigilDefinitions = L0
function L0()
  local L0, L1, L2, L3, L4, L5, L6, L7
  for L3, L4 in L0, L1, L2 do
    L5 = {}
    L6 = L4.Pos
    L5.Pos = L6
    L5.EffectName = "ItemMuramanaToggle.troy"
    L6 = L4.Pos
    L5.TargetPos = L6
    L5.FOWVisibilityRadius = 10
    L5.SendIfOnScreenOrDiscard = false
    L5.PersistsThroughReconnect = true
    L5.BindFlexToOwnerPAR = false
    L5.FollowsGroundTilt = true
    L5.FacesTarget = true
    L5.HideFromSpectator = false
    L5.TimeoutInFOW = 99999
    L5.Scale = 0.5
    L6 = SpellEffectCreateFromTable
    L7 = L5
    L6(L7)
  end
end
SpawnLaneSigilEffects = L0
