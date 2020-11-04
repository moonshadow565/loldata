local L0_0, L1_1
L0_0 = -1
gCurrentBuildingBlockNumber = L0_0
L0_0 = ""
gCurrentBuildingBlockString = L0_0
function L0_0(A0_2, A1_3)
  local L2_4, L3_5, L4_6, L5_7
  if A0_2 ~= nil then
    L2_4 = gCurrentBuildingBlockString
    A1_3.___BreakExecution___ = false
    for _FORV_6_ = 1, #A0_2 do
      if false == A1_3.___BreakExecution___ then
        gCurrentBuildingBlockNumber = _FORV_6_
        gCurrentBuildingBlockString = L2_4 .. "." .. gCurrentBuildingBlockNumber
        gCurrentBuildingBlock = A0_2[gCurrentBuildingBlockNumber]
        gCurrentBuildingBlock.Function(A1_3, gCurrentBuildingBlock.Params, gCurrentBuildingBlock.SubBlocks)
      end
    end
    gCurrentBuildingBlockString = L2_4
    gCurrentBuildingBlockNumber = L3_5
    gCurrentBuildingBlock = L3_5
  end
end
ExecuteBuildingBlocks = L0_0
function L0_0()
  local L0_8, L1_9
end
BBRequireVar = L0_0
function L0_0(A0_10, A1_11, A2_12)
  if A1_11.IsConditionTrue(A0_10) then
    ExecuteBuildingBlocks(A2_12, A0_10)
  end
end
BBConditionallyExecute = L0_0
function L0_0(A0_13, A1_14, A2_15)
  local L3_16
  if A1_14 ~= nil then
    L3_16 = A0_13[A1_14]
    if L3_16 == nil and A2_15 then
      A0_13[A1_14] = {}
      return A0_13[A1_14]
    end
  end
  if L3_16 == nil then
    L3_16 = A0_13
  end
  return L3_16
end
GetTable = L0_0
function L0_0(A0_17, A1_18)
  if A0_17.Level ~= nil and A1_18.SrcValueByLevel ~= nil then
    GetTable(A0_17, A1_18.DestVarTable, true)[A1_18.DestVar] = A1_18.SrcValueByLevel[A0_17.Level]
  elseif A1_18.SrcVar ~= nil and GetTable(A0_17, A1_18.SrcVarTable, false) ~= nil then
    GetTable(A0_17, A1_18.DestVarTable, true)[A1_18.DestVar] = GetTable(A0_17, A1_18.SrcVarTable, false)[A1_18.SrcVar]
  else
    GetTable(A0_17, A1_18.DestVarTable, true)[A1_18.DestVar] = A1_18.SrcValue
  end
end
BBSetVarInTable = L0_0
function L0_0(A0_19, A1_20)
  local L2_21, L3_22
  L2_21 = GetTable
  L3_22 = A0_19
  L2_21 = L2_21(L3_22, A1_20.DestVarTable, true)
  L3_22 = nil
  if A1_20.SpellSlotVar ~= nil and GetTable(A0_19, A1_20.SpellSlotVarTable, false) ~= nil then
    L3_22 = GetTable(A0_19, A1_20.SpellSlotVarTable, false)[A1_20.SpellSlotVar]
  else
    L3_22 = A1_20.SpellSlotValue
  end
  L2_21[A1_20.DestVar] = A1_20.Function(A0_19[A1_20.OwnerVar], L3_22, A1_20.SpellbookType, A1_20.SlotType)
end
BBGetSlotSpellInfo = L0_0
function L0_0(A0_23, A1_24)
  local L2_25, L3_26, L4_27
  L2_25 = GetTable
  L3_26 = A0_23
  L4_27 = A1_24.SrcVarTable
  L2_25 = L2_25(L3_26, L4_27, false)
  L3_26 = nil
  L4_27 = A1_24.SrcVar
  if L4_27 ~= nil and L2_25 ~= nil then
    L4_27 = A1_24.SrcVar
    L3_26 = L2_25[L4_27]
  else
    L3_26 = A1_24.SrcValue
  end
  L4_27 = nil
  if A1_24.SpellSlotVar ~= nil and GetTable(A0_23, A1_24.SpellSlotVarTable, false) ~= nil then
    L4_27 = GetTable(A0_23, A1_24.SpellSlotVarTable, false)[A1_24.SpellSlotVar]
  else
    L4_27 = A1_24.SpellSlotValue
  end
  SetSlotSpellCooldownTime(A0_23[A1_24.OwnerVar], L4_27, A1_24.SpellbookType, A1_24.SlotType, L3_26)
end
BBSetSlotSpellCooldownTime = L0_0
function L0_0(A0_28, A1_29)
  if A0_28.Level ~= nil and A1_29.SrcValueByLevel ~= nil then
    A0_28.ReturnValue = A1_29.SrcValueByLevel[A0_28.Level]
  elseif A1_29.SrcVar ~= nil and GetTable(A0_28, A1_29.SrcVarTable, false) ~= nil then
    A0_28.ReturnValue = GetTable(A0_28, A1_29.SrcVarTable, false)[A1_29.SrcVar]
  else
    A0_28.ReturnValue = A1_29.SrcValue
  end
end
BBSetReturnValue = L0_0
function L0_0(A0_30, A1_31)
  if type(A0_30) == "string" and type(A1_31) == "string" then
    A0_30 = string.lower(A0_30)
    A1_31 = string.lower(A1_31)
  end
  return A0_30 == A1_31
end
CO_EQUAL = L0_0
function L0_0(A0_32, A1_33)
  if type(A0_32) == "string" and type(A1_33) == "string" then
    A0_32 = string.lower(A0_32)
    A1_33 = string.lower(A1_33)
  end
  return A0_32 ~= A1_33
end
CO_NOT_EQUAL = L0_0
function L0_0(A0_34, A1_35)
  local L2_36
  L2_36 = A0_34 < A1_35
  return L2_36
end
CO_LESS_THAN = L0_0
function L0_0(A0_37, A1_38)
  local L2_39
  L2_39 = A1_38 < A0_37
  return L2_39
end
CO_GREATER_THAN = L0_0
function L0_0(A0_40, A1_41)
  local L2_42
  L2_42 = A0_40 <= A1_41
  return L2_42
end
CO_LESS_THAN_OR_EQUAL = L0_0
function L0_0(A0_43, A1_44)
  local L2_45
  L2_45 = A1_44 <= A0_43
  return L2_45
end
CO_GREATER_THAN_OR_EQUAL = L0_0
function L0_0(A0_46, A1_47)
  return GetTeamID(A0_46) == GetTeamID(A1_47)
end
CO_SAME_TEAM = L0_0
function L0_0(A0_48, A1_49)
  return GetTeamID(A0_48) ~= GetTeamID(A1_49)
end
CO_DIFFERENT_TEAM = L0_0
function L0_0(A0_50, A1_51)
  return GetSourceType() == A1_51 or GetSourceType() == A0_50
end
CO_DAMAGE_SOURCETYPE_IS = L0_0
function L0_0(A0_52, A1_53)
  return GetSourceType() ~= A1_53 and GetSourceType() ~= A0_52
end
CO_DAMAGE_SOURCETYPE_IS_NOT = L0_0
function L0_0(A0_54)
  return IsObjectAI(A0_54)
end
CO_IS_TYPE_AI = L0_0
function L0_0(A0_55)
  return IsObjectAI(A0_55) ~= true
end
CO_IS_NOT_AI = L0_0
function L0_0(A0_56)
  return IsObjectHero(A0_56)
end
CO_IS_TYPE_HERO = L0_0
function L0_0(A0_57)
  return IsObjectHero(A0_57) ~= true
end
CO_IS_NOT_HERO = L0_0
function L0_0(A0_58)
  return IsClone(A0_58)
end
CO_IS_CLONE = L0_0
function L0_0(A0_59)
  return IsClone(A0_59) ~= true
end
CO_IS_NOT_CLONE = L0_0
function L0_0(A0_60)
  return IsMelee(A0_60)
end
CO_IS_MELEE = L0_0
function L0_0(A0_61)
  return IsMelee(A0_61) ~= true
end
CO_IS_RANGED = L0_0
function L0_0(A0_62)
  return A0_62 > math.random()
end
CO_RANDOM_CHANCE_LESS_THAN = L0_0
function L0_0(A0_63)
  return IsTurretAI(A0_63)
end
CO_IS_TYPE_TURRET = L0_0
function L0_0(A0_64)
  return IsTurretAI(A0_64) ~= true
end
CO_IS_NOT_TURRET = L0_0
function L0_0(A0_65)
  return IsDead(A0_65)
end
CO_IS_DEAD = L0_0
function L0_0(A0_66)
  return IsDead(A0_66) ~= true
end
CO_IS_NOT_DEAD = L0_0
function L0_0(A0_67)
  return IsDeadOrZombie(A0_67)
end
CO_IS_DEAD_OR_ZOMBIE = L0_0
function L0_0(A0_68, A1_69)
  return BBIsTargetInFrontOfMe(A0_68, A1_69)
end
CO_IS_TARGET_IN_FRONT_OF_ME = L0_0
function L0_0(A0_70, A1_71)
  return BBIsTargetBehindMe(A0_70, A1_71)
end
CO_IS_TARGET_BEHIND_ME = L0_0
function L0_0(A0_72, A1_73, A2_74)
  local L3_75, L4_76, L5_77, L6_78
  L3_75 = GetTable
  L4_76 = A0_72
  L5_77 = A1_73.Src1VarTable
  L6_78 = false
  L3_75 = L3_75(L4_76, L5_77, L6_78)
  L4_76 = GetTable
  L5_77 = A0_72
  L6_78 = A1_73.Src2VarTable
  L4_76 = L4_76(L5_77, L6_78, false)
  L5_77 = false
  L6_78 = nil
  if L3_75 ~= nil and A1_73.Src1Var ~= nil then
    L6_78 = L3_75[A1_73.Src1Var]
  else
    L6_78 = A1_73.Value1
  end
  if L4_76 ~= nil and A1_73.Src2Var ~= nil then
    L5_77 = A1_73.CompareOp(L6_78, L4_76[A1_73.Src2Var])
  else
    L5_77 = A1_73.CompareOp(L6_78, A1_73.Value2)
  end
  if L5_77 then
    ExecuteBuildingBlocks(A2_74, A0_72)
    A0_72.LastIfSucceeded = true
  else
    A0_72.LastIfSucceeded = false
  end
end
BBIf = L0_0
function L0_0(A0_79, A1_80, A2_81)
  if A0_79.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_81, A0_79)
    A0_79.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_82, A1_83, A2_84)
  local L3_85, L4_86, L5_87, L6_88
  L3_85 = A0_82.LastIfSucceeded
  if L3_85 == false then
    L3_85 = GetTable
    L4_86 = A0_82
    L5_87 = A1_83.Src1VarTable
    L6_88 = false
    L3_85 = L3_85(L4_86, L5_87, L6_88)
    L4_86 = GetTable
    L5_87 = A0_82
    L6_88 = A1_83.Src2VarTable
    L4_86 = L4_86(L5_87, L6_88, false)
    L5_87 = false
    L6_88 = nil
    if L3_85 ~= nil and A1_83.Src1Var ~= nil then
      L6_88 = L3_85[A1_83.Src1Var]
    else
      L6_88 = A1_83.Value1
    end
    if L4_86 ~= nil and A1_83.Src2Var ~= nil then
      L5_87 = A1_83.CompareOp(L6_88, L4_86[A1_83.Src2Var])
    else
      L5_87 = A1_83.CompareOp(L6_88, A1_83.Value2)
    end
    if L5_87 then
      ExecuteBuildingBlocks(A2_84, A0_82)
      A0_82.LastIfSucceeded = true
    else
      A0_82.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_89, A1_90, A2_91)
  local L3_92
  if A1_90.TargetVar ~= nil then
    L3_92 = A0_89[A1_90.TargetVar]
  else
    L3_92 = A0_89.Target
  end
  if HasBuffOfType(L3_92, A1_90.BuffType) then
    ExecuteBuildingBlocks(A2_91, A0_89)
    A0_89.LastIfSucceeded = true
  else
    A0_89.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_93, A1_94, A2_95)
  local L3_96, L4_97
  if A1_94.OwnerVar ~= nil then
    L3_96 = A0_93[A1_94.OwnerVar]
  else
    L3_96 = A0_93.Owner
  end
  if A1_94.AttackerVar ~= nil then
    L4_97 = A0_93[A1_94.AttackerVar]
  else
    L4_97 = A0_93.Attacker
  end
  if SpellBuffCount(L3_96, A1_94.BuffName, L4_97) > 0 then
    ExecuteBuildingBlocks(A2_95, A0_93)
    A0_93.LastIfSucceeded = true
  else
    A0_93.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_98, A1_99)
  A0_98.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_100, A1_101, A2_102)
  local L3_103, L4_104
  if A1_101.OwnerVar ~= nil then
    L3_103 = A0_100[A1_101.OwnerVar]
  else
    L3_103 = A0_100.Owner
  end
  if A1_101.CasterVar ~= nil then
    L4_104 = A0_100[A1_101.CasterVar]
  else
    L4_104 = A0_100.Caster
  end
  if SpellBuffCount(L3_103, A1_101.BuffName, L4_104) <= 0 then
    ExecuteBuildingBlocks(A2_102, A0_100)
    A0_100.LastIfSucceeded = true
  else
    A0_100.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_105, A1_106, A2_107)
  local L3_108, L4_109
  if A1_106.OwnerVar ~= nil then
    L3_108 = A0_105[A1_106.OwnerVar]
  else
    L3_108 = A0_105.Owner
  end
  if HasPARType(L3_108, A1_106.PARType) then
    ExecuteBuildingBlocks(A2_107, A0_105)
    A0_105.LastIfSucceeded = true
  else
    A0_105.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_110, A1_111, A2_112)
  local L3_113, L4_114
  if A1_111.OwnerVar ~= nil then
    L3_113 = A0_110[A1_111.OwnerVar]
  else
    L3_113 = A0_110.Owner
  end
  if not HasPARType(L3_113, A1_111.PARType) then
    ExecuteBuildingBlocks(A2_112, A0_110)
    A0_110.LastIfSucceeded = true
  else
    A0_110.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_115, A1_116, A2_117)
  local L3_118, L4_119, L5_120, L6_121, L7_122
  L3_118 = GetTable
  L4_119 = A0_115
  L5_120 = A1_116.Src1VarTable
  L6_121 = false
  L3_118 = L3_118(L4_119, L5_120, L6_121)
  L4_119 = GetTable
  L5_120 = A0_115
  L6_121 = A1_116.Src2VarTable
  L7_122 = false
  L4_119 = L4_119(L5_120, L6_121, L7_122)
  L5_120 = true
  while L5_120 do
    L6_121 = false
    L7_122 = nil
    if L3_118 ~= nil and A1_116.Src1Var ~= nil then
      L7_122 = L3_118[A1_116.Src1Var]
    else
      L7_122 = A1_116.Value1
    end
    if L4_119 ~= nil and A1_116.Src2Var ~= nil then
      L6_121 = A1_116.CompareOp(L7_122, L4_119[A1_116.Src2Var])
    else
      L6_121 = A1_116.CompareOp(L7_122, A1_116.Value2)
    end
    if L6_121 then
      ExecuteBuildingBlocks(A2_117, A0_115)
    else
      L5_120 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_123, A1_124)
  return A0_123 * A1_124
end
MO_MULTIPLY = L0_0
function L0_0(A0_125, A1_126)
  return A0_125 + A1_126
end
MO_ADD = L0_0
function L0_0(A0_127, A1_128)
  return A0_127 - A1_128
end
MO_SUBTRACT = L0_0
function L0_0(A0_129, A1_130)
  return A0_129 / A1_130
end
MO_DIVIDE = L0_0
function L0_0(A0_131, A1_132)
  if A0_131 < A1_132 then
    return A0_131
  else
    return A1_132
  end
end
MO_MIN = L0_0
function L0_0(A0_133, A1_134)
  if A1_134 < A0_133 then
    return A0_133
  else
    return A1_134
  end
end
MO_MAX = L0_0
function L0_0(A0_135, A1_136)
  return A0_135 % A1_136
end
MO_MODULO = L0_0
function L0_0(A0_137)
  return math.floor(A0_137 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_138)
  return math.ceil(A0_138)
end
MO_ROUNDUP = L0_0
function L0_0(A0_139)
  return math.floor(A0_139)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_140)
  return math.sin(math.rad(A0_140))
end
MO_SIN = L0_0
function L0_0(A0_141)
  return math.cos(math.rad(A0_141))
end
MO_COSINE = L0_0
function L0_0(A0_142)
  return math.tan(math.rad(A0_142))
end
MO_TANGENT = L0_0
function L0_0(A0_143, A1_144)
  local L2_145
  L2_145 = A0_143 and A1_144
  return L2_145
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_146, A1_147)
  local L2_148
  L2_148 = A0_146 or A1_147
  return L2_148
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_149)
  local L1_150
  L1_150 = not A0_149
  return L1_150
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_151, A1_152)
  local L2_153, L3_154
  L2_153 = GetMathNumber
  L3_154 = A0_151
  L2_153 = L2_153(L3_154, A1_152.Src1VarTable, A1_152.Src1Var, A1_152.Src1Value)
  L3_154 = GetMathNumber
  L3_154 = L3_154(A0_151, A1_152.Src2VarTable, A1_152.Src2Var, A1_152.Src2Value)
  GetTable(A0_151, A1_152.DestVarTable)[A1_152.DestVar] = A1_152.MathOp(L2_153, L3_154)
end
BBMath = L0_0
function L0_0(A0_155, A1_156, A2_157, A3_158)
  if A2_157 ~= nil and GetTable(A0_155, A1_156)[A2_157] ~= nil then
    return GetTable(A0_155, A1_156)[A2_157]
  end
  return A3_158
end
GetMathNumber = L0_0
function L0_0(A0_159, A1_160)
  if type(A1_160) == "number" then
    return A1_160
  elseif type(A1_160) == "function" then
    return A1_160(A0_159)
  elseif type(A1_160) == "string" then
    return A0_159[A1_160]
  end
end
GetNumber = L0_0
function L0_0(A0_161, A1_162)
  return VectorAdd(A0_161, A1_162)
end
VEC_ADD = L0_0
function L0_0(A0_163, A1_164)
  return VectorSubtract(A0_163, A1_164)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_165, A1_166)
  return VectorScalarMultiply(A0_165, A1_166)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_167, A1_168)
  return VectorScalarDivide(A0_167, A1_168)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_169, A1_170)
  return VectorRotateY(A0_169, A1_170)
end
VEC_ROTATE = L0_0
function L0_0(A0_171, A1_172)
  BBMath(A0_171, A1_172)
end
BBVectorMath = L0_0
function L0_0(A0_173, A1_174)
  local L2_175, L3_176, L4_177, L5_178
  L2_175 = A0_173.InstanceVars
  L3_176 = L2_175.InterpDelta
  if L3_176 == nil then
    L3_176 = A1_174.Amount
    L4_177 = A1_174.AmountVar
    if L4_177 ~= nil then
      L4_177 = GetTable
      L5_178 = A0_173
      L4_177 = L4_177(L5_178, A1_174.AmountVarTable)
      L5_178 = A1_174.AmountVar
      L3_176 = L4_177[L5_178]
    end
    L4_177 = GetPosition
    L5_178 = A1_174.TargetVar
    L5_178 = A0_173[L5_178]
    L4_177 = L4_177(L5_178)
    L2_175.KnockBackStart = L4_177
    L4_177 = GetNormalizedPositionDelta
    L5_178 = A1_174.TargetVar
    L5_178 = A0_173[L5_178]
    L4_177 = L4_177(L5_178, A0_173[A1_174.AttackerVar], true)
    L5_178 = {}
    L5_178.x = L4_177.x * L3_176
    L5_178.y = 0
    L5_178.z = L4_177.z * L3_176
    L2_175.InterpDelta = L5_178
    L5_178 = GetTime
    L5_178 = L5_178()
    L2_175.StartTime = L5_178
    L5_178 = A1_174.KnockBackDuration
    L2_175.KnockBackDuration = L5_178
  end
  L3_176 = A1_174.TargetVar
  L3_176 = A0_173[L3_176]
  L4_177 = GetTime
  L4_177 = L4_177()
  L5_178 = L2_175.StartTime
  L4_177 = L4_177 - L5_178
  L5_178 = L2_175.KnockBackDuration
  L4_177 = L4_177 / L5_178
  L5_178 = {}
  L5_178.x = L2_175.KnockBackStart.x + L2_175.InterpDelta.x * L4_177
  L5_178.y = L2_175.KnockBackStart.y
  L5_178.z = L2_175.KnockBackStart.z + L2_175.InterpDelta.z * L4_177
  SetPosition(L3_176, L5_178)
end
BBKnockback = L0_0
function L0_0(A0_179, A1_180)
  local L2_181
  L2_181 = 0
  if A1_180.Delta ~= nil then
    L2_181 = L2_181 + A1_180.Delta
  end
  if A1_180.DeltaByLevel ~= nil and A0_179.Level ~= nil then
    L2_181 = L2_181 + A1_180.DeltaByLevel[A0_179.Level]
  end
  if A1_180.DeltaVar ~= nil then
    L2_181 = L2_181 + GetTable(A0_179, A1_180.DeltaVarTable, true)[A1_180.DeltaVar]
  end
  if A1_180.TargetVar ~= nil then
    A1_180.Stat(L2_181, A0_179[A1_180.TargetVar])
  else
    A1_180.Stat(L2_181)
  end
end
BBIncStat = L0_0
function L0_0(A0_182, A1_183)
  local L2_184
  L2_184 = 0
  if A1_183.Delta ~= nil then
    L2_184 = L2_184 + A1_183.Delta
  end
  if A1_183.DeltaByLevel ~= nil and A0_182.Level ~= nil then
    L2_184 = L2_184 + A1_183.DeltaByLevel[A0_182.Level]
  end
  if A1_183.DeltaVar ~= nil then
    L2_184 = L2_184 + GetTable(A0_182, A1_183.DeltaVarTable, true)[A1_183.DeltaVar]
  end
  if A1_183.TargetVar ~= nil then
    A1_183.Stat(L2_184, A0_182[A1_183.TargetVar])
  else
    A1_183.Stat(L2_184)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_185, A1_186)
  if A1_186.TargetVar ~= nil then
    GetTable(A0_185, A1_186.DestVarTable, false)[A1_186.DestVar] = A1_186.Stat(A0_185[A1_186.TargetVar])
  else
    GetTable(A0_185, A1_186.DestVarTable, false)[A1_186.DestVar] = A1_186.Stat()
  end
end
BBGetStat = L0_0
function L0_0(A0_187, A1_188)
  if A1_188.TargetVar ~= nil then
    GetTable(A0_187, A1_188.DestVarTable, false)[A1_188.DestVar] = GetLevel(A0_187[A1_188.TargetVar])
  else
    GetTable(A0_187, A1_188.DestVarTable, false)[A1_188.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_189, A1_190)
  if A1_190.TargetVar ~= nil then
    GetTable(A0_189, A1_190.DestVarTable, false)[A1_190.DestVar] = GetArmor(A0_189[A1_190.TargetVar])
  else
    GetTable(A0_189, A1_190.DestVarTable, false)[A1_190.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_191, A1_192)
  if A1_192.TargetVar ~= nil then
    GetTable(A0_191, A1_192.DestVarTable, false)[A1_192.DestVar] = GetSpellBlock(A0_191[A1_192.TargetVar])
  else
    GetTable(A0_191, A1_192.DestVarTable, false)[A1_192.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_193, A1_194)
  if A1_194.TargetVar ~= nil then
    GetTable(A0_193, A1_194.DestVarTable, false)[A1_194.DestVar] = GetTeamID(A0_193[A1_194.TargetVar])
  else
    GetTable(A0_193, A1_194.DestVarTable, false)[A1_194.DestVar] = GetTeamID()
  end
end
BBGetTeamID = L0_0
function L0_0(A0_195, A1_196)
  if A1_196.TargetVar ~= nil then
    GetTable(A0_195, A1_196.DestVarTable, false)[A1_196.DestVar] = GetUnitSkinName(A0_195[A1_196.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_197, A1_198)
  if A1_198.TargetVar ~= nil then
    GetTable(A0_197, A1_198.DestVarTable, false)[A1_198.DestVar] = GetTotalAttackDamage(A0_197[A1_198.TargetVar])
  else
    GetTable(A0_197, A1_198.DestVarTable, false)[A1_198.DestVar] = GetTotalAttackDamage()
  end
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_199, A1_200)
  GetTable(A0_199, A1_200.DestVarTable, true)[A1_200.DestVar] = A1_200.Status(A0_199[A1_200.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_201, A1_202)
  GetTable(A0_201, A1_202.DestVarTable, true)[A1_202.DestVar] = A1_202.Info(A0_201[A1_202.TargetVar])
end
BBGetCastInfo = L0_0
function L0_0(A0_203, A1_204)
  SetCanCastWhileDisabled(A1_204.CanCast)
end
BBSetCanCastWhileDisabled = L0_0
function L0_0(A0_205, A1_206, A2_207)
  local L3_208, L4_209, L5_210, L6_211
  L3_208 = GetTable
  L4_209 = A0_205
  L5_210 = A1_206.TrackTimeVarTable
  L6_211 = false
  L3_208 = L3_208(L4_209, L5_210, L6_211)
  L4_209 = GetTime
  L4_209 = L4_209()
  L5_210 = A1_206.ExecuteImmediately
  L6_211 = A1_206.TimeBetweenExecutions
  if A1_206.TickTimeVar ~= nil and GetTable(A0_205, A1_206.TickTimeVarTable, false)[A1_206.TickTimeVar] ~= nil then
    L6_211 = GetTable(A0_205, A1_206.TickTimeVarTable, false)[A1_206.TickTimeVar]
  end
  if L3_208[A1_206.TrackTimeVar] == nil then
    L3_208[A1_206.TrackTimeVar] = L4_209
    if L5_210 == true then
      ExecuteBuildingBlocks(A2_207, A0_205)
    end
  end
  if L4_209 >= L3_208[A1_206.TrackTimeVar] + L6_211 then
    L3_208[A1_206.TrackTimeVar] = L3_208[A1_206.TrackTimeVar] + L6_211
    ExecuteBuildingBlocks(A2_207, A0_205)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_212, A1_213, A2_214)
  GetTable(A0_212, A1_213.TrackTimeVarTable, false)[A1_213.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_215, A1_216)
  local L2_217
  L2_217 = A1_216.SrcValue
  if A1_216.SrcVar ~= nil then
    L2_217 = GetTable(A0_215, A1_216.SrcTable, true)[A1_216.SrcVar]
  end
  A1_216.Status(A0_215[A1_216.TargetVar], L2_217)
end
BBSetStatus = L0_0
function L0_0(A0_218, A1_219)
  local L2_220
  L2_220 = A1_219.ToAlert
  if GetTable(A0_218, A1_219.SrcVarTable, false) ~= nil and A1_219.SrcVar ~= nil then
    L2_220 = L2_220 .. GetTable(A0_218, A1_219.SrcVarTable, false)[A1_219.SrcVar]
  end
  _ALERT(L2_220)
end
BBAlert = L0_0
function L0_0(A0_221, A1_222)
  local L2_223, L3_224, L4_225
  L2_223 = A1_222.ToSay
  L3_224 = GetTable
  L4_225 = A0_221
  L3_224 = L3_224(L4_225, A1_222.SrcVarTable, false)
  if L3_224 ~= nil then
    L4_225 = A1_222.SrcVar
    if L4_225 ~= nil then
      L4_225 = L2_223
      L2_223 = L4_225 .. tostring(L3_224[A1_222.SrcVar])
    end
  end
  L4_225 = nil
  if A1_222.OwnerVar ~= nil then
    L4_225 = A0_221[A1_222.OwnerVar]
  else
    L4_225 = A0_221.Owner
  end
  if A1_222.TextType == nil then
    A1_222.TextType = 0
  end
  Say(L4_225, L2_223, A1_222.TextType)
end
BBSay = L0_0
function L0_0(A0_226, A1_227)
  local L2_228, L3_229, L4_230
  L2_228 = A1_227.ToSay
  L3_229 = GetTable
  L4_230 = A0_226
  L3_229 = L3_229(L4_230, A1_227.SrcVarTable, false)
  if L3_229 ~= nil then
    L4_230 = A1_227.SrcVar
    if L4_230 ~= nil then
      L4_230 = L2_228
      L2_228 = L4_230 .. tostring(L3_229[A1_227.SrcVar])
    end
  end
  L4_230 = nil
  if A1_227.OwnerVar ~= nil then
    L4_230 = A0_226[A1_227.OwnerVar]
  else
    L4_230 = A0_226.Owner
  end
  if A1_227.TextType == nil then
    A1_227.TextType = 0
  end
  Say(L4_230, L2_228, A1_227.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_231, A1_232)
  GetTable(A0_231, A1_232.DestVarTable, true)[A1_232.DestVar] = BBLuaGetGold(A0_231, A1_232)
end
BBGetGold = L0_0
function L0_0(A0_233, A1_234)
  SpellBuffAdd(A0_233[A1_234.OwnerVar], A0_233[A1_234.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_233.NextBuffVars)
  BBTeleportToPositionHelper(A0_233, A1_234)
end
BBTeleportToPosition = L0_0
function L0_0(A0_235, A1_236)
  if A1_236.XVar ~= nil and GetTable(A0_235, A1_236.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_235, A1_236.XVarTable, true)[A1_236.XVar]
  else
    Xloc = A1_236.X
  end
  if A1_236.YVar ~= nil and GetTable(A0_235, A1_236.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_235, A1_236.YVarTable, true)[A1_236.YVar]
  else
    Yloc = A1_236.Y
  end
  if A1_236.ZVar ~= nil and GetTable(A0_235, A1_236.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_235, A1_236.ZVarTable, true)[A1_236.ZVar]
  else
    Zloc = A1_236.Z
  end
  A1_236.OwnerVar, A0_235.position = A1_236.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_236.CastPositionName = "position"
  BBTeleportToPosition(A0_235, A1_236)
end
BBTeleportToPoint = L0_0
function L0_0(A0_237, A1_238)
  DefUpdateAura(GetTable(A0_237, A1_238.CenterTable, false)[A1_238.CenterVar], A1_238.Range, A1_238.UnitScan, A1_238.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_239, A1_240)
  ReincarnateNonDeadHero(GetTable(A0_239, A1_240.TargetTable, false)[A1_240.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_241, A1_242)
  GetTable(A0_241, A1_242.DestVarTable, true)[A1_242.DestVar] = A1_242.Function(A0_241[A1_242.OwnerVar], A1_242.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_243, A1_244)
  local L2_245, L3_246, L4_247, L5_248
  L2_245 = A1_244.WhomToOrderVar
  L2_245 = A0_243[L2_245]
  L3_246 = A1_244.TargetOfOrderVar
  L3_246 = A0_243[L3_246]
  L4_247 = GetTable
  L5_248 = A0_243
  L4_247 = L4_247(L5_248, A1_244.SrcVarTable, false)
  L5_248 = nil
  if A1_244.SrcVar ~= nil and L4_247 ~= nil then
    L5_248 = L4_247[A1_244.SrcVar]
  else
    L5_248 = GetPosition(L3_246)
  end
  if L3_246 == nil then
    L3_246 = L2_245
  end
  IssueOrder(L2_245, A1_244.Order, L5_248, L3_246)
end
BBIssueOrder = L0_0
function L0_0(A0_249, A1_250)
  SetSpellCastRange(A1_250.NewRange)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_251, A1_252)
  GetTable(A0_251, A1_252.DestVarTable, true)[A1_252.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_253, A1_254)
  local L2_255, L3_256
  L2_255 = A1_254.ObjectVar1
  L2_255 = A0_253[L2_255]
  L3_256 = A1_254.ObjectVar2
  L3_256 = A0_253[L3_256]
  GetTable(A0_253, A1_254.DestVarTable, true)[A1_254.DestVar] = DistanceBetweenObjects(L2_255, L3_256)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_257, A1_258)
  local L2_259, L3_260, L4_261
  L2_259 = A1_258.ObjectVar
  L2_259 = A0_257[L2_259]
  L3_260 = GetTable
  L4_261 = A0_257
  L3_260 = L3_260(L4_261, A1_258.PointVarTable, true)
  L4_261 = A1_258.PointVar
  L4_261 = L3_260[L4_261]
  GetTable(A0_257, A1_258.DestVarTable, true)[A1_258.DestVar] = DistanceBetweenObjectAndPoint(L2_259, L4_261)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_262, A1_263)
  local L2_264, L3_265, L4_266, L5_267
  L2_264 = GetTable
  L3_265 = A0_262
  L4_266 = A1_263.Point1VarTable
  L5_267 = true
  L2_264 = L2_264(L3_265, L4_266, L5_267)
  L3_265 = A1_263.Point1Var
  L3_265 = L2_264[L3_265]
  L4_266 = GetTable
  L5_267 = A0_262
  L4_266 = L4_266(L5_267, A1_263.Point2VarTable, true)
  L5_267 = A1_263.Point2Var
  L5_267 = L4_266[L5_267]
  GetTable(A0_262, A1_263.DestVarTable, true)[A1_263.DestVar] = DistanceBetweenPoints(L3_265, L5_267)
end
BBDistanceBetweenPoints = L0_0
function L0_0(A0_268, A1_269)
  local L2_270, L3_271
  L2_270 = A1_269.TargetVar
  L2_270 = A0_268[L2_270]
  L3_271 = A1_269.CasterVar
  L3_271 = A0_268[L3_271]
  GetTable(A0_268, A1_269.DestVarTable, true)[A1_269.DestVar] = SpellBuffCount(L2_270, A1_269.BuffName, L3_271)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_272, A1_273)
  local L2_274
  L2_274 = A1_273.TargetVar
  L2_274 = A0_272[L2_274]
  GetTable(A0_272, A1_273.DestVarTable, true)[A1_273.DestVar] = SpellBuffCount(L2_274, A1_273.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_275, A1_276)
  local L2_277, L3_278
  L2_277 = GetTable
  L3_278 = A0_275
  L2_277 = L2_277(L3_278, A1_276.ScaleVarTable, false)
  L3_278 = nil
  if A1_276.OwnerVar ~= nil then
    L3_278 = A0_275[A1_276.OwnerVar]
  else
    L3_278 = A0_275.Owner
  end
  if A1_276.ScaleVar ~= nil and A1_276.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_277[A1_276.ScaleVar], L3_278)
  else
    SetScaleSkinCoef(A1_276.Scale, L3_278)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_279, A1_280)
  SpellBuffAdd(A0_279[A1_280.TargetVar], A0_279[A1_280.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_279.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_281, A1_282, A2_283)
  local L3_284, L4_285
  L3_284 = A1_282.TargetVar
  L3_284 = A0_281[L3_284]
  L4_285 = A1_282.NumStacks
  if A1_282.NumStacks == 0 then
    L4_285 = SpellBuffCount(L3_284, A1_282.BuffName, caster)
  end
  while L4_285 > 0 do
    SpellBuffRemove(L3_284, A1_282.BuffName, A0_281[A1_282.AttackerVar])
    L4_285 = L4_285 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_286, A1_287, A2_288)
  if A0_286.EmoteId == A1_287.EmoteId then
    ExecuteBuildingBlocks(A2_288, A0_286)
    A0_286.LastIfSucceeded = true
  else
    A0_286.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_289, A1_290, A2_291)
  if A0_289.EmoteId ~= A1_290.EmoteId then
    ExecuteBuildingBlocks(A2_291, A0_289)
    A0_289.LastIfSucceeded = true
  else
    A0_289.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
