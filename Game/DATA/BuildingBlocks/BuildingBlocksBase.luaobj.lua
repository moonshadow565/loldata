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
function L0_0(A0_73, A1_74, A2_75)
  local L3_76, L4_77, L5_78, L6_79
  L3_76 = GetTable
  L4_77 = A0_73
  L5_78 = A1_74.Src1VarTable
  L6_79 = false
  L3_76 = L3_76(L4_77, L5_78, L6_79)
  L4_77 = GetTable
  L5_78 = A0_73
  L6_79 = A1_74.Src2VarTable
  L4_77 = L4_77(L5_78, L6_79, false)
  L5_78 = false
  L6_79 = nil
  if L3_76 ~= nil and A1_74.Src1Var ~= nil then
    L6_79 = L3_76[A1_74.Src1Var]
  else
    L6_79 = A1_74.Value1
  end
  if L4_77 ~= nil and A1_74.Src2Var ~= nil then
    L5_78 = A1_74.CompareOp(L6_79, L4_77[A1_74.Src2Var])
  else
    L5_78 = A1_74.CompareOp(L6_79, A1_74.Value2)
  end
  if L5_78 then
    ExecuteBuildingBlocks(A2_75, A0_73)
    A0_73.LastIfSucceeded = true
  else
    A0_73.LastIfSucceeded = false
  end
end
BBIf = L0_0
function L0_0(A0_80, A1_81, A2_82)
  if A0_80.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_82, A0_80)
    A0_80.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_83, A1_84, A2_85)
  local L3_86, L4_87, L5_88, L6_89
  L3_86 = A0_83.LastIfSucceeded
  if L3_86 == false then
    L3_86 = GetTable
    L4_87 = A0_83
    L5_88 = A1_84.Src1VarTable
    L6_89 = false
    L3_86 = L3_86(L4_87, L5_88, L6_89)
    L4_87 = GetTable
    L5_88 = A0_83
    L6_89 = A1_84.Src2VarTable
    L4_87 = L4_87(L5_88, L6_89, false)
    L5_88 = false
    L6_89 = nil
    if L3_86 ~= nil and A1_84.Src1Var ~= nil then
      L6_89 = L3_86[A1_84.Src1Var]
    else
      L6_89 = A1_84.Value1
    end
    if L4_87 ~= nil and A1_84.Src2Var ~= nil then
      L5_88 = A1_84.CompareOp(L6_89, L4_87[A1_84.Src2Var])
    else
      L5_88 = A1_84.CompareOp(L6_89, A1_84.Value2)
    end
    if L5_88 then
      ExecuteBuildingBlocks(A2_85, A0_83)
      A0_83.LastIfSucceeded = true
    else
      A0_83.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_90, A1_91, A2_92)
  local L3_93
  if A1_91.TargetVar ~= nil then
    L3_93 = A0_90[A1_91.TargetVar]
  else
    L3_93 = A0_90.Target
  end
  if HasBuffOfType(L3_93, A1_91.BuffType) then
    ExecuteBuildingBlocks(A2_92, A0_90)
    A0_90.LastIfSucceeded = true
  else
    A0_90.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_94, A1_95, A2_96)
  local L3_97, L4_98
  if A1_95.OwnerVar ~= nil then
    L3_97 = A0_94[A1_95.OwnerVar]
  else
    L3_97 = A0_94.Owner
  end
  if A1_95.AttackerVar ~= nil then
    L4_98 = A0_94[A1_95.AttackerVar]
  else
    L4_98 = A0_94.Attacker
  end
  if SpellBuffCount(L3_97, A1_95.BuffName, L4_98) > 0 then
    ExecuteBuildingBlocks(A2_96, A0_94)
    A0_94.LastIfSucceeded = true
  else
    A0_94.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_99, A1_100)
  A0_99.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_101, A1_102, A2_103)
  local L3_104, L4_105
  if A1_102.OwnerVar ~= nil then
    L3_104 = A0_101[A1_102.OwnerVar]
  else
    L3_104 = A0_101.Owner
  end
  if A1_102.CasterVar ~= nil then
    L4_105 = A0_101[A1_102.CasterVar]
  else
    L4_105 = A0_101.Caster
  end
  if SpellBuffCount(L3_104, A1_102.BuffName, L4_105) <= 0 then
    ExecuteBuildingBlocks(A2_103, A0_101)
    A0_101.LastIfSucceeded = true
  else
    A0_101.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_106, A1_107, A2_108)
  local L3_109, L4_110
  if A1_107.OwnerVar ~= nil then
    L3_109 = A0_106[A1_107.OwnerVar]
  else
    L3_109 = A0_106.Owner
  end
  if HasPARType(L3_109, A1_107.PARType) then
    ExecuteBuildingBlocks(A2_108, A0_106)
    A0_106.LastIfSucceeded = true
  else
    A0_106.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_111, A1_112, A2_113)
  local L3_114, L4_115
  if A1_112.OwnerVar ~= nil then
    L3_114 = A0_111[A1_112.OwnerVar]
  else
    L3_114 = A0_111.Owner
  end
  if not HasPARType(L3_114, A1_112.PARType) then
    ExecuteBuildingBlocks(A2_113, A0_111)
    A0_111.LastIfSucceeded = true
  else
    A0_111.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_116, A1_117, A2_118)
  local L3_119, L4_120, L5_121, L6_122, L7_123
  L3_119 = GetTable
  L4_120 = A0_116
  L5_121 = A1_117.Src1VarTable
  L6_122 = false
  L3_119 = L3_119(L4_120, L5_121, L6_122)
  L4_120 = GetTable
  L5_121 = A0_116
  L6_122 = A1_117.Src2VarTable
  L7_123 = false
  L4_120 = L4_120(L5_121, L6_122, L7_123)
  L5_121 = true
  while L5_121 do
    L6_122 = false
    L7_123 = nil
    if L3_119 ~= nil and A1_117.Src1Var ~= nil then
      L7_123 = L3_119[A1_117.Src1Var]
    else
      L7_123 = A1_117.Value1
    end
    if L4_120 ~= nil and A1_117.Src2Var ~= nil then
      L6_122 = A1_117.CompareOp(L7_123, L4_120[A1_117.Src2Var])
    else
      L6_122 = A1_117.CompareOp(L7_123, A1_117.Value2)
    end
    if L6_122 then
      ExecuteBuildingBlocks(A2_118, A0_116)
    else
      L5_121 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_124, A1_125)
  return A0_124 * A1_125
end
MO_MULTIPLY = L0_0
function L0_0(A0_126, A1_127)
  return A0_126 + A1_127
end
MO_ADD = L0_0
function L0_0(A0_128, A1_129)
  return A0_128 - A1_129
end
MO_SUBTRACT = L0_0
function L0_0(A0_130, A1_131)
  return A0_130 / A1_131
end
MO_DIVIDE = L0_0
function L0_0(A0_132, A1_133)
  if A0_132 < A1_133 then
    return A0_132
  else
    return A1_133
  end
end
MO_MIN = L0_0
function L0_0(A0_134, A1_135)
  if A1_135 < A0_134 then
    return A0_134
  else
    return A1_135
  end
end
MO_MAX = L0_0
function L0_0(A0_136, A1_137)
  return A0_136 % A1_137
end
MO_MODULO = L0_0
function L0_0(A0_138)
  return math.floor(A0_138 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_139)
  return math.ceil(A0_139)
end
MO_ROUNDUP = L0_0
function L0_0(A0_140)
  return math.floor(A0_140)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_141)
  return math.sin(math.rad(A0_141))
end
MO_SIN = L0_0
function L0_0(A0_142)
  return math.cos(math.rad(A0_142))
end
MO_COSINE = L0_0
function L0_0(A0_143)
  return math.tan(math.rad(A0_143))
end
MO_TANGENT = L0_0
function L0_0(A0_144)
  return math.deg(math.asin(A0_144))
end
MO_ASIN = L0_0
function L0_0(A0_145)
  return math.deg(math.acos(A0_145))
end
MO_ACOS = L0_0
function L0_0(A0_146)
  return math.deg(math.atan(A0_146))
end
MO_ATAN = L0_0
function L0_0(A0_147, A1_148)
  return math.pow(A0_147, A1_148)
end
MO_POW = L0_0
function L0_0(A0_149)
  return math.sqrt(A0_149)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_150, A1_151)
  local L2_152
  L2_152 = A0_150 and A1_151
  return L2_152
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_153, A1_154)
  local L2_155
  L2_155 = A0_153 or A1_154
  return L2_155
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_156)
  local L1_157
  L1_157 = not A0_156
  return L1_157
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_158)
  return math.abs(A0_158)
end
MO_ABS = L0_0
function L0_0(A0_159, A1_160)
  local L2_161, L3_162
  L2_161 = GetMathNumber
  L3_162 = A0_159
  L2_161 = L2_161(L3_162, A1_160.Src1VarTable, A1_160.Src1Var, A1_160.Src1Value)
  L3_162 = GetMathNumber
  L3_162 = L3_162(A0_159, A1_160.Src2VarTable, A1_160.Src2Var, A1_160.Src2Value)
  GetTable(A0_159, A1_160.DestVarTable)[A1_160.DestVar] = A1_160.MathOp(L2_161, L3_162)
end
BBMath = L0_0
function L0_0(A0_163, A1_164, A2_165, A3_166)
  if A2_165 ~= nil and GetTable(A0_163, A1_164)[A2_165] ~= nil then
    return GetTable(A0_163, A1_164)[A2_165]
  end
  return A3_166
end
GetMathNumber = L0_0
function L0_0(A0_167, A1_168)
  if type(A1_168) == "number" then
    return A1_168
  elseif type(A1_168) == "function" then
    return A1_168(A0_167)
  elseif type(A1_168) == "string" then
    return A0_167[A1_168]
  end
end
GetNumber = L0_0
function L0_0(A0_169, A1_170)
  return VectorAdd(A0_169, A1_170)
end
VEC_ADD = L0_0
function L0_0(A0_171, A1_172)
  return VectorSubtract(A0_171, A1_172)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_173, A1_174)
  return VectorScalarMultiply(A0_173, A1_174)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_175, A1_176)
  return VectorScalarDivide(A0_175, A1_176)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_177, A1_178)
  return VectorRotateY(A0_177, A1_178)
end
VEC_ROTATE = L0_0
function L0_0(A0_179, A1_180)
  BBMath(A0_179, A1_180)
end
BBVectorMath = L0_0
function L0_0(A0_181, A1_182)
  local L2_183, L3_184, L4_185, L5_186
  L2_183 = A0_181.InstanceVars
  L3_184 = L2_183.InterpDelta
  if L3_184 == nil then
    L3_184 = A1_182.Amount
    L4_185 = A1_182.AmountVar
    if L4_185 ~= nil then
      L4_185 = GetTable
      L5_186 = A0_181
      L4_185 = L4_185(L5_186, A1_182.AmountVarTable)
      L5_186 = A1_182.AmountVar
      L3_184 = L4_185[L5_186]
    end
    L4_185 = GetPosition
    L5_186 = A1_182.TargetVar
    L5_186 = A0_181[L5_186]
    L4_185 = L4_185(L5_186)
    L2_183.KnockBackStart = L4_185
    L4_185 = GetNormalizedPositionDelta
    L5_186 = A1_182.TargetVar
    L5_186 = A0_181[L5_186]
    L4_185 = L4_185(L5_186, A0_181[A1_182.AttackerVar], true)
    L5_186 = {}
    L5_186.x = L4_185.x * L3_184
    L5_186.y = 0
    L5_186.z = L4_185.z * L3_184
    L2_183.InterpDelta = L5_186
    L5_186 = GetTime
    L5_186 = L5_186()
    L2_183.StartTime = L5_186
    L5_186 = A1_182.KnockBackDuration
    L2_183.KnockBackDuration = L5_186
  end
  L3_184 = A1_182.TargetVar
  L3_184 = A0_181[L3_184]
  L4_185 = GetTime
  L4_185 = L4_185()
  L5_186 = L2_183.StartTime
  L4_185 = L4_185 - L5_186
  L5_186 = L2_183.KnockBackDuration
  L4_185 = L4_185 / L5_186
  L5_186 = {}
  L5_186.x = L2_183.KnockBackStart.x + L2_183.InterpDelta.x * L4_185
  L5_186.y = L2_183.KnockBackStart.y
  L5_186.z = L2_183.KnockBackStart.z + L2_183.InterpDelta.z * L4_185
  SetPosition(L3_184, L5_186)
end
BBKnockback = L0_0
function L0_0(A0_187, A1_188)
  local L2_189
  L2_189 = 0
  if A1_188.Delta ~= nil then
    L2_189 = L2_189 + A1_188.Delta
  end
  if A1_188.DeltaByLevel ~= nil and A0_187.Level ~= nil then
    L2_189 = L2_189 + A1_188.DeltaByLevel[A0_187.Level]
  end
  if A1_188.DeltaVar ~= nil then
    L2_189 = L2_189 + GetTable(A0_187, A1_188.DeltaVarTable, true)[A1_188.DeltaVar]
  end
  if A1_188.TargetVar ~= nil then
    A1_188.Stat(L2_189, A0_187[A1_188.TargetVar])
  else
    A1_188.Stat(L2_189)
  end
end
BBIncStat = L0_0
function L0_0(A0_190, A1_191)
  local L2_192
  L2_192 = 0
  if A1_191.Delta ~= nil then
    L2_192 = L2_192 + A1_191.Delta
  end
  if A1_191.DeltaByLevel ~= nil and A0_190.Level ~= nil then
    L2_192 = L2_192 + A1_191.DeltaByLevel[A0_190.Level]
  end
  if A1_191.DeltaVar ~= nil then
    L2_192 = L2_192 + GetTable(A0_190, A1_191.DeltaVarTable, true)[A1_191.DeltaVar]
  end
  if A1_191.TargetVar ~= nil then
    A1_191.Stat(L2_192, A0_190[A1_191.TargetVar])
  else
    A1_191.Stat(L2_192)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_193, A1_194)
  if A1_194.TargetVar ~= nil then
    GetTable(A0_193, A1_194.DestVarTable, false)[A1_194.DestVar] = A1_194.Stat(A0_193[A1_194.TargetVar])
  else
    GetTable(A0_193, A1_194.DestVarTable, false)[A1_194.DestVar] = A1_194.Stat()
  end
end
BBGetStat = L0_0
function L0_0(A0_195, A1_196)
  if A1_196.TargetVar ~= nil then
    GetTable(A0_195, A1_196.DestVarTable, false)[A1_196.DestVar] = GetLevel(A0_195[A1_196.TargetVar])
  else
    GetTable(A0_195, A1_196.DestVarTable, false)[A1_196.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_197, A1_198)
  if A1_198.TargetVar ~= nil then
    GetTable(A0_197, A1_198.DestVarTable, false)[A1_198.DestVar] = GetArmor(A0_197[A1_198.TargetVar])
  else
    GetTable(A0_197, A1_198.DestVarTable, false)[A1_198.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_199, A1_200)
  if A1_200.TargetVar ~= nil then
    GetTable(A0_199, A1_200.DestVarTable, false)[A1_200.DestVar] = GetSpellBlock(A0_199[A1_200.TargetVar])
  else
    GetTable(A0_199, A1_200.DestVarTable, false)[A1_200.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_201, A1_202)
  if A1_202.TargetVar ~= nil then
    GetTable(A0_201, A1_202.DestVarTable, false)[A1_202.DestVar] = GetTeamID(A0_201[A1_202.TargetVar])
  else
    GetTable(A0_201, A1_202.DestVarTable, false)[A1_202.DestVar] = GetTeamID()
  end
end
BBGetTeamID = L0_0
function L0_0(A0_203, A1_204)
  if A1_204.TargetVar ~= nil then
    GetTable(A0_203, A1_204.DestVarTable, false)[A1_204.DestVar] = GetUnitSkinName(A0_203[A1_204.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_205, A1_206)
  if A1_206.TargetVar ~= nil then
    GetTable(A0_205, A1_206.DestVarTable, false)[A1_206.DestVar] = GetTotalAttackDamage(A0_205[A1_206.TargetVar])
  else
    GetTable(A0_205, A1_206.DestVarTable, false)[A1_206.DestVar] = GetTotalAttackDamage()
  end
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_207, A1_208)
  GetTable(A0_207, A1_208.DestVarTable, true)[A1_208.DestVar] = A1_208.Status(A0_207[A1_208.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_209, A1_210)
  GetTable(A0_209, A1_210.DestVarTable, true)[A1_210.DestVar] = A1_210.Info(A0_209[A1_210.TargetVar])
end
BBGetCastInfo = L0_0
function L0_0(A0_211, A1_212)
  SetCanCastWhileDisabled(A1_212.CanCast)
end
BBSetCanCastWhileDisabled = L0_0
function L0_0(A0_213, A1_214, A2_215)
  local L3_216, L4_217, L5_218, L6_219
  L3_216 = GetTable
  L4_217 = A0_213
  L5_218 = A1_214.TrackTimeVarTable
  L6_219 = false
  L3_216 = L3_216(L4_217, L5_218, L6_219)
  L4_217 = GetTime
  L4_217 = L4_217()
  L5_218 = A1_214.ExecuteImmediately
  L6_219 = A1_214.TimeBetweenExecutions
  if A1_214.TickTimeVar ~= nil and GetTable(A0_213, A1_214.TickTimeVarTable, false)[A1_214.TickTimeVar] ~= nil then
    L6_219 = GetTable(A0_213, A1_214.TickTimeVarTable, false)[A1_214.TickTimeVar]
  end
  if L3_216[A1_214.TrackTimeVar] == nil then
    L3_216[A1_214.TrackTimeVar] = L4_217
    if L5_218 == true then
      ExecuteBuildingBlocks(A2_215, A0_213)
    end
  end
  if L4_217 >= L3_216[A1_214.TrackTimeVar] + L6_219 then
    L3_216[A1_214.TrackTimeVar] = L3_216[A1_214.TrackTimeVar] + L6_219
    ExecuteBuildingBlocks(A2_215, A0_213)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_220, A1_221, A2_222)
  GetTable(A0_220, A1_221.TrackTimeVarTable, false)[A1_221.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_223, A1_224)
  local L2_225
  L2_225 = A1_224.SrcValue
  if A1_224.SrcVar ~= nil then
    L2_225 = GetTable(A0_223, A1_224.SrcTable, true)[A1_224.SrcVar]
  end
  A1_224.Status(A0_223[A1_224.TargetVar], L2_225)
end
BBSetStatus = L0_0
function L0_0(A0_226, A1_227)
  local L2_228
  L2_228 = A1_227.ToAlert
  if GetTable(A0_226, A1_227.SrcVarTable, false) ~= nil and A1_227.SrcVar ~= nil then
    L2_228 = L2_228 .. GetTable(A0_226, A1_227.SrcVarTable, false)[A1_227.SrcVar]
  end
  _ALERT(L2_228)
end
BBAlert = L0_0
function L0_0(A0_229, A1_230)
  local L2_231, L3_232, L4_233
  L2_231 = A1_230.ToSay
  L3_232 = GetTable
  L4_233 = A0_229
  L3_232 = L3_232(L4_233, A1_230.SrcVarTable, false)
  if L3_232 ~= nil then
    L4_233 = A1_230.SrcVar
    if L4_233 ~= nil then
      L4_233 = L2_231
      L2_231 = L4_233 .. tostring(L3_232[A1_230.SrcVar])
    end
  end
  L4_233 = nil
  if A1_230.OwnerVar ~= nil then
    L4_233 = A0_229[A1_230.OwnerVar]
  else
    L4_233 = A0_229.Owner
  end
  if A1_230.TextType == nil then
    A1_230.TextType = 0
  end
  Say(L4_233, L2_231, A1_230.TextType)
end
BBSay = L0_0
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
BBDebugSay = L0_0
function L0_0(A0_239, A1_240)
  GetTable(A0_239, A1_240.DestVarTable, true)[A1_240.DestVar] = BBLuaGetGold(A0_239, A1_240)
end
BBGetGold = L0_0
function L0_0(A0_241, A1_242)
  SpellBuffAdd(A0_241[A1_242.OwnerVar], A0_241[A1_242.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_241.NextBuffVars)
  BBTeleportToPositionHelper(A0_241, A1_242)
end
BBTeleportToPosition = L0_0
function L0_0(A0_243, A1_244)
  if A1_244.XVar ~= nil and GetTable(A0_243, A1_244.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_243, A1_244.XVarTable, true)[A1_244.XVar]
  else
    Xloc = A1_244.X
  end
  if A1_244.YVar ~= nil and GetTable(A0_243, A1_244.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_243, A1_244.YVarTable, true)[A1_244.YVar]
  else
    Yloc = A1_244.Y
  end
  if A1_244.ZVar ~= nil and GetTable(A0_243, A1_244.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_243, A1_244.ZVarTable, true)[A1_244.ZVar]
  else
    Zloc = A1_244.Z
  end
  A1_244.OwnerVar, A0_243.position = A1_244.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_244.CastPositionName = "position"
  BBTeleportToPosition(A0_243, A1_244)
end
BBTeleportToPoint = L0_0
function L0_0(A0_245, A1_246)
  DefUpdateAura(GetTable(A0_245, A1_246.CenterTable, false)[A1_246.CenterVar], A1_246.Range, A1_246.UnitScan, A1_246.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_247, A1_248)
  ReincarnateNonDeadHero(GetTable(A0_247, A1_248.TargetTable, false)[A1_248.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_249, A1_250)
  GetTable(A0_249, A1_250.DestVarTable, true)[A1_250.DestVar] = A1_250.Function(A0_249[A1_250.OwnerVar], A1_250.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_251, A1_252)
  local L2_253, L3_254, L4_255, L5_256
  L2_253 = A1_252.WhomToOrderVar
  L2_253 = A0_251[L2_253]
  L3_254 = A1_252.TargetOfOrderVar
  L3_254 = A0_251[L3_254]
  L4_255 = GetTable
  L5_256 = A0_251
  L4_255 = L4_255(L5_256, A1_252.SrcVarTable, false)
  L5_256 = nil
  if A1_252.SrcVar ~= nil and L4_255 ~= nil then
    L5_256 = L4_255[A1_252.SrcVar]
  else
    L5_256 = GetPosition(L3_254)
  end
  if L3_254 == nil then
    L3_254 = L2_253
  end
  IssueOrder(L2_253, A1_252.Order, L5_256, L3_254)
end
BBIssueOrder = L0_0
function L0_0(A0_257, A1_258)
  SetSpellCastRange(A1_258.NewRange)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_259, A1_260)
  GetTable(A0_259, A1_260.DestVarTable, true)[A1_260.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_261, A1_262)
  local L2_263, L3_264
  L2_263 = A1_262.ObjectVar1
  L2_263 = A0_261[L2_263]
  L3_264 = A1_262.ObjectVar2
  L3_264 = A0_261[L3_264]
  GetTable(A0_261, A1_262.DestVarTable, true)[A1_262.DestVar] = DistanceBetweenObjectBounds(L2_263, L3_264)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_265, A1_266)
  local L2_267, L3_268, L4_269
  L2_267 = A1_266.ObjectVar
  L2_267 = A0_265[L2_267]
  L3_268 = GetTable
  L4_269 = A0_265
  L3_268 = L3_268(L4_269, A1_266.PointVarTable, true)
  L4_269 = A1_266.PointVar
  L4_269 = L3_268[L4_269]
  GetTable(A0_265, A1_266.DestVarTable, true)[A1_266.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_267, L4_269)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_270, A1_271)
  local L2_272, L3_273, L4_274, L5_275
  L2_272 = GetTable
  L3_273 = A0_270
  L4_274 = A1_271.Point1VarTable
  L5_275 = true
  L2_272 = L2_272(L3_273, L4_274, L5_275)
  L3_273 = A1_271.Point1Var
  L3_273 = L2_272[L3_273]
  L4_274 = GetTable
  L5_275 = A0_270
  L4_274 = L4_274(L5_275, A1_271.Point2VarTable, true)
  L5_275 = A1_271.Point2Var
  L5_275 = L4_274[L5_275]
  GetTable(A0_270, A1_271.DestVarTable, true)[A1_271.DestVar] = DistanceBetweenPoints(L3_273, L5_275)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_276, A1_277, A2_278)
  local L3_279, L4_280, L5_281, L6_282, L7_283, L8_284
  L5_281 = 0
  L6_282 = nil
  L7_283 = A1_277.ObjectDistanceType
  L8_284 = A1_277.ObjectVar1
  L3_279 = A0_276[L8_284]
  L8_284 = A1_277.ObjectVar2
  L4_280 = A0_276[L8_284]
  if nil == L4_280 then
    L8_284 = A1_277.Point2Var
    if nil ~= L8_284 then
      L8_284 = GetTable
      L8_284 = L8_284(A0_276, A1_277.Point2VarTable, true)
      L4_280 = L8_284[A1_277.Point2Var]
      L5_281 = L5_281 + 1
    end
  end
  if nil == L3_279 then
    L8_284 = A1_277.Point1Var
    if nil ~= L8_284 then
      L8_284 = GetTable
      L8_284 = L8_284(A0_276, A1_277.Point1VarTable, true)
      L3_279 = L8_284[A1_277.Point1Var]
      L5_281 = L5_281 + 1
      if 1 == L5_281 then
        L3_279, L4_280 = L4_280, L3_279
      end
    end
  end
  if nil ~= L7_283 then
    if 0 == L5_281 then
      L8_284 = OBJECT_CENTER
      if L8_284 == L7_283 then
        L6_282 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_284 = OBJECT_BOUNDARY
        if L8_284 == L7_283 then
          L6_282 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_284 = A1_277.OwnerVar
          L8_284 = A0_276[L8_284]
          Say(L8_284, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_281 then
      L8_284 = OBJECT_CENTER
      if L8_284 == L7_283 then
        L6_282 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_284 = OBJECT_BOUNDARY
        if L8_284 == L7_283 then
          L6_282 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_284 = A1_277.OwnerVar
          L8_284 = A0_276[L8_284]
          Say(L8_284, "invalid object distance type", 0)
        end
      end
    else
      L6_282 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_284 = A1_277.Distance
  if A1_277.DistanceVar ~= nil and GetTable(A0_276, A1_277.DistanceVarTable, true) ~= nil then
    L8_284 = L8_284 + GetTable(A0_276, A1_277.DistanceVarTable, true)[A1_277.DistanceVar]
  end
  if L3_279 ~= nil and L4_280 ~= nil and L6_282 ~= nil and L8_284 ~= nil then
    if not L6_282(L3_279, L4_280, L8_284) then
      ExecuteBuildingBlocks(A2_278, A0_276)
      A0_276.LastIfSucceeded = true
    else
      A0_276.LastIfSucceeded = false
    end
  else
    A0_276.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_285, A1_286)
  local L2_287, L3_288
  L2_287 = A1_286.TargetVar
  L2_287 = A0_285[L2_287]
  L3_288 = A1_286.CasterVar
  L3_288 = A0_285[L3_288]
  GetTable(A0_285, A1_286.DestVarTable, true)[A1_286.DestVar] = SpellBuffCount(L2_287, A1_286.BuffName, L3_288)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_289, A1_290)
  local L2_291
  L2_291 = A1_290.TargetVar
  L2_291 = A0_289[L2_291]
  GetTable(A0_289, A1_290.DestVarTable, true)[A1_290.DestVar] = SpellBuffCount(L2_291, A1_290.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_292, A1_293)
  local L2_294, L3_295
  L2_294 = GetTable
  L3_295 = A0_292
  L2_294 = L2_294(L3_295, A1_293.ScaleVarTable, false)
  L3_295 = nil
  if A1_293.OwnerVar ~= nil then
    L3_295 = A0_292[A1_293.OwnerVar]
  else
    L3_295 = A0_292.Owner
  end
  if A1_293.ScaleVar ~= nil and A1_293.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_294[A1_293.ScaleVar], L3_295)
  else
    SetScaleSkinCoef(A1_293.Scale, L3_295)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_296, A1_297)
  SpellBuffAdd(A0_296[A1_297.TargetVar], A0_296[A1_297.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_296.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_298, A1_299, A2_300)
  local L3_301, L4_302
  L3_301 = A1_299.TargetVar
  L3_301 = A0_298[L3_301]
  L4_302 = A1_299.NumStacks
  if A1_299.NumStacks == 0 then
    L4_302 = SpellBuffCount(L3_301, A1_299.BuffName, caster)
  end
  while L4_302 > 0 do
    SpellBuffRemove(L3_301, A1_299.BuffName, A0_298[A1_299.AttackerVar])
    L4_302 = L4_302 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_303, A1_304, A2_305)
  if A0_303.EmoteId == A1_304.EmoteId then
    ExecuteBuildingBlocks(A2_305, A0_303)
    A0_303.LastIfSucceeded = true
  else
    A0_303.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_306, A1_307, A2_308)
  if A0_306.EmoteId ~= A1_307.EmoteId then
    ExecuteBuildingBlocks(A2_308, A0_306)
    A0_306.LastIfSucceeded = true
  else
    A0_306.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
