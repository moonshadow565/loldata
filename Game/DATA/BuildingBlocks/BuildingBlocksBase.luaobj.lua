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
function L0_0(A0_15, A1_16)
  local L2_17, L3_18
  L2_17 = GetParam
  L3_18 = "Required"
  L2_17 = L2_17(L3_18, A0_15, A1_16)
  L3_18 = gDebugMode
  if L3_18 ~= nil and L2_17 == nil then
    L3_18 = ALREADY_WARNED
    L3_18 = L3_18[A1_16.RequiredVar]
    if L3_18 == nil then
      L3_18 = A1_16.RequiredVar
      if L3_18 ~= nil then
        L3_18 = A1_16.RequiredVarTable
        if L3_18 == nil then
          L3_18 = "PassThroughParams"
        end
        DebugClientPrint("Missing Required Variable: " .. L3_18 .. "." .. A1_16.RequiredVar .. " Current block data is: " .. tostring(gCurrentBuildingBlockString))
        ALREADY_WARNED[A1_16.RequiredVar] = true
      end
    end
  end
end
BBRequireVar = L0_0
L0_0 = {}
ALREADY_WARNED = L0_0
function L0_0(A0_19, A1_20, A2_21)
  ExecuteBuildingBlocks(A2_21, A0_19)
end
BBCom = L0_0
function L0_0(A0_22, A1_23, A2_24)
  if A1_23.IsConditionTrue(A0_22) then
    ExecuteBuildingBlocks(A2_24, A0_22)
  end
end
BBConditionallyExecute = L0_0
function L0_0(A0_25, A1_26)
  local L2_27, L3_28
  L2_27 = GetTable
  L3_28 = A0_25
  L2_27 = L2_27(L3_28, A1_26.SrcVarTable, false)
  L3_28 = A1_26.ToSay
  L3_28 = L3_28 or ""
  ClientPrint(tostring(L3_28) .. ": " .. type(L2_27[A1_26.SrcVar]))
end
BBPrintTypeToChat = L0_0
function L0_0(A0_29, A1_30)
  local L2_31, L3_32, L4_33, L5_34, L6_35
  L2_31 = A1_30.ToSay
  L2_31 = L2_31 or ""
  L3_32 = A1_30.Color
  L3_32 = L3_32 or "FFFFFF"
  L4_33 = GetTable
  L5_34 = A0_29
  L6_35 = A1_30.SrcVarTable
  L4_33 = L4_33(L5_34, L6_35, false)
  L5_34 = A1_30.SrcVar
  L5_34 = L4_33[L5_34]
  L6_35 = "<font color=\""
  L6_35 = L6_35 .. L3_32 .. "\">"
  if L2_31 == "" then
    if A1_30.SrcVarTable ~= nil then
      L6_35 = L6_35 .. A1_30.SrcVarTable .. "." .. (A1_30.SrcVar or "")
    else
      L6_35 = L6_35 .. (A1_30.SrcVar or "")
    end
  else
    L6_35 = L6_35 .. L2_31
  end
  if type(L5_34) ~= "table" and type(L5_34) ~= "nil" then
    L6_35 = L6_35 .. " " .. tostring(L5_34)
  end
  L6_35 = L6_35 .. "</font>"
  ClientPrint(L6_35)
  if type(L5_34) == "table" then
    PrintTableToChat(L5_34)
  end
end
BBPrintToChat = L0_0
function L0_0(A0_36, A1_37)
  local L2_38, L3_39
  L2_38 = GetTable
  L3_39 = A0_36
  L2_38 = L2_38(L3_39, A1_37.TableName, true)
  L3_39 = A1_37.TableName
  L3_39 = L3_39 or "PassThroughParams"
  ClientPrint(L3_39)
  PrintTableToChat(L2_38)
end
BBPrintTableToChat = L0_0
function L0_0(A0_40, A1_41)
  local L2_42, L3_43, L4_44, L5_45, L6_46, L7_47, L8_48, L9_49, L10_50, L11_51, L12_52, L13_53
  A1_41 = A1_41 or 0
  if A1_41 > 10 then
    return
  end
  L2_42 = nil
  L3_43 = "|"
  for L7_47 = 1, A1_41 do
    L9_49 = "----"
    L3_43 = L8_48 .. L9_49
  end
  L6_46(L7_47)
  for L9_49, L10_50 in L6_46(L7_47) do
    L11_51 = nil
    L12_52 = tostring
    L13_53 = L9_49
    L12_52 = L12_52(L13_53)
    if L12_52 == "PassThroughParams" then
      L11_51 = "{{ PassThroughParams }}"
    else
      L13_53 = type
      L13_53 = L13_53(L10_50)
      if L13_53 == "table" then
        L11_51 = "Table"
      else
        L13_53 = tostring
        L13_53 = L13_53(L10_50)
        L11_51 = L13_53
      end
    end
    L13_53 = L3_43
    L13_53 = L13_53 .. L12_52 .. ": " .. L11_51
    ClientPrint(L13_53)
    if type(L10_50) == "table" then
      PrintTableToChat(L10_50, A1_41 + 1)
    end
  end
  L6_46(L7_47)
end
PrintTableToChat = L0_0
function L0_0(A0_54, A1_55)
end
BBDebugPrintToChat = L0_0
function L0_0(A0_56, A1_57)
  local L2_58, L3_59
  L2_58 = GetTable
  L3_59 = A0_56
  L2_58 = L2_58(L3_59, A1_57.TableName, true)
  L3_59 = A1_57.TableName
  L3_59 = L3_59 or "PassThroughParams"
  DebugClientPrint(L3_59)
  DebugPrintTableToChat(L2_58)
end
BBDebugPrintTableToChat = L0_0
function L0_0(A0_60, A1_61)
  local L2_62, L3_63, L4_64, L5_65, L6_66, L7_67, L8_68, L9_69, L10_70, L11_71, L12_72, L13_73
  A1_61 = A1_61 or 0
  if A1_61 > 10 then
    return
  end
  L2_62 = nil
  L3_63 = "|"
  for L7_67 = 1, A1_61 do
    L9_69 = "----"
    L3_63 = L8_68 .. L9_69
  end
  L6_66(L7_67)
  for L9_69, L10_70 in L6_66(L7_67) do
    L11_71 = nil
    L12_72 = tostring
    L13_73 = L9_69
    L12_72 = L12_72(L13_73)
    if L12_72 == "PassThroughParams" then
      L11_71 = "{{ PassThroughParams }}"
    else
      L13_73 = type
      L13_73 = L13_73(L10_70)
      if L13_73 == "table" then
        L11_71 = "Table"
      else
        L13_73 = tostring
        L13_73 = L13_73(L10_70)
        L11_71 = L13_73
      end
    end
    L13_73 = L3_63
    L13_73 = L13_73 .. L12_72 .. ": " .. L11_71
    DebugClientPrint(L13_73)
    if type(L10_70) == "table" then
      DebugPrintTableToChat(L10_70, A1_61 + 1)
    end
  end
  L6_66(L7_67)
end
DebugPrintTableToChat = L0_0
function L0_0(A0_74, A1_75, A2_76)
  local L3_77
  if A1_75 ~= nil then
    L3_77 = A0_74[A1_75]
    if L3_77 == nil and A2_76 then
      A0_74[A1_75] = {}
      return A0_74[A1_75]
    end
  end
  if L3_77 == nil then
    L3_77 = A0_74
  end
  return L3_77
end
GetTable = L0_0
function L0_0(A0_78, A1_79, A2_80)
  if A2_80[A0_78 .. "Var"] ~= nil and GetTable(A1_79, A2_80[A0_78 .. "VarTable"], false) ~= nil then
    return GetTable(A1_79, A2_80[A0_78 .. "VarTable"], false)[A2_80[A0_78 .. "Var"]]
  else
    return A2_80[A0_78]
  end
end
GetParam = L0_0
function L0_0(A0_81, A1_82)
  GetTable(A0_81, A1_82.DestVarTable, true)[A1_82.DestVar] = {}
end
BBCreateCustomTable = L0_0
function L0_0(A0_83, A1_84)
  GetTable(A0_83, A1_84.TableNameVarTable, false)[A1_84.TableNameVar] = nil
end
BBDestroyCustomTable = L0_0
function L0_0(A0_85, A1_86)
  if type(GetTable(A0_85, A1_86.DestTableVarTable, false)[A1_86.DestTableVar]) == "nil" then
    GetTable(A0_85, A1_86.DestTableVarTable, false)[A1_86.DestTableVar] = {}
  end
  if type(GetTable(A0_85, A1_86.DestTableVarTable, false)[A1_86.DestTableVar]) == "table" then
    GetTable(A0_85, A1_86.DestTableVarTable, false)[A1_86.DestTableVar][GetParam("Key", A0_85, A1_86)] = GetParam("Value", A0_85, A1_86)
  end
end
BBSetKeyValueInCustomTable = L0_0
function L0_0(A0_87, A1_88)
  if type(GetTable(A0_87, A1_88.SrcTableVarTable, false)[A1_88.SrcTableVar]) == "table" then
    GetTable(A0_87, A1_88.DestVarTable, true)[A1_88.DestVar] = GetTable(A0_87, A1_88.SrcTableVarTable, false)[A1_88.SrcTableVar][GetParam("SrcKey", A0_87, A1_88)]
  end
end
BBGetKeyValueInCustomTable = L0_0
function L0_0(A0_89, A1_90)
  local L2_91, L3_92, L4_93
  L2_91 = GetTable
  L3_92 = A0_89
  L4_93 = A1_90.DestTableVarTable
  L2_91 = L2_91(L3_92, L4_93, false)
  L3_92 = GetParam
  L4_93 = "DestIndex"
  L3_92 = L3_92(L4_93, A0_89, A1_90)
  L4_93 = GetParam
  L4_93 = L4_93("Value", A0_89, A1_90)
  if type(L2_91[A1_90.DestTableVar]) == "nil" then
    L2_91[A1_90.DestTableVar] = {}
  end
  if type(L2_91[A1_90.DestTableVar]) == "table" then
    if L3_92 then
      table.insert(L2_91[A1_90.DestTableVar], L3_92, L4_93)
      if A1_90.OutIndexVar then
        GetTable(A0_89, A1_90.OutIndexVarTable, true)[A1_90.OutIndexVar] = L3_92
      end
    else
      table.insert(L2_91[A1_90.DestTableVar], L4_93)
      if A1_90.OutIndexVar then
        GetTable(A0_89, A1_90.OutIndexVarTable, true)[A1_90.OutIndexVar] = table.getn(L2_91[A1_90.DestTableVar])
      end
    end
  end
end
BBInsertIntoInCustomTable = L0_0
function L0_0(A0_94, A1_95)
  local L2_96, L3_97
  L2_96 = GetTable
  L3_97 = A0_94
  L2_96 = L2_96(L3_97, A1_95.TableVarTable, false)
  L3_97 = GetParam
  L3_97 = L3_97("Index", A0_94, A1_95)
  if type(L2_96[A1_95.TableVar]) == "nil" then
    DebugClientPrint("Table specified does not exist: " .. tostring(A1_95.TableVarTable) .. "." .. tostring(A1_95.TableVar))
    return
  end
  if type(L2_96[A1_95.TableVar]) == "table" then
    if GetParam("Key", A0_94, A1_95) then
      L2_96[A1_95.TableVar][GetParam("Key", A0_94, A1_95)] = nil
    elseif L3_97 then
      table.remove(L2_96[A1_95.TableVar], L3_97)
    else
      DebugClientPrint("Specified index/key was nil: " .. tostring(A1_95.IndexVarTable) .. "." .. tostring(A1_95.IndexVar))
    end
  end
end
BBRemoveFromCustomTable = L0_0
function L0_0(A0_98, A1_99, A2_100)
  local L3_101, L4_102, L5_103, L6_104, L7_105, L8_106
  L3_101 = GetTable
  L3_101 = L3_101(L4_102, L5_103, L6_104)
  if L4_102 == "table" then
    if L4_102 then
      for L8_106, _FORV_9_ in L5_103(L6_104) do
        table.insert(L4_102, L8_106)
      end
      L5_103(L6_104)
      for L8_106, _FORV_9_ in L5_103(L6_104) do
        GetTable(A0_98, A1_99.DestKeyVarTable, true)[A1_99.DestKeyVar] = _FORV_9_
        GetTable(A0_98, A1_99.DestValueVarTable, true)[A1_99.DestValueVar] = L3_101[A1_99.TableVar][_FORV_9_]
        ExecuteBuildingBlocks(A2_100, A0_98)
      end
    else
      for L7_105, L8_106 in L4_102(L5_103) do
        GetTable(A0_98, A1_99.DestKeyVarTable, true)[A1_99.DestKeyVar] = L7_105
        GetTable(A0_98, A1_99.DestValueVarTable, true)[A1_99.DestValueVar] = L8_106
        ExecuteBuildingBlocks(A2_100, A0_98)
      end
    end
  end
end
BBForEachInCustomTable = L0_0
function L0_0(A0_107, A1_108)
  local L2_109, L3_110, L4_111, L5_112, L6_113
  L2_109 = GetTable
  L3_110 = A0_107
  L4_111 = A1_108.SrcTableVarTable
  L5_112 = false
  L2_109 = L2_109(L3_110, L4_111, L5_112)
  L3_110 = GetParam
  L4_111 = "Value"
  L5_112 = A0_107
  L6_113 = A1_108
  L3_110 = L3_110(L4_111, L5_112, L6_113)
  L4_111 = GetTable
  L5_112 = A0_107
  L6_113 = A1_108.MatchingKeyVarTable
  L4_111 = L4_111(L5_112, L6_113, false)
  L5_112 = GetTable
  L6_113 = A0_107
  L5_112 = L5_112(L6_113, A1_108.WasFoundVarTable, false)
  L6_113 = A1_108.WasFoundVar
  L5_112[L6_113] = false
  L6_113 = type
  L6_113 = L6_113(L2_109[A1_108.SrcTableVar])
  if L6_113 == "table" then
    L6_113 = GetTable
    L6_113 = L6_113(A0_107, A1_108.DestVarTable, true)
    for _FORV_10_, _FORV_11_ in pairs(L6_113) do
      if _FORV_11_ == L3_110 then
        L5_112[A1_108.WasFoundVar] = true
        L4_111[A1_108.MatchingKeyVar] = _FORV_10_
      end
    end
  end
end
BBCustomTableContainsValue = L0_0
function L0_0(A0_114, A1_115, A2_116)
  for _FORV_9_, _FORV_10_ in pairs(GetTable(A0_114, A1_115.TableVarTable, false)[A1_115.TableVar]) do
  end
  GetTable(A0_114, A1_115.SizeVarTable, false)[A1_115.SizeVar] = 0 + 1
end
BBGetSizeOfCustomTable = L0_0
function L0_0(A0_117, A1_118)
  local L2_119, L3_120, L4_121, L5_122, L6_123, L7_124, L8_125
  L2_119 = GetParam
  L3_120 = "X"
  L4_121 = A0_117
  L5_122 = A1_118
  L2_119 = L2_119(L3_120, L4_121, L5_122)
  L3_120 = GetParam
  L4_121 = "Z"
  L5_122 = A0_117
  L6_123 = A1_118
  L3_120 = L3_120(L4_121, L5_122, L6_123)
  L4_121 = 2
  L5_122 = 1
  L6_123 = 0
  L7_124 = 4
  L8_125 = 3
  if L3_120 > 12250 then
  elseif L3_120 < 2650 then
  elseif L2_119 > 12250 then
  elseif L2_119 < 2650 then
  elseif L3_120 - L2_119 > 4500 then
  else
  end
  if L3_120 > 13000 then
  elseif L3_120 < 1800 then
  elseif L2_119 > 13000 then
  elseif L2_119 < 1800 then
  elseif L3_120 - L2_119 > 1150 then
  else
  end
  GetTable(A0_117, A1_118.NearLaneVarTable, false)[A1_118.NearLaneVar] = L6_123
  GetTable(A0_117, A1_118.NearSectionVarTable, false)[A1_118.NearSectionVar] = L8_125
  GetTable(A0_117, A1_118.BlueSideVarTable, false)[A1_118.BlueSideVar] = false
end
BBGetLocationHints = L0_0
function L0_0(A0_126, A1_127)
  local L2_128, L3_129, L4_130, L5_131
  L2_128 = GetTable
  L3_129 = A0_126
  L4_130 = A1_127.DestVarTable
  L5_131 = true
  L2_128 = L2_128(L3_129, L4_130, L5_131)
  L3_129 = nil
  L4_130 = GetTable
  L5_131 = A0_126
  L4_130 = L4_130(L5_131, A1_127.SpellSlotVarTable, false)
  L5_131 = A1_127.SpellSlotVar
  if L5_131 ~= nil and L4_130 ~= nil then
    L5_131 = A1_127.SpellSlotVar
    L3_129 = L4_130[L5_131]
  else
    L3_129 = A1_127.SpellSlotValue
  end
  L5_131 = A1_127.Function
  L5_131 = L5_131(A0_126[A1_127.OwnerVar], L3_129, A1_127.SpellbookType, A1_127.SlotType)
  SetVarInTable(A0_126, A1_127, L5_131)
end
BBGetSlotSpellInfo = L0_0
function L0_0(A0_132, A1_133)
  local L2_134, L3_135, L4_136
  L2_134 = GetTable
  L3_135 = A0_132
  L4_136 = A1_133.SrcVarTable
  L2_134 = L2_134(L3_135, L4_136, false)
  L3_135 = nil
  L4_136 = A1_133.SrcVar
  if L4_136 ~= nil and L2_134 ~= nil then
    L4_136 = A1_133.SrcVar
    L3_135 = L2_134[L4_136]
  else
    L3_135 = A1_133.SrcValue
  end
  L4_136 = nil
  if A1_133.SpellSlotVar ~= nil and GetTable(A0_132, A1_133.SpellSlotVarTable, false) ~= nil then
    L4_136 = GetTable(A0_132, A1_133.SpellSlotVarTable, false)[A1_133.SpellSlotVar]
  else
    L4_136 = A1_133.SpellSlotValue
  end
  SetSlotSpellCooldownTime(A0_132[A1_133.OwnerVar], L4_136, A1_133.SpellbookType, A1_133.SlotType, L3_135)
end
BBSetSlotSpellCooldownTime = L0_0
function L0_0(A0_137, A1_138)
  if A0_137.Level ~= nil and A1_138.SrcValueByLevel ~= nil then
    A0_137.ReturnValue = A1_138.SrcValueByLevel[A0_137.Level]
  elseif A1_138.SrcVar ~= nil and GetTable(A0_137, A1_138.SrcVarTable, false) ~= nil then
    A0_137.ReturnValue = GetTable(A0_137, A1_138.SrcVarTable, false)[A1_138.SrcVar]
  else
    A0_137.ReturnValue = A1_138.SrcValue
  end
end
BBSetReturnValue = L0_0
function L0_0(A0_139, A1_140)
  if type(A0_139) == "string" and type(A1_140) == "string" then
    A0_139 = string.lower(A0_139)
    A1_140 = string.lower(A1_140)
  end
  return A0_139 == A1_140
end
CO_EQUAL = L0_0
function L0_0(A0_141, A1_142)
  if type(A0_141) == "string" and type(A1_142) == "string" then
    A0_141 = string.lower(A0_141)
    A1_142 = string.lower(A1_142)
  end
  return A0_141 ~= A1_142
end
CO_NOT_EQUAL = L0_0
function L0_0(A0_143, A1_144)
  local L2_145
  L2_145 = A0_143 < A1_144
  return L2_145
end
CO_LESS_THAN = L0_0
function L0_0(A0_146, A1_147)
  local L2_148
  L2_148 = A1_147 < A0_146
  return L2_148
end
CO_GREATER_THAN = L0_0
function L0_0(A0_149, A1_150)
  local L2_151
  L2_151 = A0_149 <= A1_150
  return L2_151
end
CO_LESS_THAN_OR_EQUAL = L0_0
function L0_0(A0_152, A1_153)
  local L2_154
  L2_154 = A1_153 <= A0_152
  return L2_154
end
CO_GREATER_THAN_OR_EQUAL = L0_0
function L0_0(A0_155, A1_156)
  return GetTeamID(A0_155) == GetTeamID(A1_156)
end
CO_SAME_TEAM = L0_0
function L0_0(A0_157, A1_158)
  return GetTeamID(A0_157) ~= GetTeamID(A1_158)
end
CO_DIFFERENT_TEAM = L0_0
function L0_0(A0_159, A1_160)
  return GetSourceType() == A1_160 or GetSourceType() == A0_159
end
CO_DAMAGE_SOURCETYPE_IS = L0_0
function L0_0(A0_161, A1_162)
  return GetSourceType() ~= A1_162 and GetSourceType() ~= A0_161
end
CO_DAMAGE_SOURCETYPE_IS_NOT = L0_0
function L0_0(A0_163)
  return IsObjectAI(A0_163)
end
CO_IS_TYPE_AI = L0_0
function L0_0(A0_164)
  return IsObjectAI(A0_164) ~= true
end
CO_IS_NOT_AI = L0_0
function L0_0(A0_165)
  return IsObjectHero(A0_165)
end
CO_IS_TYPE_HERO = L0_0
function L0_0(A0_166)
  return IsObjectHero(A0_166) ~= true
end
CO_IS_NOT_HERO = L0_0
function L0_0(A0_167)
  return IsClone(A0_167)
end
CO_IS_CLONE = L0_0
function L0_0(A0_168)
  return IsClone(A0_168) ~= true
end
CO_IS_NOT_CLONE = L0_0
function L0_0(A0_169)
  return IsMelee(A0_169)
end
CO_IS_MELEE = L0_0
function L0_0(A0_170)
  return IsMelee(A0_170) ~= true
end
CO_IS_RANGED = L0_0
function L0_0(A0_171)
  return A0_171 > math.random()
end
CO_RANDOM_CHANCE_LESS_THAN = L0_0
function L0_0(A0_172)
  return IsTurretAI(A0_172)
end
CO_IS_TYPE_TURRET = L0_0
function L0_0(A0_173)
  return IsTurretAI(A0_173) ~= true
end
CO_IS_NOT_TURRET = L0_0
function L0_0(A0_174)
  return IsDampener(A0_174)
end
CO_IS_TYPE_INHIBITOR = L0_0
function L0_0(A0_175)
  return IsDampener(A0_175) ~= true
end
CO_IS_NOT_INHIBITOR = L0_0
function L0_0(A0_176)
  return IsHQ(A0_176)
end
CO_IS_TYPE_NEXUS = L0_0
function L0_0(A0_177)
  return IsHQ(A0_177) ~= true
end
CO_IS_NOT_NEXUS = L0_0
function L0_0(A0_178)
  return IsDead(A0_178)
end
CO_IS_DEAD = L0_0
function L0_0(A0_179)
  return IsDead(A0_179) ~= true
end
CO_IS_NOT_DEAD = L0_0
function L0_0(A0_180)
  return IsDeadOrZombie(A0_180)
end
CO_IS_DEAD_OR_ZOMBIE = L0_0
function L0_0(A0_181, A1_182)
  return BBIsTargetInFrontOfMe(A0_181, A1_182)
end
CO_IS_TARGET_IN_FRONT_OF_ME = L0_0
function L0_0(A0_183, A1_184)
  return BBIsTargetBehindMe(A0_183, A1_184)
end
CO_IS_TARGET_BEHIND_ME = L0_0
function L0_0(A0_185)
  return IsWard(A0_185)
end
CO_IS_WARD = L0_0
function L0_0(A0_186)
  return IsStructure(A0_186)
end
CO_IS_STRUCTURE = L0_0
function L0_0(A0_187)
  return IsStructure(A0_187) ~= true
end
CO_IS_NOT_STRUCTURE = L0_0
function L0_0(A0_188)
  local L1_189
  L1_189 = A0_188 ~= nil
  return L1_189
end
CO_IS_NOT_NIL = L0_0
function L0_0(A0_190, A1_191, A2_192)
  GetTable(A0_190, A1_191.MacroVarTable, true)[A1_191.MacroVar] = A2_192
end
BBCreateMacro = L0_0
function L0_0(A0_193, A1_194)
  local L2_195
  L2_195 = GetParam
  L2_195 = L2_195("Macro", A0_193, A1_194)
  if L2_195 ~= nil and type(L2_195) == "table" then
    ExecuteBuildingBlocks(L2_195, A0_193)
  else
    DebugClientPrint("Designer Error: Macro variable is not initialized inside of event. Macro Variable was: " .. tostring(A1_194.MacroVar) .. " and current block data is: " .. gCurrentBuildingBlockString .. ". This error probably occurred due to variable not being initialized yet, being misnamed or two events being called out of sequence. It is highly recommended that script macros either be initialized OnBuffActivate, OnCharActivate or in the same event. Pro Devs may violate this rule at the risk of being forced to read this error message again.")
  end
end
BBRunMacro = L0_0
function L0_0(A0_196, A1_197, A2_198)
  local L3_199, L4_200, L5_201, L6_202
  L3_199 = GetTable
  L4_200 = A0_196
  L5_201 = A1_197.Src1VarTable
  L6_202 = false
  L3_199 = L3_199(L4_200, L5_201, L6_202)
  L4_200 = GetTable
  L5_201 = A0_196
  L6_202 = A1_197.Src2VarTable
  L4_200 = L4_200(L5_201, L6_202, false)
  L5_201 = false
  L6_202 = nil
  if L3_199 ~= nil and A1_197.Src1Var ~= nil then
    L6_202 = L3_199[A1_197.Src1Var]
  else
    L6_202 = A1_197.Value1
  end
  if L4_200 ~= nil and A1_197.Src2Var ~= nil then
    L5_201 = A1_197.CompareOp(L6_202, L4_200[A1_197.Src2Var])
  else
    L5_201 = A1_197.CompareOp(L6_202, A1_197.Value2)
  end
  if L5_201 then
    ExecuteBuildingBlocks(A2_198, A0_196)
    A0_196.LastIfSucceeded = true
  else
    A0_196.LastIfSucceeded = false
  end
end
BBIf = L0_0
function L0_0(A0_203, A1_204, A2_205)
  if A0_203.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_205, A0_203)
    A0_203.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_206, A1_207, A2_208)
  if A0_206.LastIfSucceeded == true then
    ExecuteBuildingBlocks(A2_208, A0_206)
    A0_206.LastIfSucceeded = true
  else
    BBIf(A0_206, A1_207, A2_208)
  end
end
BBOrIf = L0_0
function L0_0(A0_209, A1_210, A2_211)
  if A0_209.LastIfSucceeded == true then
    BBIf(A0_209, A1_210, A2_211)
  end
end
BBAndIf = L0_0
function L0_0(A0_212, A1_213, A2_214)
  local L3_215, L4_216, L5_217, L6_218
  L3_215 = A0_212.LastIfSucceeded
  if L3_215 == false then
    L3_215 = GetTable
    L4_216 = A0_212
    L5_217 = A1_213.Src1VarTable
    L6_218 = false
    L3_215 = L3_215(L4_216, L5_217, L6_218)
    L4_216 = GetTable
    L5_217 = A0_212
    L6_218 = A1_213.Src2VarTable
    L4_216 = L4_216(L5_217, L6_218, false)
    L5_217 = false
    L6_218 = nil
    if L3_215 ~= nil and A1_213.Src1Var ~= nil then
      L6_218 = L3_215[A1_213.Src1Var]
    else
      L6_218 = A1_213.Value1
    end
    if L4_216 ~= nil and A1_213.Src2Var ~= nil then
      L5_217 = A1_213.CompareOp(L6_218, L4_216[A1_213.Src2Var])
    else
      L5_217 = A1_213.CompareOp(L6_218, A1_213.Value2)
    end
    if L5_217 then
      ExecuteBuildingBlocks(A2_214, A0_212)
      A0_212.LastIfSucceeded = true
    else
      A0_212.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_219, A1_220, A2_221)
  local L3_222
  if A1_220.TargetVar ~= nil then
    L3_222 = A0_219[A1_220.TargetVar]
  else
    L3_222 = A0_219.Target
  end
  if HasBuffOfType(L3_222, A1_220.BuffType) then
    ExecuteBuildingBlocks(A2_221, A0_219)
    A0_219.LastIfSucceeded = true
  else
    A0_219.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_223, A1_224, A2_225)
  local L3_226, L4_227
  if A1_224.OwnerVar ~= nil then
    L3_226 = A0_223[A1_224.OwnerVar]
  else
    L3_226 = A0_223.Owner
  end
  if A1_224.AttackerVar ~= nil then
    L4_227 = A0_223[A1_224.AttackerVar]
  else
    L4_227 = A0_223.Attacker
  end
  if SpellBuffCount(L3_226, A1_224.BuffName, L4_227) > 0 then
    ExecuteBuildingBlocks(A2_225, A0_223)
    A0_223.LastIfSucceeded = true
  else
    A0_223.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_228, A1_229, A2_230)
  if BBIsMissileAutoAttack(A0_228, A1_229) then
    ExecuteBuildingBlocks(A2_230, A0_228)
    A0_228.LastIfSucceeded = true
  else
    A0_228.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_231, A1_232, A2_233)
  if BBIsMissileConsideredAsAutoAttack(A0_231, A1_232) then
    ExecuteBuildingBlocks(A2_233, A0_231)
    A0_231.LastIfSucceeded = true
  else
    A0_231.LastIfSucceeded = false
  end
end
BBIfMissileConsideredAsAutoAttack = L0_0
function L0_0(A0_234, A1_235)
  A0_234.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_236, A1_237, A2_238)
  local L3_239, L4_240
  if A1_237.OwnerVar ~= nil then
    L3_239 = A0_236[A1_237.OwnerVar]
  else
    L3_239 = A0_236.Owner
  end
  if A1_237.CasterVar ~= nil then
    L4_240 = A0_236[A1_237.CasterVar]
  else
    L4_240 = A0_236.Caster
  end
  if SpellBuffCount(L3_239, A1_237.BuffName, L4_240) <= 0 then
    ExecuteBuildingBlocks(A2_238, A0_236)
    A0_236.LastIfSucceeded = true
  else
    A0_236.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_241, A1_242, A2_243)
  local L3_244, L4_245
  if A1_242.OwnerVar ~= nil then
    L3_244 = A0_241[A1_242.OwnerVar]
  else
    L3_244 = A0_241.Owner
  end
  if HasPARType(L3_244, A1_242.PARType) then
    ExecuteBuildingBlocks(A2_243, A0_241)
    A0_241.LastIfSucceeded = true
  else
    A0_241.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_246, A1_247, A2_248)
  local L3_249, L4_250
  if A1_247.OwnerVar ~= nil then
    L3_249 = A0_246[A1_247.OwnerVar]
  else
    L3_249 = A0_246.Owner
  end
  if not HasPARType(L3_249, A1_247.PARType) then
    ExecuteBuildingBlocks(A2_248, A0_246)
    A0_246.LastIfSucceeded = true
  else
    A0_246.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_251, A1_252, A2_253)
  local L3_254, L4_255, L5_256, L6_257, L7_258
  L3_254 = GetTable
  L4_255 = A0_251
  L5_256 = A1_252.Src1VarTable
  L6_257 = false
  L3_254 = L3_254(L4_255, L5_256, L6_257)
  L4_255 = GetTable
  L5_256 = A0_251
  L6_257 = A1_252.Src2VarTable
  L7_258 = false
  L4_255 = L4_255(L5_256, L6_257, L7_258)
  L5_256 = true
  while L5_256 do
    L6_257 = false
    L7_258 = nil
    if L3_254 ~= nil and A1_252.Src1Var ~= nil then
      L7_258 = L3_254[A1_252.Src1Var]
    else
      L7_258 = A1_252.Value1
    end
    if L4_255 ~= nil and A1_252.Src2Var ~= nil then
      L6_257 = A1_252.CompareOp(L7_258, L4_255[A1_252.Src2Var])
    else
      L6_257 = A1_252.CompareOp(L7_258, A1_252.Value2)
    end
    if L6_257 then
      ExecuteBuildingBlocks(A2_253, A0_251)
    else
      L5_256 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_259, A1_260)
  return A0_259 * A1_260
end
MO_MULTIPLY = L0_0
function L0_0(A0_261, A1_262)
  return A0_261 + A1_262
end
MO_ADD = L0_0
function L0_0(A0_263, A1_264)
  return A0_263 - A1_264
end
MO_SUBTRACT = L0_0
function L0_0(A0_265, A1_266)
  return A0_265 / A1_266
end
MO_DIVIDE = L0_0
function L0_0(A0_267, A1_268)
  if A0_267 < A1_268 then
    return A0_267
  else
    return A1_268
  end
end
MO_MIN = L0_0
function L0_0(A0_269, A1_270)
  if A1_270 < A0_269 then
    return A0_269
  else
    return A1_270
  end
end
MO_MAX = L0_0
function L0_0(A0_271, A1_272)
  return A0_271 % A1_272
end
MO_MODULO = L0_0
function L0_0(A0_273)
  return math.floor(A0_273 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_274)
  return math.ceil(A0_274)
end
MO_ROUNDUP = L0_0
function L0_0(A0_275)
  return math.floor(A0_275)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_276)
  return math.sin(math.rad(A0_276))
end
MO_SIN = L0_0
function L0_0(A0_277)
  return math.cos(math.rad(A0_277))
end
MO_COSINE = L0_0
function L0_0(A0_278)
  return math.tan(math.rad(A0_278))
end
MO_TANGENT = L0_0
function L0_0(A0_279)
  return math.deg(math.asin(A0_279))
end
MO_ASIN = L0_0
function L0_0(A0_280)
  return math.deg(math.acos(A0_280))
end
MO_ACOS = L0_0
function L0_0(A0_281)
  return math.deg(math.atan(A0_281))
end
MO_ATAN = L0_0
function L0_0(A0_282, A1_283)
  return math.pow(A0_282, A1_283)
end
MO_POW = L0_0
function L0_0(A0_284)
  return math.sqrt(A0_284)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_285, A1_286)
  local L2_287
  L2_287 = A0_285 and A1_286
  return L2_287
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_288, A1_289)
  local L2_290
  L2_290 = A0_288 or A1_289
  return L2_290
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_291)
  local L1_292
  L1_292 = not A0_291
  return L1_292
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_293)
  return math.abs(A0_293)
end
MO_ABS = L0_0
function L0_0(A0_294, A1_295)
  return math.random(A0_294, A1_295)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_296, A1_297)
  local L2_298, L3_299, L4_300, L5_301
  L2_298 = GetMathNumber
  L3_299 = A0_296
  L4_300 = A1_297.Src1VarTable
  L5_301 = A1_297.Src1Var
  L2_298 = L2_298(L3_299, L4_300, L5_301, A1_297.Src1Value)
  L3_299 = GetMathNumber
  L4_300 = A0_296
  L5_301 = A1_297.Src2VarTable
  L3_299 = L3_299(L4_300, L5_301, A1_297.Src2Var, A1_297.Src2Value)
  L4_300 = GetTable
  L5_301 = A0_296
  L4_300 = L4_300(L5_301, A1_297.DestVarTable)
  L5_301 = A1_297.MathOp
  L5_301 = L5_301(L2_298, L3_299)
  SetVarInTable(A0_296, A1_297, L5_301)
end
BBMath = L0_0
function L0_0(A0_302, A1_303, A2_304, A3_305)
  if A2_304 ~= nil and GetTable(A0_302, A1_303)[A2_304] ~= nil then
    return GetTable(A0_302, A1_303)[A2_304]
  end
  return A3_305
end
GetMathNumber = L0_0
function L0_0(A0_306, A1_307)
  if type(A1_307) == "number" then
    return A1_307
  elseif type(A1_307) == "function" then
    return A1_307(A0_306)
  elseif type(A1_307) == "string" then
    return A0_306[A1_307]
  end
end
GetNumber = L0_0
function L0_0(A0_308, A1_309)
  return VectorAdd(A0_308, A1_309)
end
VEC_ADD = L0_0
function L0_0(A0_310, A1_311)
  return VectorSubtract(A0_310, A1_311)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_312, A1_313)
  return VectorScalarMultiply(A0_312, A1_313)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_314, A1_315)
  return VectorScalarDivide(A0_314, A1_315)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_316, A1_317)
  return VectorRotateY(A0_316, A1_317)
end
VEC_ROTATE = L0_0
function L0_0(A0_318, A1_319)
  BBMath(A0_318, A1_319)
end
BBVectorMath = L0_0
function L0_0(A0_320, A1_321)
  local L2_322, L3_323, L4_324, L5_325
  L2_322 = A0_320.InstanceVars
  L3_323 = L2_322.InterpDelta
  if L3_323 == nil then
    L3_323 = A1_321.Amount
    L4_324 = A1_321.AmountVar
    if L4_324 ~= nil then
      L4_324 = GetTable
      L5_325 = A0_320
      L4_324 = L4_324(L5_325, A1_321.AmountVarTable)
      L5_325 = A1_321.AmountVar
      L3_323 = L4_324[L5_325]
    end
    L4_324 = GetPosition
    L5_325 = A1_321.TargetVar
    L5_325 = A0_320[L5_325]
    L4_324 = L4_324(L5_325)
    L2_322.KnockBackStart = L4_324
    L4_324 = GetNormalizedPositionDelta
    L5_325 = A1_321.TargetVar
    L5_325 = A0_320[L5_325]
    L4_324 = L4_324(L5_325, A0_320[A1_321.AttackerVar], true)
    L5_325 = {}
    L5_325.x = L4_324.x * L3_323
    L5_325.y = 0
    L5_325.z = L4_324.z * L3_323
    L2_322.InterpDelta = L5_325
    L5_325 = GetTime
    L5_325 = L5_325()
    L2_322.StartTime = L5_325
    L5_325 = A1_321.KnockBackDuration
    L2_322.KnockBackDuration = L5_325
  end
  L3_323 = A1_321.TargetVar
  L3_323 = A0_320[L3_323]
  L4_324 = GetTime
  L4_324 = L4_324()
  L5_325 = L2_322.StartTime
  L4_324 = L4_324 - L5_325
  L5_325 = L2_322.KnockBackDuration
  L4_324 = L4_324 / L5_325
  L5_325 = {}
  L5_325.x = L2_322.KnockBackStart.x + L2_322.InterpDelta.x * L4_324
  L5_325.y = L2_322.KnockBackStart.y
  L5_325.z = L2_322.KnockBackStart.z + L2_322.InterpDelta.z * L4_324
  SetPosition(L3_323, L5_325)
end
BBKnockback = L0_0
function L0_0(A0_326, A1_327)
  local L2_328, L3_329
  L2_328 = GetParam
  L3_329 = "Left"
  L2_328 = L2_328(L3_329, A0_326, A1_327)
  L3_329 = GetParam
  L3_329 = L3_329("Right", A0_326, A1_327)
  GetTable(A0_326, A1_327.DestVarTable, true)[A1_327.DestVar] = tostring(L2_328) .. tostring(L3_329)
end
BBAppendString = L0_0
function L0_0(A0_330, A1_331)
  local L2_332
  L2_332 = 0
  if A1_331.Delta ~= nil then
    L2_332 = L2_332 + A1_331.Delta
  end
  if A1_331.DeltaByLevel ~= nil and A0_330.Level ~= nil then
    L2_332 = L2_332 + A1_331.DeltaByLevel[A0_330.Level]
  end
  if A1_331.DeltaVar ~= nil then
    L2_332 = L2_332 + GetTable(A0_330, A1_331.DeltaVarTable, true)[A1_331.DeltaVar]
  end
  if A1_331.TargetVar ~= nil then
    A1_331.Stat(L2_332, A0_330[A1_331.TargetVar])
  else
    A1_331.Stat(L2_332)
  end
end
BBIncStat = L0_0
function L0_0(A0_333, A1_334)
  local L2_335
  L2_335 = 0
  if A1_334.Delta ~= nil then
    L2_335 = L2_335 + A1_334.Delta
  end
  if A1_334.DeltaByLevel ~= nil and A0_333.Level ~= nil then
    L2_335 = L2_335 + A1_334.DeltaByLevel[A0_333.Level]
  end
  if A1_334.DeltaVar ~= nil then
    L2_335 = L2_335 + GetTable(A0_333, A1_334.DeltaVarTable, true)[A1_334.DeltaVar]
  end
  if A1_334.TargetVar ~= nil then
    A1_334.Stat(L2_335, A0_333[A1_334.TargetVar])
  else
    A1_334.Stat(L2_335)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_336, A1_337)
  local L2_338, L3_339
  L2_338 = A1_337.TargetVar
  L3_339 = 0
  if A1_337.LaneVar ~= nil then
    L3_339 = L3_339 + GetTable(A0_336, A1_337.LaneVarTable, true)[A1_337.LaneVar]
  end
  if A1_337.Lane ~= nil then
    L3_339 = L3_339 + A1_337.Lane
  end
  SetMinionLane(A0_336[L2_338], L3_339)
end
BBSetMinionLane = L0_0
function L0_0(A0_340, A1_341)
  if A1_341.AttackVar ~= nil then
  end
  if A1_341.Attack ~= nil then
  end
  if A1_341.TotalCoefficientVar ~= nil then
  end
  if A1_341.TotalCoefficient ~= nil then
  end
  if A1_341.TargetVar ~= nil then
    GetTable(A0_340, A1_341.DestVarTable, false)[A1_341.DestVar] = (0 + GetTable(A0_340, A1_341.AttackVarTable, true)[A1_341.AttackVar] + A1_341.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_340[A1_341.TargetVar])) + GetFlatCritDamageMod(A0_340[A1_341.TargetVar])) * (0 + GetTable(A0_340, A1_341.TotalCoefficientVarTable, true)[A1_341.TotalCoefficientVar] + A1_341.TotalCoefficient)
  else
    GetTable(A0_340, A1_341.DestVarTable, false)[A1_341.DestVar] = 2 * A1_341.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_342, A1_343)
  local L2_344, L3_345, L4_346, L5_347, L6_348, L7_349
  L2_344 = GetTable
  L3_345 = A0_342
  L4_346 = A1_343.DestVarTable
  L5_347 = false
  L2_344 = L2_344(L3_345, L4_346, L5_347)
  L3_345 = GetTable
  L4_346 = A0_342
  L5_347 = A1_343.AmountVarTable
  L6_348 = true
  L3_345 = L3_345(L4_346, L5_347, L6_348)
  L4_346 = GetTable
  L5_347 = A0_342
  L6_348 = A0_342.NextBuffVars
  L7_349 = false
  L4_346 = L4_346(L5_347, L6_348, L7_349)
  L5_347 = A1_343.AmountVar
  L5_347 = L3_345[L5_347]
  L6_348 = A1_343.Amount
  L5_347 = L5_347 + L6_348
  L4_346.InitializeShield_Amount = L5_347
  L5_347 = A1_343.AmountVar
  if L5_347 ~= nil then
    L5_347 = A1_343.HealShieldMod
    if L5_347 ~= nil and L5_347 == true then
      L6_348 = A1_343.AttackerVar
      L7_349 = 0
      if L6_348 ~= nil then
        L7_349 = GetPercentHealingAmountMod(A0_342[L6_348])
      end
      L4_346.InitializeShield_Amount, L3_345[A1_343.AmountVar] = (A1_343.Amount + L3_345[A1_343.AmountVar]) * (1 + L7_349), (A1_343.Amount + L3_345[A1_343.AmountVar]) * (1 + L7_349)
    end
  end
  L5_347 = SpellBuffAddNoRenew
  L6_348 = A1_343.AttackerVar
  L6_348 = A0_342[L6_348]
  L7_349 = A1_343.UnitVar
  L7_349 = A0_342[L7_349]
  L5_347(L6_348, L7_349, "InitializeShieldMarker", 0, 1, 25000, L4_346)
  L5_347 = BBIncreaseShield
  L6_348 = A0_342
  L7_349 = A1_343
  L5_347(L6_348, L7_349)
end
BBInitializeShield = L0_0
function L0_0(A0_350, A1_351)
  if A1_351.CDVar ~= nil then
  end
  if A1_351.CD ~= nil then
  end
  if A1_351.TargetVar ~= nil then
    GetTable(A0_350, A1_351.DestVarTable, false)[A1_351.DestVar] = (0 + GetTable(A0_350, A1_351.CDVarTable, true)[A1_351.CDVar] + A1_351.CD) * (1 + GetPercentCooldownMod(A0_350[A1_351.TargetVar]))
  else
    GetTable(A0_350, A1_351.DestVarTable, false)[A1_351.DestVar] = A1_351.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_352, A1_353)
  local L2_354, L3_355
  L3_355 = A1_353.TargetVar
  if L3_355 ~= nil then
    L2_354 = A1_353.Stat(A0_352[L3_355])
  else
    L2_354 = A1_353.Stat()
  end
  SetVarInTable(A0_352, A1_353, L2_354)
end
BBGetStat = L0_0
function L0_0(A0_356, A1_357)
  if A1_357.TargetVar ~= nil then
    GetTable(A0_356, A1_357.DestVarTable, false)[A1_357.DestVar] = GetLevel(A0_356[A1_357.TargetVar])
  else
    GetTable(A0_356, A1_357.DestVarTable, false)[A1_357.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_358, A1_359)
  if A1_359.TargetVar ~= nil then
    GetTable(A0_358, A1_359.DestVarTable, false)[A1_359.DestVar] = GetUnitSignificance(A0_358[A1_359.TargetVar])
  else
    GetTable(A0_358, A1_359.DestVarTable, false)[A1_359.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_360, A1_361)
  if A1_361.TargetVar ~= nil then
    GetTable(A0_360, A1_361.DestVarTable, false)[A1_361.DestVar] = GetArmor(A0_360[A1_361.TargetVar])
  else
    GetTable(A0_360, A1_361.DestVarTable, false)[A1_361.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_362, A1_363)
  if A1_363.TargetVar ~= nil then
    GetTable(A0_362, A1_363.DestVarTable, false)[A1_363.DestVar] = GetSpellBlock(A0_362[A1_363.TargetVar])
  else
    GetTable(A0_362, A1_363.DestVarTable, false)[A1_363.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_364, A1_365)
  local L2_366, L3_367
  L3_367 = A1_365.TargetVar
  if L3_367 ~= nil then
    L2_366 = GetTeamID(A0_364[L3_367])
  else
    L2_366 = GetTeamID()
  end
  SetVarInTable(A0_364, A1_365, L2_366)
end
BBGetTeamID = L0_0
function L0_0(A0_368, A1_369)
  local L2_370, L3_371, L4_372
  L2_370 = GetTable
  L3_371 = A0_368
  L4_372 = A1_369.DestVarTable
  L2_370 = L2_370(L3_371, L4_372, false)
  L3_371 = A1_369.TargetVar
  L4_372 = nil
  if L3_371 ~= nil then
    L4_372 = GetTeamID(A0_368[L3_371])
  else
    L4_372 = GetTeamID()
  end
  if L4_372 == TEAM_ORDER then
    L2_370[A1_369.DestVar] = TEAM_CHAOS
  elseif L4_372 == TEAM_CHAOS then
    L2_370[A1_369.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_373, A1_374)
  if A1_374.TargetVar ~= nil then
    GetTable(A0_373, A1_374.DestVarTable, false)[A1_374.DestVar] = GetUnitSkinName(A0_373[A1_374.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_375, A1_376)
  local L2_377, L3_378, L4_379
  L2_377 = GetTable
  L3_378 = A0_375
  L4_379 = A1_376.DestVarTable
  L2_377 = L2_377(L3_378, L4_379, false)
  L3_378 = A0_375.Owner
  L4_379 = nil
  if A1_376.TargetVar ~= nil then
    L4_379 = GetTotalAttackDamage(A0_375[A1_376.TargetVar])
  else
    L4_379 = GetTotalAttackDamage()
  end
  SetVarInTable(A0_375, A1_376, L4_379)
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_380, A1_381)
  GetTable(A0_380, A1_381.DestVarTable, true)[A1_381.DestVar] = A1_381.Status(A0_380[A1_381.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_382, A1_383)
  local L2_384
  L2_384 = A1_383.TargetVar
  L2_384 = A0_382[L2_384]
  ClearAttackTarget(L2_384)
end
BBClearAttackTarget = L0_0
function L0_0(A0_385, A1_386)
  local L2_387, L3_388
  L2_387 = GetTable
  L3_388 = A0_385
  L2_387 = L2_387(L3_388, A1_386.DestVarTable, true)
  L3_388 = A1_386.Info
  L3_388 = L3_388(A0_385[A1_386.TargetVar])
  SetVarInTable(A0_385, A1_386, L3_388)
end
BBGetCastInfo = L0_0
function L0_0(A0_389, A1_390, A2_391)
  local L3_392, L4_393, L5_394, L6_395
  L3_392 = GetTable
  L4_393 = A0_389
  L5_394 = A1_390.TrackTimeVarTable
  L6_395 = false
  L3_392 = L3_392(L4_393, L5_394, L6_395)
  L4_393 = GetTime
  L4_393 = L4_393()
  L5_394 = A1_390.ExecuteImmediately
  L6_395 = GetParam
  L6_395 = L6_395("TimeBetweenExecutions", A0_389, A1_390)
  if A1_390.TickTimeVar ~= nil and GetTable(A0_389, A1_390.TickTimeVarTable, false)[A1_390.TickTimeVar] ~= nil then
    L6_395 = GetTable(A0_389, A1_390.TickTimeVarTable, false)[A1_390.TickTimeVar]
  end
  if L3_392[A1_390.TrackTimeVar] == nil then
    L3_392[A1_390.TrackTimeVar] = L4_393
    if L5_394 == true then
      ExecuteBuildingBlocks(A2_391, A0_389)
    end
  end
  if L4_393 >= L3_392[A1_390.TrackTimeVar] + L6_395 then
    L3_392[A1_390.TrackTimeVar] = L3_392[A1_390.TrackTimeVar] + L6_395
    ExecuteBuildingBlocks(A2_391, A0_389)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_396, A1_397, A2_398)
  GetTable(A0_396, A1_397.TrackTimeVarTable, false)[A1_397.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_399, A1_400)
  local L2_401
  L2_401 = A1_400.SrcValue
  if A1_400.SrcVar ~= nil then
    L2_401 = GetTable(A0_399, A1_400.SrcVarTable, true)[A1_400.SrcVar]
  end
  A1_400.Status(A0_399[A1_400.TargetVar], L2_401)
end
BBSetStatus = L0_0
function L0_0(A0_402, A1_403)
  local L2_404
  L2_404 = A1_403.ToAlert
  if GetTable(A0_402, A1_403.SrcVarTable, false) ~= nil and A1_403.SrcVar ~= nil then
    L2_404 = L2_404 .. GetTable(A0_402, A1_403.SrcVarTable, false)[A1_403.SrcVar]
  end
  _ALERT(L2_404)
end
BBAlert = L0_0
function L0_0(A0_405, A1_406)
  local L2_407, L3_408, L4_409, L5_410, L6_411, L7_412
  L2_407 = GetParam
  L3_408 = "Message"
  L4_409 = A0_405
  L5_410 = A1_406
  L2_407 = L2_407(L3_408, L4_409, L5_410)
  if L2_407 == nil then
    L3_408 = ReportError
    L4_409 = "Could not resolve Message param"
    L3_408(L4_409)
    return
  end
  L3_408 = true
  L4_409 = GetParam
  L5_410 = "OnUnit"
  L6_411 = A0_405
  L7_412 = A1_406
  L4_409 = L4_409(L5_410, L6_411, L7_412)
  if L4_409 == nil then
    L3_408 = false
    L5_410 = GetParam
    L6_411 = "OnUnitByFlag"
    L7_412 = A0_405
    L5_410 = L5_410(L6_411, L7_412, A1_406)
    L4_409 = L5_410
  end
  if L4_409 == nil then
    L5_410 = ReportError
    L6_411 = "Could not resolve OnUnit param"
    L5_410(L6_411)
    return
  end
  L5_410 = true
  L6_411 = GetParam
  L7_412 = "ChampionToSayTo"
  L6_411 = L6_411(L7_412, A0_405, A1_406)
  if L6_411 == nil then
    L5_410 = false
    L7_412 = GetParam
    L7_412 = L7_412("ChampionToSayToByFlag", A0_405, A1_406)
    L6_411 = L7_412
  end
  if L6_411 == nil then
    L7_412 = ReportError
    L7_412("Could not resolve ChampionToSayTo param")
    return
  end
  L7_412 = GetParam
  L7_412 = L7_412("ShowToSpectator", A0_405, A1_406)
  if L7_412 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  SayWithFloatingTextOnUnitToChampion(tostring(L2_407), A1_406.TextType, L4_409, L3_408, L6_411, L5_410, L7_412)
end
BBSayWithFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_413, A1_414)
  local L2_415, L3_416, L4_417
  L2_415 = A1_414.ToSay
  L3_416 = GetTable
  L4_417 = A0_413
  L3_416 = L3_416(L4_417, A1_414.SrcVarTable, false)
  if L3_416 ~= nil then
    L4_417 = A1_414.SrcVar
    if L4_417 ~= nil then
      L4_417 = L2_415
      L2_415 = L4_417 .. tostring(L3_416[A1_414.SrcVar])
    end
  end
  L4_417 = nil
  if A1_414.OwnerVar ~= nil then
    L4_417 = A0_413[A1_414.OwnerVar]
  else
    L4_417 = A0_413.Owner
  end
  if A1_414.TextType == nil then
    A1_414.TextType = 0
  end
  Say(L4_417, L2_415, A1_414.TextType)
end
BBSay = L0_0
function L0_0(A0_418, A1_419)
  local L2_420, L3_421, L4_422
  L2_420 = A1_419.ToSay
  L3_421 = GetTable
  L4_422 = A0_418
  L3_421 = L3_421(L4_422, A1_419.SrcVarTable, false)
  if L3_421 ~= nil then
    L4_422 = A1_419.SrcVar
    if L4_422 ~= nil then
      L4_422 = L2_420
      L2_420 = L4_422 .. tostring(L3_421[A1_419.SrcVar])
    end
  end
  L4_422 = nil
  if A1_419.OwnerVar ~= nil then
    L4_422 = A0_418[A1_419.OwnerVar]
  else
    L4_422 = A0_418.Owner
  end
  if A1_419.TextType == nil then
    A1_419.TextType = 0
  end
  Say(L4_422, L2_420, A1_419.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_423, A1_424)
  GetTable(A0_423, A1_424.DestVarTable, true)[A1_424.DestVar] = BBLuaGetGold(A0_423, A1_424)
end
BBGetGold = L0_0
function L0_0(A0_425, A1_426)
  GetTable(A0_425, A1_426.DestVarTable, true)[A1_426.DestVar] = BBLuaGetTotalGold(A0_425, A1_426)
end
BBGetTotalGold = L0_0
function L0_0(A0_427, A1_428)
  SpellBuffAdd(A0_427[A1_428.OwnerVar], A0_427[A1_428.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_427.NextBuffVars)
  BBTeleportToPositionHelper(A0_427, A1_428)
end
BBTeleportToPosition = L0_0
function L0_0(A0_429, A1_430)
  if A1_430.XVar ~= nil and GetTable(A0_429, A1_430.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_429, A1_430.XVarTable, true)[A1_430.XVar]
  else
    Xloc = A1_430.X
  end
  if A1_430.YVar ~= nil and GetTable(A0_429, A1_430.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_429, A1_430.YVarTable, true)[A1_430.YVar]
  else
    Yloc = A1_430.Y
  end
  if A1_430.ZVar ~= nil and GetTable(A0_429, A1_430.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_429, A1_430.ZVarTable, true)[A1_430.ZVar]
  else
    Zloc = A1_430.Z
  end
  A1_430.OwnerVar, A0_429.position = A1_430.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_430.CastPositionName = "position"
  BBTeleportToPosition(A0_429, A1_430)
end
BBTeleportToPoint = L0_0
function L0_0(A0_431, A1_432)
  DefUpdateAura(GetTable(A0_431, A1_432.CenterTable, false)[A1_432.CenterVar], A1_432.Range, A1_432.UnitScan, A1_432.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_433, A1_434)
  ReincarnateNonDeadHero(GetTable(A0_433, A1_434.TargetTable, false)[A1_434.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_435, A1_436)
  GetTable(A0_435, A1_436.DestVarTable, true)[A1_436.DestVar] = A1_436.Function(A0_435[A1_436.OwnerVar], A1_436.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_437, A1_438)
  local L2_439, L3_440, L4_441, L5_442
  L2_439 = A1_438.WhomToOrderVar
  L2_439 = A0_437[L2_439]
  L3_440 = A1_438.TargetOfOrderVar
  L3_440 = A0_437[L3_440]
  L4_441 = GetTable
  L5_442 = A0_437
  L4_441 = L4_441(L5_442, A1_438.SrcVarTable, false)
  L5_442 = nil
  if A1_438.SrcVar ~= nil and L4_441 ~= nil then
    L5_442 = L4_441[A1_438.SrcVar]
  else
    L5_442 = GetPosition(L3_440)
  end
  if L3_440 == nil then
    L3_440 = L2_439
  end
  IssueOrder(L2_439, A1_438.Order, L5_442, L3_440)
end
BBIssueOrder = L0_0
function L0_0(A0_443, A1_444)
  local L2_445
  L2_445 = GetParam
  L2_445 = L2_445("NewRange", A0_443, A1_444)
  SetSpellCastRange(L2_445)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_446, A1_447)
  GetTable(A0_446, A1_447.DestVarTable, true)[A1_447.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_448, A1_449)
  local L2_450, L3_451
  L2_450 = A1_449.ObjectVar1
  L2_450 = A0_448[L2_450]
  L3_451 = A1_449.ObjectVar2
  L3_451 = A0_448[L3_451]
  GetTable(A0_448, A1_449.DestVarTable, true)[A1_449.DestVar] = DistanceBetweenObjectBounds(L2_450, L3_451)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_452, A1_453)
  local L2_454, L3_455, L4_456
  L2_454 = A1_453.ObjectVar
  L2_454 = A0_452[L2_454]
  L3_455 = GetTable
  L4_456 = A0_452
  L3_455 = L3_455(L4_456, A1_453.PointVarTable, true)
  L4_456 = A1_453.PointVar
  L4_456 = L3_455[L4_456]
  GetTable(A0_452, A1_453.DestVarTable, true)[A1_453.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_454, L4_456)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_457, A1_458)
  local L2_459, L3_460
  L2_459 = GetParam
  L3_460 = "Point1"
  L2_459 = L2_459(L3_460, A0_457, A1_458)
  L3_460 = GetParam
  L3_460 = L3_460("Point2", A0_457, A1_458)
  GetTable(A0_457, A1_458.DestVarTable, true)[A1_458.DestVar] = DistanceBetweenPoints(L2_459, L3_460)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_461, A1_462, A2_463)
  local L3_464, L4_465, L5_466, L6_467, L7_468, L8_469
  L5_466 = 0
  L6_467 = nil
  L7_468 = A1_462.ObjectDistanceType
  L8_469 = A1_462.ObjectVar1
  L3_464 = A0_461[L8_469]
  L8_469 = A1_462.ObjectVar2
  L4_465 = A0_461[L8_469]
  if nil == L4_465 then
    L8_469 = A1_462.Point2Var
    if nil ~= L8_469 then
      L8_469 = GetTable
      L8_469 = L8_469(A0_461, A1_462.Point2VarTable, true)
      L4_465 = L8_469[A1_462.Point2Var]
      L5_466 = L5_466 + 1
    end
  end
  if nil == L3_464 then
    L8_469 = A1_462.Point1Var
    if nil ~= L8_469 then
      L8_469 = GetTable
      L8_469 = L8_469(A0_461, A1_462.Point1VarTable, true)
      L3_464 = L8_469[A1_462.Point1Var]
      L5_466 = L5_466 + 1
      if 1 == L5_466 then
        L3_464, L4_465 = L4_465, L3_464
      end
    end
  end
  if nil ~= L7_468 then
    if 0 == L5_466 then
      L8_469 = OBJECT_CENTER
      if L8_469 == L7_468 then
        L6_467 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_469 = OBJECT_BOUNDARY
        if L8_469 == L7_468 then
          L6_467 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_469 = A1_462.OwnerVar
          L8_469 = A0_461[L8_469]
          Say(L8_469, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_466 then
      L8_469 = OBJECT_CENTER
      if L8_469 == L7_468 then
        L6_467 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_469 = OBJECT_BOUNDARY
        if L8_469 == L7_468 then
          L6_467 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_469 = A1_462.OwnerVar
          L8_469 = A0_461[L8_469]
          Say(L8_469, "invalid object distance type", 0)
        end
      end
    else
      L6_467 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_469 = A1_462.Distance
  if A1_462.DistanceVar ~= nil and GetTable(A0_461, A1_462.DistanceVarTable, true) ~= nil then
    L8_469 = L8_469 + GetTable(A0_461, A1_462.DistanceVarTable, true)[A1_462.DistanceVar]
  end
  if L3_464 ~= nil and L4_465 ~= nil and L6_467 ~= nil and L8_469 ~= nil then
    if not L6_467(L3_464, L4_465, L8_469) then
      ExecuteBuildingBlocks(A2_463, A0_461)
      A0_461.LastIfSucceeded = true
    else
      A0_461.LastIfSucceeded = false
    end
  else
    A0_461.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_470, A1_471)
  local L2_472, L3_473
  L2_472 = A1_471.TargetVar
  L2_472 = A0_470[L2_472]
  L3_473 = A1_471.CasterVar
  L3_473 = A0_470[L3_473]
  GetTable(A0_470, A1_471.DestVarTable, true)[A1_471.DestVar] = SpellBuffCount(L2_472, A1_471.BuffName, L3_473)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_474, A1_475)
  local L2_476
  L2_476 = A1_475.TargetVar
  L2_476 = A0_474[L2_476]
  GetTable(A0_474, A1_475.DestVarTable, true)[A1_475.DestVar] = SpellBuffCount(L2_476, A1_475.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_477, A1_478)
  local L2_479, L3_480
  L2_479 = GetTable
  L3_480 = A0_477
  L2_479 = L2_479(L3_480, A1_478.ScaleVarTable, false)
  L3_480 = nil
  if A1_478.OwnerVar ~= nil then
    L3_480 = A0_477[A1_478.OwnerVar]
  else
    L3_480 = A0_477.Owner
  end
  if A1_478.ScaleVar ~= nil and A1_478.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_479[A1_478.ScaleVar], L3_480)
  else
    SetScaleSkinCoef(A1_478.Scale, L3_480)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_481, A1_482)
  SpellBuffAdd(A0_481[A1_482.TargetVar], A0_481[A1_482.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_481.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_483, A1_484, A2_485)
  local L3_486, L4_487
  L3_486 = A1_484.TargetVar
  L3_486 = A0_483[L3_486]
  L4_487 = A1_484.NumStacks
  if GetParam("NumStacks", A0_483, A1_484) == 0 then
    L4_487 = SpellBuffCount(L3_486, A1_484.BuffName, caster)
  else
    L4_487 = GetParam("NumStacks", A0_483, A1_484)
  end
  while L4_487 > 0 do
    SpellBuffRemove(L3_486, A1_484.BuffName, A0_483[A1_484.AttackerVar])
    L4_487 = L4_487 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_488, A1_489, A2_490)
  if A0_488.EmoteId == A1_489.EmoteId then
    ExecuteBuildingBlocks(A2_490, A0_488)
    A0_488.LastIfSucceeded = true
  else
    A0_488.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_491, A1_492, A2_493)
  if A0_491.EmoteId ~= A1_492.EmoteId then
    ExecuteBuildingBlocks(A2_493, A0_491)
    A0_491.LastIfSucceeded = true
  else
    A0_491.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_494, A1_495)
  local L2_496, L3_497, L4_498, L5_499
  L2_496 = GetTable
  L3_497 = A0_494
  L4_498 = A1_495.String1VarTable
  L5_499 = false
  L2_496 = L2_496(L3_497, L4_498, L5_499)
  L3_497 = A1_495.String1Var
  L3_497 = L2_496[L3_497]
  L4_498 = GetTable
  L5_499 = A0_494
  L4_498 = L4_498(L5_499, A1_495.String2VarTable, false)
  L5_499 = A1_495.String2Var
  L5_499 = L4_498[L5_499]
  GetTable(A0_494, A1_495.ResultVarTable, false)[A1_495.ResultVar] = L3_497 .. L5_499
end
BBConcatenateStrings = L0_0
function L0_0(A0_500, A1_501)
  BBGetMinionKills(A0_500, A1_501)
  A0_500.MinionKillSource = GetParam("MinionKillTarget")
  A0_500.MinionKills = A0_500.MinionsKilled + GetParam("MinionKills", A0_500, A1_501)
  BBSetMinionKills(A0_500, A1_501)
end
BBIncreaseMinionKills = L0_0
