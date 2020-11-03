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
function L0_0(A0_143)
  return math.deg(math.asin(A0_143))
end
MO_ASIN = L0_0
function L0_0(A0_144)
  return math.deg(math.acos(A0_144))
end
MO_ACOS = L0_0
function L0_0(A0_145)
  return math.deg(math.atan(A0_145))
end
MO_ATAN = L0_0
function L0_0(A0_146, A1_147)
  return math.pow(A0_146, A1_147)
end
MO_POW = L0_0
function L0_0(A0_148)
  return math.sqrt(A0_148)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_149, A1_150)
  local L2_151
  L2_151 = A0_149 and A1_150
  return L2_151
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_152, A1_153)
  local L2_154
  L2_154 = A0_152 or A1_153
  return L2_154
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_155)
  local L1_156
  L1_156 = not A0_155
  return L1_156
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_157, A1_158)
  local L2_159, L3_160
  L2_159 = GetMathNumber
  L3_160 = A0_157
  L2_159 = L2_159(L3_160, A1_158.Src1VarTable, A1_158.Src1Var, A1_158.Src1Value)
  L3_160 = GetMathNumber
  L3_160 = L3_160(A0_157, A1_158.Src2VarTable, A1_158.Src2Var, A1_158.Src2Value)
  GetTable(A0_157, A1_158.DestVarTable)[A1_158.DestVar] = A1_158.MathOp(L2_159, L3_160)
end
BBMath = L0_0
function L0_0(A0_161, A1_162, A2_163, A3_164)
  if A2_163 ~= nil and GetTable(A0_161, A1_162)[A2_163] ~= nil then
    return GetTable(A0_161, A1_162)[A2_163]
  end
  return A3_164
end
GetMathNumber = L0_0
function L0_0(A0_165, A1_166)
  if type(A1_166) == "number" then
    return A1_166
  elseif type(A1_166) == "function" then
    return A1_166(A0_165)
  elseif type(A1_166) == "string" then
    return A0_165[A1_166]
  end
end
GetNumber = L0_0
function L0_0(A0_167, A1_168)
  return VectorAdd(A0_167, A1_168)
end
VEC_ADD = L0_0
function L0_0(A0_169, A1_170)
  return VectorSubtract(A0_169, A1_170)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_171, A1_172)
  return VectorScalarMultiply(A0_171, A1_172)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_173, A1_174)
  return VectorScalarDivide(A0_173, A1_174)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_175, A1_176)
  return VectorRotateY(A0_175, A1_176)
end
VEC_ROTATE = L0_0
function L0_0(A0_177, A1_178)
  BBMath(A0_177, A1_178)
end
BBVectorMath = L0_0
function L0_0(A0_179, A1_180)
  local L2_181, L3_182, L4_183, L5_184
  L2_181 = A0_179.InstanceVars
  L3_182 = L2_181.InterpDelta
  if L3_182 == nil then
    L3_182 = A1_180.Amount
    L4_183 = A1_180.AmountVar
    if L4_183 ~= nil then
      L4_183 = GetTable
      L5_184 = A0_179
      L4_183 = L4_183(L5_184, A1_180.AmountVarTable)
      L5_184 = A1_180.AmountVar
      L3_182 = L4_183[L5_184]
    end
    L4_183 = GetPosition
    L5_184 = A1_180.TargetVar
    L5_184 = A0_179[L5_184]
    L4_183 = L4_183(L5_184)
    L2_181.KnockBackStart = L4_183
    L4_183 = GetNormalizedPositionDelta
    L5_184 = A1_180.TargetVar
    L5_184 = A0_179[L5_184]
    L4_183 = L4_183(L5_184, A0_179[A1_180.AttackerVar], true)
    L5_184 = {}
    L5_184.x = L4_183.x * L3_182
    L5_184.y = 0
    L5_184.z = L4_183.z * L3_182
    L2_181.InterpDelta = L5_184
    L5_184 = GetTime
    L5_184 = L5_184()
    L2_181.StartTime = L5_184
    L5_184 = A1_180.KnockBackDuration
    L2_181.KnockBackDuration = L5_184
  end
  L3_182 = A1_180.TargetVar
  L3_182 = A0_179[L3_182]
  L4_183 = GetTime
  L4_183 = L4_183()
  L5_184 = L2_181.StartTime
  L4_183 = L4_183 - L5_184
  L5_184 = L2_181.KnockBackDuration
  L4_183 = L4_183 / L5_184
  L5_184 = {}
  L5_184.x = L2_181.KnockBackStart.x + L2_181.InterpDelta.x * L4_183
  L5_184.y = L2_181.KnockBackStart.y
  L5_184.z = L2_181.KnockBackStart.z + L2_181.InterpDelta.z * L4_183
  SetPosition(L3_182, L5_184)
end
BBKnockback = L0_0
function L0_0(A0_185, A1_186)
  local L2_187
  L2_187 = 0
  if A1_186.Delta ~= nil then
    L2_187 = L2_187 + A1_186.Delta
  end
  if A1_186.DeltaByLevel ~= nil and A0_185.Level ~= nil then
    L2_187 = L2_187 + A1_186.DeltaByLevel[A0_185.Level]
  end
  if A1_186.DeltaVar ~= nil then
    L2_187 = L2_187 + GetTable(A0_185, A1_186.DeltaVarTable, true)[A1_186.DeltaVar]
  end
  if A1_186.TargetVar ~= nil then
    A1_186.Stat(L2_187, A0_185[A1_186.TargetVar])
  else
    A1_186.Stat(L2_187)
  end
end
BBIncStat = L0_0
function L0_0(A0_188, A1_189)
  local L2_190
  L2_190 = 0
  if A1_189.Delta ~= nil then
    L2_190 = L2_190 + A1_189.Delta
  end
  if A1_189.DeltaByLevel ~= nil and A0_188.Level ~= nil then
    L2_190 = L2_190 + A1_189.DeltaByLevel[A0_188.Level]
  end
  if A1_189.DeltaVar ~= nil then
    L2_190 = L2_190 + GetTable(A0_188, A1_189.DeltaVarTable, true)[A1_189.DeltaVar]
  end
  if A1_189.TargetVar ~= nil then
    A1_189.Stat(L2_190, A0_188[A1_189.TargetVar])
  else
    A1_189.Stat(L2_190)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_191, A1_192)
  if A1_192.TargetVar ~= nil then
    GetTable(A0_191, A1_192.DestVarTable, false)[A1_192.DestVar] = A1_192.Stat(A0_191[A1_192.TargetVar])
  else
    GetTable(A0_191, A1_192.DestVarTable, false)[A1_192.DestVar] = A1_192.Stat()
  end
end
BBGetStat = L0_0
function L0_0(A0_193, A1_194)
  if A1_194.TargetVar ~= nil then
    GetTable(A0_193, A1_194.DestVarTable, false)[A1_194.DestVar] = GetLevel(A0_193[A1_194.TargetVar])
  else
    GetTable(A0_193, A1_194.DestVarTable, false)[A1_194.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_195, A1_196)
  if A1_196.TargetVar ~= nil then
    GetTable(A0_195, A1_196.DestVarTable, false)[A1_196.DestVar] = GetArmor(A0_195[A1_196.TargetVar])
  else
    GetTable(A0_195, A1_196.DestVarTable, false)[A1_196.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_197, A1_198)
  if A1_198.TargetVar ~= nil then
    GetTable(A0_197, A1_198.DestVarTable, false)[A1_198.DestVar] = GetSpellBlock(A0_197[A1_198.TargetVar])
  else
    GetTable(A0_197, A1_198.DestVarTable, false)[A1_198.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_199, A1_200)
  if A1_200.TargetVar ~= nil then
    GetTable(A0_199, A1_200.DestVarTable, false)[A1_200.DestVar] = GetTeamID(A0_199[A1_200.TargetVar])
  else
    GetTable(A0_199, A1_200.DestVarTable, false)[A1_200.DestVar] = GetTeamID()
  end
end
BBGetTeamID = L0_0
function L0_0(A0_201, A1_202)
  if A1_202.TargetVar ~= nil then
    GetTable(A0_201, A1_202.DestVarTable, false)[A1_202.DestVar] = GetUnitSkinName(A0_201[A1_202.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_203, A1_204)
  if A1_204.TargetVar ~= nil then
    GetTable(A0_203, A1_204.DestVarTable, false)[A1_204.DestVar] = GetTotalAttackDamage(A0_203[A1_204.TargetVar])
  else
    GetTable(A0_203, A1_204.DestVarTable, false)[A1_204.DestVar] = GetTotalAttackDamage()
  end
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_205, A1_206)
  GetTable(A0_205, A1_206.DestVarTable, true)[A1_206.DestVar] = A1_206.Status(A0_205[A1_206.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_207, A1_208)
  GetTable(A0_207, A1_208.DestVarTable, true)[A1_208.DestVar] = A1_208.Info(A0_207[A1_208.TargetVar])
end
BBGetCastInfo = L0_0
function L0_0(A0_209, A1_210)
  SetCanCastWhileDisabled(A1_210.CanCast)
end
BBSetCanCastWhileDisabled = L0_0
function L0_0(A0_211, A1_212, A2_213)
  local L3_214, L4_215, L5_216, L6_217
  L3_214 = GetTable
  L4_215 = A0_211
  L5_216 = A1_212.TrackTimeVarTable
  L6_217 = false
  L3_214 = L3_214(L4_215, L5_216, L6_217)
  L4_215 = GetTime
  L4_215 = L4_215()
  L5_216 = A1_212.ExecuteImmediately
  L6_217 = A1_212.TimeBetweenExecutions
  if A1_212.TickTimeVar ~= nil and GetTable(A0_211, A1_212.TickTimeVarTable, false)[A1_212.TickTimeVar] ~= nil then
    L6_217 = GetTable(A0_211, A1_212.TickTimeVarTable, false)[A1_212.TickTimeVar]
  end
  if L3_214[A1_212.TrackTimeVar] == nil then
    L3_214[A1_212.TrackTimeVar] = L4_215
    if L5_216 == true then
      ExecuteBuildingBlocks(A2_213, A0_211)
    end
  end
  if L4_215 >= L3_214[A1_212.TrackTimeVar] + L6_217 then
    L3_214[A1_212.TrackTimeVar] = L3_214[A1_212.TrackTimeVar] + L6_217
    ExecuteBuildingBlocks(A2_213, A0_211)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_218, A1_219, A2_220)
  GetTable(A0_218, A1_219.TrackTimeVarTable, false)[A1_219.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_221, A1_222)
  local L2_223
  L2_223 = A1_222.SrcValue
  if A1_222.SrcVar ~= nil then
    L2_223 = GetTable(A0_221, A1_222.SrcTable, true)[A1_222.SrcVar]
  end
  A1_222.Status(A0_221[A1_222.TargetVar], L2_223)
end
BBSetStatus = L0_0
function L0_0(A0_224, A1_225)
  local L2_226
  L2_226 = A1_225.ToAlert
  if GetTable(A0_224, A1_225.SrcVarTable, false) ~= nil and A1_225.SrcVar ~= nil then
    L2_226 = L2_226 .. GetTable(A0_224, A1_225.SrcVarTable, false)[A1_225.SrcVar]
  end
  _ALERT(L2_226)
end
BBAlert = L0_0
function L0_0(A0_227, A1_228)
  local L2_229, L3_230, L4_231
  L2_229 = A1_228.ToSay
  L3_230 = GetTable
  L4_231 = A0_227
  L3_230 = L3_230(L4_231, A1_228.SrcVarTable, false)
  if L3_230 ~= nil then
    L4_231 = A1_228.SrcVar
    if L4_231 ~= nil then
      L4_231 = L2_229
      L2_229 = L4_231 .. tostring(L3_230[A1_228.SrcVar])
    end
  end
  L4_231 = nil
  if A1_228.OwnerVar ~= nil then
    L4_231 = A0_227[A1_228.OwnerVar]
  else
    L4_231 = A0_227.Owner
  end
  if A1_228.TextType == nil then
    A1_228.TextType = 0
  end
  Say(L4_231, L2_229, A1_228.TextType)
end
BBSay = L0_0
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
BBDebugSay = L0_0
function L0_0(A0_237, A1_238)
  GetTable(A0_237, A1_238.DestVarTable, true)[A1_238.DestVar] = BBLuaGetGold(A0_237, A1_238)
end
BBGetGold = L0_0
function L0_0(A0_239, A1_240)
  SpellBuffAdd(A0_239[A1_240.OwnerVar], A0_239[A1_240.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_239.NextBuffVars)
  BBTeleportToPositionHelper(A0_239, A1_240)
end
BBTeleportToPosition = L0_0
function L0_0(A0_241, A1_242)
  if A1_242.XVar ~= nil and GetTable(A0_241, A1_242.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_241, A1_242.XVarTable, true)[A1_242.XVar]
  else
    Xloc = A1_242.X
  end
  if A1_242.YVar ~= nil and GetTable(A0_241, A1_242.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_241, A1_242.YVarTable, true)[A1_242.YVar]
  else
    Yloc = A1_242.Y
  end
  if A1_242.ZVar ~= nil and GetTable(A0_241, A1_242.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_241, A1_242.ZVarTable, true)[A1_242.ZVar]
  else
    Zloc = A1_242.Z
  end
  A1_242.OwnerVar, A0_241.position = A1_242.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_242.CastPositionName = "position"
  BBTeleportToPosition(A0_241, A1_242)
end
BBTeleportToPoint = L0_0
function L0_0(A0_243, A1_244)
  DefUpdateAura(GetTable(A0_243, A1_244.CenterTable, false)[A1_244.CenterVar], A1_244.Range, A1_244.UnitScan, A1_244.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_245, A1_246)
  ReincarnateNonDeadHero(GetTable(A0_245, A1_246.TargetTable, false)[A1_246.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_247, A1_248)
  GetTable(A0_247, A1_248.DestVarTable, true)[A1_248.DestVar] = A1_248.Function(A0_247[A1_248.OwnerVar], A1_248.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_249, A1_250)
  local L2_251, L3_252, L4_253, L5_254
  L2_251 = A1_250.WhomToOrderVar
  L2_251 = A0_249[L2_251]
  L3_252 = A1_250.TargetOfOrderVar
  L3_252 = A0_249[L3_252]
  L4_253 = GetTable
  L5_254 = A0_249
  L4_253 = L4_253(L5_254, A1_250.SrcVarTable, false)
  L5_254 = nil
  if A1_250.SrcVar ~= nil and L4_253 ~= nil then
    L5_254 = L4_253[A1_250.SrcVar]
  else
    L5_254 = GetPosition(L3_252)
  end
  if L3_252 == nil then
    L3_252 = L2_251
  end
  IssueOrder(L2_251, A1_250.Order, L5_254, L3_252)
end
BBIssueOrder = L0_0
function L0_0(A0_255, A1_256)
  SetSpellCastRange(A1_256.NewRange)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_257, A1_258)
  GetTable(A0_257, A1_258.DestVarTable, true)[A1_258.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_259, A1_260)
  local L2_261, L3_262
  L2_261 = A1_260.ObjectVar1
  L2_261 = A0_259[L2_261]
  L3_262 = A1_260.ObjectVar2
  L3_262 = A0_259[L3_262]
  GetTable(A0_259, A1_260.DestVarTable, true)[A1_260.DestVar] = DistanceBetweenObjectBounds(L2_261, L3_262)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_263, A1_264)
  local L2_265, L3_266, L4_267
  L2_265 = A1_264.ObjectVar
  L2_265 = A0_263[L2_265]
  L3_266 = GetTable
  L4_267 = A0_263
  L3_266 = L3_266(L4_267, A1_264.PointVarTable, true)
  L4_267 = A1_264.PointVar
  L4_267 = L3_266[L4_267]
  GetTable(A0_263, A1_264.DestVarTable, true)[A1_264.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_265, L4_267)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_268, A1_269)
  local L2_270, L3_271, L4_272, L5_273
  L2_270 = GetTable
  L3_271 = A0_268
  L4_272 = A1_269.Point1VarTable
  L5_273 = true
  L2_270 = L2_270(L3_271, L4_272, L5_273)
  L3_271 = A1_269.Point1Var
  L3_271 = L2_270[L3_271]
  L4_272 = GetTable
  L5_273 = A0_268
  L4_272 = L4_272(L5_273, A1_269.Point2VarTable, true)
  L5_273 = A1_269.Point2Var
  L5_273 = L4_272[L5_273]
  GetTable(A0_268, A1_269.DestVarTable, true)[A1_269.DestVar] = DistanceBetweenPoints(L3_271, L5_273)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_274, A1_275, A2_276)
  local L3_277, L4_278, L5_279, L6_280, L7_281, L8_282
  L5_279 = 0
  L6_280 = nil
  L7_281 = A1_275.ObjectDistanceType
  L8_282 = A1_275.ObjectVar1
  L3_277 = A0_274[L8_282]
  L8_282 = A1_275.ObjectVar2
  L4_278 = A0_274[L8_282]
  if nil == L4_278 then
    L8_282 = A1_275.Point2Var
    if nil ~= L8_282 then
      L8_282 = GetTable
      L8_282 = L8_282(A0_274, A1_275.Point2VarTable, true)
      L4_278 = L8_282[A1_275.Point2Var]
      L5_279 = L5_279 + 1
    end
  end
  if nil == L3_277 then
    L8_282 = A1_275.Point1Var
    if nil ~= L8_282 then
      L8_282 = GetTable
      L8_282 = L8_282(A0_274, A1_275.Point1VarTable, true)
      L3_277 = L8_282[A1_275.Point1Var]
      L5_279 = L5_279 + 1
      if 1 == L5_279 then
        L3_277, L4_278 = L4_278, L3_277
      end
    end
  end
  if nil ~= L7_281 then
    if 0 == L5_279 then
      L8_282 = OBJECT_CENTER
      if L8_282 == L7_281 then
        L6_280 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_282 = OBJECT_BOUNDARY
        if L8_282 == L7_281 then
          L6_280 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_282 = A1_275.OwnerVar
          L8_282 = A0_274[L8_282]
          Say(L8_282, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_279 then
      L8_282 = OBJECT_CENTER
      if L8_282 == L7_281 then
        L6_280 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_282 = OBJECT_BOUNDARY
        if L8_282 == L7_281 then
          L6_280 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_282 = A1_275.OwnerVar
          L8_282 = A0_274[L8_282]
          Say(L8_282, "invalid object distance type", 0)
        end
      end
    else
      L6_280 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_282 = A1_275.Distance
  if A1_275.DistanceVar ~= nil and GetTable(A0_274, A1_275.DistanceVarTable, true) ~= nil then
    L8_282 = L8_282 + GetTable(A0_274, A1_275.DistanceVarTable, true)[A1_275.DistanceVar]
  end
  if L3_277 ~= nil and L4_278 ~= nil and L6_280 ~= nil and L8_282 ~= nil then
    if not L6_280(L3_277, L4_278, L8_282) then
      ExecuteBuildingBlocks(A2_276, A0_274)
      A0_274.LastIfSucceeded = true
    else
      A0_274.LastIfSucceeded = false
    end
  else
    A0_274.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_283, A1_284)
  local L2_285, L3_286
  L2_285 = A1_284.TargetVar
  L2_285 = A0_283[L2_285]
  L3_286 = A1_284.CasterVar
  L3_286 = A0_283[L3_286]
  GetTable(A0_283, A1_284.DestVarTable, true)[A1_284.DestVar] = SpellBuffCount(L2_285, A1_284.BuffName, L3_286)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_287, A1_288)
  local L2_289
  L2_289 = A1_288.TargetVar
  L2_289 = A0_287[L2_289]
  GetTable(A0_287, A1_288.DestVarTable, true)[A1_288.DestVar] = SpellBuffCount(L2_289, A1_288.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_290, A1_291)
  local L2_292, L3_293
  L2_292 = GetTable
  L3_293 = A0_290
  L2_292 = L2_292(L3_293, A1_291.ScaleVarTable, false)
  L3_293 = nil
  if A1_291.OwnerVar ~= nil then
    L3_293 = A0_290[A1_291.OwnerVar]
  else
    L3_293 = A0_290.Owner
  end
  if A1_291.ScaleVar ~= nil and A1_291.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_292[A1_291.ScaleVar], L3_293)
  else
    SetScaleSkinCoef(A1_291.Scale, L3_293)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_294, A1_295)
  SpellBuffAdd(A0_294[A1_295.TargetVar], A0_294[A1_295.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_294.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_296, A1_297, A2_298)
  local L3_299, L4_300
  L3_299 = A1_297.TargetVar
  L3_299 = A0_296[L3_299]
  L4_300 = A1_297.NumStacks
  if A1_297.NumStacks == 0 then
    L4_300 = SpellBuffCount(L3_299, A1_297.BuffName, caster)
  end
  while L4_300 > 0 do
    SpellBuffRemove(L3_299, A1_297.BuffName, A0_296[A1_297.AttackerVar])
    L4_300 = L4_300 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_301, A1_302, A2_303)
  if A0_301.EmoteId == A1_302.EmoteId then
    ExecuteBuildingBlocks(A2_303, A0_301)
    A0_301.LastIfSucceeded = true
  else
    A0_301.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_304, A1_305, A2_306)
  if A0_304.EmoteId ~= A1_305.EmoteId then
    ExecuteBuildingBlocks(A2_306, A0_304)
    A0_304.LastIfSucceeded = true
  else
    A0_304.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
