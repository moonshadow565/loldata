local L0, L1
L0 = -1
gCurrentBuildingBlockNumber = L0
L0 = ""
gCurrentBuildingBlockString = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6, L7, L8, L9, L10
  if A0 ~= nil then
    L2 = gCurrentBuildingBlockString
    A1.___BreakExecution___ = false
    for L6 = L3, L4, L5 do
      L7 = A1.___BreakExecution___
      if false == L7 then
        gCurrentBuildingBlockNumber = L6
        L7 = L2
        L8 = "."
        L9 = gCurrentBuildingBlockNumber
        L7 = L7 .. L8 .. L9
        gCurrentBuildingBlockString = L7
        L7 = gCurrentBuildingBlockNumber
        L7 = A0[L7]
        gCurrentBuildingBlock = L7
        L7 = gCurrentBuildingBlock
        L7 = L7.Function
        L8 = A1
        L9 = gCurrentBuildingBlock
        L9 = L9.Params
        L10 = gCurrentBuildingBlock
        L10 = L10.SubBlocks
        L7(L8, L9, L10)
      end
    end
    gCurrentBuildingBlockString = L2
    gCurrentBuildingBlockNumber = L3
    gCurrentBuildingBlock = L3
  end
end
ExecuteBuildingBlocks = L0
function L0()
  local L0, L1
end
BBRequireVar = L0
function L0(A0, A1, A2)
  local L3, L4, L5
  L3 = A1.IsConditionTrue
  L4 = A0
  L3 = L3(L4)
  if L3 then
    L3 = ExecuteBuildingBlocks
    L4 = A2
    L5 = A0
    L3(L4, L5)
  end
end
BBConditionallyExecute = L0
function L0(A0, A1, A2)
  local L3, L4
  if A1 ~= nil then
    L3 = A0[A1]
    if L3 == nil and A2 then
      L4 = {}
      A0[A1] = L4
      L4 = A0[A1]
      return L4
    end
  end
  if L3 == nil then
    L3 = A0
  end
  return L3
end
GetTable = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6
  L2 = GetTable
  L3 = A0
  L4 = A1.DestVarTable
  L5 = true
  L2 = L2(L3, L4, L5)
  L3 = A0.Level
  if L3 ~= nil then
    L3 = A1.SrcValueByLevel
    if L3 ~= nil then
      L3 = A1.DestVar
      L4 = A1.SrcValueByLevel
      L5 = A0.Level
      L4 = L4[L5]
      L2[L3] = L4
  end
  else
    L3 = GetTable
    L4 = A0
    L5 = A1.SrcVarTable
    L6 = false
    L3 = L3(L4, L5, L6)
    L4 = A1.SrcVar
    if L4 ~= nil and L3 ~= nil then
      L4 = A1.DestVar
      L5 = A1.SrcVar
      L5 = L3[L5]
      L2[L4] = L5
    else
      L4 = A1.DestVar
      L5 = A1.SrcValue
      L2[L4] = L5
    end
  end
end
BBSetVarInTable = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6, L7, L8, L9, L10
  L2 = GetTable
  L3 = A0
  L4 = A1.DestVarTable
  L5 = true
  L2 = L2(L3, L4, L5)
  L3 = nil
  L4 = GetTable
  L5 = A0
  L6 = A1.SpellSlotVarTable
  L7 = false
  L4 = L4(L5, L6, L7)
  L5 = A1.SpellSlotVar
  if L5 ~= nil and L4 ~= nil then
    L5 = A1.SpellSlotVar
    L3 = L4[L5]
  else
    L3 = A1.SpellSlotValue
  end
  L5 = A1.DestVar
  L6 = A1.Function
  L7 = A1.OwnerVar
  L7 = A0[L7]
  L8 = L3
  L9 = A1.SpellbookType
  L10 = A1.SlotType
  L6 = L6(L7, L8, L9, L10)
  L2[L5] = L6
end
BBGetSlotSpellInfo = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6, L7, L8, L9, L10, L11
  L2 = GetTable
  L3 = A0
  L4 = A1.SrcVarTable
  L5 = false
  L2 = L2(L3, L4, L5)
  L3 = nil
  L4 = A1.SrcVar
  if L4 ~= nil and L2 ~= nil then
    L4 = A1.SrcVar
    L3 = L2[L4]
  else
    L3 = A1.SrcValue
  end
  L4 = nil
  L5 = GetTable
  L6 = A0
  L7 = A1.SpellSlotVarTable
  L8 = false
  L5 = L5(L6, L7, L8)
  L6 = A1.SpellSlotVar
  if L6 ~= nil and L5 ~= nil then
    L6 = A1.SpellSlotVar
    L4 = L5[L6]
  else
    L4 = A1.SpellSlotValue
  end
  L6 = SetSlotSpellCooldownTime
  L7 = A1.OwnerVar
  L7 = A0[L7]
  L8 = L4
  L9 = A1.SpellbookType
  L10 = A1.SlotType
  L11 = L3
  L6(L7, L8, L9, L10, L11)
end
BBSetSlotSpellCooldownTime = L0
function L0(A0, A1)
  local L2, L3, L4, L5
  L2 = A0.Level
  if L2 ~= nil then
    L2 = A1.SrcValueByLevel
    if L2 ~= nil then
      L2 = A1.SrcValueByLevel
      L3 = A0.Level
      L2 = L2[L3]
      A0.ReturnValue = L2
  end
  else
    L2 = GetTable
    L3 = A0
    L4 = A1.SrcVarTable
    L5 = false
    L2 = L2(L3, L4, L5)
    L3 = A1.SrcVar
    if L3 ~= nil and L2 ~= nil then
      L3 = A1.SrcVar
      L3 = L2[L3]
      A0.ReturnValue = L3
    else
      L3 = A1.SrcValue
      A0.ReturnValue = L3
    end
  end
end
BBSetReturnValue = L0
function L0(A0, A1)
  local L2, L3
  L2 = type
  L3 = A0
  L2 = L2(L3)
  if L2 == "string" then
    L2 = type
    L3 = A1
    L2 = L2(L3)
    if L2 == "string" then
      L2 = string
      L2 = L2.lower
      L3 = A0
      L2 = L2(L3)
      A0 = L2
      L2 = string
      L2 = L2.lower
      L3 = A1
      L2 = L2(L3)
      A1 = L2
    end
  end
  L2 = A0 == A1
  return L2
end
CO_EQUAL = L0
function L0(A0, A1)
  local L2, L3
  L2 = type
  L3 = A0
  L2 = L2(L3)
  if L2 == "string" then
    L2 = type
    L3 = A1
    L2 = L2(L3)
    if L2 == "string" then
      L2 = string
      L2 = L2.lower
      L3 = A0
      L2 = L2(L3)
      A0 = L2
      L2 = string
      L2 = L2.lower
      L3 = A1
      L2 = L2(L3)
      A1 = L2
    end
  end
  L2 = A0 ~= A1
  return L2
end
CO_NOT_EQUAL = L0
function L0(A0, A1)
  local L2
  L2 = A0 < A1
  return L2
end
CO_LESS_THAN = L0
function L0(A0, A1)
  local L2
  L2 = A1 < A0
  return L2
end
CO_GREATER_THAN = L0
function L0(A0, A1)
  local L2
  L2 = A0 <= A1
  return L2
end
CO_LESS_THAN_OR_EQUAL = L0
function L0(A0, A1)
  local L2
  L2 = A1 <= A0
  return L2
end
CO_GREATER_THAN_OR_EQUAL = L0
function L0(A0, A1)
  local L2, L3, L4
  L2 = GetTeamID
  L3 = A0
  L2 = L2(L3)
  L3 = GetTeamID
  L4 = A1
  L3 = L3(L4)
  L2 = L2 == L3
  return L2
end
CO_SAME_TEAM = L0
function L0(A0, A1)
  local L2, L3, L4
  L2 = GetTeamID
  L3 = A0
  L2 = L2(L3)
  L3 = GetTeamID
  L4 = A1
  L3 = L3(L4)
  L2 = L2 ~= L3
  return L2
end
CO_DIFFERENT_TEAM = L0
function L0(A0, A1)
  local L2
  L2 = GetSourceType
  L2 = L2()
  L2 = L2 == A1
  return L2
end
CO_DAMAGE_SOURCETYPE_IS = L0
function L0(A0, A1)
  local L2
  L2 = GetSourceType
  L2 = L2()
  L2 = L2 ~= A1
  return L2
end
CO_DAMAGE_SOURCETYPE_IS_NOT = L0
function L0(A0)
  local L1, L2
  L1 = IsObjectAI
  L2 = A0
  return L1(L2)
end
CO_IS_TYPE_AI = L0
function L0(A0)
  local L1, L2
  L1 = IsObjectAI
  L2 = A0
  L1 = L1(L2)
  L1 = L1 ~= true
  return L1
end
CO_IS_NOT_AI = L0
function L0(A0)
  local L1, L2
  L1 = IsObjectHero
  L2 = A0
  return L1(L2)
end
CO_IS_TYPE_HERO = L0
function L0(A0)
  local L1, L2
  L1 = IsObjectHero
  L2 = A0
  L1 = L1(L2)
  L1 = L1 ~= true
  return L1
end
CO_IS_NOT_HERO = L0
function L0(A0)
  local L1, L2
  L1 = IsClone
  L2 = A0
  return L1(L2)
end
CO_IS_CLONE = L0
function L0(A0)
  local L1, L2
  L1 = IsClone
  L2 = A0
  L1 = L1(L2)
  L1 = L1 ~= true
  return L1
end
CO_IS_NOT_CLONE = L0
function L0(A0)
  local L1, L2
  L1 = IsMelee
  L2 = A0
  return L1(L2)
end
CO_IS_MELEE = L0
function L0(A0)
  local L1, L2
  L1 = IsMelee
  L2 = A0
  L1 = L1(L2)
  L1 = L1 ~= true
  return L1
end
CO_IS_RANGED = L0
function L0(A0)
  local L1
  L1 = math
  L1 = L1.random
  L1 = L1()
  L1 = A0 > L1
  return L1
end
CO_RANDOM_CHANCE_LESS_THAN = L0
function L0(A0)
  local L1, L2
  L1 = IsTurretAI
  L2 = A0
  return L1(L2)
end
CO_IS_TYPE_TURRET = L0
function L0(A0)
  local L1, L2
  L1 = IsTurretAI
  L2 = A0
  L1 = L1(L2)
  L1 = L1 ~= true
  return L1
end
CO_IS_NOT_TURRET = L0
function L0(A0)
  local L1, L2
  L1 = IsDead
  L2 = A0
  return L1(L2)
end
CO_IS_DEAD = L0
function L0(A0)
  local L1, L2
  L1 = IsDead
  L2 = A0
  L1 = L1(L2)
  L1 = L1 ~= true
  return L1
end
CO_IS_NOT_DEAD = L0
function L0(A0, A1)
  local L2, L3, L4
  L2 = BBIsTargetInFrontOfMe
  L3 = A0
  L4 = A1
  return L2(L3, L4)
end
CO_IS_TARGET_IN_FRONT_OF_ME = L0
function L0(A0, A1)
  local L2, L3, L4
  L2 = BBIsTargetBehindMe
  L3 = A0
  L4 = A1
  return L2(L3, L4)
end
CO_IS_TARGET_BEHIND_ME = L0
function L0(A0, A1, A2)
  local L3, L4, L5, L6, L7, L8, L9
  L3 = GetTable
  L4 = A0
  L5 = A1.Src1VarTable
  L6 = false
  L3 = L3(L4, L5, L6)
  L4 = GetTable
  L5 = A0
  L6 = A1.Src2VarTable
  L7 = false
  L4 = L4(L5, L6, L7)
  L5 = false
  L6 = nil
  if L3 ~= nil then
    L7 = A1.Src1Var
    if L7 ~= nil then
      L7 = A1.Src1Var
      L6 = L3[L7]
  end
  else
    L6 = A1.Value1
  end
  if L4 ~= nil then
    L7 = A1.Src2Var
    if L7 ~= nil then
      L7 = A1.CompareOp
      L8 = L6
      L9 = A1.Src2Var
      L9 = L4[L9]
      L7 = L7(L8, L9)
      L5 = L7
  end
  else
    L7 = A1.CompareOp
    L8 = L6
    L9 = A1.Value2
    L7 = L7(L8, L9)
    L5 = L7
  end
  if L5 then
    L7 = ExecuteBuildingBlocks
    L8 = A2
    L9 = A0
    L7(L8, L9)
    A0.LastIfSucceeded = true
  else
    A0.LastIfSucceeded = false
  end
end
BBIf = L0
function L0(A0, A1, A2)
  local L3, L4, L5
  L3 = A0.LastIfSucceeded
  if L3 == false then
    L3 = ExecuteBuildingBlocks
    L4 = A2
    L5 = A0
    L3(L4, L5)
    A0.LastIfSucceeded = true
  end
end
BBElse = L0
function L0(A0, A1, A2)
  local L3, L4, L5, L6, L7, L8, L9
  L3 = A0.LastIfSucceeded
  if L3 == false then
    L3 = GetTable
    L4 = A0
    L5 = A1.Src1VarTable
    L6 = false
    L3 = L3(L4, L5, L6)
    L4 = GetTable
    L5 = A0
    L6 = A1.Src2VarTable
    L7 = false
    L4 = L4(L5, L6, L7)
    L5 = false
    L6 = nil
    if L3 ~= nil then
      L7 = A1.Src1Var
      if L7 ~= nil then
        L7 = A1.Src1Var
        L6 = L3[L7]
    end
    else
      L6 = A1.Value1
    end
    if L4 ~= nil then
      L7 = A1.Src2Var
      if L7 ~= nil then
        L7 = A1.CompareOp
        L8 = L6
        L9 = A1.Src2Var
        L9 = L4[L9]
        L7 = L7(L8, L9)
        L5 = L7
    end
    else
      L7 = A1.CompareOp
      L8 = L6
      L9 = A1.Value2
      L7 = L7(L8, L9)
      L5 = L7
    end
    if L5 then
      L7 = ExecuteBuildingBlocks
      L8 = A2
      L9 = A0
      L7(L8, L9)
      A0.LastIfSucceeded = true
    else
      A0.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0
function L0(A0, A1, A2)
  local L3, L4, L5, L6, L7
  L4 = A1.TargetVar
  if L4 ~= nil then
    L4 = A1.TargetVar
    L3 = A0[L4]
  else
    L3 = A0.Target
  end
  L4 = HasBuffOfType
  L5 = L3
  L6 = A1.BuffType
  L4 = L4(L5, L6)
  if L4 then
    L5 = ExecuteBuildingBlocks
    L6 = A2
    L7 = A0
    L5(L6, L7)
    A0.LastIfSucceeded = true
  else
    A0.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0
function L0(A0, A1, A2)
  local L3, L4, L5, L6, L7, L8
  L5 = A1.OwnerVar
  if L5 ~= nil then
    L5 = A1.OwnerVar
    L3 = A0[L5]
  else
    L3 = A0.Owner
  end
  L5 = A1.AttackerVar
  if L5 ~= nil then
    L5 = A1.AttackerVar
    L4 = A0[L5]
  else
    L4 = A0.Attacker
  end
  L5 = SpellBuffCount
  L6 = L3
  L7 = A1.BuffName
  L8 = L4
  L5 = L5(L6, L7, L8)
  L5 = 0 < L5
  if L5 then
    L6 = ExecuteBuildingBlocks
    L7 = A2
    L8 = A0
    L6(L7, L8)
    A0.LastIfSucceeded = true
  else
    A0.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0
function L0(A0, A1)
  A0.___BreakExecution___ = true
end
BBBreakExecution = L0
function L0(A0, A1, A2)
  local L3, L4, L5, L6, L7, L8
  L5 = A1.OwnerVar
  if L5 ~= nil then
    L5 = A1.OwnerVar
    L3 = A0[L5]
  else
    L3 = A0.Owner
  end
  L5 = A1.CasterVar
  if L5 ~= nil then
    L5 = A1.CasterVar
    L4 = A0[L5]
  else
    L4 = A0.Caster
  end
  L5 = SpellBuffCount
  L6 = L3
  L7 = A1.BuffName
  L8 = L4
  L5 = L5(L6, L7, L8)
  L5 = L5 <= 0
  if L5 then
    L6 = ExecuteBuildingBlocks
    L7 = A2
    L8 = A0
    L6(L7, L8)
    A0.LastIfSucceeded = true
  else
    A0.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0
function L0(A0, A1, A2)
  local L3, L4, L5, L6, L7, L8
  L5 = A1.OwnerVar
  if L5 ~= nil then
    L5 = A1.OwnerVar
    L3 = A0[L5]
  else
    L3 = A0.Owner
  end
  L5 = HasPARType
  L6 = L3
  L7 = A1.PARType
  L5 = L5(L6, L7)
  if L5 then
    L6 = ExecuteBuildingBlocks
    L7 = A2
    L8 = A0
    L6(L7, L8)
    A0.LastIfSucceeded = true
  else
    A0.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0
function L0(A0, A1, A2)
  local L3, L4, L5, L6, L7, L8
  L5 = A1.OwnerVar
  if L5 ~= nil then
    L5 = A1.OwnerVar
    L3 = A0[L5]
  else
    L3 = A0.Owner
  end
  L5 = HasPARType
  L6 = L3
  L7 = A1.PARType
  L5 = L5(L6, L7)
  L5 = not L5
  if L5 then
    L6 = ExecuteBuildingBlocks
    L7 = A2
    L8 = A0
    L6(L7, L8)
    A0.LastIfSucceeded = true
  else
    A0.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0
function L0(A0, A1, A2)
  local L3, L4, L5, L6, L7, L8, L9, L10
  L3 = GetTable
  L4 = A0
  L5 = A1.Src1VarTable
  L6 = false
  L3 = L3(L4, L5, L6)
  L4 = GetTable
  L5 = A0
  L6 = A1.Src2VarTable
  L7 = false
  L4 = L4(L5, L6, L7)
  L5 = true
  while L5 do
    L6 = false
    L7 = nil
    if L3 ~= nil then
      L8 = A1.Src1Var
      if L8 ~= nil then
        L8 = A1.Src1Var
        L7 = L3[L8]
    end
    else
      L7 = A1.Value1
    end
    if L4 ~= nil then
      L8 = A1.Src2Var
      if L8 ~= nil then
        L8 = A1.CompareOp
        L9 = L7
        L10 = A1.Src2Var
        L10 = L4[L10]
        L8 = L8(L9, L10)
        L6 = L8
    end
    else
      L8 = A1.CompareOp
      L9 = L7
      L10 = A1.Value2
      L8 = L8(L9, L10)
      L6 = L8
    end
    if L6 then
      L8 = ExecuteBuildingBlocks
      L9 = A2
      L10 = A0
      L8(L9, L10)
    else
      L5 = false
    end
  end
end
BBWhile = L0
function L0(A0, A1)
  local L2
  L2 = A0 * A1
  return L2
end
MO_MULTIPLY = L0
function L0(A0, A1)
  local L2
  L2 = A0 + A1
  return L2
end
MO_ADD = L0
function L0(A0, A1)
  local L2
  L2 = A0 - A1
  return L2
end
MO_SUBTRACT = L0
function L0(A0, A1)
  local L2
  L2 = A0 / A1
  return L2
end
MO_DIVIDE = L0
function L0(A0, A1)
  if A0 < A1 then
    return A0
  else
    return A1
  end
end
MO_MIN = L0
function L0(A0, A1)
  if A1 < A0 then
    return A0
  else
    return A1
  end
end
MO_MAX = L0
function L0(A0, A1)
  local L2
  L2 = A0 % A1
  return L2
end
MO_MODULO = L0
function L0(A0)
  local L1, L2
  L1 = math
  L1 = L1.floor
  L2 = A0 + 0.5
  return L1(L2)
end
MO_ROUND = L0
function L0(A0)
  local L1, L2
  L1 = math
  L1 = L1.ceil
  L2 = A0
  return L1(L2)
end
MO_ROUNDUP = L0
function L0(A0)
  local L1, L2
  L1 = math
  L1 = L1.floor
  L2 = A0
  return L1(L2)
end
MO_ROUNDDOWN = L0
function L0(A0)
  local L1, L2, L3
  L1 = math
  L1 = L1.sin
  L2 = math
  L2 = L2.rad
  L3 = A0
  L2, L3 = L2(L3)
  return L1(L2, L3)
end
MO_SIN = L0
function L0(A0)
  local L1, L2, L3
  L1 = math
  L1 = L1.cos
  L2 = math
  L2 = L2.rad
  L3 = A0
  L2, L3 = L2(L3)
  return L1(L2, L3)
end
MO_COSINE = L0
function L0(A0)
  local L1, L2, L3
  L1 = math
  L1 = L1.tan
  L2 = math
  L2 = L2.rad
  L3 = A0
  L2, L3 = L2(L3)
  return L1(L2, L3)
end
MO_TANGENT = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6, L7, L8
  L2 = GetMathNumber
  L3 = A0
  L4 = A1.Src1VarTable
  L5 = A1.Src1Var
  L6 = A1.Src1Value
  L2 = L2(L3, L4, L5, L6)
  L3 = GetMathNumber
  L4 = A0
  L5 = A1.Src2VarTable
  L6 = A1.Src2Var
  L7 = A1.Src2Value
  L3 = L3(L4, L5, L6, L7)
  L4 = GetTable
  L5 = A0
  L6 = A1.DestVarTable
  L4 = L4(L5, L6)
  L5 = A1.DestVar
  L6 = A1.MathOp
  L7 = L2
  L8 = L3
  L6 = L6(L7, L8)
  L4[L5] = L6
end
BBMath = L0
function L0(A0, A1, A2, A3)
  local L4, L5, L6
  if A2 ~= nil then
    L4 = GetTable
    L5 = A0
    L6 = A1
    L4 = L4(L5, L6)
    L5 = L4[A2]
    if L5 ~= nil then
      return L5
    end
  end
  return A3
end
GetMathNumber = L0
function L0(A0, A1)
  local L2, L3, L4
  L2 = type
  L3 = A1
  L2 = L2(L3)
  if L2 == "number" then
    return A1
  elseif L2 == "function" then
    L3 = A1
    L4 = A0
    return L3(L4)
  elseif L2 == "string" then
    L3 = A0[A1]
    return L3
  end
end
GetNumber = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6, L7, L8
  L2 = A0.InstanceVars
  L3 = L2.InterpDelta
  if L3 == nil then
    L3 = A1.Amount
    L4 = A1.AmountVar
    if L4 ~= nil then
      L4 = GetTable
      L5 = A0
      L6 = A1.AmountVarTable
      L4 = L4(L5, L6)
      L5 = A1.AmountVar
      L3 = L4[L5]
    end
    L4 = GetPosition
    L5 = A1.TargetVar
    L5 = A0[L5]
    L4 = L4(L5)
    L2.KnockBackStart = L4
    L4 = GetNormalizedPositionDelta
    L5 = A1.TargetVar
    L5 = A0[L5]
    L6 = A1.AttackerVar
    L6 = A0[L6]
    L7 = true
    L4 = L4(L5, L6, L7)
    L5 = {}
    L6 = L4.x
    L6 = L6 * L3
    L5.x = L6
    L5.y = 0
    L6 = L4.z
    L6 = L6 * L3
    L5.z = L6
    L2.InterpDelta = L5
    L5 = GetTime
    L5 = L5()
    L2.StartTime = L5
    L5 = A1.KnockBackDuration
    L2.KnockBackDuration = L5
  end
  L3 = A1.TargetVar
  L3 = A0[L3]
  L4 = GetTime
  L4 = L4()
  L5 = L2.StartTime
  L4 = L4 - L5
  L5 = L2.KnockBackDuration
  L4 = L4 / L5
  L5 = {}
  L6 = L2.KnockBackStart
  L6 = L6.x
  L7 = L2.InterpDelta
  L7 = L7.x
  L7 = L7 * L4
  L6 = L6 + L7
  L5.x = L6
  L6 = L2.KnockBackStart
  L6 = L6.y
  L5.y = L6
  L6 = L2.KnockBackStart
  L6 = L6.z
  L7 = L2.InterpDelta
  L7 = L7.z
  L7 = L7 * L4
  L6 = L6 + L7
  L5.z = L6
  L6 = SetPosition
  L7 = L3
  L8 = L5
  L6(L7, L8)
end
BBKnockback = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6
  L2 = 0
  L3 = A1.Delta
  if L3 ~= nil then
    L3 = A1.Delta
    L2 = L2 + L3
  end
  L3 = A1.DeltaByLevel
  if L3 ~= nil then
    L3 = A0.Level
    if L3 ~= nil then
      L3 = A1.DeltaByLevel
      L4 = A0.Level
      L3 = L3[L4]
      L2 = L2 + L3
    end
  end
  L3 = A1.DeltaVar
  if L3 ~= nil then
    L3 = GetTable
    L4 = A0
    L5 = A1.DeltaVarTable
    L6 = true
    L3 = L3(L4, L5, L6)
    L4 = A1.DeltaVar
    L4 = L3[L4]
    L2 = L2 + L4
  end
  L3 = A1.TargetVar
  if L3 ~= nil then
    L4 = A1.Stat
    L5 = L2
    L6 = A0[L3]
    L4(L5, L6)
  else
    L4 = A1.Stat
    L5 = L2
    L4(L5)
  end
end
BBIncStat = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6
  L2 = 0
  L3 = A1.Delta
  if L3 ~= nil then
    L3 = A1.Delta
    L2 = L2 + L3
  end
  L3 = A1.DeltaByLevel
  if L3 ~= nil then
    L3 = A0.Level
    if L3 ~= nil then
      L3 = A1.DeltaByLevel
      L4 = A0.Level
      L3 = L3[L4]
      L2 = L2 + L3
    end
  end
  L3 = A1.DeltaVar
  if L3 ~= nil then
    L3 = GetTable
    L4 = A0
    L5 = A1.DeltaVarTable
    L6 = true
    L3 = L3(L4, L5, L6)
    L4 = A1.DeltaVar
    L4 = L3[L4]
    L2 = L2 + L4
  end
  L3 = A1.TargetVar
  if L3 ~= nil then
    L4 = A1.Stat
    L5 = L2
    L6 = A0[L3]
    L4(L5, L6)
  else
    L4 = A1.Stat
    L5 = L2
    L4(L5)
  end
end
BBIncPermanentStat = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6
  L2 = GetTable
  L3 = A0
  L4 = A1.DestVarTable
  L5 = false
  L2 = L2(L3, L4, L5)
  L3 = A1.TargetVar
  if L3 ~= nil then
    L4 = A1.DestVar
    L5 = A1.Stat
    L6 = A0[L3]
    L5 = L5(L6)
    L2[L4] = L5
  else
    L4 = A1.DestVar
    L5 = A1.Stat
    L5 = L5()
    L2[L4] = L5
  end
end
BBGetStat = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6
  L2 = GetTable
  L3 = A0
  L4 = A1.DestVarTable
  L5 = false
  L2 = L2(L3, L4, L5)
  L3 = A1.TargetVar
  if L3 ~= nil then
    L4 = A1.DestVar
    L5 = GetLevel
    L6 = A0[L3]
    L5 = L5(L6)
    L2[L4] = L5
  else
    L4 = A1.DestVar
    L5 = GetLevel
    L5 = L5()
    L2[L4] = L5
  end
end
BBGetLevel = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6
  L2 = GetTable
  L3 = A0
  L4 = A1.DestVarTable
  L5 = false
  L2 = L2(L3, L4, L5)
  L3 = A1.TargetVar
  if L3 ~= nil then
    L4 = A1.DestVar
    L5 = GetArmor
    L6 = A0[L3]
    L5 = L5(L6)
    L2[L4] = L5
  else
    L4 = A1.DestVar
    L5 = GetArmor
    L5 = L5()
    L2[L4] = L5
  end
end
BBGetArmor = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6
  L2 = GetTable
  L3 = A0
  L4 = A1.DestVarTable
  L5 = false
  L2 = L2(L3, L4, L5)
  L3 = A1.TargetVar
  if L3 ~= nil then
    L4 = A1.DestVar
    L5 = GetSpellBlock
    L6 = A0[L3]
    L5 = L5(L6)
    L2[L4] = L5
  else
    L4 = A1.DestVar
    L5 = GetSpellBlock
    L5 = L5()
    L2[L4] = L5
  end
end
BBGetSpellBlock = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6
  L2 = GetTable
  L3 = A0
  L4 = A1.DestVarTable
  L5 = false
  L2 = L2(L3, L4, L5)
  L3 = A1.TargetVar
  if L3 ~= nil then
    L4 = A1.DestVar
    L5 = GetTeamID
    L6 = A0[L3]
    L5 = L5(L6)
    L2[L4] = L5
  else
    L4 = A1.DestVar
    L5 = GetTeamID
    L5 = L5()
    L2[L4] = L5
  end
end
BBGetTeamID = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6
  L2 = GetTable
  L3 = A0
  L4 = A1.DestVarTable
  L5 = false
  L2 = L2(L3, L4, L5)
  L3 = A1.TargetVar
  if L3 ~= nil then
    L4 = A1.DestVar
    L5 = GetUnitSkinName
    L6 = A0[L3]
    L5 = L5(L6)
    L2[L4] = L5
  end
end
BBGetUnitSkinName = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6
  L2 = GetTable
  L3 = A0
  L4 = A1.DestVarTable
  L5 = false
  L2 = L2(L3, L4, L5)
  L3 = A1.TargetVar
  if L3 ~= nil then
    L4 = A1.DestVar
    L5 = GetTotalAttackDamage
    L6 = A0[L3]
    L5 = L5(L6)
    L2[L4] = L5
  else
    L4 = A1.DestVar
    L5 = GetTotalAttackDamage
    L5 = L5()
    L2[L4] = L5
  end
end
BBGetTotalAttackDamage = L0
function L0(A0, A1)
  local L2, L3, L4, L5
  L2 = GetTable
  L3 = A0
  L4 = A1.DestVarTable
  L5 = true
  L2 = L2(L3, L4, L5)
  L3 = A1.DestVar
  L4 = A1.Status
  L5 = A1.TargetVar
  L5 = A0[L5]
  L4 = L4(L5)
  L2[L3] = L4
end
BBGetStatus = L0
function L0(A0, A1)
  local L2, L3, L4, L5
  L2 = GetTable
  L3 = A0
  L4 = A1.DestVarTable
  L5 = true
  L2 = L2(L3, L4, L5)
  L3 = A1.DestVar
  L4 = A1.Info
  L5 = A1.TargetVar
  L5 = A0[L5]
  L4 = L4(L5)
  L2[L3] = L4
end
BBGetCastInfo = L0
function L0(A0, A1)
  local L2, L3
  L2 = SetCanCastWhileDisabled
  L3 = A1.CanCast
  L2(L3)
end
BBSetCanCastWhileDisabled = L0
function L0(A0, A1, A2)
  local L3, L4, L5, L6, L7, L8, L9, L10
  L3 = GetTable
  L4 = A0
  L5 = A1.TrackTimeVarTable
  L6 = false
  L3 = L3(L4, L5, L6)
  L4 = GetTime
  L4 = L4()
  L5 = A1.ExecuteImmediately
  L6 = A1.TimeBetweenExecutions
  L7 = A1.TickTimeVar
  if L7 ~= nil then
    L7 = GetTable
    L8 = A0
    L9 = A1.TickTimeVarTable
    L10 = false
    L7 = L7(L8, L9, L10)
    L8 = A1.TickTimeVar
    L8 = L7[L8]
    if L8 ~= nil then
      L6 = L8
    end
  end
  L7 = A1.TrackTimeVar
  L7 = L3[L7]
  if L7 == nil then
    L7 = A1.TrackTimeVar
    L3[L7] = L4
    if L5 == true then
      L7 = ExecuteBuildingBlocks
      L8 = A2
      L9 = A0
      L7(L8, L9)
    end
  end
  L7 = A1.TrackTimeVar
  L7 = L3[L7]
  L7 = L7 + L6
  if L4 >= L7 then
    L7 = A1.TrackTimeVar
    L8 = A1.TrackTimeVar
    L8 = L3[L8]
    L8 = L8 + L6
    L3[L7] = L8
    L7 = ExecuteBuildingBlocks
    L8 = A2
    L9 = A0
    L7(L8, L9)
  end
end
BBExecutePeriodically = L0
function L0(A0, A1, A2)
  local L3, L4, L5, L6
  L3 = GetTable
  L4 = A0
  L5 = A1.TrackTimeVarTable
  L6 = false
  L3 = L3(L4, L5, L6)
  L4 = A1.TrackTimeVar
  L3[L4] = nil
end
BBExecutePeriodicallyReset = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6
  L2 = A1.SrcValue
  L3 = A1.SrcVar
  if L3 ~= nil then
    L3 = GetTable
    L4 = A0
    L5 = A1.SrcTable
    L6 = true
    L3 = L3(L4, L5, L6)
    L4 = A1.SrcVar
    L2 = L3[L4]
  end
  L3 = A1.Status
  L4 = A1.TargetVar
  L4 = A0[L4]
  L5 = L2
  L3(L4, L5)
end
BBSetStatus = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6
  L2 = A1.ToAlert
  L3 = GetTable
  L4 = A0
  L5 = A1.SrcVarTable
  L6 = false
  L3 = L3(L4, L5, L6)
  if L3 ~= nil then
    L4 = A1.SrcVar
    if L4 ~= nil then
      L4 = L2
      L5 = A1.SrcVar
      L5 = L3[L5]
      L2 = L4 .. L5
    end
  end
  L4 = _ALERT
  L5 = L2
  L4(L5)
end
BBAlert = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6, L7
  L2 = A1.ToSay
  L3 = GetTable
  L4 = A0
  L5 = A1.SrcVarTable
  L6 = false
  L3 = L3(L4, L5, L6)
  if L3 ~= nil then
    L4 = A1.SrcVar
    if L4 ~= nil then
      L4 = L2
      L5 = tostring
      L6 = A1.SrcVar
      L6 = L3[L6]
      L5 = L5(L6)
      L2 = L4 .. L5
    end
  end
  L4 = nil
  L5 = A1.OwnerVar
  if L5 ~= nil then
    L5 = A1.OwnerVar
    L4 = A0[L5]
  else
    L4 = A0.Owner
  end
  L5 = Say
  L6 = L4
  L7 = L2
  L5(L6, L7)
end
BBSay = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6, L7
  L2 = A1.ToSay
  L3 = GetTable
  L4 = A0
  L5 = A1.SrcVarTable
  L6 = false
  L3 = L3(L4, L5, L6)
  if L3 ~= nil then
    L4 = A1.SrcVar
    if L4 ~= nil then
      L4 = L2
      L5 = tostring
      L6 = A1.SrcVar
      L6 = L3[L6]
      L5 = L5(L6)
      L2 = L4 .. L5
    end
  end
  L4 = nil
  L5 = A1.OwnerVar
  if L5 ~= nil then
    L5 = A1.OwnerVar
    L4 = A0[L5]
  else
    L4 = A0.Owner
  end
  L5 = Say
  L6 = L4
  L7 = L2
  L5(L6, L7)
end
BBDebugSay = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6
  L2 = GetTable
  L3 = A0
  L4 = A1.DestVarTable
  L5 = true
  L2 = L2(L3, L4, L5)
  L3 = A1.DestVar
  L4 = BBLuaGetGold
  L5 = A0
  L6 = A1
  L4 = L4(L5, L6)
  L2[L3] = L4
end
BBGetGold = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6, L7, L8, L9
  L2 = GetTable
  L3 = A0
  L4 = A1.XVarTable
  L5 = true
  L2 = L2(L3, L4, L5)
  L3 = A1.XVar
  if L3 ~= nil and L2 ~= nil then
    L3 = A1.XVar
    L3 = L2[L3]
    Xloc = L3
  else
    L3 = A1.X
    Xloc = L3
  end
  L3 = GetTable
  L4 = A0
  L5 = A1.YVarTable
  L6 = true
  L3 = L3(L4, L5, L6)
  L4 = A1.YVar
  if L4 ~= nil and L3 ~= nil then
    L4 = A1.YVar
    L4 = L3[L4]
    Yloc = L4
  else
    L4 = A1.Y
    Yloc = L4
  end
  L4 = GetTable
  L5 = A0
  L6 = A1.ZVarTable
  L7 = true
  L4 = L4(L5, L6, L7)
  L5 = A1.ZVar
  if L5 ~= nil and L4 ~= nil then
    L5 = A1.ZVar
    L5 = L4[L5]
    Zloc = L5
  else
    L5 = A1.Z
    Zloc = L5
  end
  L5 = A1.OwnerVar
  L6 = Make3DPoint
  L7 = Xloc
  L8 = Yloc
  L9 = Zloc
  L6 = L6(L7, L8, L9)
  A0.position = L6
  A1.OwnerVar = L5
  A1.CastPositionName = "position"
  L7 = BBTeleportToPosition
  L8 = A0
  L9 = A1
  L7(L8, L9)
end
BBTeleportToPoint = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6, L7
  L2 = GetTable
  L3 = A0
  L4 = A1.CenterTable
  L5 = false
  L2 = L2(L3, L4, L5)
  L3 = DefUpdateAura
  L4 = A1.CenterVar
  L4 = L2[L4]
  L5 = A1.Range
  L6 = A1.UnitScan
  L7 = A1.BuffName
  L3(L4, L5, L6, L7)
end
BBDefUpdateAura = L0
function L0(A0, A1)
  local L2, L3, L4, L5
  L2 = GetTable
  L3 = A0
  L4 = A1.TargetTable
  L5 = false
  L2 = L2(L3, L4, L5)
  L3 = ReincarnateNonDeadHero
  L4 = A1.TargetVar
  L4 = L2[L4]
  L3(L4)
end
BBReincarnateHero = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6
  L2 = GetTable
  L3 = A0
  L4 = A1.DestVarTable
  L5 = true
  L2 = L2(L3, L4, L5)
  L3 = A1.DestVar
  L4 = A1.Function
  L5 = A1.OwnerVar
  L5 = A0[L5]
  L6 = A1.PARType
  L4 = L4(L5, L6)
  L2[L3] = L4
end
BBGetPAROrHealth = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6, L7, L8
  L2 = A1.WhomToOrderVar
  L2 = A0[L2]
  L3 = A1.TargetOfOrderVar
  L3 = A0[L3]
  L4 = IssueOrder
  L5 = L2
  L6 = A1.Order
  L7 = GetPosition
  L8 = L3
  L7 = L7(L8)
  L8 = L3
  L4(L5, L6, L7, L8)
end
BBIssueOrder = L0
function L0(A0, A1)
  local L2, L3
  L2 = SetSpellCastRange
  L3 = A1.NewRange
  L2(L3)
end
BBSetSpellCastRange = L0
function L0(A0, A1)
  local L2, L3, L4, L5
  L2 = GetTable
  L3 = A0
  L4 = A1.DestVarTable
  L5 = true
  L2 = L2(L3, L4, L5)
  L3 = A1.DestVar
  L4 = GetTime
  L4 = L4()
  L2[L3] = L4
end
BBGetTime = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6, L7, L8
  L2 = A1.ObjectVar1
  L2 = A0[L2]
  L3 = A1.ObjectVar2
  L3 = A0[L3]
  L4 = GetTable
  L5 = A0
  L6 = A1.DestVarTable
  L7 = true
  L4 = L4(L5, L6, L7)
  L5 = A1.DestVar
  L6 = DistanceBetweenObjects
  L7 = L2
  L8 = L3
  L6 = L6(L7, L8)
  L4[L5] = L6
end
BBDistanceBetweenObjects = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6, L7, L8, L9
  L2 = A1.ObjectVar
  L2 = A0[L2]
  L3 = GetTable
  L4 = A0
  L5 = A1.PointVarTable
  L6 = true
  L3 = L3(L4, L5, L6)
  L4 = A1.PointVar
  L4 = L3[L4]
  L5 = GetTable
  L6 = A0
  L7 = A1.DestVarTable
  L8 = true
  L5 = L5(L6, L7, L8)
  L6 = A1.DestVar
  L7 = DistanceBetweenObjectAndPoint
  L8 = L2
  L9 = L4
  L7 = L7(L8, L9)
  L5[L6] = L7
end
BBDistanceBetweenObjectAndPoint = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6, L7, L8, L9, L10
  L2 = GetTable
  L3 = A0
  L4 = A1.Point1VarTable
  L5 = true
  L2 = L2(L3, L4, L5)
  L3 = A1.Point1Var
  L3 = L2[L3]
  L4 = GetTable
  L5 = A0
  L6 = A1.Point2VarTable
  L7 = true
  L4 = L4(L5, L6, L7)
  L5 = A1.Point2Var
  L5 = L4[L5]
  L6 = GetTable
  L7 = A0
  L8 = A1.DestVarTable
  L9 = true
  L6 = L6(L7, L8, L9)
  L7 = A1.DestVar
  L8 = DistanceBetweenPoints
  L9 = L3
  L10 = L5
  L8 = L8(L9, L10)
  L6[L7] = L8
end
BBDistanceBetweenPoints = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6, L7, L8, L9
  L2 = A1.TargetVar
  L2 = A0[L2]
  L3 = A1.CasterVar
  L3 = A0[L3]
  L4 = GetTable
  L5 = A0
  L6 = A1.DestVarTable
  L7 = true
  L4 = L4(L5, L6, L7)
  L5 = A1.DestVar
  L6 = SpellBuffCount
  L7 = L2
  L8 = A1.BuffName
  L9 = L3
  L6 = L6(L7, L8, L9)
  L4[L5] = L6
end
BBGetBuffCountFromCaster = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6, L7, L8
  L2 = A1.TargetVar
  L2 = A0[L2]
  L3 = GetTable
  L4 = A0
  L5 = A1.DestVarTable
  L6 = true
  L3 = L3(L4, L5, L6)
  L4 = A1.DestVar
  L5 = SpellBuffCount
  L6 = L2
  L7 = A1.BuffName
  L8 = caster
  L5 = L5(L6, L7, L8)
  L3[L4] = L5
end
BBGetBuffCountFromAll = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6
  L2 = GetTable
  L3 = A0
  L4 = A1.ScaleVarTable
  L5 = false
  L2 = L2(L3, L4, L5)
  L3 = nil
  L4 = A1.OwnerVar
  if L4 ~= nil then
    L4 = A1.OwnerVar
    L3 = A0[L4]
  else
    L3 = A0.Owner
  end
  L4 = A1.ScaleVar
  if L4 ~= nil then
    L4 = A1.ScaleVarTable
    if L4 ~= nil then
      L4 = SetScaleSkinCoef
      L5 = A1.ScaleVar
      L5 = L2[L5]
      L6 = L3
      L4(L5, L6)
  end
  else
    L4 = SetScaleSkinCoef
    L5 = A1.Scale
    L6 = L3
    L4(L5, L6)
  end
end
BBSetScaleSkinCoef = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6, L7, L8, L9
  L2 = SpellBuffAdd
  L3 = A1.TargetVar
  L3 = A0[L3]
  L4 = A1.TargetVar
  L4 = A0[L4]
  L5 = "SpellShieldMarker"
  L6 = 0
  L7 = 1
  L8 = 37037
  L9 = A0.NextBuffVars
  L2(L3, L4, L5, L6, L7, L8, L9)
end
BBBreakSpellShields = L0
function L0(A0, A1, A2)
  local L3, L4, L5, L6, L7, L8
  L3 = A1.TargetVar
  L3 = A0[L3]
  L4 = A1.NumStacks
  L5 = A1.NumStacks
  if L5 == 0 then
    L5 = SpellBuffCount
    L6 = L3
    L7 = A1.BuffName
    L8 = caster
    L5 = L5(L6, L7, L8)
    L4 = L5
  end
  while 0 < L4 do
    L5 = SpellBuffRemove
    L6 = L3
    L7 = A1.BuffName
    L8 = A1.AttackerVar
    L8 = A0[L8]
    L5(L6, L7, L8)
    L4 = L4 - 1
  end
end
BBSpellBuffRemoveStacks = L0
