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
  local L2_163, L3_164
  L2_163 = GetMathNumber
  L3_164 = A0_161
  L2_163 = L2_163(L3_164, A1_162.Src1VarTable, A1_162.Src1Var, A1_162.Src1Value)
  L3_164 = GetMathNumber
  L3_164 = L3_164(A0_161, A1_162.Src2VarTable, A1_162.Src2Var, A1_162.Src2Value)
  GetTable(A0_161, A1_162.DestVarTable)[A1_162.DestVar] = A1_162.MathOp(L2_163, L3_164)
end
BBMath = L0_0
function L0_0(A0_165, A1_166, A2_167, A3_168)
  if A2_167 ~= nil and GetTable(A0_165, A1_166)[A2_167] ~= nil then
    return GetTable(A0_165, A1_166)[A2_167]
  end
  return A3_168
end
GetMathNumber = L0_0
function L0_0(A0_169, A1_170)
  if type(A1_170) == "number" then
    return A1_170
  elseif type(A1_170) == "function" then
    return A1_170(A0_169)
  elseif type(A1_170) == "string" then
    return A0_169[A1_170]
  end
end
GetNumber = L0_0
function L0_0(A0_171, A1_172)
  return VectorAdd(A0_171, A1_172)
end
VEC_ADD = L0_0
function L0_0(A0_173, A1_174)
  return VectorSubtract(A0_173, A1_174)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_175, A1_176)
  return VectorScalarMultiply(A0_175, A1_176)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_177, A1_178)
  return VectorScalarDivide(A0_177, A1_178)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_179, A1_180)
  return VectorRotateY(A0_179, A1_180)
end
VEC_ROTATE = L0_0
function L0_0(A0_181, A1_182)
  BBMath(A0_181, A1_182)
end
BBVectorMath = L0_0
function L0_0(A0_183, A1_184)
  local L2_185, L3_186, L4_187, L5_188
  L2_185 = A0_183.InstanceVars
  L3_186 = L2_185.InterpDelta
  if L3_186 == nil then
    L3_186 = A1_184.Amount
    L4_187 = A1_184.AmountVar
    if L4_187 ~= nil then
      L4_187 = GetTable
      L5_188 = A0_183
      L4_187 = L4_187(L5_188, A1_184.AmountVarTable)
      L5_188 = A1_184.AmountVar
      L3_186 = L4_187[L5_188]
    end
    L4_187 = GetPosition
    L5_188 = A1_184.TargetVar
    L5_188 = A0_183[L5_188]
    L4_187 = L4_187(L5_188)
    L2_185.KnockBackStart = L4_187
    L4_187 = GetNormalizedPositionDelta
    L5_188 = A1_184.TargetVar
    L5_188 = A0_183[L5_188]
    L4_187 = L4_187(L5_188, A0_183[A1_184.AttackerVar], true)
    L5_188 = {}
    L5_188.x = L4_187.x * L3_186
    L5_188.y = 0
    L5_188.z = L4_187.z * L3_186
    L2_185.InterpDelta = L5_188
    L5_188 = GetTime
    L5_188 = L5_188()
    L2_185.StartTime = L5_188
    L5_188 = A1_184.KnockBackDuration
    L2_185.KnockBackDuration = L5_188
  end
  L3_186 = A1_184.TargetVar
  L3_186 = A0_183[L3_186]
  L4_187 = GetTime
  L4_187 = L4_187()
  L5_188 = L2_185.StartTime
  L4_187 = L4_187 - L5_188
  L5_188 = L2_185.KnockBackDuration
  L4_187 = L4_187 / L5_188
  L5_188 = {}
  L5_188.x = L2_185.KnockBackStart.x + L2_185.InterpDelta.x * L4_187
  L5_188.y = L2_185.KnockBackStart.y
  L5_188.z = L2_185.KnockBackStart.z + L2_185.InterpDelta.z * L4_187
  SetPosition(L3_186, L5_188)
end
BBKnockback = L0_0
function L0_0(A0_189, A1_190)
  local L2_191
  L2_191 = 0
  if A1_190.Delta ~= nil then
    L2_191 = L2_191 + A1_190.Delta
  end
  if A1_190.DeltaByLevel ~= nil and A0_189.Level ~= nil then
    L2_191 = L2_191 + A1_190.DeltaByLevel[A0_189.Level]
  end
  if A1_190.DeltaVar ~= nil then
    L2_191 = L2_191 + GetTable(A0_189, A1_190.DeltaVarTable, true)[A1_190.DeltaVar]
  end
  if A1_190.TargetVar ~= nil then
    A1_190.Stat(L2_191, A0_189[A1_190.TargetVar])
  else
    A1_190.Stat(L2_191)
  end
end
BBIncStat = L0_0
function L0_0(A0_192, A1_193)
  local L2_194
  L2_194 = 0
  if A1_193.Delta ~= nil then
    L2_194 = L2_194 + A1_193.Delta
  end
  if A1_193.DeltaByLevel ~= nil and A0_192.Level ~= nil then
    L2_194 = L2_194 + A1_193.DeltaByLevel[A0_192.Level]
  end
  if A1_193.DeltaVar ~= nil then
    L2_194 = L2_194 + GetTable(A0_192, A1_193.DeltaVarTable, true)[A1_193.DeltaVar]
  end
  if A1_193.TargetVar ~= nil then
    A1_193.Stat(L2_194, A0_192[A1_193.TargetVar])
  else
    A1_193.Stat(L2_194)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_195, A1_196)
  if A1_196.TargetVar ~= nil then
    GetTable(A0_195, A1_196.DestVarTable, false)[A1_196.DestVar] = A1_196.Stat(A0_195[A1_196.TargetVar])
  else
    GetTable(A0_195, A1_196.DestVarTable, false)[A1_196.DestVar] = A1_196.Stat()
  end
end
BBGetStat = L0_0
function L0_0(A0_197, A1_198)
  if A1_198.TargetVar ~= nil then
    GetTable(A0_197, A1_198.DestVarTable, false)[A1_198.DestVar] = GetLevel(A0_197[A1_198.TargetVar])
  else
    GetTable(A0_197, A1_198.DestVarTable, false)[A1_198.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_199, A1_200)
  if A1_200.TargetVar ~= nil then
    GetTable(A0_199, A1_200.DestVarTable, false)[A1_200.DestVar] = GetArmor(A0_199[A1_200.TargetVar])
  else
    GetTable(A0_199, A1_200.DestVarTable, false)[A1_200.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_201, A1_202)
  if A1_202.TargetVar ~= nil then
    GetTable(A0_201, A1_202.DestVarTable, false)[A1_202.DestVar] = GetSpellBlock(A0_201[A1_202.TargetVar])
  else
    GetTable(A0_201, A1_202.DestVarTable, false)[A1_202.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_203, A1_204)
  if A1_204.TargetVar ~= nil then
    GetTable(A0_203, A1_204.DestVarTable, false)[A1_204.DestVar] = GetTeamID(A0_203[A1_204.TargetVar])
  else
    GetTable(A0_203, A1_204.DestVarTable, false)[A1_204.DestVar] = GetTeamID()
  end
end
BBGetTeamID = L0_0
function L0_0(A0_205, A1_206)
  if A1_206.TargetVar ~= nil then
    GetTable(A0_205, A1_206.DestVarTable, false)[A1_206.DestVar] = GetUnitSkinName(A0_205[A1_206.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_207, A1_208)
  if A1_208.TargetVar ~= nil then
    GetTable(A0_207, A1_208.DestVarTable, false)[A1_208.DestVar] = GetTotalAttackDamage(A0_207[A1_208.TargetVar])
  else
    GetTable(A0_207, A1_208.DestVarTable, false)[A1_208.DestVar] = GetTotalAttackDamage()
  end
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_209, A1_210)
  GetTable(A0_209, A1_210.DestVarTable, true)[A1_210.DestVar] = A1_210.Status(A0_209[A1_210.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_211, A1_212)
  GetTable(A0_211, A1_212.DestVarTable, true)[A1_212.DestVar] = A1_212.Info(A0_211[A1_212.TargetVar])
end
BBGetCastInfo = L0_0
function L0_0(A0_213, A1_214)
  SetCanCastWhileDisabled(A1_214.CanCast)
end
BBSetCanCastWhileDisabled = L0_0
function L0_0(A0_215, A1_216, A2_217)
  local L3_218, L4_219, L5_220, L6_221
  L3_218 = GetTable
  L4_219 = A0_215
  L5_220 = A1_216.TrackTimeVarTable
  L6_221 = false
  L3_218 = L3_218(L4_219, L5_220, L6_221)
  L4_219 = GetTime
  L4_219 = L4_219()
  L5_220 = A1_216.ExecuteImmediately
  L6_221 = A1_216.TimeBetweenExecutions
  if A1_216.TickTimeVar ~= nil and GetTable(A0_215, A1_216.TickTimeVarTable, false)[A1_216.TickTimeVar] ~= nil then
    L6_221 = GetTable(A0_215, A1_216.TickTimeVarTable, false)[A1_216.TickTimeVar]
  end
  if L3_218[A1_216.TrackTimeVar] == nil then
    L3_218[A1_216.TrackTimeVar] = L4_219
    if L5_220 == true then
      ExecuteBuildingBlocks(A2_217, A0_215)
    end
  end
  if L4_219 >= L3_218[A1_216.TrackTimeVar] + L6_221 then
    L3_218[A1_216.TrackTimeVar] = L3_218[A1_216.TrackTimeVar] + L6_221
    ExecuteBuildingBlocks(A2_217, A0_215)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_222, A1_223, A2_224)
  GetTable(A0_222, A1_223.TrackTimeVarTable, false)[A1_223.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_225, A1_226)
  local L2_227
  L2_227 = A1_226.SrcValue
  if A1_226.SrcVar ~= nil then
    L2_227 = GetTable(A0_225, A1_226.SrcTable, true)[A1_226.SrcVar]
  end
  A1_226.Status(A0_225[A1_226.TargetVar], L2_227)
end
BBSetStatus = L0_0
function L0_0(A0_228, A1_229)
  local L2_230
  L2_230 = A1_229.ToAlert
  if GetTable(A0_228, A1_229.SrcVarTable, false) ~= nil and A1_229.SrcVar ~= nil then
    L2_230 = L2_230 .. GetTable(A0_228, A1_229.SrcVarTable, false)[A1_229.SrcVar]
  end
  _ALERT(L2_230)
end
BBAlert = L0_0
function L0_0(A0_231, A1_232)
  local L2_233, L3_234, L4_235
  L2_233 = A1_232.ToSay
  L3_234 = GetTable
  L4_235 = A0_231
  L3_234 = L3_234(L4_235, A1_232.SrcVarTable, false)
  if L3_234 ~= nil then
    L4_235 = A1_232.SrcVar
    if L4_235 ~= nil then
      L4_235 = L2_233
      L2_233 = L4_235 .. tostring(L3_234[A1_232.SrcVar])
    end
  end
  L4_235 = nil
  if A1_232.OwnerVar ~= nil then
    L4_235 = A0_231[A1_232.OwnerVar]
  else
    L4_235 = A0_231.Owner
  end
  if A1_232.TextType == nil then
    A1_232.TextType = 0
  end
  Say(L4_235, L2_233, A1_232.TextType)
end
BBSay = L0_0
function L0_0(A0_236, A1_237)
  local L2_238, L3_239, L4_240
  L2_238 = A1_237.ToSay
  L3_239 = GetTable
  L4_240 = A0_236
  L3_239 = L3_239(L4_240, A1_237.SrcVarTable, false)
  if L3_239 ~= nil then
    L4_240 = A1_237.SrcVar
    if L4_240 ~= nil then
      L4_240 = L2_238
      L2_238 = L4_240 .. tostring(L3_239[A1_237.SrcVar])
    end
  end
  L4_240 = nil
  if A1_237.OwnerVar ~= nil then
    L4_240 = A0_236[A1_237.OwnerVar]
  else
    L4_240 = A0_236.Owner
  end
  if A1_237.TextType == nil then
    A1_237.TextType = 0
  end
  Say(L4_240, L2_238, A1_237.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_241, A1_242)
  GetTable(A0_241, A1_242.DestVarTable, true)[A1_242.DestVar] = BBLuaGetGold(A0_241, A1_242)
end
BBGetGold = L0_0
function L0_0(A0_243, A1_244)
  SpellBuffAdd(A0_243[A1_244.OwnerVar], A0_243[A1_244.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_243.NextBuffVars)
  BBTeleportToPositionHelper(A0_243, A1_244)
end
BBTeleportToPosition = L0_0
function L0_0(A0_245, A1_246)
  if A1_246.XVar ~= nil and GetTable(A0_245, A1_246.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_245, A1_246.XVarTable, true)[A1_246.XVar]
  else
    Xloc = A1_246.X
  end
  if A1_246.YVar ~= nil and GetTable(A0_245, A1_246.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_245, A1_246.YVarTable, true)[A1_246.YVar]
  else
    Yloc = A1_246.Y
  end
  if A1_246.ZVar ~= nil and GetTable(A0_245, A1_246.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_245, A1_246.ZVarTable, true)[A1_246.ZVar]
  else
    Zloc = A1_246.Z
  end
  A1_246.OwnerVar, A0_245.position = A1_246.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_246.CastPositionName = "position"
  BBTeleportToPosition(A0_245, A1_246)
end
BBTeleportToPoint = L0_0
function L0_0(A0_247, A1_248)
  DefUpdateAura(GetTable(A0_247, A1_248.CenterTable, false)[A1_248.CenterVar], A1_248.Range, A1_248.UnitScan, A1_248.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_249, A1_250)
  ReincarnateNonDeadHero(GetTable(A0_249, A1_250.TargetTable, false)[A1_250.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_251, A1_252)
  GetTable(A0_251, A1_252.DestVarTable, true)[A1_252.DestVar] = A1_252.Function(A0_251[A1_252.OwnerVar], A1_252.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_253, A1_254)
  local L2_255, L3_256, L4_257, L5_258
  L2_255 = A1_254.WhomToOrderVar
  L2_255 = A0_253[L2_255]
  L3_256 = A1_254.TargetOfOrderVar
  L3_256 = A0_253[L3_256]
  L4_257 = GetTable
  L5_258 = A0_253
  L4_257 = L4_257(L5_258, A1_254.SrcVarTable, false)
  L5_258 = nil
  if A1_254.SrcVar ~= nil and L4_257 ~= nil then
    L5_258 = L4_257[A1_254.SrcVar]
  else
    L5_258 = GetPosition(L3_256)
  end
  if L3_256 == nil then
    L3_256 = L2_255
  end
  IssueOrder(L2_255, A1_254.Order, L5_258, L3_256)
end
BBIssueOrder = L0_0
function L0_0(A0_259, A1_260)
  SetSpellCastRange(A1_260.NewRange)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_261, A1_262)
  GetTable(A0_261, A1_262.DestVarTable, true)[A1_262.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_263, A1_264)
  local L2_265, L3_266
  L2_265 = A1_264.ObjectVar1
  L2_265 = A0_263[L2_265]
  L3_266 = A1_264.ObjectVar2
  L3_266 = A0_263[L3_266]
  GetTable(A0_263, A1_264.DestVarTable, true)[A1_264.DestVar] = DistanceBetweenObjectBounds(L2_265, L3_266)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_267, A1_268)
  local L2_269, L3_270, L4_271
  L2_269 = A1_268.ObjectVar
  L2_269 = A0_267[L2_269]
  L3_270 = GetTable
  L4_271 = A0_267
  L3_270 = L3_270(L4_271, A1_268.PointVarTable, true)
  L4_271 = A1_268.PointVar
  L4_271 = L3_270[L4_271]
  GetTable(A0_267, A1_268.DestVarTable, true)[A1_268.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_269, L4_271)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_272, A1_273)
  local L2_274, L3_275, L4_276, L5_277
  L2_274 = GetTable
  L3_275 = A0_272
  L4_276 = A1_273.Point1VarTable
  L5_277 = true
  L2_274 = L2_274(L3_275, L4_276, L5_277)
  L3_275 = A1_273.Point1Var
  L3_275 = L2_274[L3_275]
  L4_276 = GetTable
  L5_277 = A0_272
  L4_276 = L4_276(L5_277, A1_273.Point2VarTable, true)
  L5_277 = A1_273.Point2Var
  L5_277 = L4_276[L5_277]
  GetTable(A0_272, A1_273.DestVarTable, true)[A1_273.DestVar] = DistanceBetweenPoints(L3_275, L5_277)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_278, A1_279, A2_280)
  local L3_281, L4_282, L5_283, L6_284, L7_285, L8_286
  L5_283 = 0
  L6_284 = nil
  L7_285 = A1_279.ObjectDistanceType
  L8_286 = A1_279.ObjectVar1
  L3_281 = A0_278[L8_286]
  L8_286 = A1_279.ObjectVar2
  L4_282 = A0_278[L8_286]
  if nil == L4_282 then
    L8_286 = A1_279.Point2Var
    if nil ~= L8_286 then
      L8_286 = GetTable
      L8_286 = L8_286(A0_278, A1_279.Point2VarTable, true)
      L4_282 = L8_286[A1_279.Point2Var]
      L5_283 = L5_283 + 1
    end
  end
  if nil == L3_281 then
    L8_286 = A1_279.Point1Var
    if nil ~= L8_286 then
      L8_286 = GetTable
      L8_286 = L8_286(A0_278, A1_279.Point1VarTable, true)
      L3_281 = L8_286[A1_279.Point1Var]
      L5_283 = L5_283 + 1
      if 1 == L5_283 then
        L3_281, L4_282 = L4_282, L3_281
      end
    end
  end
  if nil ~= L7_285 then
    if 0 == L5_283 then
      L8_286 = OBJECT_CENTER
      if L8_286 == L7_285 then
        L6_284 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_286 = OBJECT_BOUNDARY
        if L8_286 == L7_285 then
          L6_284 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_286 = A1_279.OwnerVar
          L8_286 = A0_278[L8_286]
          Say(L8_286, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_283 then
      L8_286 = OBJECT_CENTER
      if L8_286 == L7_285 then
        L6_284 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_286 = OBJECT_BOUNDARY
        if L8_286 == L7_285 then
          L6_284 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_286 = A1_279.OwnerVar
          L8_286 = A0_278[L8_286]
          Say(L8_286, "invalid object distance type", 0)
        end
      end
    else
      L6_284 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_286 = A1_279.Distance
  if A1_279.DistanceVar ~= nil and GetTable(A0_278, A1_279.DistanceVarTable, true) ~= nil then
    L8_286 = L8_286 + GetTable(A0_278, A1_279.DistanceVarTable, true)[A1_279.DistanceVar]
  end
  if L3_281 ~= nil and L4_282 ~= nil and L6_284 ~= nil and L8_286 ~= nil then
    if not L6_284(L3_281, L4_282, L8_286) then
      ExecuteBuildingBlocks(A2_280, A0_278)
      A0_278.LastIfSucceeded = true
    else
      A0_278.LastIfSucceeded = false
    end
  else
    A0_278.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_287, A1_288)
  local L2_289, L3_290
  L2_289 = A1_288.TargetVar
  L2_289 = A0_287[L2_289]
  L3_290 = A1_288.CasterVar
  L3_290 = A0_287[L3_290]
  GetTable(A0_287, A1_288.DestVarTable, true)[A1_288.DestVar] = SpellBuffCount(L2_289, A1_288.BuffName, L3_290)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_291, A1_292)
  local L2_293
  L2_293 = A1_292.TargetVar
  L2_293 = A0_291[L2_293]
  GetTable(A0_291, A1_292.DestVarTable, true)[A1_292.DestVar] = SpellBuffCount(L2_293, A1_292.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_294, A1_295)
  local L2_296, L3_297
  L2_296 = GetTable
  L3_297 = A0_294
  L2_296 = L2_296(L3_297, A1_295.ScaleVarTable, false)
  L3_297 = nil
  if A1_295.OwnerVar ~= nil then
    L3_297 = A0_294[A1_295.OwnerVar]
  else
    L3_297 = A0_294.Owner
  end
  if A1_295.ScaleVar ~= nil and A1_295.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_296[A1_295.ScaleVar], L3_297)
  else
    SetScaleSkinCoef(A1_295.Scale, L3_297)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_298, A1_299)
  SpellBuffAdd(A0_298[A1_299.TargetVar], A0_298[A1_299.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_298.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_300, A1_301, A2_302)
  local L3_303, L4_304
  L3_303 = A1_301.TargetVar
  L3_303 = A0_300[L3_303]
  L4_304 = A1_301.NumStacks
  if A1_301.NumStacks == 0 then
    L4_304 = SpellBuffCount(L3_303, A1_301.BuffName, caster)
  end
  while L4_304 > 0 do
    SpellBuffRemove(L3_303, A1_301.BuffName, A0_300[A1_301.AttackerVar])
    L4_304 = L4_304 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_305, A1_306, A2_307)
  if A0_305.EmoteId == A1_306.EmoteId then
    ExecuteBuildingBlocks(A2_307, A0_305)
    A0_305.LastIfSucceeded = true
  else
    A0_305.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_308, A1_309, A2_310)
  if A0_308.EmoteId ~= A1_309.EmoteId then
    ExecuteBuildingBlocks(A2_310, A0_308)
    A0_308.LastIfSucceeded = true
  else
    A0_308.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
