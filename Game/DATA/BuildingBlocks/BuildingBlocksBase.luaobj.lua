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
  local L3_244
  if A1_242.TargetVar ~= nil then
    L3_244 = A0_241[A1_242.TargetVar]
  else
    L3_244 = A0_241.Owner
  end
  if HasUnitTag(L3_244, A1_242.UnitTag) ~= A1_242.InvertResult then
    ExecuteBuildingBlocks(A2_243, A0_241)
    A0_241.LastIfSucceeded = true
  else
    A0_241.LastIfSucceeded = false
  end
end
BBIfHasUnitTag = L0_0
function L0_0(A0_245, A1_246, A2_247)
  local L3_248, L4_249
  if A1_246.OwnerVar ~= nil then
    L3_248 = A0_245[A1_246.OwnerVar]
  else
    L3_248 = A0_245.Owner
  end
  if HasPARType(L3_248, A1_246.PARType) then
    ExecuteBuildingBlocks(A2_247, A0_245)
    A0_245.LastIfSucceeded = true
  else
    A0_245.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_250, A1_251, A2_252)
  local L3_253, L4_254
  if A1_251.OwnerVar ~= nil then
    L3_253 = A0_250[A1_251.OwnerVar]
  else
    L3_253 = A0_250.Owner
  end
  if not HasPARType(L3_253, A1_251.PARType) then
    ExecuteBuildingBlocks(A2_252, A0_250)
    A0_250.LastIfSucceeded = true
  else
    A0_250.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_255, A1_256, A2_257)
  local L3_258, L4_259, L5_260, L6_261, L7_262
  L3_258 = GetTable
  L4_259 = A0_255
  L5_260 = A1_256.Src1VarTable
  L6_261 = false
  L3_258 = L3_258(L4_259, L5_260, L6_261)
  L4_259 = GetTable
  L5_260 = A0_255
  L6_261 = A1_256.Src2VarTable
  L7_262 = false
  L4_259 = L4_259(L5_260, L6_261, L7_262)
  L5_260 = true
  while L5_260 do
    L6_261 = false
    L7_262 = nil
    if L3_258 ~= nil and A1_256.Src1Var ~= nil then
      L7_262 = L3_258[A1_256.Src1Var]
    else
      L7_262 = A1_256.Value1
    end
    if L4_259 ~= nil and A1_256.Src2Var ~= nil then
      L6_261 = A1_256.CompareOp(L7_262, L4_259[A1_256.Src2Var])
    else
      L6_261 = A1_256.CompareOp(L7_262, A1_256.Value2)
    end
    if L6_261 then
      ExecuteBuildingBlocks(A2_257, A0_255)
    else
      L5_260 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_263, A1_264)
  return A0_263 * A1_264
end
MO_MULTIPLY = L0_0
function L0_0(A0_265, A1_266)
  return A0_265 + A1_266
end
MO_ADD = L0_0
function L0_0(A0_267, A1_268)
  return A0_267 - A1_268
end
MO_SUBTRACT = L0_0
function L0_0(A0_269, A1_270)
  return A0_269 / A1_270
end
MO_DIVIDE = L0_0
function L0_0(A0_271, A1_272)
  if A0_271 < A1_272 then
    return A0_271
  else
    return A1_272
  end
end
MO_MIN = L0_0
function L0_0(A0_273, A1_274)
  if A1_274 < A0_273 then
    return A0_273
  else
    return A1_274
  end
end
MO_MAX = L0_0
function L0_0(A0_275, A1_276)
  return A0_275 % A1_276
end
MO_MODULO = L0_0
function L0_0(A0_277)
  return math.floor(A0_277 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_278)
  return math.ceil(A0_278)
end
MO_ROUNDUP = L0_0
function L0_0(A0_279)
  return math.floor(A0_279)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_280)
  return math.sin(math.rad(A0_280))
end
MO_SIN = L0_0
function L0_0(A0_281)
  return math.cos(math.rad(A0_281))
end
MO_COSINE = L0_0
function L0_0(A0_282)
  return math.tan(math.rad(A0_282))
end
MO_TANGENT = L0_0
function L0_0(A0_283)
  return math.deg(math.asin(A0_283))
end
MO_ASIN = L0_0
function L0_0(A0_284)
  return math.deg(math.acos(A0_284))
end
MO_ACOS = L0_0
function L0_0(A0_285)
  return math.deg(math.atan(A0_285))
end
MO_ATAN = L0_0
function L0_0(A0_286, A1_287)
  return math.pow(A0_286, A1_287)
end
MO_POW = L0_0
function L0_0(A0_288)
  return math.sqrt(A0_288)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_289, A1_290)
  local L2_291
  L2_291 = A0_289 and A1_290
  return L2_291
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_292, A1_293)
  local L2_294
  L2_294 = A0_292 or A1_293
  return L2_294
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_295)
  local L1_296
  L1_296 = not A0_295
  return L1_296
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_297)
  return math.abs(A0_297)
end
MO_ABS = L0_0
function L0_0(A0_298, A1_299)
  return math.random(A0_298, A1_299)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_300, A1_301)
  local L2_302, L3_303, L4_304, L5_305
  L2_302 = GetMathNumber
  L3_303 = A0_300
  L4_304 = A1_301.Src1VarTable
  L5_305 = A1_301.Src1Var
  L2_302 = L2_302(L3_303, L4_304, L5_305, A1_301.Src1Value)
  L3_303 = GetMathNumber
  L4_304 = A0_300
  L5_305 = A1_301.Src2VarTable
  L3_303 = L3_303(L4_304, L5_305, A1_301.Src2Var, A1_301.Src2Value)
  L4_304 = GetTable
  L5_305 = A0_300
  L4_304 = L4_304(L5_305, A1_301.DestVarTable)
  L5_305 = A1_301.MathOp
  L5_305 = L5_305(L2_302, L3_303)
  SetVarInTable(A0_300, A1_301, L5_305)
end
BBMath = L0_0
function L0_0(A0_306, A1_307, A2_308, A3_309)
  if A2_308 ~= nil and GetTable(A0_306, A1_307)[A2_308] ~= nil then
    return GetTable(A0_306, A1_307)[A2_308]
  end
  return A3_309
end
GetMathNumber = L0_0
function L0_0(A0_310, A1_311)
  if type(A1_311) == "number" then
    return A1_311
  elseif type(A1_311) == "function" then
    return A1_311(A0_310)
  elseif type(A1_311) == "string" then
    return A0_310[A1_311]
  end
end
GetNumber = L0_0
function L0_0(A0_312, A1_313)
  return VectorAdd(A0_312, A1_313)
end
VEC_ADD = L0_0
function L0_0(A0_314, A1_315)
  return VectorSubtract(A0_314, A1_315)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_316, A1_317)
  return VectorScalarMultiply(A0_316, A1_317)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_318, A1_319)
  return VectorScalarDivide(A0_318, A1_319)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_320, A1_321)
  return VectorRotateY(A0_320, A1_321)
end
VEC_ROTATE = L0_0
function L0_0(A0_322, A1_323)
  BBMath(A0_322, A1_323)
end
BBVectorMath = L0_0
function L0_0(A0_324, A1_325)
  local L2_326, L3_327, L4_328, L5_329
  L2_326 = A0_324.InstanceVars
  L3_327 = L2_326.InterpDelta
  if L3_327 == nil then
    L3_327 = A1_325.Amount
    L4_328 = A1_325.AmountVar
    if L4_328 ~= nil then
      L4_328 = GetTable
      L5_329 = A0_324
      L4_328 = L4_328(L5_329, A1_325.AmountVarTable)
      L5_329 = A1_325.AmountVar
      L3_327 = L4_328[L5_329]
    end
    L4_328 = GetPosition
    L5_329 = A1_325.TargetVar
    L5_329 = A0_324[L5_329]
    L4_328 = L4_328(L5_329)
    L2_326.KnockBackStart = L4_328
    L4_328 = GetNormalizedPositionDelta
    L5_329 = A1_325.TargetVar
    L5_329 = A0_324[L5_329]
    L4_328 = L4_328(L5_329, A0_324[A1_325.AttackerVar], true)
    L5_329 = {}
    L5_329.x = L4_328.x * L3_327
    L5_329.y = 0
    L5_329.z = L4_328.z * L3_327
    L2_326.InterpDelta = L5_329
    L5_329 = GetTime
    L5_329 = L5_329()
    L2_326.StartTime = L5_329
    L5_329 = A1_325.KnockBackDuration
    L2_326.KnockBackDuration = L5_329
  end
  L3_327 = A1_325.TargetVar
  L3_327 = A0_324[L3_327]
  L4_328 = GetTime
  L4_328 = L4_328()
  L5_329 = L2_326.StartTime
  L4_328 = L4_328 - L5_329
  L5_329 = L2_326.KnockBackDuration
  L4_328 = L4_328 / L5_329
  L5_329 = {}
  L5_329.x = L2_326.KnockBackStart.x + L2_326.InterpDelta.x * L4_328
  L5_329.y = L2_326.KnockBackStart.y
  L5_329.z = L2_326.KnockBackStart.z + L2_326.InterpDelta.z * L4_328
  SetPosition(L3_327, L5_329)
end
BBKnockback = L0_0
function L0_0(A0_330, A1_331)
  local L2_332, L3_333
  L2_332 = GetParam
  L3_333 = "Left"
  L2_332 = L2_332(L3_333, A0_330, A1_331)
  L3_333 = GetParam
  L3_333 = L3_333("Right", A0_330, A1_331)
  GetTable(A0_330, A1_331.DestVarTable, true)[A1_331.DestVar] = tostring(L2_332) .. tostring(L3_333)
end
BBAppendString = L0_0
function L0_0(A0_334, A1_335)
  local L2_336
  L2_336 = 0
  if A1_335.Delta ~= nil then
    L2_336 = L2_336 + A1_335.Delta
  end
  if A1_335.DeltaByLevel ~= nil and A0_334.Level ~= nil then
    L2_336 = L2_336 + A1_335.DeltaByLevel[A0_334.Level]
  end
  if A1_335.DeltaVar ~= nil then
    L2_336 = L2_336 + GetTable(A0_334, A1_335.DeltaVarTable, true)[A1_335.DeltaVar]
  end
  if A1_335.TargetVar ~= nil then
    A1_335.Stat(L2_336, A0_334[A1_335.TargetVar])
  else
    A1_335.Stat(L2_336)
  end
end
BBIncStat = L0_0
function L0_0(A0_337, A1_338)
  local L2_339
  L2_339 = 0
  if A1_338.Delta ~= nil then
    L2_339 = L2_339 + A1_338.Delta
  end
  if A1_338.DeltaByLevel ~= nil and A0_337.Level ~= nil then
    L2_339 = L2_339 + A1_338.DeltaByLevel[A0_337.Level]
  end
  if A1_338.DeltaVar ~= nil then
    L2_339 = L2_339 + GetTable(A0_337, A1_338.DeltaVarTable, true)[A1_338.DeltaVar]
  end
  if A1_338.TargetVar ~= nil then
    A1_338.Stat(L2_339, A0_337[A1_338.TargetVar])
  else
    A1_338.Stat(L2_339)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_340, A1_341)
  local L2_342, L3_343
  L2_342 = A1_341.TargetVar
  L3_343 = 0
  if A1_341.LaneVar ~= nil then
    L3_343 = L3_343 + GetTable(A0_340, A1_341.LaneVarTable, true)[A1_341.LaneVar]
  end
  if A1_341.Lane ~= nil then
    L3_343 = L3_343 + A1_341.Lane
  end
  SetMinionLane(A0_340[L2_342], L3_343)
end
BBSetMinionLane = L0_0
function L0_0(A0_344, A1_345)
  if A1_345.AttackVar ~= nil then
  end
  if A1_345.Attack ~= nil then
  end
  if A1_345.TotalCoefficientVar ~= nil then
  end
  if A1_345.TotalCoefficient ~= nil then
  end
  if A1_345.TargetVar ~= nil then
    GetTable(A0_344, A1_345.DestVarTable, false)[A1_345.DestVar] = (0 + GetTable(A0_344, A1_345.AttackVarTable, true)[A1_345.AttackVar] + A1_345.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_344[A1_345.TargetVar])) + GetFlatCritDamageMod(A0_344[A1_345.TargetVar])) * (0 + GetTable(A0_344, A1_345.TotalCoefficientVarTable, true)[A1_345.TotalCoefficientVar] + A1_345.TotalCoefficient)
  else
    GetTable(A0_344, A1_345.DestVarTable, false)[A1_345.DestVar] = 2 * A1_345.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_346, A1_347)
  local L2_348, L3_349, L4_350, L5_351, L6_352, L7_353
  L2_348 = GetTable
  L3_349 = A0_346
  L4_350 = A1_347.DestVarTable
  L5_351 = false
  L2_348 = L2_348(L3_349, L4_350, L5_351)
  L3_349 = GetTable
  L4_350 = A0_346
  L5_351 = A1_347.AmountVarTable
  L6_352 = true
  L3_349 = L3_349(L4_350, L5_351, L6_352)
  L4_350 = GetTable
  L5_351 = A0_346
  L6_352 = A0_346.NextBuffVars
  L7_353 = false
  L4_350 = L4_350(L5_351, L6_352, L7_353)
  L5_351 = A1_347.AmountVar
  L5_351 = L3_349[L5_351]
  L6_352 = A1_347.Amount
  L5_351 = L5_351 + L6_352
  L4_350.InitializeShield_Amount = L5_351
  L5_351 = A1_347.AmountVar
  if L5_351 ~= nil then
    L5_351 = A1_347.HealShieldMod
    if L5_351 ~= nil and L5_351 == true then
      L6_352 = A1_347.AttackerVar
      L7_353 = 0
      if L6_352 ~= nil then
        L7_353 = GetPercentHealingAmountMod(A0_346[L6_352])
      end
      L4_350.InitializeShield_Amount, L3_349[A1_347.AmountVar] = (A1_347.Amount + L3_349[A1_347.AmountVar]) * (1 + L7_353), (A1_347.Amount + L3_349[A1_347.AmountVar]) * (1 + L7_353)
    end
  end
  L5_351 = SpellBuffAddNoRenew
  L6_352 = A1_347.AttackerVar
  L6_352 = A0_346[L6_352]
  L7_353 = A1_347.UnitVar
  L7_353 = A0_346[L7_353]
  L5_351(L6_352, L7_353, "InitializeShieldMarker", 0, 1, 25000, L4_350)
  L5_351 = BBIncreaseShield
  L6_352 = A0_346
  L7_353 = A1_347
  L5_351(L6_352, L7_353)
end
BBInitializeShield = L0_0
function L0_0(A0_354, A1_355)
  if A1_355.CDVar ~= nil then
  end
  if A1_355.CD ~= nil then
  end
  if A1_355.TargetVar ~= nil then
    GetTable(A0_354, A1_355.DestVarTable, false)[A1_355.DestVar] = (0 + GetTable(A0_354, A1_355.CDVarTable, true)[A1_355.CDVar] + A1_355.CD) * (1 + GetPercentCooldownMod(A0_354[A1_355.TargetVar]))
  else
    GetTable(A0_354, A1_355.DestVarTable, false)[A1_355.DestVar] = A1_355.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_356, A1_357)
  local L2_358, L3_359
  L3_359 = A1_357.TargetVar
  if L3_359 ~= nil then
    L2_358 = A1_357.Stat(A0_356[L3_359])
  else
    L2_358 = A1_357.Stat()
  end
  SetVarInTable(A0_356, A1_357, L2_358)
end
BBGetStat = L0_0
function L0_0(A0_360, A1_361)
  if A1_361.TargetVar ~= nil then
    GetTable(A0_360, A1_361.DestVarTable, false)[A1_361.DestVar] = GetLevel(A0_360[A1_361.TargetVar])
  else
    GetTable(A0_360, A1_361.DestVarTable, false)[A1_361.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_362, A1_363)
  if A1_363.TargetVar ~= nil then
    GetTable(A0_362, A1_363.DestVarTable, false)[A1_363.DestVar] = GetUnitSignificance(A0_362[A1_363.TargetVar])
  else
    GetTable(A0_362, A1_363.DestVarTable, false)[A1_363.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_364, A1_365)
  if A1_365.TargetVar ~= nil then
    GetTable(A0_364, A1_365.DestVarTable, false)[A1_365.DestVar] = GetArmor(A0_364[A1_365.TargetVar])
  else
    GetTable(A0_364, A1_365.DestVarTable, false)[A1_365.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_366, A1_367)
  if A1_367.TargetVar ~= nil then
    GetTable(A0_366, A1_367.DestVarTable, false)[A1_367.DestVar] = GetSpellBlock(A0_366[A1_367.TargetVar])
  else
    GetTable(A0_366, A1_367.DestVarTable, false)[A1_367.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_368, A1_369)
  local L2_370, L3_371
  L3_371 = A1_369.TargetVar
  if L3_371 ~= nil then
    L2_370 = GetTeamID(A0_368[L3_371])
  else
    L2_370 = GetTeamID()
  end
  SetVarInTable(A0_368, A1_369, L2_370)
end
BBGetTeamID = L0_0
function L0_0(A0_372, A1_373)
  local L2_374, L3_375, L4_376
  L2_374 = GetTable
  L3_375 = A0_372
  L4_376 = A1_373.DestVarTable
  L2_374 = L2_374(L3_375, L4_376, false)
  L3_375 = A1_373.TargetVar
  L4_376 = nil
  if L3_375 ~= nil then
    L4_376 = GetTeamID(A0_372[L3_375])
  else
    L4_376 = GetTeamID()
  end
  if L4_376 == TEAM_ORDER then
    L2_374[A1_373.DestVar] = TEAM_CHAOS
  elseif L4_376 == TEAM_CHAOS then
    L2_374[A1_373.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_377, A1_378)
  if A1_378.TargetVar ~= nil then
    GetTable(A0_377, A1_378.DestVarTable, false)[A1_378.DestVar] = GetUnitSkinName(A0_377[A1_378.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_379, A1_380)
  local L2_381, L3_382, L4_383
  L2_381 = GetTable
  L3_382 = A0_379
  L4_383 = A1_380.DestVarTable
  L2_381 = L2_381(L3_382, L4_383, false)
  L3_382 = A0_379.Owner
  L4_383 = nil
  if A1_380.TargetVar ~= nil then
    L4_383 = GetTotalAttackDamage(A0_379[A1_380.TargetVar])
  else
    L4_383 = GetTotalAttackDamage()
  end
  SetVarInTable(A0_379, A1_380, L4_383)
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_384, A1_385)
  GetTable(A0_384, A1_385.DestVarTable, true)[A1_385.DestVar] = A1_385.Status(A0_384[A1_385.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_386, A1_387)
  local L2_388
  L2_388 = A1_387.TargetVar
  L2_388 = A0_386[L2_388]
  ClearAttackTarget(L2_388)
end
BBClearAttackTarget = L0_0
function L0_0(A0_389, A1_390)
  local L2_391, L3_392
  L2_391 = GetTable
  L3_392 = A0_389
  L2_391 = L2_391(L3_392, A1_390.DestVarTable, true)
  L3_392 = A1_390.Info
  L3_392 = L3_392(A0_389[A1_390.TargetVar])
  SetVarInTable(A0_389, A1_390, L3_392)
end
BBGetCastInfo = L0_0
function L0_0(A0_393, A1_394, A2_395)
  local L3_396, L4_397, L5_398, L6_399
  L3_396 = GetTable
  L4_397 = A0_393
  L5_398 = A1_394.TrackTimeVarTable
  L6_399 = false
  L3_396 = L3_396(L4_397, L5_398, L6_399)
  L4_397 = GetTime
  L4_397 = L4_397()
  L5_398 = A1_394.ExecuteImmediately
  L6_399 = GetParam
  L6_399 = L6_399("TimeBetweenExecutions", A0_393, A1_394)
  if A1_394.TickTimeVar ~= nil and GetTable(A0_393, A1_394.TickTimeVarTable, false)[A1_394.TickTimeVar] ~= nil then
    L6_399 = GetTable(A0_393, A1_394.TickTimeVarTable, false)[A1_394.TickTimeVar]
  end
  if L3_396[A1_394.TrackTimeVar] == nil then
    L3_396[A1_394.TrackTimeVar] = L4_397
    if L5_398 == true then
      ExecuteBuildingBlocks(A2_395, A0_393)
    end
  end
  if L4_397 >= L3_396[A1_394.TrackTimeVar] + L6_399 then
    L3_396[A1_394.TrackTimeVar] = L3_396[A1_394.TrackTimeVar] + L6_399
    ExecuteBuildingBlocks(A2_395, A0_393)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_400, A1_401, A2_402)
  GetTable(A0_400, A1_401.TrackTimeVarTable, false)[A1_401.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_403, A1_404)
  local L2_405
  L2_405 = A1_404.SrcValue
  if A1_404.SrcVar ~= nil then
    L2_405 = GetTable(A0_403, A1_404.SrcVarTable, true)[A1_404.SrcVar]
  end
  A1_404.Status(A0_403[A1_404.TargetVar], L2_405)
end
BBSetStatus = L0_0
function L0_0(A0_406, A1_407)
  local L2_408
  L2_408 = A1_407.ToAlert
  if GetTable(A0_406, A1_407.SrcVarTable, false) ~= nil and A1_407.SrcVar ~= nil then
    L2_408 = L2_408 .. GetTable(A0_406, A1_407.SrcVarTable, false)[A1_407.SrcVar]
  end
  _ALERT(L2_408)
end
BBAlert = L0_0
function L0_0(A0_409, A1_410)
  local L2_411, L3_412, L4_413, L5_414, L6_415, L7_416
  L2_411 = GetParam
  L3_412 = "Message"
  L4_413 = A0_409
  L5_414 = A1_410
  L2_411 = L2_411(L3_412, L4_413, L5_414)
  if L2_411 == nil then
    L3_412 = ReportError
    L4_413 = "Could not resolve Message param"
    L3_412(L4_413)
    return
  end
  L3_412 = true
  L4_413 = GetParam
  L5_414 = "OnUnit"
  L6_415 = A0_409
  L7_416 = A1_410
  L4_413 = L4_413(L5_414, L6_415, L7_416)
  if L4_413 == nil then
    L3_412 = false
    L5_414 = GetParam
    L6_415 = "OnUnitByFlag"
    L7_416 = A0_409
    L5_414 = L5_414(L6_415, L7_416, A1_410)
    L4_413 = L5_414
  end
  if L4_413 == nil then
    L5_414 = ReportError
    L6_415 = "Could not resolve OnUnit param"
    L5_414(L6_415)
    return
  end
  L5_414 = true
  L6_415 = GetParam
  L7_416 = "ChampionToSayTo"
  L6_415 = L6_415(L7_416, A0_409, A1_410)
  if L6_415 == nil then
    L5_414 = false
    L7_416 = GetParam
    L7_416 = L7_416("ChampionToSayToByFlag", A0_409, A1_410)
    L6_415 = L7_416
  end
  if L6_415 == nil then
    L7_416 = ReportError
    L7_416("Could not resolve ChampionToSayTo param")
    return
  end
  L7_416 = GetParam
  L7_416 = L7_416("ShowToSpectator", A0_409, A1_410)
  if L7_416 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  SayWithFloatingTextOnUnitToChampion(tostring(L2_411), A1_410.TextType, L4_413, L3_412, L6_415, L5_414, L7_416)
end
BBSayWithFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_417, A1_418)
  local L2_419, L3_420, L4_421
  L2_419 = A1_418.ToSay
  L3_420 = GetTable
  L4_421 = A0_417
  L3_420 = L3_420(L4_421, A1_418.SrcVarTable, false)
  if L3_420 ~= nil then
    L4_421 = A1_418.SrcVar
    if L4_421 ~= nil then
      L4_421 = L2_419
      L2_419 = L4_421 .. tostring(L3_420[A1_418.SrcVar])
    end
  end
  L4_421 = nil
  if A1_418.OwnerVar ~= nil then
    L4_421 = A0_417[A1_418.OwnerVar]
  else
    L4_421 = A0_417.Owner
  end
  if A1_418.TextType == nil then
    A1_418.TextType = 0
  end
  Say(L4_421, L2_419, A1_418.TextType)
end
BBSay = L0_0
function L0_0(A0_422, A1_423)
  local L2_424, L3_425, L4_426
  L2_424 = A1_423.ToSay
  L3_425 = GetTable
  L4_426 = A0_422
  L3_425 = L3_425(L4_426, A1_423.SrcVarTable, false)
  if L3_425 ~= nil then
    L4_426 = A1_423.SrcVar
    if L4_426 ~= nil then
      L4_426 = L2_424
      L2_424 = L4_426 .. tostring(L3_425[A1_423.SrcVar])
    end
  end
  L4_426 = nil
  if A1_423.OwnerVar ~= nil then
    L4_426 = A0_422[A1_423.OwnerVar]
  else
    L4_426 = A0_422.Owner
  end
  if A1_423.TextType == nil then
    A1_423.TextType = 0
  end
  Say(L4_426, L2_424, A1_423.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_427, A1_428)
  GetTable(A0_427, A1_428.DestVarTable, true)[A1_428.DestVar] = BBLuaGetGold(A0_427, A1_428)
end
BBGetGold = L0_0
function L0_0(A0_429, A1_430)
  GetTable(A0_429, A1_430.DestVarTable, true)[A1_430.DestVar] = BBLuaGetTotalGold(A0_429, A1_430)
end
BBGetTotalGold = L0_0
function L0_0(A0_431, A1_432)
  SpellBuffAdd(A0_431[A1_432.OwnerVar], A0_431[A1_432.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_431.NextBuffVars)
  BBTeleportToPositionHelper(A0_431, A1_432)
end
BBTeleportToPosition = L0_0
function L0_0(A0_433, A1_434)
  if A1_434.XVar ~= nil and GetTable(A0_433, A1_434.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_433, A1_434.XVarTable, true)[A1_434.XVar]
  else
    Xloc = A1_434.X
  end
  if A1_434.YVar ~= nil and GetTable(A0_433, A1_434.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_433, A1_434.YVarTable, true)[A1_434.YVar]
  else
    Yloc = A1_434.Y
  end
  if A1_434.ZVar ~= nil and GetTable(A0_433, A1_434.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_433, A1_434.ZVarTable, true)[A1_434.ZVar]
  else
    Zloc = A1_434.Z
  end
  A1_434.OwnerVar, A0_433.position = A1_434.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_434.CastPositionName = "position"
  BBTeleportToPosition(A0_433, A1_434)
end
BBTeleportToPoint = L0_0
function L0_0(A0_435, A1_436)
  DefUpdateAura(GetTable(A0_435, A1_436.CenterTable, false)[A1_436.CenterVar], A1_436.Range, A1_436.UnitScan, A1_436.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_437, A1_438)
  ReincarnateNonDeadHero(GetTable(A0_437, A1_438.TargetTable, false)[A1_438.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_439, A1_440)
  GetTable(A0_439, A1_440.DestVarTable, true)[A1_440.DestVar] = A1_440.Function(A0_439[A1_440.OwnerVar], A1_440.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_441, A1_442)
  local L2_443, L3_444, L4_445, L5_446
  L2_443 = A1_442.WhomToOrderVar
  L2_443 = A0_441[L2_443]
  L3_444 = A1_442.TargetOfOrderVar
  L3_444 = A0_441[L3_444]
  L4_445 = GetTable
  L5_446 = A0_441
  L4_445 = L4_445(L5_446, A1_442.SrcVarTable, false)
  L5_446 = nil
  if A1_442.SrcVar ~= nil and L4_445 ~= nil then
    L5_446 = L4_445[A1_442.SrcVar]
  else
    L5_446 = GetPosition(L3_444)
  end
  if L3_444 == nil then
    L3_444 = L2_443
  end
  IssueOrder(L2_443, A1_442.Order, L5_446, L3_444)
end
BBIssueOrder = L0_0
function L0_0(A0_447, A1_448)
  local L2_449
  L2_449 = GetParam
  L2_449 = L2_449("NewRange", A0_447, A1_448)
  SetSpellCastRange(L2_449)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_450, A1_451)
  GetTable(A0_450, A1_451.DestVarTable, true)[A1_451.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_452, A1_453)
  local L2_454, L3_455
  L2_454 = A1_453.ObjectVar1
  L2_454 = A0_452[L2_454]
  L3_455 = A1_453.ObjectVar2
  L3_455 = A0_452[L3_455]
  GetTable(A0_452, A1_453.DestVarTable, true)[A1_453.DestVar] = DistanceBetweenObjectBounds(L2_454, L3_455)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_456, A1_457)
  local L2_458, L3_459, L4_460
  L2_458 = A1_457.ObjectVar
  L2_458 = A0_456[L2_458]
  L3_459 = GetTable
  L4_460 = A0_456
  L3_459 = L3_459(L4_460, A1_457.PointVarTable, true)
  L4_460 = A1_457.PointVar
  L4_460 = L3_459[L4_460]
  GetTable(A0_456, A1_457.DestVarTable, true)[A1_457.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_458, L4_460)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_461, A1_462)
  local L2_463, L3_464
  L2_463 = GetParam
  L3_464 = "Point1"
  L2_463 = L2_463(L3_464, A0_461, A1_462)
  L3_464 = GetParam
  L3_464 = L3_464("Point2", A0_461, A1_462)
  GetTable(A0_461, A1_462.DestVarTable, true)[A1_462.DestVar] = DistanceBetweenPoints(L2_463, L3_464)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_465, A1_466, A2_467)
  local L3_468, L4_469, L5_470, L6_471, L7_472, L8_473
  L5_470 = 0
  L6_471 = nil
  L7_472 = A1_466.ObjectDistanceType
  L8_473 = A1_466.ObjectVar1
  L3_468 = A0_465[L8_473]
  L8_473 = A1_466.ObjectVar2
  L4_469 = A0_465[L8_473]
  if nil == L4_469 then
    L8_473 = A1_466.Point2Var
    if nil ~= L8_473 then
      L8_473 = GetTable
      L8_473 = L8_473(A0_465, A1_466.Point2VarTable, true)
      L4_469 = L8_473[A1_466.Point2Var]
      L5_470 = L5_470 + 1
    end
  end
  if nil == L3_468 then
    L8_473 = A1_466.Point1Var
    if nil ~= L8_473 then
      L8_473 = GetTable
      L8_473 = L8_473(A0_465, A1_466.Point1VarTable, true)
      L3_468 = L8_473[A1_466.Point1Var]
      L5_470 = L5_470 + 1
      if 1 == L5_470 then
        L3_468, L4_469 = L4_469, L3_468
      end
    end
  end
  if nil ~= L7_472 then
    if 0 == L5_470 then
      L8_473 = OBJECT_CENTER
      if L8_473 == L7_472 then
        L6_471 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_473 = OBJECT_BOUNDARY
        if L8_473 == L7_472 then
          L6_471 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_473 = A1_466.OwnerVar
          L8_473 = A0_465[L8_473]
          Say(L8_473, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_470 then
      L8_473 = OBJECT_CENTER
      if L8_473 == L7_472 then
        L6_471 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_473 = OBJECT_BOUNDARY
        if L8_473 == L7_472 then
          L6_471 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_473 = A1_466.OwnerVar
          L8_473 = A0_465[L8_473]
          Say(L8_473, "invalid object distance type", 0)
        end
      end
    else
      L6_471 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_473 = A1_466.Distance
  if A1_466.DistanceVar ~= nil and GetTable(A0_465, A1_466.DistanceVarTable, true) ~= nil then
    L8_473 = L8_473 + GetTable(A0_465, A1_466.DistanceVarTable, true)[A1_466.DistanceVar]
  end
  if L3_468 ~= nil and L4_469 ~= nil and L6_471 ~= nil and L8_473 ~= nil then
    if not L6_471(L3_468, L4_469, L8_473) then
      ExecuteBuildingBlocks(A2_467, A0_465)
      A0_465.LastIfSucceeded = true
    else
      A0_465.LastIfSucceeded = false
    end
  else
    A0_465.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_474, A1_475)
  local L2_476, L3_477
  L2_476 = A1_475.TargetVar
  L2_476 = A0_474[L2_476]
  L3_477 = A1_475.CasterVar
  L3_477 = A0_474[L3_477]
  GetTable(A0_474, A1_475.DestVarTable, true)[A1_475.DestVar] = SpellBuffCount(L2_476, A1_475.BuffName, L3_477)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_478, A1_479)
  local L2_480
  L2_480 = A1_479.TargetVar
  L2_480 = A0_478[L2_480]
  GetTable(A0_478, A1_479.DestVarTable, true)[A1_479.DestVar] = SpellBuffCount(L2_480, A1_479.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_481, A1_482)
  local L2_483, L3_484
  L2_483 = GetTable
  L3_484 = A0_481
  L2_483 = L2_483(L3_484, A1_482.ScaleVarTable, false)
  L3_484 = nil
  if A1_482.OwnerVar ~= nil then
    L3_484 = A0_481[A1_482.OwnerVar]
  else
    L3_484 = A0_481.Owner
  end
  if A1_482.ScaleVar ~= nil and A1_482.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_483[A1_482.ScaleVar], L3_484)
  else
    SetScaleSkinCoef(A1_482.Scale, L3_484)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_485, A1_486)
  SpellBuffAdd(A0_485[A1_486.TargetVar], A0_485[A1_486.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_485.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_487, A1_488, A2_489)
  local L3_490, L4_491
  L3_490 = A1_488.TargetVar
  L3_490 = A0_487[L3_490]
  L4_491 = A1_488.NumStacks
  if GetParam("NumStacks", A0_487, A1_488) == 0 then
    L4_491 = SpellBuffCount(L3_490, A1_488.BuffName, caster)
  else
    L4_491 = GetParam("NumStacks", A0_487, A1_488)
  end
  while L4_491 > 0 do
    SpellBuffRemove(L3_490, A1_488.BuffName, A0_487[A1_488.AttackerVar])
    L4_491 = L4_491 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_492, A1_493, A2_494)
  if A0_492.EmoteId == A1_493.EmoteId then
    ExecuteBuildingBlocks(A2_494, A0_492)
    A0_492.LastIfSucceeded = true
  else
    A0_492.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_495, A1_496, A2_497)
  if A0_495.EmoteId ~= A1_496.EmoteId then
    ExecuteBuildingBlocks(A2_497, A0_495)
    A0_495.LastIfSucceeded = true
  else
    A0_495.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_498, A1_499)
  local L2_500, L3_501, L4_502, L5_503
  L2_500 = GetTable
  L3_501 = A0_498
  L4_502 = A1_499.String1VarTable
  L5_503 = false
  L2_500 = L2_500(L3_501, L4_502, L5_503)
  L3_501 = A1_499.String1Var
  L3_501 = L2_500[L3_501]
  L4_502 = GetTable
  L5_503 = A0_498
  L4_502 = L4_502(L5_503, A1_499.String2VarTable, false)
  L5_503 = A1_499.String2Var
  L5_503 = L4_502[L5_503]
  GetTable(A0_498, A1_499.ResultVarTable, false)[A1_499.ResultVar] = L3_501 .. L5_503
end
BBConcatenateStrings = L0_0
function L0_0(A0_504, A1_505)
  local L2_506, L3_507
  L2_506 = GetTable
  L3_507 = A0_504
  L2_506 = L2_506(L3_507, A1_505.VariableVarTable, false)
  L3_507 = A1_505.VariableVar
  L3_507 = L2_506[L3_507]
  GetTable(A0_504, A1_505.ResultVarTable, false)[A1_505.ResultVar] = "(" .. L3_507 .. ")"
end
BBEncaseInParantheses = L0_0
function L0_0(A0_508, A1_509)
  BBGetMinionKills(A0_508, A1_509)
  A0_508.MinionKillSource = GetParam("MinionKillTarget")
  A0_508.MinionKills = A0_508.MinionsKilled + GetParam("MinionKills", A0_508, A1_509)
  BBSetMinionKills(A0_508, A1_509)
end
BBIncreaseMinionKills = L0_0
