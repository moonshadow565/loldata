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
function L0_0(A0_146)
  return math.sqrt(A0_146)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_147, A1_148)
  local L2_149
  L2_149 = A0_147 and A1_148
  return L2_149
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_150, A1_151)
  local L2_152
  L2_152 = A0_150 or A1_151
  return L2_152
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_153)
  local L1_154
  L1_154 = not A0_153
  return L1_154
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_155, A1_156)
  local L2_157, L3_158
  L2_157 = GetMathNumber
  L3_158 = A0_155
  L2_157 = L2_157(L3_158, A1_156.Src1VarTable, A1_156.Src1Var, A1_156.Src1Value)
  L3_158 = GetMathNumber
  L3_158 = L3_158(A0_155, A1_156.Src2VarTable, A1_156.Src2Var, A1_156.Src2Value)
  GetTable(A0_155, A1_156.DestVarTable)[A1_156.DestVar] = A1_156.MathOp(L2_157, L3_158)
end
BBMath = L0_0
function L0_0(A0_159, A1_160, A2_161, A3_162)
  if A2_161 ~= nil and GetTable(A0_159, A1_160)[A2_161] ~= nil then
    return GetTable(A0_159, A1_160)[A2_161]
  end
  return A3_162
end
GetMathNumber = L0_0
function L0_0(A0_163, A1_164)
  if type(A1_164) == "number" then
    return A1_164
  elseif type(A1_164) == "function" then
    return A1_164(A0_163)
  elseif type(A1_164) == "string" then
    return A0_163[A1_164]
  end
end
GetNumber = L0_0
function L0_0(A0_165, A1_166)
  return VectorAdd(A0_165, A1_166)
end
VEC_ADD = L0_0
function L0_0(A0_167, A1_168)
  return VectorSubtract(A0_167, A1_168)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_169, A1_170)
  return VectorScalarMultiply(A0_169, A1_170)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_171, A1_172)
  return VectorScalarDivide(A0_171, A1_172)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_173, A1_174)
  return VectorRotateY(A0_173, A1_174)
end
VEC_ROTATE = L0_0
function L0_0(A0_175, A1_176)
  BBMath(A0_175, A1_176)
end
BBVectorMath = L0_0
function L0_0(A0_177, A1_178)
  local L2_179, L3_180, L4_181, L5_182
  L2_179 = A0_177.InstanceVars
  L3_180 = L2_179.InterpDelta
  if L3_180 == nil then
    L3_180 = A1_178.Amount
    L4_181 = A1_178.AmountVar
    if L4_181 ~= nil then
      L4_181 = GetTable
      L5_182 = A0_177
      L4_181 = L4_181(L5_182, A1_178.AmountVarTable)
      L5_182 = A1_178.AmountVar
      L3_180 = L4_181[L5_182]
    end
    L4_181 = GetPosition
    L5_182 = A1_178.TargetVar
    L5_182 = A0_177[L5_182]
    L4_181 = L4_181(L5_182)
    L2_179.KnockBackStart = L4_181
    L4_181 = GetNormalizedPositionDelta
    L5_182 = A1_178.TargetVar
    L5_182 = A0_177[L5_182]
    L4_181 = L4_181(L5_182, A0_177[A1_178.AttackerVar], true)
    L5_182 = {}
    L5_182.x = L4_181.x * L3_180
    L5_182.y = 0
    L5_182.z = L4_181.z * L3_180
    L2_179.InterpDelta = L5_182
    L5_182 = GetTime
    L5_182 = L5_182()
    L2_179.StartTime = L5_182
    L5_182 = A1_178.KnockBackDuration
    L2_179.KnockBackDuration = L5_182
  end
  L3_180 = A1_178.TargetVar
  L3_180 = A0_177[L3_180]
  L4_181 = GetTime
  L4_181 = L4_181()
  L5_182 = L2_179.StartTime
  L4_181 = L4_181 - L5_182
  L5_182 = L2_179.KnockBackDuration
  L4_181 = L4_181 / L5_182
  L5_182 = {}
  L5_182.x = L2_179.KnockBackStart.x + L2_179.InterpDelta.x * L4_181
  L5_182.y = L2_179.KnockBackStart.y
  L5_182.z = L2_179.KnockBackStart.z + L2_179.InterpDelta.z * L4_181
  SetPosition(L3_180, L5_182)
end
BBKnockback = L0_0
function L0_0(A0_183, A1_184)
  local L2_185
  L2_185 = 0
  if A1_184.Delta ~= nil then
    L2_185 = L2_185 + A1_184.Delta
  end
  if A1_184.DeltaByLevel ~= nil and A0_183.Level ~= nil then
    L2_185 = L2_185 + A1_184.DeltaByLevel[A0_183.Level]
  end
  if A1_184.DeltaVar ~= nil then
    L2_185 = L2_185 + GetTable(A0_183, A1_184.DeltaVarTable, true)[A1_184.DeltaVar]
  end
  if A1_184.TargetVar ~= nil then
    A1_184.Stat(L2_185, A0_183[A1_184.TargetVar])
  else
    A1_184.Stat(L2_185)
  end
end
BBIncStat = L0_0
function L0_0(A0_186, A1_187)
  local L2_188
  L2_188 = 0
  if A1_187.Delta ~= nil then
    L2_188 = L2_188 + A1_187.Delta
  end
  if A1_187.DeltaByLevel ~= nil and A0_186.Level ~= nil then
    L2_188 = L2_188 + A1_187.DeltaByLevel[A0_186.Level]
  end
  if A1_187.DeltaVar ~= nil then
    L2_188 = L2_188 + GetTable(A0_186, A1_187.DeltaVarTable, true)[A1_187.DeltaVar]
  end
  if A1_187.TargetVar ~= nil then
    A1_187.Stat(L2_188, A0_186[A1_187.TargetVar])
  else
    A1_187.Stat(L2_188)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_189, A1_190)
  if A1_190.TargetVar ~= nil then
    GetTable(A0_189, A1_190.DestVarTable, false)[A1_190.DestVar] = A1_190.Stat(A0_189[A1_190.TargetVar])
  else
    GetTable(A0_189, A1_190.DestVarTable, false)[A1_190.DestVar] = A1_190.Stat()
  end
end
BBGetStat = L0_0
function L0_0(A0_191, A1_192)
  if A1_192.TargetVar ~= nil then
    GetTable(A0_191, A1_192.DestVarTable, false)[A1_192.DestVar] = GetLevel(A0_191[A1_192.TargetVar])
  else
    GetTable(A0_191, A1_192.DestVarTable, false)[A1_192.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_193, A1_194)
  if A1_194.TargetVar ~= nil then
    GetTable(A0_193, A1_194.DestVarTable, false)[A1_194.DestVar] = GetArmor(A0_193[A1_194.TargetVar])
  else
    GetTable(A0_193, A1_194.DestVarTable, false)[A1_194.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_195, A1_196)
  if A1_196.TargetVar ~= nil then
    GetTable(A0_195, A1_196.DestVarTable, false)[A1_196.DestVar] = GetSpellBlock(A0_195[A1_196.TargetVar])
  else
    GetTable(A0_195, A1_196.DestVarTable, false)[A1_196.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_197, A1_198)
  if A1_198.TargetVar ~= nil then
    GetTable(A0_197, A1_198.DestVarTable, false)[A1_198.DestVar] = GetTeamID(A0_197[A1_198.TargetVar])
  else
    GetTable(A0_197, A1_198.DestVarTable, false)[A1_198.DestVar] = GetTeamID()
  end
end
BBGetTeamID = L0_0
function L0_0(A0_199, A1_200)
  if A1_200.TargetVar ~= nil then
    GetTable(A0_199, A1_200.DestVarTable, false)[A1_200.DestVar] = GetUnitSkinName(A0_199[A1_200.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_201, A1_202)
  if A1_202.TargetVar ~= nil then
    GetTable(A0_201, A1_202.DestVarTable, false)[A1_202.DestVar] = GetTotalAttackDamage(A0_201[A1_202.TargetVar])
  else
    GetTable(A0_201, A1_202.DestVarTable, false)[A1_202.DestVar] = GetTotalAttackDamage()
  end
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_203, A1_204)
  GetTable(A0_203, A1_204.DestVarTable, true)[A1_204.DestVar] = A1_204.Status(A0_203[A1_204.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_205, A1_206)
  GetTable(A0_205, A1_206.DestVarTable, true)[A1_206.DestVar] = A1_206.Info(A0_205[A1_206.TargetVar])
end
BBGetCastInfo = L0_0
function L0_0(A0_207, A1_208)
  SetCanCastWhileDisabled(A1_208.CanCast)
end
BBSetCanCastWhileDisabled = L0_0
function L0_0(A0_209, A1_210, A2_211)
  local L3_212, L4_213, L5_214, L6_215
  L3_212 = GetTable
  L4_213 = A0_209
  L5_214 = A1_210.TrackTimeVarTable
  L6_215 = false
  L3_212 = L3_212(L4_213, L5_214, L6_215)
  L4_213 = GetTime
  L4_213 = L4_213()
  L5_214 = A1_210.ExecuteImmediately
  L6_215 = A1_210.TimeBetweenExecutions
  if A1_210.TickTimeVar ~= nil and GetTable(A0_209, A1_210.TickTimeVarTable, false)[A1_210.TickTimeVar] ~= nil then
    L6_215 = GetTable(A0_209, A1_210.TickTimeVarTable, false)[A1_210.TickTimeVar]
  end
  if L3_212[A1_210.TrackTimeVar] == nil then
    L3_212[A1_210.TrackTimeVar] = L4_213
    if L5_214 == true then
      ExecuteBuildingBlocks(A2_211, A0_209)
    end
  end
  if L4_213 >= L3_212[A1_210.TrackTimeVar] + L6_215 then
    L3_212[A1_210.TrackTimeVar] = L3_212[A1_210.TrackTimeVar] + L6_215
    ExecuteBuildingBlocks(A2_211, A0_209)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_216, A1_217, A2_218)
  GetTable(A0_216, A1_217.TrackTimeVarTable, false)[A1_217.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_219, A1_220)
  local L2_221
  L2_221 = A1_220.SrcValue
  if A1_220.SrcVar ~= nil then
    L2_221 = GetTable(A0_219, A1_220.SrcTable, true)[A1_220.SrcVar]
  end
  A1_220.Status(A0_219[A1_220.TargetVar], L2_221)
end
BBSetStatus = L0_0
function L0_0(A0_222, A1_223)
  local L2_224
  L2_224 = A1_223.ToAlert
  if GetTable(A0_222, A1_223.SrcVarTable, false) ~= nil and A1_223.SrcVar ~= nil then
    L2_224 = L2_224 .. GetTable(A0_222, A1_223.SrcVarTable, false)[A1_223.SrcVar]
  end
  _ALERT(L2_224)
end
BBAlert = L0_0
function L0_0(A0_225, A1_226)
  local L2_227, L3_228, L4_229
  L2_227 = A1_226.ToSay
  L3_228 = GetTable
  L4_229 = A0_225
  L3_228 = L3_228(L4_229, A1_226.SrcVarTable, false)
  if L3_228 ~= nil then
    L4_229 = A1_226.SrcVar
    if L4_229 ~= nil then
      L4_229 = L2_227
      L2_227 = L4_229 .. tostring(L3_228[A1_226.SrcVar])
    end
  end
  L4_229 = nil
  if A1_226.OwnerVar ~= nil then
    L4_229 = A0_225[A1_226.OwnerVar]
  else
    L4_229 = A0_225.Owner
  end
  if A1_226.TextType == nil then
    A1_226.TextType = 0
  end
  Say(L4_229, L2_227, A1_226.TextType)
end
BBSay = L0_0
function L0_0(A0_230, A1_231)
  local L2_232, L3_233, L4_234
  L2_232 = A1_231.ToSay
  L3_233 = GetTable
  L4_234 = A0_230
  L3_233 = L3_233(L4_234, A1_231.SrcVarTable, false)
  if L3_233 ~= nil then
    L4_234 = A1_231.SrcVar
    if L4_234 ~= nil then
      L4_234 = L2_232
      L2_232 = L4_234 .. tostring(L3_233[A1_231.SrcVar])
    end
  end
  L4_234 = nil
  if A1_231.OwnerVar ~= nil then
    L4_234 = A0_230[A1_231.OwnerVar]
  else
    L4_234 = A0_230.Owner
  end
  if A1_231.TextType == nil then
    A1_231.TextType = 0
  end
  Say(L4_234, L2_232, A1_231.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_235, A1_236)
  GetTable(A0_235, A1_236.DestVarTable, true)[A1_236.DestVar] = BBLuaGetGold(A0_235, A1_236)
end
BBGetGold = L0_0
function L0_0(A0_237, A1_238)
  SpellBuffAdd(A0_237[A1_238.OwnerVar], A0_237[A1_238.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_237.NextBuffVars)
  BBTeleportToPositionHelper(A0_237, A1_238)
end
BBTeleportToPosition = L0_0
function L0_0(A0_239, A1_240)
  if A1_240.XVar ~= nil and GetTable(A0_239, A1_240.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_239, A1_240.XVarTable, true)[A1_240.XVar]
  else
    Xloc = A1_240.X
  end
  if A1_240.YVar ~= nil and GetTable(A0_239, A1_240.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_239, A1_240.YVarTable, true)[A1_240.YVar]
  else
    Yloc = A1_240.Y
  end
  if A1_240.ZVar ~= nil and GetTable(A0_239, A1_240.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_239, A1_240.ZVarTable, true)[A1_240.ZVar]
  else
    Zloc = A1_240.Z
  end
  A1_240.OwnerVar, A0_239.position = A1_240.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_240.CastPositionName = "position"
  BBTeleportToPosition(A0_239, A1_240)
end
BBTeleportToPoint = L0_0
function L0_0(A0_241, A1_242)
  DefUpdateAura(GetTable(A0_241, A1_242.CenterTable, false)[A1_242.CenterVar], A1_242.Range, A1_242.UnitScan, A1_242.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_243, A1_244)
  ReincarnateNonDeadHero(GetTable(A0_243, A1_244.TargetTable, false)[A1_244.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_245, A1_246)
  GetTable(A0_245, A1_246.DestVarTable, true)[A1_246.DestVar] = A1_246.Function(A0_245[A1_246.OwnerVar], A1_246.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_247, A1_248)
  local L2_249, L3_250, L4_251, L5_252
  L2_249 = A1_248.WhomToOrderVar
  L2_249 = A0_247[L2_249]
  L3_250 = A1_248.TargetOfOrderVar
  L3_250 = A0_247[L3_250]
  L4_251 = GetTable
  L5_252 = A0_247
  L4_251 = L4_251(L5_252, A1_248.SrcVarTable, false)
  L5_252 = nil
  if A1_248.SrcVar ~= nil and L4_251 ~= nil then
    L5_252 = L4_251[A1_248.SrcVar]
  else
    L5_252 = GetPosition(L3_250)
  end
  if L3_250 == nil then
    L3_250 = L2_249
  end
  IssueOrder(L2_249, A1_248.Order, L5_252, L3_250)
end
BBIssueOrder = L0_0
function L0_0(A0_253, A1_254)
  SetSpellCastRange(A1_254.NewRange)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_255, A1_256)
  GetTable(A0_255, A1_256.DestVarTable, true)[A1_256.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_257, A1_258)
  local L2_259, L3_260
  L2_259 = A1_258.ObjectVar1
  L2_259 = A0_257[L2_259]
  L3_260 = A1_258.ObjectVar2
  L3_260 = A0_257[L3_260]
  GetTable(A0_257, A1_258.DestVarTable, true)[A1_258.DestVar] = DistanceBetweenObjectBounds(L2_259, L3_260)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_261, A1_262)
  local L2_263, L3_264, L4_265
  L2_263 = A1_262.ObjectVar
  L2_263 = A0_261[L2_263]
  L3_264 = GetTable
  L4_265 = A0_261
  L3_264 = L3_264(L4_265, A1_262.PointVarTable, true)
  L4_265 = A1_262.PointVar
  L4_265 = L3_264[L4_265]
  GetTable(A0_261, A1_262.DestVarTable, true)[A1_262.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_263, L4_265)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_266, A1_267)
  local L2_268, L3_269, L4_270, L5_271
  L2_268 = GetTable
  L3_269 = A0_266
  L4_270 = A1_267.Point1VarTable
  L5_271 = true
  L2_268 = L2_268(L3_269, L4_270, L5_271)
  L3_269 = A1_267.Point1Var
  L3_269 = L2_268[L3_269]
  L4_270 = GetTable
  L5_271 = A0_266
  L4_270 = L4_270(L5_271, A1_267.Point2VarTable, true)
  L5_271 = A1_267.Point2Var
  L5_271 = L4_270[L5_271]
  GetTable(A0_266, A1_267.DestVarTable, true)[A1_267.DestVar] = DistanceBetweenPoints(L3_269, L5_271)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_272, A1_273, A2_274)
  local L3_275, L4_276, L5_277, L6_278, L7_279, L8_280
  L5_277 = 0
  L6_278 = nil
  L7_279 = A1_273.ObjectDistanceType
  L8_280 = A1_273.ObjectVar1
  L3_275 = A0_272[L8_280]
  L8_280 = A1_273.ObjectVar2
  L4_276 = A0_272[L8_280]
  if nil == L4_276 then
    L8_280 = A1_273.Point2Var
    if nil ~= L8_280 then
      L8_280 = GetTable
      L8_280 = L8_280(A0_272, A1_273.Point2VarTable, true)
      L4_276 = L8_280[A1_273.Point2Var]
      L5_277 = L5_277 + 1
    end
  end
  if nil == L3_275 then
    L8_280 = A1_273.Point1Var
    if nil ~= L8_280 then
      L8_280 = GetTable
      L8_280 = L8_280(A0_272, A1_273.Point1VarTable, true)
      L3_275 = L8_280[A1_273.Point1Var]
      L5_277 = L5_277 + 1
      if 1 == L5_277 then
        L3_275, L4_276 = L4_276, L3_275
      end
    end
  end
  if nil ~= L7_279 then
    if 0 == L5_277 then
      L8_280 = OBJECT_CENTER
      if L8_280 == L7_279 then
        L6_278 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_280 = OBJECT_BOUNDARY
        if L8_280 == L7_279 then
          L6_278 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_280 = A1_273.OwnerVar
          L8_280 = A0_272[L8_280]
          Say(L8_280, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_277 then
      L8_280 = OBJECT_CENTER
      if L8_280 == L7_279 then
        L6_278 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_280 = OBJECT_BOUNDARY
        if L8_280 == L7_279 then
          L6_278 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_280 = A1_273.OwnerVar
          L8_280 = A0_272[L8_280]
          Say(L8_280, "invalid object distance type", 0)
        end
      end
    else
      L6_278 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_280 = A1_273.Distance
  if A1_273.DistanceVar ~= nil and GetTable(A0_272, A1_273.DistanceVarTable, true) ~= nil then
    L8_280 = L8_280 + GetTable(A0_272, A1_273.DistanceVarTable, true)[A1_273.DistanceVar]
  end
  if L3_275 ~= nil and L4_276 ~= nil and L6_278 ~= nil and L8_280 ~= nil then
    if not L6_278(L3_275, L4_276, L8_280) then
      ExecuteBuildingBlocks(A2_274, A0_272)
      A0_272.LastIfSucceeded = true
    else
      A0_272.LastIfSucceeded = false
    end
  else
    A0_272.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_281, A1_282)
  local L2_283, L3_284
  L2_283 = A1_282.TargetVar
  L2_283 = A0_281[L2_283]
  L3_284 = A1_282.CasterVar
  L3_284 = A0_281[L3_284]
  GetTable(A0_281, A1_282.DestVarTable, true)[A1_282.DestVar] = SpellBuffCount(L2_283, A1_282.BuffName, L3_284)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_285, A1_286)
  local L2_287
  L2_287 = A1_286.TargetVar
  L2_287 = A0_285[L2_287]
  GetTable(A0_285, A1_286.DestVarTable, true)[A1_286.DestVar] = SpellBuffCount(L2_287, A1_286.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_288, A1_289)
  local L2_290, L3_291
  L2_290 = GetTable
  L3_291 = A0_288
  L2_290 = L2_290(L3_291, A1_289.ScaleVarTable, false)
  L3_291 = nil
  if A1_289.OwnerVar ~= nil then
    L3_291 = A0_288[A1_289.OwnerVar]
  else
    L3_291 = A0_288.Owner
  end
  if A1_289.ScaleVar ~= nil and A1_289.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_290[A1_289.ScaleVar], L3_291)
  else
    SetScaleSkinCoef(A1_289.Scale, L3_291)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_292, A1_293)
  SpellBuffAdd(A0_292[A1_293.TargetVar], A0_292[A1_293.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_292.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_294, A1_295, A2_296)
  local L3_297, L4_298
  L3_297 = A1_295.TargetVar
  L3_297 = A0_294[L3_297]
  L4_298 = A1_295.NumStacks
  if A1_295.NumStacks == 0 then
    L4_298 = SpellBuffCount(L3_297, A1_295.BuffName, caster)
  end
  while L4_298 > 0 do
    SpellBuffRemove(L3_297, A1_295.BuffName, A0_294[A1_295.AttackerVar])
    L4_298 = L4_298 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_299, A1_300, A2_301)
  if A0_299.EmoteId == A1_300.EmoteId then
    ExecuteBuildingBlocks(A2_301, A0_299)
    A0_299.LastIfSucceeded = true
  else
    A0_299.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_302, A1_303, A2_304)
  if A0_302.EmoteId ~= A1_303.EmoteId then
    ExecuteBuildingBlocks(A2_304, A0_302)
    A0_302.LastIfSucceeded = true
  else
    A0_302.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
