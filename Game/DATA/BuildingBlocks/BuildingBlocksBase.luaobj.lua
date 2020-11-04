local L0_0, L1_1
L0_0 = -1
gCurrentBuildingBlockNumber = L0_0
L0_0 = ""
gCurrentBuildingBlockString = L0_0
function L0_0(A0_2, A1_3)
  local L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13, L12_14
  if A0_2 ~= nil then
    L2_4 = gCurrentBuildingBlockString
    A1_3.___BreakExecution___ = false
    for L6_8 = 1, #A0_2 do
      L7_9 = L2_4
      if false == L8_10 then
        gCurrentBuildingBlockNumber = L6_8
        gCurrentBuildingBlock = L8_10
        if L8_10 then
          for L11_13, L12_14 in L8_10(L9_11) do
            if type(L12_14) == "function" and L12_14 == gCurrentBuildingBlock.Function then
              gCurrentBuildingBlockString = L11_13
            end
          end
        else
          gCurrentBuildingBlockString = L8_10
        end
        L11_13 = gCurrentBuildingBlock
        L11_13 = L11_13.SubBlocks
        L8_10(L9_11, L10_12, L11_13)
      end
    end
    gCurrentBuildingBlockString = L2_4
    gCurrentBuildingBlockNumber = L3_5
    gCurrentBuildingBlock = L3_5
  end
end
ExecuteBuildingBlocks = L0_0
function L0_0()
  local L0_15, L1_16
end
BBRequireVar = L0_0
function L0_0(A0_17, A1_18, A2_19)
  if A1_18.IsConditionTrue(A0_17) then
    ExecuteBuildingBlocks(A2_19, A0_17)
  end
end
BBConditionallyExecute = L0_0
function L0_0(A0_20, A1_21, A2_22)
  local L3_23
  if A1_21 ~= nil then
    L3_23 = A0_20[A1_21]
    if L3_23 == nil and A2_22 then
      A0_20[A1_21] = {}
      return A0_20[A1_21]
    end
  end
  if L3_23 == nil then
    L3_23 = A0_20
  end
  return L3_23
end
GetTable = L0_0
function L0_0(A0_24, A1_25)
  if A0_24.Level ~= nil and A1_25.SrcValueByLevel ~= nil then
    GetTable(A0_24, A1_25.DestVarTable, true)[A1_25.DestVar] = A1_25.SrcValueByLevel[A0_24.Level]
  elseif A1_25.SrcVar ~= nil and GetTable(A0_24, A1_25.SrcVarTable, false) ~= nil then
    GetTable(A0_24, A1_25.DestVarTable, true)[A1_25.DestVar] = GetTable(A0_24, A1_25.SrcVarTable, false)[A1_25.SrcVar]
  else
    GetTable(A0_24, A1_25.DestVarTable, true)[A1_25.DestVar] = A1_25.SrcValue
  end
end
BBSetVarInTable = L0_0
function L0_0(A0_26, A1_27)
  local L2_28, L3_29
  L2_28 = GetTable
  L3_29 = A0_26
  L2_28 = L2_28(L3_29, A1_27.DestVarTable, true)
  L3_29 = nil
  if A1_27.SpellSlotVar ~= nil and GetTable(A0_26, A1_27.SpellSlotVarTable, false) ~= nil then
    L3_29 = GetTable(A0_26, A1_27.SpellSlotVarTable, false)[A1_27.SpellSlotVar]
  else
    L3_29 = A1_27.SpellSlotValue
  end
  L2_28[A1_27.DestVar] = A1_27.Function(A0_26[A1_27.OwnerVar], L3_29, A1_27.SpellbookType, A1_27.SlotType)
end
BBGetSlotSpellInfo = L0_0
function L0_0(A0_30, A1_31)
  local L2_32, L3_33, L4_34
  L2_32 = GetTable
  L3_33 = A0_30
  L4_34 = A1_31.SrcVarTable
  L2_32 = L2_32(L3_33, L4_34, false)
  L3_33 = nil
  L4_34 = A1_31.SrcVar
  if L4_34 ~= nil and L2_32 ~= nil then
    L4_34 = A1_31.SrcVar
    L3_33 = L2_32[L4_34]
  else
    L3_33 = A1_31.SrcValue
  end
  L4_34 = nil
  if A1_31.SpellSlotVar ~= nil and GetTable(A0_30, A1_31.SpellSlotVarTable, false) ~= nil then
    L4_34 = GetTable(A0_30, A1_31.SpellSlotVarTable, false)[A1_31.SpellSlotVar]
  else
    L4_34 = A1_31.SpellSlotValue
  end
  SetSlotSpellCooldownTime(A0_30[A1_31.OwnerVar], L4_34, A1_31.SpellbookType, A1_31.SlotType, L3_33)
end
BBSetSlotSpellCooldownTime = L0_0
function L0_0(A0_35, A1_36)
  if A0_35.Level ~= nil and A1_36.SrcValueByLevel ~= nil then
    A0_35.ReturnValue = A1_36.SrcValueByLevel[A0_35.Level]
  elseif A1_36.SrcVar ~= nil and GetTable(A0_35, A1_36.SrcVarTable, false) ~= nil then
    A0_35.ReturnValue = GetTable(A0_35, A1_36.SrcVarTable, false)[A1_36.SrcVar]
  else
    A0_35.ReturnValue = A1_36.SrcValue
  end
end
BBSetReturnValue = L0_0
function L0_0(A0_37, A1_38)
  if type(A0_37) == "string" and type(A1_38) == "string" then
    A0_37 = string.lower(A0_37)
    A1_38 = string.lower(A1_38)
  end
  return A0_37 == A1_38
end
CO_EQUAL = L0_0
function L0_0(A0_39, A1_40)
  if type(A0_39) == "string" and type(A1_40) == "string" then
    A0_39 = string.lower(A0_39)
    A1_40 = string.lower(A1_40)
  end
  return A0_39 ~= A1_40
end
CO_NOT_EQUAL = L0_0
function L0_0(A0_41, A1_42)
  local L2_43
  L2_43 = A0_41 < A1_42
  return L2_43
end
CO_LESS_THAN = L0_0
function L0_0(A0_44, A1_45)
  local L2_46
  L2_46 = A1_45 < A0_44
  return L2_46
end
CO_GREATER_THAN = L0_0
function L0_0(A0_47, A1_48)
  local L2_49
  L2_49 = A0_47 <= A1_48
  return L2_49
end
CO_LESS_THAN_OR_EQUAL = L0_0
function L0_0(A0_50, A1_51)
  local L2_52
  L2_52 = A1_51 <= A0_50
  return L2_52
end
CO_GREATER_THAN_OR_EQUAL = L0_0
function L0_0(A0_53, A1_54)
  return GetTeamID(A0_53) == GetTeamID(A1_54)
end
CO_SAME_TEAM = L0_0
function L0_0(A0_55, A1_56)
  return GetTeamID(A0_55) ~= GetTeamID(A1_56)
end
CO_DIFFERENT_TEAM = L0_0
function L0_0(A0_57, A1_58)
  return GetSourceType() == A1_58 or GetSourceType() == A0_57
end
CO_DAMAGE_SOURCETYPE_IS = L0_0
function L0_0(A0_59, A1_60)
  return GetSourceType() ~= A1_60 and GetSourceType() ~= A0_59
end
CO_DAMAGE_SOURCETYPE_IS_NOT = L0_0
function L0_0(A0_61)
  return IsObjectAI(A0_61)
end
CO_IS_TYPE_AI = L0_0
function L0_0(A0_62)
  return IsObjectAI(A0_62) ~= true
end
CO_IS_NOT_AI = L0_0
function L0_0(A0_63)
  return IsObjectHero(A0_63)
end
CO_IS_TYPE_HERO = L0_0
function L0_0(A0_64)
  return IsObjectHero(A0_64) ~= true
end
CO_IS_NOT_HERO = L0_0
function L0_0(A0_65)
  return IsClone(A0_65)
end
CO_IS_CLONE = L0_0
function L0_0(A0_66)
  return IsClone(A0_66) ~= true
end
CO_IS_NOT_CLONE = L0_0
function L0_0(A0_67)
  return IsMelee(A0_67)
end
CO_IS_MELEE = L0_0
function L0_0(A0_68)
  return IsMelee(A0_68) ~= true
end
CO_IS_RANGED = L0_0
function L0_0(A0_69)
  return A0_69 > math.random()
end
CO_RANDOM_CHANCE_LESS_THAN = L0_0
function L0_0(A0_70)
  return IsTurretAI(A0_70)
end
CO_IS_TYPE_TURRET = L0_0
function L0_0(A0_71)
  return IsTurretAI(A0_71) ~= true
end
CO_IS_NOT_TURRET = L0_0
function L0_0(A0_72)
  return IsDead(A0_72)
end
CO_IS_DEAD = L0_0
function L0_0(A0_73)
  return IsDead(A0_73) ~= true
end
CO_IS_NOT_DEAD = L0_0
function L0_0(A0_74)
  return IsDeadOrZombie(A0_74)
end
CO_IS_DEAD_OR_ZOMBIE = L0_0
function L0_0(A0_75, A1_76)
  return BBIsTargetInFrontOfMe(A0_75, A1_76)
end
CO_IS_TARGET_IN_FRONT_OF_ME = L0_0
function L0_0(A0_77, A1_78)
  return BBIsTargetBehindMe(A0_77, A1_78)
end
CO_IS_TARGET_BEHIND_ME = L0_0
function L0_0(A0_79)
  return IsWard(A0_79)
end
CO_IS_WARD = L0_0
function L0_0(A0_80)
  return IsStructure(A0_80)
end
CO_IS_STRUCTURE = L0_0
function L0_0(A0_81)
  return IsStructure(A0_81) ~= true
end
CO_IS_NOT_STRUCTURE = L0_0
function L0_0(A0_82, A1_83, A2_84)
  local L3_85, L4_86, L5_87, L6_88
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
BBIf = L0_0
function L0_0(A0_89, A1_90, A2_91)
  if A0_89.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_91, A0_89)
    A0_89.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_92, A1_93, A2_94)
  local L3_95, L4_96, L5_97, L6_98
  L3_95 = A0_92.LastIfSucceeded
  if L3_95 == false then
    L3_95 = GetTable
    L4_96 = A0_92
    L5_97 = A1_93.Src1VarTable
    L6_98 = false
    L3_95 = L3_95(L4_96, L5_97, L6_98)
    L4_96 = GetTable
    L5_97 = A0_92
    L6_98 = A1_93.Src2VarTable
    L4_96 = L4_96(L5_97, L6_98, false)
    L5_97 = false
    L6_98 = nil
    if L3_95 ~= nil and A1_93.Src1Var ~= nil then
      L6_98 = L3_95[A1_93.Src1Var]
    else
      L6_98 = A1_93.Value1
    end
    if L4_96 ~= nil and A1_93.Src2Var ~= nil then
      L5_97 = A1_93.CompareOp(L6_98, L4_96[A1_93.Src2Var])
    else
      L5_97 = A1_93.CompareOp(L6_98, A1_93.Value2)
    end
    if L5_97 then
      ExecuteBuildingBlocks(A2_94, A0_92)
      A0_92.LastIfSucceeded = true
    else
      A0_92.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_99, A1_100, A2_101)
  local L3_102
  if A1_100.TargetVar ~= nil then
    L3_102 = A0_99[A1_100.TargetVar]
  else
    L3_102 = A0_99.Target
  end
  if HasBuffOfType(L3_102, A1_100.BuffType) then
    ExecuteBuildingBlocks(A2_101, A0_99)
    A0_99.LastIfSucceeded = true
  else
    A0_99.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_103, A1_104, A2_105)
  local L3_106, L4_107
  if A1_104.OwnerVar ~= nil then
    L3_106 = A0_103[A1_104.OwnerVar]
  else
    L3_106 = A0_103.Owner
  end
  if A1_104.AttackerVar ~= nil then
    L4_107 = A0_103[A1_104.AttackerVar]
  else
    L4_107 = A0_103.Attacker
  end
  if SpellBuffCount(L3_106, A1_104.BuffName, L4_107) > 0 then
    ExecuteBuildingBlocks(A2_105, A0_103)
    A0_103.LastIfSucceeded = true
  else
    A0_103.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_108, A1_109, A2_110)
  if BBIsMissileAutoAttack(A0_108, A1_109) then
    ExecuteBuildingBlocks(A2_110, A0_108)
    A0_108.LastIfSucceeded = true
  else
    A0_108.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_111, A1_112)
  A0_111.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_113, A1_114, A2_115)
  local L3_116, L4_117
  if A1_114.OwnerVar ~= nil then
    L3_116 = A0_113[A1_114.OwnerVar]
  else
    L3_116 = A0_113.Owner
  end
  if A1_114.CasterVar ~= nil then
    L4_117 = A0_113[A1_114.CasterVar]
  else
    L4_117 = A0_113.Caster
  end
  if SpellBuffCount(L3_116, A1_114.BuffName, L4_117) <= 0 then
    ExecuteBuildingBlocks(A2_115, A0_113)
    A0_113.LastIfSucceeded = true
  else
    A0_113.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_118, A1_119, A2_120)
  local L3_121, L4_122
  if A1_119.OwnerVar ~= nil then
    L3_121 = A0_118[A1_119.OwnerVar]
  else
    L3_121 = A0_118.Owner
  end
  if HasPARType(L3_121, A1_119.PARType) then
    ExecuteBuildingBlocks(A2_120, A0_118)
    A0_118.LastIfSucceeded = true
  else
    A0_118.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_123, A1_124, A2_125)
  local L3_126, L4_127
  if A1_124.OwnerVar ~= nil then
    L3_126 = A0_123[A1_124.OwnerVar]
  else
    L3_126 = A0_123.Owner
  end
  if not HasPARType(L3_126, A1_124.PARType) then
    ExecuteBuildingBlocks(A2_125, A0_123)
    A0_123.LastIfSucceeded = true
  else
    A0_123.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_128, A1_129, A2_130)
  local L3_131, L4_132, L5_133, L6_134, L7_135
  L3_131 = GetTable
  L4_132 = A0_128
  L5_133 = A1_129.Src1VarTable
  L6_134 = false
  L3_131 = L3_131(L4_132, L5_133, L6_134)
  L4_132 = GetTable
  L5_133 = A0_128
  L6_134 = A1_129.Src2VarTable
  L7_135 = false
  L4_132 = L4_132(L5_133, L6_134, L7_135)
  L5_133 = true
  while L5_133 do
    L6_134 = false
    L7_135 = nil
    if L3_131 ~= nil and A1_129.Src1Var ~= nil then
      L7_135 = L3_131[A1_129.Src1Var]
    else
      L7_135 = A1_129.Value1
    end
    if L4_132 ~= nil and A1_129.Src2Var ~= nil then
      L6_134 = A1_129.CompareOp(L7_135, L4_132[A1_129.Src2Var])
    else
      L6_134 = A1_129.CompareOp(L7_135, A1_129.Value2)
    end
    if L6_134 then
      ExecuteBuildingBlocks(A2_130, A0_128)
    else
      L5_133 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_136, A1_137)
  return A0_136 * A1_137
end
MO_MULTIPLY = L0_0
function L0_0(A0_138, A1_139)
  return A0_138 + A1_139
end
MO_ADD = L0_0
function L0_0(A0_140, A1_141)
  return A0_140 - A1_141
end
MO_SUBTRACT = L0_0
function L0_0(A0_142, A1_143)
  return A0_142 / A1_143
end
MO_DIVIDE = L0_0
function L0_0(A0_144, A1_145)
  if A0_144 < A1_145 then
    return A0_144
  else
    return A1_145
  end
end
MO_MIN = L0_0
function L0_0(A0_146, A1_147)
  if A1_147 < A0_146 then
    return A0_146
  else
    return A1_147
  end
end
MO_MAX = L0_0
function L0_0(A0_148, A1_149)
  return A0_148 % A1_149
end
MO_MODULO = L0_0
function L0_0(A0_150)
  return math.floor(A0_150 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_151)
  return math.ceil(A0_151)
end
MO_ROUNDUP = L0_0
function L0_0(A0_152)
  return math.floor(A0_152)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_153)
  return math.sin(math.rad(A0_153))
end
MO_SIN = L0_0
function L0_0(A0_154)
  return math.cos(math.rad(A0_154))
end
MO_COSINE = L0_0
function L0_0(A0_155)
  return math.tan(math.rad(A0_155))
end
MO_TANGENT = L0_0
function L0_0(A0_156)
  return math.deg(math.asin(A0_156))
end
MO_ASIN = L0_0
function L0_0(A0_157)
  return math.deg(math.acos(A0_157))
end
MO_ACOS = L0_0
function L0_0(A0_158)
  return math.deg(math.atan(A0_158))
end
MO_ATAN = L0_0
function L0_0(A0_159, A1_160)
  return math.pow(A0_159, A1_160)
end
MO_POW = L0_0
function L0_0(A0_161)
  return math.sqrt(A0_161)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_162, A1_163)
  local L2_164
  L2_164 = A0_162 and A1_163
  return L2_164
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_165, A1_166)
  local L2_167
  L2_167 = A0_165 or A1_166
  return L2_167
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_168)
  local L1_169
  L1_169 = not A0_168
  return L1_169
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_170)
  return math.abs(A0_170)
end
MO_ABS = L0_0
function L0_0(A0_171, A1_172)
  return math.random(A0_171, A1_172)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_173, A1_174)
  local L2_175, L3_176
  L2_175 = GetMathNumber
  L3_176 = A0_173
  L2_175 = L2_175(L3_176, A1_174.Src1VarTable, A1_174.Src1Var, A1_174.Src1Value)
  L3_176 = GetMathNumber
  L3_176 = L3_176(A0_173, A1_174.Src2VarTable, A1_174.Src2Var, A1_174.Src2Value)
  GetTable(A0_173, A1_174.DestVarTable)[A1_174.DestVar] = A1_174.MathOp(L2_175, L3_176)
end
BBMath = L0_0
function L0_0(A0_177, A1_178, A2_179, A3_180)
  if A2_179 ~= nil and GetTable(A0_177, A1_178)[A2_179] ~= nil then
    return GetTable(A0_177, A1_178)[A2_179]
  end
  return A3_180
end
GetMathNumber = L0_0
function L0_0(A0_181, A1_182)
  if type(A1_182) == "number" then
    return A1_182
  elseif type(A1_182) == "function" then
    return A1_182(A0_181)
  elseif type(A1_182) == "string" then
    return A0_181[A1_182]
  end
end
GetNumber = L0_0
function L0_0(A0_183, A1_184)
  return VectorAdd(A0_183, A1_184)
end
VEC_ADD = L0_0
function L0_0(A0_185, A1_186)
  return VectorSubtract(A0_185, A1_186)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_187, A1_188)
  return VectorScalarMultiply(A0_187, A1_188)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_189, A1_190)
  return VectorScalarDivide(A0_189, A1_190)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_191, A1_192)
  return VectorRotateY(A0_191, A1_192)
end
VEC_ROTATE = L0_0
function L0_0(A0_193, A1_194)
  BBMath(A0_193, A1_194)
end
BBVectorMath = L0_0
function L0_0(A0_195, A1_196)
  local L2_197, L3_198, L4_199, L5_200
  L2_197 = A0_195.InstanceVars
  L3_198 = L2_197.InterpDelta
  if L3_198 == nil then
    L3_198 = A1_196.Amount
    L4_199 = A1_196.AmountVar
    if L4_199 ~= nil then
      L4_199 = GetTable
      L5_200 = A0_195
      L4_199 = L4_199(L5_200, A1_196.AmountVarTable)
      L5_200 = A1_196.AmountVar
      L3_198 = L4_199[L5_200]
    end
    L4_199 = GetPosition
    L5_200 = A1_196.TargetVar
    L5_200 = A0_195[L5_200]
    L4_199 = L4_199(L5_200)
    L2_197.KnockBackStart = L4_199
    L4_199 = GetNormalizedPositionDelta
    L5_200 = A1_196.TargetVar
    L5_200 = A0_195[L5_200]
    L4_199 = L4_199(L5_200, A0_195[A1_196.AttackerVar], true)
    L5_200 = {}
    L5_200.x = L4_199.x * L3_198
    L5_200.y = 0
    L5_200.z = L4_199.z * L3_198
    L2_197.InterpDelta = L5_200
    L5_200 = GetTime
    L5_200 = L5_200()
    L2_197.StartTime = L5_200
    L5_200 = A1_196.KnockBackDuration
    L2_197.KnockBackDuration = L5_200
  end
  L3_198 = A1_196.TargetVar
  L3_198 = A0_195[L3_198]
  L4_199 = GetTime
  L4_199 = L4_199()
  L5_200 = L2_197.StartTime
  L4_199 = L4_199 - L5_200
  L5_200 = L2_197.KnockBackDuration
  L4_199 = L4_199 / L5_200
  L5_200 = {}
  L5_200.x = L2_197.KnockBackStart.x + L2_197.InterpDelta.x * L4_199
  L5_200.y = L2_197.KnockBackStart.y
  L5_200.z = L2_197.KnockBackStart.z + L2_197.InterpDelta.z * L4_199
  SetPosition(L3_198, L5_200)
end
BBKnockback = L0_0
function L0_0(A0_201, A1_202)
  local L2_203
  L2_203 = 0
  if A1_202.Delta ~= nil then
    L2_203 = L2_203 + A1_202.Delta
  end
  if A1_202.DeltaByLevel ~= nil and A0_201.Level ~= nil then
    L2_203 = L2_203 + A1_202.DeltaByLevel[A0_201.Level]
  end
  if A1_202.DeltaVar ~= nil then
    L2_203 = L2_203 + GetTable(A0_201, A1_202.DeltaVarTable, true)[A1_202.DeltaVar]
  end
  if A1_202.TargetVar ~= nil then
    A1_202.Stat(L2_203, A0_201[A1_202.TargetVar])
  else
    A1_202.Stat(L2_203)
  end
end
BBIncStat = L0_0
function L0_0(A0_204, A1_205)
  local L2_206
  L2_206 = 0
  if A1_205.Delta ~= nil then
    L2_206 = L2_206 + A1_205.Delta
  end
  if A1_205.DeltaByLevel ~= nil and A0_204.Level ~= nil then
    L2_206 = L2_206 + A1_205.DeltaByLevel[A0_204.Level]
  end
  if A1_205.DeltaVar ~= nil then
    L2_206 = L2_206 + GetTable(A0_204, A1_205.DeltaVarTable, true)[A1_205.DeltaVar]
  end
  if A1_205.TargetVar ~= nil then
    A1_205.Stat(L2_206, A0_204[A1_205.TargetVar])
  else
    A1_205.Stat(L2_206)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_207, A1_208)
  if A1_208.TargetVar ~= nil then
    GetTable(A0_207, A1_208.DestVarTable, false)[A1_208.DestVar] = A1_208.Stat(A0_207[A1_208.TargetVar])
  else
    GetTable(A0_207, A1_208.DestVarTable, false)[A1_208.DestVar] = A1_208.Stat()
  end
end
BBGetStat = L0_0
function L0_0(A0_209, A1_210)
  if A1_210.TargetVar ~= nil then
    GetTable(A0_209, A1_210.DestVarTable, false)[A1_210.DestVar] = GetLevel(A0_209[A1_210.TargetVar])
  else
    GetTable(A0_209, A1_210.DestVarTable, false)[A1_210.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_211, A1_212)
  if A1_212.TargetVar ~= nil then
    GetTable(A0_211, A1_212.DestVarTable, false)[A1_212.DestVar] = GetUnitSignificance(A0_211[A1_212.TargetVar])
  else
    GetTable(A0_211, A1_212.DestVarTable, false)[A1_212.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_213, A1_214)
  if A1_214.TargetVar ~= nil then
    GetTable(A0_213, A1_214.DestVarTable, false)[A1_214.DestVar] = GetArmor(A0_213[A1_214.TargetVar])
  else
    GetTable(A0_213, A1_214.DestVarTable, false)[A1_214.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_215, A1_216)
  if A1_216.TargetVar ~= nil then
    GetTable(A0_215, A1_216.DestVarTable, false)[A1_216.DestVar] = GetSpellBlock(A0_215[A1_216.TargetVar])
  else
    GetTable(A0_215, A1_216.DestVarTable, false)[A1_216.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_217, A1_218)
  if A1_218.TargetVar ~= nil then
    GetTable(A0_217, A1_218.DestVarTable, false)[A1_218.DestVar] = GetTeamID(A0_217[A1_218.TargetVar])
  else
    GetTable(A0_217, A1_218.DestVarTable, false)[A1_218.DestVar] = GetTeamID()
  end
end
BBGetTeamID = L0_0
function L0_0(A0_219, A1_220)
  if A1_220.TargetVar ~= nil then
    GetTable(A0_219, A1_220.DestVarTable, false)[A1_220.DestVar] = GetUnitSkinName(A0_219[A1_220.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_221, A1_222)
  if A1_222.TargetVar ~= nil then
    GetTable(A0_221, A1_222.DestVarTable, false)[A1_222.DestVar] = GetTotalAttackDamage(A0_221[A1_222.TargetVar])
  else
    GetTable(A0_221, A1_222.DestVarTable, false)[A1_222.DestVar] = GetTotalAttackDamage()
  end
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_223, A1_224)
  GetTable(A0_223, A1_224.DestVarTable, true)[A1_224.DestVar] = A1_224.Status(A0_223[A1_224.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_225, A1_226)
  local L2_227
  L2_227 = A1_226.TargetVar
  L2_227 = A0_225[L2_227]
  ClearAttackTarget(L2_227)
end
BBClearAttackTarget = L0_0
function L0_0(A0_228, A1_229)
  GetTable(A0_228, A1_229.DestVarTable, true)[A1_229.DestVar] = A1_229.Info(A0_228[A1_229.TargetVar])
end
BBGetCastInfo = L0_0
function L0_0(A0_230, A1_231, A2_232)
  local L3_233, L4_234, L5_235, L6_236
  L3_233 = GetTable
  L4_234 = A0_230
  L5_235 = A1_231.TrackTimeVarTable
  L6_236 = false
  L3_233 = L3_233(L4_234, L5_235, L6_236)
  L4_234 = GetTime
  L4_234 = L4_234()
  L5_235 = A1_231.ExecuteImmediately
  L6_236 = A1_231.TimeBetweenExecutions
  if A1_231.TickTimeVar ~= nil and GetTable(A0_230, A1_231.TickTimeVarTable, false)[A1_231.TickTimeVar] ~= nil then
    L6_236 = GetTable(A0_230, A1_231.TickTimeVarTable, false)[A1_231.TickTimeVar]
  end
  if L3_233[A1_231.TrackTimeVar] == nil then
    L3_233[A1_231.TrackTimeVar] = L4_234
    if L5_235 == true then
      ExecuteBuildingBlocks(A2_232, A0_230)
    end
  end
  if L4_234 >= L3_233[A1_231.TrackTimeVar] + L6_236 then
    L3_233[A1_231.TrackTimeVar] = L3_233[A1_231.TrackTimeVar] + L6_236
    ExecuteBuildingBlocks(A2_232, A0_230)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_237, A1_238, A2_239)
  GetTable(A0_237, A1_238.TrackTimeVarTable, false)[A1_238.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_240, A1_241)
  local L2_242
  L2_242 = A1_241.SrcValue
  if A1_241.SrcVar ~= nil then
    L2_242 = GetTable(A0_240, A1_241.SrcTable, true)[A1_241.SrcVar]
  end
  A1_241.Status(A0_240[A1_241.TargetVar], L2_242)
end
BBSetStatus = L0_0
function L0_0(A0_243, A1_244)
  local L2_245
  L2_245 = A1_244.ToAlert
  if GetTable(A0_243, A1_244.SrcVarTable, false) ~= nil and A1_244.SrcVar ~= nil then
    L2_245 = L2_245 .. GetTable(A0_243, A1_244.SrcVarTable, false)[A1_244.SrcVar]
  end
  _ALERT(L2_245)
end
BBAlert = L0_0
function L0_0(A0_246, A1_247)
  local L2_248, L3_249, L4_250
  L2_248 = A1_247.ToSay
  L3_249 = GetTable
  L4_250 = A0_246
  L3_249 = L3_249(L4_250, A1_247.SrcVarTable, false)
  if L3_249 ~= nil then
    L4_250 = A1_247.SrcVar
    if L4_250 ~= nil then
      L4_250 = L2_248
      L2_248 = L4_250 .. tostring(L3_249[A1_247.SrcVar])
    end
  end
  L4_250 = nil
  if A1_247.OwnerVar ~= nil then
    L4_250 = A0_246[A1_247.OwnerVar]
  else
    L4_250 = A0_246.Owner
  end
  if A1_247.TextType == nil then
    A1_247.TextType = 0
  end
  Say(L4_250, L2_248, A1_247.TextType)
end
BBSay = L0_0
function L0_0(A0_251, A1_252)
  local L2_253, L3_254, L4_255
  L2_253 = A1_252.ToSay
  L3_254 = GetTable
  L4_255 = A0_251
  L3_254 = L3_254(L4_255, A1_252.SrcVarTable, false)
  if L3_254 ~= nil then
    L4_255 = A1_252.SrcVar
    if L4_255 ~= nil then
      L4_255 = L2_253
      L2_253 = L4_255 .. tostring(L3_254[A1_252.SrcVar])
    end
  end
  L4_255 = nil
  if A1_252.OwnerVar ~= nil then
    L4_255 = A0_251[A1_252.OwnerVar]
  else
    L4_255 = A0_251.Owner
  end
  if A1_252.TextType == nil then
    A1_252.TextType = 0
  end
  Say(L4_255, L2_253, A1_252.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_256, A1_257)
  GetTable(A0_256, A1_257.DestVarTable, true)[A1_257.DestVar] = BBLuaGetGold(A0_256, A1_257)
end
BBGetGold = L0_0
function L0_0(A0_258, A1_259)
  SpellBuffAdd(A0_258[A1_259.OwnerVar], A0_258[A1_259.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_258.NextBuffVars)
  BBTeleportToPositionHelper(A0_258, A1_259)
end
BBTeleportToPosition = L0_0
function L0_0(A0_260, A1_261)
  if A1_261.XVar ~= nil and GetTable(A0_260, A1_261.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_260, A1_261.XVarTable, true)[A1_261.XVar]
  else
    Xloc = A1_261.X
  end
  if A1_261.YVar ~= nil and GetTable(A0_260, A1_261.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_260, A1_261.YVarTable, true)[A1_261.YVar]
  else
    Yloc = A1_261.Y
  end
  if A1_261.ZVar ~= nil and GetTable(A0_260, A1_261.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_260, A1_261.ZVarTable, true)[A1_261.ZVar]
  else
    Zloc = A1_261.Z
  end
  A1_261.OwnerVar, A0_260.position = A1_261.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_261.CastPositionName = "position"
  BBTeleportToPosition(A0_260, A1_261)
end
BBTeleportToPoint = L0_0
function L0_0(A0_262, A1_263)
  DefUpdateAura(GetTable(A0_262, A1_263.CenterTable, false)[A1_263.CenterVar], A1_263.Range, A1_263.UnitScan, A1_263.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_264, A1_265)
  ReincarnateNonDeadHero(GetTable(A0_264, A1_265.TargetTable, false)[A1_265.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_266, A1_267)
  GetTable(A0_266, A1_267.DestVarTable, true)[A1_267.DestVar] = A1_267.Function(A0_266[A1_267.OwnerVar], A1_267.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_268, A1_269)
  local L2_270, L3_271, L4_272, L5_273
  L2_270 = A1_269.WhomToOrderVar
  L2_270 = A0_268[L2_270]
  L3_271 = A1_269.TargetOfOrderVar
  L3_271 = A0_268[L3_271]
  L4_272 = GetTable
  L5_273 = A0_268
  L4_272 = L4_272(L5_273, A1_269.SrcVarTable, false)
  L5_273 = nil
  if A1_269.SrcVar ~= nil and L4_272 ~= nil then
    L5_273 = L4_272[A1_269.SrcVar]
  else
    L5_273 = GetPosition(L3_271)
  end
  if L3_271 == nil then
    L3_271 = L2_270
  end
  IssueOrder(L2_270, A1_269.Order, L5_273, L3_271)
end
BBIssueOrder = L0_0
function L0_0(A0_274, A1_275)
  SetSpellCastRange(A1_275.NewRange)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_276, A1_277)
  GetTable(A0_276, A1_277.DestVarTable, true)[A1_277.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_278, A1_279)
  local L2_280, L3_281
  L2_280 = A1_279.ObjectVar1
  L2_280 = A0_278[L2_280]
  L3_281 = A1_279.ObjectVar2
  L3_281 = A0_278[L3_281]
  GetTable(A0_278, A1_279.DestVarTable, true)[A1_279.DestVar] = DistanceBetweenObjectBounds(L2_280, L3_281)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_282, A1_283)
  local L2_284, L3_285, L4_286
  L2_284 = A1_283.ObjectVar
  L2_284 = A0_282[L2_284]
  L3_285 = GetTable
  L4_286 = A0_282
  L3_285 = L3_285(L4_286, A1_283.PointVarTable, true)
  L4_286 = A1_283.PointVar
  L4_286 = L3_285[L4_286]
  GetTable(A0_282, A1_283.DestVarTable, true)[A1_283.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_284, L4_286)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_287, A1_288)
  local L2_289, L3_290, L4_291, L5_292
  L2_289 = GetTable
  L3_290 = A0_287
  L4_291 = A1_288.Point1VarTable
  L5_292 = true
  L2_289 = L2_289(L3_290, L4_291, L5_292)
  L3_290 = A1_288.Point1Var
  L3_290 = L2_289[L3_290]
  L4_291 = GetTable
  L5_292 = A0_287
  L4_291 = L4_291(L5_292, A1_288.Point2VarTable, true)
  L5_292 = A1_288.Point2Var
  L5_292 = L4_291[L5_292]
  GetTable(A0_287, A1_288.DestVarTable, true)[A1_288.DestVar] = DistanceBetweenPoints(L3_290, L5_292)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_293, A1_294, A2_295)
  local L3_296, L4_297, L5_298, L6_299, L7_300, L8_301
  L5_298 = 0
  L6_299 = nil
  L7_300 = A1_294.ObjectDistanceType
  L8_301 = A1_294.ObjectVar1
  L3_296 = A0_293[L8_301]
  L8_301 = A1_294.ObjectVar2
  L4_297 = A0_293[L8_301]
  if nil == L4_297 then
    L8_301 = A1_294.Point2Var
    if nil ~= L8_301 then
      L8_301 = GetTable
      L8_301 = L8_301(A0_293, A1_294.Point2VarTable, true)
      L4_297 = L8_301[A1_294.Point2Var]
      L5_298 = L5_298 + 1
    end
  end
  if nil == L3_296 then
    L8_301 = A1_294.Point1Var
    if nil ~= L8_301 then
      L8_301 = GetTable
      L8_301 = L8_301(A0_293, A1_294.Point1VarTable, true)
      L3_296 = L8_301[A1_294.Point1Var]
      L5_298 = L5_298 + 1
      if 1 == L5_298 then
        L3_296, L4_297 = L4_297, L3_296
      end
    end
  end
  if nil ~= L7_300 then
    if 0 == L5_298 then
      L8_301 = OBJECT_CENTER
      if L8_301 == L7_300 then
        L6_299 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_301 = OBJECT_BOUNDARY
        if L8_301 == L7_300 then
          L6_299 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_301 = A1_294.OwnerVar
          L8_301 = A0_293[L8_301]
          Say(L8_301, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_298 then
      L8_301 = OBJECT_CENTER
      if L8_301 == L7_300 then
        L6_299 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_301 = OBJECT_BOUNDARY
        if L8_301 == L7_300 then
          L6_299 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_301 = A1_294.OwnerVar
          L8_301 = A0_293[L8_301]
          Say(L8_301, "invalid object distance type", 0)
        end
      end
    else
      L6_299 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_301 = A1_294.Distance
  if A1_294.DistanceVar ~= nil and GetTable(A0_293, A1_294.DistanceVarTable, true) ~= nil then
    L8_301 = L8_301 + GetTable(A0_293, A1_294.DistanceVarTable, true)[A1_294.DistanceVar]
  end
  if L3_296 ~= nil and L4_297 ~= nil and L6_299 ~= nil and L8_301 ~= nil then
    if not L6_299(L3_296, L4_297, L8_301) then
      ExecuteBuildingBlocks(A2_295, A0_293)
      A0_293.LastIfSucceeded = true
    else
      A0_293.LastIfSucceeded = false
    end
  else
    A0_293.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_302, A1_303)
  local L2_304, L3_305
  L2_304 = A1_303.TargetVar
  L2_304 = A0_302[L2_304]
  L3_305 = A1_303.CasterVar
  L3_305 = A0_302[L3_305]
  GetTable(A0_302, A1_303.DestVarTable, true)[A1_303.DestVar] = SpellBuffCount(L2_304, A1_303.BuffName, L3_305)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_306, A1_307)
  local L2_308
  L2_308 = A1_307.TargetVar
  L2_308 = A0_306[L2_308]
  GetTable(A0_306, A1_307.DestVarTable, true)[A1_307.DestVar] = SpellBuffCount(L2_308, A1_307.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_309, A1_310)
  local L2_311, L3_312
  L2_311 = GetTable
  L3_312 = A0_309
  L2_311 = L2_311(L3_312, A1_310.ScaleVarTable, false)
  L3_312 = nil
  if A1_310.OwnerVar ~= nil then
    L3_312 = A0_309[A1_310.OwnerVar]
  else
    L3_312 = A0_309.Owner
  end
  if A1_310.ScaleVar ~= nil and A1_310.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_311[A1_310.ScaleVar], L3_312)
  else
    SetScaleSkinCoef(A1_310.Scale, L3_312)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_313, A1_314)
  SpellBuffAdd(A0_313[A1_314.TargetVar], A0_313[A1_314.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_313.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_315, A1_316, A2_317)
  local L3_318, L4_319
  L3_318 = A1_316.TargetVar
  L3_318 = A0_315[L3_318]
  L4_319 = A1_316.NumStacks
  if A1_316.NumStacks == 0 then
    L4_319 = SpellBuffCount(L3_318, A1_316.BuffName, caster)
  end
  while L4_319 > 0 do
    SpellBuffRemove(L3_318, A1_316.BuffName, A0_315[A1_316.AttackerVar])
    L4_319 = L4_319 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_320, A1_321, A2_322)
  if A0_320.EmoteId == A1_321.EmoteId then
    ExecuteBuildingBlocks(A2_322, A0_320)
    A0_320.LastIfSucceeded = true
  else
    A0_320.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_323, A1_324, A2_325)
  if A0_323.EmoteId ~= A1_324.EmoteId then
    ExecuteBuildingBlocks(A2_325, A0_323)
    A0_323.LastIfSucceeded = true
  else
    A0_323.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
