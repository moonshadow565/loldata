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
        do break end
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
        ClientPrint("Missing Required Variable: " .. L3_18 .. "." .. A1_16.RequiredVar .. " Current block data is: " .. tostring(gCurrentBuildingBlockString))
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
  local L2_56, L3_57, L4_58, L5_59, L6_60
  L2_56 = A1_55.ToSay
  L2_56 = L2_56 or ""
  L3_57 = A1_55.Color
  L3_57 = L3_57 or "FFFFFF"
  L4_58 = GetTable
  L5_59 = A0_54
  L6_60 = A1_55.SrcVarTable
  L4_58 = L4_58(L5_59, L6_60, false)
  L5_59 = A1_55.SrcVar
  L5_59 = L4_58[L5_59]
  L6_60 = "<font color=\""
  L6_60 = L6_60 .. L3_57 .. "\">"
  if L2_56 == "" then
    if A1_55.SrcVarTable ~= nil then
      L6_60 = L6_60 .. A1_55.SrcVarTable .. "." .. (A1_55.SrcVar or "")
    else
      L6_60 = L6_60 .. (A1_55.SrcVar or "")
    end
  else
    L6_60 = L6_60 .. L2_56
  end
  if type(L5_59) ~= "table" and type(L5_59) ~= "nil" then
    L6_60 = L6_60 .. " " .. tostring(L5_59)
  end
  L6_60 = L6_60 .. "</font>"
  DebugClientPrint(L6_60)
  if type(L5_59) == "table" then
    DebugPrintTableToChat(L5_59)
  end
end
BBDebugPrintToChat = L0_0
function L0_0(A0_61, A1_62)
  local L2_63, L3_64
  L2_63 = GetTable
  L3_64 = A0_61
  L2_63 = L2_63(L3_64, A1_62.TableName, true)
  L3_64 = A1_62.TableName
  L3_64 = L3_64 or "PassThroughParams"
  DebugClientPrint(L3_64)
  DebugPrintTableToChat(L2_63)
end
BBDebugPrintTableToChat = L0_0
function L0_0(A0_65, A1_66)
  local L2_67, L3_68, L4_69, L5_70, L6_71, L7_72, L8_73, L9_74, L10_75, L11_76, L12_77, L13_78
  A1_66 = A1_66 or 0
  if A1_66 > 10 then
    return
  end
  L2_67 = nil
  L3_68 = "|"
  for L7_72 = 1, A1_66 do
    L9_74 = "----"
    L3_68 = L8_73 .. L9_74
  end
  L6_71(L7_72)
  for L9_74, L10_75 in L6_71(L7_72) do
    L11_76 = nil
    L12_77 = tostring
    L13_78 = L9_74
    L12_77 = L12_77(L13_78)
    if L12_77 == "PassThroughParams" then
      L11_76 = "{{ PassThroughParams }}"
    else
      L13_78 = type
      L13_78 = L13_78(L10_75)
      if L13_78 == "table" then
        L11_76 = "Table"
      else
        L13_78 = tostring
        L13_78 = L13_78(L10_75)
        L11_76 = L13_78
      end
    end
    L13_78 = L3_68
    L13_78 = L13_78 .. L12_77 .. ": " .. L11_76
    DebugClientPrint(L13_78)
    if type(L10_75) == "table" then
      DebugPrintTableToChat(L10_75, A1_66 + 1)
    end
  end
  L6_71(L7_72)
end
DebugPrintTableToChat = L0_0
function L0_0(A0_79, A1_80, A2_81)
  local L3_82
  if A1_80 ~= nil then
    L3_82 = A0_79[A1_80]
    if L3_82 == nil and A2_81 then
      A0_79[A1_80] = {}
      return A0_79[A1_80]
    end
  end
  if L3_82 == nil then
    L3_82 = A0_79
  end
  return L3_82
end
GetTable = L0_0
function L0_0(A0_83, A1_84, A2_85)
  if A2_85[A0_83 .. "Var"] ~= nil and GetTable(A1_84, A2_85[A0_83 .. "VarTable"], false) ~= nil then
    return GetTable(A1_84, A2_85[A0_83 .. "VarTable"], false)[A2_85[A0_83 .. "Var"]]
  else
    return A2_85[A0_83]
  end
end
GetParam = L0_0
function L0_0(A0_86, A1_87)
  GetTable(A0_86, A1_87.DestVarTable, true)[A1_87.DestVar] = {}
end
BBCreateCustomTable = L0_0
function L0_0(A0_88, A1_89)
  GetTable(A0_88, A1_89.TableNameVarTable, false)[A1_89.TableNameVar] = nil
end
BBDestroyCustomTable = L0_0
function L0_0(A0_90, A1_91)
  if type(GetTable(A0_90, A1_91.DestTableVarTable, false)[A1_91.DestTableVar]) == "nil" then
    GetTable(A0_90, A1_91.DestTableVarTable, false)[A1_91.DestTableVar] = {}
  end
  if type(GetTable(A0_90, A1_91.DestTableVarTable, false)[A1_91.DestTableVar]) == "table" then
    GetTable(A0_90, A1_91.DestTableVarTable, false)[A1_91.DestTableVar][GetParam("Key", A0_90, A1_91)] = GetParam("Value", A0_90, A1_91)
  end
end
BBSetKeyValueInCustomTable = L0_0
function L0_0(A0_92, A1_93)
  if type(GetTable(A0_92, A1_93.SrcTableVarTable, false)[A1_93.SrcTableVar]) == "table" then
    GetTable(A0_92, A1_93.DestVarTable, true)[A1_93.DestVar] = GetTable(A0_92, A1_93.SrcTableVarTable, false)[A1_93.SrcTableVar][GetParam("SrcKey", A0_92, A1_93)]
  end
end
BBGetKeyValueInCustomTable = L0_0
function L0_0(A0_94, A1_95)
  local L2_96, L3_97, L4_98
  L2_96 = GetTable
  L3_97 = A0_94
  L4_98 = A1_95.DestTableVarTable
  L2_96 = L2_96(L3_97, L4_98, false)
  L3_97 = GetParam
  L4_98 = "DestIndex"
  L3_97 = L3_97(L4_98, A0_94, A1_95)
  L4_98 = GetParam
  L4_98 = L4_98("Value", A0_94, A1_95)
  if type(L2_96[A1_95.DestTableVar]) == "nil" then
    L2_96[A1_95.DestTableVar] = {}
  end
  if type(L2_96[A1_95.DestTableVar]) == "table" then
    if L3_97 then
      table.insert(L2_96[A1_95.DestTableVar], L3_97, L4_98)
      if A1_95.OutIndexVar then
        GetTable(A0_94, A1_95.OutIndexVarTable, true)[A1_95.OutIndexVar] = L3_97
      end
    else
      table.insert(L2_96[A1_95.DestTableVar], L4_98)
      if A1_95.OutIndexVar then
        GetTable(A0_94, A1_95.OutIndexVarTable, true)[A1_95.OutIndexVar] = table.getn(L2_96[A1_95.DestTableVar])
      end
    end
  end
end
BBInsertIntoInCustomTable = L0_0
function L0_0(A0_99, A1_100)
  local L2_101, L3_102
  L2_101 = GetTable
  L3_102 = A0_99
  L2_101 = L2_101(L3_102, A1_100.TableVarTable, false)
  L3_102 = GetParam
  L3_102 = L3_102("Index", A0_99, A1_100)
  if type(L2_101[A1_100.TableVar]) == "nil" then
    ClientPrint("Table specified does not exist: " .. tostring(A1_100.TableVarTable) .. "." .. tostring(A1_100.TableVar))
    return
  end
  if type(L2_101[A1_100.TableVar]) == "table" then
    if GetParam("Key", A0_99, A1_100) then
      L2_101[A1_100.TableVar][GetParam("Key", A0_99, A1_100)] = nil
    elseif L3_102 then
      table.remove(L2_101[A1_100.TableVar], L3_102)
    else
      ClientPrint("Specified index/key was nil: " .. tostring(A1_100.IndexVarTable) .. "." .. tostring(A1_100.IndexVar))
    end
  end
end
BBRemoveFromCustomTable = L0_0
function L0_0(A0_103, A1_104, A2_105)
  local L3_106, L4_107, L5_108, L6_109, L7_110, L8_111
  L3_106 = GetTable
  L3_106 = L3_106(L4_107, L5_108, L6_109)
  if L4_107 == "table" then
    if L4_107 then
      for L8_111, _FORV_9_ in L5_108(L6_109) do
        table.insert(L4_107, L8_111)
      end
      L5_108(L6_109)
      for L8_111, _FORV_9_ in L5_108(L6_109) do
        GetTable(A0_103, A1_104.DestKeyVarTable, true)[A1_104.DestKeyVar] = _FORV_9_
        GetTable(A0_103, A1_104.DestValueVarTable, true)[A1_104.DestValueVar] = L3_106[A1_104.TableVar][_FORV_9_]
        ExecuteBuildingBlocks(A2_105, A0_103)
      end
    else
      for L7_110, L8_111 in L4_107(L5_108) do
        GetTable(A0_103, A1_104.DestKeyVarTable, true)[A1_104.DestKeyVar] = L7_110
        GetTable(A0_103, A1_104.DestValueVarTable, true)[A1_104.DestValueVar] = L8_111
        ExecuteBuildingBlocks(A2_105, A0_103)
      end
    end
  end
end
BBForEachInCustomTable = L0_0
function L0_0(A0_112, A1_113)
  local L2_114, L3_115, L4_116, L5_117, L6_118
  L2_114 = GetTable
  L3_115 = A0_112
  L4_116 = A1_113.SrcTableVarTable
  L5_117 = false
  L2_114 = L2_114(L3_115, L4_116, L5_117)
  L3_115 = GetParam
  L4_116 = "Value"
  L5_117 = A0_112
  L6_118 = A1_113
  L3_115 = L3_115(L4_116, L5_117, L6_118)
  L4_116 = GetTable
  L5_117 = A0_112
  L6_118 = A1_113.MatchingKeyVarTable
  L4_116 = L4_116(L5_117, L6_118, false)
  L5_117 = GetTable
  L6_118 = A0_112
  L5_117 = L5_117(L6_118, A1_113.WasFoundVarTable, false)
  L6_118 = A1_113.WasFoundVar
  L5_117[L6_118] = false
  L6_118 = type
  L6_118 = L6_118(L2_114[A1_113.SrcTableVar])
  if L6_118 == "table" then
    L6_118 = GetTable
    L6_118 = L6_118(A0_112, A1_113.DestVarTable, true)
    for _FORV_10_, _FORV_11_ in pairs(L6_118) do
      if _FORV_11_ == L3_115 then
        L5_117[A1_113.WasFoundVar] = true
        L4_116[A1_113.MatchingKeyVar] = _FORV_10_
      end
    end
  end
end
BBCustomTableContainsValue = L0_0
function L0_0(A0_119, A1_120, A2_121)
  for _FORV_9_, _FORV_10_ in pairs(GetTable(A0_119, A1_120.TableVarTable, false)[A1_120.TableVar]) do
  end
  GetTable(A0_119, A1_120.SizeVarTable, false)[A1_120.SizeVar] = 0 + 1
end
BBGetSizeOfCustomTable = L0_0
function L0_0(A0_122, A1_123)
  local L2_124, L3_125, L4_126, L5_127
  L2_124 = GetTable
  L3_125 = A0_122
  L4_126 = A1_123.DestVarTable
  L5_127 = true
  L2_124 = L2_124(L3_125, L4_126, L5_127)
  L3_125 = nil
  L4_126 = GetTable
  L5_127 = A0_122
  L4_126 = L4_126(L5_127, A1_123.SpellSlotVarTable, false)
  L5_127 = A1_123.SpellSlotVar
  if L5_127 ~= nil and L4_126 ~= nil then
    L5_127 = A1_123.SpellSlotVar
    L3_125 = L4_126[L5_127]
  else
    L3_125 = A1_123.SpellSlotValue
  end
  L5_127 = A1_123.Function
  L5_127 = L5_127(A0_122[A1_123.OwnerVar], L3_125, A1_123.SpellbookType, A1_123.SlotType)
  SetVarInTable(A0_122, A1_123, L5_127)
end
BBGetSlotSpellInfo = L0_0
function L0_0(A0_128, A1_129)
  local L2_130, L3_131, L4_132
  L2_130 = GetTable
  L3_131 = A0_128
  L4_132 = A1_129.SrcVarTable
  L2_130 = L2_130(L3_131, L4_132, false)
  L3_131 = nil
  L4_132 = A1_129.SrcVar
  if L4_132 ~= nil and L2_130 ~= nil then
    L4_132 = A1_129.SrcVar
    L3_131 = L2_130[L4_132]
  else
    L3_131 = A1_129.SrcValue
  end
  L4_132 = nil
  if A1_129.SpellSlotVar ~= nil and GetTable(A0_128, A1_129.SpellSlotVarTable, false) ~= nil then
    L4_132 = GetTable(A0_128, A1_129.SpellSlotVarTable, false)[A1_129.SpellSlotVar]
  else
    L4_132 = A1_129.SpellSlotValue
  end
  SetSlotSpellCooldownTime(A0_128[A1_129.OwnerVar], L4_132, A1_129.SpellbookType, A1_129.SlotType, L3_131)
end
BBSetSlotSpellCooldownTime = L0_0
function L0_0(A0_133, A1_134)
  if A0_133.Level ~= nil and A1_134.SrcValueByLevel ~= nil then
    A0_133.ReturnValue = A1_134.SrcValueByLevel[A0_133.Level]
  elseif A1_134.SrcVar ~= nil and GetTable(A0_133, A1_134.SrcVarTable, false) ~= nil then
    A0_133.ReturnValue = GetTable(A0_133, A1_134.SrcVarTable, false)[A1_134.SrcVar]
  else
    A0_133.ReturnValue = A1_134.SrcValue
  end
end
BBSetReturnValue = L0_0
function L0_0(A0_135, A1_136)
  if type(A0_135) == "string" and type(A1_136) == "string" then
    A0_135 = string.lower(A0_135)
    A1_136 = string.lower(A1_136)
  end
  return A0_135 == A1_136
end
CO_EQUAL = L0_0
function L0_0(A0_137, A1_138)
  if type(A0_137) == "string" and type(A1_138) == "string" then
    A0_137 = string.lower(A0_137)
    A1_138 = string.lower(A1_138)
  end
  return A0_137 ~= A1_138
end
CO_NOT_EQUAL = L0_0
function L0_0(A0_139, A1_140)
  local L2_141
  L2_141 = A0_139 < A1_140
  return L2_141
end
CO_LESS_THAN = L0_0
function L0_0(A0_142, A1_143)
  local L2_144
  L2_144 = A1_143 < A0_142
  return L2_144
end
CO_GREATER_THAN = L0_0
function L0_0(A0_145, A1_146)
  local L2_147
  L2_147 = A0_145 <= A1_146
  return L2_147
end
CO_LESS_THAN_OR_EQUAL = L0_0
function L0_0(A0_148, A1_149)
  local L2_150
  L2_150 = A1_149 <= A0_148
  return L2_150
end
CO_GREATER_THAN_OR_EQUAL = L0_0
function L0_0(A0_151, A1_152)
  return GetTeamID(A0_151) == GetTeamID(A1_152)
end
CO_SAME_TEAM = L0_0
function L0_0(A0_153, A1_154)
  return GetTeamID(A0_153) ~= GetTeamID(A1_154)
end
CO_DIFFERENT_TEAM = L0_0
function L0_0(A0_155, A1_156)
  return GetSourceType() == A1_156 or GetSourceType() == A0_155
end
CO_DAMAGE_SOURCETYPE_IS = L0_0
function L0_0(A0_157, A1_158)
  return GetSourceType() ~= A1_158 and GetSourceType() ~= A0_157
end
CO_DAMAGE_SOURCETYPE_IS_NOT = L0_0
function L0_0(A0_159)
  return IsObjectAI(A0_159)
end
CO_IS_TYPE_AI = L0_0
function L0_0(A0_160)
  return IsObjectAI(A0_160) ~= true
end
CO_IS_NOT_AI = L0_0
function L0_0(A0_161)
  return IsObjectHero(A0_161)
end
CO_IS_TYPE_HERO = L0_0
function L0_0(A0_162)
  return IsObjectHero(A0_162) ~= true
end
CO_IS_NOT_HERO = L0_0
function L0_0(A0_163)
  return IsClone(A0_163)
end
CO_IS_CLONE = L0_0
function L0_0(A0_164)
  return IsClone(A0_164) ~= true
end
CO_IS_NOT_CLONE = L0_0
function L0_0(A0_165)
  return IsMelee(A0_165)
end
CO_IS_MELEE = L0_0
function L0_0(A0_166)
  return IsMelee(A0_166) ~= true
end
CO_IS_RANGED = L0_0
function L0_0(A0_167)
  return A0_167 > math.random()
end
CO_RANDOM_CHANCE_LESS_THAN = L0_0
function L0_0(A0_168)
  return IsTurretAI(A0_168)
end
CO_IS_TYPE_TURRET = L0_0
function L0_0(A0_169)
  return IsTurretAI(A0_169) ~= true
end
CO_IS_NOT_TURRET = L0_0
function L0_0(A0_170)
  return IsDampener(A0_170)
end
CO_IS_TYPE_INHIBITOR = L0_0
function L0_0(A0_171)
  return IsDampener(A0_171) ~= true
end
CO_IS_NOT_INHIBITOR = L0_0
function L0_0(A0_172)
  return IsHQ(A0_172)
end
CO_IS_TYPE_NEXUS = L0_0
function L0_0(A0_173)
  return IsHQ(A0_173) ~= true
end
CO_IS_NOT_NEXUS = L0_0
function L0_0(A0_174)
  return IsDead(A0_174)
end
CO_IS_DEAD = L0_0
function L0_0(A0_175)
  return IsDead(A0_175) ~= true
end
CO_IS_NOT_DEAD = L0_0
function L0_0(A0_176)
  return IsDeadOrZombie(A0_176)
end
CO_IS_DEAD_OR_ZOMBIE = L0_0
function L0_0(A0_177, A1_178)
  return BBIsTargetInFrontOfMe(A0_177, A1_178)
end
CO_IS_TARGET_IN_FRONT_OF_ME = L0_0
function L0_0(A0_179, A1_180)
  return BBIsTargetBehindMe(A0_179, A1_180)
end
CO_IS_TARGET_BEHIND_ME = L0_0
function L0_0(A0_181)
  return IsWard(A0_181)
end
CO_IS_WARD = L0_0
function L0_0(A0_182)
  return IsStructure(A0_182)
end
CO_IS_STRUCTURE = L0_0
function L0_0(A0_183)
  return IsStructure(A0_183) ~= true
end
CO_IS_NOT_STRUCTURE = L0_0
function L0_0(A0_184)
  local L1_185
  L1_185 = A0_184 ~= nil
  return L1_185
end
CO_IS_NOT_NIL = L0_0
function L0_0(A0_186, A1_187, A2_188)
  GetTable(A0_186, A1_187.MacroVarTable, true)[A1_187.MacroVar] = A2_188
end
BBCreateMacro = L0_0
function L0_0(A0_189, A1_190)
  local L2_191
  L2_191 = GetParam
  L2_191 = L2_191("Macro", A0_189, A1_190)
  if L2_191 ~= nil and type(L2_191) == "table" then
    ExecuteBuildingBlocks(L2_191, A0_189)
  else
    ClientPrint("Designer Error: Macro variable is not initialized inside of event. Macro Variable was: " .. tostring(A1_190.MacroVar) .. " and current block data is: " .. gCurrentBuildingBlockString .. ". This error probably occurred due to variable not being initialized yet, being misnamed or two events being called out of sequence. It is highly recommended that script macros either be initialized OnBuffActivate, OnCharActivate or in the same event. Pro Devs may violate this rule at the risk of being forced to read this error message again.")
  end
end
BBRunMacro = L0_0
function L0_0(A0_192, A1_193, A2_194)
  local L3_195, L4_196, L5_197, L6_198
  L3_195 = GetTable
  L4_196 = A0_192
  L5_197 = A1_193.Src1VarTable
  L6_198 = false
  L3_195 = L3_195(L4_196, L5_197, L6_198)
  L4_196 = GetTable
  L5_197 = A0_192
  L6_198 = A1_193.Src2VarTable
  L4_196 = L4_196(L5_197, L6_198, false)
  L5_197 = false
  L6_198 = nil
  if L3_195 ~= nil and A1_193.Src1Var ~= nil then
    L6_198 = L3_195[A1_193.Src1Var]
  else
    L6_198 = A1_193.Value1
  end
  if L4_196 ~= nil and A1_193.Src2Var ~= nil then
    L5_197 = A1_193.CompareOp(L6_198, L4_196[A1_193.Src2Var])
  else
    L5_197 = A1_193.CompareOp(L6_198, A1_193.Value2)
  end
  if L5_197 then
    ExecuteBuildingBlocks(A2_194, A0_192)
    A0_192.LastIfSucceeded = true
  else
    A0_192.LastIfSucceeded = false
  end
end
BBIf = L0_0
function L0_0(A0_199, A1_200, A2_201)
  if A0_199.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_201, A0_199)
    A0_199.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_202, A1_203, A2_204)
  local L3_205, L4_206, L5_207, L6_208
  L3_205 = A0_202.LastIfSucceeded
  if L3_205 == false then
    L3_205 = GetTable
    L4_206 = A0_202
    L5_207 = A1_203.Src1VarTable
    L6_208 = false
    L3_205 = L3_205(L4_206, L5_207, L6_208)
    L4_206 = GetTable
    L5_207 = A0_202
    L6_208 = A1_203.Src2VarTable
    L4_206 = L4_206(L5_207, L6_208, false)
    L5_207 = false
    L6_208 = nil
    if L3_205 ~= nil and A1_203.Src1Var ~= nil then
      L6_208 = L3_205[A1_203.Src1Var]
    else
      L6_208 = A1_203.Value1
    end
    if L4_206 ~= nil and A1_203.Src2Var ~= nil then
      L5_207 = A1_203.CompareOp(L6_208, L4_206[A1_203.Src2Var])
    else
      L5_207 = A1_203.CompareOp(L6_208, A1_203.Value2)
    end
    if L5_207 then
      ExecuteBuildingBlocks(A2_204, A0_202)
      A0_202.LastIfSucceeded = true
    else
      A0_202.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_209, A1_210, A2_211)
  local L3_212
  if A1_210.TargetVar ~= nil then
    L3_212 = A0_209[A1_210.TargetVar]
  else
    L3_212 = A0_209.Target
  end
  if HasBuffOfType(L3_212, A1_210.BuffType) then
    ExecuteBuildingBlocks(A2_211, A0_209)
    A0_209.LastIfSucceeded = true
  else
    A0_209.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_213, A1_214, A2_215)
  local L3_216, L4_217
  if A1_214.OwnerVar ~= nil then
    L3_216 = A0_213[A1_214.OwnerVar]
  else
    L3_216 = A0_213.Owner
  end
  if A1_214.AttackerVar ~= nil then
    L4_217 = A0_213[A1_214.AttackerVar]
  else
    L4_217 = A0_213.Attacker
  end
  if SpellBuffCount(L3_216, A1_214.BuffName, L4_217) > 0 then
    ExecuteBuildingBlocks(A2_215, A0_213)
    A0_213.LastIfSucceeded = true
  else
    A0_213.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_218, A1_219, A2_220)
  if BBIsMissileAutoAttack(A0_218, A1_219) then
    ExecuteBuildingBlocks(A2_220, A0_218)
    A0_218.LastIfSucceeded = true
  else
    A0_218.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_221, A1_222, A2_223)
  if BBIsMissileConsideredAsAutoAttack(A0_221, A1_222) then
    ExecuteBuildingBlocks(A2_223, A0_221)
    A0_221.LastIfSucceeded = true
  else
    A0_221.LastIfSucceeded = false
  end
end
BBIfMissileConsideredAsAutoAttack = L0_0
function L0_0(A0_224, A1_225)
  A0_224.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_226, A1_227, A2_228)
  local L3_229, L4_230
  if A1_227.OwnerVar ~= nil then
    L3_229 = A0_226[A1_227.OwnerVar]
  else
    L3_229 = A0_226.Owner
  end
  if A1_227.CasterVar ~= nil then
    L4_230 = A0_226[A1_227.CasterVar]
  else
    L4_230 = A0_226.Caster
  end
  if SpellBuffCount(L3_229, A1_227.BuffName, L4_230) <= 0 then
    ExecuteBuildingBlocks(A2_228, A0_226)
    A0_226.LastIfSucceeded = true
  else
    A0_226.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_231, A1_232, A2_233)
  local L3_234, L4_235
  if A1_232.OwnerVar ~= nil then
    L3_234 = A0_231[A1_232.OwnerVar]
  else
    L3_234 = A0_231.Owner
  end
  if HasPARType(L3_234, A1_232.PARType) then
    ExecuteBuildingBlocks(A2_233, A0_231)
    A0_231.LastIfSucceeded = true
  else
    A0_231.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_236, A1_237, A2_238)
  local L3_239, L4_240
  if A1_237.OwnerVar ~= nil then
    L3_239 = A0_236[A1_237.OwnerVar]
  else
    L3_239 = A0_236.Owner
  end
  if not HasPARType(L3_239, A1_237.PARType) then
    ExecuteBuildingBlocks(A2_238, A0_236)
    A0_236.LastIfSucceeded = true
  else
    A0_236.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_241, A1_242, A2_243)
  local L3_244, L4_245, L5_246, L6_247, L7_248
  L3_244 = GetTable
  L4_245 = A0_241
  L5_246 = A1_242.Src1VarTable
  L6_247 = false
  L3_244 = L3_244(L4_245, L5_246, L6_247)
  L4_245 = GetTable
  L5_246 = A0_241
  L6_247 = A1_242.Src2VarTable
  L7_248 = false
  L4_245 = L4_245(L5_246, L6_247, L7_248)
  L5_246 = true
  while L5_246 do
    L6_247 = false
    L7_248 = nil
    if L3_244 ~= nil and A1_242.Src1Var ~= nil then
      L7_248 = L3_244[A1_242.Src1Var]
    else
      L7_248 = A1_242.Value1
    end
    if L4_245 ~= nil and A1_242.Src2Var ~= nil then
      L6_247 = A1_242.CompareOp(L7_248, L4_245[A1_242.Src2Var])
    else
      L6_247 = A1_242.CompareOp(L7_248, A1_242.Value2)
    end
    if L6_247 then
      ExecuteBuildingBlocks(A2_243, A0_241)
    else
      L5_246 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_249, A1_250)
  return A0_249 * A1_250
end
MO_MULTIPLY = L0_0
function L0_0(A0_251, A1_252)
  return A0_251 + A1_252
end
MO_ADD = L0_0
function L0_0(A0_253, A1_254)
  return A0_253 - A1_254
end
MO_SUBTRACT = L0_0
function L0_0(A0_255, A1_256)
  return A0_255 / A1_256
end
MO_DIVIDE = L0_0
function L0_0(A0_257, A1_258)
  if A0_257 < A1_258 then
    return A0_257
  else
    return A1_258
  end
end
MO_MIN = L0_0
function L0_0(A0_259, A1_260)
  if A1_260 < A0_259 then
    return A0_259
  else
    return A1_260
  end
end
MO_MAX = L0_0
function L0_0(A0_261, A1_262)
  return A0_261 % A1_262
end
MO_MODULO = L0_0
function L0_0(A0_263)
  return math.floor(A0_263 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_264)
  return math.ceil(A0_264)
end
MO_ROUNDUP = L0_0
function L0_0(A0_265)
  return math.floor(A0_265)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_266)
  return math.sin(math.rad(A0_266))
end
MO_SIN = L0_0
function L0_0(A0_267)
  return math.cos(math.rad(A0_267))
end
MO_COSINE = L0_0
function L0_0(A0_268)
  return math.tan(math.rad(A0_268))
end
MO_TANGENT = L0_0
function L0_0(A0_269)
  return math.deg(math.asin(A0_269))
end
MO_ASIN = L0_0
function L0_0(A0_270)
  return math.deg(math.acos(A0_270))
end
MO_ACOS = L0_0
function L0_0(A0_271)
  return math.deg(math.atan(A0_271))
end
MO_ATAN = L0_0
function L0_0(A0_272, A1_273)
  return math.pow(A0_272, A1_273)
end
MO_POW = L0_0
function L0_0(A0_274)
  return math.sqrt(A0_274)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_275, A1_276)
  local L2_277
  L2_277 = A0_275 and A1_276
  return L2_277
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_278, A1_279)
  local L2_280
  L2_280 = A0_278 or A1_279
  return L2_280
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_281)
  local L1_282
  L1_282 = not A0_281
  return L1_282
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_283)
  return math.abs(A0_283)
end
MO_ABS = L0_0
function L0_0(A0_284, A1_285)
  return math.random(A0_284, A1_285)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_286, A1_287)
  local L2_288, L3_289, L4_290, L5_291, L6_292, L7_293, L8_294, L9_295, L10_296
  L2_288 = GetMathNumber
  L3_289 = A0_286
  L4_290 = A1_287.Src1VarTable
  L5_291 = A1_287.Src1Var
  L6_292 = A1_287.Src1Value
  L2_288 = L2_288(L3_289, L4_290, L5_291, L6_292)
  L3_289 = GetMathNumber
  L4_290 = A0_286
  L5_291 = A1_287.Src2VarTable
  L6_292 = A1_287.Src2Var
  L7_293 = A1_287.Src2Value
  L3_289 = L3_289(L4_290, L5_291, L6_292, L7_293)
  L4_290 = GetTable
  L5_291 = A0_286
  L6_292 = A1_287.DestVarTable
  L4_290 = L4_290(L5_291, L6_292)
  L5_291 = A1_287.MathOp
  L6_292 = L2_288
  L7_293 = L3_289
  L5_291 = L5_291(L6_292, L7_293)
  L6_292 = SetVarInTable
  L7_293 = A0_286
  L8_294 = A1_287
  L9_295 = L5_291
  L6_292(L7_293, L8_294, L9_295)
  L6_292 = A1_287.DebugPrintOutput
  L7_293 = A1_287.DebugPrintComment
  if L7_293 ~= nil then
    L7_293 = {}
    L8_294 = MO_MULTIPLY
    L7_293[L8_294] = "*"
    L8_294 = MO_ADD
    L7_293[L8_294] = "+"
    L8_294 = MO_SUBTRACT
    L7_293[L8_294] = "-"
    L8_294 = MO_DIVIDE
    L7_293[L8_294] = "/"
    L8_294 = MO_MIN
    L7_293[L8_294] = "min"
    L8_294 = MO_MAX
    L7_293[L8_294] = "max"
    L8_294 = MO_MODULO
    L7_293[L8_294] = "%"
    L8_294 = MO_ROUND
    L7_293[L8_294] = "round"
    L8_294 = MO_ROUNDUP
    L7_293[L8_294] = "round up"
    L8_294 = MO_ROUNDDOWN
    L7_293[L8_294] = "round down"
    L8_294 = MO_SIN
    L7_293[L8_294] = "sin"
    L8_294 = MO_COSINE
    L7_293[L8_294] = "cos"
    L8_294 = MO_TANGENT
    L7_293[L8_294] = "tan"
    L8_294 = MO_ASIN
    L7_293[L8_294] = "arcsin"
    L8_294 = MO_ACOS
    L7_293[L8_294] = "arccos"
    L8_294 = MO_ATAN
    L7_293[L8_294] = "arctan"
    L8_294 = MO_POW
    L7_293[L8_294] = "power"
    L8_294 = MO_SQUARE_ROOT
    L7_293[L8_294] = "sqrt"
    L8_294 = MO_BOOLEAN_AND
    L7_293[L8_294] = "&&"
    L8_294 = MO_BOOLEAN_OR
    L7_293[L8_294] = "||"
    L8_294 = MO_BOOLEAN_NOT
    L7_293[L8_294] = "!"
    L8_294 = MO_ABS
    L7_293[L8_294] = "abs"
    L8_294 = MO_RAND_INT_RANGE
    L7_293[L8_294] = "rand int range"
    L8_294 = A1_287.DebugPrintComment
    debugComment = L8_294
    L8_294 = string
    L8_294 = L8_294.format
    L9_295 = "%.4f"
    L10_296 = L2_288
    L8_294 = L8_294(L9_295, L10_296)
    L9_295 = string
    L9_295 = L9_295.format
    L10_296 = "%.4f"
    L9_295 = L9_295(L10_296, L3_289)
    L10_296 = string
    L10_296 = L10_296.format
    L10_296 = L10_296("%.4f", L5_291)
    if A1_287.Src1Var ~= nil and A1_287.Src2Var ~= nil then
      DebugClientPrint("Math=> " .. debugComment .. ": " .. A1_287.Src1Var .. " " .. L7_293[A1_287.MathOp] .. " " .. A1_287.Src2Var .. " = " .. L10_296)
      DebugClientPrint("            " .. L8_294 .. " " .. L7_293[A1_287.MathOp] .. " " .. L9_295 .. " = " .. L10_296)
    elseif A1_287.Src1Var ~= nil then
      DebugClientPrint("Math=> " .. debugComment .. ": " .. L7_293[A1_287.MathOp] .. " " .. A1_287.Src1Var .. " = " .. L10_296)
      DebugClientPrint("              " .. L7_293[A1_287.MathOp] .. " " .. L8_294 .. " = " .. L10_296)
    end
  end
end
BBMath = L0_0
function L0_0(A0_297, A1_298, A2_299, A3_300)
  if A2_299 ~= nil and GetTable(A0_297, A1_298)[A2_299] ~= nil then
    return GetTable(A0_297, A1_298)[A2_299]
  end
  return A3_300
end
GetMathNumber = L0_0
function L0_0(A0_301, A1_302)
  if type(A1_302) == "number" then
    return A1_302
  elseif type(A1_302) == "function" then
    return A1_302(A0_301)
  elseif type(A1_302) == "string" then
    return A0_301[A1_302]
  end
end
GetNumber = L0_0
function L0_0(A0_303, A1_304)
  return VectorAdd(A0_303, A1_304)
end
VEC_ADD = L0_0
function L0_0(A0_305, A1_306)
  return VectorSubtract(A0_305, A1_306)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_307, A1_308)
  return VectorScalarMultiply(A0_307, A1_308)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_309, A1_310)
  return VectorScalarDivide(A0_309, A1_310)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_311, A1_312)
  return VectorRotateY(A0_311, A1_312)
end
VEC_ROTATE = L0_0
function L0_0(A0_313, A1_314)
  BBMath(A0_313, A1_314)
end
BBVectorMath = L0_0
function L0_0(A0_315, A1_316)
  local L2_317, L3_318, L4_319, L5_320
  L2_317 = A0_315.InstanceVars
  L3_318 = L2_317.InterpDelta
  if L3_318 == nil then
    L3_318 = A1_316.Amount
    L4_319 = A1_316.AmountVar
    if L4_319 ~= nil then
      L4_319 = GetTable
      L5_320 = A0_315
      L4_319 = L4_319(L5_320, A1_316.AmountVarTable)
      L5_320 = A1_316.AmountVar
      L3_318 = L4_319[L5_320]
    end
    L4_319 = GetPosition
    L5_320 = A1_316.TargetVar
    L5_320 = A0_315[L5_320]
    L4_319 = L4_319(L5_320)
    L2_317.KnockBackStart = L4_319
    L4_319 = GetNormalizedPositionDelta
    L5_320 = A1_316.TargetVar
    L5_320 = A0_315[L5_320]
    L4_319 = L4_319(L5_320, A0_315[A1_316.AttackerVar], true)
    L5_320 = {}
    L5_320.x = L4_319.x * L3_318
    L5_320.y = 0
    L5_320.z = L4_319.z * L3_318
    L2_317.InterpDelta = L5_320
    L5_320 = GetTime
    L5_320 = L5_320()
    L2_317.StartTime = L5_320
    L5_320 = A1_316.KnockBackDuration
    L2_317.KnockBackDuration = L5_320
  end
  L3_318 = A1_316.TargetVar
  L3_318 = A0_315[L3_318]
  L4_319 = GetTime
  L4_319 = L4_319()
  L5_320 = L2_317.StartTime
  L4_319 = L4_319 - L5_320
  L5_320 = L2_317.KnockBackDuration
  L4_319 = L4_319 / L5_320
  L5_320 = {}
  L5_320.x = L2_317.KnockBackStart.x + L2_317.InterpDelta.x * L4_319
  L5_320.y = L2_317.KnockBackStart.y
  L5_320.z = L2_317.KnockBackStart.z + L2_317.InterpDelta.z * L4_319
  SetPosition(L3_318, L5_320)
end
BBKnockback = L0_0
function L0_0(A0_321, A1_322)
  local L2_323, L3_324
  L2_323 = GetParam
  L3_324 = "Left"
  L2_323 = L2_323(L3_324, A0_321, A1_322)
  L3_324 = GetParam
  L3_324 = L3_324("Right", A0_321, A1_322)
  GetTable(A0_321, A1_322.DestVarTable, true)[A1_322.DestVar] = tostring(L2_323) .. tostring(L3_324)
end
BBAppendString = L0_0
function L0_0(A0_325, A1_326)
  local L2_327
  L2_327 = 0
  if A1_326.Delta ~= nil then
    L2_327 = L2_327 + A1_326.Delta
  end
  if A1_326.DeltaByLevel ~= nil and A0_325.Level ~= nil then
    L2_327 = L2_327 + A1_326.DeltaByLevel[A0_325.Level]
  end
  if A1_326.DeltaVar ~= nil then
    L2_327 = L2_327 + GetTable(A0_325, A1_326.DeltaVarTable, true)[A1_326.DeltaVar]
  end
  if A1_326.TargetVar ~= nil then
    A1_326.Stat(L2_327, A0_325[A1_326.TargetVar])
  else
    A1_326.Stat(L2_327)
  end
end
BBIncStat = L0_0
function L0_0(A0_328, A1_329)
  local L2_330
  L2_330 = 0
  if A1_329.Delta ~= nil then
    L2_330 = L2_330 + A1_329.Delta
  end
  if A1_329.DeltaByLevel ~= nil and A0_328.Level ~= nil then
    L2_330 = L2_330 + A1_329.DeltaByLevel[A0_328.Level]
  end
  if A1_329.DeltaVar ~= nil then
    L2_330 = L2_330 + GetTable(A0_328, A1_329.DeltaVarTable, true)[A1_329.DeltaVar]
  end
  if A1_329.TargetVar ~= nil then
    A1_329.Stat(L2_330, A0_328[A1_329.TargetVar])
  else
    A1_329.Stat(L2_330)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_331, A1_332)
  local L2_333, L3_334
  L2_333 = A1_332.TargetVar
  L3_334 = 0
  if A1_332.LaneVar ~= nil then
    L3_334 = L3_334 + GetTable(A0_331, A1_332.LaneVarTable, true)[A1_332.LaneVar]
  end
  if A1_332.Lane ~= nil then
    L3_334 = L3_334 + A1_332.Lane
  end
  SetMinionLane(A0_331[L2_333], L3_334)
end
BBSetMinionLane = L0_0
function L0_0(A0_335, A1_336)
  if A1_336.AttackVar ~= nil then
  end
  if A1_336.Attack ~= nil then
  end
  if A1_336.TotalCoefficientVar ~= nil then
  end
  if A1_336.TotalCoefficient ~= nil then
  end
  if A1_336.TargetVar ~= nil then
    GetTable(A0_335, A1_336.DestVarTable, false)[A1_336.DestVar] = (0 + GetTable(A0_335, A1_336.AttackVarTable, true)[A1_336.AttackVar] + A1_336.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_335[A1_336.TargetVar])) + GetFlatCritDamageMod(A0_335[A1_336.TargetVar])) * (0 + GetTable(A0_335, A1_336.TotalCoefficientVarTable, true)[A1_336.TotalCoefficientVar] + A1_336.TotalCoefficient)
  else
    GetTable(A0_335, A1_336.DestVarTable, false)[A1_336.DestVar] = 2 * A1_336.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_337, A1_338)
  local L2_339, L3_340, L4_341, L5_342, L6_343, L7_344
  L2_339 = GetTable
  L3_340 = A0_337
  L4_341 = A1_338.DestVarTable
  L5_342 = false
  L2_339 = L2_339(L3_340, L4_341, L5_342)
  L3_340 = GetTable
  L4_341 = A0_337
  L5_342 = A1_338.AmountVarTable
  L6_343 = true
  L3_340 = L3_340(L4_341, L5_342, L6_343)
  L4_341 = GetTable
  L5_342 = A0_337
  L6_343 = A0_337.NextBuffVars
  L7_344 = false
  L4_341 = L4_341(L5_342, L6_343, L7_344)
  L5_342 = A1_338.AmountVar
  L5_342 = L3_340[L5_342]
  L6_343 = A1_338.Amount
  L5_342 = L5_342 + L6_343
  L4_341.InitializeShield_Amount = L5_342
  L5_342 = A1_338.AmountVar
  if L5_342 ~= nil then
    L5_342 = A1_338.HealShieldMod
    if L5_342 ~= nil and L5_342 == true then
      L6_343 = A1_338.AttackerVar
      L7_344 = 0
      if L6_343 ~= nil then
        L7_344 = GetPercentHealingAmountMod(A0_337[L6_343])
      end
      L4_341.InitializeShield_Amount, L3_340[A1_338.AmountVar] = (A1_338.Amount + L3_340[A1_338.AmountVar]) * (1 + L7_344), (A1_338.Amount + L3_340[A1_338.AmountVar]) * (1 + L7_344)
    end
  end
  L5_342 = SpellBuffAddNoRenew
  L6_343 = A1_338.AttackerVar
  L6_343 = A0_337[L6_343]
  L7_344 = A1_338.UnitVar
  L7_344 = A0_337[L7_344]
  L5_342(L6_343, L7_344, "InitializeShieldMarker", 0, 1, 25000, L4_341)
  L5_342 = BBIncreaseShield
  L6_343 = A0_337
  L7_344 = A1_338
  L5_342(L6_343, L7_344)
end
BBInitializeShield = L0_0
function L0_0(A0_345, A1_346)
  if A1_346.CDVar ~= nil then
  end
  if A1_346.CD ~= nil then
  end
  if A1_346.TargetVar ~= nil then
    GetTable(A0_345, A1_346.DestVarTable, false)[A1_346.DestVar] = (0 + GetTable(A0_345, A1_346.CDVarTable, true)[A1_346.CDVar] + A1_346.CD) * (1 + GetPercentCooldownMod(A0_345[A1_346.TargetVar]))
  else
    GetTable(A0_345, A1_346.DestVarTable, false)[A1_346.DestVar] = A1_346.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_347, A1_348)
  local L2_349, L3_350
  L3_350 = A1_348.TargetVar
  if L3_350 ~= nil then
    L2_349 = A1_348.Stat(A0_347[L3_350])
  else
    L2_349 = A1_348.Stat()
  end
  SetVarInTable(A0_347, A1_348, L2_349)
end
BBGetStat = L0_0
function L0_0(A0_351, A1_352)
  if A1_352.TargetVar ~= nil then
    GetTable(A0_351, A1_352.DestVarTable, false)[A1_352.DestVar] = GetLevel(A0_351[A1_352.TargetVar])
  else
    GetTable(A0_351, A1_352.DestVarTable, false)[A1_352.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_353, A1_354)
  if A1_354.TargetVar ~= nil then
    GetTable(A0_353, A1_354.DestVarTable, false)[A1_354.DestVar] = GetUnitSignificance(A0_353[A1_354.TargetVar])
  else
    GetTable(A0_353, A1_354.DestVarTable, false)[A1_354.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_355, A1_356)
  if A1_356.TargetVar ~= nil then
    GetTable(A0_355, A1_356.DestVarTable, false)[A1_356.DestVar] = GetArmor(A0_355[A1_356.TargetVar])
  else
    GetTable(A0_355, A1_356.DestVarTable, false)[A1_356.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_357, A1_358)
  if A1_358.TargetVar ~= nil then
    GetTable(A0_357, A1_358.DestVarTable, false)[A1_358.DestVar] = GetSpellBlock(A0_357[A1_358.TargetVar])
  else
    GetTable(A0_357, A1_358.DestVarTable, false)[A1_358.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_359, A1_360)
  local L2_361, L3_362
  L3_362 = A1_360.TargetVar
  if L3_362 ~= nil then
    L2_361 = GetTeamID(A0_359[L3_362])
  else
    L2_361 = GetTeamID()
  end
  SetVarInTable(A0_359, A1_360, L2_361)
end
BBGetTeamID = L0_0
function L0_0(A0_363, A1_364)
  local L2_365, L3_366, L4_367
  L2_365 = GetTable
  L3_366 = A0_363
  L4_367 = A1_364.DestVarTable
  L2_365 = L2_365(L3_366, L4_367, false)
  L3_366 = A1_364.TargetVar
  L4_367 = nil
  if L3_366 ~= nil then
    L4_367 = GetTeamID(A0_363[L3_366])
  else
    L4_367 = GetTeamID()
  end
  if L4_367 == TEAM_ORDER then
    L2_365[A1_364.DestVar] = TEAM_CHAOS
  elseif L4_367 == TEAM_CHAOS then
    L2_365[A1_364.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_368, A1_369)
  if A1_369.TargetVar ~= nil then
    GetTable(A0_368, A1_369.DestVarTable, false)[A1_369.DestVar] = GetUnitSkinName(A0_368[A1_369.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_370, A1_371)
  local L2_372, L3_373, L4_374
  L2_372 = GetTable
  L3_373 = A0_370
  L4_374 = A1_371.DestVarTable
  L2_372 = L2_372(L3_373, L4_374, false)
  L3_373 = A0_370.Owner
  L4_374 = nil
  if A1_371.TargetVar ~= nil then
    L4_374 = GetTotalAttackDamage(A0_370[A1_371.TargetVar])
  else
    L4_374 = GetTotalAttackDamage()
  end
  SetVarInTable(A0_370, A1_371, L4_374)
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_375, A1_376)
  GetTable(A0_375, A1_376.DestVarTable, true)[A1_376.DestVar] = A1_376.Status(A0_375[A1_376.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_377, A1_378)
  local L2_379
  L2_379 = A1_378.TargetVar
  L2_379 = A0_377[L2_379]
  ClearAttackTarget(L2_379)
end
BBClearAttackTarget = L0_0
function L0_0(A0_380, A1_381)
  local L2_382, L3_383
  L2_382 = GetTable
  L3_383 = A0_380
  L2_382 = L2_382(L3_383, A1_381.DestVarTable, true)
  L3_383 = A1_381.Info
  L3_383 = L3_383(A0_380[A1_381.TargetVar])
  SetVarInTable(A0_380, A1_381, L3_383)
end
BBGetCastInfo = L0_0
function L0_0(A0_384, A1_385, A2_386)
  local L3_387, L4_388, L5_389, L6_390
  L3_387 = GetTable
  L4_388 = A0_384
  L5_389 = A1_385.TrackTimeVarTable
  L6_390 = false
  L3_387 = L3_387(L4_388, L5_389, L6_390)
  L4_388 = GetTime
  L4_388 = L4_388()
  L5_389 = A1_385.ExecuteImmediately
  L6_390 = GetParam
  L6_390 = L6_390("TimeBetweenExecutions", A0_384, A1_385)
  if A1_385.TickTimeVar ~= nil and GetTable(A0_384, A1_385.TickTimeVarTable, false)[A1_385.TickTimeVar] ~= nil then
    L6_390 = GetTable(A0_384, A1_385.TickTimeVarTable, false)[A1_385.TickTimeVar]
  end
  if L3_387[A1_385.TrackTimeVar] == nil then
    L3_387[A1_385.TrackTimeVar] = L4_388
    if L5_389 == true then
      ExecuteBuildingBlocks(A2_386, A0_384)
    end
  end
  if L4_388 >= L3_387[A1_385.TrackTimeVar] + L6_390 then
    L3_387[A1_385.TrackTimeVar] = L3_387[A1_385.TrackTimeVar] + L6_390
    ExecuteBuildingBlocks(A2_386, A0_384)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_391, A1_392, A2_393)
  GetTable(A0_391, A1_392.TrackTimeVarTable, false)[A1_392.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_394, A1_395)
  local L2_396
  L2_396 = A1_395.SrcValue
  if A1_395.SrcVar ~= nil then
    L2_396 = GetTable(A0_394, A1_395.SrcVarTable, true)[A1_395.SrcVar]
  end
  A1_395.Status(A0_394[A1_395.TargetVar], L2_396)
end
BBSetStatus = L0_0
function L0_0(A0_397, A1_398)
  local L2_399
  L2_399 = A1_398.ToAlert
  if GetTable(A0_397, A1_398.SrcVarTable, false) ~= nil and A1_398.SrcVar ~= nil then
    L2_399 = L2_399 .. GetTable(A0_397, A1_398.SrcVarTable, false)[A1_398.SrcVar]
  end
  _ALERT(L2_399)
end
BBAlert = L0_0
function L0_0(A0_400, A1_401)
  local L2_402, L3_403, L4_404, L5_405, L6_406, L7_407
  L2_402 = GetParam
  L3_403 = "Message"
  L4_404 = A0_400
  L5_405 = A1_401
  L2_402 = L2_402(L3_403, L4_404, L5_405)
  if L2_402 == nil then
    L3_403 = ReportError
    L4_404 = "Could not resolve Message param"
    L3_403(L4_404)
    return
  end
  L3_403 = true
  L4_404 = GetParam
  L5_405 = "OnUnit"
  L6_406 = A0_400
  L7_407 = A1_401
  L4_404 = L4_404(L5_405, L6_406, L7_407)
  if L4_404 == nil then
    L3_403 = false
    L5_405 = GetParam
    L6_406 = "OnUnitByFlag"
    L7_407 = A0_400
    L5_405 = L5_405(L6_406, L7_407, A1_401)
    L4_404 = L5_405
  end
  if L4_404 == nil then
    L5_405 = ReportError
    L6_406 = "Could not resolve OnUnit param"
    L5_405(L6_406)
    return
  end
  L5_405 = true
  L6_406 = GetParam
  L7_407 = "ChampionToSayTo"
  L6_406 = L6_406(L7_407, A0_400, A1_401)
  if L6_406 == nil then
    L5_405 = false
    L7_407 = GetParam
    L7_407 = L7_407("ChampionToSayToByFlag", A0_400, A1_401)
    L6_406 = L7_407
  end
  if L6_406 == nil then
    L7_407 = ReportError
    L7_407("Could not resolve ChampionToSayTo param")
    return
  end
  L7_407 = GetParam
  L7_407 = L7_407("ShowToSpectator", A0_400, A1_401)
  if L7_407 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  SayWithFloatingTextOnUnitToChampion(tostring(L2_402), A1_401.TextType, L4_404, L3_403, L6_406, L5_405, L7_407)
end
BBSayWithFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_408, A1_409)
  local L2_410, L3_411, L4_412
  L2_410 = A1_409.ToSay
  L3_411 = GetTable
  L4_412 = A0_408
  L3_411 = L3_411(L4_412, A1_409.SrcVarTable, false)
  if L3_411 ~= nil then
    L4_412 = A1_409.SrcVar
    if L4_412 ~= nil then
      L4_412 = L2_410
      L2_410 = L4_412 .. tostring(L3_411[A1_409.SrcVar])
    end
  end
  L4_412 = nil
  if A1_409.OwnerVar ~= nil then
    L4_412 = A0_408[A1_409.OwnerVar]
  else
    L4_412 = A0_408.Owner
  end
  if A1_409.TextType == nil then
    A1_409.TextType = 0
  end
  Say(L4_412, L2_410, A1_409.TextType)
end
BBSay = L0_0
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
BBDebugSay = L0_0
function L0_0(A0_418, A1_419)
  GetTable(A0_418, A1_419.DestVarTable, true)[A1_419.DestVar] = BBLuaGetGold(A0_418, A1_419)
end
BBGetGold = L0_0
function L0_0(A0_420, A1_421)
  GetTable(A0_420, A1_421.DestVarTable, true)[A1_421.DestVar] = BBLuaGetTotalGold(A0_420, A1_421)
end
BBGetTotalGold = L0_0
function L0_0(A0_422, A1_423)
  SpellBuffAdd(A0_422[A1_423.OwnerVar], A0_422[A1_423.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_422.NextBuffVars)
  BBTeleportToPositionHelper(A0_422, A1_423)
end
BBTeleportToPosition = L0_0
function L0_0(A0_424, A1_425)
  if A1_425.XVar ~= nil and GetTable(A0_424, A1_425.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_424, A1_425.XVarTable, true)[A1_425.XVar]
  else
    Xloc = A1_425.X
  end
  if A1_425.YVar ~= nil and GetTable(A0_424, A1_425.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_424, A1_425.YVarTable, true)[A1_425.YVar]
  else
    Yloc = A1_425.Y
  end
  if A1_425.ZVar ~= nil and GetTable(A0_424, A1_425.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_424, A1_425.ZVarTable, true)[A1_425.ZVar]
  else
    Zloc = A1_425.Z
  end
  A1_425.OwnerVar, A0_424.position = A1_425.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_425.CastPositionName = "position"
  BBTeleportToPosition(A0_424, A1_425)
end
BBTeleportToPoint = L0_0
function L0_0(A0_426, A1_427)
  DefUpdateAura(GetTable(A0_426, A1_427.CenterTable, false)[A1_427.CenterVar], A1_427.Range, A1_427.UnitScan, A1_427.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_428, A1_429)
  ReincarnateNonDeadHero(GetTable(A0_428, A1_429.TargetTable, false)[A1_429.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_430, A1_431)
  GetTable(A0_430, A1_431.DestVarTable, true)[A1_431.DestVar] = A1_431.Function(A0_430[A1_431.OwnerVar], A1_431.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_432, A1_433)
  local L2_434, L3_435, L4_436, L5_437
  L2_434 = A1_433.WhomToOrderVar
  L2_434 = A0_432[L2_434]
  L3_435 = A1_433.TargetOfOrderVar
  L3_435 = A0_432[L3_435]
  L4_436 = GetTable
  L5_437 = A0_432
  L4_436 = L4_436(L5_437, A1_433.SrcVarTable, false)
  L5_437 = nil
  if A1_433.SrcVar ~= nil and L4_436 ~= nil then
    L5_437 = L4_436[A1_433.SrcVar]
  else
    L5_437 = GetPosition(L3_435)
  end
  if L3_435 == nil then
    L3_435 = L2_434
  end
  IssueOrder(L2_434, A1_433.Order, L5_437, L3_435)
end
BBIssueOrder = L0_0
function L0_0(A0_438, A1_439)
  local L2_440
  L2_440 = GetParam
  L2_440 = L2_440("NewRange", A0_438, A1_439)
  SetSpellCastRange(L2_440)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_441, A1_442)
  GetTable(A0_441, A1_442.DestVarTable, true)[A1_442.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_443, A1_444)
  local L2_445, L3_446
  L2_445 = A1_444.ObjectVar1
  L2_445 = A0_443[L2_445]
  L3_446 = A1_444.ObjectVar2
  L3_446 = A0_443[L3_446]
  GetTable(A0_443, A1_444.DestVarTable, true)[A1_444.DestVar] = DistanceBetweenObjectBounds(L2_445, L3_446)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_447, A1_448)
  local L2_449, L3_450, L4_451
  L2_449 = A1_448.ObjectVar
  L2_449 = A0_447[L2_449]
  L3_450 = GetTable
  L4_451 = A0_447
  L3_450 = L3_450(L4_451, A1_448.PointVarTable, true)
  L4_451 = A1_448.PointVar
  L4_451 = L3_450[L4_451]
  GetTable(A0_447, A1_448.DestVarTable, true)[A1_448.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_449, L4_451)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_452, A1_453)
  local L2_454, L3_455
  L2_454 = GetParam
  L3_455 = "Point1"
  L2_454 = L2_454(L3_455, A0_452, A1_453)
  L3_455 = GetParam
  L3_455 = L3_455("Point2", A0_452, A1_453)
  GetTable(A0_452, A1_453.DestVarTable, true)[A1_453.DestVar] = DistanceBetweenPoints(L2_454, L3_455)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_456, A1_457, A2_458)
  local L3_459, L4_460, L5_461, L6_462, L7_463, L8_464
  L5_461 = 0
  L6_462 = nil
  L7_463 = A1_457.ObjectDistanceType
  L8_464 = A1_457.ObjectVar1
  L3_459 = A0_456[L8_464]
  L8_464 = A1_457.ObjectVar2
  L4_460 = A0_456[L8_464]
  if nil == L4_460 then
    L8_464 = A1_457.Point2Var
    if nil ~= L8_464 then
      L8_464 = GetTable
      L8_464 = L8_464(A0_456, A1_457.Point2VarTable, true)
      L4_460 = L8_464[A1_457.Point2Var]
      L5_461 = L5_461 + 1
    end
  end
  if nil == L3_459 then
    L8_464 = A1_457.Point1Var
    if nil ~= L8_464 then
      L8_464 = GetTable
      L8_464 = L8_464(A0_456, A1_457.Point1VarTable, true)
      L3_459 = L8_464[A1_457.Point1Var]
      L5_461 = L5_461 + 1
      if 1 == L5_461 then
        L3_459, L4_460 = L4_460, L3_459
      end
    end
  end
  if nil ~= L7_463 then
    if 0 == L5_461 then
      L8_464 = OBJECT_CENTER
      if L8_464 == L7_463 then
        L6_462 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_464 = OBJECT_BOUNDARY
        if L8_464 == L7_463 then
          L6_462 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_464 = A1_457.OwnerVar
          L8_464 = A0_456[L8_464]
          Say(L8_464, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_461 then
      L8_464 = OBJECT_CENTER
      if L8_464 == L7_463 then
        L6_462 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_464 = OBJECT_BOUNDARY
        if L8_464 == L7_463 then
          L6_462 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_464 = A1_457.OwnerVar
          L8_464 = A0_456[L8_464]
          Say(L8_464, "invalid object distance type", 0)
        end
      end
    else
      L6_462 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_464 = A1_457.Distance
  if A1_457.DistanceVar ~= nil and GetTable(A0_456, A1_457.DistanceVarTable, true) ~= nil then
    L8_464 = L8_464 + GetTable(A0_456, A1_457.DistanceVarTable, true)[A1_457.DistanceVar]
  end
  if L3_459 ~= nil and L4_460 ~= nil and L6_462 ~= nil and L8_464 ~= nil then
    if not L6_462(L3_459, L4_460, L8_464) then
      ExecuteBuildingBlocks(A2_458, A0_456)
      A0_456.LastIfSucceeded = true
    else
      A0_456.LastIfSucceeded = false
    end
  else
    A0_456.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_465, A1_466)
  local L2_467, L3_468
  L2_467 = A1_466.TargetVar
  L2_467 = A0_465[L2_467]
  L3_468 = A1_466.CasterVar
  L3_468 = A0_465[L3_468]
  GetTable(A0_465, A1_466.DestVarTable, true)[A1_466.DestVar] = SpellBuffCount(L2_467, A1_466.BuffName, L3_468)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_469, A1_470)
  local L2_471
  L2_471 = A1_470.TargetVar
  L2_471 = A0_469[L2_471]
  GetTable(A0_469, A1_470.DestVarTable, true)[A1_470.DestVar] = SpellBuffCount(L2_471, A1_470.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_472, A1_473)
  local L2_474, L3_475
  L2_474 = GetTable
  L3_475 = A0_472
  L2_474 = L2_474(L3_475, A1_473.ScaleVarTable, false)
  L3_475 = nil
  if A1_473.OwnerVar ~= nil then
    L3_475 = A0_472[A1_473.OwnerVar]
  else
    L3_475 = A0_472.Owner
  end
  if A1_473.ScaleVar ~= nil and A1_473.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_474[A1_473.ScaleVar], L3_475)
  else
    SetScaleSkinCoef(A1_473.Scale, L3_475)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_476, A1_477)
  SpellBuffAdd(A0_476[A1_477.TargetVar], A0_476[A1_477.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_476.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_478, A1_479, A2_480)
  local L3_481, L4_482
  L3_481 = A1_479.TargetVar
  L3_481 = A0_478[L3_481]
  L4_482 = A1_479.NumStacks
  if GetParam("NumStacks", A0_478, A1_479) == 0 then
    L4_482 = SpellBuffCount(L3_481, A1_479.BuffName, caster)
  else
    L4_482 = GetParam("NumStacks", A0_478, A1_479)
  end
  while L4_482 > 0 do
    SpellBuffRemove(L3_481, A1_479.BuffName, A0_478[A1_479.AttackerVar])
    L4_482 = L4_482 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_483, A1_484, A2_485)
  if A0_483.EmoteId == A1_484.EmoteId then
    ExecuteBuildingBlocks(A2_485, A0_483)
    A0_483.LastIfSucceeded = true
  else
    A0_483.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_486, A1_487, A2_488)
  if A0_486.EmoteId ~= A1_487.EmoteId then
    ExecuteBuildingBlocks(A2_488, A0_486)
    A0_486.LastIfSucceeded = true
  else
    A0_486.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_489, A1_490)
  local L2_491, L3_492, L4_493, L5_494
  L2_491 = GetTable
  L3_492 = A0_489
  L4_493 = A1_490.String1VarTable
  L5_494 = false
  L2_491 = L2_491(L3_492, L4_493, L5_494)
  L3_492 = A1_490.String1Var
  L3_492 = L2_491[L3_492]
  L4_493 = GetTable
  L5_494 = A0_489
  L4_493 = L4_493(L5_494, A1_490.String2VarTable, false)
  L5_494 = A1_490.String2Var
  L5_494 = L4_493[L5_494]
  GetTable(A0_489, A1_490.ResultVarTable, false)[A1_490.ResultVar] = L3_492 .. L5_494
end
BBConcatenateStrings = L0_0
function L0_0(A0_495, A1_496)
  BBGetMinionKills(A0_495, A1_496)
  A0_495.MinionKillSource = GetParam("MinionKillTarget")
  A0_495.MinionKills = A0_495.MinionsKilled + GetParam("MinionKills", A0_495, A1_496)
  BBSetMinionKills(A0_495, A1_496)
end
BBIncreaseMinionKills = L0_0
