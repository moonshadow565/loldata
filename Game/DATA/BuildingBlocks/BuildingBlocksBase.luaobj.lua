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
function L0_0(A0_101, A1_102, A2_103)
  if BBIsMissileAutoAttack(A0_101, A1_102) then
    ExecuteBuildingBlocks(A2_103, A0_101)
    A0_101.LastIfSucceeded = true
  else
    A0_101.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_104, A1_105)
  A0_104.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_106, A1_107, A2_108)
  local L3_109, L4_110
  if A1_107.OwnerVar ~= nil then
    L3_109 = A0_106[A1_107.OwnerVar]
  else
    L3_109 = A0_106.Owner
  end
  if A1_107.CasterVar ~= nil then
    L4_110 = A0_106[A1_107.CasterVar]
  else
    L4_110 = A0_106.Caster
  end
  if SpellBuffCount(L3_109, A1_107.BuffName, L4_110) <= 0 then
    ExecuteBuildingBlocks(A2_108, A0_106)
    A0_106.LastIfSucceeded = true
  else
    A0_106.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_111, A1_112, A2_113)
  local L3_114, L4_115
  if A1_112.OwnerVar ~= nil then
    L3_114 = A0_111[A1_112.OwnerVar]
  else
    L3_114 = A0_111.Owner
  end
  if HasPARType(L3_114, A1_112.PARType) then
    ExecuteBuildingBlocks(A2_113, A0_111)
    A0_111.LastIfSucceeded = true
  else
    A0_111.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_116, A1_117, A2_118)
  local L3_119, L4_120
  if A1_117.OwnerVar ~= nil then
    L3_119 = A0_116[A1_117.OwnerVar]
  else
    L3_119 = A0_116.Owner
  end
  if not HasPARType(L3_119, A1_117.PARType) then
    ExecuteBuildingBlocks(A2_118, A0_116)
    A0_116.LastIfSucceeded = true
  else
    A0_116.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_121, A1_122, A2_123)
  local L3_124, L4_125, L5_126, L6_127, L7_128
  L3_124 = GetTable
  L4_125 = A0_121
  L5_126 = A1_122.Src1VarTable
  L6_127 = false
  L3_124 = L3_124(L4_125, L5_126, L6_127)
  L4_125 = GetTable
  L5_126 = A0_121
  L6_127 = A1_122.Src2VarTable
  L7_128 = false
  L4_125 = L4_125(L5_126, L6_127, L7_128)
  L5_126 = true
  while L5_126 do
    L6_127 = false
    L7_128 = nil
    if L3_124 ~= nil and A1_122.Src1Var ~= nil then
      L7_128 = L3_124[A1_122.Src1Var]
    else
      L7_128 = A1_122.Value1
    end
    if L4_125 ~= nil and A1_122.Src2Var ~= nil then
      L6_127 = A1_122.CompareOp(L7_128, L4_125[A1_122.Src2Var])
    else
      L6_127 = A1_122.CompareOp(L7_128, A1_122.Value2)
    end
    if L6_127 then
      ExecuteBuildingBlocks(A2_123, A0_121)
    else
      L5_126 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_129, A1_130)
  return A0_129 * A1_130
end
MO_MULTIPLY = L0_0
function L0_0(A0_131, A1_132)
  return A0_131 + A1_132
end
MO_ADD = L0_0
function L0_0(A0_133, A1_134)
  return A0_133 - A1_134
end
MO_SUBTRACT = L0_0
function L0_0(A0_135, A1_136)
  return A0_135 / A1_136
end
MO_DIVIDE = L0_0
function L0_0(A0_137, A1_138)
  if A0_137 < A1_138 then
    return A0_137
  else
    return A1_138
  end
end
MO_MIN = L0_0
function L0_0(A0_139, A1_140)
  if A1_140 < A0_139 then
    return A0_139
  else
    return A1_140
  end
end
MO_MAX = L0_0
function L0_0(A0_141, A1_142)
  return A0_141 % A1_142
end
MO_MODULO = L0_0
function L0_0(A0_143)
  return math.floor(A0_143 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_144)
  return math.ceil(A0_144)
end
MO_ROUNDUP = L0_0
function L0_0(A0_145)
  return math.floor(A0_145)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_146)
  return math.sin(math.rad(A0_146))
end
MO_SIN = L0_0
function L0_0(A0_147)
  return math.cos(math.rad(A0_147))
end
MO_COSINE = L0_0
function L0_0(A0_148)
  return math.tan(math.rad(A0_148))
end
MO_TANGENT = L0_0
function L0_0(A0_149)
  return math.deg(math.asin(A0_149))
end
MO_ASIN = L0_0
function L0_0(A0_150)
  return math.deg(math.acos(A0_150))
end
MO_ACOS = L0_0
function L0_0(A0_151)
  return math.deg(math.atan(A0_151))
end
MO_ATAN = L0_0
function L0_0(A0_152, A1_153)
  return math.pow(A0_152, A1_153)
end
MO_POW = L0_0
function L0_0(A0_154)
  return math.sqrt(A0_154)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_155, A1_156)
  local L2_157
  L2_157 = A0_155 and A1_156
  return L2_157
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_158, A1_159)
  local L2_160
  L2_160 = A0_158 or A1_159
  return L2_160
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_161)
  local L1_162
  L1_162 = not A0_161
  return L1_162
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_163)
  return math.abs(A0_163)
end
MO_ABS = L0_0
function L0_0(A0_164, A1_165)
  return math.random(A0_164, A1_165)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_166, A1_167)
  local L2_168, L3_169
  L2_168 = GetMathNumber
  L3_169 = A0_166
  L2_168 = L2_168(L3_169, A1_167.Src1VarTable, A1_167.Src1Var, A1_167.Src1Value)
  L3_169 = GetMathNumber
  L3_169 = L3_169(A0_166, A1_167.Src2VarTable, A1_167.Src2Var, A1_167.Src2Value)
  GetTable(A0_166, A1_167.DestVarTable)[A1_167.DestVar] = A1_167.MathOp(L2_168, L3_169)
end
BBMath = L0_0
function L0_0(A0_170, A1_171, A2_172, A3_173)
  if A2_172 ~= nil and GetTable(A0_170, A1_171)[A2_172] ~= nil then
    return GetTable(A0_170, A1_171)[A2_172]
  end
  return A3_173
end
GetMathNumber = L0_0
function L0_0(A0_174, A1_175)
  if type(A1_175) == "number" then
    return A1_175
  elseif type(A1_175) == "function" then
    return A1_175(A0_174)
  elseif type(A1_175) == "string" then
    return A0_174[A1_175]
  end
end
GetNumber = L0_0
function L0_0(A0_176, A1_177)
  return VectorAdd(A0_176, A1_177)
end
VEC_ADD = L0_0
function L0_0(A0_178, A1_179)
  return VectorSubtract(A0_178, A1_179)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_180, A1_181)
  return VectorScalarMultiply(A0_180, A1_181)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_182, A1_183)
  return VectorScalarDivide(A0_182, A1_183)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_184, A1_185)
  return VectorRotateY(A0_184, A1_185)
end
VEC_ROTATE = L0_0
function L0_0(A0_186, A1_187)
  BBMath(A0_186, A1_187)
end
BBVectorMath = L0_0
function L0_0(A0_188, A1_189)
  local L2_190, L3_191, L4_192, L5_193
  L2_190 = A0_188.InstanceVars
  L3_191 = L2_190.InterpDelta
  if L3_191 == nil then
    L3_191 = A1_189.Amount
    L4_192 = A1_189.AmountVar
    if L4_192 ~= nil then
      L4_192 = GetTable
      L5_193 = A0_188
      L4_192 = L4_192(L5_193, A1_189.AmountVarTable)
      L5_193 = A1_189.AmountVar
      L3_191 = L4_192[L5_193]
    end
    L4_192 = GetPosition
    L5_193 = A1_189.TargetVar
    L5_193 = A0_188[L5_193]
    L4_192 = L4_192(L5_193)
    L2_190.KnockBackStart = L4_192
    L4_192 = GetNormalizedPositionDelta
    L5_193 = A1_189.TargetVar
    L5_193 = A0_188[L5_193]
    L4_192 = L4_192(L5_193, A0_188[A1_189.AttackerVar], true)
    L5_193 = {}
    L5_193.x = L4_192.x * L3_191
    L5_193.y = 0
    L5_193.z = L4_192.z * L3_191
    L2_190.InterpDelta = L5_193
    L5_193 = GetTime
    L5_193 = L5_193()
    L2_190.StartTime = L5_193
    L5_193 = A1_189.KnockBackDuration
    L2_190.KnockBackDuration = L5_193
  end
  L3_191 = A1_189.TargetVar
  L3_191 = A0_188[L3_191]
  L4_192 = GetTime
  L4_192 = L4_192()
  L5_193 = L2_190.StartTime
  L4_192 = L4_192 - L5_193
  L5_193 = L2_190.KnockBackDuration
  L4_192 = L4_192 / L5_193
  L5_193 = {}
  L5_193.x = L2_190.KnockBackStart.x + L2_190.InterpDelta.x * L4_192
  L5_193.y = L2_190.KnockBackStart.y
  L5_193.z = L2_190.KnockBackStart.z + L2_190.InterpDelta.z * L4_192
  SetPosition(L3_191, L5_193)
end
BBKnockback = L0_0
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
BBIncStat = L0_0
function L0_0(A0_197, A1_198)
  local L2_199
  L2_199 = 0
  if A1_198.Delta ~= nil then
    L2_199 = L2_199 + A1_198.Delta
  end
  if A1_198.DeltaByLevel ~= nil and A0_197.Level ~= nil then
    L2_199 = L2_199 + A1_198.DeltaByLevel[A0_197.Level]
  end
  if A1_198.DeltaVar ~= nil then
    L2_199 = L2_199 + GetTable(A0_197, A1_198.DeltaVarTable, true)[A1_198.DeltaVar]
  end
  if A1_198.TargetVar ~= nil then
    A1_198.Stat(L2_199, A0_197[A1_198.TargetVar])
  else
    A1_198.Stat(L2_199)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_200, A1_201)
  if A1_201.TargetVar ~= nil then
    GetTable(A0_200, A1_201.DestVarTable, false)[A1_201.DestVar] = A1_201.Stat(A0_200[A1_201.TargetVar])
  else
    GetTable(A0_200, A1_201.DestVarTable, false)[A1_201.DestVar] = A1_201.Stat()
  end
end
BBGetStat = L0_0
function L0_0(A0_202, A1_203)
  if A1_203.TargetVar ~= nil then
    GetTable(A0_202, A1_203.DestVarTable, false)[A1_203.DestVar] = GetLevel(A0_202[A1_203.TargetVar])
  else
    GetTable(A0_202, A1_203.DestVarTable, false)[A1_203.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_204, A1_205)
  if A1_205.TargetVar ~= nil then
    GetTable(A0_204, A1_205.DestVarTable, false)[A1_205.DestVar] = GetUnitSignificance(A0_204[A1_205.TargetVar])
  else
    GetTable(A0_204, A1_205.DestVarTable, false)[A1_205.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_206, A1_207)
  if A1_207.TargetVar ~= nil then
    GetTable(A0_206, A1_207.DestVarTable, false)[A1_207.DestVar] = GetArmor(A0_206[A1_207.TargetVar])
  else
    GetTable(A0_206, A1_207.DestVarTable, false)[A1_207.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_208, A1_209)
  if A1_209.TargetVar ~= nil then
    GetTable(A0_208, A1_209.DestVarTable, false)[A1_209.DestVar] = GetSpellBlock(A0_208[A1_209.TargetVar])
  else
    GetTable(A0_208, A1_209.DestVarTable, false)[A1_209.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_210, A1_211)
  if A1_211.TargetVar ~= nil then
    GetTable(A0_210, A1_211.DestVarTable, false)[A1_211.DestVar] = GetTeamID(A0_210[A1_211.TargetVar])
  else
    GetTable(A0_210, A1_211.DestVarTable, false)[A1_211.DestVar] = GetTeamID()
  end
end
BBGetTeamID = L0_0
function L0_0(A0_212, A1_213)
  if A1_213.TargetVar ~= nil then
    GetTable(A0_212, A1_213.DestVarTable, false)[A1_213.DestVar] = GetUnitSkinName(A0_212[A1_213.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_214, A1_215)
  if A1_215.TargetVar ~= nil then
    GetTable(A0_214, A1_215.DestVarTable, false)[A1_215.DestVar] = GetTotalAttackDamage(A0_214[A1_215.TargetVar])
  else
    GetTable(A0_214, A1_215.DestVarTable, false)[A1_215.DestVar] = GetTotalAttackDamage()
  end
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_216, A1_217)
  GetTable(A0_216, A1_217.DestVarTable, true)[A1_217.DestVar] = A1_217.Status(A0_216[A1_217.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_218, A1_219)
  local L2_220
  L2_220 = A1_219.TargetVar
  L2_220 = A0_218[L2_220]
  ClearAttackTarget(L2_220)
end
BBClearAttackTarget = L0_0
function L0_0(A0_221, A1_222)
  GetTable(A0_221, A1_222.DestVarTable, true)[A1_222.DestVar] = A1_222.Info(A0_221[A1_222.TargetVar])
end
BBGetCastInfo = L0_0
function L0_0(A0_223, A1_224, A2_225)
  local L3_226, L4_227, L5_228, L6_229
  L3_226 = GetTable
  L4_227 = A0_223
  L5_228 = A1_224.TrackTimeVarTable
  L6_229 = false
  L3_226 = L3_226(L4_227, L5_228, L6_229)
  L4_227 = GetTime
  L4_227 = L4_227()
  L5_228 = A1_224.ExecuteImmediately
  L6_229 = A1_224.TimeBetweenExecutions
  if A1_224.TickTimeVar ~= nil and GetTable(A0_223, A1_224.TickTimeVarTable, false)[A1_224.TickTimeVar] ~= nil then
    L6_229 = GetTable(A0_223, A1_224.TickTimeVarTable, false)[A1_224.TickTimeVar]
  end
  if L3_226[A1_224.TrackTimeVar] == nil then
    L3_226[A1_224.TrackTimeVar] = L4_227
    if L5_228 == true then
      ExecuteBuildingBlocks(A2_225, A0_223)
    end
  end
  if L4_227 >= L3_226[A1_224.TrackTimeVar] + L6_229 then
    L3_226[A1_224.TrackTimeVar] = L3_226[A1_224.TrackTimeVar] + L6_229
    ExecuteBuildingBlocks(A2_225, A0_223)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_230, A1_231, A2_232)
  GetTable(A0_230, A1_231.TrackTimeVarTable, false)[A1_231.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_233, A1_234)
  local L2_235
  L2_235 = A1_234.SrcValue
  if A1_234.SrcVar ~= nil then
    L2_235 = GetTable(A0_233, A1_234.SrcTable, true)[A1_234.SrcVar]
  end
  A1_234.Status(A0_233[A1_234.TargetVar], L2_235)
end
BBSetStatus = L0_0
function L0_0(A0_236, A1_237)
  local L2_238
  L2_238 = A1_237.ToAlert
  if GetTable(A0_236, A1_237.SrcVarTable, false) ~= nil and A1_237.SrcVar ~= nil then
    L2_238 = L2_238 .. GetTable(A0_236, A1_237.SrcVarTable, false)[A1_237.SrcVar]
  end
  _ALERT(L2_238)
end
BBAlert = L0_0
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
BBSay = L0_0
function L0_0(A0_244, A1_245)
  local L2_246, L3_247, L4_248
  L2_246 = A1_245.ToSay
  L3_247 = GetTable
  L4_248 = A0_244
  L3_247 = L3_247(L4_248, A1_245.SrcVarTable, false)
  if L3_247 ~= nil then
    L4_248 = A1_245.SrcVar
    if L4_248 ~= nil then
      L4_248 = L2_246
      L2_246 = L4_248 .. tostring(L3_247[A1_245.SrcVar])
    end
  end
  L4_248 = nil
  if A1_245.OwnerVar ~= nil then
    L4_248 = A0_244[A1_245.OwnerVar]
  else
    L4_248 = A0_244.Owner
  end
  if A1_245.TextType == nil then
    A1_245.TextType = 0
  end
  Say(L4_248, L2_246, A1_245.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_249, A1_250)
  GetTable(A0_249, A1_250.DestVarTable, true)[A1_250.DestVar] = BBLuaGetGold(A0_249, A1_250)
end
BBGetGold = L0_0
function L0_0(A0_251, A1_252)
  SpellBuffAdd(A0_251[A1_252.OwnerVar], A0_251[A1_252.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_251.NextBuffVars)
  BBTeleportToPositionHelper(A0_251, A1_252)
end
BBTeleportToPosition = L0_0
function L0_0(A0_253, A1_254)
  if A1_254.XVar ~= nil and GetTable(A0_253, A1_254.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_253, A1_254.XVarTable, true)[A1_254.XVar]
  else
    Xloc = A1_254.X
  end
  if A1_254.YVar ~= nil and GetTable(A0_253, A1_254.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_253, A1_254.YVarTable, true)[A1_254.YVar]
  else
    Yloc = A1_254.Y
  end
  if A1_254.ZVar ~= nil and GetTable(A0_253, A1_254.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_253, A1_254.ZVarTable, true)[A1_254.ZVar]
  else
    Zloc = A1_254.Z
  end
  A1_254.OwnerVar, A0_253.position = A1_254.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_254.CastPositionName = "position"
  BBTeleportToPosition(A0_253, A1_254)
end
BBTeleportToPoint = L0_0
function L0_0(A0_255, A1_256)
  DefUpdateAura(GetTable(A0_255, A1_256.CenterTable, false)[A1_256.CenterVar], A1_256.Range, A1_256.UnitScan, A1_256.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_257, A1_258)
  ReincarnateNonDeadHero(GetTable(A0_257, A1_258.TargetTable, false)[A1_258.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_259, A1_260)
  GetTable(A0_259, A1_260.DestVarTable, true)[A1_260.DestVar] = A1_260.Function(A0_259[A1_260.OwnerVar], A1_260.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_261, A1_262)
  local L2_263, L3_264, L4_265, L5_266
  L2_263 = A1_262.WhomToOrderVar
  L2_263 = A0_261[L2_263]
  L3_264 = A1_262.TargetOfOrderVar
  L3_264 = A0_261[L3_264]
  L4_265 = GetTable
  L5_266 = A0_261
  L4_265 = L4_265(L5_266, A1_262.SrcVarTable, false)
  L5_266 = nil
  if A1_262.SrcVar ~= nil and L4_265 ~= nil then
    L5_266 = L4_265[A1_262.SrcVar]
  else
    L5_266 = GetPosition(L3_264)
  end
  if L3_264 == nil then
    L3_264 = L2_263
  end
  IssueOrder(L2_263, A1_262.Order, L5_266, L3_264)
end
BBIssueOrder = L0_0
function L0_0(A0_267, A1_268)
  SetSpellCastRange(A1_268.NewRange)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_269, A1_270)
  GetTable(A0_269, A1_270.DestVarTable, true)[A1_270.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_271, A1_272)
  local L2_273, L3_274
  L2_273 = A1_272.ObjectVar1
  L2_273 = A0_271[L2_273]
  L3_274 = A1_272.ObjectVar2
  L3_274 = A0_271[L3_274]
  GetTable(A0_271, A1_272.DestVarTable, true)[A1_272.DestVar] = DistanceBetweenObjectBounds(L2_273, L3_274)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_275, A1_276)
  local L2_277, L3_278, L4_279
  L2_277 = A1_276.ObjectVar
  L2_277 = A0_275[L2_277]
  L3_278 = GetTable
  L4_279 = A0_275
  L3_278 = L3_278(L4_279, A1_276.PointVarTable, true)
  L4_279 = A1_276.PointVar
  L4_279 = L3_278[L4_279]
  GetTable(A0_275, A1_276.DestVarTable, true)[A1_276.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_277, L4_279)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_280, A1_281)
  local L2_282, L3_283, L4_284, L5_285
  L2_282 = GetTable
  L3_283 = A0_280
  L4_284 = A1_281.Point1VarTable
  L5_285 = true
  L2_282 = L2_282(L3_283, L4_284, L5_285)
  L3_283 = A1_281.Point1Var
  L3_283 = L2_282[L3_283]
  L4_284 = GetTable
  L5_285 = A0_280
  L4_284 = L4_284(L5_285, A1_281.Point2VarTable, true)
  L5_285 = A1_281.Point2Var
  L5_285 = L4_284[L5_285]
  GetTable(A0_280, A1_281.DestVarTable, true)[A1_281.DestVar] = DistanceBetweenPoints(L3_283, L5_285)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_286, A1_287, A2_288)
  local L3_289, L4_290, L5_291, L6_292, L7_293, L8_294
  L5_291 = 0
  L6_292 = nil
  L7_293 = A1_287.ObjectDistanceType
  L8_294 = A1_287.ObjectVar1
  L3_289 = A0_286[L8_294]
  L8_294 = A1_287.ObjectVar2
  L4_290 = A0_286[L8_294]
  if nil == L4_290 then
    L8_294 = A1_287.Point2Var
    if nil ~= L8_294 then
      L8_294 = GetTable
      L8_294 = L8_294(A0_286, A1_287.Point2VarTable, true)
      L4_290 = L8_294[A1_287.Point2Var]
      L5_291 = L5_291 + 1
    end
  end
  if nil == L3_289 then
    L8_294 = A1_287.Point1Var
    if nil ~= L8_294 then
      L8_294 = GetTable
      L8_294 = L8_294(A0_286, A1_287.Point1VarTable, true)
      L3_289 = L8_294[A1_287.Point1Var]
      L5_291 = L5_291 + 1
      if 1 == L5_291 then
        L3_289, L4_290 = L4_290, L3_289
      end
    end
  end
  if nil ~= L7_293 then
    if 0 == L5_291 then
      L8_294 = OBJECT_CENTER
      if L8_294 == L7_293 then
        L6_292 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_294 = OBJECT_BOUNDARY
        if L8_294 == L7_293 then
          L6_292 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_294 = A1_287.OwnerVar
          L8_294 = A0_286[L8_294]
          Say(L8_294, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_291 then
      L8_294 = OBJECT_CENTER
      if L8_294 == L7_293 then
        L6_292 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_294 = OBJECT_BOUNDARY
        if L8_294 == L7_293 then
          L6_292 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_294 = A1_287.OwnerVar
          L8_294 = A0_286[L8_294]
          Say(L8_294, "invalid object distance type", 0)
        end
      end
    else
      L6_292 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_294 = A1_287.Distance
  if A1_287.DistanceVar ~= nil and GetTable(A0_286, A1_287.DistanceVarTable, true) ~= nil then
    L8_294 = L8_294 + GetTable(A0_286, A1_287.DistanceVarTable, true)[A1_287.DistanceVar]
  end
  if L3_289 ~= nil and L4_290 ~= nil and L6_292 ~= nil and L8_294 ~= nil then
    if not L6_292(L3_289, L4_290, L8_294) then
      ExecuteBuildingBlocks(A2_288, A0_286)
      A0_286.LastIfSucceeded = true
    else
      A0_286.LastIfSucceeded = false
    end
  else
    A0_286.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_295, A1_296)
  local L2_297, L3_298
  L2_297 = A1_296.TargetVar
  L2_297 = A0_295[L2_297]
  L3_298 = A1_296.CasterVar
  L3_298 = A0_295[L3_298]
  GetTable(A0_295, A1_296.DestVarTable, true)[A1_296.DestVar] = SpellBuffCount(L2_297, A1_296.BuffName, L3_298)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_299, A1_300)
  local L2_301
  L2_301 = A1_300.TargetVar
  L2_301 = A0_299[L2_301]
  GetTable(A0_299, A1_300.DestVarTable, true)[A1_300.DestVar] = SpellBuffCount(L2_301, A1_300.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_302, A1_303)
  local L2_304, L3_305
  L2_304 = GetTable
  L3_305 = A0_302
  L2_304 = L2_304(L3_305, A1_303.ScaleVarTable, false)
  L3_305 = nil
  if A1_303.OwnerVar ~= nil then
    L3_305 = A0_302[A1_303.OwnerVar]
  else
    L3_305 = A0_302.Owner
  end
  if A1_303.ScaleVar ~= nil and A1_303.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_304[A1_303.ScaleVar], L3_305)
  else
    SetScaleSkinCoef(A1_303.Scale, L3_305)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_306, A1_307)
  SpellBuffAdd(A0_306[A1_307.TargetVar], A0_306[A1_307.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_306.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_308, A1_309, A2_310)
  local L3_311, L4_312
  L3_311 = A1_309.TargetVar
  L3_311 = A0_308[L3_311]
  L4_312 = A1_309.NumStacks
  if A1_309.NumStacks == 0 then
    L4_312 = SpellBuffCount(L3_311, A1_309.BuffName, caster)
  end
  while L4_312 > 0 do
    SpellBuffRemove(L3_311, A1_309.BuffName, A0_308[A1_309.AttackerVar])
    L4_312 = L4_312 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_313, A1_314, A2_315)
  if A0_313.EmoteId == A1_314.EmoteId then
    ExecuteBuildingBlocks(A2_315, A0_313)
    A0_313.LastIfSucceeded = true
  else
    A0_313.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_316, A1_317, A2_318)
  if A0_316.EmoteId ~= A1_317.EmoteId then
    ExecuteBuildingBlocks(A2_318, A0_316)
    A0_316.LastIfSucceeded = true
  else
    A0_316.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
