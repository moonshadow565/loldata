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
  DebugClientPrint(tostring(L3_28) .. ": " .. type(L2_27[A1_26.SrcVar]))
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
      L6_35 = L6_35 .. "(DEBUG) " .. A1_30.SrcVarTable .. "." .. (A1_30.SrcVar or "")
    else
      L6_35 = L6_35 .. "(DEBUG) " .. (A1_30.SrcVar or "")
    end
  else
    L6_35 = L6_35 .. "(DEBUG) " .. L2_31
  end
  if type(L5_34) ~= "table" and type(L5_34) ~= "nil" then
    L6_35 = L6_35 .. " " .. tostring(L5_34)
  end
  L6_35 = L6_35 .. "</font>"
  DebugClientPrint(L6_35)
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
  DebugClientPrint(L3_39)
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
    DebugClientPrint(L13_53)
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
  A0_139.ReturnValue = true
end
BBCancelOrderBeforeIssued = L0_0
function L0_0(A0_141, A1_142)
  if type(A0_141) == "string" and type(A1_142) == "string" then
    A0_141 = string.lower(A0_141)
    A1_142 = string.lower(A1_142)
  end
  return A0_141 == A1_142
end
CO_EQUAL = L0_0
function L0_0(A0_143, A1_144)
  if type(A0_143) == "string" and type(A1_144) == "string" then
    A0_143 = string.lower(A0_143)
    A1_144 = string.lower(A1_144)
  end
  return A0_143 ~= A1_144
end
CO_NOT_EQUAL = L0_0
function L0_0(A0_145, A1_146)
  local L2_147
  L2_147 = A0_145 < A1_146
  return L2_147
end
CO_LESS_THAN = L0_0
function L0_0(A0_148, A1_149)
  local L2_150
  L2_150 = A1_149 < A0_148
  return L2_150
end
CO_GREATER_THAN = L0_0
function L0_0(A0_151, A1_152)
  local L2_153
  L2_153 = A0_151 <= A1_152
  return L2_153
end
CO_LESS_THAN_OR_EQUAL = L0_0
function L0_0(A0_154, A1_155)
  local L2_156
  L2_156 = A1_155 <= A0_154
  return L2_156
end
CO_GREATER_THAN_OR_EQUAL = L0_0
function L0_0(A0_157, A1_158)
  return GetTeamID(A0_157) == GetTeamID(A1_158)
end
CO_SAME_TEAM = L0_0
function L0_0(A0_159, A1_160)
  return GetTeamID(A0_159) ~= GetTeamID(A1_160)
end
CO_DIFFERENT_TEAM = L0_0
function L0_0(A0_161, A1_162)
  return GetSourceType() == A1_162 or GetSourceType() == A0_161
end
CO_DAMAGE_SOURCETYPE_IS = L0_0
function L0_0(A0_163, A1_164)
  return GetSourceType() ~= A1_164 and GetSourceType() ~= A0_163
end
CO_DAMAGE_SOURCETYPE_IS_NOT = L0_0
function L0_0(A0_165)
  return IsObjectAI(A0_165)
end
CO_IS_TYPE_AI = L0_0
function L0_0(A0_166)
  return IsObjectAI(A0_166) ~= true
end
CO_IS_NOT_AI = L0_0
function L0_0(A0_167)
  return IsObjectHero(A0_167)
end
CO_IS_TYPE_HERO = L0_0
function L0_0(A0_168)
  return IsObjectHero(A0_168) ~= true
end
CO_IS_NOT_HERO = L0_0
function L0_0(A0_169)
  return IsObjectMarker(A0_169)
end
CO_IS_TYPE_MARKER = L0_0
function L0_0(A0_170)
  return IsObjectMarker(A0_170) ~= true
end
CO_IS_NOT_MARKER = L0_0
function L0_0(A0_171)
  return IsClone(A0_171)
end
CO_IS_CLONE = L0_0
function L0_0(A0_172)
  return IsClone(A0_172) ~= true
end
CO_IS_NOT_CLONE = L0_0
function L0_0(A0_173)
  return IsMelee(A0_173)
end
CO_IS_MELEE = L0_0
function L0_0(A0_174)
  return IsMelee(A0_174) ~= true
end
CO_IS_RANGED = L0_0
function L0_0(A0_175)
  return A0_175 > math.random()
end
CO_RANDOM_CHANCE_LESS_THAN = L0_0
function L0_0(A0_176)
  return IsTurretAI(A0_176)
end
CO_IS_TYPE_TURRET = L0_0
function L0_0(A0_177)
  return IsTurretAI(A0_177) ~= true
end
CO_IS_NOT_TURRET = L0_0
function L0_0(A0_178)
  return IsDampener(A0_178)
end
CO_IS_TYPE_INHIBITOR = L0_0
function L0_0(A0_179)
  return IsDampener(A0_179) ~= true
end
CO_IS_NOT_INHIBITOR = L0_0
function L0_0(A0_180)
  return IsHQ(A0_180)
end
CO_IS_TYPE_NEXUS = L0_0
function L0_0(A0_181)
  return IsHQ(A0_181) ~= true
end
CO_IS_NOT_NEXUS = L0_0
function L0_0(A0_182)
  return IsDead(A0_182)
end
CO_IS_DEAD = L0_0
function L0_0(A0_183)
  return IsDead(A0_183) ~= true
end
CO_IS_NOT_DEAD = L0_0
function L0_0(A0_184)
  return IsDeadOrZombie(A0_184)
end
CO_IS_DEAD_OR_ZOMBIE = L0_0
function L0_0(A0_185, A1_186)
  return BBIsTargetInFrontOfMe(A0_185, A1_186)
end
CO_IS_TARGET_IN_FRONT_OF_ME = L0_0
function L0_0(A0_187, A1_188)
  return BBIsTargetBehindMe(A0_187, A1_188)
end
CO_IS_TARGET_BEHIND_ME = L0_0
function L0_0(A0_189)
  return IsWard(A0_189)
end
CO_IS_WARD = L0_0
function L0_0(A0_190)
  return IsStructure(A0_190)
end
CO_IS_STRUCTURE = L0_0
function L0_0(A0_191)
  return IsStructure(A0_191) ~= true
end
CO_IS_NOT_STRUCTURE = L0_0
function L0_0(A0_192)
  local L1_193
  L1_193 = A0_192 ~= nil
  return L1_193
end
CO_IS_NOT_NIL = L0_0
function L0_0(A0_194, A1_195, A2_196)
  GetTable(A0_194, A1_195.MacroVarTable, true)[A1_195.MacroVar] = A2_196
end
BBCreateMacro = L0_0
function L0_0(A0_197, A1_198)
  local L2_199
  L2_199 = GetParam
  L2_199 = L2_199("Macro", A0_197, A1_198)
  if L2_199 ~= nil and type(L2_199) == "table" then
    ExecuteBuildingBlocks(L2_199, A0_197)
  else
    DebugClientPrint("Designer Error: Macro variable is not initialized inside of event. Macro Variable was: " .. tostring(A1_198.MacroVar) .. " and current block data is: " .. gCurrentBuildingBlockString .. ". This error probably occurred due to variable not being initialized yet, being misnamed or two events being called out of sequence. It is highly recommended that script macros either be initialized OnBuffActivate, OnCharActivate or in the same event. Pro Devs may violate this rule at the risk of being forced to read this error message again.")
  end
end
BBRunMacro = L0_0
function L0_0(A0_200, A1_201, A2_202)
  local L3_203, L4_204, L5_205, L6_206, L7_207, L8_208
  L3_203 = GetTable
  L3_203 = L3_203(L4_204, L5_205, L6_206)
  L3_203[L4_204] = A2_202
  if L4_204 == nil then
    A2_202.InPerBlockParams = A1_201
    for L7_207 = 1, 6 do
      L8_208 = "FunctionParameter"
      L8_208 = L8_208 .. L7_207 .. "Var"
      if A1_201[L8_208 .. "Table"] ~= nil then
        DebugClientPrint("Designer Error: CreateFunction can only input parameters to PassThroughParams. Current block data is: " .. gCurrentBuildingBlockString .. ".")
      end
    end
  end
end
BBCreateFunction = L0_0
function L0_0(A0_209, A1_210)
  local L2_211, L3_212, L4_213, L5_214, L6_215
  for L5_214 = 1, 6 do
    L6_215 = "FunctionOutput"
    L6_215 = L6_215 .. L5_214 .. "Var"
    if A1_210[L6_215] ~= nil and A1_210[L6_215] ~= "" then
      if A1_210[L6_215 .. "Table"] ~= nil then
        DebugClientPrint("Designer Error: EndFunction can only output from PassThroughParams. Current block data is: " .. gCurrentBuildingBlockString .. ".")
      else
        A0_209[L6_215] = A0_209[A1_210[L6_215]]
      end
    end
  end
end
BBEndFunction = L0_0
function L0_0(A0_216, A1_217)
  local L2_218, L3_219, L4_220, L5_221, L6_222, L7_223, L8_224, L9_225
  L2_218 = GetParam
  L3_219 = "Function"
  L2_218 = L2_218(L3_219, L4_220, L5_221)
  L3_219 = {}
  L3_219.InstanceVars = L4_220
  L3_219.CharVars = L4_220
  L3_219.NextBuffVars = L4_220
  L3_219.AvatarVars = L4_220
  L3_219.SpellVars = L4_220
  L3_219.WorldVars = L4_220
  L3_219.Target = L4_220
  L3_219.Attacker = L4_220
  L3_219.Owner = L4_220
  L3_219.Caster = L4_220
  L3_219.GoldRedirectTarget = L4_220
  L3_219.Unit = L4_220
  L3_219.Other1 = L4_220
  L3_219.Other2 = L4_220
  L3_219.Other3 = L4_220
  L3_219.Nothing = L4_220
  if L2_218 ~= nil then
    if L4_220 == "table" then
      if L4_220 ~= nil then
        for L8_224 = 1, 6 do
          L9_225 = "FunctionParameter"
          L9_225 = L9_225 .. L8_224 .. "Var"
          if A1_217[L9_225] ~= nil and A1_217[L9_225] ~= "" and L4_220[L9_225] ~= nil and L4_220[L9_225] ~= "" then
            L3_219[L4_220[L9_225]] = GetTable(A0_216, A1_217[L9_225 .. "Table"], false)[A1_217[L9_225]]
          end
        end
      end
      L4_220(L5_221, L6_222)
      for L7_223 = 1, 6 do
        L8_224 = "FunctionOutput"
        L9_225 = L7_223
        L8_224 = L8_224 .. L9_225 .. "Var"
        L9_225 = A1_217[L8_224]
        if L9_225 ~= nil then
          L9_225 = A1_217[L8_224]
          if L9_225 ~= "" then
            L9_225 = L3_219
            GetTable(A0_216, A1_217[L8_224 .. "Table"], false)[A1_217[L8_224]] = L9_225[L8_224]
          end
        end
      end
    end
  else
    L8_224 = gCurrentBuildingBlockString
    L9_225 = ". This error probably occurred due to variable not being initialized yet, being misnamed or two events being called out of sequence. It is highly recommended that script functions either be initialized OnBuffActivate, OnCharActivate or in the same event. Pro Devs may violate this rule at the risk of being forced to read this error message again."
    L4_220(L5_221)
  end
end
BBRunFunction = L0_0
function L0_0(A0_226, A1_227, A2_228)
  local L3_229, L4_230, L5_231, L6_232
  L3_229 = GetTable
  L4_230 = A0_226
  L5_231 = A1_227.Src1VarTable
  L6_232 = false
  L3_229 = L3_229(L4_230, L5_231, L6_232)
  L4_230 = GetTable
  L5_231 = A0_226
  L6_232 = A1_227.Src2VarTable
  L4_230 = L4_230(L5_231, L6_232, false)
  L5_231 = false
  L6_232 = nil
  if L3_229 ~= nil and A1_227.Src1Var ~= nil then
    L6_232 = L3_229[A1_227.Src1Var]
  else
    L6_232 = A1_227.Value1
  end
  if L4_230 ~= nil and A1_227.Src2Var ~= nil then
    L5_231 = A1_227.CompareOp(L6_232, L4_230[A1_227.Src2Var])
  else
    L5_231 = A1_227.CompareOp(L6_232, A1_227.Value2)
  end
  if L5_231 then
    ExecuteBuildingBlocks(A2_228, A0_226)
    A0_226.LastIfSucceeded = true
  else
    A0_226.LastIfSucceeded = false
  end
end
BBIf = L0_0
function L0_0(A0_233, A1_234, A2_235)
  if A0_233.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_235, A0_233)
    A0_233.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_236, A1_237, A2_238)
  if A0_236.LastIfSucceeded == true then
    ExecuteBuildingBlocks(A2_238, A0_236)
    A0_236.LastIfSucceeded = true
  else
    BBIf(A0_236, A1_237, A2_238)
  end
end
BBOrIf = L0_0
function L0_0(A0_239, A1_240, A2_241)
  if A0_239.LastIfSucceeded == true then
    BBIf(A0_239, A1_240, A2_241)
  end
end
BBAndIf = L0_0
function L0_0(A0_242, A1_243, A2_244)
  local L3_245, L4_246, L5_247, L6_248
  L3_245 = A0_242.LastIfSucceeded
  if L3_245 == false then
    L3_245 = GetTable
    L4_246 = A0_242
    L5_247 = A1_243.Src1VarTable
    L6_248 = false
    L3_245 = L3_245(L4_246, L5_247, L6_248)
    L4_246 = GetTable
    L5_247 = A0_242
    L6_248 = A1_243.Src2VarTable
    L4_246 = L4_246(L5_247, L6_248, false)
    L5_247 = false
    L6_248 = nil
    if L3_245 ~= nil and A1_243.Src1Var ~= nil then
      L6_248 = L3_245[A1_243.Src1Var]
    else
      L6_248 = A1_243.Value1
    end
    if L4_246 ~= nil and A1_243.Src2Var ~= nil then
      L5_247 = A1_243.CompareOp(L6_248, L4_246[A1_243.Src2Var])
    else
      L5_247 = A1_243.CompareOp(L6_248, A1_243.Value2)
    end
    if L5_247 then
      ExecuteBuildingBlocks(A2_244, A0_242)
      A0_242.LastIfSucceeded = true
    else
      A0_242.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_249, A1_250, A2_251)
  local L3_252
  if A1_250.TargetVar ~= nil then
    L3_252 = A0_249[A1_250.TargetVar]
  else
    L3_252 = A0_249.Target
  end
  if HasBuffOfType(L3_252, A1_250.BuffType) then
    ExecuteBuildingBlocks(A2_251, A0_249)
    A0_249.LastIfSucceeded = true
  else
    A0_249.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_253, A1_254, A2_255)
  local L3_256, L4_257
  if A1_254.OwnerVar ~= nil then
    L3_256 = A0_253[A1_254.OwnerVar]
  else
    L3_256 = A0_253.Owner
  end
  if A1_254.AttackerVar ~= nil then
    L4_257 = A0_253[A1_254.AttackerVar]
  else
    L4_257 = A0_253.Attacker
  end
  if SpellBuffCount(L3_256, A1_254.BuffName, L4_257) > 0 then
    ExecuteBuildingBlocks(A2_255, A0_253)
    A0_253.LastIfSucceeded = true
  else
    A0_253.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_258, A1_259, A2_260)
  if BBIsMissileAutoAttack(A0_258, A1_259) then
    ExecuteBuildingBlocks(A2_260, A0_258)
    A0_258.LastIfSucceeded = true
  else
    A0_258.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_261, A1_262, A2_263)
  if BBIsMissileConsideredAsAutoAttack(A0_261, A1_262) then
    ExecuteBuildingBlocks(A2_263, A0_261)
    A0_261.LastIfSucceeded = true
  else
    A0_261.LastIfSucceeded = false
  end
end
BBIfMissileConsideredAsAutoAttack = L0_0
function L0_0(A0_264, A1_265)
  A0_264.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_266, A1_267, A2_268)
  local L3_269, L4_270
  if A1_267.OwnerVar ~= nil then
    L3_269 = A0_266[A1_267.OwnerVar]
  else
    L3_269 = A0_266.Owner
  end
  if A1_267.CasterVar ~= nil then
    L4_270 = A0_266[A1_267.CasterVar]
  else
    L4_270 = A0_266.Caster
  end
  if SpellBuffCount(L3_269, A1_267.BuffName, L4_270) <= 0 then
    ExecuteBuildingBlocks(A2_268, A0_266)
    A0_266.LastIfSucceeded = true
  else
    A0_266.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_271, A1_272, A2_273)
  local L3_274
  if A1_272.TargetVar ~= nil then
    L3_274 = A0_271[A1_272.TargetVar]
  else
    L3_274 = A0_271.Owner
  end
  if HasUnitTag(L3_274, A1_272.UnitTag) ~= A1_272.InvertResult then
    ExecuteBuildingBlocks(A2_273, A0_271)
    A0_271.LastIfSucceeded = true
  else
    A0_271.LastIfSucceeded = false
  end
end
BBIfHasUnitTag = L0_0
function L0_0(A0_275, A1_276, A2_277)
  local L3_278, L4_279
  if A1_276.OwnerVar ~= nil then
    L3_278 = A0_275[A1_276.OwnerVar]
  else
    L3_278 = A0_275.Owner
  end
  if HasPARType(L3_278, A1_276.PARType) then
    ExecuteBuildingBlocks(A2_277, A0_275)
    A0_275.LastIfSucceeded = true
  else
    A0_275.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_280, A1_281, A2_282)
  local L3_283, L4_284
  if A1_281.OwnerVar ~= nil then
    L3_283 = A0_280[A1_281.OwnerVar]
  else
    L3_283 = A0_280.Owner
  end
  if not HasPARType(L3_283, A1_281.PARType) then
    ExecuteBuildingBlocks(A2_282, A0_280)
    A0_280.LastIfSucceeded = true
  else
    A0_280.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_285, A1_286, A2_287)
  local L3_288, L4_289, L5_290, L6_291, L7_292
  L3_288 = GetTable
  L4_289 = A0_285
  L5_290 = A1_286.Src1VarTable
  L6_291 = false
  L3_288 = L3_288(L4_289, L5_290, L6_291)
  L4_289 = GetTable
  L5_290 = A0_285
  L6_291 = A1_286.Src2VarTable
  L7_292 = false
  L4_289 = L4_289(L5_290, L6_291, L7_292)
  L5_290 = true
  while L5_290 do
    L6_291 = false
    L7_292 = nil
    if L3_288 ~= nil and A1_286.Src1Var ~= nil then
      L7_292 = L3_288[A1_286.Src1Var]
    else
      L7_292 = A1_286.Value1
    end
    if L4_289 ~= nil and A1_286.Src2Var ~= nil then
      L6_291 = A1_286.CompareOp(L7_292, L4_289[A1_286.Src2Var])
    else
      L6_291 = A1_286.CompareOp(L7_292, A1_286.Value2)
    end
    if L6_291 then
      ExecuteBuildingBlocks(A2_287, A0_285)
    else
      L5_290 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_293, A1_294)
  return A0_293 * A1_294
end
MO_MULTIPLY = L0_0
function L0_0(A0_295, A1_296)
  return A0_295 + A1_296
end
MO_ADD = L0_0
function L0_0(A0_297, A1_298)
  return A0_297 - A1_298
end
MO_SUBTRACT = L0_0
function L0_0(A0_299, A1_300)
  return A0_299 / A1_300
end
MO_DIVIDE = L0_0
function L0_0(A0_301, A1_302)
  if A0_301 < A1_302 then
    return A0_301
  else
    return A1_302
  end
end
MO_MIN = L0_0
function L0_0(A0_303, A1_304)
  if A1_304 < A0_303 then
    return A0_303
  else
    return A1_304
  end
end
MO_MAX = L0_0
function L0_0(A0_305, A1_306)
  return A0_305 % A1_306
end
MO_MODULO = L0_0
function L0_0(A0_307)
  return math.floor(A0_307 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_308)
  return math.ceil(A0_308)
end
MO_ROUNDUP = L0_0
function L0_0(A0_309)
  return math.floor(A0_309)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_310)
  return math.sin(math.rad(A0_310))
end
MO_SIN = L0_0
function L0_0(A0_311)
  return math.cos(math.rad(A0_311))
end
MO_COSINE = L0_0
function L0_0(A0_312)
  return math.tan(math.rad(A0_312))
end
MO_TANGENT = L0_0
function L0_0(A0_313)
  return math.deg(math.asin(A0_313))
end
MO_ASIN = L0_0
function L0_0(A0_314)
  return math.deg(math.acos(A0_314))
end
MO_ACOS = L0_0
function L0_0(A0_315)
  return math.deg(math.atan(A0_315))
end
MO_ATAN = L0_0
function L0_0(A0_316, A1_317)
  return math.pow(A0_316, A1_317)
end
MO_POW = L0_0
function L0_0(A0_318)
  return math.sqrt(A0_318)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_319, A1_320)
  local L2_321
  L2_321 = A0_319 and A1_320
  return L2_321
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_322, A1_323)
  local L2_324
  L2_324 = A0_322 or A1_323
  return L2_324
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_325)
  local L1_326
  L1_326 = not A0_325
  return L1_326
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_327)
  return math.abs(A0_327)
end
MO_ABS = L0_0
function L0_0(A0_328, A1_329)
  return math.random(A0_328, A1_329)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_330, A1_331)
  local L2_332, L3_333, L4_334, L5_335
  L2_332 = GetMathNumber
  L3_333 = A0_330
  L4_334 = A1_331.Src1VarTable
  L5_335 = A1_331.Src1Var
  L2_332 = L2_332(L3_333, L4_334, L5_335, A1_331.Src1Value)
  L3_333 = GetMathNumber
  L4_334 = A0_330
  L5_335 = A1_331.Src2VarTable
  L3_333 = L3_333(L4_334, L5_335, A1_331.Src2Var, A1_331.Src2Value)
  L4_334 = GetTable
  L5_335 = A0_330
  L4_334 = L4_334(L5_335, A1_331.DestVarTable)
  L5_335 = A1_331.MathOp
  L5_335 = L5_335(L2_332, L3_333)
  SetVarInTable(A0_330, A1_331, L5_335)
end
BBMath = L0_0
function L0_0(A0_336, A1_337, A2_338, A3_339)
  if A2_338 ~= nil and GetTable(A0_336, A1_337)[A2_338] ~= nil then
    return GetTable(A0_336, A1_337)[A2_338]
  end
  return A3_339
end
GetMathNumber = L0_0
function L0_0(A0_340, A1_341)
  if type(A1_341) == "number" then
    return A1_341
  elseif type(A1_341) == "function" then
    return A1_341(A0_340)
  elseif type(A1_341) == "string" then
    return A0_340[A1_341]
  end
end
GetNumber = L0_0
function L0_0(A0_342, A1_343)
  return VectorAdd(A0_342, A1_343)
end
VEC_ADD = L0_0
function L0_0(A0_344, A1_345)
  return VectorSubtract(A0_344, A1_345)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_346, A1_347)
  return VectorScalarMultiply(A0_346, A1_347)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_348, A1_349)
  return VectorScalarDivide(A0_348, A1_349)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_350, A1_351)
  return VectorRotateY(A0_350, A1_351)
end
VEC_ROTATE = L0_0
function L0_0(A0_352, A1_353)
  BBMath(A0_352, A1_353)
end
BBVectorMath = L0_0
function L0_0(A0_354, A1_355)
  local L2_356, L3_357, L4_358, L5_359
  L2_356 = A0_354.InstanceVars
  L3_357 = L2_356.InterpDelta
  if L3_357 == nil then
    L3_357 = A1_355.Amount
    L4_358 = A1_355.AmountVar
    if L4_358 ~= nil then
      L4_358 = GetTable
      L5_359 = A0_354
      L4_358 = L4_358(L5_359, A1_355.AmountVarTable)
      L5_359 = A1_355.AmountVar
      L3_357 = L4_358[L5_359]
    end
    L4_358 = GetPosition
    L5_359 = A1_355.TargetVar
    L5_359 = A0_354[L5_359]
    L4_358 = L4_358(L5_359)
    L2_356.KnockBackStart = L4_358
    L4_358 = GetNormalizedPositionDelta
    L5_359 = A1_355.TargetVar
    L5_359 = A0_354[L5_359]
    L4_358 = L4_358(L5_359, A0_354[A1_355.AttackerVar], true)
    L5_359 = {}
    L5_359.x = L4_358.x * L3_357
    L5_359.y = 0
    L5_359.z = L4_358.z * L3_357
    L2_356.InterpDelta = L5_359
    L5_359 = GetTime
    L5_359 = L5_359()
    L2_356.StartTime = L5_359
    L5_359 = A1_355.KnockBackDuration
    L2_356.KnockBackDuration = L5_359
  end
  L3_357 = A1_355.TargetVar
  L3_357 = A0_354[L3_357]
  L4_358 = GetTime
  L4_358 = L4_358()
  L5_359 = L2_356.StartTime
  L4_358 = L4_358 - L5_359
  L5_359 = L2_356.KnockBackDuration
  L4_358 = L4_358 / L5_359
  L5_359 = {}
  L5_359.x = L2_356.KnockBackStart.x + L2_356.InterpDelta.x * L4_358
  L5_359.y = L2_356.KnockBackStart.y
  L5_359.z = L2_356.KnockBackStart.z + L2_356.InterpDelta.z * L4_358
  SetPosition(L3_357, L5_359)
end
BBKnockback = L0_0
function L0_0(A0_360, A1_361)
  local L2_362, L3_363
  L2_362 = GetParam
  L3_363 = "Left"
  L2_362 = L2_362(L3_363, A0_360, A1_361)
  L3_363 = GetParam
  L3_363 = L3_363("Right", A0_360, A1_361)
  GetTable(A0_360, A1_361.DestVarTable, true)[A1_361.DestVar] = tostring(L2_362) .. tostring(L3_363)
end
BBAppendString = L0_0
function L0_0(A0_364, A1_365)
  local L2_366
  L2_366 = 0
  if A1_365.Delta ~= nil then
    L2_366 = L2_366 + A1_365.Delta
  end
  if A1_365.DeltaByLevel ~= nil and A0_364.Level ~= nil then
    L2_366 = L2_366 + A1_365.DeltaByLevel[A0_364.Level]
  end
  if A1_365.DeltaVar ~= nil then
    L2_366 = L2_366 + GetTable(A0_364, A1_365.DeltaVarTable, true)[A1_365.DeltaVar]
  end
  if A1_365.TargetVar ~= nil then
    A1_365.Stat(L2_366, A0_364[A1_365.TargetVar])
  else
    A1_365.Stat(L2_366)
  end
end
BBIncStat = L0_0
function L0_0(A0_367, A1_368)
  local L2_369
  L2_369 = 0
  if A1_368.Delta ~= nil then
    L2_369 = L2_369 + A1_368.Delta
  end
  if A1_368.DeltaByLevel ~= nil and A0_367.Level ~= nil then
    L2_369 = L2_369 + A1_368.DeltaByLevel[A0_367.Level]
  end
  if A1_368.DeltaVar ~= nil then
    L2_369 = L2_369 + GetTable(A0_367, A1_368.DeltaVarTable, true)[A1_368.DeltaVar]
  end
  if A1_368.TargetVar ~= nil then
    A1_368.Stat(L2_369, A0_367[A1_368.TargetVar])
  else
    A1_368.Stat(L2_369)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_370, A1_371)
  local L2_372, L3_373
  L2_372 = A1_371.TargetVar
  L3_373 = 0
  if A1_371.LaneVar ~= nil then
    L3_373 = L3_373 + GetTable(A0_370, A1_371.LaneVarTable, true)[A1_371.LaneVar]
  end
  if A1_371.Lane ~= nil then
    L3_373 = L3_373 + A1_371.Lane
  end
  SetMinionLane(A0_370[L2_372], L3_373)
end
BBSetMinionLane = L0_0
function L0_0(A0_374, A1_375)
  if A1_375.AttackVar ~= nil then
  end
  if A1_375.Attack ~= nil then
  end
  if A1_375.TotalCoefficientVar ~= nil then
  end
  if A1_375.TotalCoefficient ~= nil then
  end
  if A1_375.TargetVar ~= nil then
    GetTable(A0_374, A1_375.DestVarTable, false)[A1_375.DestVar] = (0 + GetTable(A0_374, A1_375.AttackVarTable, true)[A1_375.AttackVar] + A1_375.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_374[A1_375.TargetVar])) + GetFlatCritDamageMod(A0_374[A1_375.TargetVar])) * (0 + GetTable(A0_374, A1_375.TotalCoefficientVarTable, true)[A1_375.TotalCoefficientVar] + A1_375.TotalCoefficient)
  else
    GetTable(A0_374, A1_375.DestVarTable, false)[A1_375.DestVar] = 2 * A1_375.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_376, A1_377)
  local L2_378, L3_379, L4_380, L5_381, L6_382, L7_383
  L2_378 = GetTable
  L3_379 = A0_376
  L4_380 = A1_377.DestVarTable
  L5_381 = false
  L2_378 = L2_378(L3_379, L4_380, L5_381)
  L3_379 = GetTable
  L4_380 = A0_376
  L5_381 = A1_377.AmountVarTable
  L6_382 = true
  L3_379 = L3_379(L4_380, L5_381, L6_382)
  L4_380 = GetTable
  L5_381 = A0_376
  L6_382 = A0_376.NextBuffVars
  L7_383 = false
  L4_380 = L4_380(L5_381, L6_382, L7_383)
  L5_381 = A1_377.AmountVar
  L5_381 = L3_379[L5_381]
  L6_382 = A1_377.Amount
  L5_381 = L5_381 + L6_382
  L4_380.InitializeShield_Amount = L5_381
  L5_381 = A1_377.AmountVar
  if L5_381 ~= nil then
    L5_381 = A1_377.HealShieldMod
    if L5_381 ~= nil and L5_381 == true then
      L6_382 = A1_377.AttackerVar
      L7_383 = 0
      if L6_382 ~= nil then
        L7_383 = GetPercentHealingAmountMod(A0_376[L6_382])
      end
      L4_380.InitializeShield_Amount, L3_379[A1_377.AmountVar] = (A1_377.Amount + L3_379[A1_377.AmountVar]) * (1 + L7_383), (A1_377.Amount + L3_379[A1_377.AmountVar]) * (1 + L7_383)
    end
  end
  L5_381 = SpellBuffAddNoRenew
  L6_382 = A1_377.AttackerVar
  L6_382 = A0_376[L6_382]
  L7_383 = A1_377.UnitVar
  L7_383 = A0_376[L7_383]
  L5_381(L6_382, L7_383, "InitializeShieldMarker", 0, 1, 25000, L4_380)
  L5_381 = BBIncreaseShield
  L6_382 = A0_376
  L7_383 = A1_377
  L5_381(L6_382, L7_383)
end
BBInitializeShield = L0_0
function L0_0(A0_384, A1_385)
  if A1_385.CDVar ~= nil then
  end
  if A1_385.CD ~= nil then
  end
  if A1_385.TargetVar ~= nil then
    GetTable(A0_384, A1_385.DestVarTable, false)[A1_385.DestVar] = (0 + GetTable(A0_384, A1_385.CDVarTable, true)[A1_385.CDVar] + A1_385.CD) * (1 + GetPercentCooldownMod(A0_384[A1_385.TargetVar]))
  else
    GetTable(A0_384, A1_385.DestVarTable, false)[A1_385.DestVar] = A1_385.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_386, A1_387)
  local L2_388, L3_389
  L3_389 = A1_387.TargetVar
  if L3_389 ~= nil then
    L2_388 = A1_387.Stat(A0_386[L3_389])
  else
    L2_388 = A1_387.Stat()
  end
  SetVarInTable(A0_386, A1_387, L2_388)
end
BBGetStat = L0_0
function L0_0(A0_390, A1_391)
  if A1_391.TargetVar ~= nil then
    GetTable(A0_390, A1_391.DestVarTable, false)[A1_391.DestVar] = GetLevel(A0_390[A1_391.TargetVar])
  else
    GetTable(A0_390, A1_391.DestVarTable, false)[A1_391.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_392, A1_393)
  if A1_393.TargetVar ~= nil then
    GetTable(A0_392, A1_393.DestVarTable, false)[A1_393.DestVar] = GetUnitSignificance(A0_392[A1_393.TargetVar])
  else
    GetTable(A0_392, A1_393.DestVarTable, false)[A1_393.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_394, A1_395)
  if A1_395.TargetVar ~= nil then
    GetTable(A0_394, A1_395.DestVarTable, false)[A1_395.DestVar] = GetArmor(A0_394[A1_395.TargetVar])
  else
    GetTable(A0_394, A1_395.DestVarTable, false)[A1_395.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_396, A1_397)
  if A1_397.TargetVar ~= nil then
    GetTable(A0_396, A1_397.DestVarTable, false)[A1_397.DestVar] = GetSpellBlock(A0_396[A1_397.TargetVar])
  else
    GetTable(A0_396, A1_397.DestVarTable, false)[A1_397.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_398, A1_399)
  local L2_400, L3_401
  L3_401 = A1_399.TargetVar
  if L3_401 ~= nil then
    L2_400 = GetTeamID(A0_398[L3_401])
  else
    L2_400 = GetTeamID()
  end
  SetVarInTable(A0_398, A1_399, L2_400)
end
BBGetTeamID = L0_0
function L0_0(A0_402, A1_403)
  local L2_404, L3_405, L4_406
  L2_404 = GetTable
  L3_405 = A0_402
  L4_406 = A1_403.DestVarTable
  L2_404 = L2_404(L3_405, L4_406, false)
  L3_405 = A1_403.TargetVar
  L4_406 = nil
  if L3_405 ~= nil then
    L4_406 = GetTeamID(A0_402[L3_405])
  else
    L4_406 = GetTeamID()
  end
  if L4_406 == TEAM_ORDER then
    L2_404[A1_403.DestVar] = TEAM_CHAOS
  elseif L4_406 == TEAM_CHAOS then
    L2_404[A1_403.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_407, A1_408)
  if A1_408.TargetVar ~= nil then
    GetTable(A0_407, A1_408.DestVarTable, false)[A1_408.DestVar] = GetUnitSkinName(A0_407[A1_408.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_409, A1_410)
  local L2_411, L3_412, L4_413
  L2_411 = GetTable
  L3_412 = A0_409
  L4_413 = A1_410.DestVarTable
  L2_411 = L2_411(L3_412, L4_413, false)
  L3_412 = A0_409.Owner
  L4_413 = nil
  if A1_410.TargetVar ~= nil then
    L4_413 = GetTotalAttackDamage(A0_409[A1_410.TargetVar])
  else
    L4_413 = GetTotalAttackDamage()
  end
  SetVarInTable(A0_409, A1_410, L4_413)
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_414, A1_415)
  GetTable(A0_414, A1_415.DestVarTable, true)[A1_415.DestVar] = A1_415.Status(A0_414[A1_415.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_416, A1_417)
  local L2_418
  L2_418 = A1_417.TargetVar
  L2_418 = A0_416[L2_418]
  ClearAttackTarget(L2_418)
end
BBClearAttackTarget = L0_0
function L0_0(A0_419, A1_420)
  local L2_421, L3_422
  L2_421 = GetTable
  L3_422 = A0_419
  L2_421 = L2_421(L3_422, A1_420.DestVarTable, true)
  L3_422 = A1_420.Info
  L3_422 = L3_422(A0_419[A1_420.TargetVar])
  SetVarInTable(A0_419, A1_420, L3_422)
end
BBGetCastInfo = L0_0
function L0_0(A0_423, A1_424, A2_425)
  local L3_426, L4_427, L5_428, L6_429
  L3_426 = GetTable
  L4_427 = A0_423
  L5_428 = A1_424.TrackTimeVarTable
  L6_429 = false
  L3_426 = L3_426(L4_427, L5_428, L6_429)
  L4_427 = GetTime
  L4_427 = L4_427()
  L5_428 = A1_424.ExecuteImmediately
  L6_429 = GetParam
  L6_429 = L6_429("TimeBetweenExecutions", A0_423, A1_424)
  if A1_424.TickTimeVar ~= nil and GetTable(A0_423, A1_424.TickTimeVarTable, false)[A1_424.TickTimeVar] ~= nil then
    L6_429 = GetTable(A0_423, A1_424.TickTimeVarTable, false)[A1_424.TickTimeVar]
  end
  if L3_426[A1_424.TrackTimeVar] == nil then
    L3_426[A1_424.TrackTimeVar] = L4_427
    if L5_428 == true then
      ExecuteBuildingBlocks(A2_425, A0_423)
    end
  end
  if L4_427 >= L3_426[A1_424.TrackTimeVar] + L6_429 then
    L3_426[A1_424.TrackTimeVar] = L3_426[A1_424.TrackTimeVar] + L6_429
    ExecuteBuildingBlocks(A2_425, A0_423)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_430, A1_431, A2_432)
  GetTable(A0_430, A1_431.TrackTimeVarTable, false)[A1_431.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_433, A1_434)
  local L2_435
  L2_435 = A1_434.SrcValue
  if A1_434.SrcVar ~= nil then
    L2_435 = GetTable(A0_433, A1_434.SrcVarTable, true)[A1_434.SrcVar]
  end
  A1_434.Status(A0_433[A1_434.TargetVar], L2_435)
end
BBSetStatus = L0_0
function L0_0(A0_436, A1_437)
  local L2_438
  L2_438 = A1_437.ToAlert
  if GetTable(A0_436, A1_437.SrcVarTable, false) ~= nil and A1_437.SrcVar ~= nil then
    L2_438 = L2_438 .. GetTable(A0_436, A1_437.SrcVarTable, false)[A1_437.SrcVar]
  end
  _ALERT(L2_438)
end
BBAlert = L0_0
function L0_0(A0_439, A1_440)
  local L2_441, L3_442, L4_443, L5_444, L6_445, L7_446
  L2_441 = GetParam
  L3_442 = "Message"
  L4_443 = A0_439
  L5_444 = A1_440
  L2_441 = L2_441(L3_442, L4_443, L5_444)
  if L2_441 == nil then
    L3_442 = ReportError
    L4_443 = "Could not resolve Message param"
    L3_442(L4_443)
    return
  end
  L3_442 = true
  L4_443 = GetParam
  L5_444 = "OnUnit"
  L6_445 = A0_439
  L7_446 = A1_440
  L4_443 = L4_443(L5_444, L6_445, L7_446)
  if L4_443 == nil then
    L3_442 = false
    L5_444 = GetParam
    L6_445 = "OnUnitByFlag"
    L7_446 = A0_439
    L5_444 = L5_444(L6_445, L7_446, A1_440)
    L4_443 = L5_444
  end
  if L4_443 == nil then
    L5_444 = ReportError
    L6_445 = "Could not resolve OnUnit param"
    L5_444(L6_445)
    return
  end
  L5_444 = true
  L6_445 = GetParam
  L7_446 = "ChampionToSayTo"
  L6_445 = L6_445(L7_446, A0_439, A1_440)
  if L6_445 == nil then
    L5_444 = false
    L7_446 = GetParam
    L7_446 = L7_446("ChampionToSayToByFlag", A0_439, A1_440)
    L6_445 = L7_446
  end
  if L6_445 == nil then
    L7_446 = ReportError
    L7_446("Could not resolve ChampionToSayTo param")
    return
  end
  L7_446 = GetParam
  L7_446 = L7_446("ShowToSpectator", A0_439, A1_440)
  if L7_446 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  SayWithFloatingTextOnUnitToChampion(tostring(L2_441), A1_440.TextType, L4_443, L3_442, L6_445, L5_444, L7_446)
end
BBSayWithFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_447, A1_448)
  local L2_449, L3_450, L4_451
  L2_449 = A1_448.ToSay
  L3_450 = GetTable
  L4_451 = A0_447
  L3_450 = L3_450(L4_451, A1_448.SrcVarTable, false)
  if L3_450 ~= nil then
    L4_451 = A1_448.SrcVar
    if L4_451 ~= nil then
      L4_451 = L2_449
      L2_449 = L4_451 .. tostring(L3_450[A1_448.SrcVar])
    end
  end
  L4_451 = nil
  if A1_448.OwnerVar ~= nil then
    L4_451 = A0_447[A1_448.OwnerVar]
  else
    L4_451 = A0_447.Owner
  end
  if A1_448.TextType == nil then
    A1_448.TextType = 0
  end
  Say(L4_451, L2_449, A1_448.TextType)
end
BBSay = L0_0
function L0_0(A0_452, A1_453)
  local L2_454, L3_455, L4_456
  L2_454 = A1_453.ToSay
  L3_455 = GetTable
  L4_456 = A0_452
  L3_455 = L3_455(L4_456, A1_453.SrcVarTable, false)
  if L3_455 ~= nil then
    L4_456 = A1_453.SrcVar
    if L4_456 ~= nil then
      L4_456 = L2_454
      L2_454 = L4_456 .. tostring(L3_455[A1_453.SrcVar])
    end
  end
  L4_456 = nil
  if A1_453.OwnerVar ~= nil then
    L4_456 = A0_452[A1_453.OwnerVar]
  else
    L4_456 = A0_452.Owner
  end
  if A1_453.TextType == nil then
    A1_453.TextType = 0
  end
  Say(L4_456, L2_454, A1_453.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_457, A1_458)
  GetTable(A0_457, A1_458.DestVarTable, true)[A1_458.DestVar] = BBLuaGetGold(A0_457, A1_458)
end
BBGetGold = L0_0
function L0_0(A0_459, A1_460)
  GetTable(A0_459, A1_460.DestVarTable, true)[A1_460.DestVar] = BBLuaGetTotalGold(A0_459, A1_460)
end
BBGetTotalGold = L0_0
function L0_0(A0_461, A1_462)
  SpellBuffAdd(A0_461[A1_462.OwnerVar], A0_461[A1_462.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_461.NextBuffVars)
  BBTeleportToPositionHelper(A0_461, A1_462)
end
BBTeleportToPosition = L0_0
function L0_0(A0_463, A1_464)
  if A1_464.XVar ~= nil and GetTable(A0_463, A1_464.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_463, A1_464.XVarTable, true)[A1_464.XVar]
  else
    Xloc = A1_464.X
  end
  if A1_464.YVar ~= nil and GetTable(A0_463, A1_464.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_463, A1_464.YVarTable, true)[A1_464.YVar]
  else
    Yloc = A1_464.Y
  end
  if A1_464.ZVar ~= nil and GetTable(A0_463, A1_464.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_463, A1_464.ZVarTable, true)[A1_464.ZVar]
  else
    Zloc = A1_464.Z
  end
  A1_464.OwnerVar, A0_463.position = A1_464.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_464.CastPositionName = "position"
  BBTeleportToPosition(A0_463, A1_464)
end
BBTeleportToPoint = L0_0
function L0_0(A0_465, A1_466)
  A1_466.TimeoutInFOW = 999999
  A1_466.BindFlexToOwnerPAR = false
  A1_466.Flags = 0
  A1_466.FollowsGroundTilt = false
  A1_466.FacesTarget = false
  A1_466.HideFromSpectator = false
  A1_466.SendIfOnScreenOrDiscard = false
  A1_466.PersistsThroughReconnect = true
  A1_466.FOWVisibilityRadius = 10
  A1_466.Scale = 1
  A1_466.BindObjectVar = A1_466.BindObject1Var
  A1_466.EffectID2Var = A1_466.OtherTeamEffectIDVar
  A1_466.TargetObjectVar = A1_466.BindObject2Var
  A1_466.FOWTeamOverrideVar = A1_466.FOWTeamVar
  A1_466.BoneName = A1_466.BindObject1BoneName
  A1_466.TargetBoneName = A1_466.BindObject2BoneName
  A1_466.EffectName = A1_466.EffectParticleFile
  A1_466.EffectNameForOtherTeam = A1_466.OtherTeamParticleFile
  BBSpellEffectCreate(A0_465, A1_466)
end
BBSpellEffectCreate_EasyBeam = L0_0
function L0_0(A0_467, A1_468)
  A1_468.TimeoutInFOW = 999999
  A1_468.BindFlexToOwnerPAR = false
  A1_468.Flags = 0
  A1_468.FollowsGroundTilt = false
  A1_468.FacesTarget = false
  A1_468.HideFromSpectator = false
  A1_468.SendIfOnScreenOrDiscard = true
  A1_468.PersistsThroughReconnect = false
  A1_468.FOWVisibilityRadius = 10
  A1_468.Scale = 1
  A1_468.FOWTeamOverrideVar = A1_468.FOWTeamVar
  A1_468.EffectName = A1_468.ParticleFile
  A1_468.EffectNameForOtherTeam = A1_468.ParticleFileForOtherTeam
  A1_468.BoneName = A1_468.BindObjectBoneName
  BBSpellEffectCreate(A0_467, A1_468)
end
BBSpellEffectCreate_EasyHit = L0_0
function L0_0(A0_469, A1_470)
  ReincarnateNonDeadHero(GetTable(A0_469, A1_470.TargetTable, false)[A1_470.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_471, A1_472)
  GetTable(A0_471, A1_472.DestVarTable, true)[A1_472.DestVar] = A1_472.Function(A0_471[A1_472.OwnerVar], A1_472.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_473, A1_474)
  local L2_475, L3_476, L4_477, L5_478
  L2_475 = A1_474.WhomToOrderVar
  L2_475 = A0_473[L2_475]
  L3_476 = A1_474.TargetOfOrderVar
  L3_476 = A0_473[L3_476]
  L4_477 = GetTable
  L5_478 = A0_473
  L4_477 = L4_477(L5_478, A1_474.SrcVarTable, false)
  L5_478 = nil
  if A1_474.SrcVar ~= nil and L4_477 ~= nil then
    L5_478 = L4_477[A1_474.SrcVar]
  else
    L5_478 = GetPosition(L3_476)
  end
  if L3_476 == nil then
    L3_476 = L2_475
  end
  IssueOrder(L2_475, A1_474.Order, L5_478, L3_476)
end
BBIssueOrder = L0_0
function L0_0(A0_479, A1_480)
  local L2_481
  L2_481 = GetParam
  L2_481 = L2_481("NewRange", A0_479, A1_480)
  SetSpellCastRange(L2_481)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_482, A1_483)
  GetTable(A0_482, A1_483.DestVarTable, true)[A1_483.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_484, A1_485)
  local L2_486, L3_487
  L2_486 = A1_485.ObjectVar1
  L2_486 = A0_484[L2_486]
  L3_487 = A1_485.ObjectVar2
  L3_487 = A0_484[L3_487]
  GetTable(A0_484, A1_485.DestVarTable, true)[A1_485.DestVar] = DistanceBetweenObjectBounds(L2_486, L3_487)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_488, A1_489)
  local L2_490, L3_491, L4_492
  L2_490 = A1_489.ObjectVar
  L2_490 = A0_488[L2_490]
  L3_491 = GetTable
  L4_492 = A0_488
  L3_491 = L3_491(L4_492, A1_489.PointVarTable, true)
  L4_492 = A1_489.PointVar
  L4_492 = L3_491[L4_492]
  GetTable(A0_488, A1_489.DestVarTable, true)[A1_489.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_490, L4_492)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_493, A1_494)
  local L2_495, L3_496
  L2_495 = GetParam
  L3_496 = "Point1"
  L2_495 = L2_495(L3_496, A0_493, A1_494)
  L3_496 = GetParam
  L3_496 = L3_496("Point2", A0_493, A1_494)
  GetTable(A0_493, A1_494.DestVarTable, true)[A1_494.DestVar] = DistanceBetweenPoints(L2_495, L3_496)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_497, A1_498, A2_499)
  local L3_500, L4_501, L5_502, L6_503, L7_504, L8_505
  L5_502 = 0
  L6_503 = nil
  L7_504 = A1_498.ObjectDistanceType
  L8_505 = A1_498.ObjectVar1
  L3_500 = A0_497[L8_505]
  L8_505 = A1_498.ObjectVar2
  L4_501 = A0_497[L8_505]
  if nil == L4_501 then
    L8_505 = A1_498.Point2Var
    if nil ~= L8_505 then
      L8_505 = GetTable
      L8_505 = L8_505(A0_497, A1_498.Point2VarTable, true)
      L4_501 = L8_505[A1_498.Point2Var]
      L5_502 = L5_502 + 1
    end
  end
  if nil == L3_500 then
    L8_505 = A1_498.Point1Var
    if nil ~= L8_505 then
      L8_505 = GetTable
      L8_505 = L8_505(A0_497, A1_498.Point1VarTable, true)
      L3_500 = L8_505[A1_498.Point1Var]
      L5_502 = L5_502 + 1
      if 1 == L5_502 then
        L3_500, L4_501 = L4_501, L3_500
      end
    end
  end
  if nil ~= L7_504 then
    if 0 == L5_502 then
      L8_505 = OBJECT_CENTER
      if L8_505 == L7_504 then
        L6_503 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_505 = OBJECT_BOUNDARY
        if L8_505 == L7_504 then
          L6_503 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_505 = A1_498.OwnerVar
          L8_505 = A0_497[L8_505]
          Say(L8_505, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_502 then
      L8_505 = OBJECT_CENTER
      if L8_505 == L7_504 then
        L6_503 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_505 = OBJECT_BOUNDARY
        if L8_505 == L7_504 then
          L6_503 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_505 = A1_498.OwnerVar
          L8_505 = A0_497[L8_505]
          Say(L8_505, "invalid object distance type", 0)
        end
      end
    else
      L6_503 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_505 = A1_498.Distance
  if A1_498.DistanceVar ~= nil and GetTable(A0_497, A1_498.DistanceVarTable, true) ~= nil then
    L8_505 = L8_505 + GetTable(A0_497, A1_498.DistanceVarTable, true)[A1_498.DistanceVar]
  end
  if L3_500 ~= nil and L4_501 ~= nil and L6_503 ~= nil and L8_505 ~= nil then
    if not L6_503(L3_500, L4_501, L8_505) then
      ExecuteBuildingBlocks(A2_499, A0_497)
      A0_497.LastIfSucceeded = true
    else
      A0_497.LastIfSucceeded = false
    end
  else
    A0_497.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_506, A1_507)
  local L2_508, L3_509
  L2_508 = A1_507.TargetVar
  L2_508 = A0_506[L2_508]
  L3_509 = A1_507.CasterVar
  L3_509 = A0_506[L3_509]
  GetTable(A0_506, A1_507.DestVarTable, true)[A1_507.DestVar] = SpellBuffCount(L2_508, A1_507.BuffName, L3_509)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_510, A1_511)
  local L2_512
  L2_512 = A1_511.TargetVar
  L2_512 = A0_510[L2_512]
  GetTable(A0_510, A1_511.DestVarTable, true)[A1_511.DestVar] = SpellBuffCount(L2_512, A1_511.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_513, A1_514)
  local L2_515, L3_516
  L2_515 = GetTable
  L3_516 = A0_513
  L2_515 = L2_515(L3_516, A1_514.ScaleVarTable, false)
  L3_516 = nil
  if A1_514.OwnerVar ~= nil then
    L3_516 = A0_513[A1_514.OwnerVar]
  else
    L3_516 = A0_513.Owner
  end
  if A1_514.ScaleVar ~= nil and A1_514.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_515[A1_514.ScaleVar], L3_516)
  else
    SetScaleSkinCoef(A1_514.Scale, L3_516)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_517, A1_518)
  SpellBuffAdd(A0_517[A1_518.TargetVar], A0_517[A1_518.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_517.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_519, A1_520, A2_521)
  local L3_522, L4_523
  L3_522 = A1_520.TargetVar
  L3_522 = A0_519[L3_522]
  L4_523 = A1_520.NumStacks
  if GetParam("NumStacks", A0_519, A1_520) == 0 then
    L4_523 = SpellBuffCount(L3_522, A1_520.BuffName, caster)
  else
    L4_523 = GetParam("NumStacks", A0_519, A1_520)
  end
  while L4_523 > 0 do
    SpellBuffRemove(L3_522, A1_520.BuffName, A0_519[A1_520.AttackerVar])
    L4_523 = L4_523 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_524, A1_525)
  local L2_526, L3_527
  L2_526 = GetParam
  L3_527 = "Unit"
  L2_526 = L2_526(L3_527, A0_524, A1_525)
  unit = L2_526
  L2_526 = unit
  if L2_526 == nil then
    L2_526 = ReportError
    L3_527 = "Could not resolve Unit param"
    L2_526(L3_527)
    return
  end
  L2_526 = true
  L3_527 = GetParam
  L3_527 = L3_527("ChampionToShowTo", A0_524, A1_525)
  if L3_527 == nil then
    L2_526 = false
    L3_527 = GetParam("ChampionToShowToByFlag", A0_524, A1_525)
  end
  if L3_527 == nil then
    ReportError("Could not resolve ChampionToShowTo param")
    return
  end
  SetShowHealthBarToChampion(unit, A1_525.Show, L3_527, L2_526, A1_525.ApplyToSpectator)
end
BBSetShowHealthBarToChampion = L0_0
function L0_0(A0_528, A1_529, A2_530)
  if A0_528.EmoteId == A1_529.EmoteId then
    ExecuteBuildingBlocks(A2_530, A0_528)
    A0_528.LastIfSucceeded = true
  else
    A0_528.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_531, A1_532, A2_533)
  if A0_531.EmoteId ~= A1_532.EmoteId then
    ExecuteBuildingBlocks(A2_533, A0_531)
    A0_531.LastIfSucceeded = true
  else
    A0_531.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_534, A1_535)
  local L2_536, L3_537, L4_538, L5_539
  L2_536 = GetTable
  L3_537 = A0_534
  L4_538 = A1_535.String1VarTable
  L5_539 = false
  L2_536 = L2_536(L3_537, L4_538, L5_539)
  L3_537 = A1_535.String1Var
  L3_537 = L2_536[L3_537]
  L4_538 = GetTable
  L5_539 = A0_534
  L4_538 = L4_538(L5_539, A1_535.String2VarTable, false)
  L5_539 = A1_535.String2Var
  L5_539 = L4_538[L5_539]
  GetTable(A0_534, A1_535.ResultVarTable, false)[A1_535.ResultVar] = L3_537 .. L5_539
end
BBConcatenateStrings = L0_0
function L0_0(A0_540, A1_541)
  local L2_542, L3_543
  L2_542 = GetTable
  L3_543 = A0_540
  L2_542 = L2_542(L3_543, A1_541.VariableVarTable, false)
  L3_543 = A1_541.VariableVar
  L3_543 = L2_542[L3_543]
  GetTable(A0_540, A1_541.ResultVarTable, false)[A1_541.ResultVar] = "(" .. L3_543 .. ")"
end
BBEncaseInParantheses = L0_0
function L0_0(A0_544, A1_545)
  BBGetMinionKills(A0_544, A1_545)
  A0_544.MinionKillSource = GetParam("MinionKillTarget")
  A0_544.MinionKills = A0_544.MinionsKilled + GetParam("MinionKills", A0_544, A1_545)
  BBSetMinionKills(A0_544, A1_545)
end
BBIncreaseMinionKills = L0_0
