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
  local L2_119, L3_120, L4_121, L5_122, L6_123, L7_124, L8_125, L9_126
  L2_119 = GetParam
  L3_120 = "Unit"
  L4_121 = A0_117
  L5_122 = A1_118
  L2_119 = L2_119(L3_120, L4_121, L5_122)
  L3_120 = GetParam
  L4_121 = "X"
  L5_122 = A0_117
  L6_123 = A1_118
  L3_120 = L3_120(L4_121, L5_122, L6_123)
  L4_121 = GetParam
  L5_122 = "Z"
  L6_123 = A0_117
  L7_124 = A1_118
  L4_121 = L4_121(L5_122, L6_123, L7_124)
  if L2_119 ~= nil then
    L5_122 = GetPosition
    L6_123 = L2_119
    L5_122 = L5_122(L6_123)
    L3_120 = L5_122.x
    L4_121 = L5_122.z
  end
  L5_122 = 2
  L6_123 = 1
  L7_124 = 0
  L8_125 = 4
  L9_126 = 3
  if L4_121 > 12250 then
  elseif L4_121 < 2650 then
  elseif L3_120 > 12250 then
  elseif L3_120 < 2650 then
  elseif L4_121 - L3_120 > 4500 then
  else
  end
  if L4_121 > 13000 then
  elseif L4_121 < 1800 then
  elseif L3_120 > 13000 then
  elseif L3_120 < 1800 then
  elseif L4_121 - L3_120 > 1150 then
  else
  end
  GetTable(A0_117, A1_118.NearLaneVarTable, false)[A1_118.NearLaneVar] = L7_124
  GetTable(A0_117, A1_118.NearSectionVarTable, false)[A1_118.NearSectionVar] = L9_126
  GetTable(A0_117, A1_118.BlueSideVarTable, false)[A1_118.BlueSideVar] = true
end
BBGetLocationHints = L0_0
function L0_0(A0_127, A1_128)
  local L2_129, L3_130, L4_131, L5_132
  L2_129 = GetTable
  L3_130 = A0_127
  L4_131 = A1_128.DestVarTable
  L5_132 = true
  L2_129 = L2_129(L3_130, L4_131, L5_132)
  L3_130 = nil
  L4_131 = GetTable
  L5_132 = A0_127
  L4_131 = L4_131(L5_132, A1_128.SpellSlotVarTable, false)
  L5_132 = A1_128.SpellSlotVar
  if L5_132 ~= nil and L4_131 ~= nil then
    L5_132 = A1_128.SpellSlotVar
    L3_130 = L4_131[L5_132]
  else
    L3_130 = A1_128.SpellSlotValue
  end
  L5_132 = A1_128.Function
  L5_132 = L5_132(A0_127[A1_128.OwnerVar], L3_130, A1_128.SpellbookType, A1_128.SlotType)
  SetVarInTable(A0_127, A1_128, L5_132)
end
BBGetSlotSpellInfo = L0_0
function L0_0(A0_133, A1_134)
  local L2_135, L3_136, L4_137
  L2_135 = GetTable
  L3_136 = A0_133
  L4_137 = A1_134.SrcVarTable
  L2_135 = L2_135(L3_136, L4_137, false)
  L3_136 = nil
  L4_137 = A1_134.SrcVar
  if L4_137 ~= nil and L2_135 ~= nil then
    L4_137 = A1_134.SrcVar
    L3_136 = L2_135[L4_137]
  else
    L3_136 = A1_134.SrcValue
  end
  L4_137 = nil
  if A1_134.SpellSlotVar ~= nil and GetTable(A0_133, A1_134.SpellSlotVarTable, false) ~= nil then
    L4_137 = GetTable(A0_133, A1_134.SpellSlotVarTable, false)[A1_134.SpellSlotVar]
  else
    L4_137 = A1_134.SpellSlotValue
  end
  SetSlotSpellCooldownTime(A0_133[A1_134.OwnerVar], L4_137, A1_134.SpellbookType, A1_134.SlotType, L3_136)
end
BBSetSlotSpellCooldownTime = L0_0
function L0_0(A0_138, A1_139)
  if A0_138.Level ~= nil and A1_139.SrcValueByLevel ~= nil then
    A0_138.ReturnValue = A1_139.SrcValueByLevel[A0_138.Level]
  elseif A1_139.SrcVar ~= nil and GetTable(A0_138, A1_139.SrcVarTable, false) ~= nil then
    A0_138.ReturnValue = GetTable(A0_138, A1_139.SrcVarTable, false)[A1_139.SrcVar]
  else
    A0_138.ReturnValue = A1_139.SrcValue
  end
end
BBSetReturnValue = L0_0
function L0_0(A0_140, A1_141)
  A0_140.ReturnValue = true
end
BBCancelOrderBeforeIssued = L0_0
function L0_0(A0_142, A1_143)
  if type(A0_142) == "string" and type(A1_143) == "string" then
    A0_142 = string.lower(A0_142)
    A1_143 = string.lower(A1_143)
  end
  return A0_142 == A1_143
end
CO_EQUAL = L0_0
function L0_0(A0_144, A1_145)
  if type(A0_144) == "string" and type(A1_145) == "string" then
    A0_144 = string.lower(A0_144)
    A1_145 = string.lower(A1_145)
  end
  return A0_144 ~= A1_145
end
CO_NOT_EQUAL = L0_0
function L0_0(A0_146, A1_147)
  local L2_148
  L2_148 = A0_146 < A1_147
  return L2_148
end
CO_LESS_THAN = L0_0
function L0_0(A0_149, A1_150)
  local L2_151
  L2_151 = A1_150 < A0_149
  return L2_151
end
CO_GREATER_THAN = L0_0
function L0_0(A0_152, A1_153)
  local L2_154
  L2_154 = A0_152 <= A1_153
  return L2_154
end
CO_LESS_THAN_OR_EQUAL = L0_0
function L0_0(A0_155, A1_156)
  local L2_157
  L2_157 = A1_156 <= A0_155
  return L2_157
end
CO_GREATER_THAN_OR_EQUAL = L0_0
function L0_0(A0_158, A1_159)
  return GetTeamID(A0_158) == GetTeamID(A1_159)
end
CO_SAME_TEAM = L0_0
function L0_0(A0_160, A1_161)
  return GetTeamID(A0_160) ~= GetTeamID(A1_161)
end
CO_DIFFERENT_TEAM = L0_0
function L0_0(A0_162, A1_163)
  return GetSourceType() == A1_163 or GetSourceType() == A0_162
end
CO_DAMAGE_SOURCETYPE_IS = L0_0
function L0_0(A0_164, A1_165)
  return GetSourceType() ~= A1_165 and GetSourceType() ~= A0_164
end
CO_DAMAGE_SOURCETYPE_IS_NOT = L0_0
function L0_0(A0_166)
  return IsObjectAI(A0_166)
end
CO_IS_TYPE_AI = L0_0
function L0_0(A0_167)
  return IsObjectAI(A0_167) ~= true
end
CO_IS_NOT_AI = L0_0
function L0_0(A0_168)
  return IsObjectHero(A0_168)
end
CO_IS_TYPE_HERO = L0_0
function L0_0(A0_169)
  return IsObjectHero(A0_169) ~= true
end
CO_IS_NOT_HERO = L0_0
function L0_0(A0_170)
  return IsObjectMarker(A0_170)
end
CO_IS_TYPE_MARKER = L0_0
function L0_0(A0_171)
  return IsObjectMarker(A0_171) ~= true
end
CO_IS_NOT_MARKER = L0_0
function L0_0(A0_172)
  return IsClone(A0_172)
end
CO_IS_CLONE = L0_0
function L0_0(A0_173)
  return IsClone(A0_173) ~= true
end
CO_IS_NOT_CLONE = L0_0
function L0_0(A0_174)
  return IsMelee(A0_174)
end
CO_IS_MELEE = L0_0
function L0_0(A0_175)
  return IsMelee(A0_175) ~= true
end
CO_IS_RANGED = L0_0
function L0_0(A0_176)
  return A0_176 > math.random()
end
CO_RANDOM_CHANCE_LESS_THAN = L0_0
function L0_0(A0_177)
  return IsTurretAI(A0_177)
end
CO_IS_TYPE_TURRET = L0_0
function L0_0(A0_178)
  return IsTurretAI(A0_178) ~= true
end
CO_IS_NOT_TURRET = L0_0
function L0_0(A0_179)
  return IsDampener(A0_179)
end
CO_IS_TYPE_INHIBITOR = L0_0
function L0_0(A0_180)
  return IsDampener(A0_180) ~= true
end
CO_IS_NOT_INHIBITOR = L0_0
function L0_0(A0_181)
  return IsHQ(A0_181)
end
CO_IS_TYPE_NEXUS = L0_0
function L0_0(A0_182)
  return IsHQ(A0_182) ~= true
end
CO_IS_NOT_NEXUS = L0_0
function L0_0(A0_183)
  return IsDead(A0_183)
end
CO_IS_DEAD = L0_0
function L0_0(A0_184)
  return IsDead(A0_184) ~= true
end
CO_IS_NOT_DEAD = L0_0
function L0_0(A0_185)
  return IsDeadOrZombie(A0_185)
end
CO_IS_DEAD_OR_ZOMBIE = L0_0
function L0_0(A0_186, A1_187)
  return BBIsTargetInFrontOfMe(A0_186, A1_187)
end
CO_IS_TARGET_IN_FRONT_OF_ME = L0_0
function L0_0(A0_188, A1_189)
  return BBIsTargetBehindMe(A0_188, A1_189)
end
CO_IS_TARGET_BEHIND_ME = L0_0
function L0_0(A0_190)
  return IsWard(A0_190)
end
CO_IS_WARD = L0_0
function L0_0(A0_191)
  return IsStructure(A0_191)
end
CO_IS_STRUCTURE = L0_0
function L0_0(A0_192)
  return IsStructure(A0_192) ~= true
end
CO_IS_NOT_STRUCTURE = L0_0
function L0_0(A0_193)
  local L1_194
  L1_194 = A0_193 ~= nil
  return L1_194
end
CO_IS_NOT_NIL = L0_0
function L0_0(A0_195, A1_196, A2_197)
  GetTable(A0_195, A1_196.MacroVarTable, true)[A1_196.MacroVar] = A2_197
end
BBCreateMacro = L0_0
function L0_0(A0_198, A1_199)
  local L2_200
  L2_200 = GetParam
  L2_200 = L2_200("Macro", A0_198, A1_199)
  if L2_200 ~= nil and type(L2_200) == "table" then
    ExecuteBuildingBlocks(L2_200, A0_198)
  else
    DebugClientPrint("Designer Error: Macro variable is not initialized inside of event. Macro Variable was: " .. tostring(A1_199.MacroVar) .. " and current block data is: " .. gCurrentBuildingBlockString .. ". This error probably occurred due to variable not being initialized yet, being misnamed or two events being called out of sequence. It is highly recommended that script macros either be initialized OnBuffActivate, OnCharActivate or in the same event. Pro Devs may violate this rule at the risk of being forced to read this error message again.")
  end
end
BBRunMacro = L0_0
function L0_0(A0_201, A1_202, A2_203)
  local L3_204, L4_205, L5_206, L6_207, L7_208, L8_209
  L3_204 = GetTable
  L3_204 = L3_204(L4_205, L5_206, L6_207)
  L3_204[L4_205] = A2_203
  if L4_205 == nil then
    A2_203.InPerBlockParams = A1_202
    for L7_208 = 1, 6 do
      L8_209 = "FunctionParameter"
      L8_209 = L8_209 .. L7_208 .. "Var"
      if A1_202[L8_209 .. "Table"] ~= nil then
        DebugClientPrint("Designer Error: CreateFunction can only input parameters to PassThroughParams. Current block data is: " .. gCurrentBuildingBlockString .. ".")
      end
    end
  end
end
BBCreateFunction = L0_0
function L0_0(A0_210, A1_211)
  local L2_212, L3_213, L4_214, L5_215, L6_216
  for L5_215 = 1, 6 do
    L6_216 = "FunctionOutput"
    L6_216 = L6_216 .. L5_215 .. "Var"
    if A1_211[L6_216] ~= nil and A1_211[L6_216] ~= "" then
      if A1_211[L6_216 .. "Table"] ~= nil then
        DebugClientPrint("Designer Error: EndFunction can only output from PassThroughParams. Current block data is: " .. gCurrentBuildingBlockString .. ".")
      else
        A0_210[L6_216] = A0_210[A1_211[L6_216]]
      end
    end
  end
end
BBEndFunction = L0_0
function L0_0(A0_217, A1_218)
  local L2_219, L3_220, L4_221, L5_222, L6_223, L7_224, L8_225, L9_226
  L2_219 = GetParam
  L3_220 = "Function"
  L2_219 = L2_219(L3_220, L4_221, L5_222)
  L3_220 = {}
  L3_220.InstanceVars = L4_221
  L3_220.CharVars = L4_221
  L3_220.NextBuffVars = L4_221
  L3_220.AvatarVars = L4_221
  L3_220.SpellVars = L4_221
  L3_220.WorldVars = L4_221
  L3_220.Target = L4_221
  L3_220.Attacker = L4_221
  L3_220.Owner = L4_221
  L3_220.Caster = L4_221
  L3_220.GoldRedirectTarget = L4_221
  L3_220.Unit = L4_221
  L3_220.Other1 = L4_221
  L3_220.Other2 = L4_221
  L3_220.Other3 = L4_221
  L3_220.Nothing = L4_221
  if L2_219 ~= nil then
    if L4_221 == "table" then
      if L4_221 ~= nil then
        for L8_225 = 1, 6 do
          L9_226 = "FunctionParameter"
          L9_226 = L9_226 .. L8_225 .. "Var"
          if A1_218[L9_226] ~= nil and A1_218[L9_226] ~= "" and L4_221[L9_226] ~= nil and L4_221[L9_226] ~= "" then
            L3_220[L4_221[L9_226]] = GetTable(A0_217, A1_218[L9_226 .. "Table"], false)[A1_218[L9_226]]
          end
        end
      end
      L4_221(L5_222, L6_223)
      for L7_224 = 1, 6 do
        L8_225 = "FunctionOutput"
        L9_226 = L7_224
        L8_225 = L8_225 .. L9_226 .. "Var"
        L9_226 = A1_218[L8_225]
        if L9_226 ~= nil then
          L9_226 = A1_218[L8_225]
          if L9_226 ~= "" then
            L9_226 = L3_220
            GetTable(A0_217, A1_218[L8_225 .. "Table"], false)[A1_218[L8_225]] = L9_226[L8_225]
          end
        end
      end
    end
  else
    L8_225 = gCurrentBuildingBlockString
    L9_226 = ". This error probably occurred due to variable not being initialized yet, being misnamed or two events being called out of sequence. It is highly recommended that script functions either be initialized OnBuffActivate, OnCharActivate or in the same event. Pro Devs may violate this rule at the risk of being forced to read this error message again."
    L4_221(L5_222)
  end
end
BBRunFunction = L0_0
function L0_0(A0_227, A1_228, A2_229)
  local L3_230, L4_231, L5_232, L6_233
  L3_230 = GetTable
  L4_231 = A0_227
  L5_232 = A1_228.Src1VarTable
  L6_233 = false
  L3_230 = L3_230(L4_231, L5_232, L6_233)
  L4_231 = GetTable
  L5_232 = A0_227
  L6_233 = A1_228.Src2VarTable
  L4_231 = L4_231(L5_232, L6_233, false)
  L5_232 = false
  L6_233 = nil
  if L3_230 ~= nil and A1_228.Src1Var ~= nil then
    L6_233 = L3_230[A1_228.Src1Var]
  else
    L6_233 = A1_228.Value1
  end
  if L4_231 ~= nil and A1_228.Src2Var ~= nil then
    L5_232 = A1_228.CompareOp(L6_233, L4_231[A1_228.Src2Var])
  else
    L5_232 = A1_228.CompareOp(L6_233, A1_228.Value2)
  end
  if L5_232 then
    ExecuteBuildingBlocks(A2_229, A0_227)
    A0_227.LastIfSucceeded = true
  else
    A0_227.LastIfSucceeded = false
  end
end
BBIf = L0_0
function L0_0(A0_234, A1_235, A2_236)
  if A0_234.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_236, A0_234)
    A0_234.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_237, A1_238, A2_239)
  if A0_237.LastIfSucceeded == true then
    ExecuteBuildingBlocks(A2_239, A0_237)
    A0_237.LastIfSucceeded = true
  else
    BBIf(A0_237, A1_238, A2_239)
  end
end
BBOrIf = L0_0
function L0_0(A0_240, A1_241, A2_242)
  if A0_240.LastIfSucceeded == true then
    BBIf(A0_240, A1_241, A2_242)
  end
end
BBAndIf = L0_0
function L0_0(A0_243, A1_244, A2_245)
  local L3_246, L4_247, L5_248, L6_249
  L3_246 = A0_243.LastIfSucceeded
  if L3_246 == false then
    L3_246 = GetTable
    L4_247 = A0_243
    L5_248 = A1_244.Src1VarTable
    L6_249 = false
    L3_246 = L3_246(L4_247, L5_248, L6_249)
    L4_247 = GetTable
    L5_248 = A0_243
    L6_249 = A1_244.Src2VarTable
    L4_247 = L4_247(L5_248, L6_249, false)
    L5_248 = false
    L6_249 = nil
    if L3_246 ~= nil and A1_244.Src1Var ~= nil then
      L6_249 = L3_246[A1_244.Src1Var]
    else
      L6_249 = A1_244.Value1
    end
    if L4_247 ~= nil and A1_244.Src2Var ~= nil then
      L5_248 = A1_244.CompareOp(L6_249, L4_247[A1_244.Src2Var])
    else
      L5_248 = A1_244.CompareOp(L6_249, A1_244.Value2)
    end
    if L5_248 then
      ExecuteBuildingBlocks(A2_245, A0_243)
      A0_243.LastIfSucceeded = true
    else
      A0_243.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_250, A1_251, A2_252)
  local L3_253
  if A1_251.TargetVar ~= nil then
    L3_253 = A0_250[A1_251.TargetVar]
  else
    L3_253 = A0_250.Target
  end
  if HasBuffOfType(L3_253, A1_251.BuffType) then
    ExecuteBuildingBlocks(A2_252, A0_250)
    A0_250.LastIfSucceeded = true
  else
    A0_250.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_254, A1_255, A2_256)
  local L3_257, L4_258
  if A1_255.OwnerVar ~= nil then
    L3_257 = A0_254[A1_255.OwnerVar]
  else
    L3_257 = A0_254.Owner
  end
  if A1_255.AttackerVar ~= nil then
    L4_258 = A0_254[A1_255.AttackerVar]
  else
    L4_258 = A0_254.Attacker
  end
  if SpellBuffCount(L3_257, A1_255.BuffName, L4_258) > 0 then
    ExecuteBuildingBlocks(A2_256, A0_254)
    A0_254.LastIfSucceeded = true
  else
    A0_254.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_259, A1_260, A2_261)
  if BBIsMissileAutoAttack(A0_259, A1_260) then
    ExecuteBuildingBlocks(A2_261, A0_259)
    A0_259.LastIfSucceeded = true
  else
    A0_259.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_262, A1_263, A2_264)
  if BBIsMissileConsideredAsAutoAttack(A0_262, A1_263) then
    ExecuteBuildingBlocks(A2_264, A0_262)
    A0_262.LastIfSucceeded = true
  else
    A0_262.LastIfSucceeded = false
  end
end
BBIfMissileConsideredAsAutoAttack = L0_0
function L0_0(A0_265, A1_266)
  A0_265.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_267, A1_268, A2_269)
  local L3_270, L4_271
  if A1_268.OwnerVar ~= nil then
    L3_270 = A0_267[A1_268.OwnerVar]
  else
    L3_270 = A0_267.Owner
  end
  if A1_268.CasterVar ~= nil then
    L4_271 = A0_267[A1_268.CasterVar]
  else
    L4_271 = A0_267.Caster
  end
  if SpellBuffCount(L3_270, A1_268.BuffName, L4_271) <= 0 then
    ExecuteBuildingBlocks(A2_269, A0_267)
    A0_267.LastIfSucceeded = true
  else
    A0_267.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_272, A1_273, A2_274)
  local L3_275
  if A1_273.TargetVar ~= nil then
    L3_275 = A0_272[A1_273.TargetVar]
  else
    L3_275 = A0_272.Owner
  end
  if HasUnitTag(L3_275, A1_273.UnitTag) ~= A1_273.InvertResult then
    ExecuteBuildingBlocks(A2_274, A0_272)
    A0_272.LastIfSucceeded = true
  else
    A0_272.LastIfSucceeded = false
  end
end
BBIfHasUnitTag = L0_0
function L0_0(A0_276, A1_277, A2_278)
  local L3_279, L4_280
  if A1_277.OwnerVar ~= nil then
    L3_279 = A0_276[A1_277.OwnerVar]
  else
    L3_279 = A0_276.Owner
  end
  if HasPARType(L3_279, A1_277.PARType) then
    ExecuteBuildingBlocks(A2_278, A0_276)
    A0_276.LastIfSucceeded = true
  else
    A0_276.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_281, A1_282, A2_283)
  local L3_284, L4_285
  if A1_282.OwnerVar ~= nil then
    L3_284 = A0_281[A1_282.OwnerVar]
  else
    L3_284 = A0_281.Owner
  end
  if not HasPARType(L3_284, A1_282.PARType) then
    ExecuteBuildingBlocks(A2_283, A0_281)
    A0_281.LastIfSucceeded = true
  else
    A0_281.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_286, A1_287, A2_288)
  local L3_289, L4_290, L5_291, L6_292, L7_293
  L3_289 = GetTable
  L4_290 = A0_286
  L5_291 = A1_287.Src1VarTable
  L6_292 = false
  L3_289 = L3_289(L4_290, L5_291, L6_292)
  L4_290 = GetTable
  L5_291 = A0_286
  L6_292 = A1_287.Src2VarTable
  L7_293 = false
  L4_290 = L4_290(L5_291, L6_292, L7_293)
  L5_291 = true
  while L5_291 do
    L6_292 = false
    L7_293 = nil
    if L3_289 ~= nil and A1_287.Src1Var ~= nil then
      L7_293 = L3_289[A1_287.Src1Var]
    else
      L7_293 = A1_287.Value1
    end
    if L4_290 ~= nil and A1_287.Src2Var ~= nil then
      L6_292 = A1_287.CompareOp(L7_293, L4_290[A1_287.Src2Var])
    else
      L6_292 = A1_287.CompareOp(L7_293, A1_287.Value2)
    end
    if L6_292 then
      ExecuteBuildingBlocks(A2_288, A0_286)
    else
      L5_291 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_294, A1_295)
  return A0_294 * A1_295
end
MO_MULTIPLY = L0_0
function L0_0(A0_296, A1_297)
  return A0_296 + A1_297
end
MO_ADD = L0_0
function L0_0(A0_298, A1_299)
  return A0_298 - A1_299
end
MO_SUBTRACT = L0_0
function L0_0(A0_300, A1_301)
  return A0_300 / A1_301
end
MO_DIVIDE = L0_0
function L0_0(A0_302, A1_303)
  if A0_302 < A1_303 then
    return A0_302
  else
    return A1_303
  end
end
MO_MIN = L0_0
function L0_0(A0_304, A1_305)
  if A1_305 < A0_304 then
    return A0_304
  else
    return A1_305
  end
end
MO_MAX = L0_0
function L0_0(A0_306, A1_307)
  return A0_306 % A1_307
end
MO_MODULO = L0_0
function L0_0(A0_308)
  return math.floor(A0_308 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_309)
  return math.ceil(A0_309)
end
MO_ROUNDUP = L0_0
function L0_0(A0_310)
  return math.floor(A0_310)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_311)
  return math.sin(math.rad(A0_311))
end
MO_SIN = L0_0
function L0_0(A0_312)
  return math.cos(math.rad(A0_312))
end
MO_COSINE = L0_0
function L0_0(A0_313)
  return math.tan(math.rad(A0_313))
end
MO_TANGENT = L0_0
function L0_0(A0_314)
  return math.deg(math.asin(A0_314))
end
MO_ASIN = L0_0
function L0_0(A0_315)
  return math.deg(math.acos(A0_315))
end
MO_ACOS = L0_0
function L0_0(A0_316)
  return math.deg(math.atan(A0_316))
end
MO_ATAN = L0_0
function L0_0(A0_317, A1_318)
  return math.pow(A0_317, A1_318)
end
MO_POW = L0_0
function L0_0(A0_319)
  return math.sqrt(A0_319)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_320, A1_321)
  local L2_322
  L2_322 = A0_320 and A1_321
  return L2_322
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_323, A1_324)
  local L2_325
  L2_325 = A0_323 or A1_324
  return L2_325
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_326)
  local L1_327
  L1_327 = not A0_326
  return L1_327
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_328)
  return math.abs(A0_328)
end
MO_ABS = L0_0
function L0_0(A0_329, A1_330)
  return math.random(A0_329, A1_330)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_331, A1_332)
  local L2_333, L3_334, L4_335, L5_336
  L2_333 = GetMathNumber
  L3_334 = A0_331
  L4_335 = A1_332.Src1VarTable
  L5_336 = A1_332.Src1Var
  L2_333 = L2_333(L3_334, L4_335, L5_336, A1_332.Src1Value)
  L3_334 = GetMathNumber
  L4_335 = A0_331
  L5_336 = A1_332.Src2VarTable
  L3_334 = L3_334(L4_335, L5_336, A1_332.Src2Var, A1_332.Src2Value)
  L4_335 = GetTable
  L5_336 = A0_331
  L4_335 = L4_335(L5_336, A1_332.DestVarTable)
  L5_336 = A1_332.MathOp
  L5_336 = L5_336(L2_333, L3_334)
  SetVarInTable(A0_331, A1_332, L5_336)
end
BBMath = L0_0
function L0_0(A0_337, A1_338, A2_339, A3_340)
  if A2_339 ~= nil and GetTable(A0_337, A1_338)[A2_339] ~= nil then
    return GetTable(A0_337, A1_338)[A2_339]
  end
  return A3_340
end
GetMathNumber = L0_0
function L0_0(A0_341, A1_342)
  if type(A1_342) == "number" then
    return A1_342
  elseif type(A1_342) == "function" then
    return A1_342(A0_341)
  elseif type(A1_342) == "string" then
    return A0_341[A1_342]
  end
end
GetNumber = L0_0
function L0_0(A0_343, A1_344)
  return VectorAdd(A0_343, A1_344)
end
VEC_ADD = L0_0
function L0_0(A0_345, A1_346)
  return VectorSubtract(A0_345, A1_346)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_347, A1_348)
  return VectorScalarMultiply(A0_347, A1_348)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_349, A1_350)
  return VectorScalarDivide(A0_349, A1_350)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_351, A1_352)
  return VectorRotateY(A0_351, A1_352)
end
VEC_ROTATE = L0_0
function L0_0(A0_353, A1_354)
  BBMath(A0_353, A1_354)
end
BBVectorMath = L0_0
function L0_0(A0_355, A1_356)
  local L2_357, L3_358, L4_359, L5_360
  L2_357 = A0_355.InstanceVars
  L3_358 = L2_357.InterpDelta
  if L3_358 == nil then
    L3_358 = A1_356.Amount
    L4_359 = A1_356.AmountVar
    if L4_359 ~= nil then
      L4_359 = GetTable
      L5_360 = A0_355
      L4_359 = L4_359(L5_360, A1_356.AmountVarTable)
      L5_360 = A1_356.AmountVar
      L3_358 = L4_359[L5_360]
    end
    L4_359 = GetPosition
    L5_360 = A1_356.TargetVar
    L5_360 = A0_355[L5_360]
    L4_359 = L4_359(L5_360)
    L2_357.KnockBackStart = L4_359
    L4_359 = GetNormalizedPositionDelta
    L5_360 = A1_356.TargetVar
    L5_360 = A0_355[L5_360]
    L4_359 = L4_359(L5_360, A0_355[A1_356.AttackerVar], true)
    L5_360 = {}
    L5_360.x = L4_359.x * L3_358
    L5_360.y = 0
    L5_360.z = L4_359.z * L3_358
    L2_357.InterpDelta = L5_360
    L5_360 = GetTime
    L5_360 = L5_360()
    L2_357.StartTime = L5_360
    L5_360 = A1_356.KnockBackDuration
    L2_357.KnockBackDuration = L5_360
  end
  L3_358 = A1_356.TargetVar
  L3_358 = A0_355[L3_358]
  L4_359 = GetTime
  L4_359 = L4_359()
  L5_360 = L2_357.StartTime
  L4_359 = L4_359 - L5_360
  L5_360 = L2_357.KnockBackDuration
  L4_359 = L4_359 / L5_360
  L5_360 = {}
  L5_360.x = L2_357.KnockBackStart.x + L2_357.InterpDelta.x * L4_359
  L5_360.y = L2_357.KnockBackStart.y
  L5_360.z = L2_357.KnockBackStart.z + L2_357.InterpDelta.z * L4_359
  SetPosition(L3_358, L5_360)
end
BBKnockback = L0_0
function L0_0(A0_361, A1_362)
  local L2_363, L3_364
  L2_363 = GetParam
  L3_364 = "Left"
  L2_363 = L2_363(L3_364, A0_361, A1_362)
  L3_364 = GetParam
  L3_364 = L3_364("Right", A0_361, A1_362)
  GetTable(A0_361, A1_362.DestVarTable, true)[A1_362.DestVar] = tostring(L2_363) .. tostring(L3_364)
end
BBAppendString = L0_0
function L0_0(A0_365, A1_366)
  local L2_367
  L2_367 = 0
  if A1_366.Delta ~= nil then
    L2_367 = L2_367 + A1_366.Delta
  end
  if A1_366.DeltaByLevel ~= nil and A0_365.Level ~= nil then
    L2_367 = L2_367 + A1_366.DeltaByLevel[A0_365.Level]
  end
  if A1_366.DeltaVar ~= nil then
    L2_367 = L2_367 + GetTable(A0_365, A1_366.DeltaVarTable, true)[A1_366.DeltaVar]
  end
  if A1_366.TargetVar ~= nil then
    A1_366.Stat(L2_367, A0_365[A1_366.TargetVar])
  else
    A1_366.Stat(L2_367)
  end
end
BBIncStat = L0_0
function L0_0(A0_368, A1_369)
  local L2_370
  L2_370 = 0
  if A1_369.Delta ~= nil then
    L2_370 = L2_370 + A1_369.Delta
  end
  if A1_369.DeltaByLevel ~= nil and A0_368.Level ~= nil then
    L2_370 = L2_370 + A1_369.DeltaByLevel[A0_368.Level]
  end
  if A1_369.DeltaVar ~= nil then
    L2_370 = L2_370 + GetTable(A0_368, A1_369.DeltaVarTable, true)[A1_369.DeltaVar]
  end
  if A1_369.TargetVar ~= nil then
    A1_369.Stat(L2_370, A0_368[A1_369.TargetVar])
  else
    A1_369.Stat(L2_370)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_371, A1_372)
  local L2_373, L3_374
  L2_373 = A1_372.TargetVar
  L3_374 = 0
  if A1_372.LaneVar ~= nil then
    L3_374 = L3_374 + GetTable(A0_371, A1_372.LaneVarTable, true)[A1_372.LaneVar]
  end
  if A1_372.Lane ~= nil then
    L3_374 = L3_374 + A1_372.Lane
  end
  SetMinionLane(A0_371[L2_373], L3_374)
end
BBSetMinionLane = L0_0
function L0_0(A0_375, A1_376)
  if A1_376.AttackVar ~= nil then
  end
  if A1_376.Attack ~= nil then
  end
  if A1_376.TotalCoefficientVar ~= nil then
  end
  if A1_376.TotalCoefficient ~= nil then
  end
  if A1_376.TargetVar ~= nil then
    GetTable(A0_375, A1_376.DestVarTable, false)[A1_376.DestVar] = (0 + GetTable(A0_375, A1_376.AttackVarTable, true)[A1_376.AttackVar] + A1_376.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_375[A1_376.TargetVar])) + GetFlatCritDamageMod(A0_375[A1_376.TargetVar])) * (0 + GetTable(A0_375, A1_376.TotalCoefficientVarTable, true)[A1_376.TotalCoefficientVar] + A1_376.TotalCoefficient)
  else
    GetTable(A0_375, A1_376.DestVarTable, false)[A1_376.DestVar] = 2 * A1_376.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_377, A1_378)
  local L2_379, L3_380, L4_381, L5_382, L6_383, L7_384
  L2_379 = GetTable
  L3_380 = A0_377
  L4_381 = A1_378.DestVarTable
  L5_382 = false
  L2_379 = L2_379(L3_380, L4_381, L5_382)
  L3_380 = GetTable
  L4_381 = A0_377
  L5_382 = A1_378.AmountVarTable
  L6_383 = true
  L3_380 = L3_380(L4_381, L5_382, L6_383)
  L4_381 = GetTable
  L5_382 = A0_377
  L6_383 = A0_377.NextBuffVars
  L7_384 = false
  L4_381 = L4_381(L5_382, L6_383, L7_384)
  L5_382 = A1_378.AmountVar
  L5_382 = L3_380[L5_382]
  L6_383 = A1_378.Amount
  L5_382 = L5_382 + L6_383
  L4_381.InitializeShield_Amount = L5_382
  L5_382 = A1_378.AmountVar
  if L5_382 ~= nil then
    L5_382 = A1_378.HealShieldMod
    if L5_382 ~= nil and L5_382 == true then
      L6_383 = A1_378.AttackerVar
      L7_384 = 0
      if L6_383 ~= nil then
        L7_384 = GetPercentHealingAmountMod(A0_377[L6_383])
      end
      L4_381.InitializeShield_Amount, L3_380[A1_378.AmountVar] = (A1_378.Amount + L3_380[A1_378.AmountVar]) * (1 + L7_384), (A1_378.Amount + L3_380[A1_378.AmountVar]) * (1 + L7_384)
    end
  end
  L5_382 = SpellBuffAddNoRenew
  L6_383 = A1_378.AttackerVar
  L6_383 = A0_377[L6_383]
  L7_384 = A1_378.UnitVar
  L7_384 = A0_377[L7_384]
  L5_382(L6_383, L7_384, "InitializeShieldMarker", 0, 1, 25000, L4_381)
  L5_382 = BBIncreaseShield
  L6_383 = A0_377
  L7_384 = A1_378
  L5_382(L6_383, L7_384)
end
BBInitializeShield = L0_0
function L0_0(A0_385, A1_386)
  if A1_386.CDVar ~= nil then
  end
  if A1_386.CD ~= nil then
  end
  if A1_386.TargetVar ~= nil then
    GetTable(A0_385, A1_386.DestVarTable, false)[A1_386.DestVar] = (0 + GetTable(A0_385, A1_386.CDVarTable, true)[A1_386.CDVar] + A1_386.CD) * (1 + GetPercentCooldownMod(A0_385[A1_386.TargetVar]))
  else
    GetTable(A0_385, A1_386.DestVarTable, false)[A1_386.DestVar] = A1_386.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_387, A1_388)
  local L2_389, L3_390
  L3_390 = A1_388.TargetVar
  if L3_390 ~= nil then
    L2_389 = A1_388.Stat(A0_387[L3_390])
  else
    L2_389 = A1_388.Stat()
  end
  SetVarInTable(A0_387, A1_388, L2_389)
end
BBGetStat = L0_0
function L0_0(A0_391, A1_392)
  if A1_392.TargetVar ~= nil then
    GetTable(A0_391, A1_392.DestVarTable, false)[A1_392.DestVar] = GetLevel(A0_391[A1_392.TargetVar])
  else
    GetTable(A0_391, A1_392.DestVarTable, false)[A1_392.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_393, A1_394)
  if A1_394.TargetVar ~= nil then
    GetTable(A0_393, A1_394.DestVarTable, false)[A1_394.DestVar] = GetUnitSignificance(A0_393[A1_394.TargetVar])
  else
    GetTable(A0_393, A1_394.DestVarTable, false)[A1_394.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_395, A1_396)
  if A1_396.TargetVar ~= nil then
    GetTable(A0_395, A1_396.DestVarTable, false)[A1_396.DestVar] = GetArmor(A0_395[A1_396.TargetVar])
  else
    GetTable(A0_395, A1_396.DestVarTable, false)[A1_396.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_397, A1_398)
  if A1_398.TargetVar ~= nil then
    GetTable(A0_397, A1_398.DestVarTable, false)[A1_398.DestVar] = GetSpellBlock(A0_397[A1_398.TargetVar])
  else
    GetTable(A0_397, A1_398.DestVarTable, false)[A1_398.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_399, A1_400)
  local L2_401, L3_402
  L3_402 = A1_400.TargetVar
  if L3_402 ~= nil then
    L2_401 = GetTeamID(A0_399[L3_402])
  else
    L2_401 = GetTeamID()
  end
  SetVarInTable(A0_399, A1_400, L2_401)
end
BBGetTeamID = L0_0
function L0_0(A0_403, A1_404)
  local L2_405, L3_406, L4_407
  L2_405 = GetTable
  L3_406 = A0_403
  L4_407 = A1_404.DestVarTable
  L2_405 = L2_405(L3_406, L4_407, false)
  L3_406 = A1_404.TargetVar
  L4_407 = nil
  if L3_406 ~= nil then
    L4_407 = GetTeamID(A0_403[L3_406])
  else
    L4_407 = GetTeamID()
  end
  if L4_407 == TEAM_ORDER then
    L2_405[A1_404.DestVar] = TEAM_CHAOS
  elseif L4_407 == TEAM_CHAOS then
    L2_405[A1_404.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_408, A1_409)
  if A1_409.TargetVar ~= nil then
    GetTable(A0_408, A1_409.DestVarTable, false)[A1_409.DestVar] = GetUnitSkinName(A0_408[A1_409.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_410, A1_411)
  local L2_412, L3_413, L4_414
  L2_412 = GetTable
  L3_413 = A0_410
  L4_414 = A1_411.DestVarTable
  L2_412 = L2_412(L3_413, L4_414, false)
  L3_413 = A0_410.Owner
  L4_414 = nil
  if A1_411.TargetVar ~= nil then
    L4_414 = GetTotalAttackDamage(A0_410[A1_411.TargetVar])
  else
    L4_414 = GetTotalAttackDamage()
  end
  SetVarInTable(A0_410, A1_411, L4_414)
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_415, A1_416)
  GetTable(A0_415, A1_416.DestVarTable, true)[A1_416.DestVar] = A1_416.Status(A0_415[A1_416.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_417, A1_418)
  local L2_419
  L2_419 = A1_418.TargetVar
  L2_419 = A0_417[L2_419]
  ClearAttackTarget(L2_419)
end
BBClearAttackTarget = L0_0
function L0_0(A0_420, A1_421)
  local L2_422, L3_423
  L2_422 = GetTable
  L3_423 = A0_420
  L2_422 = L2_422(L3_423, A1_421.DestVarTable, true)
  L3_423 = A1_421.Info
  L3_423 = L3_423(A0_420[A1_421.TargetVar])
  SetVarInTable(A0_420, A1_421, L3_423)
end
BBGetCastInfo = L0_0
function L0_0(A0_424, A1_425, A2_426)
  local L3_427, L4_428, L5_429, L6_430
  L3_427 = GetTable
  L4_428 = A0_424
  L5_429 = A1_425.TrackTimeVarTable
  L6_430 = false
  L3_427 = L3_427(L4_428, L5_429, L6_430)
  L4_428 = GetTime
  L4_428 = L4_428()
  L5_429 = A1_425.ExecuteImmediately
  L6_430 = GetParam
  L6_430 = L6_430("TimeBetweenExecutions", A0_424, A1_425)
  if A1_425.TickTimeVar ~= nil and GetTable(A0_424, A1_425.TickTimeVarTable, false)[A1_425.TickTimeVar] ~= nil then
    L6_430 = GetTable(A0_424, A1_425.TickTimeVarTable, false)[A1_425.TickTimeVar]
  end
  if L3_427[A1_425.TrackTimeVar] == nil then
    L3_427[A1_425.TrackTimeVar] = L4_428
    if L5_429 == true then
      ExecuteBuildingBlocks(A2_426, A0_424)
    end
  end
  if L4_428 >= L3_427[A1_425.TrackTimeVar] + L6_430 then
    L3_427[A1_425.TrackTimeVar] = L3_427[A1_425.TrackTimeVar] + L6_430
    ExecuteBuildingBlocks(A2_426, A0_424)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_431, A1_432, A2_433)
  GetTable(A0_431, A1_432.TrackTimeVarTable, false)[A1_432.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_434, A1_435)
  local L2_436
  L2_436 = A1_435.SrcValue
  if A1_435.SrcVar ~= nil then
    L2_436 = GetTable(A0_434, A1_435.SrcVarTable, true)[A1_435.SrcVar]
  end
  A1_435.Status(A0_434[A1_435.TargetVar], L2_436)
end
BBSetStatus = L0_0
function L0_0(A0_437, A1_438)
  local L2_439
  L2_439 = A1_438.ToAlert
  if GetTable(A0_437, A1_438.SrcVarTable, false) ~= nil and A1_438.SrcVar ~= nil then
    L2_439 = L2_439 .. GetTable(A0_437, A1_438.SrcVarTable, false)[A1_438.SrcVar]
  end
  _ALERT(L2_439)
end
BBAlert = L0_0
function L0_0(A0_440, A1_441)
  local L2_442, L3_443, L4_444, L5_445, L6_446, L7_447
  L2_442 = GetParam
  L3_443 = "Value"
  L4_444 = A0_440
  L5_445 = A1_441
  L2_442 = L2_442(L3_443, L4_444, L5_445)
  if L2_442 == nil then
    L3_443 = ReportError
    L4_444 = "Could not resolve Value param"
    L3_443(L4_444)
    return
  end
  L3_443 = true
  L4_444 = GetParam
  L5_445 = "OnUnit"
  L6_446 = A0_440
  L7_447 = A1_441
  L4_444 = L4_444(L5_445, L6_446, L7_447)
  if L4_444 == nil then
    L3_443 = false
    L5_445 = GetParam
    L6_446 = "OnUnitByFlag"
    L7_447 = A0_440
    L5_445 = L5_445(L6_446, L7_447, A1_441)
    L4_444 = L5_445
  end
  if L4_444 == nil then
    L5_445 = ReportError
    L6_446 = "Could not resolve OnUnit param"
    L5_445(L6_446)
    return
  end
  L5_445 = true
  L6_446 = GetParam
  L7_447 = "ChampionToSayTo"
  L6_446 = L6_446(L7_447, A0_440, A1_441)
  if L6_446 == nil then
    L5_445 = false
    L7_447 = GetParam
    L7_447 = L7_447("ChampionToSayToByFlag", A0_440, A1_441)
    L6_446 = L7_447
  end
  if L6_446 == nil then
    L7_447 = ReportError
    L7_447("Could not resolve ChampionToSayTo param")
    return
  end
  L7_447 = GetParam
  L7_447 = L7_447("ShowToSpectator", A0_440, A1_441)
  if L7_447 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  DisplayNumericFloatingTextOnUnitToChampion(L2_442, A1_441.TextType, L4_444, L3_443, L6_446, L5_445, L7_447)
end
BBDisplayNumericFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_448, A1_449)
  local L2_450, L3_451, L4_452, L5_453, L6_454, L7_455
  L2_450 = GetParam
  L3_451 = "Message"
  L4_452 = A0_448
  L5_453 = A1_449
  L2_450 = L2_450(L3_451, L4_452, L5_453)
  if L2_450 == nil then
    L3_451 = ReportError
    L4_452 = "Could not resolve Message param"
    L3_451(L4_452)
    return
  end
  L3_451 = true
  L4_452 = GetParam
  L5_453 = "OnUnit"
  L6_454 = A0_448
  L7_455 = A1_449
  L4_452 = L4_452(L5_453, L6_454, L7_455)
  if L4_452 == nil then
    L3_451 = false
    L5_453 = GetParam
    L6_454 = "OnUnitByFlag"
    L7_455 = A0_448
    L5_453 = L5_453(L6_454, L7_455, A1_449)
    L4_452 = L5_453
  end
  if L4_452 == nil then
    L5_453 = ReportError
    L6_454 = "Could not resolve OnUnit param"
    L5_453(L6_454)
    return
  end
  L5_453 = true
  L6_454 = GetParam
  L7_455 = "ChampionToSayTo"
  L6_454 = L6_454(L7_455, A0_448, A1_449)
  if L6_454 == nil then
    L5_453 = false
    L7_455 = GetParam
    L7_455 = L7_455("ChampionToSayToByFlag", A0_448, A1_449)
    L6_454 = L7_455
  end
  if L6_454 == nil then
    L7_455 = ReportError
    L7_455("Could not resolve ChampionToSayTo param")
    return
  end
  L7_455 = GetParam
  L7_455 = L7_455("ShowToSpectator", A0_448, A1_449)
  if L7_455 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  SayWithFloatingTextOnUnitToChampion(tostring(L2_450), A1_449.TextType, L4_452, L3_451, L6_454, L5_453, L7_455)
end
BBSayWithFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_456, A1_457)
  local L2_458, L3_459, L4_460
  L2_458 = A1_457.ToSay
  L3_459 = GetTable
  L4_460 = A0_456
  L3_459 = L3_459(L4_460, A1_457.SrcVarTable, false)
  if L3_459 ~= nil then
    L4_460 = A1_457.SrcVar
    if L4_460 ~= nil then
      L4_460 = L2_458
      L2_458 = L4_460 .. tostring(L3_459[A1_457.SrcVar])
    end
  end
  L4_460 = nil
  if A1_457.OwnerVar ~= nil then
    L4_460 = A0_456[A1_457.OwnerVar]
  else
    L4_460 = A0_456.Owner
  end
  if A1_457.TextType == nil then
    A1_457.TextType = 0
  end
  Say(L4_460, L2_458, A1_457.TextType)
end
BBSay = L0_0
function L0_0(A0_461, A1_462)
  local L2_463, L3_464, L4_465
  L2_463 = A1_462.ToSay
  L3_464 = GetTable
  L4_465 = A0_461
  L3_464 = L3_464(L4_465, A1_462.SrcVarTable, false)
  if L3_464 ~= nil then
    L4_465 = A1_462.SrcVar
    if L4_465 ~= nil then
      L4_465 = L2_463
      L2_463 = L4_465 .. tostring(L3_464[A1_462.SrcVar])
    end
  end
  L4_465 = nil
  if A1_462.OwnerVar ~= nil then
    L4_465 = A0_461[A1_462.OwnerVar]
  else
    L4_465 = A0_461.Owner
  end
  if A1_462.TextType == nil then
    A1_462.TextType = 0
  end
  Say(L4_465, L2_463, A1_462.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_466, A1_467)
  GetTable(A0_466, A1_467.DestVarTable, true)[A1_467.DestVar] = BBLuaGetGold(A0_466, A1_467)
end
BBGetGold = L0_0
function L0_0(A0_468, A1_469)
  GetTable(A0_468, A1_469.DestVarTable, true)[A1_469.DestVar] = BBLuaGetTotalGold(A0_468, A1_469)
end
BBGetTotalGold = L0_0
function L0_0(A0_470, A1_471)
  SpellBuffAdd(A0_470[A1_471.OwnerVar], A0_470[A1_471.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_470.NextBuffVars)
  BBTeleportToPositionHelper(A0_470, A1_471)
end
BBTeleportToPosition = L0_0
function L0_0(A0_472, A1_473)
  if A1_473.XVar ~= nil and GetTable(A0_472, A1_473.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_472, A1_473.XVarTable, true)[A1_473.XVar]
  else
    Xloc = A1_473.X
  end
  if A1_473.YVar ~= nil and GetTable(A0_472, A1_473.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_472, A1_473.YVarTable, true)[A1_473.YVar]
  else
    Yloc = A1_473.Y
  end
  if A1_473.ZVar ~= nil and GetTable(A0_472, A1_473.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_472, A1_473.ZVarTable, true)[A1_473.ZVar]
  else
    Zloc = A1_473.Z
  end
  A1_473.OwnerVar, A0_472.position = A1_473.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_473.CastPositionName = "position"
  BBTeleportToPosition(A0_472, A1_473)
end
BBTeleportToPoint = L0_0
function L0_0(A0_474, A1_475)
  A1_475.TimeoutInFOW = 999999
  A1_475.BindFlexToOwnerPAR = false
  A1_475.Flags = 0
  A1_475.FollowsGroundTilt = false
  A1_475.FacesTarget = false
  A1_475.HideFromSpectator = false
  A1_475.SendIfOnScreenOrDiscard = false
  A1_475.PersistsThroughReconnect = true
  A1_475.FOWVisibilityRadius = 10
  A1_475.Scale = 1
  A1_475.BindObjectVar = A1_475.BindObject1Var
  A1_475.EffectID2Var = A1_475.OtherTeamEffectIDVar
  A1_475.TargetObjectVar = A1_475.BindObject2Var
  A1_475.FOWTeamOverrideVar = A1_475.FOWTeamVar
  A1_475.BoneName = A1_475.BindObject1BoneName
  A1_475.TargetBoneName = A1_475.BindObject2BoneName
  A1_475.EffectName = A1_475.EffectParticleFile
  A1_475.EffectNameForOtherTeam = A1_475.OtherTeamParticleFile
  BBSpellEffectCreate(A0_474, A1_475)
end
BBSpellEffectCreate_EasyBeam = L0_0
function L0_0(A0_476, A1_477)
  A1_477.TimeoutInFOW = 999999
  A1_477.BindFlexToOwnerPAR = false
  A1_477.Flags = 0
  A1_477.FollowsGroundTilt = false
  A1_477.FacesTarget = false
  A1_477.HideFromSpectator = false
  A1_477.SendIfOnScreenOrDiscard = true
  A1_477.PersistsThroughReconnect = false
  A1_477.FOWVisibilityRadius = 10
  A1_477.Scale = 1
  A1_477.FOWTeamOverrideVar = A1_477.FOWTeamVar
  A1_477.EffectName = A1_477.ParticleFile
  A1_477.EffectNameForOtherTeam = A1_477.ParticleFileForOtherTeam
  A1_477.BoneName = A1_477.BindObjectBoneName
  BBSpellEffectCreate(A0_476, A1_477)
end
BBSpellEffectCreate_EasyHit = L0_0
function L0_0(A0_478, A1_479)
  ReincarnateNonDeadHero(GetTable(A0_478, A1_479.TargetTable, false)[A1_479.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_480, A1_481)
  GetTable(A0_480, A1_481.DestVarTable, true)[A1_481.DestVar] = A1_481.Function(A0_480[A1_481.OwnerVar], A1_481.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_482, A1_483)
  local L2_484, L3_485, L4_486, L5_487
  L2_484 = A1_483.WhomToOrderVar
  L2_484 = A0_482[L2_484]
  L3_485 = A1_483.TargetOfOrderVar
  L3_485 = A0_482[L3_485]
  L4_486 = GetTable
  L5_487 = A0_482
  L4_486 = L4_486(L5_487, A1_483.SrcVarTable, false)
  L5_487 = nil
  if A1_483.SrcVar ~= nil and L4_486 ~= nil then
    L5_487 = L4_486[A1_483.SrcVar]
  else
    L5_487 = GetPosition(L3_485)
  end
  if L3_485 == nil then
    L3_485 = L2_484
  end
  IssueOrder(L2_484, A1_483.Order, L5_487, L3_485)
end
BBIssueOrder = L0_0
function L0_0(A0_488, A1_489)
  local L2_490
  L2_490 = GetParam
  L2_490 = L2_490("NewRange", A0_488, A1_489)
  SetSpellCastRange(L2_490)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_491, A1_492)
  GetTable(A0_491, A1_492.DestVarTable, true)[A1_492.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_493, A1_494)
  local L2_495, L3_496
  L2_495 = A1_494.ObjectVar1
  L2_495 = A0_493[L2_495]
  L3_496 = A1_494.ObjectVar2
  L3_496 = A0_493[L3_496]
  GetTable(A0_493, A1_494.DestVarTable, true)[A1_494.DestVar] = DistanceBetweenObjectBounds(L2_495, L3_496)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_497, A1_498)
  local L2_499, L3_500, L4_501
  L2_499 = A1_498.ObjectVar
  L2_499 = A0_497[L2_499]
  L3_500 = GetTable
  L4_501 = A0_497
  L3_500 = L3_500(L4_501, A1_498.PointVarTable, true)
  L4_501 = A1_498.PointVar
  L4_501 = L3_500[L4_501]
  GetTable(A0_497, A1_498.DestVarTable, true)[A1_498.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_499, L4_501)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_502, A1_503)
  local L2_504, L3_505
  L2_504 = GetParam
  L3_505 = "Point1"
  L2_504 = L2_504(L3_505, A0_502, A1_503)
  L3_505 = GetParam
  L3_505 = L3_505("Point2", A0_502, A1_503)
  GetTable(A0_502, A1_503.DestVarTable, true)[A1_503.DestVar] = DistanceBetweenPoints(L2_504, L3_505)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_506, A1_507, A2_508)
  local L3_509, L4_510, L5_511, L6_512, L7_513, L8_514
  L5_511 = 0
  L6_512 = nil
  L7_513 = A1_507.ObjectDistanceType
  L8_514 = A1_507.ObjectVar1
  L3_509 = A0_506[L8_514]
  L8_514 = A1_507.ObjectVar2
  L4_510 = A0_506[L8_514]
  if nil == L4_510 then
    L8_514 = A1_507.Point2Var
    if nil ~= L8_514 then
      L8_514 = GetTable
      L8_514 = L8_514(A0_506, A1_507.Point2VarTable, true)
      L4_510 = L8_514[A1_507.Point2Var]
      L5_511 = L5_511 + 1
    end
  end
  if nil == L3_509 then
    L8_514 = A1_507.Point1Var
    if nil ~= L8_514 then
      L8_514 = GetTable
      L8_514 = L8_514(A0_506, A1_507.Point1VarTable, true)
      L3_509 = L8_514[A1_507.Point1Var]
      L5_511 = L5_511 + 1
      if 1 == L5_511 then
        L3_509, L4_510 = L4_510, L3_509
      end
    end
  end
  if nil ~= L7_513 then
    if 0 == L5_511 then
      L8_514 = OBJECT_CENTER
      if L8_514 == L7_513 then
        L6_512 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_514 = OBJECT_BOUNDARY
        if L8_514 == L7_513 then
          L6_512 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_514 = A1_507.OwnerVar
          L8_514 = A0_506[L8_514]
          Say(L8_514, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_511 then
      L8_514 = OBJECT_CENTER
      if L8_514 == L7_513 then
        L6_512 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_514 = OBJECT_BOUNDARY
        if L8_514 == L7_513 then
          L6_512 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_514 = A1_507.OwnerVar
          L8_514 = A0_506[L8_514]
          Say(L8_514, "invalid object distance type", 0)
        end
      end
    else
      L6_512 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_514 = A1_507.Distance
  if A1_507.DistanceVar ~= nil and GetTable(A0_506, A1_507.DistanceVarTable, true) ~= nil then
    L8_514 = L8_514 + GetTable(A0_506, A1_507.DistanceVarTable, true)[A1_507.DistanceVar]
  end
  if L3_509 ~= nil and L4_510 ~= nil and L6_512 ~= nil and L8_514 ~= nil then
    if not L6_512(L3_509, L4_510, L8_514) then
      ExecuteBuildingBlocks(A2_508, A0_506)
      A0_506.LastIfSucceeded = true
    else
      A0_506.LastIfSucceeded = false
    end
  else
    A0_506.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_515, A1_516)
  local L2_517, L3_518
  L2_517 = A1_516.TargetVar
  L2_517 = A0_515[L2_517]
  L3_518 = A1_516.CasterVar
  L3_518 = A0_515[L3_518]
  GetTable(A0_515, A1_516.DestVarTable, true)[A1_516.DestVar] = SpellBuffCount(L2_517, A1_516.BuffName, L3_518)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_519, A1_520)
  local L2_521
  L2_521 = A1_520.TargetVar
  L2_521 = A0_519[L2_521]
  GetTable(A0_519, A1_520.DestVarTable, true)[A1_520.DestVar] = SpellBuffCount(L2_521, A1_520.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_522, A1_523)
  local L2_524, L3_525
  L2_524 = GetTable
  L3_525 = A0_522
  L2_524 = L2_524(L3_525, A1_523.ScaleVarTable, false)
  L3_525 = nil
  if A1_523.OwnerVar ~= nil then
    L3_525 = A0_522[A1_523.OwnerVar]
  else
    L3_525 = A0_522.Owner
  end
  if A1_523.ScaleVar ~= nil and A1_523.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_524[A1_523.ScaleVar], L3_525)
  else
    SetScaleSkinCoef(A1_523.Scale, L3_525)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_526, A1_527)
  SpellBuffAdd(A0_526[A1_527.TargetVar], A0_526[A1_527.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_526.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_528, A1_529, A2_530)
  local L3_531, L4_532
  L3_531 = A1_529.TargetVar
  L3_531 = A0_528[L3_531]
  L4_532 = A1_529.NumStacks
  if GetParam("NumStacks", A0_528, A1_529) == 0 then
    L4_532 = SpellBuffCount(L3_531, A1_529.BuffName, caster)
  else
    L4_532 = GetParam("NumStacks", A0_528, A1_529)
  end
  while L4_532 > 0 do
    SpellBuffRemove(L3_531, A1_529.BuffName, A0_528[A1_529.AttackerVar])
    L4_532 = L4_532 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_533, A1_534)
  local L2_535, L3_536
  L2_535 = GetParam
  L3_536 = "Unit"
  L2_535 = L2_535(L3_536, A0_533, A1_534)
  unit = L2_535
  L2_535 = unit
  if L2_535 == nil then
    L2_535 = ReportError
    L3_536 = "Could not resolve Unit param"
    L2_535(L3_536)
    return
  end
  L2_535 = true
  L3_536 = GetParam
  L3_536 = L3_536("ChampionToShowTo", A0_533, A1_534)
  if L3_536 == nil then
    L2_535 = false
    L3_536 = GetParam("ChampionToShowToByFlag", A0_533, A1_534)
  end
  if L3_536 == nil then
    ReportError("Could not resolve ChampionToShowTo param")
    return
  end
  SetShowHealthBarToChampion(unit, A1_534.Show, L3_536, L2_535, A1_534.ApplyToSpectator)
end
BBSetShowHealthBarToChampion = L0_0
function L0_0(A0_537, A1_538, A2_539)
  if A0_537.EmoteId == A1_538.EmoteId then
    ExecuteBuildingBlocks(A2_539, A0_537)
    A0_537.LastIfSucceeded = true
  else
    A0_537.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_540, A1_541, A2_542)
  if A0_540.EmoteId ~= A1_541.EmoteId then
    ExecuteBuildingBlocks(A2_542, A0_540)
    A0_540.LastIfSucceeded = true
  else
    A0_540.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_543, A1_544)
  local L2_545, L3_546, L4_547, L5_548
  L2_545 = GetTable
  L3_546 = A0_543
  L4_547 = A1_544.String1VarTable
  L5_548 = false
  L2_545 = L2_545(L3_546, L4_547, L5_548)
  L3_546 = A1_544.String1Var
  L3_546 = L2_545[L3_546]
  L4_547 = GetTable
  L5_548 = A0_543
  L4_547 = L4_547(L5_548, A1_544.String2VarTable, false)
  L5_548 = A1_544.String2Var
  L5_548 = L4_547[L5_548]
  GetTable(A0_543, A1_544.ResultVarTable, false)[A1_544.ResultVar] = L3_546 .. L5_548
end
BBConcatenateStrings = L0_0
function L0_0(A0_549, A1_550)
  local L2_551, L3_552
  L2_551 = GetTable
  L3_552 = A0_549
  L2_551 = L2_551(L3_552, A1_550.VariableVarTable, false)
  L3_552 = A1_550.VariableVar
  L3_552 = L2_551[L3_552]
  GetTable(A0_549, A1_550.ResultVarTable, false)[A1_550.ResultVar] = "(" .. L3_552 .. ")"
end
BBEncaseInParantheses = L0_0
function L0_0(A0_553, A1_554)
  BBGetMinionKills(A0_553, A1_554)
  A0_553.MinionKillSource = GetParam("MinionKillTarget")
  A0_553.MinionKills = A0_553.MinionsKilled + GetParam("MinionKills", A0_553, A1_554)
  BBSetMinionKills(A0_553, A1_554)
end
BBIncreaseMinionKills = L0_0
