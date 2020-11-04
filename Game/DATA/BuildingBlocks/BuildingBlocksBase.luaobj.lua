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
  return IsObjectMarker(A0_167)
end
CO_IS_TYPE_MARKER = L0_0
function L0_0(A0_168)
  return IsObjectMarker(A0_168) ~= true
end
CO_IS_NOT_MARKER = L0_0
function L0_0(A0_169)
  return IsClone(A0_169)
end
CO_IS_CLONE = L0_0
function L0_0(A0_170)
  return IsClone(A0_170) ~= true
end
CO_IS_NOT_CLONE = L0_0
function L0_0(A0_171)
  return IsMelee(A0_171)
end
CO_IS_MELEE = L0_0
function L0_0(A0_172)
  return IsMelee(A0_172) ~= true
end
CO_IS_RANGED = L0_0
function L0_0(A0_173)
  return A0_173 > math.random()
end
CO_RANDOM_CHANCE_LESS_THAN = L0_0
function L0_0(A0_174)
  return IsTurretAI(A0_174)
end
CO_IS_TYPE_TURRET = L0_0
function L0_0(A0_175)
  return IsTurretAI(A0_175) ~= true
end
CO_IS_NOT_TURRET = L0_0
function L0_0(A0_176)
  return IsDampener(A0_176)
end
CO_IS_TYPE_INHIBITOR = L0_0
function L0_0(A0_177)
  return IsDampener(A0_177) ~= true
end
CO_IS_NOT_INHIBITOR = L0_0
function L0_0(A0_178)
  return IsHQ(A0_178)
end
CO_IS_TYPE_NEXUS = L0_0
function L0_0(A0_179)
  return IsHQ(A0_179) ~= true
end
CO_IS_NOT_NEXUS = L0_0
function L0_0(A0_180)
  return IsDead(A0_180)
end
CO_IS_DEAD = L0_0
function L0_0(A0_181)
  return IsDead(A0_181) ~= true
end
CO_IS_NOT_DEAD = L0_0
function L0_0(A0_182)
  return IsDeadOrZombie(A0_182)
end
CO_IS_DEAD_OR_ZOMBIE = L0_0
function L0_0(A0_183, A1_184)
  return BBIsTargetInFrontOfMe(A0_183, A1_184)
end
CO_IS_TARGET_IN_FRONT_OF_ME = L0_0
function L0_0(A0_185, A1_186)
  return BBIsTargetBehindMe(A0_185, A1_186)
end
CO_IS_TARGET_BEHIND_ME = L0_0
function L0_0(A0_187)
  return IsWard(A0_187)
end
CO_IS_WARD = L0_0
function L0_0(A0_188)
  return IsStructure(A0_188)
end
CO_IS_STRUCTURE = L0_0
function L0_0(A0_189)
  return IsStructure(A0_189) ~= true
end
CO_IS_NOT_STRUCTURE = L0_0
function L0_0(A0_190)
  local L1_191
  L1_191 = A0_190 ~= nil
  return L1_191
end
CO_IS_NOT_NIL = L0_0
function L0_0(A0_192, A1_193, A2_194)
  GetTable(A0_192, A1_193.MacroVarTable, true)[A1_193.MacroVar] = A2_194
end
BBCreateMacro = L0_0
function L0_0(A0_195, A1_196)
  local L2_197
  L2_197 = GetParam
  L2_197 = L2_197("Macro", A0_195, A1_196)
  if L2_197 ~= nil and type(L2_197) == "table" then
    ExecuteBuildingBlocks(L2_197, A0_195)
  else
    DebugClientPrint("Designer Error: Macro variable is not initialized inside of event. Macro Variable was: " .. tostring(A1_196.MacroVar) .. " and current block data is: " .. gCurrentBuildingBlockString .. ". This error probably occurred due to variable not being initialized yet, being misnamed or two events being called out of sequence. It is highly recommended that script macros either be initialized OnBuffActivate, OnCharActivate or in the same event. Pro Devs may violate this rule at the risk of being forced to read this error message again.")
  end
end
BBRunMacro = L0_0
function L0_0(A0_198, A1_199, A2_200)
  local L3_201, L4_202, L5_203, L6_204
  L3_201 = GetTable
  L4_202 = A0_198
  L5_203 = A1_199.Src1VarTable
  L6_204 = false
  L3_201 = L3_201(L4_202, L5_203, L6_204)
  L4_202 = GetTable
  L5_203 = A0_198
  L6_204 = A1_199.Src2VarTable
  L4_202 = L4_202(L5_203, L6_204, false)
  L5_203 = false
  L6_204 = nil
  if L3_201 ~= nil and A1_199.Src1Var ~= nil then
    L6_204 = L3_201[A1_199.Src1Var]
  else
    L6_204 = A1_199.Value1
  end
  if L4_202 ~= nil and A1_199.Src2Var ~= nil then
    L5_203 = A1_199.CompareOp(L6_204, L4_202[A1_199.Src2Var])
  else
    L5_203 = A1_199.CompareOp(L6_204, A1_199.Value2)
  end
  if L5_203 then
    ExecuteBuildingBlocks(A2_200, A0_198)
    A0_198.LastIfSucceeded = true
  else
    A0_198.LastIfSucceeded = false
  end
end
BBIf = L0_0
function L0_0(A0_205, A1_206, A2_207)
  if A0_205.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_207, A0_205)
    A0_205.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_208, A1_209, A2_210)
  if A0_208.LastIfSucceeded == true then
    ExecuteBuildingBlocks(A2_210, A0_208)
    A0_208.LastIfSucceeded = true
  else
    BBIf(A0_208, A1_209, A2_210)
  end
end
BBOrIf = L0_0
function L0_0(A0_211, A1_212, A2_213)
  if A0_211.LastIfSucceeded == true then
    BBIf(A0_211, A1_212, A2_213)
  end
end
BBAndIf = L0_0
function L0_0(A0_214, A1_215, A2_216)
  local L3_217, L4_218, L5_219, L6_220
  L3_217 = A0_214.LastIfSucceeded
  if L3_217 == false then
    L3_217 = GetTable
    L4_218 = A0_214
    L5_219 = A1_215.Src1VarTable
    L6_220 = false
    L3_217 = L3_217(L4_218, L5_219, L6_220)
    L4_218 = GetTable
    L5_219 = A0_214
    L6_220 = A1_215.Src2VarTable
    L4_218 = L4_218(L5_219, L6_220, false)
    L5_219 = false
    L6_220 = nil
    if L3_217 ~= nil and A1_215.Src1Var ~= nil then
      L6_220 = L3_217[A1_215.Src1Var]
    else
      L6_220 = A1_215.Value1
    end
    if L4_218 ~= nil and A1_215.Src2Var ~= nil then
      L5_219 = A1_215.CompareOp(L6_220, L4_218[A1_215.Src2Var])
    else
      L5_219 = A1_215.CompareOp(L6_220, A1_215.Value2)
    end
    if L5_219 then
      ExecuteBuildingBlocks(A2_216, A0_214)
      A0_214.LastIfSucceeded = true
    else
      A0_214.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_221, A1_222, A2_223)
  local L3_224
  if A1_222.TargetVar ~= nil then
    L3_224 = A0_221[A1_222.TargetVar]
  else
    L3_224 = A0_221.Target
  end
  if HasBuffOfType(L3_224, A1_222.BuffType) then
    ExecuteBuildingBlocks(A2_223, A0_221)
    A0_221.LastIfSucceeded = true
  else
    A0_221.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_225, A1_226, A2_227)
  local L3_228, L4_229
  if A1_226.OwnerVar ~= nil then
    L3_228 = A0_225[A1_226.OwnerVar]
  else
    L3_228 = A0_225.Owner
  end
  if A1_226.AttackerVar ~= nil then
    L4_229 = A0_225[A1_226.AttackerVar]
  else
    L4_229 = A0_225.Attacker
  end
  if SpellBuffCount(L3_228, A1_226.BuffName, L4_229) > 0 then
    ExecuteBuildingBlocks(A2_227, A0_225)
    A0_225.LastIfSucceeded = true
  else
    A0_225.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_230, A1_231, A2_232)
  if BBIsMissileAutoAttack(A0_230, A1_231) then
    ExecuteBuildingBlocks(A2_232, A0_230)
    A0_230.LastIfSucceeded = true
  else
    A0_230.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_233, A1_234, A2_235)
  if BBIsMissileConsideredAsAutoAttack(A0_233, A1_234) then
    ExecuteBuildingBlocks(A2_235, A0_233)
    A0_233.LastIfSucceeded = true
  else
    A0_233.LastIfSucceeded = false
  end
end
BBIfMissileConsideredAsAutoAttack = L0_0
function L0_0(A0_236, A1_237)
  A0_236.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_238, A1_239, A2_240)
  local L3_241, L4_242
  if A1_239.OwnerVar ~= nil then
    L3_241 = A0_238[A1_239.OwnerVar]
  else
    L3_241 = A0_238.Owner
  end
  if A1_239.CasterVar ~= nil then
    L4_242 = A0_238[A1_239.CasterVar]
  else
    L4_242 = A0_238.Caster
  end
  if SpellBuffCount(L3_241, A1_239.BuffName, L4_242) <= 0 then
    ExecuteBuildingBlocks(A2_240, A0_238)
    A0_238.LastIfSucceeded = true
  else
    A0_238.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_243, A1_244, A2_245)
  local L3_246
  if A1_244.TargetVar ~= nil then
    L3_246 = A0_243[A1_244.TargetVar]
  else
    L3_246 = A0_243.Owner
  end
  if HasUnitTag(L3_246, A1_244.UnitTag) ~= A1_244.InvertResult then
    ExecuteBuildingBlocks(A2_245, A0_243)
    A0_243.LastIfSucceeded = true
  else
    A0_243.LastIfSucceeded = false
  end
end
BBIfHasUnitTag = L0_0
function L0_0(A0_247, A1_248, A2_249)
  local L3_250, L4_251
  if A1_248.OwnerVar ~= nil then
    L3_250 = A0_247[A1_248.OwnerVar]
  else
    L3_250 = A0_247.Owner
  end
  if HasPARType(L3_250, A1_248.PARType) then
    ExecuteBuildingBlocks(A2_249, A0_247)
    A0_247.LastIfSucceeded = true
  else
    A0_247.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_252, A1_253, A2_254)
  local L3_255, L4_256
  if A1_253.OwnerVar ~= nil then
    L3_255 = A0_252[A1_253.OwnerVar]
  else
    L3_255 = A0_252.Owner
  end
  if not HasPARType(L3_255, A1_253.PARType) then
    ExecuteBuildingBlocks(A2_254, A0_252)
    A0_252.LastIfSucceeded = true
  else
    A0_252.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_257, A1_258, A2_259)
  local L3_260, L4_261, L5_262, L6_263, L7_264
  L3_260 = GetTable
  L4_261 = A0_257
  L5_262 = A1_258.Src1VarTable
  L6_263 = false
  L3_260 = L3_260(L4_261, L5_262, L6_263)
  L4_261 = GetTable
  L5_262 = A0_257
  L6_263 = A1_258.Src2VarTable
  L7_264 = false
  L4_261 = L4_261(L5_262, L6_263, L7_264)
  L5_262 = true
  while L5_262 do
    L6_263 = false
    L7_264 = nil
    if L3_260 ~= nil and A1_258.Src1Var ~= nil then
      L7_264 = L3_260[A1_258.Src1Var]
    else
      L7_264 = A1_258.Value1
    end
    if L4_261 ~= nil and A1_258.Src2Var ~= nil then
      L6_263 = A1_258.CompareOp(L7_264, L4_261[A1_258.Src2Var])
    else
      L6_263 = A1_258.CompareOp(L7_264, A1_258.Value2)
    end
    if L6_263 then
      ExecuteBuildingBlocks(A2_259, A0_257)
    else
      L5_262 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_265, A1_266)
  return A0_265 * A1_266
end
MO_MULTIPLY = L0_0
function L0_0(A0_267, A1_268)
  return A0_267 + A1_268
end
MO_ADD = L0_0
function L0_0(A0_269, A1_270)
  return A0_269 - A1_270
end
MO_SUBTRACT = L0_0
function L0_0(A0_271, A1_272)
  return A0_271 / A1_272
end
MO_DIVIDE = L0_0
function L0_0(A0_273, A1_274)
  if A0_273 < A1_274 then
    return A0_273
  else
    return A1_274
  end
end
MO_MIN = L0_0
function L0_0(A0_275, A1_276)
  if A1_276 < A0_275 then
    return A0_275
  else
    return A1_276
  end
end
MO_MAX = L0_0
function L0_0(A0_277, A1_278)
  return A0_277 % A1_278
end
MO_MODULO = L0_0
function L0_0(A0_279)
  return math.floor(A0_279 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_280)
  return math.ceil(A0_280)
end
MO_ROUNDUP = L0_0
function L0_0(A0_281)
  return math.floor(A0_281)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_282)
  return math.sin(math.rad(A0_282))
end
MO_SIN = L0_0
function L0_0(A0_283)
  return math.cos(math.rad(A0_283))
end
MO_COSINE = L0_0
function L0_0(A0_284)
  return math.tan(math.rad(A0_284))
end
MO_TANGENT = L0_0
function L0_0(A0_285)
  return math.deg(math.asin(A0_285))
end
MO_ASIN = L0_0
function L0_0(A0_286)
  return math.deg(math.acos(A0_286))
end
MO_ACOS = L0_0
function L0_0(A0_287)
  return math.deg(math.atan(A0_287))
end
MO_ATAN = L0_0
function L0_0(A0_288, A1_289)
  return math.pow(A0_288, A1_289)
end
MO_POW = L0_0
function L0_0(A0_290)
  return math.sqrt(A0_290)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_291, A1_292)
  local L2_293
  L2_293 = A0_291 and A1_292
  return L2_293
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_294, A1_295)
  local L2_296
  L2_296 = A0_294 or A1_295
  return L2_296
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_297)
  local L1_298
  L1_298 = not A0_297
  return L1_298
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_299)
  return math.abs(A0_299)
end
MO_ABS = L0_0
function L0_0(A0_300, A1_301)
  return math.random(A0_300, A1_301)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_302, A1_303)
  local L2_304, L3_305, L4_306, L5_307
  L2_304 = GetMathNumber
  L3_305 = A0_302
  L4_306 = A1_303.Src1VarTable
  L5_307 = A1_303.Src1Var
  L2_304 = L2_304(L3_305, L4_306, L5_307, A1_303.Src1Value)
  L3_305 = GetMathNumber
  L4_306 = A0_302
  L5_307 = A1_303.Src2VarTable
  L3_305 = L3_305(L4_306, L5_307, A1_303.Src2Var, A1_303.Src2Value)
  L4_306 = GetTable
  L5_307 = A0_302
  L4_306 = L4_306(L5_307, A1_303.DestVarTable)
  L5_307 = A1_303.MathOp
  L5_307 = L5_307(L2_304, L3_305)
  SetVarInTable(A0_302, A1_303, L5_307)
end
BBMath = L0_0
function L0_0(A0_308, A1_309, A2_310, A3_311)
  if A2_310 ~= nil and GetTable(A0_308, A1_309)[A2_310] ~= nil then
    return GetTable(A0_308, A1_309)[A2_310]
  end
  return A3_311
end
GetMathNumber = L0_0
function L0_0(A0_312, A1_313)
  if type(A1_313) == "number" then
    return A1_313
  elseif type(A1_313) == "function" then
    return A1_313(A0_312)
  elseif type(A1_313) == "string" then
    return A0_312[A1_313]
  end
end
GetNumber = L0_0
function L0_0(A0_314, A1_315)
  return VectorAdd(A0_314, A1_315)
end
VEC_ADD = L0_0
function L0_0(A0_316, A1_317)
  return VectorSubtract(A0_316, A1_317)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_318, A1_319)
  return VectorScalarMultiply(A0_318, A1_319)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_320, A1_321)
  return VectorScalarDivide(A0_320, A1_321)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_322, A1_323)
  return VectorRotateY(A0_322, A1_323)
end
VEC_ROTATE = L0_0
function L0_0(A0_324, A1_325)
  BBMath(A0_324, A1_325)
end
BBVectorMath = L0_0
function L0_0(A0_326, A1_327)
  local L2_328, L3_329, L4_330, L5_331
  L2_328 = A0_326.InstanceVars
  L3_329 = L2_328.InterpDelta
  if L3_329 == nil then
    L3_329 = A1_327.Amount
    L4_330 = A1_327.AmountVar
    if L4_330 ~= nil then
      L4_330 = GetTable
      L5_331 = A0_326
      L4_330 = L4_330(L5_331, A1_327.AmountVarTable)
      L5_331 = A1_327.AmountVar
      L3_329 = L4_330[L5_331]
    end
    L4_330 = GetPosition
    L5_331 = A1_327.TargetVar
    L5_331 = A0_326[L5_331]
    L4_330 = L4_330(L5_331)
    L2_328.KnockBackStart = L4_330
    L4_330 = GetNormalizedPositionDelta
    L5_331 = A1_327.TargetVar
    L5_331 = A0_326[L5_331]
    L4_330 = L4_330(L5_331, A0_326[A1_327.AttackerVar], true)
    L5_331 = {}
    L5_331.x = L4_330.x * L3_329
    L5_331.y = 0
    L5_331.z = L4_330.z * L3_329
    L2_328.InterpDelta = L5_331
    L5_331 = GetTime
    L5_331 = L5_331()
    L2_328.StartTime = L5_331
    L5_331 = A1_327.KnockBackDuration
    L2_328.KnockBackDuration = L5_331
  end
  L3_329 = A1_327.TargetVar
  L3_329 = A0_326[L3_329]
  L4_330 = GetTime
  L4_330 = L4_330()
  L5_331 = L2_328.StartTime
  L4_330 = L4_330 - L5_331
  L5_331 = L2_328.KnockBackDuration
  L4_330 = L4_330 / L5_331
  L5_331 = {}
  L5_331.x = L2_328.KnockBackStart.x + L2_328.InterpDelta.x * L4_330
  L5_331.y = L2_328.KnockBackStart.y
  L5_331.z = L2_328.KnockBackStart.z + L2_328.InterpDelta.z * L4_330
  SetPosition(L3_329, L5_331)
end
BBKnockback = L0_0
function L0_0(A0_332, A1_333)
  local L2_334, L3_335
  L2_334 = GetParam
  L3_335 = "Left"
  L2_334 = L2_334(L3_335, A0_332, A1_333)
  L3_335 = GetParam
  L3_335 = L3_335("Right", A0_332, A1_333)
  GetTable(A0_332, A1_333.DestVarTable, true)[A1_333.DestVar] = tostring(L2_334) .. tostring(L3_335)
end
BBAppendString = L0_0
function L0_0(A0_336, A1_337)
  local L2_338
  L2_338 = 0
  if A1_337.Delta ~= nil then
    L2_338 = L2_338 + A1_337.Delta
  end
  if A1_337.DeltaByLevel ~= nil and A0_336.Level ~= nil then
    L2_338 = L2_338 + A1_337.DeltaByLevel[A0_336.Level]
  end
  if A1_337.DeltaVar ~= nil then
    L2_338 = L2_338 + GetTable(A0_336, A1_337.DeltaVarTable, true)[A1_337.DeltaVar]
  end
  if A1_337.TargetVar ~= nil then
    A1_337.Stat(L2_338, A0_336[A1_337.TargetVar])
  else
    A1_337.Stat(L2_338)
  end
end
BBIncStat = L0_0
function L0_0(A0_339, A1_340)
  local L2_341
  L2_341 = 0
  if A1_340.Delta ~= nil then
    L2_341 = L2_341 + A1_340.Delta
  end
  if A1_340.DeltaByLevel ~= nil and A0_339.Level ~= nil then
    L2_341 = L2_341 + A1_340.DeltaByLevel[A0_339.Level]
  end
  if A1_340.DeltaVar ~= nil then
    L2_341 = L2_341 + GetTable(A0_339, A1_340.DeltaVarTable, true)[A1_340.DeltaVar]
  end
  if A1_340.TargetVar ~= nil then
    A1_340.Stat(L2_341, A0_339[A1_340.TargetVar])
  else
    A1_340.Stat(L2_341)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_342, A1_343)
  local L2_344, L3_345
  L2_344 = A1_343.TargetVar
  L3_345 = 0
  if A1_343.LaneVar ~= nil then
    L3_345 = L3_345 + GetTable(A0_342, A1_343.LaneVarTable, true)[A1_343.LaneVar]
  end
  if A1_343.Lane ~= nil then
    L3_345 = L3_345 + A1_343.Lane
  end
  SetMinionLane(A0_342[L2_344], L3_345)
end
BBSetMinionLane = L0_0
function L0_0(A0_346, A1_347)
  if A1_347.AttackVar ~= nil then
  end
  if A1_347.Attack ~= nil then
  end
  if A1_347.TotalCoefficientVar ~= nil then
  end
  if A1_347.TotalCoefficient ~= nil then
  end
  if A1_347.TargetVar ~= nil then
    GetTable(A0_346, A1_347.DestVarTable, false)[A1_347.DestVar] = (0 + GetTable(A0_346, A1_347.AttackVarTable, true)[A1_347.AttackVar] + A1_347.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_346[A1_347.TargetVar])) + GetFlatCritDamageMod(A0_346[A1_347.TargetVar])) * (0 + GetTable(A0_346, A1_347.TotalCoefficientVarTable, true)[A1_347.TotalCoefficientVar] + A1_347.TotalCoefficient)
  else
    GetTable(A0_346, A1_347.DestVarTable, false)[A1_347.DestVar] = 2 * A1_347.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_348, A1_349)
  local L2_350, L3_351, L4_352, L5_353, L6_354, L7_355
  L2_350 = GetTable
  L3_351 = A0_348
  L4_352 = A1_349.DestVarTable
  L5_353 = false
  L2_350 = L2_350(L3_351, L4_352, L5_353)
  L3_351 = GetTable
  L4_352 = A0_348
  L5_353 = A1_349.AmountVarTable
  L6_354 = true
  L3_351 = L3_351(L4_352, L5_353, L6_354)
  L4_352 = GetTable
  L5_353 = A0_348
  L6_354 = A0_348.NextBuffVars
  L7_355 = false
  L4_352 = L4_352(L5_353, L6_354, L7_355)
  L5_353 = A1_349.AmountVar
  L5_353 = L3_351[L5_353]
  L6_354 = A1_349.Amount
  L5_353 = L5_353 + L6_354
  L4_352.InitializeShield_Amount = L5_353
  L5_353 = A1_349.AmountVar
  if L5_353 ~= nil then
    L5_353 = A1_349.HealShieldMod
    if L5_353 ~= nil and L5_353 == true then
      L6_354 = A1_349.AttackerVar
      L7_355 = 0
      if L6_354 ~= nil then
        L7_355 = GetPercentHealingAmountMod(A0_348[L6_354])
      end
      L4_352.InitializeShield_Amount, L3_351[A1_349.AmountVar] = (A1_349.Amount + L3_351[A1_349.AmountVar]) * (1 + L7_355), (A1_349.Amount + L3_351[A1_349.AmountVar]) * (1 + L7_355)
    end
  end
  L5_353 = SpellBuffAddNoRenew
  L6_354 = A1_349.AttackerVar
  L6_354 = A0_348[L6_354]
  L7_355 = A1_349.UnitVar
  L7_355 = A0_348[L7_355]
  L5_353(L6_354, L7_355, "InitializeShieldMarker", 0, 1, 25000, L4_352)
  L5_353 = BBIncreaseShield
  L6_354 = A0_348
  L7_355 = A1_349
  L5_353(L6_354, L7_355)
end
BBInitializeShield = L0_0
function L0_0(A0_356, A1_357)
  if A1_357.CDVar ~= nil then
  end
  if A1_357.CD ~= nil then
  end
  if A1_357.TargetVar ~= nil then
    GetTable(A0_356, A1_357.DestVarTable, false)[A1_357.DestVar] = (0 + GetTable(A0_356, A1_357.CDVarTable, true)[A1_357.CDVar] + A1_357.CD) * (1 + GetPercentCooldownMod(A0_356[A1_357.TargetVar]))
  else
    GetTable(A0_356, A1_357.DestVarTable, false)[A1_357.DestVar] = A1_357.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_358, A1_359)
  local L2_360, L3_361
  L3_361 = A1_359.TargetVar
  if L3_361 ~= nil then
    L2_360 = A1_359.Stat(A0_358[L3_361])
  else
    L2_360 = A1_359.Stat()
  end
  SetVarInTable(A0_358, A1_359, L2_360)
end
BBGetStat = L0_0
function L0_0(A0_362, A1_363)
  if A1_363.TargetVar ~= nil then
    GetTable(A0_362, A1_363.DestVarTable, false)[A1_363.DestVar] = GetLevel(A0_362[A1_363.TargetVar])
  else
    GetTable(A0_362, A1_363.DestVarTable, false)[A1_363.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_364, A1_365)
  if A1_365.TargetVar ~= nil then
    GetTable(A0_364, A1_365.DestVarTable, false)[A1_365.DestVar] = GetUnitSignificance(A0_364[A1_365.TargetVar])
  else
    GetTable(A0_364, A1_365.DestVarTable, false)[A1_365.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_366, A1_367)
  if A1_367.TargetVar ~= nil then
    GetTable(A0_366, A1_367.DestVarTable, false)[A1_367.DestVar] = GetArmor(A0_366[A1_367.TargetVar])
  else
    GetTable(A0_366, A1_367.DestVarTable, false)[A1_367.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_368, A1_369)
  if A1_369.TargetVar ~= nil then
    GetTable(A0_368, A1_369.DestVarTable, false)[A1_369.DestVar] = GetSpellBlock(A0_368[A1_369.TargetVar])
  else
    GetTable(A0_368, A1_369.DestVarTable, false)[A1_369.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_370, A1_371)
  local L2_372, L3_373
  L3_373 = A1_371.TargetVar
  if L3_373 ~= nil then
    L2_372 = GetTeamID(A0_370[L3_373])
  else
    L2_372 = GetTeamID()
  end
  SetVarInTable(A0_370, A1_371, L2_372)
end
BBGetTeamID = L0_0
function L0_0(A0_374, A1_375)
  local L2_376, L3_377, L4_378
  L2_376 = GetTable
  L3_377 = A0_374
  L4_378 = A1_375.DestVarTable
  L2_376 = L2_376(L3_377, L4_378, false)
  L3_377 = A1_375.TargetVar
  L4_378 = nil
  if L3_377 ~= nil then
    L4_378 = GetTeamID(A0_374[L3_377])
  else
    L4_378 = GetTeamID()
  end
  if L4_378 == TEAM_ORDER then
    L2_376[A1_375.DestVar] = TEAM_CHAOS
  elseif L4_378 == TEAM_CHAOS then
    L2_376[A1_375.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_379, A1_380)
  if A1_380.TargetVar ~= nil then
    GetTable(A0_379, A1_380.DestVarTable, false)[A1_380.DestVar] = GetUnitSkinName(A0_379[A1_380.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_381, A1_382)
  local L2_383, L3_384, L4_385
  L2_383 = GetTable
  L3_384 = A0_381
  L4_385 = A1_382.DestVarTable
  L2_383 = L2_383(L3_384, L4_385, false)
  L3_384 = A0_381.Owner
  L4_385 = nil
  if A1_382.TargetVar ~= nil then
    L4_385 = GetTotalAttackDamage(A0_381[A1_382.TargetVar])
  else
    L4_385 = GetTotalAttackDamage()
  end
  SetVarInTable(A0_381, A1_382, L4_385)
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_386, A1_387)
  GetTable(A0_386, A1_387.DestVarTable, true)[A1_387.DestVar] = A1_387.Status(A0_386[A1_387.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_388, A1_389)
  local L2_390
  L2_390 = A1_389.TargetVar
  L2_390 = A0_388[L2_390]
  ClearAttackTarget(L2_390)
end
BBClearAttackTarget = L0_0
function L0_0(A0_391, A1_392)
  local L2_393, L3_394
  L2_393 = GetTable
  L3_394 = A0_391
  L2_393 = L2_393(L3_394, A1_392.DestVarTable, true)
  L3_394 = A1_392.Info
  L3_394 = L3_394(A0_391[A1_392.TargetVar])
  SetVarInTable(A0_391, A1_392, L3_394)
end
BBGetCastInfo = L0_0
function L0_0(A0_395, A1_396, A2_397)
  local L3_398, L4_399, L5_400, L6_401
  L3_398 = GetTable
  L4_399 = A0_395
  L5_400 = A1_396.TrackTimeVarTable
  L6_401 = false
  L3_398 = L3_398(L4_399, L5_400, L6_401)
  L4_399 = GetTime
  L4_399 = L4_399()
  L5_400 = A1_396.ExecuteImmediately
  L6_401 = GetParam
  L6_401 = L6_401("TimeBetweenExecutions", A0_395, A1_396)
  if A1_396.TickTimeVar ~= nil and GetTable(A0_395, A1_396.TickTimeVarTable, false)[A1_396.TickTimeVar] ~= nil then
    L6_401 = GetTable(A0_395, A1_396.TickTimeVarTable, false)[A1_396.TickTimeVar]
  end
  if L3_398[A1_396.TrackTimeVar] == nil then
    L3_398[A1_396.TrackTimeVar] = L4_399
    if L5_400 == true then
      ExecuteBuildingBlocks(A2_397, A0_395)
    end
  end
  if L4_399 >= L3_398[A1_396.TrackTimeVar] + L6_401 then
    L3_398[A1_396.TrackTimeVar] = L3_398[A1_396.TrackTimeVar] + L6_401
    ExecuteBuildingBlocks(A2_397, A0_395)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_402, A1_403, A2_404)
  GetTable(A0_402, A1_403.TrackTimeVarTable, false)[A1_403.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_405, A1_406)
  local L2_407
  L2_407 = A1_406.SrcValue
  if A1_406.SrcVar ~= nil then
    L2_407 = GetTable(A0_405, A1_406.SrcVarTable, true)[A1_406.SrcVar]
  end
  A1_406.Status(A0_405[A1_406.TargetVar], L2_407)
end
BBSetStatus = L0_0
function L0_0(A0_408, A1_409)
  local L2_410
  L2_410 = A1_409.ToAlert
  if GetTable(A0_408, A1_409.SrcVarTable, false) ~= nil and A1_409.SrcVar ~= nil then
    L2_410 = L2_410 .. GetTable(A0_408, A1_409.SrcVarTable, false)[A1_409.SrcVar]
  end
  _ALERT(L2_410)
end
BBAlert = L0_0
function L0_0(A0_411, A1_412)
  local L2_413, L3_414, L4_415, L5_416, L6_417, L7_418
  L2_413 = GetParam
  L3_414 = "Message"
  L4_415 = A0_411
  L5_416 = A1_412
  L2_413 = L2_413(L3_414, L4_415, L5_416)
  if L2_413 == nil then
    L3_414 = ReportError
    L4_415 = "Could not resolve Message param"
    L3_414(L4_415)
    return
  end
  L3_414 = true
  L4_415 = GetParam
  L5_416 = "OnUnit"
  L6_417 = A0_411
  L7_418 = A1_412
  L4_415 = L4_415(L5_416, L6_417, L7_418)
  if L4_415 == nil then
    L3_414 = false
    L5_416 = GetParam
    L6_417 = "OnUnitByFlag"
    L7_418 = A0_411
    L5_416 = L5_416(L6_417, L7_418, A1_412)
    L4_415 = L5_416
  end
  if L4_415 == nil then
    L5_416 = ReportError
    L6_417 = "Could not resolve OnUnit param"
    L5_416(L6_417)
    return
  end
  L5_416 = true
  L6_417 = GetParam
  L7_418 = "ChampionToSayTo"
  L6_417 = L6_417(L7_418, A0_411, A1_412)
  if L6_417 == nil then
    L5_416 = false
    L7_418 = GetParam
    L7_418 = L7_418("ChampionToSayToByFlag", A0_411, A1_412)
    L6_417 = L7_418
  end
  if L6_417 == nil then
    L7_418 = ReportError
    L7_418("Could not resolve ChampionToSayTo param")
    return
  end
  L7_418 = GetParam
  L7_418 = L7_418("ShowToSpectator", A0_411, A1_412)
  if L7_418 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  SayWithFloatingTextOnUnitToChampion(tostring(L2_413), A1_412.TextType, L4_415, L3_414, L6_417, L5_416, L7_418)
end
BBSayWithFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_419, A1_420)
  local L2_421, L3_422, L4_423
  L2_421 = A1_420.ToSay
  L3_422 = GetTable
  L4_423 = A0_419
  L3_422 = L3_422(L4_423, A1_420.SrcVarTable, false)
  if L3_422 ~= nil then
    L4_423 = A1_420.SrcVar
    if L4_423 ~= nil then
      L4_423 = L2_421
      L2_421 = L4_423 .. tostring(L3_422[A1_420.SrcVar])
    end
  end
  L4_423 = nil
  if A1_420.OwnerVar ~= nil then
    L4_423 = A0_419[A1_420.OwnerVar]
  else
    L4_423 = A0_419.Owner
  end
  if A1_420.TextType == nil then
    A1_420.TextType = 0
  end
  Say(L4_423, L2_421, A1_420.TextType)
end
BBSay = L0_0
function L0_0(A0_424, A1_425)
  local L2_426, L3_427, L4_428
  L2_426 = A1_425.ToSay
  L3_427 = GetTable
  L4_428 = A0_424
  L3_427 = L3_427(L4_428, A1_425.SrcVarTable, false)
  if L3_427 ~= nil then
    L4_428 = A1_425.SrcVar
    if L4_428 ~= nil then
      L4_428 = L2_426
      L2_426 = L4_428 .. tostring(L3_427[A1_425.SrcVar])
    end
  end
  L4_428 = nil
  if A1_425.OwnerVar ~= nil then
    L4_428 = A0_424[A1_425.OwnerVar]
  else
    L4_428 = A0_424.Owner
  end
  if A1_425.TextType == nil then
    A1_425.TextType = 0
  end
  Say(L4_428, L2_426, A1_425.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_429, A1_430)
  GetTable(A0_429, A1_430.DestVarTable, true)[A1_430.DestVar] = BBLuaGetGold(A0_429, A1_430)
end
BBGetGold = L0_0
function L0_0(A0_431, A1_432)
  GetTable(A0_431, A1_432.DestVarTable, true)[A1_432.DestVar] = BBLuaGetTotalGold(A0_431, A1_432)
end
BBGetTotalGold = L0_0
function L0_0(A0_433, A1_434)
  SpellBuffAdd(A0_433[A1_434.OwnerVar], A0_433[A1_434.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_433.NextBuffVars)
  BBTeleportToPositionHelper(A0_433, A1_434)
end
BBTeleportToPosition = L0_0
function L0_0(A0_435, A1_436)
  if A1_436.XVar ~= nil and GetTable(A0_435, A1_436.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_435, A1_436.XVarTable, true)[A1_436.XVar]
  else
    Xloc = A1_436.X
  end
  if A1_436.YVar ~= nil and GetTable(A0_435, A1_436.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_435, A1_436.YVarTable, true)[A1_436.YVar]
  else
    Yloc = A1_436.Y
  end
  if A1_436.ZVar ~= nil and GetTable(A0_435, A1_436.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_435, A1_436.ZVarTable, true)[A1_436.ZVar]
  else
    Zloc = A1_436.Z
  end
  A1_436.OwnerVar, A0_435.position = A1_436.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_436.CastPositionName = "position"
  BBTeleportToPosition(A0_435, A1_436)
end
BBTeleportToPoint = L0_0
function L0_0(A0_437, A1_438)
  A1_438.TimeoutInFOW = 999999
  A1_438.BindFlexToOwnerPAR = false
  A1_438.Flags = 0
  A1_438.FollowsGroundTilt = false
  A1_438.FacesTarget = false
  A1_438.HideFromSpectator = false
  A1_438.SendIfOnScreenOrDiscard = false
  A1_438.PersistsThroughReconnect = true
  A1_438.FOWVisibilityRadius = 10
  A1_438.Scale = 1
  A1_438.BindObjectVar = A1_438.BindObject1Var
  A1_438.EffectID2Var = A1_438.OtherTeamEffectIDVar
  A1_438.TargetObjectVar = A1_438.BindObject2Var
  A1_438.FOWTeamOverrideVar = A1_438.FOWTeamVar
  A1_438.BoneName = A1_438.BindObject1BoneName
  A1_438.TargetBoneName = A1_438.BindObject2BoneName
  A1_438.EffectName = A1_438.EffectParticleFile
  A1_438.EffectNameForOtherTeam = A1_438.OtherTeamParticleFile
  BBSpellEffectCreate(A0_437, A1_438)
end
BBSpellEffectCreate_EasyBeam = L0_0
function L0_0(A0_439, A1_440)
  A1_440.TimeoutInFOW = 999999
  A1_440.BindFlexToOwnerPAR = false
  A1_440.Flags = 0
  A1_440.FollowsGroundTilt = false
  A1_440.FacesTarget = false
  A1_440.HideFromSpectator = false
  A1_440.SendIfOnScreenOrDiscard = true
  A1_440.PersistsThroughReconnect = false
  A1_440.FOWVisibilityRadius = 10
  A1_440.Scale = 1
  A1_440.FOWTeamOverrideVar = A1_440.FOWTeamVar
  A1_440.EffectName = A1_440.ParticleFile
  A1_440.EffectNameForOtherTeam = A1_440.ParticleFileForOtherTeam
  A1_440.BoneName = A1_440.BindObjectBoneName
  BBSpellEffectCreate(A0_439, A1_440)
end
BBSpellEffectCreate_EasyHit = L0_0
function L0_0(A0_441, A1_442)
  DefUpdateAura(GetTable(A0_441, A1_442.CenterTable, false)[A1_442.CenterVar], A1_442.Range, A1_442.UnitScan, A1_442.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_443, A1_444)
  ReincarnateNonDeadHero(GetTable(A0_443, A1_444.TargetTable, false)[A1_444.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_445, A1_446)
  GetTable(A0_445, A1_446.DestVarTable, true)[A1_446.DestVar] = A1_446.Function(A0_445[A1_446.OwnerVar], A1_446.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_447, A1_448)
  local L2_449, L3_450, L4_451, L5_452
  L2_449 = A1_448.WhomToOrderVar
  L2_449 = A0_447[L2_449]
  L3_450 = A1_448.TargetOfOrderVar
  L3_450 = A0_447[L3_450]
  L4_451 = GetTable
  L5_452 = A0_447
  L4_451 = L4_451(L5_452, A1_448.SrcVarTable, false)
  L5_452 = nil
  if A1_448.SrcVar ~= nil and L4_451 ~= nil then
    L5_452 = L4_451[A1_448.SrcVar]
  else
    L5_452 = GetPosition(L3_450)
  end
  if L3_450 == nil then
    L3_450 = L2_449
  end
  IssueOrder(L2_449, A1_448.Order, L5_452, L3_450)
end
BBIssueOrder = L0_0
function L0_0(A0_453, A1_454)
  local L2_455
  L2_455 = GetParam
  L2_455 = L2_455("NewRange", A0_453, A1_454)
  SetSpellCastRange(L2_455)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_456, A1_457)
  GetTable(A0_456, A1_457.DestVarTable, true)[A1_457.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_458, A1_459)
  local L2_460, L3_461
  L2_460 = A1_459.ObjectVar1
  L2_460 = A0_458[L2_460]
  L3_461 = A1_459.ObjectVar2
  L3_461 = A0_458[L3_461]
  GetTable(A0_458, A1_459.DestVarTable, true)[A1_459.DestVar] = DistanceBetweenObjectBounds(L2_460, L3_461)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_462, A1_463)
  local L2_464, L3_465, L4_466
  L2_464 = A1_463.ObjectVar
  L2_464 = A0_462[L2_464]
  L3_465 = GetTable
  L4_466 = A0_462
  L3_465 = L3_465(L4_466, A1_463.PointVarTable, true)
  L4_466 = A1_463.PointVar
  L4_466 = L3_465[L4_466]
  GetTable(A0_462, A1_463.DestVarTable, true)[A1_463.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_464, L4_466)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_467, A1_468)
  local L2_469, L3_470
  L2_469 = GetParam
  L3_470 = "Point1"
  L2_469 = L2_469(L3_470, A0_467, A1_468)
  L3_470 = GetParam
  L3_470 = L3_470("Point2", A0_467, A1_468)
  GetTable(A0_467, A1_468.DestVarTable, true)[A1_468.DestVar] = DistanceBetweenPoints(L2_469, L3_470)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_471, A1_472, A2_473)
  local L3_474, L4_475, L5_476, L6_477, L7_478, L8_479
  L5_476 = 0
  L6_477 = nil
  L7_478 = A1_472.ObjectDistanceType
  L8_479 = A1_472.ObjectVar1
  L3_474 = A0_471[L8_479]
  L8_479 = A1_472.ObjectVar2
  L4_475 = A0_471[L8_479]
  if nil == L4_475 then
    L8_479 = A1_472.Point2Var
    if nil ~= L8_479 then
      L8_479 = GetTable
      L8_479 = L8_479(A0_471, A1_472.Point2VarTable, true)
      L4_475 = L8_479[A1_472.Point2Var]
      L5_476 = L5_476 + 1
    end
  end
  if nil == L3_474 then
    L8_479 = A1_472.Point1Var
    if nil ~= L8_479 then
      L8_479 = GetTable
      L8_479 = L8_479(A0_471, A1_472.Point1VarTable, true)
      L3_474 = L8_479[A1_472.Point1Var]
      L5_476 = L5_476 + 1
      if 1 == L5_476 then
        L3_474, L4_475 = L4_475, L3_474
      end
    end
  end
  if nil ~= L7_478 then
    if 0 == L5_476 then
      L8_479 = OBJECT_CENTER
      if L8_479 == L7_478 then
        L6_477 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_479 = OBJECT_BOUNDARY
        if L8_479 == L7_478 then
          L6_477 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_479 = A1_472.OwnerVar
          L8_479 = A0_471[L8_479]
          Say(L8_479, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_476 then
      L8_479 = OBJECT_CENTER
      if L8_479 == L7_478 then
        L6_477 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_479 = OBJECT_BOUNDARY
        if L8_479 == L7_478 then
          L6_477 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_479 = A1_472.OwnerVar
          L8_479 = A0_471[L8_479]
          Say(L8_479, "invalid object distance type", 0)
        end
      end
    else
      L6_477 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_479 = A1_472.Distance
  if A1_472.DistanceVar ~= nil and GetTable(A0_471, A1_472.DistanceVarTable, true) ~= nil then
    L8_479 = L8_479 + GetTable(A0_471, A1_472.DistanceVarTable, true)[A1_472.DistanceVar]
  end
  if L3_474 ~= nil and L4_475 ~= nil and L6_477 ~= nil and L8_479 ~= nil then
    if not L6_477(L3_474, L4_475, L8_479) then
      ExecuteBuildingBlocks(A2_473, A0_471)
      A0_471.LastIfSucceeded = true
    else
      A0_471.LastIfSucceeded = false
    end
  else
    A0_471.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_480, A1_481)
  local L2_482, L3_483
  L2_482 = A1_481.TargetVar
  L2_482 = A0_480[L2_482]
  L3_483 = A1_481.CasterVar
  L3_483 = A0_480[L3_483]
  GetTable(A0_480, A1_481.DestVarTable, true)[A1_481.DestVar] = SpellBuffCount(L2_482, A1_481.BuffName, L3_483)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_484, A1_485)
  local L2_486
  L2_486 = A1_485.TargetVar
  L2_486 = A0_484[L2_486]
  GetTable(A0_484, A1_485.DestVarTable, true)[A1_485.DestVar] = SpellBuffCount(L2_486, A1_485.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_487, A1_488)
  local L2_489, L3_490
  L2_489 = GetTable
  L3_490 = A0_487
  L2_489 = L2_489(L3_490, A1_488.ScaleVarTable, false)
  L3_490 = nil
  if A1_488.OwnerVar ~= nil then
    L3_490 = A0_487[A1_488.OwnerVar]
  else
    L3_490 = A0_487.Owner
  end
  if A1_488.ScaleVar ~= nil and A1_488.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_489[A1_488.ScaleVar], L3_490)
  else
    SetScaleSkinCoef(A1_488.Scale, L3_490)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_491, A1_492)
  SpellBuffAdd(A0_491[A1_492.TargetVar], A0_491[A1_492.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_491.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_493, A1_494, A2_495)
  local L3_496, L4_497
  L3_496 = A1_494.TargetVar
  L3_496 = A0_493[L3_496]
  L4_497 = A1_494.NumStacks
  if GetParam("NumStacks", A0_493, A1_494) == 0 then
    L4_497 = SpellBuffCount(L3_496, A1_494.BuffName, caster)
  else
    L4_497 = GetParam("NumStacks", A0_493, A1_494)
  end
  while L4_497 > 0 do
    SpellBuffRemove(L3_496, A1_494.BuffName, A0_493[A1_494.AttackerVar])
    L4_497 = L4_497 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_498, A1_499)
  local L2_500, L3_501
  L2_500 = GetParam
  L3_501 = "Unit"
  L2_500 = L2_500(L3_501, A0_498, A1_499)
  unit = L2_500
  L2_500 = unit
  if L2_500 == nil then
    L2_500 = ReportError
    L3_501 = "Could not resolve Unit param"
    L2_500(L3_501)
    return
  end
  L2_500 = true
  L3_501 = GetParam
  L3_501 = L3_501("ChampionToShowTo", A0_498, A1_499)
  if L3_501 == nil then
    L2_500 = false
    L3_501 = GetParam("ChampionToShowToByFlag", A0_498, A1_499)
  end
  if L3_501 == nil then
    ReportError("Could not resolve ChampionToShowTo param")
    return
  end
  SetShowHealthBarToChampion(unit, A1_499.Show, L3_501, L2_500, A1_499.ApplyToSpectator)
end
BBSetShowHealthBarToChampion = L0_0
function L0_0(A0_502, A1_503, A2_504)
  if A0_502.EmoteId == A1_503.EmoteId then
    ExecuteBuildingBlocks(A2_504, A0_502)
    A0_502.LastIfSucceeded = true
  else
    A0_502.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_505, A1_506, A2_507)
  if A0_505.EmoteId ~= A1_506.EmoteId then
    ExecuteBuildingBlocks(A2_507, A0_505)
    A0_505.LastIfSucceeded = true
  else
    A0_505.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_508, A1_509)
  local L2_510, L3_511, L4_512, L5_513
  L2_510 = GetTable
  L3_511 = A0_508
  L4_512 = A1_509.String1VarTable
  L5_513 = false
  L2_510 = L2_510(L3_511, L4_512, L5_513)
  L3_511 = A1_509.String1Var
  L3_511 = L2_510[L3_511]
  L4_512 = GetTable
  L5_513 = A0_508
  L4_512 = L4_512(L5_513, A1_509.String2VarTable, false)
  L5_513 = A1_509.String2Var
  L5_513 = L4_512[L5_513]
  GetTable(A0_508, A1_509.ResultVarTable, false)[A1_509.ResultVar] = L3_511 .. L5_513
end
BBConcatenateStrings = L0_0
function L0_0(A0_514, A1_515)
  local L2_516, L3_517
  L2_516 = GetTable
  L3_517 = A0_514
  L2_516 = L2_516(L3_517, A1_515.VariableVarTable, false)
  L3_517 = A1_515.VariableVar
  L3_517 = L2_516[L3_517]
  GetTable(A0_514, A1_515.ResultVarTable, false)[A1_515.ResultVar] = "(" .. L3_517 .. ")"
end
BBEncaseInParantheses = L0_0
function L0_0(A0_518, A1_519)
  BBGetMinionKills(A0_518, A1_519)
  A0_518.MinionKillSource = GetParam("MinionKillTarget")
  A0_518.MinionKills = A0_518.MinionsKilled + GetParam("MinionKills", A0_518, A1_519)
  BBSetMinionKills(A0_518, A1_519)
end
BBIncreaseMinionKills = L0_0
