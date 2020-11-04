local L0, L1
function L0(A0, A1, A2)
  local L3, L4, L5
  L3 = {}
  L4 = GetHashedGameObjName
  L5 = "Target"
  L4 = L4(L5)
  L3[L4] = A1
  L4 = GetHashedGameObjName
  L5 = "Attacker"
  L4 = L4(L5)
  L3[L4] = A0
  passThroughParams = L3
  L3 = {}
  L3.AttackerVar = "Attacker"
  L3.TargetVar = "Target"
  L3.Damage = A2
  L4 = TRUE_DAMAGE
  L3.DamageType = L4
  L4 = DAMAGESOURCE_RAW
  L3.SourceDamageType = L4
  L3.PercentOfAttack = 1
  L3.SpellDamageRatio = 0
  perBlockParams = L3
  L3 = BBApplyDamage
  L4 = passThroughParams
  L5 = perBlockParams
  L3(L4, L5)
end
ApplyDamage = L0
function L0(A0, A1)
  local L2, L3, L4
  L2 = {}
  L3 = GetHashedGameObjName
  L4 = "Target"
  L3 = L3(L4)
  L2[L3] = A0
  passThroughParams = L2
  L2 = {}
  L2.UnitVar = "Target"
  L2.ItemID = A1
  perBlockParams = L2
  L2 = BBCreateItem
  L3 = passThroughParams
  L4 = perBlockParams
  L2(L3, L4)
end
CreateItem = L0
function L0(A0, A1)
  local L2, L3, L4
  L2 = {}
  passThroughParams = L2
  L2 = {}
  L2.Skin = A0
  L2.Team = A1
  L2.DestVar = "DestObj"
  perBlockParams = L2
  L2 = BBGetChampionBySkinName
  L3 = passThroughParams
  L4 = perBlockParams
  L2(L3, L4)
  L2 = passThroughParams
  L2 = L2.DestObj
  return L2
end
GetChampionBySkinName = L0
function L0(A0, A1)
  local L2, L3, L4
  L2 = {}
  L3 = GetHashedGameObjName
  L4 = "Owner"
  L3 = L3(L4)
  L2[L3] = A0
  passThroughParams = L2
  L2 = {}
  L2.TargetVar = "Owner"
  L2.Delta = A1
  perBlockParams = L2
  L2 = BBIncGold
  L3 = passThroughParams
  L4 = perBlockParams
  L2(L3, L4)
end
IncGold = L0
function L0(A0, A1, A2, A3)
  local L4, L5, L6
  L4 = {}
  L5 = GetHashedGameObjName
  L6 = "Owner"
  L5 = L5(L6)
  L4[L5] = A0
  L4.Position = A1
  passThroughParams = L4
  L4 = {}
  L4.UnitVar = "Owner"
  L4.TargetVar = "Position"
  L4.Speed = A2
  L4.Gravity = A3
  L4.MoveBackBy = 0
  perBlockParams = L4
  L4 = BBMove
  L5 = passThroughParams
  L6 = perBlockParams
  L4(L5, L6)
end
Move = L0
function L0(A0, A1)
  local L2, L3, L4
  L2 = {}
  L3 = GetHashedGameObjName
  L4 = "Owner"
  L3 = L3(L4)
  L2[L3] = A0
  L2.Position = A1
  passThroughParams = L2
  L2 = {}
  L2.Owner = "Owner"
  L2.PositionVar = "Position"
  perBlockParams = L2
  L2 = BBSetCameraPosition
  L3 = passThroughParams
  L4 = perBlockParams
  L2(L3, L4)
end
SetCameraPosition = L0
function L0(A0, A1, A2, A3, A4, A5, A6, A7, A8, A9)
  local L10, L11, L12
  L10 = {}
  L11 = GetHashedGameObjName
  L12 = "Attacker"
  L11 = L11(L12)
  L10[L11] = A0
  L11 = GetHashedGameObjName
  L12 = "Target"
  L11 = L11(L12)
  L10[L11] = A1
  L10.NextBuffVars = A8
  passThroughParams = L10
  L10 = {}
  L10.AttackerVar = "Attacker"
  L10.TargetVar = "Target"
  L10.BuffName = A2
  L10.BuffAddType = A3
  L10.BuffType = A4
  L10.MaxStack = A5
  L10.NumberStacks = A6
  L10.Duration = A7
  L10.BuffVarsTable = "NextBuffVars"
  L10.TickRate = A9
  perBlockParams = L10
  L10 = BBSpellBuffAdd
  L11 = passThroughParams
  L12 = perBlockParams
  L10(L11, L12)
end
SpellBuffAdd = L0
function L0(A0, A1, A2, A3, A4, A5)
  local L6, L7, L8
  L6 = {}
  L7 = GetHashedGameObjName
  L8 = "Owner"
  L7 = L7(L8)
  L6[L7] = A1
  L6.Position = A2
  L7 = GetHashedGameObjName
  L8 = "Target"
  L7 = L7(L8)
  L6[L7] = A4
  L6.TargetPos = A5
  passThroughParams = L6
  L6 = {}
  L6.EffectName = A0
  L6.BindObjectVar = "Owner"
  L6.PosVar = "Position"
  L6.Flags = A3
  L6.TargetObjectVar = "Target"
  L6.TargetPosVar = "TargetPos"
  perBlockParams = L6
  L6 = BBSpellEffectCreate
  L7 = passThroughParams
  L8 = perBlockParams
  L6 = L6(L7, L8)
  outEffectID = L6
  L6 = outEffectID
  return L6
end
SpellEffectCreate = L0
function L0(A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10)
  local L11, L12, L13
  L11 = {}
  L11.Pos = A3
  L12 = GetHashedGameObjName
  L13 = "GoldRedirectObj"
  L12 = L12(L13)
  L11[L12] = A10
  passThroughParams = L11
  L11 = {}
  L11.Name = A0
  L11.Skin = A1
  L11.AiScript = A2
  L11.PosVar = "Pos"
  L11.Team = A4
  L11.Stunned = A5
  L11.Rooted = A6
  L11.Silenced = A7
  L11.Invulnerable = A8
  L11.MagicImmune = A9
  L11.DestVar = "DestObj"
  L11.GoldRedirectTargetVar = "GoldRedirectObj"
  perBlockParams = L11
  L11 = BBSpawnMinion
  L12 = passThroughParams
  L13 = perBlockParams
  L11(L12, L13)
  L11 = passThroughParams
  L11 = L11.DestObj
  return L11
end
SpawnMinion = L0
