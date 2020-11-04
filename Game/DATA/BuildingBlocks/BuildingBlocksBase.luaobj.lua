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
  ExecuteBuildingBlocks(A2_19, A0_17)
end
BBCom = L0_0
function L0_0(A0_20, A1_21, A2_22)
  if A1_21.IsConditionTrue(A0_20) then
    ExecuteBuildingBlocks(A2_22, A0_20)
  end
end
BBConditionallyExecute = L0_0
function L0_0(A0_23, A1_24)
  local L2_25, L3_26
  L2_25 = GetTable
  L3_26 = A0_23
  L2_25 = L2_25(L3_26, A1_24.SrcVarTable, false)
  L3_26 = A1_24.ToSay
  L3_26 = L3_26 or ""
  ClientPrint(tostring(L3_26) .. ": " .. type(L2_25[A1_24.SrcVar]))
end
BBPrintTypeToChat = L0_0
function L0_0(A0_27, A1_28)
  local L2_29, L3_30, L4_31, L5_32, L6_33
  L2_29 = A1_28.ToSay
  L2_29 = L2_29 or ""
  L3_30 = A1_28.Color
  L3_30 = L3_30 or "FFFFFF"
  L4_31 = GetTable
  L5_32 = A0_27
  L6_33 = A1_28.SrcVarTable
  L4_31 = L4_31(L5_32, L6_33, false)
  L5_32 = A1_28.SrcVar
  L5_32 = L4_31[L5_32]
  L6_33 = "<font color=\""
  L6_33 = L6_33 .. L3_30 .. "\">"
  L6_33 = L6_33 .. L2_29
  if type(L5_32) ~= "table" and type(L5_32) ~= "nil" then
    L6_33 = L6_33 .. " " .. tostring(L5_32)
  end
  L6_33 = L6_33 .. "</font>"
  ClientPrint(L6_33)
  if type(L5_32) == "table" then
    PrintTableToChat(L5_32)
  end
end
BBPrintToChat = L0_0
function L0_0(A0_34, A1_35)
  local L2_36, L3_37
  L2_36 = GetTable
  L3_37 = A0_34
  L2_36 = L2_36(L3_37, A1_35.TableName, true)
  L3_37 = A1_35.TableName
  L3_37 = L3_37 or "PassThroughParams"
  ClientPrint(L3_37)
  PrintTableToChat(L2_36)
end
BBPrintTableToChat = L0_0
function L0_0(A0_38, A1_39)
  local L2_40, L3_41, L4_42, L5_43, L6_44, L7_45, L8_46, L9_47, L10_48, L11_49, L12_50, L13_51
  A1_39 = A1_39 or 0
  if A1_39 > 10 then
    return
  end
  L2_40 = nil
  L3_41 = "|"
  for L7_45 = 1, A1_39 do
    L9_47 = "----"
    L3_41 = L8_46 .. L9_47
  end
  L6_44(L7_45)
  for L9_47, L10_48 in L6_44(L7_45) do
    L11_49 = nil
    L12_50 = tostring
    L13_51 = L9_47
    L12_50 = L12_50(L13_51)
    if L12_50 == "PassThroughParams" then
      L11_49 = "{{ PassThroughParams }}"
    else
      L13_51 = type
      L13_51 = L13_51(L10_48)
      if L13_51 == "table" then
        L11_49 = "Table"
      else
        L13_51 = tostring
        L13_51 = L13_51(L10_48)
        L11_49 = L13_51
      end
    end
    L13_51 = L3_41
    L13_51 = L13_51 .. L12_50 .. ": " .. L11_49
    ClientPrint(L13_51)
    if type(L10_48) == "table" then
      PrintTableToChat(L10_48, A1_39 + 1)
    end
  end
  L6_44(L7_45)
end
PrintTableToChat = L0_0
function L0_0(A0_52, A1_53, A2_54)
  local L3_55
  if A1_53 ~= nil then
    L3_55 = A0_52[A1_53]
    if L3_55 == nil and A2_54 then
      A0_52[A1_53] = {}
      return A0_52[A1_53]
    end
  end
  if L3_55 == nil then
    L3_55 = A0_52
  end
  return L3_55
end
GetTable = L0_0
function L0_0(A0_56, A1_57, A2_58)
  if A2_58[A0_56 .. "Var"] ~= nil and GetTable(A1_57, A2_58[A0_56 .. "VarTable"], false) ~= nil then
    return GetTable(A1_57, A2_58[A0_56 .. "VarTable"], false)[A2_58[A0_56 .. "Var"]]
  else
    return A2_58[A0_56]
  end
end
GetParam = L0_0
function L0_0(A0_59, A1_60)
  GetTable(A0_59, A1_60.DestVarTable, true)[A1_60.DestVar] = {}
end
BBCreateCustomTable = L0_0
function L0_0(A0_61, A1_62)
  GetTable(A0_61, A1_62.TableNameVarTable, false)[A1_62.TableNameVar] = nil
end
BBDestroyCustomTable = L0_0
function L0_0(A0_63, A1_64)
  if type(GetTable(A0_63, A1_64.DestTableVarTable, false)[A1_64.DestTableVar]) == "nil" then
    GetTable(A0_63, A1_64.DestTableVarTable, false)[A1_64.DestTableVar] = {}
  end
  if type(GetTable(A0_63, A1_64.DestTableVarTable, false)[A1_64.DestTableVar]) == "table" then
    GetTable(A0_63, A1_64.DestTableVarTable, false)[A1_64.DestTableVar][GetParam("Key", A0_63, A1_64)] = GetParam("Value", A0_63, A1_64)
  end
end
BBSetKeyValueInCustomTable = L0_0
function L0_0(A0_65, A1_66)
  if type(GetTable(A0_65, A1_66.SrcTableVarTable, false)[A1_66.SrcTableVar]) == "table" then
    GetTable(A0_65, A1_66.DestVarTable, true)[A1_66.DestVar] = GetTable(A0_65, A1_66.SrcTableVarTable, false)[A1_66.SrcTableVar][GetParam("SrcKey", A0_65, A1_66)]
  end
end
BBGetKeyValueInCustomTable = L0_0
function L0_0(A0_67, A1_68)
  local L2_69, L3_70, L4_71
  L2_69 = GetTable
  L3_70 = A0_67
  L4_71 = A1_68.DestTableVarTable
  L2_69 = L2_69(L3_70, L4_71, false)
  L3_70 = GetParam
  L4_71 = "DestIndex"
  L3_70 = L3_70(L4_71, A0_67, A1_68)
  L4_71 = GetParam
  L4_71 = L4_71("Value", A0_67, A1_68)
  if type(L2_69[A1_68.DestTableVar]) == "nil" then
    L2_69[A1_68.DestTableVar] = {}
  end
  if type(L2_69[A1_68.DestTableVar]) == "table" then
    if L3_70 then
      table.insert(L2_69[A1_68.DestTableVar], L3_70, L4_71)
      if A1_68.OutIndexVar then
        GetTable(A0_67, A1_68.OutIndexVarTable, true)[A1_68.OutIndexVar] = L3_70
      end
    else
      table.insert(L2_69[A1_68.DestTableVar], L4_71)
      if A1_68.OutIndexVar then
        GetTable(A0_67, A1_68.OutIndexVarTable, true)[A1_68.OutIndexVar] = table.getn(L2_69[A1_68.DestTableVar])
      end
    end
  end
end
BBInsertIntoInCustomTable = L0_0
function L0_0(A0_72, A1_73)
  local L2_74, L3_75
  L2_74 = GetTable
  L3_75 = A0_72
  L2_74 = L2_74(L3_75, A1_73.TableVarTable, false)
  L3_75 = GetParam
  L3_75 = L3_75("Index", A0_72, A1_73)
  if type(L2_74[A1_73.TableVar]) == "nil" then
    ClientPrint("Table specified does not exist: " .. tostring(A1_73.TableVarTable) .. "." .. tostring(A1_73.TableVar))
    return
  end
  if type(L2_74[A1_73.TableVar]) == "table" then
    if L3_75 then
      table.remove(L2_74[A1_73.TableVar], L3_75, valueData)
    else
      ClientPrint("Specified index was nil: " .. tostring(A1_73.IndexVarTable) .. "." .. tostring(A1_73.IndexVar))
    end
  end
end
BBRemoveFromCustomTable = L0_0
function L0_0(A0_76, A1_77, A2_78)
  local L3_79, L4_80, L5_81, L6_82, L7_83, L8_84
  L3_79 = GetTable
  L3_79 = L3_79(L4_80, L5_81, L6_82)
  if L4_80 == "table" then
    if L4_80 then
      for L8_84, _FORV_9_ in L5_81(L6_82) do
        table.insert(L4_80, L8_84)
      end
      L5_81(L6_82)
      for L8_84, _FORV_9_ in L5_81(L6_82) do
        GetTable(A0_76, A1_77.DestKeyVarTable, true)[A1_77.DestKeyVar] = _FORV_9_
        GetTable(A0_76, A1_77.DestValueVarTable, true)[A1_77.DestValueVar] = L3_79[A1_77.TableVar][_FORV_9_]
        ExecuteBuildingBlocks(A2_78, A0_76)
      end
    else
      for L7_83, L8_84 in L4_80(L5_81) do
        GetTable(A0_76, A1_77.DestKeyVarTable, true)[A1_77.DestKeyVar] = L7_83
        GetTable(A0_76, A1_77.DestValueVarTable, true)[A1_77.DestValueVar] = L8_84
        ExecuteBuildingBlocks(A2_78, A0_76)
      end
    end
  end
end
BBForEachInCustomTable = L0_0
function L0_0(A0_85, A1_86)
  local L2_87, L3_88, L4_89, L5_90, L6_91
  L2_87 = GetTable
  L3_88 = A0_85
  L4_89 = A1_86.SrcTableVarTable
  L5_90 = false
  L2_87 = L2_87(L3_88, L4_89, L5_90)
  L3_88 = GetParam
  L4_89 = "Value"
  L5_90 = A0_85
  L6_91 = A1_86
  L3_88 = L3_88(L4_89, L5_90, L6_91)
  L4_89 = GetTable
  L5_90 = A0_85
  L6_91 = A1_86.MatchingKeyVarTable
  L4_89 = L4_89(L5_90, L6_91, false)
  L5_90 = GetTable
  L6_91 = A0_85
  L5_90 = L5_90(L6_91, A1_86.WasFoundVarTable, false)
  L6_91 = A1_86.WasFoundVar
  L5_90[L6_91] = false
  L6_91 = type
  L6_91 = L6_91(L2_87[A1_86.SrcTableVar])
  if L6_91 == "table" then
    L6_91 = GetTable
    L6_91 = L6_91(A0_85, A1_86.DestVarTable, true)
    for _FORV_10_, _FORV_11_ in pairs(L6_91) do
      if _FORV_11_ == L3_88 then
        L5_90[A1_86.WasFoundVar] = true
        L4_89[A1_86.MatchingKeyVar] = _FORV_10_
      end
    end
  end
end
BBCustomTableContainsValue = L0_0
function L0_0(A0_92, A1_93, A2_94)
  for _FORV_9_, _FORV_10_ in pairs(GetTable(A0_92, A1_93.TableVarTable, false)[A1_93.TableVar]) do
  end
  GetTable(A0_92, A1_93.SizeVarTable, false)[A1_93.SizeVar] = 0 + 1
end
BBGetSizeOfCustomTable = L0_0
function L0_0(A0_95, A1_96)
  local L2_97, L3_98
  L2_97 = GetTable
  L3_98 = A0_95
  L2_97 = L2_97(L3_98, A1_96.DestVarTable, true)
  L3_98 = nil
  if A1_96.SpellSlotVar ~= nil and GetTable(A0_95, A1_96.SpellSlotVarTable, false) ~= nil then
    L3_98 = GetTable(A0_95, A1_96.SpellSlotVarTable, false)[A1_96.SpellSlotVar]
  else
    L3_98 = A1_96.SpellSlotValue
  end
  L2_97[A1_96.DestVar] = A1_96.Function(A0_95[A1_96.OwnerVar], L3_98, A1_96.SpellbookType, A1_96.SlotType)
end
BBGetSlotSpellInfo = L0_0
function L0_0(A0_99, A1_100)
  local L2_101, L3_102, L4_103
  L2_101 = GetTable
  L3_102 = A0_99
  L4_103 = A1_100.SrcVarTable
  L2_101 = L2_101(L3_102, L4_103, false)
  L3_102 = nil
  L4_103 = A1_100.SrcVar
  if L4_103 ~= nil and L2_101 ~= nil then
    L4_103 = A1_100.SrcVar
    L3_102 = L2_101[L4_103]
  else
    L3_102 = A1_100.SrcValue
  end
  L4_103 = nil
  if A1_100.SpellSlotVar ~= nil and GetTable(A0_99, A1_100.SpellSlotVarTable, false) ~= nil then
    L4_103 = GetTable(A0_99, A1_100.SpellSlotVarTable, false)[A1_100.SpellSlotVar]
  else
    L4_103 = A1_100.SpellSlotValue
  end
  SetSlotSpellCooldownTime(A0_99[A1_100.OwnerVar], L4_103, A1_100.SpellbookType, A1_100.SlotType, L3_102)
end
BBSetSlotSpellCooldownTime = L0_0
function L0_0(A0_104, A1_105)
  if A0_104.Level ~= nil and A1_105.SrcValueByLevel ~= nil then
    A0_104.ReturnValue = A1_105.SrcValueByLevel[A0_104.Level]
  elseif A1_105.SrcVar ~= nil and GetTable(A0_104, A1_105.SrcVarTable, false) ~= nil then
    A0_104.ReturnValue = GetTable(A0_104, A1_105.SrcVarTable, false)[A1_105.SrcVar]
  else
    A0_104.ReturnValue = A1_105.SrcValue
  end
end
BBSetReturnValue = L0_0
function L0_0(A0_106, A1_107)
  if type(A0_106) == "string" and type(A1_107) == "string" then
    A0_106 = string.lower(A0_106)
    A1_107 = string.lower(A1_107)
  end
  return A0_106 == A1_107
end
CO_EQUAL = L0_0
function L0_0(A0_108, A1_109)
  if type(A0_108) == "string" and type(A1_109) == "string" then
    A0_108 = string.lower(A0_108)
    A1_109 = string.lower(A1_109)
  end
  return A0_108 ~= A1_109
end
CO_NOT_EQUAL = L0_0
function L0_0(A0_110, A1_111)
  local L2_112
  L2_112 = A0_110 < A1_111
  return L2_112
end
CO_LESS_THAN = L0_0
function L0_0(A0_113, A1_114)
  local L2_115
  L2_115 = A1_114 < A0_113
  return L2_115
end
CO_GREATER_THAN = L0_0
function L0_0(A0_116, A1_117)
  local L2_118
  L2_118 = A0_116 <= A1_117
  return L2_118
end
CO_LESS_THAN_OR_EQUAL = L0_0
function L0_0(A0_119, A1_120)
  local L2_121
  L2_121 = A1_120 <= A0_119
  return L2_121
end
CO_GREATER_THAN_OR_EQUAL = L0_0
function L0_0(A0_122, A1_123)
  return GetTeamID(A0_122) == GetTeamID(A1_123)
end
CO_SAME_TEAM = L0_0
function L0_0(A0_124, A1_125)
  return GetTeamID(A0_124) ~= GetTeamID(A1_125)
end
CO_DIFFERENT_TEAM = L0_0
function L0_0(A0_126, A1_127)
  return GetSourceType() == A1_127 or GetSourceType() == A0_126
end
CO_DAMAGE_SOURCETYPE_IS = L0_0
function L0_0(A0_128, A1_129)
  return GetSourceType() ~= A1_129 and GetSourceType() ~= A0_128
end
CO_DAMAGE_SOURCETYPE_IS_NOT = L0_0
function L0_0(A0_130)
  return IsObjectAI(A0_130)
end
CO_IS_TYPE_AI = L0_0
function L0_0(A0_131)
  return IsObjectAI(A0_131) ~= true
end
CO_IS_NOT_AI = L0_0
function L0_0(A0_132)
  return IsObjectHero(A0_132)
end
CO_IS_TYPE_HERO = L0_0
function L0_0(A0_133)
  return IsObjectHero(A0_133) ~= true
end
CO_IS_NOT_HERO = L0_0
function L0_0(A0_134)
  return IsClone(A0_134)
end
CO_IS_CLONE = L0_0
function L0_0(A0_135)
  return IsClone(A0_135) ~= true
end
CO_IS_NOT_CLONE = L0_0
function L0_0(A0_136)
  return IsMelee(A0_136)
end
CO_IS_MELEE = L0_0
function L0_0(A0_137)
  return IsMelee(A0_137) ~= true
end
CO_IS_RANGED = L0_0
function L0_0(A0_138)
  return A0_138 > math.random()
end
CO_RANDOM_CHANCE_LESS_THAN = L0_0
function L0_0(A0_139)
  return IsTurretAI(A0_139)
end
CO_IS_TYPE_TURRET = L0_0
function L0_0(A0_140)
  return IsTurretAI(A0_140) ~= true
end
CO_IS_NOT_TURRET = L0_0
function L0_0(A0_141)
  return IsDead(A0_141)
end
CO_IS_DEAD = L0_0
function L0_0(A0_142)
  return IsDead(A0_142) ~= true
end
CO_IS_NOT_DEAD = L0_0
function L0_0(A0_143)
  return IsDeadOrZombie(A0_143)
end
CO_IS_DEAD_OR_ZOMBIE = L0_0
function L0_0(A0_144, A1_145)
  return BBIsTargetInFrontOfMe(A0_144, A1_145)
end
CO_IS_TARGET_IN_FRONT_OF_ME = L0_0
function L0_0(A0_146, A1_147)
  return BBIsTargetBehindMe(A0_146, A1_147)
end
CO_IS_TARGET_BEHIND_ME = L0_0
function L0_0(A0_148)
  return IsWard(A0_148)
end
CO_IS_WARD = L0_0
function L0_0(A0_149)
  return IsStructure(A0_149)
end
CO_IS_STRUCTURE = L0_0
function L0_0(A0_150)
  return IsStructure(A0_150) ~= true
end
CO_IS_NOT_STRUCTURE = L0_0
function L0_0(A0_151)
  local L1_152
  L1_152 = A0_151 ~= nil
  return L1_152
end
CO_IS_NOT_NIL = L0_0
function L0_0(A0_153, A1_154, A2_155)
  local L3_156, L4_157, L5_158, L6_159
  L3_156 = GetTable
  L4_157 = A0_153
  L5_158 = A1_154.Src1VarTable
  L6_159 = false
  L3_156 = L3_156(L4_157, L5_158, L6_159)
  L4_157 = GetTable
  L5_158 = A0_153
  L6_159 = A1_154.Src2VarTable
  L4_157 = L4_157(L5_158, L6_159, false)
  L5_158 = false
  L6_159 = nil
  if L3_156 ~= nil and A1_154.Src1Var ~= nil then
    L6_159 = L3_156[A1_154.Src1Var]
  else
    L6_159 = A1_154.Value1
  end
  if L4_157 ~= nil and A1_154.Src2Var ~= nil then
    L5_158 = A1_154.CompareOp(L6_159, L4_157[A1_154.Src2Var])
  else
    L5_158 = A1_154.CompareOp(L6_159, A1_154.Value2)
  end
  if L5_158 then
    ExecuteBuildingBlocks(A2_155, A0_153)
    A0_153.LastIfSucceeded = true
  else
    A0_153.LastIfSucceeded = false
  end
end
BBIf = L0_0
function L0_0(A0_160, A1_161, A2_162)
  if A0_160.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_162, A0_160)
    A0_160.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_163, A1_164, A2_165)
  local L3_166, L4_167, L5_168, L6_169
  L3_166 = A0_163.LastIfSucceeded
  if L3_166 == false then
    L3_166 = GetTable
    L4_167 = A0_163
    L5_168 = A1_164.Src1VarTable
    L6_169 = false
    L3_166 = L3_166(L4_167, L5_168, L6_169)
    L4_167 = GetTable
    L5_168 = A0_163
    L6_169 = A1_164.Src2VarTable
    L4_167 = L4_167(L5_168, L6_169, false)
    L5_168 = false
    L6_169 = nil
    if L3_166 ~= nil and A1_164.Src1Var ~= nil then
      L6_169 = L3_166[A1_164.Src1Var]
    else
      L6_169 = A1_164.Value1
    end
    if L4_167 ~= nil and A1_164.Src2Var ~= nil then
      L5_168 = A1_164.CompareOp(L6_169, L4_167[A1_164.Src2Var])
    else
      L5_168 = A1_164.CompareOp(L6_169, A1_164.Value2)
    end
    if L5_168 then
      ExecuteBuildingBlocks(A2_165, A0_163)
      A0_163.LastIfSucceeded = true
    else
      A0_163.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_170, A1_171, A2_172)
  local L3_173
  if A1_171.TargetVar ~= nil then
    L3_173 = A0_170[A1_171.TargetVar]
  else
    L3_173 = A0_170.Target
  end
  if HasBuffOfType(L3_173, A1_171.BuffType) then
    ExecuteBuildingBlocks(A2_172, A0_170)
    A0_170.LastIfSucceeded = true
  else
    A0_170.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_174, A1_175, A2_176)
  local L3_177, L4_178
  if A1_175.OwnerVar ~= nil then
    L3_177 = A0_174[A1_175.OwnerVar]
  else
    L3_177 = A0_174.Owner
  end
  if A1_175.AttackerVar ~= nil then
    L4_178 = A0_174[A1_175.AttackerVar]
  else
    L4_178 = A0_174.Attacker
  end
  if SpellBuffCount(L3_177, A1_175.BuffName, L4_178) > 0 then
    ExecuteBuildingBlocks(A2_176, A0_174)
    A0_174.LastIfSucceeded = true
  else
    A0_174.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_179, A1_180, A2_181)
  if BBIsMissileAutoAttack(A0_179, A1_180) then
    ExecuteBuildingBlocks(A2_181, A0_179)
    A0_179.LastIfSucceeded = true
  else
    A0_179.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_182, A1_183)
  A0_182.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_184, A1_185, A2_186)
  local L3_187, L4_188
  if A1_185.OwnerVar ~= nil then
    L3_187 = A0_184[A1_185.OwnerVar]
  else
    L3_187 = A0_184.Owner
  end
  if A1_185.CasterVar ~= nil then
    L4_188 = A0_184[A1_185.CasterVar]
  else
    L4_188 = A0_184.Caster
  end
  if SpellBuffCount(L3_187, A1_185.BuffName, L4_188) <= 0 then
    ExecuteBuildingBlocks(A2_186, A0_184)
    A0_184.LastIfSucceeded = true
  else
    A0_184.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_189, A1_190, A2_191)
  local L3_192, L4_193
  if A1_190.OwnerVar ~= nil then
    L3_192 = A0_189[A1_190.OwnerVar]
  else
    L3_192 = A0_189.Owner
  end
  if HasPARType(L3_192, A1_190.PARType) then
    ExecuteBuildingBlocks(A2_191, A0_189)
    A0_189.LastIfSucceeded = true
  else
    A0_189.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_194, A1_195, A2_196)
  local L3_197, L4_198
  if A1_195.OwnerVar ~= nil then
    L3_197 = A0_194[A1_195.OwnerVar]
  else
    L3_197 = A0_194.Owner
  end
  if not HasPARType(L3_197, A1_195.PARType) then
    ExecuteBuildingBlocks(A2_196, A0_194)
    A0_194.LastIfSucceeded = true
  else
    A0_194.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_199, A1_200, A2_201)
  local L3_202, L4_203, L5_204, L6_205, L7_206
  L3_202 = GetTable
  L4_203 = A0_199
  L5_204 = A1_200.Src1VarTable
  L6_205 = false
  L3_202 = L3_202(L4_203, L5_204, L6_205)
  L4_203 = GetTable
  L5_204 = A0_199
  L6_205 = A1_200.Src2VarTable
  L7_206 = false
  L4_203 = L4_203(L5_204, L6_205, L7_206)
  L5_204 = true
  while L5_204 do
    L6_205 = false
    L7_206 = nil
    if L3_202 ~= nil and A1_200.Src1Var ~= nil then
      L7_206 = L3_202[A1_200.Src1Var]
    else
      L7_206 = A1_200.Value1
    end
    if L4_203 ~= nil and A1_200.Src2Var ~= nil then
      L6_205 = A1_200.CompareOp(L7_206, L4_203[A1_200.Src2Var])
    else
      L6_205 = A1_200.CompareOp(L7_206, A1_200.Value2)
    end
    if L6_205 then
      ExecuteBuildingBlocks(A2_201, A0_199)
    else
      L5_204 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_207, A1_208)
  return A0_207 * A1_208
end
MO_MULTIPLY = L0_0
function L0_0(A0_209, A1_210)
  return A0_209 + A1_210
end
MO_ADD = L0_0
function L0_0(A0_211, A1_212)
  return A0_211 - A1_212
end
MO_SUBTRACT = L0_0
function L0_0(A0_213, A1_214)
  return A0_213 / A1_214
end
MO_DIVIDE = L0_0
function L0_0(A0_215, A1_216)
  if A0_215 < A1_216 then
    return A0_215
  else
    return A1_216
  end
end
MO_MIN = L0_0
function L0_0(A0_217, A1_218)
  if A1_218 < A0_217 then
    return A0_217
  else
    return A1_218
  end
end
MO_MAX = L0_0
function L0_0(A0_219, A1_220)
  return A0_219 % A1_220
end
MO_MODULO = L0_0
function L0_0(A0_221)
  return math.floor(A0_221 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_222)
  return math.ceil(A0_222)
end
MO_ROUNDUP = L0_0
function L0_0(A0_223)
  return math.floor(A0_223)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_224)
  return math.sin(math.rad(A0_224))
end
MO_SIN = L0_0
function L0_0(A0_225)
  return math.cos(math.rad(A0_225))
end
MO_COSINE = L0_0
function L0_0(A0_226)
  return math.tan(math.rad(A0_226))
end
MO_TANGENT = L0_0
function L0_0(A0_227)
  return math.deg(math.asin(A0_227))
end
MO_ASIN = L0_0
function L0_0(A0_228)
  return math.deg(math.acos(A0_228))
end
MO_ACOS = L0_0
function L0_0(A0_229)
  return math.deg(math.atan(A0_229))
end
MO_ATAN = L0_0
function L0_0(A0_230, A1_231)
  return math.pow(A0_230, A1_231)
end
MO_POW = L0_0
function L0_0(A0_232)
  return math.sqrt(A0_232)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_233, A1_234)
  local L2_235
  L2_235 = A0_233 and A1_234
  return L2_235
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_236, A1_237)
  local L2_238
  L2_238 = A0_236 or A1_237
  return L2_238
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_239)
  local L1_240
  L1_240 = not A0_239
  return L1_240
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_241)
  return math.abs(A0_241)
end
MO_ABS = L0_0
function L0_0(A0_242, A1_243)
  return math.random(A0_242, A1_243)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_244, A1_245)
  local L2_246, L3_247
  L2_246 = GetMathNumber
  L3_247 = A0_244
  L2_246 = L2_246(L3_247, A1_245.Src1VarTable, A1_245.Src1Var, A1_245.Src1Value)
  L3_247 = GetMathNumber
  L3_247 = L3_247(A0_244, A1_245.Src2VarTable, A1_245.Src2Var, A1_245.Src2Value)
  GetTable(A0_244, A1_245.DestVarTable)[A1_245.DestVar] = A1_245.MathOp(L2_246, L3_247)
end
BBMath = L0_0
function L0_0(A0_248, A1_249, A2_250, A3_251)
  if A2_250 ~= nil and GetTable(A0_248, A1_249)[A2_250] ~= nil then
    return GetTable(A0_248, A1_249)[A2_250]
  end
  return A3_251
end
GetMathNumber = L0_0
function L0_0(A0_252, A1_253)
  if type(A1_253) == "number" then
    return A1_253
  elseif type(A1_253) == "function" then
    return A1_253(A0_252)
  elseif type(A1_253) == "string" then
    return A0_252[A1_253]
  end
end
GetNumber = L0_0
function L0_0(A0_254, A1_255)
  return VectorAdd(A0_254, A1_255)
end
VEC_ADD = L0_0
function L0_0(A0_256, A1_257)
  return VectorSubtract(A0_256, A1_257)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_258, A1_259)
  return VectorScalarMultiply(A0_258, A1_259)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_260, A1_261)
  return VectorScalarDivide(A0_260, A1_261)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_262, A1_263)
  return VectorRotateY(A0_262, A1_263)
end
VEC_ROTATE = L0_0
function L0_0(A0_264, A1_265)
  BBMath(A0_264, A1_265)
end
BBVectorMath = L0_0
function L0_0(A0_266, A1_267)
  local L2_268, L3_269, L4_270, L5_271
  L2_268 = A0_266.InstanceVars
  L3_269 = L2_268.InterpDelta
  if L3_269 == nil then
    L3_269 = A1_267.Amount
    L4_270 = A1_267.AmountVar
    if L4_270 ~= nil then
      L4_270 = GetTable
      L5_271 = A0_266
      L4_270 = L4_270(L5_271, A1_267.AmountVarTable)
      L5_271 = A1_267.AmountVar
      L3_269 = L4_270[L5_271]
    end
    L4_270 = GetPosition
    L5_271 = A1_267.TargetVar
    L5_271 = A0_266[L5_271]
    L4_270 = L4_270(L5_271)
    L2_268.KnockBackStart = L4_270
    L4_270 = GetNormalizedPositionDelta
    L5_271 = A1_267.TargetVar
    L5_271 = A0_266[L5_271]
    L4_270 = L4_270(L5_271, A0_266[A1_267.AttackerVar], true)
    L5_271 = {}
    L5_271.x = L4_270.x * L3_269
    L5_271.y = 0
    L5_271.z = L4_270.z * L3_269
    L2_268.InterpDelta = L5_271
    L5_271 = GetTime
    L5_271 = L5_271()
    L2_268.StartTime = L5_271
    L5_271 = A1_267.KnockBackDuration
    L2_268.KnockBackDuration = L5_271
  end
  L3_269 = A1_267.TargetVar
  L3_269 = A0_266[L3_269]
  L4_270 = GetTime
  L4_270 = L4_270()
  L5_271 = L2_268.StartTime
  L4_270 = L4_270 - L5_271
  L5_271 = L2_268.KnockBackDuration
  L4_270 = L4_270 / L5_271
  L5_271 = {}
  L5_271.x = L2_268.KnockBackStart.x + L2_268.InterpDelta.x * L4_270
  L5_271.y = L2_268.KnockBackStart.y
  L5_271.z = L2_268.KnockBackStart.z + L2_268.InterpDelta.z * L4_270
  SetPosition(L3_269, L5_271)
end
BBKnockback = L0_0
function L0_0(A0_272, A1_273)
  local L2_274, L3_275
  L2_274 = GetParam
  L3_275 = "Left"
  L2_274 = L2_274(L3_275, A0_272, A1_273)
  L3_275 = GetParam
  L3_275 = L3_275("Right", A0_272, A1_273)
  GetTable(A0_272, A1_273.DestVarTable, true)[A1_273.DestVar] = tostring(L2_274) .. tostring(L3_275)
end
BBAppendString = L0_0
function L0_0(A0_276, A1_277)
  local L2_278
  L2_278 = 0
  if A1_277.Delta ~= nil then
    L2_278 = L2_278 + A1_277.Delta
  end
  if A1_277.DeltaByLevel ~= nil and A0_276.Level ~= nil then
    L2_278 = L2_278 + A1_277.DeltaByLevel[A0_276.Level]
  end
  if A1_277.DeltaVar ~= nil then
    L2_278 = L2_278 + GetTable(A0_276, A1_277.DeltaVarTable, true)[A1_277.DeltaVar]
  end
  if A1_277.TargetVar ~= nil then
    A1_277.Stat(L2_278, A0_276[A1_277.TargetVar])
  else
    A1_277.Stat(L2_278)
  end
end
BBIncStat = L0_0
function L0_0(A0_279, A1_280)
  local L2_281
  L2_281 = 0
  if A1_280.Delta ~= nil then
    L2_281 = L2_281 + A1_280.Delta
  end
  if A1_280.DeltaByLevel ~= nil and A0_279.Level ~= nil then
    L2_281 = L2_281 + A1_280.DeltaByLevel[A0_279.Level]
  end
  if A1_280.DeltaVar ~= nil then
    L2_281 = L2_281 + GetTable(A0_279, A1_280.DeltaVarTable, true)[A1_280.DeltaVar]
  end
  if A1_280.TargetVar ~= nil then
    A1_280.Stat(L2_281, A0_279[A1_280.TargetVar])
  else
    A1_280.Stat(L2_281)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_282, A1_283)
  if A1_283.AttackVar ~= nil then
  end
  if A1_283.Attack ~= nil then
  end
  if A1_283.TotalCoefficientVar ~= nil then
  end
  if A1_283.TotalCoefficient ~= nil then
  end
  if A1_283.TargetVar ~= nil then
    GetTable(A0_282, A1_283.DestVarTable, false)[A1_283.DestVar] = (0 + GetTable(A0_282, A1_283.AttackVarTable, true)[A1_283.AttackVar] + A1_283.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_282[A1_283.TargetVar])) + GetFlatCritDamageMod(A0_282[A1_283.TargetVar])) * (0 + GetTable(A0_282, A1_283.TotalCoefficientVarTable, true)[A1_283.TotalCoefficientVar] + A1_283.TotalCoefficient)
  else
    GetTable(A0_282, A1_283.DestVarTable, false)[A1_283.DestVar] = 2 * A1_283.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_284, A1_285)
  if A1_285.CDVar ~= nil then
  end
  if A1_285.CD ~= nil then
  end
  if A1_285.TargetVar ~= nil then
    GetTable(A0_284, A1_285.DestVarTable, false)[A1_285.DestVar] = (0 + GetTable(A0_284, A1_285.CDVarTable, true)[A1_285.CDVar] + A1_285.CD) * (1 + GetPercentCooldownMod(A0_284[A1_285.TargetVar]))
  else
    GetTable(A0_284, A1_285.DestVarTable, false)[A1_285.DestVar] = A1_285.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_286, A1_287)
  if A1_287.TargetVar ~= nil then
    GetTable(A0_286, A1_287.DestVarTable, false)[A1_287.DestVar] = A1_287.Stat(A0_286[A1_287.TargetVar])
  else
    GetTable(A0_286, A1_287.DestVarTable, false)[A1_287.DestVar] = A1_287.Stat()
  end
end
BBGetStat = L0_0
function L0_0(A0_288, A1_289)
  if A1_289.TargetVar ~= nil then
    GetTable(A0_288, A1_289.DestVarTable, false)[A1_289.DestVar] = GetLevel(A0_288[A1_289.TargetVar])
  else
    GetTable(A0_288, A1_289.DestVarTable, false)[A1_289.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_290, A1_291)
  if A1_291.TargetVar ~= nil then
    GetTable(A0_290, A1_291.DestVarTable, false)[A1_291.DestVar] = GetUnitSignificance(A0_290[A1_291.TargetVar])
  else
    GetTable(A0_290, A1_291.DestVarTable, false)[A1_291.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_292, A1_293)
  if A1_293.TargetVar ~= nil then
    GetTable(A0_292, A1_293.DestVarTable, false)[A1_293.DestVar] = GetArmor(A0_292[A1_293.TargetVar])
  else
    GetTable(A0_292, A1_293.DestVarTable, false)[A1_293.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_294, A1_295)
  if A1_295.TargetVar ~= nil then
    GetTable(A0_294, A1_295.DestVarTable, false)[A1_295.DestVar] = GetSpellBlock(A0_294[A1_295.TargetVar])
  else
    GetTable(A0_294, A1_295.DestVarTable, false)[A1_295.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_296, A1_297)
  if A1_297.TargetVar ~= nil then
    GetTable(A0_296, A1_297.DestVarTable, false)[A1_297.DestVar] = GetTeamID(A0_296[A1_297.TargetVar])
  else
    GetTable(A0_296, A1_297.DestVarTable, false)[A1_297.DestVar] = GetTeamID()
  end
end
BBGetTeamID = L0_0
function L0_0(A0_298, A1_299)
  local L2_300, L3_301, L4_302
  L2_300 = GetTable
  L3_301 = A0_298
  L4_302 = A1_299.DestVarTable
  L2_300 = L2_300(L3_301, L4_302, false)
  L3_301 = A1_299.TargetVar
  L4_302 = nil
  if L3_301 ~= nil then
    L4_302 = GetTeamID(A0_298[L3_301])
  else
    L4_302 = GetTeamID()
  end
  if L4_302 == TEAM_ORDER then
    L2_300[A1_299.DestVar] = TEAM_CHAOS
  elseif L4_302 == TEAM_CHAOS then
    L2_300[A1_299.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_303, A1_304)
  if A1_304.TargetVar ~= nil then
    GetTable(A0_303, A1_304.DestVarTable, false)[A1_304.DestVar] = GetUnitSkinName(A0_303[A1_304.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_305, A1_306)
  if A1_306.TargetVar ~= nil then
    GetTable(A0_305, A1_306.DestVarTable, false)[A1_306.DestVar] = GetTotalAttackDamage(A0_305[A1_306.TargetVar])
  else
    GetTable(A0_305, A1_306.DestVarTable, false)[A1_306.DestVar] = GetTotalAttackDamage()
  end
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_307, A1_308)
  GetTable(A0_307, A1_308.DestVarTable, true)[A1_308.DestVar] = A1_308.Status(A0_307[A1_308.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_309, A1_310)
  local L2_311
  L2_311 = A1_310.TargetVar
  L2_311 = A0_309[L2_311]
  ClearAttackTarget(L2_311)
end
BBClearAttackTarget = L0_0
function L0_0(A0_312, A1_313)
  GetTable(A0_312, A1_313.DestVarTable, true)[A1_313.DestVar] = A1_313.Info(A0_312[A1_313.TargetVar])
end
BBGetCastInfo = L0_0
function L0_0(A0_314, A1_315, A2_316)
  local L3_317, L4_318, L5_319, L6_320
  L3_317 = GetTable
  L4_318 = A0_314
  L5_319 = A1_315.TrackTimeVarTable
  L6_320 = false
  L3_317 = L3_317(L4_318, L5_319, L6_320)
  L4_318 = GetTime
  L4_318 = L4_318()
  L5_319 = A1_315.ExecuteImmediately
  L6_320 = A1_315.TimeBetweenExecutions
  if A1_315.TickTimeVar ~= nil and GetTable(A0_314, A1_315.TickTimeVarTable, false)[A1_315.TickTimeVar] ~= nil then
    L6_320 = GetTable(A0_314, A1_315.TickTimeVarTable, false)[A1_315.TickTimeVar]
  end
  if L3_317[A1_315.TrackTimeVar] == nil then
    L3_317[A1_315.TrackTimeVar] = L4_318
    if L5_319 == true then
      ExecuteBuildingBlocks(A2_316, A0_314)
    end
  end
  if L4_318 >= L3_317[A1_315.TrackTimeVar] + L6_320 then
    L3_317[A1_315.TrackTimeVar] = L3_317[A1_315.TrackTimeVar] + L6_320
    ExecuteBuildingBlocks(A2_316, A0_314)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_321, A1_322, A2_323)
  GetTable(A0_321, A1_322.TrackTimeVarTable, false)[A1_322.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_324, A1_325)
  local L2_326
  L2_326 = A1_325.SrcValue
  if A1_325.SrcVar ~= nil then
    L2_326 = GetTable(A0_324, A1_325.SrcVarTable, true)[A1_325.SrcVar]
  end
  A1_325.Status(A0_324[A1_325.TargetVar], L2_326)
end
BBSetStatus = L0_0
function L0_0(A0_327, A1_328)
  local L2_329
  L2_329 = A1_328.ToAlert
  if GetTable(A0_327, A1_328.SrcVarTable, false) ~= nil and A1_328.SrcVar ~= nil then
    L2_329 = L2_329 .. GetTable(A0_327, A1_328.SrcVarTable, false)[A1_328.SrcVar]
  end
  _ALERT(L2_329)
end
BBAlert = L0_0
function L0_0(A0_330, A1_331)
  local L2_332, L3_333, L4_334
  L2_332 = A1_331.ToSay
  L3_333 = GetTable
  L4_334 = A0_330
  L3_333 = L3_333(L4_334, A1_331.SrcVarTable, false)
  if L3_333 ~= nil then
    L4_334 = A1_331.SrcVar
    if L4_334 ~= nil then
      L4_334 = L2_332
      L2_332 = L4_334 .. tostring(L3_333[A1_331.SrcVar])
    end
  end
  L4_334 = nil
  if A1_331.OwnerVar ~= nil then
    L4_334 = A0_330[A1_331.OwnerVar]
  else
    L4_334 = A0_330.Owner
  end
  if A1_331.TextType == nil then
    A1_331.TextType = 0
  end
  Say(L4_334, L2_332, A1_331.TextType)
end
BBSay = L0_0
function L0_0(A0_335, A1_336)
  local L2_337, L3_338, L4_339
  L2_337 = A1_336.ToSay
  L3_338 = GetTable
  L4_339 = A0_335
  L3_338 = L3_338(L4_339, A1_336.SrcVarTable, false)
  if L3_338 ~= nil then
    L4_339 = A1_336.SrcVar
    if L4_339 ~= nil then
      L4_339 = L2_337
      L2_337 = L4_339 .. tostring(L3_338[A1_336.SrcVar])
    end
  end
  L4_339 = nil
  if A1_336.OwnerVar ~= nil then
    L4_339 = A0_335[A1_336.OwnerVar]
  else
    L4_339 = A0_335.Owner
  end
  if A1_336.TextType == nil then
    A1_336.TextType = 0
  end
  Say(L4_339, L2_337, A1_336.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_340, A1_341)
  GetTable(A0_340, A1_341.DestVarTable, true)[A1_341.DestVar] = BBLuaGetGold(A0_340, A1_341)
end
BBGetGold = L0_0
function L0_0(A0_342, A1_343)
  GetTable(A0_342, A1_343.DestVarTable, true)[A1_343.DestVar] = BBLuaGetTotalGold(A0_342, A1_343)
end
BBGetTotalGold = L0_0
function L0_0(A0_344, A1_345)
  SpellBuffAdd(A0_344[A1_345.OwnerVar], A0_344[A1_345.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_344.NextBuffVars)
  BBTeleportToPositionHelper(A0_344, A1_345)
end
BBTeleportToPosition = L0_0
function L0_0(A0_346, A1_347)
  if A1_347.XVar ~= nil and GetTable(A0_346, A1_347.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_346, A1_347.XVarTable, true)[A1_347.XVar]
  else
    Xloc = A1_347.X
  end
  if A1_347.YVar ~= nil and GetTable(A0_346, A1_347.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_346, A1_347.YVarTable, true)[A1_347.YVar]
  else
    Yloc = A1_347.Y
  end
  if A1_347.ZVar ~= nil and GetTable(A0_346, A1_347.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_346, A1_347.ZVarTable, true)[A1_347.ZVar]
  else
    Zloc = A1_347.Z
  end
  A1_347.OwnerVar, A0_346.position = A1_347.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_347.CastPositionName = "position"
  BBTeleportToPosition(A0_346, A1_347)
end
BBTeleportToPoint = L0_0
function L0_0(A0_348, A1_349)
  DefUpdateAura(GetTable(A0_348, A1_349.CenterTable, false)[A1_349.CenterVar], A1_349.Range, A1_349.UnitScan, A1_349.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_350, A1_351)
  ReincarnateNonDeadHero(GetTable(A0_350, A1_351.TargetTable, false)[A1_351.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_352, A1_353)
  GetTable(A0_352, A1_353.DestVarTable, true)[A1_353.DestVar] = A1_353.Function(A0_352[A1_353.OwnerVar], A1_353.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_354, A1_355)
  local L2_356, L3_357, L4_358, L5_359
  L2_356 = A1_355.WhomToOrderVar
  L2_356 = A0_354[L2_356]
  L3_357 = A1_355.TargetOfOrderVar
  L3_357 = A0_354[L3_357]
  L4_358 = GetTable
  L5_359 = A0_354
  L4_358 = L4_358(L5_359, A1_355.SrcVarTable, false)
  L5_359 = nil
  if A1_355.SrcVar ~= nil and L4_358 ~= nil then
    L5_359 = L4_358[A1_355.SrcVar]
  else
    L5_359 = GetPosition(L3_357)
  end
  if L3_357 == nil then
    L3_357 = L2_356
  end
  IssueOrder(L2_356, A1_355.Order, L5_359, L3_357)
end
BBIssueOrder = L0_0
function L0_0(A0_360, A1_361)
  local L2_362
  L2_362 = GetParam
  L2_362 = L2_362("NewRange", A0_360, A1_361)
  SetSpellCastRange(L2_362)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_363, A1_364)
  GetTable(A0_363, A1_364.DestVarTable, true)[A1_364.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_365, A1_366)
  local L2_367, L3_368
  L2_367 = A1_366.ObjectVar1
  L2_367 = A0_365[L2_367]
  L3_368 = A1_366.ObjectVar2
  L3_368 = A0_365[L3_368]
  GetTable(A0_365, A1_366.DestVarTable, true)[A1_366.DestVar] = DistanceBetweenObjectBounds(L2_367, L3_368)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_369, A1_370)
  local L2_371, L3_372, L4_373
  L2_371 = A1_370.ObjectVar
  L2_371 = A0_369[L2_371]
  L3_372 = GetTable
  L4_373 = A0_369
  L3_372 = L3_372(L4_373, A1_370.PointVarTable, true)
  L4_373 = A1_370.PointVar
  L4_373 = L3_372[L4_373]
  GetTable(A0_369, A1_370.DestVarTable, true)[A1_370.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_371, L4_373)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_374, A1_375)
  local L2_376, L3_377
  L2_376 = GetParam
  L3_377 = "Point1"
  L2_376 = L2_376(L3_377, A0_374, A1_375)
  L3_377 = GetParam
  L3_377 = L3_377("Point2", A0_374, A1_375)
  GetTable(A0_374, A1_375.DestVarTable, true)[A1_375.DestVar] = DistanceBetweenPoints(L2_376, L3_377)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_378, A1_379, A2_380)
  local L3_381, L4_382, L5_383, L6_384, L7_385, L8_386
  L5_383 = 0
  L6_384 = nil
  L7_385 = A1_379.ObjectDistanceType
  L8_386 = A1_379.ObjectVar1
  L3_381 = A0_378[L8_386]
  L8_386 = A1_379.ObjectVar2
  L4_382 = A0_378[L8_386]
  if nil == L4_382 then
    L8_386 = A1_379.Point2Var
    if nil ~= L8_386 then
      L8_386 = GetTable
      L8_386 = L8_386(A0_378, A1_379.Point2VarTable, true)
      L4_382 = L8_386[A1_379.Point2Var]
      L5_383 = L5_383 + 1
    end
  end
  if nil == L3_381 then
    L8_386 = A1_379.Point1Var
    if nil ~= L8_386 then
      L8_386 = GetTable
      L8_386 = L8_386(A0_378, A1_379.Point1VarTable, true)
      L3_381 = L8_386[A1_379.Point1Var]
      L5_383 = L5_383 + 1
      if 1 == L5_383 then
        L3_381, L4_382 = L4_382, L3_381
      end
    end
  end
  if nil ~= L7_385 then
    if 0 == L5_383 then
      L8_386 = OBJECT_CENTER
      if L8_386 == L7_385 then
        L6_384 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_386 = OBJECT_BOUNDARY
        if L8_386 == L7_385 then
          L6_384 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_386 = A1_379.OwnerVar
          L8_386 = A0_378[L8_386]
          Say(L8_386, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_383 then
      L8_386 = OBJECT_CENTER
      if L8_386 == L7_385 then
        L6_384 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_386 = OBJECT_BOUNDARY
        if L8_386 == L7_385 then
          L6_384 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_386 = A1_379.OwnerVar
          L8_386 = A0_378[L8_386]
          Say(L8_386, "invalid object distance type", 0)
        end
      end
    else
      L6_384 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_386 = A1_379.Distance
  if A1_379.DistanceVar ~= nil and GetTable(A0_378, A1_379.DistanceVarTable, true) ~= nil then
    L8_386 = L8_386 + GetTable(A0_378, A1_379.DistanceVarTable, true)[A1_379.DistanceVar]
  end
  if L3_381 ~= nil and L4_382 ~= nil and L6_384 ~= nil and L8_386 ~= nil then
    if not L6_384(L3_381, L4_382, L8_386) then
      ExecuteBuildingBlocks(A2_380, A0_378)
      A0_378.LastIfSucceeded = true
    else
      A0_378.LastIfSucceeded = false
    end
  else
    A0_378.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_387, A1_388)
  local L2_389, L3_390
  L2_389 = A1_388.TargetVar
  L2_389 = A0_387[L2_389]
  L3_390 = A1_388.CasterVar
  L3_390 = A0_387[L3_390]
  GetTable(A0_387, A1_388.DestVarTable, true)[A1_388.DestVar] = SpellBuffCount(L2_389, A1_388.BuffName, L3_390)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_391, A1_392)
  local L2_393
  L2_393 = A1_392.TargetVar
  L2_393 = A0_391[L2_393]
  GetTable(A0_391, A1_392.DestVarTable, true)[A1_392.DestVar] = SpellBuffCount(L2_393, A1_392.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_394, A1_395)
  local L2_396, L3_397
  L2_396 = GetTable
  L3_397 = A0_394
  L2_396 = L2_396(L3_397, A1_395.ScaleVarTable, false)
  L3_397 = nil
  if A1_395.OwnerVar ~= nil then
    L3_397 = A0_394[A1_395.OwnerVar]
  else
    L3_397 = A0_394.Owner
  end
  if A1_395.ScaleVar ~= nil and A1_395.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_396[A1_395.ScaleVar], L3_397)
  else
    SetScaleSkinCoef(A1_395.Scale, L3_397)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_398, A1_399)
  SpellBuffAdd(A0_398[A1_399.TargetVar], A0_398[A1_399.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_398.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_400, A1_401, A2_402)
  local L3_403, L4_404
  L3_403 = A1_401.TargetVar
  L3_403 = A0_400[L3_403]
  L4_404 = A1_401.NumStacks
  if GetParam("NumStacks", A0_400, A1_401) == 0 then
    L4_404 = SpellBuffCount(L3_403, A1_401.BuffName, caster)
  else
    L4_404 = GetParam("NumStacks", A0_400, A1_401)
  end
  while L4_404 > 0 do
    SpellBuffRemove(L3_403, A1_401.BuffName, A0_400[A1_401.AttackerVar])
    L4_404 = L4_404 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_405, A1_406, A2_407)
  if A0_405.EmoteId == A1_406.EmoteId then
    ExecuteBuildingBlocks(A2_407, A0_405)
    A0_405.LastIfSucceeded = true
  else
    A0_405.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_408, A1_409, A2_410)
  if A0_408.EmoteId ~= A1_409.EmoteId then
    ExecuteBuildingBlocks(A2_410, A0_408)
    A0_408.LastIfSucceeded = true
  else
    A0_408.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_411, A1_412)
  local L2_413, L3_414, L4_415, L5_416
  L2_413 = GetTable
  L3_414 = A0_411
  L4_415 = A1_412.String1VarTable
  L5_416 = false
  L2_413 = L2_413(L3_414, L4_415, L5_416)
  L3_414 = A1_412.String1Var
  L3_414 = L2_413[L3_414]
  L4_415 = GetTable
  L5_416 = A0_411
  L4_415 = L4_415(L5_416, A1_412.String2VarTable, false)
  L5_416 = A1_412.String2Var
  L5_416 = L4_415[L5_416]
  GetTable(A0_411, A1_412.ResultVarTable, false)[A1_412.ResultVar] = L3_414 .. L5_416
end
BBConcatenateStrings = L0_0
