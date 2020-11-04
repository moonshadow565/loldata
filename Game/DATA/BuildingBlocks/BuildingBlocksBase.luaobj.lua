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
function L0_0(A0_72)
  return IsWard(A0_72)
end
CO_IS_WARD = L0_0
function L0_0(A0_73)
  return IsStructure(A0_73)
end
CO_IS_STRUCTURE = L0_0
function L0_0(A0_74)
  return IsStructure(A0_74) ~= true
end
CO_IS_NOT_STRUCTURE = L0_0
function L0_0(A0_75, A1_76, A2_77)
  local L3_78, L4_79, L5_80, L6_81
  L3_78 = GetTable
  L4_79 = A0_75
  L5_80 = A1_76.Src1VarTable
  L6_81 = false
  L3_78 = L3_78(L4_79, L5_80, L6_81)
  L4_79 = GetTable
  L5_80 = A0_75
  L6_81 = A1_76.Src2VarTable
  L4_79 = L4_79(L5_80, L6_81, false)
  L5_80 = false
  L6_81 = nil
  if L3_78 ~= nil and A1_76.Src1Var ~= nil then
    L6_81 = L3_78[A1_76.Src1Var]
  else
    L6_81 = A1_76.Value1
  end
  if L4_79 ~= nil and A1_76.Src2Var ~= nil then
    L5_80 = A1_76.CompareOp(L6_81, L4_79[A1_76.Src2Var])
  else
    L5_80 = A1_76.CompareOp(L6_81, A1_76.Value2)
  end
  if L5_80 then
    ExecuteBuildingBlocks(A2_77, A0_75)
    A0_75.LastIfSucceeded = true
  else
    A0_75.LastIfSucceeded = false
  end
end
BBIf = L0_0
function L0_0(A0_82, A1_83, A2_84)
  if A0_82.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_84, A0_82)
    A0_82.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_85, A1_86, A2_87)
  local L3_88, L4_89, L5_90, L6_91
  L3_88 = A0_85.LastIfSucceeded
  if L3_88 == false then
    L3_88 = GetTable
    L4_89 = A0_85
    L5_90 = A1_86.Src1VarTable
    L6_91 = false
    L3_88 = L3_88(L4_89, L5_90, L6_91)
    L4_89 = GetTable
    L5_90 = A0_85
    L6_91 = A1_86.Src2VarTable
    L4_89 = L4_89(L5_90, L6_91, false)
    L5_90 = false
    L6_91 = nil
    if L3_88 ~= nil and A1_86.Src1Var ~= nil then
      L6_91 = L3_88[A1_86.Src1Var]
    else
      L6_91 = A1_86.Value1
    end
    if L4_89 ~= nil and A1_86.Src2Var ~= nil then
      L5_90 = A1_86.CompareOp(L6_91, L4_89[A1_86.Src2Var])
    else
      L5_90 = A1_86.CompareOp(L6_91, A1_86.Value2)
    end
    if L5_90 then
      ExecuteBuildingBlocks(A2_87, A0_85)
      A0_85.LastIfSucceeded = true
    else
      A0_85.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_92, A1_93, A2_94)
  local L3_95
  if A1_93.TargetVar ~= nil then
    L3_95 = A0_92[A1_93.TargetVar]
  else
    L3_95 = A0_92.Target
  end
  if HasBuffOfType(L3_95, A1_93.BuffType) then
    ExecuteBuildingBlocks(A2_94, A0_92)
    A0_92.LastIfSucceeded = true
  else
    A0_92.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_96, A1_97, A2_98)
  local L3_99, L4_100
  if A1_97.OwnerVar ~= nil then
    L3_99 = A0_96[A1_97.OwnerVar]
  else
    L3_99 = A0_96.Owner
  end
  if A1_97.AttackerVar ~= nil then
    L4_100 = A0_96[A1_97.AttackerVar]
  else
    L4_100 = A0_96.Attacker
  end
  if SpellBuffCount(L3_99, A1_97.BuffName, L4_100) > 0 then
    ExecuteBuildingBlocks(A2_98, A0_96)
    A0_96.LastIfSucceeded = true
  else
    A0_96.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_101, A1_102)
  A0_101.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_103, A1_104, A2_105)
  local L3_106, L4_107
  if A1_104.OwnerVar ~= nil then
    L3_106 = A0_103[A1_104.OwnerVar]
  else
    L3_106 = A0_103.Owner
  end
  if A1_104.CasterVar ~= nil then
    L4_107 = A0_103[A1_104.CasterVar]
  else
    L4_107 = A0_103.Caster
  end
  if SpellBuffCount(L3_106, A1_104.BuffName, L4_107) <= 0 then
    ExecuteBuildingBlocks(A2_105, A0_103)
    A0_103.LastIfSucceeded = true
  else
    A0_103.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_108, A1_109, A2_110)
  local L3_111, L4_112
  if A1_109.OwnerVar ~= nil then
    L3_111 = A0_108[A1_109.OwnerVar]
  else
    L3_111 = A0_108.Owner
  end
  if HasPARType(L3_111, A1_109.PARType) then
    ExecuteBuildingBlocks(A2_110, A0_108)
    A0_108.LastIfSucceeded = true
  else
    A0_108.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_113, A1_114, A2_115)
  local L3_116, L4_117
  if A1_114.OwnerVar ~= nil then
    L3_116 = A0_113[A1_114.OwnerVar]
  else
    L3_116 = A0_113.Owner
  end
  if not HasPARType(L3_116, A1_114.PARType) then
    ExecuteBuildingBlocks(A2_115, A0_113)
    A0_113.LastIfSucceeded = true
  else
    A0_113.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_118, A1_119, A2_120)
  local L3_121, L4_122, L5_123, L6_124, L7_125
  L3_121 = GetTable
  L4_122 = A0_118
  L5_123 = A1_119.Src1VarTable
  L6_124 = false
  L3_121 = L3_121(L4_122, L5_123, L6_124)
  L4_122 = GetTable
  L5_123 = A0_118
  L6_124 = A1_119.Src2VarTable
  L7_125 = false
  L4_122 = L4_122(L5_123, L6_124, L7_125)
  L5_123 = true
  while L5_123 do
    L6_124 = false
    L7_125 = nil
    if L3_121 ~= nil and A1_119.Src1Var ~= nil then
      L7_125 = L3_121[A1_119.Src1Var]
    else
      L7_125 = A1_119.Value1
    end
    if L4_122 ~= nil and A1_119.Src2Var ~= nil then
      L6_124 = A1_119.CompareOp(L7_125, L4_122[A1_119.Src2Var])
    else
      L6_124 = A1_119.CompareOp(L7_125, A1_119.Value2)
    end
    if L6_124 then
      ExecuteBuildingBlocks(A2_120, A0_118)
    else
      L5_123 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_126, A1_127)
  return A0_126 * A1_127
end
MO_MULTIPLY = L0_0
function L0_0(A0_128, A1_129)
  return A0_128 + A1_129
end
MO_ADD = L0_0
function L0_0(A0_130, A1_131)
  return A0_130 - A1_131
end
MO_SUBTRACT = L0_0
function L0_0(A0_132, A1_133)
  return A0_132 / A1_133
end
MO_DIVIDE = L0_0
function L0_0(A0_134, A1_135)
  if A0_134 < A1_135 then
    return A0_134
  else
    return A1_135
  end
end
MO_MIN = L0_0
function L0_0(A0_136, A1_137)
  if A1_137 < A0_136 then
    return A0_136
  else
    return A1_137
  end
end
MO_MAX = L0_0
function L0_0(A0_138, A1_139)
  return A0_138 % A1_139
end
MO_MODULO = L0_0
function L0_0(A0_140)
  return math.floor(A0_140 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_141)
  return math.ceil(A0_141)
end
MO_ROUNDUP = L0_0
function L0_0(A0_142)
  return math.floor(A0_142)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_143)
  return math.sin(math.rad(A0_143))
end
MO_SIN = L0_0
function L0_0(A0_144)
  return math.cos(math.rad(A0_144))
end
MO_COSINE = L0_0
function L0_0(A0_145)
  return math.tan(math.rad(A0_145))
end
MO_TANGENT = L0_0
function L0_0(A0_146)
  return math.deg(math.asin(A0_146))
end
MO_ASIN = L0_0
function L0_0(A0_147)
  return math.deg(math.acos(A0_147))
end
MO_ACOS = L0_0
function L0_0(A0_148)
  return math.deg(math.atan(A0_148))
end
MO_ATAN = L0_0
function L0_0(A0_149, A1_150)
  return math.pow(A0_149, A1_150)
end
MO_POW = L0_0
function L0_0(A0_151)
  return math.sqrt(A0_151)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_152, A1_153)
  local L2_154
  L2_154 = A0_152 and A1_153
  return L2_154
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_155, A1_156)
  local L2_157
  L2_157 = A0_155 or A1_156
  return L2_157
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_158)
  local L1_159
  L1_159 = not A0_158
  return L1_159
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_160)
  return math.abs(A0_160)
end
MO_ABS = L0_0
function L0_0(A0_161, A1_162)
  return math.random(A0_161, A1_162)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_163, A1_164)
  local L2_165, L3_166
  L2_165 = GetMathNumber
  L3_166 = A0_163
  L2_165 = L2_165(L3_166, A1_164.Src1VarTable, A1_164.Src1Var, A1_164.Src1Value)
  L3_166 = GetMathNumber
  L3_166 = L3_166(A0_163, A1_164.Src2VarTable, A1_164.Src2Var, A1_164.Src2Value)
  GetTable(A0_163, A1_164.DestVarTable)[A1_164.DestVar] = A1_164.MathOp(L2_165, L3_166)
end
BBMath = L0_0
function L0_0(A0_167, A1_168, A2_169, A3_170)
  if A2_169 ~= nil and GetTable(A0_167, A1_168)[A2_169] ~= nil then
    return GetTable(A0_167, A1_168)[A2_169]
  end
  return A3_170
end
GetMathNumber = L0_0
function L0_0(A0_171, A1_172)
  if type(A1_172) == "number" then
    return A1_172
  elseif type(A1_172) == "function" then
    return A1_172(A0_171)
  elseif type(A1_172) == "string" then
    return A0_171[A1_172]
  end
end
GetNumber = L0_0
function L0_0(A0_173, A1_174)
  return VectorAdd(A0_173, A1_174)
end
VEC_ADD = L0_0
function L0_0(A0_175, A1_176)
  return VectorSubtract(A0_175, A1_176)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_177, A1_178)
  return VectorScalarMultiply(A0_177, A1_178)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_179, A1_180)
  return VectorScalarDivide(A0_179, A1_180)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_181, A1_182)
  return VectorRotateY(A0_181, A1_182)
end
VEC_ROTATE = L0_0
function L0_0(A0_183, A1_184)
  BBMath(A0_183, A1_184)
end
BBVectorMath = L0_0
function L0_0(A0_185, A1_186)
  local L2_187, L3_188, L4_189, L5_190
  L2_187 = A0_185.InstanceVars
  L3_188 = L2_187.InterpDelta
  if L3_188 == nil then
    L3_188 = A1_186.Amount
    L4_189 = A1_186.AmountVar
    if L4_189 ~= nil then
      L4_189 = GetTable
      L5_190 = A0_185
      L4_189 = L4_189(L5_190, A1_186.AmountVarTable)
      L5_190 = A1_186.AmountVar
      L3_188 = L4_189[L5_190]
    end
    L4_189 = GetPosition
    L5_190 = A1_186.TargetVar
    L5_190 = A0_185[L5_190]
    L4_189 = L4_189(L5_190)
    L2_187.KnockBackStart = L4_189
    L4_189 = GetNormalizedPositionDelta
    L5_190 = A1_186.TargetVar
    L5_190 = A0_185[L5_190]
    L4_189 = L4_189(L5_190, A0_185[A1_186.AttackerVar], true)
    L5_190 = {}
    L5_190.x = L4_189.x * L3_188
    L5_190.y = 0
    L5_190.z = L4_189.z * L3_188
    L2_187.InterpDelta = L5_190
    L5_190 = GetTime
    L5_190 = L5_190()
    L2_187.StartTime = L5_190
    L5_190 = A1_186.KnockBackDuration
    L2_187.KnockBackDuration = L5_190
  end
  L3_188 = A1_186.TargetVar
  L3_188 = A0_185[L3_188]
  L4_189 = GetTime
  L4_189 = L4_189()
  L5_190 = L2_187.StartTime
  L4_189 = L4_189 - L5_190
  L5_190 = L2_187.KnockBackDuration
  L4_189 = L4_189 / L5_190
  L5_190 = {}
  L5_190.x = L2_187.KnockBackStart.x + L2_187.InterpDelta.x * L4_189
  L5_190.y = L2_187.KnockBackStart.y
  L5_190.z = L2_187.KnockBackStart.z + L2_187.InterpDelta.z * L4_189
  SetPosition(L3_188, L5_190)
end
BBKnockback = L0_0
function L0_0(A0_191, A1_192)
  local L2_193
  L2_193 = 0
  if A1_192.Delta ~= nil then
    L2_193 = L2_193 + A1_192.Delta
  end
  if A1_192.DeltaByLevel ~= nil and A0_191.Level ~= nil then
    L2_193 = L2_193 + A1_192.DeltaByLevel[A0_191.Level]
  end
  if A1_192.DeltaVar ~= nil then
    L2_193 = L2_193 + GetTable(A0_191, A1_192.DeltaVarTable, true)[A1_192.DeltaVar]
  end
  if A1_192.TargetVar ~= nil then
    A1_192.Stat(L2_193, A0_191[A1_192.TargetVar])
  else
    A1_192.Stat(L2_193)
  end
end
BBIncStat = L0_0
function L0_0(A0_194, A1_195)
  local L2_196
  L2_196 = 0
  if A1_195.Delta ~= nil then
    L2_196 = L2_196 + A1_195.Delta
  end
  if A1_195.DeltaByLevel ~= nil and A0_194.Level ~= nil then
    L2_196 = L2_196 + A1_195.DeltaByLevel[A0_194.Level]
  end
  if A1_195.DeltaVar ~= nil then
    L2_196 = L2_196 + GetTable(A0_194, A1_195.DeltaVarTable, true)[A1_195.DeltaVar]
  end
  if A1_195.TargetVar ~= nil then
    A1_195.Stat(L2_196, A0_194[A1_195.TargetVar])
  else
    A1_195.Stat(L2_196)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_197, A1_198)
  if A1_198.TargetVar ~= nil then
    GetTable(A0_197, A1_198.DestVarTable, false)[A1_198.DestVar] = A1_198.Stat(A0_197[A1_198.TargetVar])
  else
    GetTable(A0_197, A1_198.DestVarTable, false)[A1_198.DestVar] = A1_198.Stat()
  end
end
BBGetStat = L0_0
function L0_0(A0_199, A1_200)
  if A1_200.TargetVar ~= nil then
    GetTable(A0_199, A1_200.DestVarTable, false)[A1_200.DestVar] = GetLevel(A0_199[A1_200.TargetVar])
  else
    GetTable(A0_199, A1_200.DestVarTable, false)[A1_200.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_201, A1_202)
  if A1_202.TargetVar ~= nil then
    GetTable(A0_201, A1_202.DestVarTable, false)[A1_202.DestVar] = GetArmor(A0_201[A1_202.TargetVar])
  else
    GetTable(A0_201, A1_202.DestVarTable, false)[A1_202.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_203, A1_204)
  if A1_204.TargetVar ~= nil then
    GetTable(A0_203, A1_204.DestVarTable, false)[A1_204.DestVar] = GetSpellBlock(A0_203[A1_204.TargetVar])
  else
    GetTable(A0_203, A1_204.DestVarTable, false)[A1_204.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_205, A1_206)
  if A1_206.TargetVar ~= nil then
    GetTable(A0_205, A1_206.DestVarTable, false)[A1_206.DestVar] = GetTeamID(A0_205[A1_206.TargetVar])
  else
    GetTable(A0_205, A1_206.DestVarTable, false)[A1_206.DestVar] = GetTeamID()
  end
end
BBGetTeamID = L0_0
function L0_0(A0_207, A1_208)
  if A1_208.TargetVar ~= nil then
    GetTable(A0_207, A1_208.DestVarTable, false)[A1_208.DestVar] = GetUnitSkinName(A0_207[A1_208.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_209, A1_210)
  if A1_210.TargetVar ~= nil then
    GetTable(A0_209, A1_210.DestVarTable, false)[A1_210.DestVar] = GetTotalAttackDamage(A0_209[A1_210.TargetVar])
  else
    GetTable(A0_209, A1_210.DestVarTable, false)[A1_210.DestVar] = GetTotalAttackDamage()
  end
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_211, A1_212)
  GetTable(A0_211, A1_212.DestVarTable, true)[A1_212.DestVar] = A1_212.Status(A0_211[A1_212.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_213, A1_214)
  local L2_215
  L2_215 = A1_214.TargetVar
  L2_215 = A0_213[L2_215]
  ClearAttackTarget(L2_215)
end
BBClearAttackTarget = L0_0
function L0_0(A0_216, A1_217)
  GetTable(A0_216, A1_217.DestVarTable, true)[A1_217.DestVar] = A1_217.Info(A0_216[A1_217.TargetVar])
end
BBGetCastInfo = L0_0
function L0_0(A0_218, A1_219, A2_220)
  local L3_221, L4_222, L5_223, L6_224
  L3_221 = GetTable
  L4_222 = A0_218
  L5_223 = A1_219.TrackTimeVarTable
  L6_224 = false
  L3_221 = L3_221(L4_222, L5_223, L6_224)
  L4_222 = GetTime
  L4_222 = L4_222()
  L5_223 = A1_219.ExecuteImmediately
  L6_224 = A1_219.TimeBetweenExecutions
  if A1_219.TickTimeVar ~= nil and GetTable(A0_218, A1_219.TickTimeVarTable, false)[A1_219.TickTimeVar] ~= nil then
    L6_224 = GetTable(A0_218, A1_219.TickTimeVarTable, false)[A1_219.TickTimeVar]
  end
  if L3_221[A1_219.TrackTimeVar] == nil then
    L3_221[A1_219.TrackTimeVar] = L4_222
    if L5_223 == true then
      ExecuteBuildingBlocks(A2_220, A0_218)
    end
  end
  if L4_222 >= L3_221[A1_219.TrackTimeVar] + L6_224 then
    L3_221[A1_219.TrackTimeVar] = L3_221[A1_219.TrackTimeVar] + L6_224
    ExecuteBuildingBlocks(A2_220, A0_218)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_225, A1_226, A2_227)
  GetTable(A0_225, A1_226.TrackTimeVarTable, false)[A1_226.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_228, A1_229)
  local L2_230
  L2_230 = A1_229.SrcValue
  if A1_229.SrcVar ~= nil then
    L2_230 = GetTable(A0_228, A1_229.SrcTable, true)[A1_229.SrcVar]
  end
  A1_229.Status(A0_228[A1_229.TargetVar], L2_230)
end
BBSetStatus = L0_0
function L0_0(A0_231, A1_232)
  local L2_233
  L2_233 = A1_232.ToAlert
  if GetTable(A0_231, A1_232.SrcVarTable, false) ~= nil and A1_232.SrcVar ~= nil then
    L2_233 = L2_233 .. GetTable(A0_231, A1_232.SrcVarTable, false)[A1_232.SrcVar]
  end
  _ALERT(L2_233)
end
BBAlert = L0_0
function L0_0(A0_234, A1_235)
  local L2_236, L3_237, L4_238
  L2_236 = A1_235.ToSay
  L3_237 = GetTable
  L4_238 = A0_234
  L3_237 = L3_237(L4_238, A1_235.SrcVarTable, false)
  if L3_237 ~= nil then
    L4_238 = A1_235.SrcVar
    if L4_238 ~= nil then
      L4_238 = L2_236
      L2_236 = L4_238 .. tostring(L3_237[A1_235.SrcVar])
    end
  end
  L4_238 = nil
  if A1_235.OwnerVar ~= nil then
    L4_238 = A0_234[A1_235.OwnerVar]
  else
    L4_238 = A0_234.Owner
  end
  if A1_235.TextType == nil then
    A1_235.TextType = 0
  end
  Say(L4_238, L2_236, A1_235.TextType)
end
BBSay = L0_0
function L0_0(A0_239, A1_240)
  local L2_241, L3_242, L4_243
  L2_241 = A1_240.ToSay
  L3_242 = GetTable
  L4_243 = A0_239
  L3_242 = L3_242(L4_243, A1_240.SrcVarTable, false)
  if L3_242 ~= nil then
    L4_243 = A1_240.SrcVar
    if L4_243 ~= nil then
      L4_243 = L2_241
      L2_241 = L4_243 .. tostring(L3_242[A1_240.SrcVar])
    end
  end
  L4_243 = nil
  if A1_240.OwnerVar ~= nil then
    L4_243 = A0_239[A1_240.OwnerVar]
  else
    L4_243 = A0_239.Owner
  end
  if A1_240.TextType == nil then
    A1_240.TextType = 0
  end
  Say(L4_243, L2_241, A1_240.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_244, A1_245)
  GetTable(A0_244, A1_245.DestVarTable, true)[A1_245.DestVar] = BBLuaGetGold(A0_244, A1_245)
end
BBGetGold = L0_0
function L0_0(A0_246, A1_247)
  SpellBuffAdd(A0_246[A1_247.OwnerVar], A0_246[A1_247.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_246.NextBuffVars)
  BBTeleportToPositionHelper(A0_246, A1_247)
end
BBTeleportToPosition = L0_0
function L0_0(A0_248, A1_249)
  if A1_249.XVar ~= nil and GetTable(A0_248, A1_249.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_248, A1_249.XVarTable, true)[A1_249.XVar]
  else
    Xloc = A1_249.X
  end
  if A1_249.YVar ~= nil and GetTable(A0_248, A1_249.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_248, A1_249.YVarTable, true)[A1_249.YVar]
  else
    Yloc = A1_249.Y
  end
  if A1_249.ZVar ~= nil and GetTable(A0_248, A1_249.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_248, A1_249.ZVarTable, true)[A1_249.ZVar]
  else
    Zloc = A1_249.Z
  end
  A1_249.OwnerVar, A0_248.position = A1_249.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_249.CastPositionName = "position"
  BBTeleportToPosition(A0_248, A1_249)
end
BBTeleportToPoint = L0_0
function L0_0(A0_250, A1_251)
  DefUpdateAura(GetTable(A0_250, A1_251.CenterTable, false)[A1_251.CenterVar], A1_251.Range, A1_251.UnitScan, A1_251.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_252, A1_253)
  ReincarnateNonDeadHero(GetTable(A0_252, A1_253.TargetTable, false)[A1_253.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_254, A1_255)
  GetTable(A0_254, A1_255.DestVarTable, true)[A1_255.DestVar] = A1_255.Function(A0_254[A1_255.OwnerVar], A1_255.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_256, A1_257)
  local L2_258, L3_259, L4_260, L5_261
  L2_258 = A1_257.WhomToOrderVar
  L2_258 = A0_256[L2_258]
  L3_259 = A1_257.TargetOfOrderVar
  L3_259 = A0_256[L3_259]
  L4_260 = GetTable
  L5_261 = A0_256
  L4_260 = L4_260(L5_261, A1_257.SrcVarTable, false)
  L5_261 = nil
  if A1_257.SrcVar ~= nil and L4_260 ~= nil then
    L5_261 = L4_260[A1_257.SrcVar]
  else
    L5_261 = GetPosition(L3_259)
  end
  if L3_259 == nil then
    L3_259 = L2_258
  end
  IssueOrder(L2_258, A1_257.Order, L5_261, L3_259)
end
BBIssueOrder = L0_0
function L0_0(A0_262, A1_263)
  SetSpellCastRange(A1_263.NewRange)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_264, A1_265)
  GetTable(A0_264, A1_265.DestVarTable, true)[A1_265.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_266, A1_267)
  local L2_268, L3_269
  L2_268 = A1_267.ObjectVar1
  L2_268 = A0_266[L2_268]
  L3_269 = A1_267.ObjectVar2
  L3_269 = A0_266[L3_269]
  GetTable(A0_266, A1_267.DestVarTable, true)[A1_267.DestVar] = DistanceBetweenObjectBounds(L2_268, L3_269)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_270, A1_271)
  local L2_272, L3_273, L4_274
  L2_272 = A1_271.ObjectVar
  L2_272 = A0_270[L2_272]
  L3_273 = GetTable
  L4_274 = A0_270
  L3_273 = L3_273(L4_274, A1_271.PointVarTable, true)
  L4_274 = A1_271.PointVar
  L4_274 = L3_273[L4_274]
  GetTable(A0_270, A1_271.DestVarTable, true)[A1_271.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_272, L4_274)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_275, A1_276)
  local L2_277, L3_278, L4_279, L5_280
  L2_277 = GetTable
  L3_278 = A0_275
  L4_279 = A1_276.Point1VarTable
  L5_280 = true
  L2_277 = L2_277(L3_278, L4_279, L5_280)
  L3_278 = A1_276.Point1Var
  L3_278 = L2_277[L3_278]
  L4_279 = GetTable
  L5_280 = A0_275
  L4_279 = L4_279(L5_280, A1_276.Point2VarTable, true)
  L5_280 = A1_276.Point2Var
  L5_280 = L4_279[L5_280]
  GetTable(A0_275, A1_276.DestVarTable, true)[A1_276.DestVar] = DistanceBetweenPoints(L3_278, L5_280)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_281, A1_282, A2_283)
  local L3_284, L4_285, L5_286, L6_287, L7_288, L8_289
  L5_286 = 0
  L6_287 = nil
  L7_288 = A1_282.ObjectDistanceType
  L8_289 = A1_282.ObjectVar1
  L3_284 = A0_281[L8_289]
  L8_289 = A1_282.ObjectVar2
  L4_285 = A0_281[L8_289]
  if nil == L4_285 then
    L8_289 = A1_282.Point2Var
    if nil ~= L8_289 then
      L8_289 = GetTable
      L8_289 = L8_289(A0_281, A1_282.Point2VarTable, true)
      L4_285 = L8_289[A1_282.Point2Var]
      L5_286 = L5_286 + 1
    end
  end
  if nil == L3_284 then
    L8_289 = A1_282.Point1Var
    if nil ~= L8_289 then
      L8_289 = GetTable
      L8_289 = L8_289(A0_281, A1_282.Point1VarTable, true)
      L3_284 = L8_289[A1_282.Point1Var]
      L5_286 = L5_286 + 1
      if 1 == L5_286 then
        L3_284, L4_285 = L4_285, L3_284
      end
    end
  end
  if nil ~= L7_288 then
    if 0 == L5_286 then
      L8_289 = OBJECT_CENTER
      if L8_289 == L7_288 then
        L6_287 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_289 = OBJECT_BOUNDARY
        if L8_289 == L7_288 then
          L6_287 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_289 = A1_282.OwnerVar
          L8_289 = A0_281[L8_289]
          Say(L8_289, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_286 then
      L8_289 = OBJECT_CENTER
      if L8_289 == L7_288 then
        L6_287 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_289 = OBJECT_BOUNDARY
        if L8_289 == L7_288 then
          L6_287 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_289 = A1_282.OwnerVar
          L8_289 = A0_281[L8_289]
          Say(L8_289, "invalid object distance type", 0)
        end
      end
    else
      L6_287 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_289 = A1_282.Distance
  if A1_282.DistanceVar ~= nil and GetTable(A0_281, A1_282.DistanceVarTable, true) ~= nil then
    L8_289 = L8_289 + GetTable(A0_281, A1_282.DistanceVarTable, true)[A1_282.DistanceVar]
  end
  if L3_284 ~= nil and L4_285 ~= nil and L6_287 ~= nil and L8_289 ~= nil then
    if not L6_287(L3_284, L4_285, L8_289) then
      ExecuteBuildingBlocks(A2_283, A0_281)
      A0_281.LastIfSucceeded = true
    else
      A0_281.LastIfSucceeded = false
    end
  else
    A0_281.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_290, A1_291)
  local L2_292, L3_293
  L2_292 = A1_291.TargetVar
  L2_292 = A0_290[L2_292]
  L3_293 = A1_291.CasterVar
  L3_293 = A0_290[L3_293]
  GetTable(A0_290, A1_291.DestVarTable, true)[A1_291.DestVar] = SpellBuffCount(L2_292, A1_291.BuffName, L3_293)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_294, A1_295)
  local L2_296
  L2_296 = A1_295.TargetVar
  L2_296 = A0_294[L2_296]
  GetTable(A0_294, A1_295.DestVarTable, true)[A1_295.DestVar] = SpellBuffCount(L2_296, A1_295.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_297, A1_298)
  local L2_299, L3_300
  L2_299 = GetTable
  L3_300 = A0_297
  L2_299 = L2_299(L3_300, A1_298.ScaleVarTable, false)
  L3_300 = nil
  if A1_298.OwnerVar ~= nil then
    L3_300 = A0_297[A1_298.OwnerVar]
  else
    L3_300 = A0_297.Owner
  end
  if A1_298.ScaleVar ~= nil and A1_298.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_299[A1_298.ScaleVar], L3_300)
  else
    SetScaleSkinCoef(A1_298.Scale, L3_300)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_301, A1_302)
  SpellBuffAdd(A0_301[A1_302.TargetVar], A0_301[A1_302.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_301.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_303, A1_304, A2_305)
  local L3_306, L4_307
  L3_306 = A1_304.TargetVar
  L3_306 = A0_303[L3_306]
  L4_307 = A1_304.NumStacks
  if A1_304.NumStacks == 0 then
    L4_307 = SpellBuffCount(L3_306, A1_304.BuffName, caster)
  end
  while L4_307 > 0 do
    SpellBuffRemove(L3_306, A1_304.BuffName, A0_303[A1_304.AttackerVar])
    L4_307 = L4_307 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_308, A1_309, A2_310)
  if A0_308.EmoteId == A1_309.EmoteId then
    ExecuteBuildingBlocks(A2_310, A0_308)
    A0_308.LastIfSucceeded = true
  else
    A0_308.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_311, A1_312, A2_313)
  if A0_311.EmoteId ~= A1_312.EmoteId then
    ExecuteBuildingBlocks(A2_313, A0_311)
    A0_311.LastIfSucceeded = true
  else
    A0_311.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
