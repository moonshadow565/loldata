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
  local L2_213
  L2_213 = A1_212.TargetVar
  L2_213 = A0_211[L2_213]
  ClearAttackTarget(L2_213)
end
BBClearAttackTarget = L0_0
function L0_0(A0_214, A1_215)
  GetTable(A0_214, A1_215.DestVarTable, true)[A1_215.DestVar] = A1_215.Info(A0_214[A1_215.TargetVar])
end
BBGetCastInfo = L0_0
function L0_0(A0_216, A1_217, A2_218)
  local L3_219, L4_220, L5_221, L6_222
  L3_219 = GetTable
  L4_220 = A0_216
  L5_221 = A1_217.TrackTimeVarTable
  L6_222 = false
  L3_219 = L3_219(L4_220, L5_221, L6_222)
  L4_220 = GetTime
  L4_220 = L4_220()
  L5_221 = A1_217.ExecuteImmediately
  L6_222 = A1_217.TimeBetweenExecutions
  if A1_217.TickTimeVar ~= nil and GetTable(A0_216, A1_217.TickTimeVarTable, false)[A1_217.TickTimeVar] ~= nil then
    L6_222 = GetTable(A0_216, A1_217.TickTimeVarTable, false)[A1_217.TickTimeVar]
  end
  if L3_219[A1_217.TrackTimeVar] == nil then
    L3_219[A1_217.TrackTimeVar] = L4_220
    if L5_221 == true then
      ExecuteBuildingBlocks(A2_218, A0_216)
    end
  end
  if L4_220 >= L3_219[A1_217.TrackTimeVar] + L6_222 then
    L3_219[A1_217.TrackTimeVar] = L3_219[A1_217.TrackTimeVar] + L6_222
    ExecuteBuildingBlocks(A2_218, A0_216)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_223, A1_224, A2_225)
  GetTable(A0_223, A1_224.TrackTimeVarTable, false)[A1_224.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_226, A1_227)
  local L2_228
  L2_228 = A1_227.SrcValue
  if A1_227.SrcVar ~= nil then
    L2_228 = GetTable(A0_226, A1_227.SrcTable, true)[A1_227.SrcVar]
  end
  A1_227.Status(A0_226[A1_227.TargetVar], L2_228)
end
BBSetStatus = L0_0
function L0_0(A0_229, A1_230)
  local L2_231
  L2_231 = A1_230.ToAlert
  if GetTable(A0_229, A1_230.SrcVarTable, false) ~= nil and A1_230.SrcVar ~= nil then
    L2_231 = L2_231 .. GetTable(A0_229, A1_230.SrcVarTable, false)[A1_230.SrcVar]
  end
  _ALERT(L2_231)
end
BBAlert = L0_0
function L0_0(A0_232, A1_233)
  local L2_234, L3_235, L4_236
  L2_234 = A1_233.ToSay
  L3_235 = GetTable
  L4_236 = A0_232
  L3_235 = L3_235(L4_236, A1_233.SrcVarTable, false)
  if L3_235 ~= nil then
    L4_236 = A1_233.SrcVar
    if L4_236 ~= nil then
      L4_236 = L2_234
      L2_234 = L4_236 .. tostring(L3_235[A1_233.SrcVar])
    end
  end
  L4_236 = nil
  if A1_233.OwnerVar ~= nil then
    L4_236 = A0_232[A1_233.OwnerVar]
  else
    L4_236 = A0_232.Owner
  end
  if A1_233.TextType == nil then
    A1_233.TextType = 0
  end
  Say(L4_236, L2_234, A1_233.TextType)
end
BBSay = L0_0
function L0_0(A0_237, A1_238)
  local L2_239, L3_240, L4_241
  L2_239 = A1_238.ToSay
  L3_240 = GetTable
  L4_241 = A0_237
  L3_240 = L3_240(L4_241, A1_238.SrcVarTable, false)
  if L3_240 ~= nil then
    L4_241 = A1_238.SrcVar
    if L4_241 ~= nil then
      L4_241 = L2_239
      L2_239 = L4_241 .. tostring(L3_240[A1_238.SrcVar])
    end
  end
  L4_241 = nil
  if A1_238.OwnerVar ~= nil then
    L4_241 = A0_237[A1_238.OwnerVar]
  else
    L4_241 = A0_237.Owner
  end
  if A1_238.TextType == nil then
    A1_238.TextType = 0
  end
  Say(L4_241, L2_239, A1_238.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_242, A1_243)
  GetTable(A0_242, A1_243.DestVarTable, true)[A1_243.DestVar] = BBLuaGetGold(A0_242, A1_243)
end
BBGetGold = L0_0
function L0_0(A0_244, A1_245)
  SpellBuffAdd(A0_244[A1_245.OwnerVar], A0_244[A1_245.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_244.NextBuffVars)
  BBTeleportToPositionHelper(A0_244, A1_245)
end
BBTeleportToPosition = L0_0
function L0_0(A0_246, A1_247)
  if A1_247.XVar ~= nil and GetTable(A0_246, A1_247.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_246, A1_247.XVarTable, true)[A1_247.XVar]
  else
    Xloc = A1_247.X
  end
  if A1_247.YVar ~= nil and GetTable(A0_246, A1_247.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_246, A1_247.YVarTable, true)[A1_247.YVar]
  else
    Yloc = A1_247.Y
  end
  if A1_247.ZVar ~= nil and GetTable(A0_246, A1_247.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_246, A1_247.ZVarTable, true)[A1_247.ZVar]
  else
    Zloc = A1_247.Z
  end
  A1_247.OwnerVar, A0_246.position = A1_247.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_247.CastPositionName = "position"
  BBTeleportToPosition(A0_246, A1_247)
end
BBTeleportToPoint = L0_0
function L0_0(A0_248, A1_249)
  DefUpdateAura(GetTable(A0_248, A1_249.CenterTable, false)[A1_249.CenterVar], A1_249.Range, A1_249.UnitScan, A1_249.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_250, A1_251)
  ReincarnateNonDeadHero(GetTable(A0_250, A1_251.TargetTable, false)[A1_251.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_252, A1_253)
  GetTable(A0_252, A1_253.DestVarTable, true)[A1_253.DestVar] = A1_253.Function(A0_252[A1_253.OwnerVar], A1_253.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_254, A1_255)
  local L2_256, L3_257, L4_258, L5_259
  L2_256 = A1_255.WhomToOrderVar
  L2_256 = A0_254[L2_256]
  L3_257 = A1_255.TargetOfOrderVar
  L3_257 = A0_254[L3_257]
  L4_258 = GetTable
  L5_259 = A0_254
  L4_258 = L4_258(L5_259, A1_255.SrcVarTable, false)
  L5_259 = nil
  if A1_255.SrcVar ~= nil and L4_258 ~= nil then
    L5_259 = L4_258[A1_255.SrcVar]
  else
    L5_259 = GetPosition(L3_257)
  end
  if L3_257 == nil then
    L3_257 = L2_256
  end
  IssueOrder(L2_256, A1_255.Order, L5_259, L3_257)
end
BBIssueOrder = L0_0
function L0_0(A0_260, A1_261)
  SetSpellCastRange(A1_261.NewRange)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_262, A1_263)
  GetTable(A0_262, A1_263.DestVarTable, true)[A1_263.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_264, A1_265)
  local L2_266, L3_267
  L2_266 = A1_265.ObjectVar1
  L2_266 = A0_264[L2_266]
  L3_267 = A1_265.ObjectVar2
  L3_267 = A0_264[L3_267]
  GetTable(A0_264, A1_265.DestVarTable, true)[A1_265.DestVar] = DistanceBetweenObjectBounds(L2_266, L3_267)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_268, A1_269)
  local L2_270, L3_271, L4_272
  L2_270 = A1_269.ObjectVar
  L2_270 = A0_268[L2_270]
  L3_271 = GetTable
  L4_272 = A0_268
  L3_271 = L3_271(L4_272, A1_269.PointVarTable, true)
  L4_272 = A1_269.PointVar
  L4_272 = L3_271[L4_272]
  GetTable(A0_268, A1_269.DestVarTable, true)[A1_269.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_270, L4_272)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_273, A1_274)
  local L2_275, L3_276, L4_277, L5_278
  L2_275 = GetTable
  L3_276 = A0_273
  L4_277 = A1_274.Point1VarTable
  L5_278 = true
  L2_275 = L2_275(L3_276, L4_277, L5_278)
  L3_276 = A1_274.Point1Var
  L3_276 = L2_275[L3_276]
  L4_277 = GetTable
  L5_278 = A0_273
  L4_277 = L4_277(L5_278, A1_274.Point2VarTable, true)
  L5_278 = A1_274.Point2Var
  L5_278 = L4_277[L5_278]
  GetTable(A0_273, A1_274.DestVarTable, true)[A1_274.DestVar] = DistanceBetweenPoints(L3_276, L5_278)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_279, A1_280, A2_281)
  local L3_282, L4_283, L5_284, L6_285, L7_286, L8_287
  L5_284 = 0
  L6_285 = nil
  L7_286 = A1_280.ObjectDistanceType
  L8_287 = A1_280.ObjectVar1
  L3_282 = A0_279[L8_287]
  L8_287 = A1_280.ObjectVar2
  L4_283 = A0_279[L8_287]
  if nil == L4_283 then
    L8_287 = A1_280.Point2Var
    if nil ~= L8_287 then
      L8_287 = GetTable
      L8_287 = L8_287(A0_279, A1_280.Point2VarTable, true)
      L4_283 = L8_287[A1_280.Point2Var]
      L5_284 = L5_284 + 1
    end
  end
  if nil == L3_282 then
    L8_287 = A1_280.Point1Var
    if nil ~= L8_287 then
      L8_287 = GetTable
      L8_287 = L8_287(A0_279, A1_280.Point1VarTable, true)
      L3_282 = L8_287[A1_280.Point1Var]
      L5_284 = L5_284 + 1
      if 1 == L5_284 then
        L3_282, L4_283 = L4_283, L3_282
      end
    end
  end
  if nil ~= L7_286 then
    if 0 == L5_284 then
      L8_287 = OBJECT_CENTER
      if L8_287 == L7_286 then
        L6_285 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_287 = OBJECT_BOUNDARY
        if L8_287 == L7_286 then
          L6_285 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_287 = A1_280.OwnerVar
          L8_287 = A0_279[L8_287]
          Say(L8_287, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_284 then
      L8_287 = OBJECT_CENTER
      if L8_287 == L7_286 then
        L6_285 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_287 = OBJECT_BOUNDARY
        if L8_287 == L7_286 then
          L6_285 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_287 = A1_280.OwnerVar
          L8_287 = A0_279[L8_287]
          Say(L8_287, "invalid object distance type", 0)
        end
      end
    else
      L6_285 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_287 = A1_280.Distance
  if A1_280.DistanceVar ~= nil and GetTable(A0_279, A1_280.DistanceVarTable, true) ~= nil then
    L8_287 = L8_287 + GetTable(A0_279, A1_280.DistanceVarTable, true)[A1_280.DistanceVar]
  end
  if L3_282 ~= nil and L4_283 ~= nil and L6_285 ~= nil and L8_287 ~= nil then
    if not L6_285(L3_282, L4_283, L8_287) then
      ExecuteBuildingBlocks(A2_281, A0_279)
      A0_279.LastIfSucceeded = true
    else
      A0_279.LastIfSucceeded = false
    end
  else
    A0_279.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_288, A1_289)
  local L2_290, L3_291
  L2_290 = A1_289.TargetVar
  L2_290 = A0_288[L2_290]
  L3_291 = A1_289.CasterVar
  L3_291 = A0_288[L3_291]
  GetTable(A0_288, A1_289.DestVarTable, true)[A1_289.DestVar] = SpellBuffCount(L2_290, A1_289.BuffName, L3_291)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_292, A1_293)
  local L2_294
  L2_294 = A1_293.TargetVar
  L2_294 = A0_292[L2_294]
  GetTable(A0_292, A1_293.DestVarTable, true)[A1_293.DestVar] = SpellBuffCount(L2_294, A1_293.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_295, A1_296)
  local L2_297, L3_298
  L2_297 = GetTable
  L3_298 = A0_295
  L2_297 = L2_297(L3_298, A1_296.ScaleVarTable, false)
  L3_298 = nil
  if A1_296.OwnerVar ~= nil then
    L3_298 = A0_295[A1_296.OwnerVar]
  else
    L3_298 = A0_295.Owner
  end
  if A1_296.ScaleVar ~= nil and A1_296.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_297[A1_296.ScaleVar], L3_298)
  else
    SetScaleSkinCoef(A1_296.Scale, L3_298)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_299, A1_300)
  SpellBuffAdd(A0_299[A1_300.TargetVar], A0_299[A1_300.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_299.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_301, A1_302, A2_303)
  local L3_304, L4_305
  L3_304 = A1_302.TargetVar
  L3_304 = A0_301[L3_304]
  L4_305 = A1_302.NumStacks
  if A1_302.NumStacks == 0 then
    L4_305 = SpellBuffCount(L3_304, A1_302.BuffName, caster)
  end
  while L4_305 > 0 do
    SpellBuffRemove(L3_304, A1_302.BuffName, A0_301[A1_302.AttackerVar])
    L4_305 = L4_305 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_306, A1_307, A2_308)
  if A0_306.EmoteId == A1_307.EmoteId then
    ExecuteBuildingBlocks(A2_308, A0_306)
    A0_306.LastIfSucceeded = true
  else
    A0_306.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_309, A1_310, A2_311)
  if A0_309.EmoteId ~= A1_310.EmoteId then
    ExecuteBuildingBlocks(A2_311, A0_309)
    A0_309.LastIfSucceeded = true
  else
    A0_309.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
