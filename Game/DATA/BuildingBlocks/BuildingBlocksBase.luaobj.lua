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
function L0_0(A0_20)
  A0_20 = tostring(A0_20)
  BBPrintToChat({}, {ToSay = A0_20})
end
ClientPrint = L0_0
function L0_0(A0_21, A1_22)
  local L2_23, L3_24
  L2_23 = GetTable
  L3_24 = A0_21
  L2_23 = L2_23(L3_24, A1_22.TableName, true)
  L3_24 = A1_22.TableName
  L3_24 = L3_24 or "PassThroughParams"
  ClientPrint(L3_24)
  PrintTableToChat(L2_23)
end
BBPrintTableToChat = L0_0
function L0_0(A0_25, A1_26)
  local L2_27, L3_28, L4_29, L5_30, L6_31, L7_32, L8_33, L9_34, L10_35, L11_36, L12_37, L13_38
  A1_26 = A1_26 or 0
  if A1_26 > 10 then
    return
  end
  L2_27 = nil
  L3_28 = "|"
  for L7_32 = 1, A1_26 do
    L9_34 = "----"
    L3_28 = L8_33 .. L9_34
  end
  L6_31(L7_32)
  for L9_34, L10_35 in L6_31(L7_32) do
    L11_36 = nil
    L12_37 = tostring
    L13_38 = L9_34
    L12_37 = L12_37(L13_38)
    if L12_37 == "PassThroughParams" then
      L11_36 = "{{ PassThroughParams }}"
    else
      L13_38 = type
      L13_38 = L13_38(L10_35)
      if L13_38 == "table" then
        L11_36 = "Table"
      else
        L13_38 = tostring
        L13_38 = L13_38(L10_35)
        L11_36 = L13_38
      end
    end
    L13_38 = L3_28
    L13_38 = L13_38 .. L12_37 .. ": " .. L11_36
    ClientPrint(L13_38)
    if type(L10_35) == "table" then
      PrintTableToChat(L10_35, A1_26 + 1)
    end
  end
  L6_31(L7_32)
end
PrintTableToChat = L0_0
function L0_0(A0_39, A1_40, A2_41)
  local L3_42
  if A1_40 ~= nil then
    L3_42 = A0_39[A1_40]
    if L3_42 == nil and A2_41 then
      A0_39[A1_40] = {}
      return A0_39[A1_40]
    end
  end
  if L3_42 == nil then
    L3_42 = A0_39
  end
  return L3_42
end
GetTable = L0_0
function L0_0(A0_43, A1_44, A2_45)
  if A2_45[A0_43 .. "Var"] ~= nil and GetTable(A1_44, A2_45[A0_43 .. "VarTable"], false) ~= nil then
    return GetTable(A1_44, A2_45[A0_43 .. "VarTable"], false)[A2_45[A0_43 .. "Var"]]
  else
    return A2_45[A0_43]
  end
end
GetParam = L0_0
function L0_0(A0_46, A1_47)
  GetTable(A0_46, A1_47.DestVarTable, true)[A1_47.DestVar] = {}
end
BBCreateCustomTable = L0_0
function L0_0(A0_48, A1_49)
  GetTable(A0_48, A1_49.TableNameTable, false)[A1_49.TableNameVar] = nil
end
BBDestroyTable = L0_0
function L0_0(A0_50, A1_51)
  if type(GetTable(A0_50, A1_51.DestTableVarTable, false)[A1_51.DestTableVar]) == "nil" then
    GetTable(A0_50, A1_51.DestTableVarTable, false)[A1_51.DestTableVar] = {}
  end
  if type(GetTable(A0_50, A1_51.DestTableVarTable, false)[A1_51.DestTableVar]) == "table" then
    GetTable(A0_50, A1_51.DestTableVarTable, false)[A1_51.DestTableVar][GetParam("Key", A0_50, A1_51)] = GetParam("Value", A0_50, A1_51)
  end
end
BBSetKeyValueInCustomTable = L0_0
function L0_0(A0_52, A1_53)
  if type(GetTable(A0_52, A1_53.SrcTableVarTable, false)[A1_53.SrcTableVar]) == "table" then
    GetTable(A0_52, A1_53.DestVarTable, true)[A1_53.DestVar] = GetTable(A0_52, A1_53.SrcTableVarTable, false)[A1_53.SrcTableVar][GetParam("SrcKey", A0_52, A1_53)]
  end
end
BBGetKeyValueInCustomTable = L0_0
function L0_0(A0_54, A1_55, A2_56)
  local L3_57, L4_58, L5_59, L6_60, L7_61, L8_62
  L3_57 = GetTable
  L3_57 = L3_57(L4_58, L5_59, L6_60)
  if L4_58 == "table" then
    if L4_58 then
      for L8_62, _FORV_9_ in L5_59(L6_60) do
        table.insert(L4_58, L8_62)
      end
      L5_59(L6_60)
      for L8_62, _FORV_9_ in L5_59(L6_60) do
        GetTable(A0_54, A1_55.DestKeyVarTable, true)[A1_55.DestKeyVar] = _FORV_9_
        GetTable(A0_54, A1_55.DestValueVarTable, true)[A1_55.DestValueVar] = L3_57[A1_55.TableVar][_FORV_9_]
        ExecuteBuildingBlocks(A2_56, A0_54)
      end
    else
      for L7_61, L8_62 in L4_58(L5_59) do
        GetTable(A0_54, A1_55.DestKeyVarTable, true)[A1_55.DestKeyVar] = L7_61
        GetTable(A0_54, A1_55.DestValueVarTable, true)[A1_55.DestValueVar] = L8_62
        ExecuteBuildingBlocks(A2_56, A0_54)
      end
    end
  end
end
BBForEachInCustomTable = L0_0
function L0_0(A0_63, A1_64)
  local L2_65, L3_66
  L2_65 = GetTable
  L3_66 = A0_63
  L2_65 = L2_65(L3_66, A1_64.DestVarTable, true)
  L3_66 = nil
  if A1_64.SpellSlotVar ~= nil and GetTable(A0_63, A1_64.SpellSlotVarTable, false) ~= nil then
    L3_66 = GetTable(A0_63, A1_64.SpellSlotVarTable, false)[A1_64.SpellSlotVar]
  else
    L3_66 = A1_64.SpellSlotValue
  end
  L2_65[A1_64.DestVar] = A1_64.Function(A0_63[A1_64.OwnerVar], L3_66, A1_64.SpellbookType, A1_64.SlotType)
end
BBGetSlotSpellInfo = L0_0
function L0_0(A0_67, A1_68)
  local L2_69, L3_70, L4_71
  L2_69 = GetTable
  L3_70 = A0_67
  L4_71 = A1_68.SrcVarTable
  L2_69 = L2_69(L3_70, L4_71, false)
  L3_70 = nil
  L4_71 = A1_68.SrcVar
  if L4_71 ~= nil and L2_69 ~= nil then
    L4_71 = A1_68.SrcVar
    L3_70 = L2_69[L4_71]
  else
    L3_70 = A1_68.SrcValue
  end
  L4_71 = nil
  if A1_68.SpellSlotVar ~= nil and GetTable(A0_67, A1_68.SpellSlotVarTable, false) ~= nil then
    L4_71 = GetTable(A0_67, A1_68.SpellSlotVarTable, false)[A1_68.SpellSlotVar]
  else
    L4_71 = A1_68.SpellSlotValue
  end
  SetSlotSpellCooldownTime(A0_67[A1_68.OwnerVar], L4_71, A1_68.SpellbookType, A1_68.SlotType, L3_70)
end
BBSetSlotSpellCooldownTime = L0_0
function L0_0(A0_72, A1_73)
  if A0_72.Level ~= nil and A1_73.SrcValueByLevel ~= nil then
    A0_72.ReturnValue = A1_73.SrcValueByLevel[A0_72.Level]
  elseif A1_73.SrcVar ~= nil and GetTable(A0_72, A1_73.SrcVarTable, false) ~= nil then
    A0_72.ReturnValue = GetTable(A0_72, A1_73.SrcVarTable, false)[A1_73.SrcVar]
  else
    A0_72.ReturnValue = A1_73.SrcValue
  end
end
BBSetReturnValue = L0_0
function L0_0(A0_74, A1_75)
  if type(A0_74) == "string" and type(A1_75) == "string" then
    A0_74 = string.lower(A0_74)
    A1_75 = string.lower(A1_75)
  end
  return A0_74 == A1_75
end
CO_EQUAL = L0_0
function L0_0(A0_76, A1_77)
  if type(A0_76) == "string" and type(A1_77) == "string" then
    A0_76 = string.lower(A0_76)
    A1_77 = string.lower(A1_77)
  end
  return A0_76 ~= A1_77
end
CO_NOT_EQUAL = L0_0
function L0_0(A0_78, A1_79)
  local L2_80
  L2_80 = A0_78 < A1_79
  return L2_80
end
CO_LESS_THAN = L0_0
function L0_0(A0_81, A1_82)
  local L2_83
  L2_83 = A1_82 < A0_81
  return L2_83
end
CO_GREATER_THAN = L0_0
function L0_0(A0_84, A1_85)
  local L2_86
  L2_86 = A0_84 <= A1_85
  return L2_86
end
CO_LESS_THAN_OR_EQUAL = L0_0
function L0_0(A0_87, A1_88)
  local L2_89
  L2_89 = A1_88 <= A0_87
  return L2_89
end
CO_GREATER_THAN_OR_EQUAL = L0_0
function L0_0(A0_90, A1_91)
  return GetTeamID(A0_90) == GetTeamID(A1_91)
end
CO_SAME_TEAM = L0_0
function L0_0(A0_92, A1_93)
  return GetTeamID(A0_92) ~= GetTeamID(A1_93)
end
CO_DIFFERENT_TEAM = L0_0
function L0_0(A0_94, A1_95)
  return GetSourceType() == A1_95 or GetSourceType() == A0_94
end
CO_DAMAGE_SOURCETYPE_IS = L0_0
function L0_0(A0_96, A1_97)
  return GetSourceType() ~= A1_97 and GetSourceType() ~= A0_96
end
CO_DAMAGE_SOURCETYPE_IS_NOT = L0_0
function L0_0(A0_98)
  return IsObjectAI(A0_98)
end
CO_IS_TYPE_AI = L0_0
function L0_0(A0_99)
  return IsObjectAI(A0_99) ~= true
end
CO_IS_NOT_AI = L0_0
function L0_0(A0_100)
  return IsObjectHero(A0_100)
end
CO_IS_TYPE_HERO = L0_0
function L0_0(A0_101)
  return IsObjectHero(A0_101) ~= true
end
CO_IS_NOT_HERO = L0_0
function L0_0(A0_102)
  return IsClone(A0_102)
end
CO_IS_CLONE = L0_0
function L0_0(A0_103)
  return IsClone(A0_103) ~= true
end
CO_IS_NOT_CLONE = L0_0
function L0_0(A0_104)
  return IsMelee(A0_104)
end
CO_IS_MELEE = L0_0
function L0_0(A0_105)
  return IsMelee(A0_105) ~= true
end
CO_IS_RANGED = L0_0
function L0_0(A0_106)
  return A0_106 > math.random()
end
CO_RANDOM_CHANCE_LESS_THAN = L0_0
function L0_0(A0_107)
  return IsTurretAI(A0_107)
end
CO_IS_TYPE_TURRET = L0_0
function L0_0(A0_108)
  return IsTurretAI(A0_108) ~= true
end
CO_IS_NOT_TURRET = L0_0
function L0_0(A0_109)
  return IsDead(A0_109)
end
CO_IS_DEAD = L0_0
function L0_0(A0_110)
  return IsDead(A0_110) ~= true
end
CO_IS_NOT_DEAD = L0_0
function L0_0(A0_111)
  return IsDeadOrZombie(A0_111)
end
CO_IS_DEAD_OR_ZOMBIE = L0_0
function L0_0(A0_112, A1_113)
  return BBIsTargetInFrontOfMe(A0_112, A1_113)
end
CO_IS_TARGET_IN_FRONT_OF_ME = L0_0
function L0_0(A0_114, A1_115)
  return BBIsTargetBehindMe(A0_114, A1_115)
end
CO_IS_TARGET_BEHIND_ME = L0_0
function L0_0(A0_116)
  return IsWard(A0_116)
end
CO_IS_WARD = L0_0
function L0_0(A0_117)
  return IsStructure(A0_117)
end
CO_IS_STRUCTURE = L0_0
function L0_0(A0_118)
  return IsStructure(A0_118) ~= true
end
CO_IS_NOT_STRUCTURE = L0_0
function L0_0(A0_119, A1_120, A2_121)
  local L3_122, L4_123, L5_124, L6_125
  L3_122 = GetTable
  L4_123 = A0_119
  L5_124 = A1_120.Src1VarTable
  L6_125 = false
  L3_122 = L3_122(L4_123, L5_124, L6_125)
  L4_123 = GetTable
  L5_124 = A0_119
  L6_125 = A1_120.Src2VarTable
  L4_123 = L4_123(L5_124, L6_125, false)
  L5_124 = false
  L6_125 = nil
  if L3_122 ~= nil and A1_120.Src1Var ~= nil then
    L6_125 = L3_122[A1_120.Src1Var]
  else
    L6_125 = A1_120.Value1
  end
  if L4_123 ~= nil and A1_120.Src2Var ~= nil then
    L5_124 = A1_120.CompareOp(L6_125, L4_123[A1_120.Src2Var])
  else
    L5_124 = A1_120.CompareOp(L6_125, A1_120.Value2)
  end
  if L5_124 then
    ExecuteBuildingBlocks(A2_121, A0_119)
    A0_119.LastIfSucceeded = true
  else
    A0_119.LastIfSucceeded = false
  end
end
BBIf = L0_0
function L0_0(A0_126, A1_127, A2_128)
  if A0_126.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_128, A0_126)
    A0_126.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_129, A1_130, A2_131)
  local L3_132, L4_133, L5_134, L6_135
  L3_132 = A0_129.LastIfSucceeded
  if L3_132 == false then
    L3_132 = GetTable
    L4_133 = A0_129
    L5_134 = A1_130.Src1VarTable
    L6_135 = false
    L3_132 = L3_132(L4_133, L5_134, L6_135)
    L4_133 = GetTable
    L5_134 = A0_129
    L6_135 = A1_130.Src2VarTable
    L4_133 = L4_133(L5_134, L6_135, false)
    L5_134 = false
    L6_135 = nil
    if L3_132 ~= nil and A1_130.Src1Var ~= nil then
      L6_135 = L3_132[A1_130.Src1Var]
    else
      L6_135 = A1_130.Value1
    end
    if L4_133 ~= nil and A1_130.Src2Var ~= nil then
      L5_134 = A1_130.CompareOp(L6_135, L4_133[A1_130.Src2Var])
    else
      L5_134 = A1_130.CompareOp(L6_135, A1_130.Value2)
    end
    if L5_134 then
      ExecuteBuildingBlocks(A2_131, A0_129)
      A0_129.LastIfSucceeded = true
    else
      A0_129.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_136, A1_137, A2_138)
  local L3_139
  if A1_137.TargetVar ~= nil then
    L3_139 = A0_136[A1_137.TargetVar]
  else
    L3_139 = A0_136.Target
  end
  if HasBuffOfType(L3_139, A1_137.BuffType) then
    ExecuteBuildingBlocks(A2_138, A0_136)
    A0_136.LastIfSucceeded = true
  else
    A0_136.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_140, A1_141, A2_142)
  local L3_143, L4_144
  if A1_141.OwnerVar ~= nil then
    L3_143 = A0_140[A1_141.OwnerVar]
  else
    L3_143 = A0_140.Owner
  end
  if A1_141.AttackerVar ~= nil then
    L4_144 = A0_140[A1_141.AttackerVar]
  else
    L4_144 = A0_140.Attacker
  end
  if SpellBuffCount(L3_143, A1_141.BuffName, L4_144) > 0 then
    ExecuteBuildingBlocks(A2_142, A0_140)
    A0_140.LastIfSucceeded = true
  else
    A0_140.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_145, A1_146, A2_147)
  if BBIsMissileAutoAttack(A0_145, A1_146) then
    ExecuteBuildingBlocks(A2_147, A0_145)
    A0_145.LastIfSucceeded = true
  else
    A0_145.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_148, A1_149)
  A0_148.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_150, A1_151, A2_152)
  local L3_153, L4_154
  if A1_151.OwnerVar ~= nil then
    L3_153 = A0_150[A1_151.OwnerVar]
  else
    L3_153 = A0_150.Owner
  end
  if A1_151.CasterVar ~= nil then
    L4_154 = A0_150[A1_151.CasterVar]
  else
    L4_154 = A0_150.Caster
  end
  if SpellBuffCount(L3_153, A1_151.BuffName, L4_154) <= 0 then
    ExecuteBuildingBlocks(A2_152, A0_150)
    A0_150.LastIfSucceeded = true
  else
    A0_150.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_155, A1_156, A2_157)
  local L3_158, L4_159
  if A1_156.OwnerVar ~= nil then
    L3_158 = A0_155[A1_156.OwnerVar]
  else
    L3_158 = A0_155.Owner
  end
  if HasPARType(L3_158, A1_156.PARType) then
    ExecuteBuildingBlocks(A2_157, A0_155)
    A0_155.LastIfSucceeded = true
  else
    A0_155.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_160, A1_161, A2_162)
  local L3_163, L4_164
  if A1_161.OwnerVar ~= nil then
    L3_163 = A0_160[A1_161.OwnerVar]
  else
    L3_163 = A0_160.Owner
  end
  if not HasPARType(L3_163, A1_161.PARType) then
    ExecuteBuildingBlocks(A2_162, A0_160)
    A0_160.LastIfSucceeded = true
  else
    A0_160.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_165, A1_166, A2_167)
  local L3_168, L4_169, L5_170, L6_171, L7_172
  L3_168 = GetTable
  L4_169 = A0_165
  L5_170 = A1_166.Src1VarTable
  L6_171 = false
  L3_168 = L3_168(L4_169, L5_170, L6_171)
  L4_169 = GetTable
  L5_170 = A0_165
  L6_171 = A1_166.Src2VarTable
  L7_172 = false
  L4_169 = L4_169(L5_170, L6_171, L7_172)
  L5_170 = true
  while L5_170 do
    L6_171 = false
    L7_172 = nil
    if L3_168 ~= nil and A1_166.Src1Var ~= nil then
      L7_172 = L3_168[A1_166.Src1Var]
    else
      L7_172 = A1_166.Value1
    end
    if L4_169 ~= nil and A1_166.Src2Var ~= nil then
      L6_171 = A1_166.CompareOp(L7_172, L4_169[A1_166.Src2Var])
    else
      L6_171 = A1_166.CompareOp(L7_172, A1_166.Value2)
    end
    if L6_171 then
      ExecuteBuildingBlocks(A2_167, A0_165)
    else
      L5_170 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_173, A1_174)
  return A0_173 * A1_174
end
MO_MULTIPLY = L0_0
function L0_0(A0_175, A1_176)
  return A0_175 + A1_176
end
MO_ADD = L0_0
function L0_0(A0_177, A1_178)
  return A0_177 - A1_178
end
MO_SUBTRACT = L0_0
function L0_0(A0_179, A1_180)
  return A0_179 / A1_180
end
MO_DIVIDE = L0_0
function L0_0(A0_181, A1_182)
  if A0_181 < A1_182 then
    return A0_181
  else
    return A1_182
  end
end
MO_MIN = L0_0
function L0_0(A0_183, A1_184)
  if A1_184 < A0_183 then
    return A0_183
  else
    return A1_184
  end
end
MO_MAX = L0_0
function L0_0(A0_185, A1_186)
  return A0_185 % A1_186
end
MO_MODULO = L0_0
function L0_0(A0_187)
  return math.floor(A0_187 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_188)
  return math.ceil(A0_188)
end
MO_ROUNDUP = L0_0
function L0_0(A0_189)
  return math.floor(A0_189)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_190)
  return math.sin(math.rad(A0_190))
end
MO_SIN = L0_0
function L0_0(A0_191)
  return math.cos(math.rad(A0_191))
end
MO_COSINE = L0_0
function L0_0(A0_192)
  return math.tan(math.rad(A0_192))
end
MO_TANGENT = L0_0
function L0_0(A0_193)
  return math.deg(math.asin(A0_193))
end
MO_ASIN = L0_0
function L0_0(A0_194)
  return math.deg(math.acos(A0_194))
end
MO_ACOS = L0_0
function L0_0(A0_195)
  return math.deg(math.atan(A0_195))
end
MO_ATAN = L0_0
function L0_0(A0_196, A1_197)
  return math.pow(A0_196, A1_197)
end
MO_POW = L0_0
function L0_0(A0_198)
  return math.sqrt(A0_198)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_199, A1_200)
  local L2_201
  L2_201 = A0_199 and A1_200
  return L2_201
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_202, A1_203)
  local L2_204
  L2_204 = A0_202 or A1_203
  return L2_204
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_205)
  local L1_206
  L1_206 = not A0_205
  return L1_206
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_207)
  return math.abs(A0_207)
end
MO_ABS = L0_0
function L0_0(A0_208, A1_209)
  return math.random(A0_208, A1_209)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_210, A1_211)
  local L2_212, L3_213
  L2_212 = GetMathNumber
  L3_213 = A0_210
  L2_212 = L2_212(L3_213, A1_211.Src1VarTable, A1_211.Src1Var, A1_211.Src1Value)
  L3_213 = GetMathNumber
  L3_213 = L3_213(A0_210, A1_211.Src2VarTable, A1_211.Src2Var, A1_211.Src2Value)
  GetTable(A0_210, A1_211.DestVarTable)[A1_211.DestVar] = A1_211.MathOp(L2_212, L3_213)
end
BBMath = L0_0
function L0_0(A0_214, A1_215, A2_216, A3_217)
  if A2_216 ~= nil and GetTable(A0_214, A1_215)[A2_216] ~= nil then
    return GetTable(A0_214, A1_215)[A2_216]
  end
  return A3_217
end
GetMathNumber = L0_0
function L0_0(A0_218, A1_219)
  if type(A1_219) == "number" then
    return A1_219
  elseif type(A1_219) == "function" then
    return A1_219(A0_218)
  elseif type(A1_219) == "string" then
    return A0_218[A1_219]
  end
end
GetNumber = L0_0
function L0_0(A0_220, A1_221)
  return VectorAdd(A0_220, A1_221)
end
VEC_ADD = L0_0
function L0_0(A0_222, A1_223)
  return VectorSubtract(A0_222, A1_223)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_224, A1_225)
  return VectorScalarMultiply(A0_224, A1_225)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_226, A1_227)
  return VectorScalarDivide(A0_226, A1_227)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_228, A1_229)
  return VectorRotateY(A0_228, A1_229)
end
VEC_ROTATE = L0_0
function L0_0(A0_230, A1_231)
  BBMath(A0_230, A1_231)
end
BBVectorMath = L0_0
function L0_0(A0_232, A1_233)
  local L2_234, L3_235, L4_236, L5_237
  L2_234 = A0_232.InstanceVars
  L3_235 = L2_234.InterpDelta
  if L3_235 == nil then
    L3_235 = A1_233.Amount
    L4_236 = A1_233.AmountVar
    if L4_236 ~= nil then
      L4_236 = GetTable
      L5_237 = A0_232
      L4_236 = L4_236(L5_237, A1_233.AmountVarTable)
      L5_237 = A1_233.AmountVar
      L3_235 = L4_236[L5_237]
    end
    L4_236 = GetPosition
    L5_237 = A1_233.TargetVar
    L5_237 = A0_232[L5_237]
    L4_236 = L4_236(L5_237)
    L2_234.KnockBackStart = L4_236
    L4_236 = GetNormalizedPositionDelta
    L5_237 = A1_233.TargetVar
    L5_237 = A0_232[L5_237]
    L4_236 = L4_236(L5_237, A0_232[A1_233.AttackerVar], true)
    L5_237 = {}
    L5_237.x = L4_236.x * L3_235
    L5_237.y = 0
    L5_237.z = L4_236.z * L3_235
    L2_234.InterpDelta = L5_237
    L5_237 = GetTime
    L5_237 = L5_237()
    L2_234.StartTime = L5_237
    L5_237 = A1_233.KnockBackDuration
    L2_234.KnockBackDuration = L5_237
  end
  L3_235 = A1_233.TargetVar
  L3_235 = A0_232[L3_235]
  L4_236 = GetTime
  L4_236 = L4_236()
  L5_237 = L2_234.StartTime
  L4_236 = L4_236 - L5_237
  L5_237 = L2_234.KnockBackDuration
  L4_236 = L4_236 / L5_237
  L5_237 = {}
  L5_237.x = L2_234.KnockBackStart.x + L2_234.InterpDelta.x * L4_236
  L5_237.y = L2_234.KnockBackStart.y
  L5_237.z = L2_234.KnockBackStart.z + L2_234.InterpDelta.z * L4_236
  SetPosition(L3_235, L5_237)
end
BBKnockback = L0_0
function L0_0(A0_238, A1_239)
  local L2_240, L3_241
  L2_240 = GetParam
  L3_241 = "Left"
  L2_240 = L2_240(L3_241, A0_238, A1_239)
  L3_241 = GetParam
  L3_241 = L3_241("Right", A0_238, A1_239)
  GetTable(A0_238, A1_239.DestVarTable, true)[A1_239.DestVar] = tostring(L2_240) .. tostring(L3_241)
end
BBAppendString = L0_0
function L0_0(A0_242, A1_243)
  local L2_244
  L2_244 = 0
  if A1_243.Delta ~= nil then
    L2_244 = L2_244 + A1_243.Delta
  end
  if A1_243.DeltaByLevel ~= nil and A0_242.Level ~= nil then
    L2_244 = L2_244 + A1_243.DeltaByLevel[A0_242.Level]
  end
  if A1_243.DeltaVar ~= nil then
    L2_244 = L2_244 + GetTable(A0_242, A1_243.DeltaVarTable, true)[A1_243.DeltaVar]
  end
  if A1_243.TargetVar ~= nil then
    A1_243.Stat(L2_244, A0_242[A1_243.TargetVar])
  else
    A1_243.Stat(L2_244)
  end
end
BBIncStat = L0_0
function L0_0(A0_245, A1_246)
  local L2_247
  L2_247 = 0
  if A1_246.Delta ~= nil then
    L2_247 = L2_247 + A1_246.Delta
  end
  if A1_246.DeltaByLevel ~= nil and A0_245.Level ~= nil then
    L2_247 = L2_247 + A1_246.DeltaByLevel[A0_245.Level]
  end
  if A1_246.DeltaVar ~= nil then
    L2_247 = L2_247 + GetTable(A0_245, A1_246.DeltaVarTable, true)[A1_246.DeltaVar]
  end
  if A1_246.TargetVar ~= nil then
    A1_246.Stat(L2_247, A0_245[A1_246.TargetVar])
  else
    A1_246.Stat(L2_247)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_248, A1_249)
  if A1_249.TargetVar ~= nil then
    GetTable(A0_248, A1_249.DestVarTable, false)[A1_249.DestVar] = A1_249.Stat(A0_248[A1_249.TargetVar])
  else
    GetTable(A0_248, A1_249.DestVarTable, false)[A1_249.DestVar] = A1_249.Stat()
  end
end
BBGetStat = L0_0
function L0_0(A0_250, A1_251)
  if A1_251.TargetVar ~= nil then
    GetTable(A0_250, A1_251.DestVarTable, false)[A1_251.DestVar] = GetLevel(A0_250[A1_251.TargetVar])
  else
    GetTable(A0_250, A1_251.DestVarTable, false)[A1_251.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_252, A1_253)
  if A1_253.TargetVar ~= nil then
    GetTable(A0_252, A1_253.DestVarTable, false)[A1_253.DestVar] = GetUnitSignificance(A0_252[A1_253.TargetVar])
  else
    GetTable(A0_252, A1_253.DestVarTable, false)[A1_253.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_254, A1_255)
  if A1_255.TargetVar ~= nil then
    GetTable(A0_254, A1_255.DestVarTable, false)[A1_255.DestVar] = GetArmor(A0_254[A1_255.TargetVar])
  else
    GetTable(A0_254, A1_255.DestVarTable, false)[A1_255.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_256, A1_257)
  if A1_257.TargetVar ~= nil then
    GetTable(A0_256, A1_257.DestVarTable, false)[A1_257.DestVar] = GetSpellBlock(A0_256[A1_257.TargetVar])
  else
    GetTable(A0_256, A1_257.DestVarTable, false)[A1_257.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_258, A1_259)
  if A1_259.TargetVar ~= nil then
    GetTable(A0_258, A1_259.DestVarTable, false)[A1_259.DestVar] = GetTeamID(A0_258[A1_259.TargetVar])
  else
    GetTable(A0_258, A1_259.DestVarTable, false)[A1_259.DestVar] = GetTeamID()
  end
end
BBGetTeamID = L0_0
function L0_0(A0_260, A1_261)
  local L2_262, L3_263, L4_264
  L2_262 = GetTable
  L3_263 = A0_260
  L4_264 = A1_261.DestVarTable
  L2_262 = L2_262(L3_263, L4_264, false)
  L3_263 = A1_261.TargetVar
  L4_264 = nil
  if L3_263 ~= nil then
    L4_264 = GetTeamID(A0_260[L3_263])
  else
    L4_264 = GetTeamID()
  end
  if L4_264 == TEAM_ORDER then
    L2_262[A1_261.DestVar] = TEAM_CHAOS
  elseif L4_264 == TEAM_CHAOS then
    L2_262[A1_261.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_265, A1_266)
  if A1_266.TargetVar ~= nil then
    GetTable(A0_265, A1_266.DestVarTable, false)[A1_266.DestVar] = GetUnitSkinName(A0_265[A1_266.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_267, A1_268)
  if A1_268.TargetVar ~= nil then
    GetTable(A0_267, A1_268.DestVarTable, false)[A1_268.DestVar] = GetTotalAttackDamage(A0_267[A1_268.TargetVar])
  else
    GetTable(A0_267, A1_268.DestVarTable, false)[A1_268.DestVar] = GetTotalAttackDamage()
  end
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_269, A1_270)
  GetTable(A0_269, A1_270.DestVarTable, true)[A1_270.DestVar] = A1_270.Status(A0_269[A1_270.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_271, A1_272)
  local L2_273
  L2_273 = A1_272.TargetVar
  L2_273 = A0_271[L2_273]
  ClearAttackTarget(L2_273)
end
BBClearAttackTarget = L0_0
function L0_0(A0_274, A1_275)
  GetTable(A0_274, A1_275.DestVarTable, true)[A1_275.DestVar] = A1_275.Info(A0_274[A1_275.TargetVar])
end
BBGetCastInfo = L0_0
function L0_0(A0_276, A1_277, A2_278)
  local L3_279, L4_280, L5_281, L6_282
  L3_279 = GetTable
  L4_280 = A0_276
  L5_281 = A1_277.TrackTimeVarTable
  L6_282 = false
  L3_279 = L3_279(L4_280, L5_281, L6_282)
  L4_280 = GetTime
  L4_280 = L4_280()
  L5_281 = A1_277.ExecuteImmediately
  L6_282 = A1_277.TimeBetweenExecutions
  if A1_277.TickTimeVar ~= nil and GetTable(A0_276, A1_277.TickTimeVarTable, false)[A1_277.TickTimeVar] ~= nil then
    L6_282 = GetTable(A0_276, A1_277.TickTimeVarTable, false)[A1_277.TickTimeVar]
  end
  if L3_279[A1_277.TrackTimeVar] == nil then
    L3_279[A1_277.TrackTimeVar] = L4_280
    if L5_281 == true then
      ExecuteBuildingBlocks(A2_278, A0_276)
    end
  end
  if L4_280 >= L3_279[A1_277.TrackTimeVar] + L6_282 then
    L3_279[A1_277.TrackTimeVar] = L3_279[A1_277.TrackTimeVar] + L6_282
    ExecuteBuildingBlocks(A2_278, A0_276)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_283, A1_284, A2_285)
  GetTable(A0_283, A1_284.TrackTimeVarTable, false)[A1_284.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_286, A1_287)
  local L2_288
  L2_288 = A1_287.SrcValue
  if A1_287.SrcVar ~= nil then
    L2_288 = GetTable(A0_286, A1_287.SrcTable, true)[A1_287.SrcVar]
  end
  A1_287.Status(A0_286[A1_287.TargetVar], L2_288)
end
BBSetStatus = L0_0
function L0_0(A0_289, A1_290)
  local L2_291
  L2_291 = A1_290.ToAlert
  if GetTable(A0_289, A1_290.SrcVarTable, false) ~= nil and A1_290.SrcVar ~= nil then
    L2_291 = L2_291 .. GetTable(A0_289, A1_290.SrcVarTable, false)[A1_290.SrcVar]
  end
  _ALERT(L2_291)
end
BBAlert = L0_0
function L0_0(A0_292, A1_293)
  local L2_294, L3_295, L4_296
  L2_294 = A1_293.ToSay
  L3_295 = GetTable
  L4_296 = A0_292
  L3_295 = L3_295(L4_296, A1_293.SrcVarTable, false)
  if L3_295 ~= nil then
    L4_296 = A1_293.SrcVar
    if L4_296 ~= nil then
      L4_296 = L2_294
      L2_294 = L4_296 .. tostring(L3_295[A1_293.SrcVar])
    end
  end
  L4_296 = nil
  if A1_293.OwnerVar ~= nil then
    L4_296 = A0_292[A1_293.OwnerVar]
  else
    L4_296 = A0_292.Owner
  end
  if A1_293.TextType == nil then
    A1_293.TextType = 0
  end
  Say(L4_296, L2_294, A1_293.TextType)
end
BBSay = L0_0
function L0_0(A0_297, A1_298)
  local L2_299, L3_300, L4_301
  L2_299 = A1_298.ToSay
  L3_300 = GetTable
  L4_301 = A0_297
  L3_300 = L3_300(L4_301, A1_298.SrcVarTable, false)
  if L3_300 ~= nil then
    L4_301 = A1_298.SrcVar
    if L4_301 ~= nil then
      L4_301 = L2_299
      L2_299 = L4_301 .. tostring(L3_300[A1_298.SrcVar])
    end
  end
  L4_301 = nil
  if A1_298.OwnerVar ~= nil then
    L4_301 = A0_297[A1_298.OwnerVar]
  else
    L4_301 = A0_297.Owner
  end
  if A1_298.TextType == nil then
    A1_298.TextType = 0
  end
  Say(L4_301, L2_299, A1_298.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_302, A1_303)
  GetTable(A0_302, A1_303.DestVarTable, true)[A1_303.DestVar] = BBLuaGetGold(A0_302, A1_303)
end
BBGetGold = L0_0
function L0_0(A0_304, A1_305)
  SpellBuffAdd(A0_304[A1_305.OwnerVar], A0_304[A1_305.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_304.NextBuffVars)
  BBTeleportToPositionHelper(A0_304, A1_305)
end
BBTeleportToPosition = L0_0
function L0_0(A0_306, A1_307)
  if A1_307.XVar ~= nil and GetTable(A0_306, A1_307.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_306, A1_307.XVarTable, true)[A1_307.XVar]
  else
    Xloc = A1_307.X
  end
  if A1_307.YVar ~= nil and GetTable(A0_306, A1_307.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_306, A1_307.YVarTable, true)[A1_307.YVar]
  else
    Yloc = A1_307.Y
  end
  if A1_307.ZVar ~= nil and GetTable(A0_306, A1_307.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_306, A1_307.ZVarTable, true)[A1_307.ZVar]
  else
    Zloc = A1_307.Z
  end
  A1_307.OwnerVar, A0_306.position = A1_307.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_307.CastPositionName = "position"
  BBTeleportToPosition(A0_306, A1_307)
end
BBTeleportToPoint = L0_0
function L0_0(A0_308, A1_309)
  DefUpdateAura(GetTable(A0_308, A1_309.CenterTable, false)[A1_309.CenterVar], A1_309.Range, A1_309.UnitScan, A1_309.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_310, A1_311)
  ReincarnateNonDeadHero(GetTable(A0_310, A1_311.TargetTable, false)[A1_311.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_312, A1_313)
  GetTable(A0_312, A1_313.DestVarTable, true)[A1_313.DestVar] = A1_313.Function(A0_312[A1_313.OwnerVar], A1_313.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_314, A1_315)
  local L2_316, L3_317, L4_318, L5_319
  L2_316 = A1_315.WhomToOrderVar
  L2_316 = A0_314[L2_316]
  L3_317 = A1_315.TargetOfOrderVar
  L3_317 = A0_314[L3_317]
  L4_318 = GetTable
  L5_319 = A0_314
  L4_318 = L4_318(L5_319, A1_315.SrcVarTable, false)
  L5_319 = nil
  if A1_315.SrcVar ~= nil and L4_318 ~= nil then
    L5_319 = L4_318[A1_315.SrcVar]
  else
    L5_319 = GetPosition(L3_317)
  end
  if L3_317 == nil then
    L3_317 = L2_316
  end
  IssueOrder(L2_316, A1_315.Order, L5_319, L3_317)
end
BBIssueOrder = L0_0
function L0_0(A0_320, A1_321)
  SetSpellCastRange(A1_321.NewRange)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_322, A1_323)
  GetTable(A0_322, A1_323.DestVarTable, true)[A1_323.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_324, A1_325)
  local L2_326, L3_327
  L2_326 = A1_325.ObjectVar1
  L2_326 = A0_324[L2_326]
  L3_327 = A1_325.ObjectVar2
  L3_327 = A0_324[L3_327]
  GetTable(A0_324, A1_325.DestVarTable, true)[A1_325.DestVar] = DistanceBetweenObjectBounds(L2_326, L3_327)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_328, A1_329)
  local L2_330, L3_331, L4_332
  L2_330 = A1_329.ObjectVar
  L2_330 = A0_328[L2_330]
  L3_331 = GetTable
  L4_332 = A0_328
  L3_331 = L3_331(L4_332, A1_329.PointVarTable, true)
  L4_332 = A1_329.PointVar
  L4_332 = L3_331[L4_332]
  GetTable(A0_328, A1_329.DestVarTable, true)[A1_329.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_330, L4_332)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_333, A1_334)
  local L2_335, L3_336, L4_337, L5_338
  L2_335 = GetTable
  L3_336 = A0_333
  L4_337 = A1_334.Point1VarTable
  L5_338 = true
  L2_335 = L2_335(L3_336, L4_337, L5_338)
  L3_336 = A1_334.Point1Var
  L3_336 = L2_335[L3_336]
  L4_337 = GetTable
  L5_338 = A0_333
  L4_337 = L4_337(L5_338, A1_334.Point2VarTable, true)
  L5_338 = A1_334.Point2Var
  L5_338 = L4_337[L5_338]
  GetTable(A0_333, A1_334.DestVarTable, true)[A1_334.DestVar] = DistanceBetweenPoints(L3_336, L5_338)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_339, A1_340, A2_341)
  local L3_342, L4_343, L5_344, L6_345, L7_346, L8_347
  L5_344 = 0
  L6_345 = nil
  L7_346 = A1_340.ObjectDistanceType
  L8_347 = A1_340.ObjectVar1
  L3_342 = A0_339[L8_347]
  L8_347 = A1_340.ObjectVar2
  L4_343 = A0_339[L8_347]
  if nil == L4_343 then
    L8_347 = A1_340.Point2Var
    if nil ~= L8_347 then
      L8_347 = GetTable
      L8_347 = L8_347(A0_339, A1_340.Point2VarTable, true)
      L4_343 = L8_347[A1_340.Point2Var]
      L5_344 = L5_344 + 1
    end
  end
  if nil == L3_342 then
    L8_347 = A1_340.Point1Var
    if nil ~= L8_347 then
      L8_347 = GetTable
      L8_347 = L8_347(A0_339, A1_340.Point1VarTable, true)
      L3_342 = L8_347[A1_340.Point1Var]
      L5_344 = L5_344 + 1
      if 1 == L5_344 then
        L3_342, L4_343 = L4_343, L3_342
      end
    end
  end
  if nil ~= L7_346 then
    if 0 == L5_344 then
      L8_347 = OBJECT_CENTER
      if L8_347 == L7_346 then
        L6_345 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_347 = OBJECT_BOUNDARY
        if L8_347 == L7_346 then
          L6_345 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_347 = A1_340.OwnerVar
          L8_347 = A0_339[L8_347]
          Say(L8_347, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_344 then
      L8_347 = OBJECT_CENTER
      if L8_347 == L7_346 then
        L6_345 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_347 = OBJECT_BOUNDARY
        if L8_347 == L7_346 then
          L6_345 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_347 = A1_340.OwnerVar
          L8_347 = A0_339[L8_347]
          Say(L8_347, "invalid object distance type", 0)
        end
      end
    else
      L6_345 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_347 = A1_340.Distance
  if A1_340.DistanceVar ~= nil and GetTable(A0_339, A1_340.DistanceVarTable, true) ~= nil then
    L8_347 = L8_347 + GetTable(A0_339, A1_340.DistanceVarTable, true)[A1_340.DistanceVar]
  end
  if L3_342 ~= nil and L4_343 ~= nil and L6_345 ~= nil and L8_347 ~= nil then
    if not L6_345(L3_342, L4_343, L8_347) then
      ExecuteBuildingBlocks(A2_341, A0_339)
      A0_339.LastIfSucceeded = true
    else
      A0_339.LastIfSucceeded = false
    end
  else
    A0_339.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_348, A1_349)
  local L2_350, L3_351
  L2_350 = A1_349.TargetVar
  L2_350 = A0_348[L2_350]
  L3_351 = A1_349.CasterVar
  L3_351 = A0_348[L3_351]
  GetTable(A0_348, A1_349.DestVarTable, true)[A1_349.DestVar] = SpellBuffCount(L2_350, A1_349.BuffName, L3_351)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_352, A1_353)
  local L2_354
  L2_354 = A1_353.TargetVar
  L2_354 = A0_352[L2_354]
  GetTable(A0_352, A1_353.DestVarTable, true)[A1_353.DestVar] = SpellBuffCount(L2_354, A1_353.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_355, A1_356)
  local L2_357, L3_358
  L2_357 = GetTable
  L3_358 = A0_355
  L2_357 = L2_357(L3_358, A1_356.ScaleVarTable, false)
  L3_358 = nil
  if A1_356.OwnerVar ~= nil then
    L3_358 = A0_355[A1_356.OwnerVar]
  else
    L3_358 = A0_355.Owner
  end
  if A1_356.ScaleVar ~= nil and A1_356.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_357[A1_356.ScaleVar], L3_358)
  else
    SetScaleSkinCoef(A1_356.Scale, L3_358)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_359, A1_360)
  SpellBuffAdd(A0_359[A1_360.TargetVar], A0_359[A1_360.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_359.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_361, A1_362, A2_363)
  local L3_364, L4_365
  L3_364 = A1_362.TargetVar
  L3_364 = A0_361[L3_364]
  L4_365 = A1_362.NumStacks
  if A1_362.NumStacks == 0 then
    L4_365 = SpellBuffCount(L3_364, A1_362.BuffName, caster)
  end
  while L4_365 > 0 do
    SpellBuffRemove(L3_364, A1_362.BuffName, A0_361[A1_362.AttackerVar])
    L4_365 = L4_365 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_366, A1_367, A2_368)
  if A0_366.EmoteId == A1_367.EmoteId then
    ExecuteBuildingBlocks(A2_368, A0_366)
    A0_366.LastIfSucceeded = true
  else
    A0_366.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_369, A1_370, A2_371)
  if A0_369.EmoteId ~= A1_370.EmoteId then
    ExecuteBuildingBlocks(A2_371, A0_369)
    A0_369.LastIfSucceeded = true
  else
    A0_369.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
