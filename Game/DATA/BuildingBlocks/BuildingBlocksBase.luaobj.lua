local L0_0, L1_1
L0_0 = -1
gCurrentBuildingBlockNumber = L0_0
L0_0 = ""
gCurrentBuildingBlockString = L0_0
L0_0 = {}
functionToStringMap = L0_0
L0_0 = false
functionToStringMapInitialized = L0_0
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
          if not L8_10 then
            for L11_13, L12_14 in L8_10(L9_11) do
              if type(L12_14) == "function" then
                functionToStringMap[L12_14] = L11_13
                if L12_14 == gCurrentBuildingBlock.Function then
                  gCurrentBuildingBlockString = L11_13
                end
              end
            end
            functionToStringMapInitialized = L8_10
          else
            gCurrentBuildingBlockString = L8_10
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
function L0_0(A0_20, A1_21)
  local L2_22, L3_23
  L2_22 = GetTable
  L3_23 = A0_20
  L2_22 = L2_22(L3_23, A1_21.SrcTable, false)
  L3_23 = A1_21.ToSay
  L3_23 = L3_23 or ""
  ClientPrint(tostring(L3_23) .. ": " .. type(L2_22[A1_21.SrcVar]))
end
BBPrintTypeToChat = L0_0
function L0_0(A0_24)
  A0_24 = tostring(A0_24)
  BBPrintToChat({}, {ToSay = A0_24})
end
ClientPrint = L0_0
function L0_0(A0_25, A1_26)
  local L2_27, L3_28
  L2_27 = GetTable
  L3_28 = A0_25
  L2_27 = L2_27(L3_28, A1_26.TableName, true)
  L3_28 = A1_26.TableName
  L3_28 = L3_28 or "PassThroughParams"
  ClientPrint(L3_28)
  PrintTableToChat(L2_27)
end
BBPrintTableToChat = L0_0
function L0_0(A0_29, A1_30)
  local L2_31, L3_32, L4_33, L5_34, L6_35, L7_36, L8_37, L9_38, L10_39, L11_40, L12_41, L13_42
  A1_30 = A1_30 or 0
  if A1_30 > 10 then
    return
  end
  L2_31 = nil
  L3_32 = "|"
  for L7_36 = 1, A1_30 do
    L9_38 = "----"
    L3_32 = L8_37 .. L9_38
  end
  L6_35(L7_36)
  for L9_38, L10_39 in L6_35(L7_36) do
    L11_40 = nil
    L12_41 = tostring
    L13_42 = L9_38
    L12_41 = L12_41(L13_42)
    if L12_41 == "PassThroughParams" then
      L11_40 = "{{ PassThroughParams }}"
    else
      L13_42 = type
      L13_42 = L13_42(L10_39)
      if L13_42 == "table" then
        L11_40 = "Table"
      else
        L13_42 = tostring
        L13_42 = L13_42(L10_39)
        L11_40 = L13_42
      end
    end
    L13_42 = L3_32
    L13_42 = L13_42 .. L12_41 .. ": " .. L11_40
    ClientPrint(L13_42)
    if type(L10_39) == "table" then
      PrintTableToChat(L10_39, A1_30 + 1)
    end
  end
  L6_35(L7_36)
end
PrintTableToChat = L0_0
function L0_0(A0_43, A1_44, A2_45)
  local L3_46
  if A1_44 ~= nil then
    L3_46 = A0_43[A1_44]
    if L3_46 == nil and A2_45 then
      A0_43[A1_44] = {}
      return A0_43[A1_44]
    end
  end
  if L3_46 == nil then
    L3_46 = A0_43
  end
  return L3_46
end
GetTable = L0_0
function L0_0(A0_47, A1_48, A2_49)
  if A2_49[A0_47 .. "Var"] ~= nil and GetTable(A1_48, A2_49[A0_47 .. "VarTable"], false) ~= nil then
    return GetTable(A1_48, A2_49[A0_47 .. "VarTable"], false)[A2_49[A0_47 .. "Var"]]
  else
    return A2_49[A0_47]
  end
end
GetParam = L0_0
function L0_0(A0_50, A1_51)
  GetTable(A0_50, A1_51.DestVarTable, true)[A1_51.DestVar] = {}
end
BBCreateCustomTable = L0_0
function L0_0(A0_52, A1_53)
  GetTable(A0_52, A1_53.TableNameTable, false)[A1_53.TableNameVar] = nil
end
BBDestroyTable = L0_0
function L0_0(A0_54, A1_55)
  if type(GetTable(A0_54, A1_55.DestTableVarTable, false)[A1_55.DestTableVar]) == "nil" then
    GetTable(A0_54, A1_55.DestTableVarTable, false)[A1_55.DestTableVar] = {}
  end
  if type(GetTable(A0_54, A1_55.DestTableVarTable, false)[A1_55.DestTableVar]) == "table" then
    GetTable(A0_54, A1_55.DestTableVarTable, false)[A1_55.DestTableVar][GetParam("Key", A0_54, A1_55)] = GetParam("Value", A0_54, A1_55)
  end
end
BBSetKeyValueInCustomTable = L0_0
function L0_0(A0_56, A1_57)
  if type(GetTable(A0_56, A1_57.SrcTableVarTable, false)[A1_57.SrcTableVar]) == "table" then
    GetTable(A0_56, A1_57.DestVarTable, true)[A1_57.DestVar] = GetTable(A0_56, A1_57.SrcTableVarTable, false)[A1_57.SrcTableVar][GetParam("SrcKey", A0_56, A1_57)]
  end
end
BBGetKeyValueInCustomTable = L0_0
function L0_0(A0_58, A1_59, A2_60)
  local L3_61, L4_62, L5_63, L6_64, L7_65, L8_66
  L3_61 = GetTable
  L3_61 = L3_61(L4_62, L5_63, L6_64)
  if L4_62 == "table" then
    if L4_62 then
      for L8_66, _FORV_9_ in L5_63(L6_64) do
        table.insert(L4_62, L8_66)
      end
      L5_63(L6_64)
      for L8_66, _FORV_9_ in L5_63(L6_64) do
        GetTable(A0_58, A1_59.DestKeyVarTable, true)[A1_59.DestKeyVar] = _FORV_9_
        GetTable(A0_58, A1_59.DestValueVarTable, true)[A1_59.DestValueVar] = L3_61[A1_59.TableVar][_FORV_9_]
        ExecuteBuildingBlocks(A2_60, A0_58)
      end
    else
      for L7_65, L8_66 in L4_62(L5_63) do
        GetTable(A0_58, A1_59.DestKeyVarTable, true)[A1_59.DestKeyVar] = L7_65
        GetTable(A0_58, A1_59.DestValueVarTable, true)[A1_59.DestValueVar] = L8_66
        ExecuteBuildingBlocks(A2_60, A0_58)
      end
    end
  end
end
BBForEachInCustomTable = L0_0
function L0_0(A0_67, A1_68)
  local L2_69, L3_70
  L2_69 = GetTable
  L3_70 = A0_67
  L2_69 = L2_69(L3_70, A1_68.DestVarTable, true)
  L3_70 = nil
  if A1_68.SpellSlotVar ~= nil and GetTable(A0_67, A1_68.SpellSlotVarTable, false) ~= nil then
    L3_70 = GetTable(A0_67, A1_68.SpellSlotVarTable, false)[A1_68.SpellSlotVar]
  else
    L3_70 = A1_68.SpellSlotValue
  end
  L2_69[A1_68.DestVar] = A1_68.Function(A0_67[A1_68.OwnerVar], L3_70, A1_68.SpellbookType, A1_68.SlotType)
end
BBGetSlotSpellInfo = L0_0
function L0_0(A0_71, A1_72)
  local L2_73, L3_74, L4_75
  L2_73 = GetTable
  L3_74 = A0_71
  L4_75 = A1_72.SrcVarTable
  L2_73 = L2_73(L3_74, L4_75, false)
  L3_74 = nil
  L4_75 = A1_72.SrcVar
  if L4_75 ~= nil and L2_73 ~= nil then
    L4_75 = A1_72.SrcVar
    L3_74 = L2_73[L4_75]
  else
    L3_74 = A1_72.SrcValue
  end
  L4_75 = nil
  if A1_72.SpellSlotVar ~= nil and GetTable(A0_71, A1_72.SpellSlotVarTable, false) ~= nil then
    L4_75 = GetTable(A0_71, A1_72.SpellSlotVarTable, false)[A1_72.SpellSlotVar]
  else
    L4_75 = A1_72.SpellSlotValue
  end
  SetSlotSpellCooldownTime(A0_71[A1_72.OwnerVar], L4_75, A1_72.SpellbookType, A1_72.SlotType, L3_74)
end
BBSetSlotSpellCooldownTime = L0_0
function L0_0(A0_76, A1_77)
  if A0_76.Level ~= nil and A1_77.SrcValueByLevel ~= nil then
    A0_76.ReturnValue = A1_77.SrcValueByLevel[A0_76.Level]
  elseif A1_77.SrcVar ~= nil and GetTable(A0_76, A1_77.SrcVarTable, false) ~= nil then
    A0_76.ReturnValue = GetTable(A0_76, A1_77.SrcVarTable, false)[A1_77.SrcVar]
  else
    A0_76.ReturnValue = A1_77.SrcValue
  end
end
BBSetReturnValue = L0_0
function L0_0(A0_78, A1_79)
  if type(A0_78) == "string" and type(A1_79) == "string" then
    A0_78 = string.lower(A0_78)
    A1_79 = string.lower(A1_79)
  end
  return A0_78 == A1_79
end
CO_EQUAL = L0_0
function L0_0(A0_80, A1_81)
  if type(A0_80) == "string" and type(A1_81) == "string" then
    A0_80 = string.lower(A0_80)
    A1_81 = string.lower(A1_81)
  end
  return A0_80 ~= A1_81
end
CO_NOT_EQUAL = L0_0
function L0_0(A0_82, A1_83)
  local L2_84
  L2_84 = A0_82 < A1_83
  return L2_84
end
CO_LESS_THAN = L0_0
function L0_0(A0_85, A1_86)
  local L2_87
  L2_87 = A1_86 < A0_85
  return L2_87
end
CO_GREATER_THAN = L0_0
function L0_0(A0_88, A1_89)
  local L2_90
  L2_90 = A0_88 <= A1_89
  return L2_90
end
CO_LESS_THAN_OR_EQUAL = L0_0
function L0_0(A0_91, A1_92)
  local L2_93
  L2_93 = A1_92 <= A0_91
  return L2_93
end
CO_GREATER_THAN_OR_EQUAL = L0_0
function L0_0(A0_94, A1_95)
  return GetTeamID(A0_94) == GetTeamID(A1_95)
end
CO_SAME_TEAM = L0_0
function L0_0(A0_96, A1_97)
  return GetTeamID(A0_96) ~= GetTeamID(A1_97)
end
CO_DIFFERENT_TEAM = L0_0
function L0_0(A0_98, A1_99)
  return GetSourceType() == A1_99 or GetSourceType() == A0_98
end
CO_DAMAGE_SOURCETYPE_IS = L0_0
function L0_0(A0_100, A1_101)
  return GetSourceType() ~= A1_101 and GetSourceType() ~= A0_100
end
CO_DAMAGE_SOURCETYPE_IS_NOT = L0_0
function L0_0(A0_102)
  return IsObjectAI(A0_102)
end
CO_IS_TYPE_AI = L0_0
function L0_0(A0_103)
  return IsObjectAI(A0_103) ~= true
end
CO_IS_NOT_AI = L0_0
function L0_0(A0_104)
  return IsObjectHero(A0_104)
end
CO_IS_TYPE_HERO = L0_0
function L0_0(A0_105)
  return IsObjectHero(A0_105) ~= true
end
CO_IS_NOT_HERO = L0_0
function L0_0(A0_106)
  return IsClone(A0_106)
end
CO_IS_CLONE = L0_0
function L0_0(A0_107)
  return IsClone(A0_107) ~= true
end
CO_IS_NOT_CLONE = L0_0
function L0_0(A0_108)
  return IsMelee(A0_108)
end
CO_IS_MELEE = L0_0
function L0_0(A0_109)
  return IsMelee(A0_109) ~= true
end
CO_IS_RANGED = L0_0
function L0_0(A0_110)
  return A0_110 > math.random()
end
CO_RANDOM_CHANCE_LESS_THAN = L0_0
function L0_0(A0_111)
  return IsTurretAI(A0_111)
end
CO_IS_TYPE_TURRET = L0_0
function L0_0(A0_112)
  return IsTurretAI(A0_112) ~= true
end
CO_IS_NOT_TURRET = L0_0
function L0_0(A0_113)
  return IsDead(A0_113)
end
CO_IS_DEAD = L0_0
function L0_0(A0_114)
  return IsDead(A0_114) ~= true
end
CO_IS_NOT_DEAD = L0_0
function L0_0(A0_115)
  return IsDeadOrZombie(A0_115)
end
CO_IS_DEAD_OR_ZOMBIE = L0_0
function L0_0(A0_116, A1_117)
  return BBIsTargetInFrontOfMe(A0_116, A1_117)
end
CO_IS_TARGET_IN_FRONT_OF_ME = L0_0
function L0_0(A0_118, A1_119)
  return BBIsTargetBehindMe(A0_118, A1_119)
end
CO_IS_TARGET_BEHIND_ME = L0_0
function L0_0(A0_120)
  return IsWard(A0_120)
end
CO_IS_WARD = L0_0
function L0_0(A0_121)
  return IsStructure(A0_121)
end
CO_IS_STRUCTURE = L0_0
function L0_0(A0_122)
  return IsStructure(A0_122) ~= true
end
CO_IS_NOT_STRUCTURE = L0_0
function L0_0(A0_123, A1_124, A2_125)
  local L3_126, L4_127, L5_128, L6_129
  L3_126 = GetTable
  L4_127 = A0_123
  L5_128 = A1_124.Src1VarTable
  L6_129 = false
  L3_126 = L3_126(L4_127, L5_128, L6_129)
  L4_127 = GetTable
  L5_128 = A0_123
  L6_129 = A1_124.Src2VarTable
  L4_127 = L4_127(L5_128, L6_129, false)
  L5_128 = false
  L6_129 = nil
  if L3_126 ~= nil and A1_124.Src1Var ~= nil then
    L6_129 = L3_126[A1_124.Src1Var]
  else
    L6_129 = A1_124.Value1
  end
  if L4_127 ~= nil and A1_124.Src2Var ~= nil then
    L5_128 = A1_124.CompareOp(L6_129, L4_127[A1_124.Src2Var])
  else
    L5_128 = A1_124.CompareOp(L6_129, A1_124.Value2)
  end
  if L5_128 then
    ExecuteBuildingBlocks(A2_125, A0_123)
    A0_123.LastIfSucceeded = true
  else
    A0_123.LastIfSucceeded = false
  end
end
BBIf = L0_0
function L0_0(A0_130, A1_131, A2_132)
  if A0_130.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_132, A0_130)
    A0_130.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_133, A1_134, A2_135)
  local L3_136, L4_137, L5_138, L6_139
  L3_136 = A0_133.LastIfSucceeded
  if L3_136 == false then
    L3_136 = GetTable
    L4_137 = A0_133
    L5_138 = A1_134.Src1VarTable
    L6_139 = false
    L3_136 = L3_136(L4_137, L5_138, L6_139)
    L4_137 = GetTable
    L5_138 = A0_133
    L6_139 = A1_134.Src2VarTable
    L4_137 = L4_137(L5_138, L6_139, false)
    L5_138 = false
    L6_139 = nil
    if L3_136 ~= nil and A1_134.Src1Var ~= nil then
      L6_139 = L3_136[A1_134.Src1Var]
    else
      L6_139 = A1_134.Value1
    end
    if L4_137 ~= nil and A1_134.Src2Var ~= nil then
      L5_138 = A1_134.CompareOp(L6_139, L4_137[A1_134.Src2Var])
    else
      L5_138 = A1_134.CompareOp(L6_139, A1_134.Value2)
    end
    if L5_138 then
      ExecuteBuildingBlocks(A2_135, A0_133)
      A0_133.LastIfSucceeded = true
    else
      A0_133.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_140, A1_141, A2_142)
  local L3_143
  if A1_141.TargetVar ~= nil then
    L3_143 = A0_140[A1_141.TargetVar]
  else
    L3_143 = A0_140.Target
  end
  if HasBuffOfType(L3_143, A1_141.BuffType) then
    ExecuteBuildingBlocks(A2_142, A0_140)
    A0_140.LastIfSucceeded = true
  else
    A0_140.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_144, A1_145, A2_146)
  local L3_147, L4_148
  if A1_145.OwnerVar ~= nil then
    L3_147 = A0_144[A1_145.OwnerVar]
  else
    L3_147 = A0_144.Owner
  end
  if A1_145.AttackerVar ~= nil then
    L4_148 = A0_144[A1_145.AttackerVar]
  else
    L4_148 = A0_144.Attacker
  end
  if SpellBuffCount(L3_147, A1_145.BuffName, L4_148) > 0 then
    ExecuteBuildingBlocks(A2_146, A0_144)
    A0_144.LastIfSucceeded = true
  else
    A0_144.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_149, A1_150, A2_151)
  if BBIsMissileAutoAttack(A0_149, A1_150) then
    ExecuteBuildingBlocks(A2_151, A0_149)
    A0_149.LastIfSucceeded = true
  else
    A0_149.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_152, A1_153)
  A0_152.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_154, A1_155, A2_156)
  local L3_157, L4_158
  if A1_155.OwnerVar ~= nil then
    L3_157 = A0_154[A1_155.OwnerVar]
  else
    L3_157 = A0_154.Owner
  end
  if A1_155.CasterVar ~= nil then
    L4_158 = A0_154[A1_155.CasterVar]
  else
    L4_158 = A0_154.Caster
  end
  if SpellBuffCount(L3_157, A1_155.BuffName, L4_158) <= 0 then
    ExecuteBuildingBlocks(A2_156, A0_154)
    A0_154.LastIfSucceeded = true
  else
    A0_154.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_159, A1_160, A2_161)
  local L3_162, L4_163
  if A1_160.OwnerVar ~= nil then
    L3_162 = A0_159[A1_160.OwnerVar]
  else
    L3_162 = A0_159.Owner
  end
  if HasPARType(L3_162, A1_160.PARType) then
    ExecuteBuildingBlocks(A2_161, A0_159)
    A0_159.LastIfSucceeded = true
  else
    A0_159.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_164, A1_165, A2_166)
  local L3_167, L4_168
  if A1_165.OwnerVar ~= nil then
    L3_167 = A0_164[A1_165.OwnerVar]
  else
    L3_167 = A0_164.Owner
  end
  if not HasPARType(L3_167, A1_165.PARType) then
    ExecuteBuildingBlocks(A2_166, A0_164)
    A0_164.LastIfSucceeded = true
  else
    A0_164.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_169, A1_170, A2_171)
  local L3_172, L4_173, L5_174, L6_175, L7_176
  L3_172 = GetTable
  L4_173 = A0_169
  L5_174 = A1_170.Src1VarTable
  L6_175 = false
  L3_172 = L3_172(L4_173, L5_174, L6_175)
  L4_173 = GetTable
  L5_174 = A0_169
  L6_175 = A1_170.Src2VarTable
  L7_176 = false
  L4_173 = L4_173(L5_174, L6_175, L7_176)
  L5_174 = true
  while L5_174 do
    L6_175 = false
    L7_176 = nil
    if L3_172 ~= nil and A1_170.Src1Var ~= nil then
      L7_176 = L3_172[A1_170.Src1Var]
    else
      L7_176 = A1_170.Value1
    end
    if L4_173 ~= nil and A1_170.Src2Var ~= nil then
      L6_175 = A1_170.CompareOp(L7_176, L4_173[A1_170.Src2Var])
    else
      L6_175 = A1_170.CompareOp(L7_176, A1_170.Value2)
    end
    if L6_175 then
      ExecuteBuildingBlocks(A2_171, A0_169)
    else
      L5_174 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_177, A1_178)
  return A0_177 * A1_178
end
MO_MULTIPLY = L0_0
function L0_0(A0_179, A1_180)
  return A0_179 + A1_180
end
MO_ADD = L0_0
function L0_0(A0_181, A1_182)
  return A0_181 - A1_182
end
MO_SUBTRACT = L0_0
function L0_0(A0_183, A1_184)
  return A0_183 / A1_184
end
MO_DIVIDE = L0_0
function L0_0(A0_185, A1_186)
  if A0_185 < A1_186 then
    return A0_185
  else
    return A1_186
  end
end
MO_MIN = L0_0
function L0_0(A0_187, A1_188)
  if A1_188 < A0_187 then
    return A0_187
  else
    return A1_188
  end
end
MO_MAX = L0_0
function L0_0(A0_189, A1_190)
  return A0_189 % A1_190
end
MO_MODULO = L0_0
function L0_0(A0_191)
  return math.floor(A0_191 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_192)
  return math.ceil(A0_192)
end
MO_ROUNDUP = L0_0
function L0_0(A0_193)
  return math.floor(A0_193)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_194)
  return math.sin(math.rad(A0_194))
end
MO_SIN = L0_0
function L0_0(A0_195)
  return math.cos(math.rad(A0_195))
end
MO_COSINE = L0_0
function L0_0(A0_196)
  return math.tan(math.rad(A0_196))
end
MO_TANGENT = L0_0
function L0_0(A0_197)
  return math.deg(math.asin(A0_197))
end
MO_ASIN = L0_0
function L0_0(A0_198)
  return math.deg(math.acos(A0_198))
end
MO_ACOS = L0_0
function L0_0(A0_199)
  return math.deg(math.atan(A0_199))
end
MO_ATAN = L0_0
function L0_0(A0_200, A1_201)
  return math.pow(A0_200, A1_201)
end
MO_POW = L0_0
function L0_0(A0_202)
  return math.sqrt(A0_202)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_203, A1_204)
  local L2_205
  L2_205 = A0_203 and A1_204
  return L2_205
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_206, A1_207)
  local L2_208
  L2_208 = A0_206 or A1_207
  return L2_208
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_209)
  local L1_210
  L1_210 = not A0_209
  return L1_210
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_211)
  return math.abs(A0_211)
end
MO_ABS = L0_0
function L0_0(A0_212, A1_213)
  return math.random(A0_212, A1_213)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_214, A1_215)
  local L2_216, L3_217
  L2_216 = GetMathNumber
  L3_217 = A0_214
  L2_216 = L2_216(L3_217, A1_215.Src1VarTable, A1_215.Src1Var, A1_215.Src1Value)
  L3_217 = GetMathNumber
  L3_217 = L3_217(A0_214, A1_215.Src2VarTable, A1_215.Src2Var, A1_215.Src2Value)
  GetTable(A0_214, A1_215.DestVarTable)[A1_215.DestVar] = A1_215.MathOp(L2_216, L3_217)
end
BBMath = L0_0
function L0_0(A0_218, A1_219, A2_220, A3_221)
  if A2_220 ~= nil and GetTable(A0_218, A1_219)[A2_220] ~= nil then
    return GetTable(A0_218, A1_219)[A2_220]
  end
  return A3_221
end
GetMathNumber = L0_0
function L0_0(A0_222, A1_223)
  if type(A1_223) == "number" then
    return A1_223
  elseif type(A1_223) == "function" then
    return A1_223(A0_222)
  elseif type(A1_223) == "string" then
    return A0_222[A1_223]
  end
end
GetNumber = L0_0
function L0_0(A0_224, A1_225)
  return VectorAdd(A0_224, A1_225)
end
VEC_ADD = L0_0
function L0_0(A0_226, A1_227)
  return VectorSubtract(A0_226, A1_227)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_228, A1_229)
  return VectorScalarMultiply(A0_228, A1_229)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_230, A1_231)
  return VectorScalarDivide(A0_230, A1_231)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_232, A1_233)
  return VectorRotateY(A0_232, A1_233)
end
VEC_ROTATE = L0_0
function L0_0(A0_234, A1_235)
  BBMath(A0_234, A1_235)
end
BBVectorMath = L0_0
function L0_0(A0_236, A1_237)
  local L2_238, L3_239, L4_240, L5_241
  L2_238 = A0_236.InstanceVars
  L3_239 = L2_238.InterpDelta
  if L3_239 == nil then
    L3_239 = A1_237.Amount
    L4_240 = A1_237.AmountVar
    if L4_240 ~= nil then
      L4_240 = GetTable
      L5_241 = A0_236
      L4_240 = L4_240(L5_241, A1_237.AmountVarTable)
      L5_241 = A1_237.AmountVar
      L3_239 = L4_240[L5_241]
    end
    L4_240 = GetPosition
    L5_241 = A1_237.TargetVar
    L5_241 = A0_236[L5_241]
    L4_240 = L4_240(L5_241)
    L2_238.KnockBackStart = L4_240
    L4_240 = GetNormalizedPositionDelta
    L5_241 = A1_237.TargetVar
    L5_241 = A0_236[L5_241]
    L4_240 = L4_240(L5_241, A0_236[A1_237.AttackerVar], true)
    L5_241 = {}
    L5_241.x = L4_240.x * L3_239
    L5_241.y = 0
    L5_241.z = L4_240.z * L3_239
    L2_238.InterpDelta = L5_241
    L5_241 = GetTime
    L5_241 = L5_241()
    L2_238.StartTime = L5_241
    L5_241 = A1_237.KnockBackDuration
    L2_238.KnockBackDuration = L5_241
  end
  L3_239 = A1_237.TargetVar
  L3_239 = A0_236[L3_239]
  L4_240 = GetTime
  L4_240 = L4_240()
  L5_241 = L2_238.StartTime
  L4_240 = L4_240 - L5_241
  L5_241 = L2_238.KnockBackDuration
  L4_240 = L4_240 / L5_241
  L5_241 = {}
  L5_241.x = L2_238.KnockBackStart.x + L2_238.InterpDelta.x * L4_240
  L5_241.y = L2_238.KnockBackStart.y
  L5_241.z = L2_238.KnockBackStart.z + L2_238.InterpDelta.z * L4_240
  SetPosition(L3_239, L5_241)
end
BBKnockback = L0_0
function L0_0(A0_242, A1_243)
  local L2_244, L3_245
  L2_244 = GetParam
  L3_245 = "Left"
  L2_244 = L2_244(L3_245, A0_242, A1_243)
  L3_245 = GetParam
  L3_245 = L3_245("Right", A0_242, A1_243)
  GetTable(A0_242, A1_243.DestVarTable, true)[A1_243.DestVar] = tostring(L2_244) .. tostring(L3_245)
end
BBAppendString = L0_0
function L0_0(A0_246, A1_247)
  local L2_248
  L2_248 = 0
  if A1_247.Delta ~= nil then
    L2_248 = L2_248 + A1_247.Delta
  end
  if A1_247.DeltaByLevel ~= nil and A0_246.Level ~= nil then
    L2_248 = L2_248 + A1_247.DeltaByLevel[A0_246.Level]
  end
  if A1_247.DeltaVar ~= nil then
    L2_248 = L2_248 + GetTable(A0_246, A1_247.DeltaVarTable, true)[A1_247.DeltaVar]
  end
  if A1_247.TargetVar ~= nil then
    A1_247.Stat(L2_248, A0_246[A1_247.TargetVar])
  else
    A1_247.Stat(L2_248)
  end
end
BBIncStat = L0_0
function L0_0(A0_249, A1_250)
  local L2_251
  L2_251 = 0
  if A1_250.Delta ~= nil then
    L2_251 = L2_251 + A1_250.Delta
  end
  if A1_250.DeltaByLevel ~= nil and A0_249.Level ~= nil then
    L2_251 = L2_251 + A1_250.DeltaByLevel[A0_249.Level]
  end
  if A1_250.DeltaVar ~= nil then
    L2_251 = L2_251 + GetTable(A0_249, A1_250.DeltaVarTable, true)[A1_250.DeltaVar]
  end
  if A1_250.TargetVar ~= nil then
    A1_250.Stat(L2_251, A0_249[A1_250.TargetVar])
  else
    A1_250.Stat(L2_251)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_252, A1_253)
  if A1_253.TargetVar ~= nil then
    GetTable(A0_252, A1_253.DestVarTable, false)[A1_253.DestVar] = A1_253.Stat(A0_252[A1_253.TargetVar])
  else
    GetTable(A0_252, A1_253.DestVarTable, false)[A1_253.DestVar] = A1_253.Stat()
  end
end
BBGetStat = L0_0
function L0_0(A0_254, A1_255)
  if A1_255.TargetVar ~= nil then
    GetTable(A0_254, A1_255.DestVarTable, false)[A1_255.DestVar] = GetLevel(A0_254[A1_255.TargetVar])
  else
    GetTable(A0_254, A1_255.DestVarTable, false)[A1_255.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_256, A1_257)
  if A1_257.TargetVar ~= nil then
    GetTable(A0_256, A1_257.DestVarTable, false)[A1_257.DestVar] = GetUnitSignificance(A0_256[A1_257.TargetVar])
  else
    GetTable(A0_256, A1_257.DestVarTable, false)[A1_257.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_258, A1_259)
  if A1_259.TargetVar ~= nil then
    GetTable(A0_258, A1_259.DestVarTable, false)[A1_259.DestVar] = GetArmor(A0_258[A1_259.TargetVar])
  else
    GetTable(A0_258, A1_259.DestVarTable, false)[A1_259.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_260, A1_261)
  if A1_261.TargetVar ~= nil then
    GetTable(A0_260, A1_261.DestVarTable, false)[A1_261.DestVar] = GetSpellBlock(A0_260[A1_261.TargetVar])
  else
    GetTable(A0_260, A1_261.DestVarTable, false)[A1_261.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_262, A1_263)
  if A1_263.TargetVar ~= nil then
    GetTable(A0_262, A1_263.DestVarTable, false)[A1_263.DestVar] = GetTeamID(A0_262[A1_263.TargetVar])
  else
    GetTable(A0_262, A1_263.DestVarTable, false)[A1_263.DestVar] = GetTeamID()
  end
end
BBGetTeamID = L0_0
function L0_0(A0_264, A1_265)
  local L2_266, L3_267, L4_268
  L2_266 = GetTable
  L3_267 = A0_264
  L4_268 = A1_265.DestVarTable
  L2_266 = L2_266(L3_267, L4_268, false)
  L3_267 = A1_265.TargetVar
  L4_268 = nil
  if L3_267 ~= nil then
    L4_268 = GetTeamID(A0_264[L3_267])
  else
    L4_268 = GetTeamID()
  end
  if L4_268 == TEAM_ORDER then
    L2_266[A1_265.DestVar] = TEAM_CHAOS
  elseif L4_268 == TEAM_CHAOS then
    L2_266[A1_265.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_269, A1_270)
  if A1_270.TargetVar ~= nil then
    GetTable(A0_269, A1_270.DestVarTable, false)[A1_270.DestVar] = GetUnitSkinName(A0_269[A1_270.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_271, A1_272)
  if A1_272.TargetVar ~= nil then
    GetTable(A0_271, A1_272.DestVarTable, false)[A1_272.DestVar] = GetTotalAttackDamage(A0_271[A1_272.TargetVar])
  else
    GetTable(A0_271, A1_272.DestVarTable, false)[A1_272.DestVar] = GetTotalAttackDamage()
  end
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_273, A1_274)
  GetTable(A0_273, A1_274.DestVarTable, true)[A1_274.DestVar] = A1_274.Status(A0_273[A1_274.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_275, A1_276)
  local L2_277
  L2_277 = A1_276.TargetVar
  L2_277 = A0_275[L2_277]
  ClearAttackTarget(L2_277)
end
BBClearAttackTarget = L0_0
function L0_0(A0_278, A1_279)
  GetTable(A0_278, A1_279.DestVarTable, true)[A1_279.DestVar] = A1_279.Info(A0_278[A1_279.TargetVar])
end
BBGetCastInfo = L0_0
function L0_0(A0_280, A1_281, A2_282)
  local L3_283, L4_284, L5_285, L6_286
  L3_283 = GetTable
  L4_284 = A0_280
  L5_285 = A1_281.TrackTimeVarTable
  L6_286 = false
  L3_283 = L3_283(L4_284, L5_285, L6_286)
  L4_284 = GetTime
  L4_284 = L4_284()
  L5_285 = A1_281.ExecuteImmediately
  L6_286 = A1_281.TimeBetweenExecutions
  if A1_281.TickTimeVar ~= nil and GetTable(A0_280, A1_281.TickTimeVarTable, false)[A1_281.TickTimeVar] ~= nil then
    L6_286 = GetTable(A0_280, A1_281.TickTimeVarTable, false)[A1_281.TickTimeVar]
  end
  if L3_283[A1_281.TrackTimeVar] == nil then
    L3_283[A1_281.TrackTimeVar] = L4_284
    if L5_285 == true then
      ExecuteBuildingBlocks(A2_282, A0_280)
    end
  end
  if L4_284 >= L3_283[A1_281.TrackTimeVar] + L6_286 then
    L3_283[A1_281.TrackTimeVar] = L3_283[A1_281.TrackTimeVar] + L6_286
    ExecuteBuildingBlocks(A2_282, A0_280)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_287, A1_288, A2_289)
  GetTable(A0_287, A1_288.TrackTimeVarTable, false)[A1_288.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_290, A1_291)
  local L2_292
  L2_292 = A1_291.SrcValue
  if A1_291.SrcVar ~= nil then
    L2_292 = GetTable(A0_290, A1_291.SrcTable, true)[A1_291.SrcVar]
  end
  A1_291.Status(A0_290[A1_291.TargetVar], L2_292)
end
BBSetStatus = L0_0
function L0_0(A0_293, A1_294)
  local L2_295
  L2_295 = A1_294.ToAlert
  if GetTable(A0_293, A1_294.SrcVarTable, false) ~= nil and A1_294.SrcVar ~= nil then
    L2_295 = L2_295 .. GetTable(A0_293, A1_294.SrcVarTable, false)[A1_294.SrcVar]
  end
  _ALERT(L2_295)
end
BBAlert = L0_0
function L0_0(A0_296, A1_297)
  local L2_298, L3_299, L4_300
  L2_298 = A1_297.ToSay
  L3_299 = GetTable
  L4_300 = A0_296
  L3_299 = L3_299(L4_300, A1_297.SrcVarTable, false)
  if L3_299 ~= nil then
    L4_300 = A1_297.SrcVar
    if L4_300 ~= nil then
      L4_300 = L2_298
      L2_298 = L4_300 .. tostring(L3_299[A1_297.SrcVar])
    end
  end
  L4_300 = nil
  if A1_297.OwnerVar ~= nil then
    L4_300 = A0_296[A1_297.OwnerVar]
  else
    L4_300 = A0_296.Owner
  end
  if A1_297.TextType == nil then
    A1_297.TextType = 0
  end
  Say(L4_300, L2_298, A1_297.TextType)
end
BBSay = L0_0
function L0_0(A0_301, A1_302)
  local L2_303, L3_304, L4_305
  L2_303 = A1_302.ToSay
  L3_304 = GetTable
  L4_305 = A0_301
  L3_304 = L3_304(L4_305, A1_302.SrcVarTable, false)
  if L3_304 ~= nil then
    L4_305 = A1_302.SrcVar
    if L4_305 ~= nil then
      L4_305 = L2_303
      L2_303 = L4_305 .. tostring(L3_304[A1_302.SrcVar])
    end
  end
  L4_305 = nil
  if A1_302.OwnerVar ~= nil then
    L4_305 = A0_301[A1_302.OwnerVar]
  else
    L4_305 = A0_301.Owner
  end
  if A1_302.TextType == nil then
    A1_302.TextType = 0
  end
  Say(L4_305, L2_303, A1_302.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_306, A1_307)
  GetTable(A0_306, A1_307.DestVarTable, true)[A1_307.DestVar] = BBLuaGetGold(A0_306, A1_307)
end
BBGetGold = L0_0
function L0_0(A0_308, A1_309)
  SpellBuffAdd(A0_308[A1_309.OwnerVar], A0_308[A1_309.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_308.NextBuffVars)
  BBTeleportToPositionHelper(A0_308, A1_309)
end
BBTeleportToPosition = L0_0
function L0_0(A0_310, A1_311)
  if A1_311.XVar ~= nil and GetTable(A0_310, A1_311.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_310, A1_311.XVarTable, true)[A1_311.XVar]
  else
    Xloc = A1_311.X
  end
  if A1_311.YVar ~= nil and GetTable(A0_310, A1_311.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_310, A1_311.YVarTable, true)[A1_311.YVar]
  else
    Yloc = A1_311.Y
  end
  if A1_311.ZVar ~= nil and GetTable(A0_310, A1_311.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_310, A1_311.ZVarTable, true)[A1_311.ZVar]
  else
    Zloc = A1_311.Z
  end
  A1_311.OwnerVar, A0_310.position = A1_311.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_311.CastPositionName = "position"
  BBTeleportToPosition(A0_310, A1_311)
end
BBTeleportToPoint = L0_0
function L0_0(A0_312, A1_313)
  DefUpdateAura(GetTable(A0_312, A1_313.CenterTable, false)[A1_313.CenterVar], A1_313.Range, A1_313.UnitScan, A1_313.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_314, A1_315)
  ReincarnateNonDeadHero(GetTable(A0_314, A1_315.TargetTable, false)[A1_315.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_316, A1_317)
  GetTable(A0_316, A1_317.DestVarTable, true)[A1_317.DestVar] = A1_317.Function(A0_316[A1_317.OwnerVar], A1_317.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_318, A1_319)
  local L2_320, L3_321, L4_322, L5_323
  L2_320 = A1_319.WhomToOrderVar
  L2_320 = A0_318[L2_320]
  L3_321 = A1_319.TargetOfOrderVar
  L3_321 = A0_318[L3_321]
  L4_322 = GetTable
  L5_323 = A0_318
  L4_322 = L4_322(L5_323, A1_319.SrcVarTable, false)
  L5_323 = nil
  if A1_319.SrcVar ~= nil and L4_322 ~= nil then
    L5_323 = L4_322[A1_319.SrcVar]
  else
    L5_323 = GetPosition(L3_321)
  end
  if L3_321 == nil then
    L3_321 = L2_320
  end
  IssueOrder(L2_320, A1_319.Order, L5_323, L3_321)
end
BBIssueOrder = L0_0
function L0_0(A0_324, A1_325)
  SetSpellCastRange(A1_325.NewRange)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_326, A1_327)
  GetTable(A0_326, A1_327.DestVarTable, true)[A1_327.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_328, A1_329)
  local L2_330, L3_331
  L2_330 = A1_329.ObjectVar1
  L2_330 = A0_328[L2_330]
  L3_331 = A1_329.ObjectVar2
  L3_331 = A0_328[L3_331]
  GetTable(A0_328, A1_329.DestVarTable, true)[A1_329.DestVar] = DistanceBetweenObjectBounds(L2_330, L3_331)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_332, A1_333)
  local L2_334, L3_335, L4_336
  L2_334 = A1_333.ObjectVar
  L2_334 = A0_332[L2_334]
  L3_335 = GetTable
  L4_336 = A0_332
  L3_335 = L3_335(L4_336, A1_333.PointVarTable, true)
  L4_336 = A1_333.PointVar
  L4_336 = L3_335[L4_336]
  GetTable(A0_332, A1_333.DestVarTable, true)[A1_333.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_334, L4_336)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_337, A1_338)
  local L2_339, L3_340, L4_341, L5_342
  L2_339 = GetTable
  L3_340 = A0_337
  L4_341 = A1_338.Point1VarTable
  L5_342 = true
  L2_339 = L2_339(L3_340, L4_341, L5_342)
  L3_340 = A1_338.Point1Var
  L3_340 = L2_339[L3_340]
  L4_341 = GetTable
  L5_342 = A0_337
  L4_341 = L4_341(L5_342, A1_338.Point2VarTable, true)
  L5_342 = A1_338.Point2Var
  L5_342 = L4_341[L5_342]
  GetTable(A0_337, A1_338.DestVarTable, true)[A1_338.DestVar] = DistanceBetweenPoints(L3_340, L5_342)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_343, A1_344, A2_345)
  local L3_346, L4_347, L5_348, L6_349, L7_350, L8_351
  L5_348 = 0
  L6_349 = nil
  L7_350 = A1_344.ObjectDistanceType
  L8_351 = A1_344.ObjectVar1
  L3_346 = A0_343[L8_351]
  L8_351 = A1_344.ObjectVar2
  L4_347 = A0_343[L8_351]
  if nil == L4_347 then
    L8_351 = A1_344.Point2Var
    if nil ~= L8_351 then
      L8_351 = GetTable
      L8_351 = L8_351(A0_343, A1_344.Point2VarTable, true)
      L4_347 = L8_351[A1_344.Point2Var]
      L5_348 = L5_348 + 1
    end
  end
  if nil == L3_346 then
    L8_351 = A1_344.Point1Var
    if nil ~= L8_351 then
      L8_351 = GetTable
      L8_351 = L8_351(A0_343, A1_344.Point1VarTable, true)
      L3_346 = L8_351[A1_344.Point1Var]
      L5_348 = L5_348 + 1
      if 1 == L5_348 then
        L3_346, L4_347 = L4_347, L3_346
      end
    end
  end
  if nil ~= L7_350 then
    if 0 == L5_348 then
      L8_351 = OBJECT_CENTER
      if L8_351 == L7_350 then
        L6_349 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_351 = OBJECT_BOUNDARY
        if L8_351 == L7_350 then
          L6_349 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_351 = A1_344.OwnerVar
          L8_351 = A0_343[L8_351]
          Say(L8_351, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_348 then
      L8_351 = OBJECT_CENTER
      if L8_351 == L7_350 then
        L6_349 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_351 = OBJECT_BOUNDARY
        if L8_351 == L7_350 then
          L6_349 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_351 = A1_344.OwnerVar
          L8_351 = A0_343[L8_351]
          Say(L8_351, "invalid object distance type", 0)
        end
      end
    else
      L6_349 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_351 = A1_344.Distance
  if A1_344.DistanceVar ~= nil and GetTable(A0_343, A1_344.DistanceVarTable, true) ~= nil then
    L8_351 = L8_351 + GetTable(A0_343, A1_344.DistanceVarTable, true)[A1_344.DistanceVar]
  end
  if L3_346 ~= nil and L4_347 ~= nil and L6_349 ~= nil and L8_351 ~= nil then
    if not L6_349(L3_346, L4_347, L8_351) then
      ExecuteBuildingBlocks(A2_345, A0_343)
      A0_343.LastIfSucceeded = true
    else
      A0_343.LastIfSucceeded = false
    end
  else
    A0_343.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_352, A1_353)
  local L2_354, L3_355
  L2_354 = A1_353.TargetVar
  L2_354 = A0_352[L2_354]
  L3_355 = A1_353.CasterVar
  L3_355 = A0_352[L3_355]
  GetTable(A0_352, A1_353.DestVarTable, true)[A1_353.DestVar] = SpellBuffCount(L2_354, A1_353.BuffName, L3_355)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_356, A1_357)
  local L2_358
  L2_358 = A1_357.TargetVar
  L2_358 = A0_356[L2_358]
  GetTable(A0_356, A1_357.DestVarTable, true)[A1_357.DestVar] = SpellBuffCount(L2_358, A1_357.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_359, A1_360)
  local L2_361, L3_362
  L2_361 = GetTable
  L3_362 = A0_359
  L2_361 = L2_361(L3_362, A1_360.ScaleVarTable, false)
  L3_362 = nil
  if A1_360.OwnerVar ~= nil then
    L3_362 = A0_359[A1_360.OwnerVar]
  else
    L3_362 = A0_359.Owner
  end
  if A1_360.ScaleVar ~= nil and A1_360.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_361[A1_360.ScaleVar], L3_362)
  else
    SetScaleSkinCoef(A1_360.Scale, L3_362)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_363, A1_364)
  SpellBuffAdd(A0_363[A1_364.TargetVar], A0_363[A1_364.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_363.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_365, A1_366, A2_367)
  local L3_368, L4_369
  L3_368 = A1_366.TargetVar
  L3_368 = A0_365[L3_368]
  L4_369 = A1_366.NumStacks
  if A1_366.NumStacks == 0 then
    L4_369 = SpellBuffCount(L3_368, A1_366.BuffName, caster)
  end
  while L4_369 > 0 do
    SpellBuffRemove(L3_368, A1_366.BuffName, A0_365[A1_366.AttackerVar])
    L4_369 = L4_369 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_370, A1_371, A2_372)
  if A0_370.EmoteId == A1_371.EmoteId then
    ExecuteBuildingBlocks(A2_372, A0_370)
    A0_370.LastIfSucceeded = true
  else
    A0_370.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_373, A1_374, A2_375)
  if A0_373.EmoteId ~= A1_374.EmoteId then
    ExecuteBuildingBlocks(A2_375, A0_373)
    A0_373.LastIfSucceeded = true
  else
    A0_373.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
