local L0_0, L1_1
function L0_0(A0_2, A1_3, A2_4)
  local L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13
  L3_5 = {}
  for L7_9, L8_10 in L4_6(L5_7) do
    L3_5[L7_9] = L8_10
    L9_11 = GetHashedGameObjName
    L10_12 = L7_9
    L9_11 = L9_11(L10_12)
    L3_5[L9_11] = L8_10
  end
  for L7_9, L8_10 in L4_6(L5_7) do
    L9_11 = L8_10.VarTable
    L10_12 = L8_10.Var
    L11_13 = GetTable
    L11_13 = L11_13(A0_2, L9_11, false)
    L3_5[L7_9] = L11_13[L10_12]
    L3_5[GetHashedGameObjName(L7_9)] = L11_13[L10_12]
  end
  L3_5.InstanceVars = L4_6
  L3_5.CharVars = L4_6
  L3_5.NextBuffVars = L4_6
  L3_5.NextSpellVars = L4_6
  L3_5.AvatarVars = L4_6
  L3_5.SpellVars = L4_6
  L3_5.WorldVars = L4_6
  L3_5.Target = L4_6
  L3_5[L4_6] = L5_7
  L3_5.Attacker = L4_6
  L3_5[L4_6] = L5_7
  L3_5.Owner = L4_6
  L3_5[L4_6] = L5_7
  L3_5.FunctionSubBlocks = A2_4
  L3_5.CallerPTP = A0_2
  L3_5.Caster = L4_6
  L3_5.GoldRedirectTarget = L4_6
  L6_8(L7_9, L8_10)
  for L9_11, L10_12 in L6_8(L7_9) do
    L11_13 = L10_12.VarTable
    GetTable2(A0_2, L11_13, true)[L10_12.Var] = L3_5[L9_11]
  end
end
BBExecuteFunction = L0_0
function L0_0(A0_14, A1_15)
  local L2_16, L3_17, L4_18, L5_19, L6_20, L7_21, L8_22
  L2_16 = A0_14.CallerPTP
  L3_17 = A1_15.Exports
  if L3_17 ~= nil then
    for L7_21, L8_22 in L4_18(L5_19) do
      L2_16[L8_22] = A0_14[L8_22]
      L2_16[GetHashedGameObjName(L8_22)] = A0_14[L8_22]
    end
  end
  L4_18(L5_19, L6_20)
end
BBExecuteFunctionSubBlocks = L0_0
function L0_0(A0_23, A1_24)
  local L2_25, L3_26
  L2_25 = GetParam
  L3_26 = "Required"
  L2_25 = L2_25(L3_26, A0_23, A1_24)
  L3_26 = gDebugMode
  if L3_26 ~= nil and L2_25 == nil then
    L3_26 = ALREADY_WARNED
    L3_26 = L3_26[A1_24.RequiredVar]
    if L3_26 == nil then
      L3_26 = A1_24.RequiredVar
      if L3_26 ~= nil then
        L3_26 = A1_24.RequiredVarTable
        if L3_26 == nil then
          L3_26 = "PassThroughParams"
        end
        DebugError("Missing Required Variable: " .. L3_26 .. "." .. A1_24.RequiredVar)
        ALREADY_WARNED[A1_24.RequiredVar] = true
      end
    end
  end
end
BBRequireVar = L0_0
L0_0 = {}
ALREADY_WARNED = L0_0
function L0_0(A0_27, A1_28, A2_29)
  ExecuteBuildingBlocks(A2_29, A0_27)
end
BBCom = L0_0
function L0_0(A0_30, A1_31, A2_32)
  if A1_31.IsConditionTrue(A0_30) then
    ExecuteBuildingBlocks(A2_32, A0_30)
  end
end
BBConditionallyExecute = L0_0
function L0_0(A0_33, A1_34)
  local L2_35, L3_36
  L2_35 = GetTable
  L3_36 = A0_33
  L2_35 = L2_35(L3_36, A1_34.SrcVarTable, false)
  L3_36 = A1_34.ToSay
  L3_36 = L3_36 or ""
  DebugClientPrint(tostring(L3_36) .. ": " .. type(L2_35[A1_34.SrcVar]))
end
BBPrintTypeToChat = L0_0
function L0_0(A0_37, A1_38)
  local L2_39, L3_40, L4_41, L5_42, L6_43
  L2_39 = A1_38.ToSay
  L2_39 = L2_39 or ""
  L3_40 = A1_38.Color
  L3_40 = L3_40 or "FFFFFF"
  L4_41 = GetTable
  L5_42 = A0_37
  L6_43 = A1_38.SrcVarTable
  L4_41 = L4_41(L5_42, L6_43, false)
  L5_42 = A1_38.SrcVar
  L5_42 = L4_41[L5_42]
  L6_43 = "<font color=\""
  L6_43 = L6_43 .. L3_40 .. "\">"
  if L2_39 == "" then
    if A1_38.SrcVarTable ~= nil then
      L6_43 = L6_43 .. "(DEBUG) " .. A1_38.SrcVarTable .. "." .. (A1_38.SrcVar or "")
    else
      L6_43 = L6_43 .. "(DEBUG) " .. (A1_38.SrcVar or "")
    end
  else
    L6_43 = L6_43 .. "(DEBUG) " .. L2_39
  end
  if type(L5_42) ~= "table" and type(L5_42) ~= "nil" then
    L6_43 = L6_43 .. " " .. tostring(L5_42)
  end
  L6_43 = L6_43 .. "</font>"
  DebugClientPrint(L6_43)
  if type(L5_42) == "table" then
    PrintTableToChat(L5_42)
  end
end
BBPrintToChat = L0_0
function L0_0(A0_44, A1_45)
  local L2_46, L3_47
  L2_46 = GetTable
  L3_47 = A0_44
  L2_46 = L2_46(L3_47, A1_45.TableName, true)
  L3_47 = A1_45.TableName
  L3_47 = L3_47 or "PassThroughParams"
  DebugClientPrint(L3_47)
  PrintTableToChat(L2_46)
end
BBPrintTableToChat = L0_0
function L0_0(A0_48, A1_49)
  local L2_50, L3_51, L4_52, L5_53, L6_54, L7_55, L8_56, L9_57, L10_58, L11_59, L12_60, L13_61
  A1_49 = A1_49 or 0
  if A1_49 > 10 then
    return
  end
  L2_50 = nil
  L3_51 = "|"
  for L7_55 = 1, A1_49 do
    L9_57 = "----"
    L3_51 = L8_56 .. L9_57
  end
  L6_54(L7_55)
  for L9_57, L10_58 in L6_54(L7_55) do
    L11_59 = nil
    L12_60 = tostring
    L13_61 = L9_57
    L12_60 = L12_60(L13_61)
    if L12_60 == "PassThroughParams" then
      L11_59 = "{{ PassThroughParams }}"
    else
      L13_61 = type
      L13_61 = L13_61(L10_58)
      if L13_61 == "table" then
        L11_59 = "Table"
      else
        L13_61 = tostring
        L13_61 = L13_61(L10_58)
        L11_59 = L13_61
      end
    end
    L13_61 = L3_51
    L13_61 = L13_61 .. L12_60 .. ": " .. L11_59
    DebugClientPrint(L13_61)
    if type(L10_58) == "table" then
      PrintTableToChat(L10_58, A1_49 + 1)
    end
  end
  L6_54(L7_55)
end
PrintTableToChat = L0_0
function L0_0(A0_62, A1_63)
end
BBDebugPrintToChat = L0_0
function L0_0(A0_64, A1_65)
  local L2_66, L3_67
  L2_66 = GetTable
  L3_67 = A0_64
  L2_66 = L2_66(L3_67, A1_65.TableName, true)
  L3_67 = A1_65.TableName
  L3_67 = L3_67 or "PassThroughParams"
  DebugClientPrint(L3_67)
  DebugPrintTableToChat(L2_66)
end
BBDebugPrintTableToChat = L0_0
function L0_0(A0_68, A1_69)
  local L2_70, L3_71, L4_72, L5_73, L6_74, L7_75, L8_76, L9_77, L10_78, L11_79, L12_80, L13_81
  A1_69 = A1_69 or 0
  if A1_69 > 10 then
    return
  end
  L2_70 = nil
  L3_71 = "|"
  for L7_75 = 1, A1_69 do
    L9_77 = "----"
    L3_71 = L8_76 .. L9_77
  end
  L6_74(L7_75)
  for L9_77, L10_78 in L6_74(L7_75) do
    L11_79 = nil
    L12_80 = tostring
    L13_81 = L9_77
    L12_80 = L12_80(L13_81)
    if L12_80 == "PassThroughParams" then
      L11_79 = "{{ PassThroughParams }}"
    else
      L13_81 = type
      L13_81 = L13_81(L10_78)
      if L13_81 == "table" then
        L11_79 = "Table"
      else
        L13_81 = tostring
        L13_81 = L13_81(L10_78)
        L11_79 = L13_81
      end
    end
    L13_81 = L3_71
    L13_81 = L13_81 .. L12_80 .. ": " .. L11_79
    DebugClientPrint(L13_81)
    if type(L10_78) == "table" then
      DebugPrintTableToChat(L10_78, A1_69 + 1)
    end
  end
  L6_74(L7_75)
end
DebugPrintTableToChat = L0_0
function L0_0(A0_82, A1_83, A2_84)
  local L3_85
  if A1_83 ~= nil then
    L3_85 = A0_82[A1_83]
    if L3_85 == nil and A2_84 then
      A0_82[A1_83] = {}
      return A0_82[A1_83]
    end
  end
  if L3_85 == nil then
    L3_85 = A0_82
  end
  return L3_85
end
GetTable = L0_0
function L0_0(A0_86, A1_87, A2_88)
  local L3_89
  if A1_87 == "PassThroughParams" then
    return A0_86
  end
  if A1_87 ~= nil then
    L3_89 = A0_86[A1_87]
    if L3_89 == nil and A2_88 then
      A0_86[A1_87] = {}
      return A0_86[A1_87]
    end
  end
  if L3_89 == nil then
    L3_89 = A0_86
  end
  return L3_89
end
GetTable2 = L0_0
function L0_0(A0_90, A1_91, A2_92)
  if A2_92[A0_90 .. "Var"] ~= nil and GetTable(A1_91, A2_92[A0_90 .. "VarTable"], false) ~= nil then
    return GetTable(A1_91, A2_92[A0_90 .. "VarTable"], false)[A2_92[A0_90 .. "Var"]]
  else
    return A2_92[A0_90]
  end
end
GetParam = L0_0
function L0_0(A0_93, A1_94)
  GetTable(A0_93, A1_94.DestVarTable, true)[A1_94.DestVar] = {}
end
BBCreateCustomTable = L0_0
function L0_0(A0_95, A1_96)
  GetTable(A0_95, A1_96.TableNameVarTable, false)[A1_96.TableNameVar] = nil
end
BBDestroyCustomTable = L0_0
function L0_0(A0_97, A1_98)
  if type(GetTable(A0_97, A1_98.DestTableVarTable, false)[A1_98.DestTableVar]) == "nil" then
    GetTable(A0_97, A1_98.DestTableVarTable, false)[A1_98.DestTableVar] = {}
  end
  if type(GetTable(A0_97, A1_98.DestTableVarTable, false)[A1_98.DestTableVar]) == "table" then
    GetTable(A0_97, A1_98.DestTableVarTable, false)[A1_98.DestTableVar][GetParam("Key", A0_97, A1_98)] = GetParam("Value", A0_97, A1_98)
  end
end
BBSetKeyValueInCustomTable = L0_0
function L0_0(A0_99, A1_100)
  if type(GetTable(A0_99, A1_100.SrcTableVarTable, false)[A1_100.SrcTableVar]) == "table" then
    GetTable(A0_99, A1_100.DestVarTable, true)[A1_100.DestVar] = GetTable(A0_99, A1_100.SrcTableVarTable, false)[A1_100.SrcTableVar][GetParam("SrcKey", A0_99, A1_100)]
  end
end
BBGetKeyValueInCustomTable = L0_0
function L0_0(A0_101, A1_102)
  local L2_103, L3_104, L4_105
  L2_103 = GetTable
  L3_104 = A0_101
  L4_105 = A1_102.DestTableVarTable
  L2_103 = L2_103(L3_104, L4_105, false)
  L3_104 = GetParam
  L4_105 = "DestIndex"
  L3_104 = L3_104(L4_105, A0_101, A1_102)
  L4_105 = GetParam
  L4_105 = L4_105("Value", A0_101, A1_102)
  if type(L2_103[A1_102.DestTableVar]) == "nil" then
    L2_103[A1_102.DestTableVar] = {}
  end
  if type(L2_103[A1_102.DestTableVar]) == "table" then
    if L3_104 then
      table.insert(L2_103[A1_102.DestTableVar], L3_104, L4_105)
      if A1_102.OutIndexVar then
        GetTable(A0_101, A1_102.OutIndexVarTable, true)[A1_102.OutIndexVar] = L3_104
      end
    else
      table.insert(L2_103[A1_102.DestTableVar], L4_105)
      if A1_102.OutIndexVar then
        GetTable(A0_101, A1_102.OutIndexVarTable, true)[A1_102.OutIndexVar] = table.getn(L2_103[A1_102.DestTableVar])
      end
    end
  end
end
BBInsertIntoInCustomTable = L0_0
function L0_0(A0_106, A1_107)
  local L2_108, L3_109
  L2_108 = GetTable
  L3_109 = A0_106
  L2_108 = L2_108(L3_109, A1_107.TableVarTable, false)
  L3_109 = GetParam
  L3_109 = L3_109("Index", A0_106, A1_107)
  if type(L2_108[A1_107.TableVar]) == "nil" then
    DebugClientPrint("Table specified does not exist: " .. tostring(A1_107.TableVarTable) .. "." .. tostring(A1_107.TableVar))
    return
  end
  if type(L2_108[A1_107.TableVar]) == "table" then
    if GetParam("Key", A0_106, A1_107) then
      L2_108[A1_107.TableVar][GetParam("Key", A0_106, A1_107)] = nil
    elseif L3_109 then
      table.remove(L2_108[A1_107.TableVar], L3_109)
    else
      DebugClientPrint("Specified index/key was nil: " .. tostring(A1_107.IndexVarTable) .. "." .. tostring(A1_107.IndexVar))
    end
  end
end
BBRemoveFromCustomTable = L0_0
function L0_0(A0_110, A1_111, A2_112)
  local L3_113, L4_114, L5_115, L6_116, L7_117, L8_118
  L3_113 = GetTable
  L3_113 = L3_113(L4_114, L5_115, L6_116)
  if L4_114 == "table" then
    if L4_114 then
      for L8_118, _FORV_9_ in L5_115(L6_116) do
        table.insert(L4_114, L8_118)
      end
      L5_115(L6_116)
      for L8_118, _FORV_9_ in L5_115(L6_116) do
        GetTable(A0_110, A1_111.DestKeyVarTable, true)[A1_111.DestKeyVar] = _FORV_9_
        GetTable(A0_110, A1_111.DestValueVarTable, true)[A1_111.DestValueVar] = L3_113[A1_111.TableVar][_FORV_9_]
        ExecuteBuildingBlocks(A2_112, A0_110)
      end
    else
      for L7_117, L8_118 in L4_114(L5_115) do
        GetTable(A0_110, A1_111.DestKeyVarTable, true)[A1_111.DestKeyVar] = L7_117
        GetTable(A0_110, A1_111.DestValueVarTable, true)[A1_111.DestValueVar] = L8_118
        ExecuteBuildingBlocks(A2_112, A0_110)
      end
    end
  end
end
BBForEachInCustomTable = L0_0
function L0_0(A0_119, A1_120)
  local L2_121, L3_122, L4_123, L5_124, L6_125
  L2_121 = GetTable
  L3_122 = A0_119
  L4_123 = A1_120.SrcTableVarTable
  L5_124 = false
  L2_121 = L2_121(L3_122, L4_123, L5_124)
  L3_122 = GetParam
  L4_123 = "Value"
  L5_124 = A0_119
  L6_125 = A1_120
  L3_122 = L3_122(L4_123, L5_124, L6_125)
  L4_123 = GetTable
  L5_124 = A0_119
  L6_125 = A1_120.MatchingKeyVarTable
  L4_123 = L4_123(L5_124, L6_125, false)
  L5_124 = GetTable
  L6_125 = A0_119
  L5_124 = L5_124(L6_125, A1_120.WasFoundVarTable, false)
  L6_125 = A1_120.WasFoundVar
  L5_124[L6_125] = false
  L6_125 = type
  L6_125 = L6_125(L2_121[A1_120.SrcTableVar])
  if L6_125 == "table" then
    L6_125 = GetTable
    L6_125 = L6_125(A0_119, A1_120.DestVarTable, true)
    for _FORV_10_, _FORV_11_ in pairs(L6_125) do
      if _FORV_11_ == L3_122 then
        L5_124[A1_120.WasFoundVar] = true
        L4_123[A1_120.MatchingKeyVar] = _FORV_10_
      end
    end
  end
end
BBCustomTableContainsValue = L0_0
function L0_0(A0_126, A1_127, A2_128)
  for _FORV_9_, _FORV_10_ in pairs(GetTable(A0_126, A1_127.TableVarTable, false)[A1_127.TableVar]) do
  end
  GetTable(A0_126, A1_127.SizeVarTable, false)[A1_127.SizeVar] = 0 + 1
end
BBGetSizeOfCustomTable = L0_0
function L0_0(A0_129, A1_130, A2_131, A3_132)
  local L4_133
  L4_133 = GetParam
  L4_133 = L4_133("Unit", A0_129, A1_130)
  if L4_133 ~= nil then
    A1_130.DestPos = GetPosition(L4_133)
    A1_130.DestPosVar = "__TempDestPos"
    GetTable(A0_129, A1_130.DestPosVarTable, false)[A1_130.DestPosVar] = GetPosition(L4_133)
  end
  A1_130.RegionGroup = A2_131
  BBGetRegionTag(A0_129, A1_130)
  for _FORV_11_, _FORV_12_ in ipairs(A3_132) do
  end
  return true
end
CheckIfUnitOrPointIsInRegionTagList = L0_0
function L0_0(A0_134, A1_135)
  local L2_136, L3_137
  L2_136 = GameplayLane
  L3_137 = {
    LANE_Top_Order,
    LANE_Mid_Order,
    LANE_Bot_Order
  }
  resultTable = GetTable(A0_134, A1_135.ResultVarTable, false)
  resultTable[A1_135.ResultVar] = CheckIfUnitOrPointIsInRegionTagList(A0_134, A1_135, L2_136, L3_137)
end
BBGetIsOrderSide = L0_0
function L0_0(A0_138, A1_139)
  local L2_140, L3_141
  L2_140 = GameplayArea
  L3_141 = {AREA_Jungle_Top, AREA_Jungle_Bot}
  resultTable = GetTable(A0_138, A1_139.ResultVarTable, false)
  resultTable[A1_139.ResultVar] = CheckIfUnitOrPointIsInRegionTagList(A0_138, A1_139, L2_140, L3_141)
end
BBGetIsJungle = L0_0
function L0_0(A0_142, A1_143)
  local L2_144, L3_145
  L2_144 = GameplayArea
  L3_145 = {
    AREA_Lane_Top,
    AREA_Lane_Mid,
    AREA_Lane_Bot
  }
  resultTable = GetTable(A0_142, A1_143.ResultVarTable, false)
  resultTable[A1_143.ResultVar] = CheckIfUnitOrPointIsInRegionTagList(A0_142, A1_143, L2_144, L3_145)
end
BBGetIsLane = L0_0
function L0_0(A0_146, A1_147)
  local L2_148, L3_149
  L2_148 = GameplayArea
  L3_149 = {AREA_River_Top, AREA_River_Bot}
  resultTable = GetTable(A0_146, A1_147.ResultVarTable, false)
  resultTable[A1_147.ResultVar] = CheckIfUnitOrPointIsInRegionTagList(A0_146, A1_147, L2_148, L3_149)
end
BBGetIsRiver = L0_0
function L0_0(A0_150, A1_151)
  local L2_152, L3_153
  L2_152 = GameplayArea
  L3_153 = {AREA_BasePerimeter_Top, AREA_BasePerimeter_Bot}
  resultTable = GetTable(A0_150, A1_151.ResultVarTable, false)
  resultTable[A1_151.ResultVar] = CheckIfUnitOrPointIsInRegionTagList(A0_150, A1_151, L2_152, L3_153)
end
BBGetIsBasePerimeter = L0_0
function L0_0(A0_154, A1_155)
  local L2_156, L3_157, L4_158, L5_159
  L2_156 = GameplayLane
  L3_157 = {L4_158, L5_159}
  L4_158 = LANE_Top_Order
  L5_159 = LANE_Top_Chaos
  L4_158 = {L5_159, LANE_Mid_Chaos}
  L5_159 = LANE_Mid_Order
  L5_159 = {LANE_Bot_Order, LANE_Bot_Chaos}
  if CheckIfUnitOrPointIsInRegionTagList(A0_154, A1_155, L2_156, L3_157) then
  elseif CheckIfUnitOrPointIsInRegionTagList(A0_154, A1_155, L2_156, L4_158) then
  elseif CheckIfUnitOrPointIsInRegionTagList(A0_154, A1_155, L2_156, L5_159) then
  end
  resultTable = GetTable(A0_154, A1_155.ResultVarTable, false)
  resultTable[A1_155.ResultVar] = 0
end
BBGetNearestLane = L0_0
function L0_0(A0_160, A1_161)
  local L2_162, L3_163, L4_164, L5_165, L6_166, L7_167, L8_168, L9_169
  L2_162 = GetParam
  L3_163 = "Unit"
  L4_164 = A0_160
  L5_165 = A1_161
  L2_162 = L2_162(L3_163, L4_164, L5_165)
  L3_163 = GetParam
  L4_164 = "X"
  L5_165 = A0_160
  L6_166 = A1_161
  L3_163 = L3_163(L4_164, L5_165, L6_166)
  L4_164 = GetParam
  L5_165 = "Z"
  L6_166 = A0_160
  L7_167 = A1_161
  L4_164 = L4_164(L5_165, L6_166, L7_167)
  if L2_162 ~= nil then
    L5_165 = GetPosition
    L6_166 = L2_162
    L5_165 = L5_165(L6_166)
    L3_163 = L5_165.x
    L4_164 = L5_165.z
  end
  L5_165 = 2
  L6_166 = 1
  L7_167 = 0
  L8_168 = 4
  L9_169 = 3
  if L4_164 > 12250 then
  elseif L4_164 < 2650 then
  elseif L3_163 > 12250 then
  elseif L3_163 < 2650 then
  elseif L4_164 - L3_163 > 4500 then
  else
  end
  if L4_164 > 13000 then
  elseif L4_164 < 1800 then
  elseif L3_163 > 13000 then
  elseif L3_163 < 1800 then
  elseif L4_164 - L3_163 > 1150 then
  else
  end
  GetTable(A0_160, A1_161.NearLaneVarTable, false)[A1_161.NearLaneVar] = L7_167
  GetTable(A0_160, A1_161.NearSectionVarTable, false)[A1_161.NearSectionVar] = L9_169
  GetTable(A0_160, A1_161.BlueSideVarTable, false)[A1_161.BlueSideVar] = true
end
BBGetLocationHints = L0_0
function L0_0(A0_170, A1_171)
  local L2_172, L3_173, L4_174, L5_175
  L2_172 = GetTable
  L3_173 = A0_170
  L4_174 = A1_171.DestVarTable
  L5_175 = true
  L2_172 = L2_172(L3_173, L4_174, L5_175)
  L3_173 = nil
  L4_174 = GetTable
  L5_175 = A0_170
  L4_174 = L4_174(L5_175, A1_171.SpellSlotVarTable, false)
  L5_175 = A1_171.SpellSlotVar
  if L5_175 ~= nil and L4_174 ~= nil then
    L5_175 = A1_171.SpellSlotVar
    L3_173 = L4_174[L5_175]
  else
    L3_173 = A1_171.SpellSlotValue
  end
  L5_175 = A1_171.Function
  L5_175 = L5_175(A0_170[A1_171.OwnerVar], L3_173, A1_171.SpellbookType, A1_171.SlotType)
  SetVarInTable(A0_170, A1_171, L5_175)
end
BBGetSlotSpellInfo = L0_0
function L0_0(A0_176, A1_177)
  local L2_178, L3_179, L4_180
  L2_178 = GetTable
  L3_179 = A0_176
  L4_180 = A1_177.SrcVarTable
  L2_178 = L2_178(L3_179, L4_180, false)
  L3_179 = nil
  L4_180 = A1_177.SrcVar
  if L4_180 ~= nil and L2_178 ~= nil then
    L4_180 = A1_177.SrcVar
    L3_179 = L2_178[L4_180]
  else
    L3_179 = A1_177.SrcValue
  end
  L4_180 = nil
  if A1_177.SpellSlotVar ~= nil and GetTable(A0_176, A1_177.SpellSlotVarTable, false) ~= nil then
    L4_180 = GetTable(A0_176, A1_177.SpellSlotVarTable, false)[A1_177.SpellSlotVar]
  else
    L4_180 = A1_177.SpellSlotValue
  end
  SetSlotSpellCooldownTime(A0_176[A1_177.OwnerVar], L4_180, A1_177.SpellbookType, A1_177.SlotType, L3_179)
end
BBSetSlotSpellCooldownTime = L0_0
function L0_0(A0_181, A1_182)
  if A0_181.Level ~= nil and A1_182.SrcValueByLevel ~= nil then
    A0_181.ReturnValue = A1_182.SrcValueByLevel[A0_181.Level]
  elseif A1_182.SrcVar ~= nil and GetTable(A0_181, A1_182.SrcVarTable, false) ~= nil then
    A0_181.ReturnValue = GetTable(A0_181, A1_182.SrcVarTable, false)[A1_182.SrcVar]
  else
    A0_181.ReturnValue = A1_182.SrcValue
  end
end
BBSetReturnValue = L0_0
function L0_0(A0_183, A1_184)
  A0_183.ReturnValue = true
end
BBCancelOrderBeforeIssued = L0_0
function L0_0(A0_185, A1_186)
  if type(A0_185) == "string" and type(A1_186) == "string" then
    A0_185 = string.lower(A0_185)
    A1_186 = string.lower(A1_186)
  end
  return A0_185 == A1_186
end
CO_EQUAL = L0_0
function L0_0(A0_187, A1_188)
  if type(A0_187) == "string" and type(A1_188) == "string" then
    A0_187 = string.lower(A0_187)
    A1_188 = string.lower(A1_188)
  end
  return A0_187 ~= A1_188
end
CO_NOT_EQUAL = L0_0
function L0_0(A0_189, A1_190)
  local L2_191
  L2_191 = A0_189 < A1_190
  return L2_191
end
CO_LESS_THAN = L0_0
function L0_0(A0_192, A1_193)
  local L2_194
  L2_194 = A1_193 < A0_192
  return L2_194
end
CO_GREATER_THAN = L0_0
function L0_0(A0_195, A1_196)
  local L2_197
  L2_197 = A0_195 <= A1_196
  return L2_197
end
CO_LESS_THAN_OR_EQUAL = L0_0
function L0_0(A0_198, A1_199)
  local L2_200
  L2_200 = A1_199 <= A0_198
  return L2_200
end
CO_GREATER_THAN_OR_EQUAL = L0_0
function L0_0(A0_201, A1_202)
  return GetTeamID(A0_201) == GetTeamID(A1_202)
end
CO_SAME_TEAM = L0_0
function L0_0(A0_203, A1_204)
  return GetTeamID(A0_203) ~= GetTeamID(A1_204)
end
CO_DIFFERENT_TEAM = L0_0
function L0_0(A0_205, A1_206)
  return GetSourceType() == A1_206 or GetSourceType() == A0_205
end
CO_DAMAGE_SOURCETYPE_IS = L0_0
function L0_0(A0_207, A1_208)
  return GetSourceType() ~= A1_208 and GetSourceType() ~= A0_207
end
CO_DAMAGE_SOURCETYPE_IS_NOT = L0_0
function L0_0(A0_209)
  return IsObjectAI(A0_209)
end
CO_IS_TYPE_AI = L0_0
function L0_0(A0_210)
  return IsObjectAI(A0_210) ~= true
end
CO_IS_NOT_AI = L0_0
function L0_0(A0_211)
  return IsObjectHero(A0_211)
end
CO_IS_TYPE_HERO = L0_0
function L0_0(A0_212)
  return IsObjectHero(A0_212) ~= true
end
CO_IS_NOT_HERO = L0_0
function L0_0(A0_213)
  return IsObjectMarker(A0_213)
end
CO_IS_TYPE_MARKER = L0_0
function L0_0(A0_214)
  return IsObjectMarker(A0_214) ~= true
end
CO_IS_NOT_MARKER = L0_0
function L0_0(A0_215)
  return IsClone(A0_215)
end
CO_IS_CLONE = L0_0
function L0_0(A0_216)
  return IsClone(A0_216) ~= true
end
CO_IS_NOT_CLONE = L0_0
function L0_0(A0_217)
  return IsMelee(A0_217)
end
CO_IS_MELEE = L0_0
function L0_0(A0_218)
  return IsMelee(A0_218) ~= true
end
CO_IS_RANGED = L0_0
function L0_0(A0_219)
  return A0_219 > math.random()
end
CO_RANDOM_CHANCE_LESS_THAN = L0_0
function L0_0(A0_220)
  return IsTurretAI(A0_220)
end
CO_IS_TYPE_TURRET = L0_0
function L0_0(A0_221)
  return IsTurretAI(A0_221) ~= true
end
CO_IS_NOT_TURRET = L0_0
function L0_0(A0_222)
  return IsDampener(A0_222)
end
CO_IS_TYPE_INHIBITOR = L0_0
function L0_0(A0_223)
  return IsDampener(A0_223) ~= true
end
CO_IS_NOT_INHIBITOR = L0_0
function L0_0(A0_224)
  return IsHQ(A0_224)
end
CO_IS_TYPE_NEXUS = L0_0
function L0_0(A0_225)
  return IsHQ(A0_225) ~= true
end
CO_IS_NOT_NEXUS = L0_0
function L0_0(A0_226)
  return IsDead(A0_226)
end
CO_IS_DEAD = L0_0
function L0_0(A0_227)
  return IsDead(A0_227) ~= true
end
CO_IS_NOT_DEAD = L0_0
function L0_0(A0_228)
  return IsDeadOrZombie(A0_228)
end
CO_IS_DEAD_OR_ZOMBIE = L0_0
function L0_0(A0_229)
  return IsDeadOrZombie(A0_229) ~= true
end
CO_IS_NEITHER_DEAD_NOR_ZOMBIE = L0_0
function L0_0(A0_230, A1_231)
  return BBIsTargetInFrontOfMe(A0_230, A1_231)
end
CO_IS_TARGET_IN_FRONT_OF_ME = L0_0
function L0_0(A0_232, A1_233)
  return BBIsTargetBehindMe(A0_232, A1_233)
end
CO_IS_TARGET_BEHIND_ME = L0_0
function L0_0(A0_234)
  return IsWard(A0_234)
end
CO_IS_WARD = L0_0
function L0_0(A0_235)
  return IsWard(A0_235) ~= true
end
CO_IS_NOT_WARD = L0_0
function L0_0(A0_236)
  return IsStructure(A0_236)
end
CO_IS_STRUCTURE = L0_0
function L0_0(A0_237)
  return IsStructure(A0_237) ~= true
end
CO_IS_NOT_STRUCTURE = L0_0
function L0_0(A0_238)
  local L1_239
  L1_239 = A0_238 ~= nil
  return L1_239
end
CO_IS_NOT_NIL = L0_0
function L0_0(A0_240, A1_241, A2_242)
  GetTable(A0_240, A1_241.MacroVarTable, true)[A1_241.MacroVar] = A2_242
end
BBCreateMacro = L0_0
function L0_0(A0_243, A1_244)
  local L2_245
  L2_245 = GetParam
  L2_245 = L2_245("Macro", A0_243, A1_244)
  if L2_245 ~= nil and type(L2_245) == "table" then
    ExecuteBuildingBlocks(L2_245, A0_243)
  else
    DebugError("Designer Error: Macro variable is not initialized inside of event. Macro Variable was: " .. tostring(A1_244.MacroVar) .. ". This error probably occurred due to variable not being initialized yet, being misnamed or two events being called out of sequence. It is highly recommended that script macros either be initialized OnBuffActivate, OnCharActivate or in the same event. Pro Devs may violate this rule at the risk of being forced to read this error message again.")
  end
end
BBRunMacro = L0_0
function L0_0(A0_246, A1_247, A2_248)
  local L3_249, L4_250, L5_251, L6_252, L7_253, L8_254
  L3_249 = GetTable
  L3_249 = L3_249(L4_250, L5_251, L6_252)
  L3_249[L4_250] = A2_248
  if L4_250 == nil then
    A2_248.InPerBlockParams = A1_247
    for L7_253 = 1, 6 do
      L8_254 = "FunctionParameter"
      L8_254 = L8_254 .. L7_253 .. "Var"
      if A1_247[L8_254 .. "Table"] ~= nil then
        DebugError("Designer Error: CreateFunction can only input parameters to PassThroughParams.")
      end
    end
  end
end
BBCreateFunction = L0_0
function L0_0(A0_255, A1_256)
  local L2_257, L3_258, L4_259, L5_260, L6_261
  for L5_260 = 1, 6 do
    L6_261 = "FunctionOutput"
    L6_261 = L6_261 .. L5_260 .. "Var"
    if A1_256[L6_261] ~= nil and A1_256[L6_261] ~= "" then
      if A1_256[L6_261 .. "Table"] ~= nil then
        DebugError("Designer Error: EndFunction can only output from PassThroughParams.")
      else
        A0_255[L6_261] = A0_255[A1_256[L6_261]]
      end
    end
  end
end
BBEndFunction = L0_0
function L0_0(A0_262, A1_263)
  local L2_264, L3_265, L4_266, L5_267, L6_268, L7_269, L8_270, L9_271
  L2_264 = GetParam
  L3_265 = "Function"
  L2_264 = L2_264(L3_265, L4_266, L5_267)
  L3_265 = {}
  L3_265.InstanceVars = L4_266
  L3_265.CharVars = L4_266
  L3_265.NextBuffVars = L4_266
  L3_265.NextSpellVars = L4_266
  L3_265.AvatarVars = L4_266
  L3_265.SpellVars = L4_266
  L3_265.WorldVars = L4_266
  L3_265.Target = L4_266
  L3_265[L4_266] = L5_267
  L3_265.Attacker = L4_266
  L3_265[L4_266] = L5_267
  L3_265.Owner = L4_266
  L3_265[L4_266] = L5_267
  L3_265.Caster = L4_266
  L3_265.GoldRedirectTarget = L4_266
  L3_265.Unit = L4_266
  L3_265.Other1 = L4_266
  L3_265.Other2 = L4_266
  L3_265.Other3 = L4_266
  L3_265.Nothing = L4_266
  if L2_264 ~= nil then
    if L4_266 == "table" then
      if L4_266 ~= nil then
        for L8_270 = 1, 6 do
          L9_271 = "FunctionParameter"
          L9_271 = L9_271 .. L8_270 .. "Var"
          if A1_263[L9_271] ~= nil and A1_263[L9_271] ~= "" and L4_266[L9_271] ~= nil and L4_266[L9_271] ~= "" then
            L3_265[L4_266[L9_271]] = GetTable(A0_262, A1_263[L9_271 .. "Table"], false)[A1_263[L9_271]]
          end
        end
      end
      L4_266(L5_267, L6_268)
      for L7_269 = 1, 6 do
        L8_270 = "FunctionOutput"
        L9_271 = L7_269
        L8_270 = L8_270 .. L9_271 .. "Var"
        L9_271 = A1_263[L8_270]
        if L9_271 ~= nil then
          L9_271 = A1_263[L8_270]
          if L9_271 ~= "" then
            L9_271 = L3_265
            GetTable(A0_262, A1_263[L8_270 .. "Table"], false)[A1_263[L8_270]] = L9_271[L8_270]
          end
        end
      end
    end
  else
    L4_266(L5_267)
  end
end
BBRunFunction = L0_0
function L0_0(A0_272, A1_273, A2_274)
  local L3_275, L4_276, L5_277, L6_278
  L3_275 = GetTable
  L4_276 = A0_272
  L5_277 = A1_273.Src1VarTable
  L6_278 = false
  L3_275 = L3_275(L4_276, L5_277, L6_278)
  L4_276 = GetTable
  L5_277 = A0_272
  L6_278 = A1_273.Src2VarTable
  L4_276 = L4_276(L5_277, L6_278, false)
  L5_277 = false
  L6_278 = nil
  if L3_275 ~= nil and A1_273.Src1Var ~= nil then
    L6_278 = L3_275[A1_273.Src1Var]
  else
    L6_278 = A1_273.Value1
  end
  if L4_276 ~= nil and A1_273.Src2Var ~= nil then
    L5_277 = A1_273.CompareOp(L6_278, L4_276[A1_273.Src2Var])
  else
    L5_277 = A1_273.CompareOp(L6_278, A1_273.Value2)
  end
  if L5_277 then
    ExecuteBuildingBlocks(A2_274, A0_272)
    A0_272.LastIfSucceeded = true
  else
    A0_272.LastIfSucceeded = false
  end
end
BBIf = L0_0
function L0_0(A0_279, A1_280, A2_281)
  if A0_279.LastIfSucceeded == false then
    BBIf(A0_279, A1_280, A2_281)
  end
end
BBElseIf = L0_0
function L0_0(A0_282, A1_283, A2_284)
  if A0_282.LastIfSucceeded == true then
    BBIf(A0_282, A1_283, A2_284)
  end
end
BBAndIf = L0_0
function L0_0(A0_285, A1_286, A2_287)
  if A0_285.LastIfSucceeded == true then
    ExecuteBuildingBlocks(A2_287, A0_285)
    A0_285.LastIfSucceeded = true
  else
    BBIf(A0_285, A1_286, A2_287)
  end
end
BBOrIf = L0_0
function L0_0(A0_288, A1_289, A2_290)
  if A0_288.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_290, A0_288)
    A0_288.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_291, A1_292, A2_293)
  local L3_294
  if A1_292.TargetVar ~= nil then
    L3_294 = A0_291[A1_292.TargetVar]
  else
    L3_294 = A0_291.Target
  end
  if HasBuffOfType(L3_294, A1_292.BuffType) then
    ExecuteBuildingBlocks(A2_293, A0_291)
    A0_291.LastIfSucceeded = true
  else
    A0_291.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_295, A1_296, A2_297)
  if A0_295.LastIfSucceeded == false then
    BBIfHasBuffOfType(A0_295, A1_296, A2_297)
  end
end
BBElseIfHasBuffOfType = L0_0
function L0_0(A0_298, A1_299, A2_300)
  if A0_298.LastIfSucceeded == true then
    BBIfHasBuffOfType(A0_298, A1_299, A2_300)
  end
end
BBAndIfHasBuffOfType = L0_0
function L0_0(A0_301, A1_302, A2_303)
  if A0_301.LastIfSucceeded == true then
    ExecuteBuildingBlocks(A2_303, A0_301)
    A0_301.LastIfSucceeded = true
  else
    BBIfHasBuffOfType(A0_301, A1_302, A2_303)
  end
end
BBOrIfHasBuffOfType = L0_0
function L0_0(A0_304, A1_305, A2_306)
  local L3_307, L4_308
  L4_308 = A1_305.TargetVar
  if L4_308 ~= nil then
    L4_308 = A1_305.TargetVar
    L3_307 = A0_304[L4_308]
  else
    L3_307 = A0_304.Target
  end
  L4_308 = GetParam
  L4_308 = L4_308("Team", A0_304, A1_305)
  if HasBuffOfTypeFromTeam(L3_307, A1_305.BuffType, L4_308) then
    ExecuteBuildingBlocks(A2_306, A0_304)
    A0_304.LastIfSucceeded = true
  else
    A0_304.LastIfSucceeded = false
  end
end
BBIfHasBuffOfTypeFromTeam = L0_0
function L0_0(A0_309, A1_310, A2_311)
  if A0_309.LastIfSucceeded == false then
    BBIfHasBuffOfTypeFromTeam(A0_309, A1_310, A2_311)
  end
end
BBElseIfHasBuffOfTypeFromTeam = L0_0
function L0_0(A0_312, A1_313, A2_314)
  if A0_312.LastIfSucceeded == true then
    BBIfHasBuffOfTypeFromTeam(A0_312, A1_313, A2_314)
  end
end
BBAndIfHasBuffOfTypeFromTeam = L0_0
function L0_0(A0_315, A1_316, A2_317)
  if A0_315.LastIfSucceeded == true then
    ExecuteBuildingBlocks(A2_317, A0_315)
    A0_315.LastIfSucceeded = true
  else
    BBIfHasBuffOfTypeFromTeam(A0_315, A1_316, A2_317)
  end
end
BBOrIfHasBuffOfTypeFromTeam = L0_0
function L0_0(A0_318, A1_319, A2_320)
  local L3_321, L4_322, L5_323
  L5_323 = GetParam
  L5_323 = L5_323("BuffName", A0_318, A1_319)
  if A1_319.OwnerVar ~= nil then
    L3_321 = A0_318[A1_319.OwnerVar]
  else
    L3_321 = A0_318.Owner
  end
  if A1_319.AttackerVar ~= nil then
    L4_322 = A0_318[A1_319.AttackerVar]
  else
    L4_322 = A0_318.Attacker
  end
  if SpellBuffCount(L3_321, L5_323, L4_322) > 0 then
    ExecuteBuildingBlocks(A2_320, A0_318)
    A0_318.LastIfSucceeded = true
  else
    A0_318.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_324, A1_325, A2_326)
  if A0_324.LastIfSucceeded == false then
    BBIfHasBuff(A0_324, A1_325, A2_326)
  end
end
BBElseIfHasBuff = L0_0
function L0_0(A0_327, A1_328, A2_329)
  if A0_327.LastIfSucceeded == true then
    BBIfHasBuff(A0_327, A1_328, A2_329)
  end
end
BBAndIfHasBuff = L0_0
function L0_0(A0_330, A1_331, A2_332)
  if A0_330.LastIfSucceeded == true then
    ExecuteBuildingBlocks(A2_332, A0_330)
    A0_330.LastIfSucceeded = true
  else
    BBIfHasBuff(A0_330, A1_331, A2_332)
  end
end
BBOrIfHasBuff = L0_0
function L0_0(A0_333, A1_334, A2_335)
  if BBIsMissileAutoAttack(A0_333, A1_334) then
    ExecuteBuildingBlocks(A2_335, A0_333)
    A0_333.LastIfSucceeded = true
  else
    A0_333.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_336, A1_337, A2_338)
  if A0_336.LastIfSucceeded == false then
    BBIfMissileIsAutoAttack(A0_336, A1_337, A2_338)
  end
end
BBElseIfMissileIsAutoAttack = L0_0
function L0_0(A0_339, A1_340, A2_341)
  if A0_339.LastIfSucceeded == true then
    BBIfMissileIsAutoAttack(A0_339, A1_340, A2_341)
  end
end
BBAndIfMissileIsAutoAttack = L0_0
function L0_0(A0_342, A1_343, A2_344)
  if A0_342.LastIfSucceeded == true then
    ExecuteBuildingBlocks(A2_344, A0_342)
    A0_342.LastIfSucceeded = true
  else
    BBIfMissileIsAutoAttack(A0_342, A1_343, A2_344)
  end
end
BBOrIfMissileIsAutoAttack = L0_0
function L0_0(A0_345, A1_346, A2_347)
  if BBIsMissileConsideredAsAutoAttack(A0_345, A1_346) then
    ExecuteBuildingBlocks(A2_347, A0_345)
    A0_345.LastIfSucceeded = true
  else
    A0_345.LastIfSucceeded = false
  end
end
BBIfMissileConsideredAsAutoAttack = L0_0
function L0_0(A0_348, A1_349, A2_350)
  if A0_348.LastIfSucceeded == false then
    BBIfMissileConsideredAsAutoAttack(A0_348, A1_349, A2_350)
  end
end
BBElseIfMissileConsideredAsAutoAttack = L0_0
function L0_0(A0_351, A1_352, A2_353)
  if A0_351.LastIfSucceeded == true then
    BBIfMissileConsideredAsAutoAttack(A0_351, A1_352, A2_353)
  end
end
BBAndIfMissileConsideredAsAutoAttack = L0_0
function L0_0(A0_354, A1_355, A2_356)
  if A0_354.LastIfSucceeded == true then
    ExecuteBuildingBlocks(A2_356, A0_354)
    A0_354.LastIfSucceeded = true
  else
    BBIfMissileConsideredAsAutoAttack(A0_354, A1_355, A2_356)
  end
end
BBOrIfMissileConsideredAsAutoAttack = L0_0
function L0_0(A0_357, A1_358, A2_359)
  if A0_357.LastIfSucceeded == false then
    BBIfLineSegmentIntersectsLineSegment(A0_357, A1_358, A2_359)
  end
end
BBElseIfLineSegmentIntersectsLineSegment = L0_0
function L0_0(A0_360, A1_361, A2_362)
  if A0_360.LastIfSucceeded == true then
    BBIfLineSegmentIntersectsLineSegment(A0_360, A1_361, A2_362)
  end
end
BBAndIfLineSegmentIntersectsLineSegment = L0_0
function L0_0(A0_363, A1_364, A2_365)
  if A0_363.LastIfSucceeded == true then
    ExecuteBuildingBlocks(A2_365, A0_363)
    A0_363.LastIfSucceeded = true
  else
    BBIfLineSegmentIntersectsLineSegment(A0_363, A1_364, A2_365)
  end
end
BBOrIfLineSegmentIntersectsLineSegment = L0_0
function L0_0(A0_366, A1_367, A2_368)
  if A0_366.LastIfSucceeded == false then
    BBIfLineSegmentIntersectsCircle(A0_366, A1_367, A2_368)
  end
end
BBElseIfLineSegmentIntersectsCircle = L0_0
function L0_0(A0_369, A1_370, A2_371)
  if A0_369.LastIfSucceeded == true then
    BBIfLineSegmentIntersectsCircle(A0_369, A1_370, A2_371)
  end
end
BBAndIfLineSegmentIntersectsCircle = L0_0
function L0_0(A0_372, A1_373, A2_374)
  if A0_372.LastIfSucceeded == true then
    ExecuteBuildingBlocks(A2_374, A0_372)
    A0_372.LastIfSucceeded = true
  else
    BBIfLineSegmentIntersectsCircle(A0_372, A1_373, A2_374)
  end
end
BBOrIfLineSegmentIntersectsCircle = L0_0
function L0_0(A0_375, A1_376)
  A0_375.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_377, A1_378, A2_379)
  local L3_380, L4_381
  if A1_378.OwnerVar ~= nil then
    L3_380 = A0_377[A1_378.OwnerVar]
  else
    L3_380 = A0_377.Owner
  end
  if A1_378.CasterVar ~= nil then
    L4_381 = A0_377[A1_378.CasterVar]
  else
    L4_381 = A0_377.Caster
  end
  if SpellBuffCount(L3_380, A1_378.BuffName, L4_381) <= 0 then
    ExecuteBuildingBlocks(A2_379, A0_377)
    A0_377.LastIfSucceeded = true
  else
    A0_377.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_382, A1_383, A2_384)
  if A0_382.LastIfSucceeded == false then
    BBIfNotHasBuff(A0_382, A1_383, A2_384)
  end
end
BBElseIfNotHasBuff = L0_0
function L0_0(A0_385, A1_386, A2_387)
  if A0_385.LastIfSucceeded == true then
    BBIfNotHasBuff(A0_385, A1_386, A2_387)
  end
end
BBAndIfNotHasBuff = L0_0
function L0_0(A0_388, A1_389, A2_390)
  if A0_388.LastIfSucceeded == true then
    ExecuteBuildingBlocks(A2_390, A0_388)
    A0_388.LastIfSucceeded = true
  else
    BBIfNotHasBuff(A0_388, A1_389, A2_390)
  end
end
BBOrIfNotHasBuff = L0_0
function L0_0(A0_391, A1_392, A2_393)
  local L3_394
  if A1_392.TargetVar ~= nil then
    L3_394 = A0_391[A1_392.TargetVar]
  else
    L3_394 = A0_391.Owner
  end
  if HasUnitTag(L3_394, A1_392.UnitTag) ~= A1_392.InvertResult then
    ExecuteBuildingBlocks(A2_393, A0_391)
    A0_391.LastIfSucceeded = true
  else
    A0_391.LastIfSucceeded = false
  end
end
BBIfHasUnitTag = L0_0
function L0_0(A0_395, A1_396, A2_397)
  if A0_395.LastIfSucceeded == false then
    BBIfHasUnitTag(A0_395, A1_396, A2_397)
  end
end
BBElseIfHasUnitTag = L0_0
function L0_0(A0_398, A1_399, A2_400)
  if A0_398.LastIfSucceeded == true then
    BBIfHasUnitTag(A0_398, A1_399, A2_400)
  end
end
BBAndIfHasUnitTag = L0_0
function L0_0(A0_401, A1_402, A2_403)
  if A0_401.LastIfSucceeded == true then
    ExecuteBuildingBlocks(A2_403, A0_401)
    A0_401.LastIfSucceeded = true
  else
    BBIfHasUnitTag(A0_401, A1_402, A2_403)
  end
end
BBOrIfHasUnitTag = L0_0
function L0_0(A0_404, A1_405, A2_406)
  local L3_407, L4_408
  L4_408 = A1_405.OwnerVar
  if L4_408 ~= nil then
    L4_408 = A1_405.OwnerVar
    L3_407 = A0_404[L4_408]
  else
    L3_407 = A0_404.Owner
  end
  L4_408 = GetParam
  L4_408 = L4_408("SpellSlot", A0_404, A1_405)
  if HasSpellTag(L3_407, L4_408, A1_405.SpellbookType, A1_405.SlotType, A1_405.SpellTag) ~= A1_405.InvertResult then
    ExecuteBuildingBlocks(A2_406, A0_404)
    A0_404.LastIfSucceeded = true
  else
    A0_404.LastIfSucceeded = false
  end
end
BBIfHasSpellTag = L0_0
function L0_0(A0_409, A1_410, A2_411)
  if A0_409.LastIfSucceeded == false then
    BBIfHasSpellTag(A0_409, A1_410, A2_411)
  end
end
BBElseIfHasSpellTag = L0_0
function L0_0(A0_412, A1_413, A2_414)
  if A0_412.LastIfSucceeded == true then
    BBIfHasSpellTag(A0_412, A1_413, A2_414)
  end
end
BBAndIfHasSpellTag = L0_0
function L0_0(A0_415, A1_416, A2_417)
  if A0_415.LastIfSucceeded == true then
    ExecuteBuildingBlocks(A2_417, A0_415)
    A0_415.LastIfSucceeded = true
  else
    BBIfHasSpellTag(A0_415, A1_416, A2_417)
  end
end
BBOrIfHasSpellTag = L0_0
function L0_0(A0_418, A1_419, A2_420)
  local L3_421, L4_422
  if A1_419.OwnerVar ~= nil then
    L3_421 = A0_418[A1_419.OwnerVar]
  else
    L3_421 = A0_418.Owner
  end
  if HasPARType(L3_421, A1_419.PARType) then
    ExecuteBuildingBlocks(A2_420, A0_418)
    A0_418.LastIfSucceeded = true
  else
    A0_418.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_423, A1_424, A2_425)
  if A0_423.LastIfSucceeded == false then
    BBIfPARTypeEquals(A0_423, A1_424, A2_425)
  end
end
BBElseIfPARTypeEquals = L0_0
function L0_0(A0_426, A1_427, A2_428)
  if A0_426.LastIfSucceeded == true then
    BBIfPARTypeEquals(A0_426, A1_427, A2_428)
  end
end
BBAndIfPARTypeEquals = L0_0
function L0_0(A0_429, A1_430, A2_431)
  if A0_429.LastIfSucceeded == true then
    ExecuteBuildingBlocks(A2_431, A0_429)
    A0_429.LastIfSucceeded = true
  else
    BBIfPARTypeEquals(A0_429, A1_430, A2_431)
  end
end
BBOrIfPARTypeEquals = L0_0
function L0_0(A0_432, A1_433, A2_434)
  local L3_435, L4_436
  if A1_433.OwnerVar ~= nil then
    L3_435 = A0_432[A1_433.OwnerVar]
  else
    L3_435 = A0_432.Owner
  end
  if not HasPARType(L3_435, A1_433.PARType) then
    ExecuteBuildingBlocks(A2_434, A0_432)
    A0_432.LastIfSucceeded = true
  else
    A0_432.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_437, A1_438, A2_439)
  if A0_437.LastIfSucceeded == false then
    BBIfPARTypeNotEquals(A0_437, A1_438, A2_439)
  end
end
BBElseIfPARTypeNotEquals = L0_0
function L0_0(A0_440, A1_441, A2_442)
  if A0_440.LastIfSucceeded == true then
    BBIfPARTypeNotEquals(A0_440, A1_441, A2_442)
  end
end
BBAndIfPARTypeNotEquals = L0_0
function L0_0(A0_443, A1_444, A2_445)
  if A0_443.LastIfSucceeded == true then
    ExecuteBuildingBlocks(A2_445, A0_443)
    A0_443.LastIfSucceeded = true
  else
    BBIfPARTypeNotEquals(A0_443, A1_444, A2_445)
  end
end
BBOrIfPARTypeNotEquals = L0_0
function L0_0(A0_446, A1_447, A2_448)
  local L3_449, L4_450, L5_451, L6_452, L7_453
  L3_449 = GetTable
  L4_450 = A0_446
  L5_451 = A1_447.Src1VarTable
  L6_452 = false
  L3_449 = L3_449(L4_450, L5_451, L6_452)
  L4_450 = GetTable
  L5_451 = A0_446
  L6_452 = A1_447.Src2VarTable
  L7_453 = false
  L4_450 = L4_450(L5_451, L6_452, L7_453)
  L5_451 = true
  while L5_451 do
    L6_452 = false
    L7_453 = nil
    if L3_449 ~= nil and A1_447.Src1Var ~= nil then
      L7_453 = L3_449[A1_447.Src1Var]
    else
      L7_453 = A1_447.Value1
    end
    if L4_450 ~= nil and A1_447.Src2Var ~= nil then
      L6_452 = A1_447.CompareOp(L7_453, L4_450[A1_447.Src2Var])
    else
      L6_452 = A1_447.CompareOp(L7_453, A1_447.Value2)
    end
    if L6_452 then
      ExecuteBuildingBlocks(A2_448, A0_446)
    else
      L5_451 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_454, A1_455, A2_456)
  local L3_457, L4_458, L5_459
  L3_457 = GetParam
  L4_458 = "Start"
  L5_459 = A0_454
  L3_457 = L3_457(L4_458, L5_459, A1_455)
  L4_458 = GetParam
  L5_459 = "End"
  L4_458 = L4_458(L5_459, A0_454, A1_455)
  L5_459 = L3_457
  while L4_458 >= L5_459 do
    SetVarInTable(A0_454, A1_455, L5_459)
    ExecuteBuildingBlocks(A2_456, A0_454)
    L5_459 = L5_459 + 1
  end
end
BBFor = L0_0
function L0_0(A0_460, A1_461)
  return A0_460 * A1_461
end
MO_MULTIPLY = L0_0
function L0_0(A0_462, A1_463)
  return A0_462 + A1_463
end
MO_ADD = L0_0
function L0_0(A0_464, A1_465)
  return A0_464 - A1_465
end
MO_SUBTRACT = L0_0
function L0_0(A0_466, A1_467)
  return A0_466 / A1_467
end
MO_DIVIDE = L0_0
function L0_0(A0_468, A1_469)
  return math.floor(A0_468 / A1_469)
end
MO_INT_DIVIDE = L0_0
function L0_0(A0_470, A1_471)
  if A0_470 < A1_471 then
    return A0_470
  else
    return A1_471
  end
end
MO_MIN = L0_0
function L0_0(A0_472, A1_473)
  if A1_473 < A0_472 then
    return A0_472
  else
    return A1_473
  end
end
MO_MAX = L0_0
function L0_0(A0_474, A1_475)
  return A0_474 % A1_475
end
MO_MODULO = L0_0
function L0_0(A0_476)
  return math.floor(A0_476 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_477)
  return math.ceil(A0_477)
end
MO_ROUNDUP = L0_0
function L0_0(A0_478)
  return math.floor(A0_478)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_479)
  return math.sin(math.rad(A0_479))
end
MO_SIN = L0_0
function L0_0(A0_480)
  return math.cos(math.rad(A0_480))
end
MO_COSINE = L0_0
function L0_0(A0_481)
  return math.tan(math.rad(A0_481))
end
MO_TANGENT = L0_0
function L0_0(A0_482)
  return math.deg(math.asin(A0_482))
end
MO_ASIN = L0_0
function L0_0(A0_483)
  return math.deg(math.acos(A0_483))
end
MO_ACOS = L0_0
function L0_0(A0_484)
  return math.deg(math.atan(A0_484))
end
MO_ATAN = L0_0
function L0_0(A0_485, A1_486)
  return math.pow(A0_485, A1_486)
end
MO_POW = L0_0
function L0_0(A0_487)
  return math.sqrt(A0_487)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_488, A1_489)
  local L2_490
  L2_490 = A0_488 and A1_489
  return L2_490
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_491, A1_492)
  local L2_493
  L2_493 = A0_491 or A1_492
  return L2_493
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_494)
  local L1_495
  L1_495 = not A0_494
  return L1_495
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_496)
  return math.abs(A0_496)
end
MO_ABS = L0_0
function L0_0(A0_497, A1_498)
  return math.random(A0_497, A1_498)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_499, A1_500)
  local L2_501, L3_502, L4_503, L5_504
  L2_501 = GetMathNumber
  L3_502 = A0_499
  L4_503 = A1_500.Src1VarTable
  L5_504 = A1_500.Src1Var
  L2_501 = L2_501(L3_502, L4_503, L5_504, A1_500.Src1Value)
  L3_502 = GetMathNumber
  L4_503 = A0_499
  L5_504 = A1_500.Src2VarTable
  L3_502 = L3_502(L4_503, L5_504, A1_500.Src2Var, A1_500.Src2Value)
  L4_503 = GetTable
  L5_504 = A0_499
  L4_503 = L4_503(L5_504, A1_500.DestVarTable)
  L5_504 = A1_500.MathOp
  L5_504 = L5_504(L2_501, L3_502)
  SetVarInTable(A0_499, A1_500, L5_504)
end
BBMath = L0_0
function L0_0(A0_505, A1_506, A2_507, A3_508)
  if A2_507 ~= nil and GetTable(A0_505, A1_506)[A2_507] ~= nil then
    return GetTable(A0_505, A1_506)[A2_507]
  end
  return A3_508
end
GetMathNumber = L0_0
function L0_0(A0_509, A1_510)
  if type(A1_510) == "number" then
    return A1_510
  elseif type(A1_510) == "function" then
    return A1_510(A0_509)
  elseif type(A1_510) == "string" then
    return A0_509[A1_510]
  end
end
GetNumber = L0_0
function L0_0(A0_511, A1_512)
  return VectorAdd(A0_511, A1_512)
end
VEC_ADD = L0_0
function L0_0(A0_513, A1_514)
  return VectorSubtract(A0_513, A1_514)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_515, A1_516)
  return VectorScalarMultiply(A0_515, A1_516)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_517, A1_518)
  return VectorScalarDivide(A0_517, A1_518)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_519, A1_520)
  return VectorRotateY(A0_519, A1_520)
end
VEC_ROTATE = L0_0
function L0_0(A0_521, A1_522)
  BBMath(A0_521, A1_522)
end
BBVectorMath = L0_0
function L0_0(A0_523, A1_524)
  rangeSize = GetMathNumber(A0_523, A1_524.RangeEndVarTable, A1_524.RangeEndVar, A1_524.RangeEnd) - GetMathNumber(A0_523, A1_524.RangeBeginVarTable, A1_524.RangeBeginVar, A1_524.RangeBegin)
  if rangeSize == 0 then
    ratio = 0
  else
    ratio = (GetMathNumber(A0_523, A1_524.ValueVarTable, A1_524.ValueVar, A1_524.Value) - GetMathNumber(A0_523, A1_524.RangeBeginVarTable, A1_524.RangeBeginVar, A1_524.RangeBegin)) / rangeSize
  end
  if A1_524.Clamp == true then
    if 0 > ratio then
      ratio = 0
    elseif ratio > 1 then
      ratio = 1
    end
  end
  GetTable(A0_523, A1_524.RatioVarTable)[A1_524.RatioVar] = ratio
end
BBInterpolateFromValue = L0_0
function L0_0(A0_525, A1_526)
  local L2_527, L3_528
  L2_527 = GetMathNumber
  L3_528 = A0_525
  L2_527 = L2_527(L3_528, A1_526.RangeBeginVarTable, A1_526.RangeBeginVar, A1_526.RangeBegin)
  L3_528 = GetMathNumber
  L3_528 = L3_528(A0_525, A1_526.RangeEndVarTable, A1_526.RangeEndVar, A1_526.RangeEnd)
  rangeSize = L3_528 - L2_527
  scaler = rangeSize * GetMathNumber(A0_525, A1_526.RatioVarTable, A1_526.RatioVar, A1_526.Ratio)
  if A1_526.Clamp == true then
    if GetMathNumber(A0_525, A1_526.RatioVarTable, A1_526.RatioVar, A1_526.Ratio) < 0 then
    else
    end
  end
  GetTable(A0_525, A1_526.ValueVarTable)[A1_526.ValueVar] = L3_528
end
BBInterpolateFromRatio = L0_0
function L0_0(A0_529, A1_530)
  local L2_531, L3_532
  L2_531 = GetParam
  L3_532 = "Left"
  L2_531 = L2_531(L3_532, A0_529, A1_530)
  L3_532 = GetParam
  L3_532 = L3_532("Right", A0_529, A1_530)
  GetTable(A0_529, A1_530.DestVarTable, true)[A1_530.DestVar] = tostring(L2_531) .. tostring(L3_532)
end
BBAppendString = L0_0
function L0_0(A0_533, A1_534)
  local L2_535
  L2_535 = 0
  if A1_534.Delta ~= nil then
    L2_535 = L2_535 + A1_534.Delta
  end
  if A1_534.DeltaByLevel ~= nil and A0_533.Level ~= nil then
    L2_535 = L2_535 + A1_534.DeltaByLevel[A0_533.Level]
  end
  if A1_534.DeltaVar ~= nil then
    L2_535 = L2_535 + GetTable(A0_533, A1_534.DeltaVarTable, true)[A1_534.DeltaVar]
  end
  if A1_534.TargetVar ~= nil then
    A1_534.Stat(L2_535, A0_533[A1_534.TargetVar])
  else
    A1_534.Stat(L2_535)
  end
end
BBIncStat = L0_0
function L0_0(A0_536, A1_537)
  local L2_538
  L2_538 = 0
  if A1_537.Delta ~= nil then
    L2_538 = L2_538 + A1_537.Delta
  end
  if A1_537.DeltaByLevel ~= nil and A0_536.Level ~= nil then
    L2_538 = L2_538 + A1_537.DeltaByLevel[A0_536.Level]
  end
  if A1_537.DeltaVar ~= nil then
    L2_538 = L2_538 + GetTable(A0_536, A1_537.DeltaVarTable, true)[A1_537.DeltaVar]
  end
  if A1_537.TargetVar ~= nil then
    A1_537.Stat(L2_538, A0_536[A1_537.TargetVar])
  else
    A1_537.Stat(L2_538)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_539, A1_540)
  local L2_541, L3_542
  L2_541 = A1_540.TargetVar
  L3_542 = 0
  if A1_540.LaneVar ~= nil then
    L3_542 = L3_542 + GetTable(A0_539, A1_540.LaneVarTable, true)[A1_540.LaneVar]
  end
  if A1_540.Lane ~= nil then
    L3_542 = L3_542 + A1_540.Lane
  end
  SetMinionLane(A0_539[L2_541], L3_542)
end
BBSetMinionLane = L0_0
function L0_0(A0_543, A1_544)
  if A1_544.AttackVar ~= nil then
  end
  if A1_544.Attack ~= nil then
  end
  if A1_544.TotalCoefficientVar ~= nil then
  end
  if A1_544.TotalCoefficient ~= nil then
  end
  if A1_544.TargetVar ~= nil then
    GetTable(A0_543, A1_544.DestVarTable, false)[A1_544.DestVar] = (0 + GetTable(A0_543, A1_544.AttackVarTable, true)[A1_544.AttackVar] + A1_544.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_543[A1_544.TargetVar])) + GetFlatCritDamageMod(A0_543[A1_544.TargetVar])) * (0 + GetTable(A0_543, A1_544.TotalCoefficientVarTable, true)[A1_544.TotalCoefficientVar] + A1_544.TotalCoefficient)
  else
    GetTable(A0_543, A1_544.DestVarTable, false)[A1_544.DestVar] = 2 * A1_544.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_545, A1_546)
  local L2_547, L3_548, L4_549, L5_550, L6_551, L7_552, L8_553
  L2_547 = GetTable
  L3_548 = A0_545
  L4_549 = A1_546.DestVarTable
  L5_550 = false
  L2_547 = L2_547(L3_548, L4_549, L5_550)
  L3_548 = GetTable
  L4_549 = A0_545
  L5_550 = A1_546.AmountVarTable
  L6_551 = true
  L3_548 = L3_548(L4_549, L5_550, L6_551)
  L4_549 = GetTable
  L5_550 = A0_545
  L6_551 = A0_545.NextBuffVars
  L7_552 = false
  L4_549 = L4_549(L5_550, L6_551, L7_552)
  L5_550 = A1_546.AmountVar
  L5_550 = L3_548[L5_550]
  L6_551 = A1_546.Amount
  L5_550 = L5_550 + L6_551
  L4_549.InitializeShield_Amount = L5_550
  L5_550 = A1_546.AmountVar
  if L5_550 ~= nil then
    L5_550 = A1_546.HealShieldMod
    if L5_550 ~= nil and L5_550 == true then
      L6_551 = A1_546.Amount
      L7_552 = A1_546.AmountVar
      L7_552 = L3_548[L7_552]
      L6_551 = L6_551 + L7_552
      L7_552 = A1_546.AttackerVar
      L8_553 = 0
      if L7_552 ~= nil then
        L8_553 = GetPercentHealingAmountMod(A0_545[L7_552])
      end
      L6_551 = L6_551 * (1 + L8_553)
      L6_551 = L6_551 * (1 + GetPercentIncomingHealingAmountMod(A0_545[A1_546.UnitVar]))
      L3_548[A1_546.AmountVar] = L6_551
      L4_549.InitializeShield_Amount = L6_551
    end
  end
  L5_550 = SpellBuffAddNoRenew
  L6_551 = A1_546.AttackerVar
  L6_551 = A0_545[L6_551]
  L7_552 = A1_546.UnitVar
  L7_552 = A0_545[L7_552]
  L8_553 = "InitializeShieldMarker"
  L5_550(L6_551, L7_552, L8_553, 0, 1, 25000, L4_549)
  L5_550 = BBIncreaseShield
  L6_551 = A0_545
  L7_552 = A1_546
  L5_550(L6_551, L7_552)
end
BBInitializeShield = L0_0
function L0_0(A0_554, A1_555)
  if A1_555.CDVar ~= nil then
  end
  if A1_555.CD ~= nil then
  end
  if A1_555.TargetVar ~= nil then
    GetTable(A0_554, A1_555.DestVarTable, false)[A1_555.DestVar] = (0 + GetTable(A0_554, A1_555.CDVarTable, true)[A1_555.CDVar] + A1_555.CD) * (1 + GetPercentCooldownMod(A0_554[A1_555.TargetVar]))
  else
    GetTable(A0_554, A1_555.DestVarTable, false)[A1_555.DestVar] = A1_555.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_556, A1_557)
  local L2_558, L3_559
  L3_559 = A1_557.TargetVar
  if L3_559 ~= nil then
    L2_558 = A1_557.Stat(A0_556[L3_559])
  else
    L2_558 = A1_557.Stat()
  end
  SetVarInTable(A0_556, A1_557, L2_558)
end
BBGetStat = L0_0
function L0_0(A0_560, A1_561)
  if A1_561.TargetVar ~= nil then
    GetTable(A0_560, A1_561.DestVarTable, false)[A1_561.DestVar] = GetLevel(A0_560[A1_561.TargetVar])
  else
    GetTable(A0_560, A1_561.DestVarTable, false)[A1_561.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_562, A1_563)
  if A1_563.TargetVar ~= nil then
    GetTable(A0_562, A1_563.DestVarTable, false)[A1_563.DestVar] = GetUnitSignificance(A0_562[A1_563.TargetVar])
  else
    GetTable(A0_562, A1_563.DestVarTable, false)[A1_563.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_564, A1_565)
  if A1_565.TargetVar ~= nil then
    GetTable(A0_564, A1_565.DestVarTable, false)[A1_565.DestVar] = GetArmor(A0_564[A1_565.TargetVar])
  else
    GetTable(A0_564, A1_565.DestVarTable, false)[A1_565.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_566, A1_567)
  if A1_567.TargetVar ~= nil then
    GetTable(A0_566, A1_567.DestVarTable, false)[A1_567.DestVar] = GetSpellBlock(A0_566[A1_567.TargetVar])
  else
    GetTable(A0_566, A1_567.DestVarTable, false)[A1_567.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_568, A1_569)
  local L2_570, L3_571
  L3_571 = A1_569.TargetVar
  if L3_571 ~= nil then
    L2_570 = GetTeamID(A0_568[L3_571])
  else
    L2_570 = GetTeamID()
  end
  SetVarInTable(A0_568, A1_569, L2_570)
end
BBGetTeamID = L0_0
function L0_0(A0_572, A1_573)
  local L2_574, L3_575, L4_576
  L2_574 = GetTable
  L3_575 = A0_572
  L4_576 = A1_573.DestVarTable
  L2_574 = L2_574(L3_575, L4_576, false)
  L3_575 = A1_573.TargetVar
  L4_576 = nil
  if L3_575 ~= nil then
    L4_576 = GetTeamID(A0_572[L3_575])
  else
    L4_576 = GetTeamID()
  end
  if L4_576 == TEAM_ORDER then
    L2_574[A1_573.DestVar] = TEAM_CHAOS
  elseif L4_576 == TEAM_CHAOS then
    L2_574[A1_573.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_577, A1_578)
  if A1_578.TargetVar ~= nil then
    GetTable(A0_577, A1_578.DestVarTable, false)[A1_578.DestVar] = GetUnitSkinName(A0_577[A1_578.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_579, A1_580)
  local L2_581, L3_582, L4_583
  L2_581 = GetTable
  L3_582 = A0_579
  L4_583 = A1_580.DestVarTable
  L2_581 = L2_581(L3_582, L4_583, false)
  L3_582 = A0_579.Owner
  L4_583 = nil
  if A1_580.TargetVar ~= nil then
    L4_583 = GetTotalAttackDamage(A0_579[A1_580.TargetVar])
  else
    L4_583 = GetTotalAttackDamage()
  end
  SetVarInTable(A0_579, A1_580, L4_583)
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_584, A1_585)
  GetTable(A0_584, A1_585.DestVarTable, true)[A1_585.DestVar] = A1_585.Status(A0_584[A1_585.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_586, A1_587)
  local L2_588
  L2_588 = A1_587.TargetVar
  L2_588 = A0_586[L2_588]
  ClearAttackTarget(L2_588)
end
BBClearAttackTarget = L0_0
function L0_0(A0_589, A1_590)
  local L2_591, L3_592
  L2_591 = GetTable
  L3_592 = A0_589
  L2_591 = L2_591(L3_592, A1_590.DestVarTable, true)
  L3_592 = A1_590.Info
  L3_592 = L3_592(A0_589[A1_590.TargetVar])
  SetVarInTable(A0_589, A1_590, L3_592)
end
BBGetCastInfo = L0_0
function L0_0(A0_593, A1_594, A2_595)
  local L3_596, L4_597, L5_598, L6_599
  L3_596 = GetTable
  L4_597 = A0_593
  L5_598 = A1_594.TrackTimeVarTable
  L6_599 = false
  L3_596 = L3_596(L4_597, L5_598, L6_599)
  L4_597 = GetTime
  L4_597 = L4_597()
  L5_598 = A1_594.ExecuteImmediately
  L6_599 = GetParam
  L6_599 = L6_599("TimeBetweenExecutions", A0_593, A1_594)
  if A1_594.TickTimeVar ~= nil and GetTable(A0_593, A1_594.TickTimeVarTable, false)[A1_594.TickTimeVar] ~= nil then
    L6_599 = GetTable(A0_593, A1_594.TickTimeVarTable, false)[A1_594.TickTimeVar]
  end
  if L3_596[A1_594.TrackTimeVar] == nil then
    L3_596[A1_594.TrackTimeVar] = L4_597
    if L5_598 == true then
      ExecuteBuildingBlocks(A2_595, A0_593)
    end
  end
  if L4_597 >= L3_596[A1_594.TrackTimeVar] + L6_599 then
    L3_596[A1_594.TrackTimeVar] = L3_596[A1_594.TrackTimeVar] + L6_599
    ExecuteBuildingBlocks(A2_595, A0_593)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_600, A1_601, A2_602)
  GetTable(A0_600, A1_601.TrackTimeVarTable, false)[A1_601.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_603, A1_604)
  local L2_605
  L2_605 = A1_604.SrcValue
  if A1_604.SrcVar ~= nil then
    L2_605 = GetTable(A0_603, A1_604.SrcVarTable, true)[A1_604.SrcVar]
  end
  A1_604.Status(A0_603[A1_604.TargetVar], L2_605)
end
BBSetStatus = L0_0
function L0_0(A0_606, A1_607)
  local L2_608
  L2_608 = A1_607.ToAlert
  if GetTable(A0_606, A1_607.SrcVarTable, false) ~= nil and A1_607.SrcVar ~= nil then
    L2_608 = L2_608 .. GetTable(A0_606, A1_607.SrcVarTable, false)[A1_607.SrcVar]
  end
  _ALERT(L2_608)
end
BBAlert = L0_0
function L0_0(A0_609, A1_610)
  local L2_611, L3_612, L4_613, L5_614, L6_615, L7_616
  L2_611 = GetParam
  L3_612 = "Value"
  L4_613 = A0_609
  L5_614 = A1_610
  L2_611 = L2_611(L3_612, L4_613, L5_614)
  if L2_611 == nil then
    L3_612 = ReportError
    L4_613 = "Could not resolve Value param"
    L3_612(L4_613)
    return
  end
  L3_612 = true
  L4_613 = GetParam
  L5_614 = "OnUnit"
  L6_615 = A0_609
  L7_616 = A1_610
  L4_613 = L4_613(L5_614, L6_615, L7_616)
  if L4_613 == nil then
    L3_612 = false
    L5_614 = GetParam
    L6_615 = "OnUnitByFlag"
    L7_616 = A0_609
    L5_614 = L5_614(L6_615, L7_616, A1_610)
    L4_613 = L5_614
  end
  if L4_613 == nil then
    L5_614 = ReportError
    L6_615 = "Could not resolve OnUnit param"
    L5_614(L6_615)
    return
  end
  L5_614 = true
  L6_615 = GetParam
  L7_616 = "ChampionToSayTo"
  L6_615 = L6_615(L7_616, A0_609, A1_610)
  if L6_615 == nil then
    L5_614 = false
    L7_616 = GetParam
    L7_616 = L7_616("ChampionToSayToByFlag", A0_609, A1_610)
    L6_615 = L7_616
  end
  if L6_615 == nil then
    L7_616 = ReportError
    L7_616("Could not resolve ChampionToSayTo param")
    return
  end
  L7_616 = GetParam
  L7_616 = L7_616("ShowToSpectator", A0_609, A1_610)
  if L7_616 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  DisplayNumericFloatingTextOnUnitToChampion(L2_611, A1_610.TextType, L4_613, L3_612, L6_615, L5_614, L7_616)
end
BBDisplayNumericFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_617, A1_618)
  local L2_619, L3_620, L4_621, L5_622, L6_623, L7_624
  L2_619 = GetParam
  L3_620 = "Message"
  L4_621 = A0_617
  L5_622 = A1_618
  L2_619 = L2_619(L3_620, L4_621, L5_622)
  if L2_619 == nil then
    L3_620 = ReportError
    L4_621 = "Could not resolve Message param"
    L3_620(L4_621)
    return
  end
  L3_620 = true
  L4_621 = GetParam
  L5_622 = "OnUnit"
  L6_623 = A0_617
  L7_624 = A1_618
  L4_621 = L4_621(L5_622, L6_623, L7_624)
  if L4_621 == nil then
    L3_620 = false
    L5_622 = GetParam
    L6_623 = "OnUnitByFlag"
    L7_624 = A0_617
    L5_622 = L5_622(L6_623, L7_624, A1_618)
    L4_621 = L5_622
  end
  if L4_621 == nil then
    L5_622 = ReportError
    L6_623 = "Could not resolve OnUnit param"
    L5_622(L6_623)
    return
  end
  L5_622 = true
  L6_623 = GetParam
  L7_624 = "ChampionToSayTo"
  L6_623 = L6_623(L7_624, A0_617, A1_618)
  if L6_623 == nil then
    L5_622 = false
    L7_624 = GetParam
    L7_624 = L7_624("ChampionToSayToByFlag", A0_617, A1_618)
    L6_623 = L7_624
  end
  if L6_623 == nil then
    L7_624 = ReportError
    L7_624("Could not resolve ChampionToSayTo param")
    return
  end
  L7_624 = GetParam
  L7_624 = L7_624("ShowToSpectator", A0_617, A1_618)
  if L7_624 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  SayWithFloatingTextOnUnitToChampion(tostring(L2_619), A1_618.TextType, L4_621, L3_620, L6_623, L5_622, L7_624)
end
BBSayWithFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_625, A1_626)
  local L2_627, L3_628, L4_629
  L2_627 = A1_626.ToSay
  L3_628 = GetTable
  L4_629 = A0_625
  L3_628 = L3_628(L4_629, A1_626.SrcVarTable, false)
  if L3_628 ~= nil then
    L4_629 = A1_626.SrcVar
    if L4_629 ~= nil then
      L4_629 = L2_627
      L2_627 = L4_629 .. tostring(L3_628[A1_626.SrcVar])
    end
  end
  L4_629 = nil
  if A1_626.OwnerVar ~= nil then
    L4_629 = A0_625[A1_626.OwnerVar]
  else
    L4_629 = A0_625.Owner
  end
  if A1_626.TextType == nil then
    A1_626.TextType = 0
  end
  Say(L4_629, L2_627, A1_626.TextType)
end
BBSay = L0_0
function L0_0(A0_630, A1_631)
  local L2_632, L3_633, L4_634
  L2_632 = A1_631.ToSay
  L3_633 = GetTable
  L4_634 = A0_630
  L3_633 = L3_633(L4_634, A1_631.SrcVarTable, false)
  if L3_633 ~= nil then
    L4_634 = A1_631.SrcVar
    if L4_634 ~= nil then
      L4_634 = L2_632
      L2_632 = L4_634 .. tostring(L3_633[A1_631.SrcVar])
    end
  end
  L4_634 = nil
  if A1_631.OwnerVar ~= nil then
    L4_634 = A0_630[A1_631.OwnerVar]
  else
    L4_634 = A0_630.Owner
  end
  if A1_631.TextType == nil then
    A1_631.TextType = 0
  end
  Say(L4_634, L2_632, A1_631.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_635, A1_636)
  GetTable(A0_635, A1_636.DestVarTable, true)[A1_636.DestVar] = BBLuaGetGold(A0_635, A1_636)
end
BBGetGold = L0_0
function L0_0(A0_637, A1_638)
  GetTable(A0_637, A1_638.DestVarTable, true)[A1_638.DestVar] = BBLuaGetTotalGold(A0_637, A1_638)
end
BBGetTotalGold = L0_0
function L0_0(A0_639, A1_640)
  A0_639.CharVars.TeleportTargetPosition = GetTable(A0_639, A1_640.CastPositionNameTable)[A1_640.CastPositionName]
  SpellBuffAdd(A0_639[A1_640.OwnerVar], A0_639[A1_640.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_639.NextBuffVars)
  BBTeleportToPositionHelper(A0_639, A1_640)
end
BBTeleportToPosition = L0_0
function L0_0(A0_641, A1_642)
  if A1_642.XVar ~= nil and GetTable(A0_641, A1_642.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_641, A1_642.XVarTable, true)[A1_642.XVar]
  else
    Xloc = A1_642.X
  end
  if A1_642.YVar ~= nil and GetTable(A0_641, A1_642.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_641, A1_642.YVarTable, true)[A1_642.YVar]
  else
    Yloc = A1_642.Y
  end
  if A1_642.ZVar ~= nil and GetTable(A0_641, A1_642.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_641, A1_642.ZVarTable, true)[A1_642.ZVar]
  else
    Zloc = A1_642.Z
  end
  A1_642.OwnerVar, A0_641.position = A1_642.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_642.CastPositionName = "position"
  BBTeleportToPosition(A0_641, A1_642)
end
BBTeleportToPoint = L0_0
function L0_0(A0_643, A1_644)
  A1_644.TimeoutInFOW = 999999
  A1_644.BindFlexToOwnerPAR = false
  A1_644.Flags = 0
  A1_644.FollowsGroundTilt = false
  A1_644.FacesTarget = false
  A1_644.HideFromSpectator = false
  A1_644.SendIfOnScreenOrDiscard = false
  A1_644.PersistsThroughReconnect = true
  A1_644.FOWVisibilityRadius = 10
  A1_644.Scale = 1
  A1_644.BindObjectVar = A1_644.BindObject1Var
  A1_644.EffectID2Var = A1_644.OtherTeamEffectIDVar
  A1_644.TargetObjectVar = A1_644.BindObject2Var
  A1_644.FOWTeamOverrideVar = A1_644.FOWTeamVar
  A1_644.BoneName = A1_644.BindObject1BoneName
  A1_644.TargetBoneName = A1_644.BindObject2BoneName
  A1_644.EffectName = A1_644.EffectParticleFile
  A1_644.EffectNameForOtherTeam = A1_644.OtherTeamParticleFile
  BBSpellEffectCreate(A0_643, A1_644)
end
BBSpellEffectCreate_EasyBeam = L0_0
function L0_0(A0_645, A1_646)
  A1_646.TimeoutInFOW = 999999
  A1_646.BindFlexToOwnerPAR = false
  A1_646.Flags = 0
  A1_646.FollowsGroundTilt = false
  A1_646.FacesTarget = false
  A1_646.HideFromSpectator = false
  A1_646.SendIfOnScreenOrDiscard = true
  A1_646.PersistsThroughReconnect = false
  A1_646.FOWVisibilityRadius = 10
  A1_646.Scale = 1
  A1_646.FOWTeamOverrideVar = A1_646.FOWTeamVar
  A1_646.EffectName = A1_646.ParticleFile
  A1_646.EffectNameForOtherTeam = A1_646.ParticleFileForOtherTeam
  A1_646.BoneName = A1_646.BindObjectBoneName
  BBSpellEffectCreate(A0_645, A1_646)
end
BBSpellEffectCreate_EasyHit = L0_0
function L0_0(A0_647, A1_648)
  local L2_649, L3_650, L4_651, L5_652, L6_653, L7_654, L8_655, L9_656, L10_657, L11_658, L12_659
  L3_650 = A1_648.TargetVar
  if L3_650 ~= nil then
    L3_650 = A1_648.TargetVar
    L2_649 = A0_647[L3_650]
  else
    L2_649 = A0_647.Target
  end
  L3_650 = {
    L4_651,
    L5_652,
    L6_653
  }
  L4_651.maxSlot = 3
  L4_651.spellbook = L5_652
  L4_651.stype = L5_652
  L5_652.maxSlot = 6
  L5_652.spellbook = L6_653
  L5_652.stype = L6_653
  L6_653.maxSlot = 1
  L7_654 = SPELLBOOK_SUMMONER
  L6_653.spellbook = L7_654
  L7_654 = SpellSlots
  L6_653.stype = L7_654
  for L7_654, L8_655 in L4_651(L5_652) do
    A1_648.SpellbookType = L9_656
    A1_648.SlotType = L9_656
    for L12_659 = 0, L8_655.maxSlot do
      if HasSpellTag(L2_649, L12_659, A1_648.SpellbookType, A1_648.SlotType, A1_648.SpellTag) ~= A1_648.InvertResult then
        A1_648.SpellSlot = L12_659
        BBSealSpellSlot(A0_647, A1_648)
      end
    end
  end
end
BBSealSpellSlotsWithTag = L0_0
function L0_0(A0_660, A1_661)
  ReincarnateNonDeadHero(GetTable(A0_660, A1_661.TargetTable, false)[A1_661.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_662, A1_663)
  GetTable(A0_662, A1_663.DestVarTable, true)[A1_663.DestVar] = A1_663.Function(A0_662[A1_663.OwnerVar], A1_663.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_664, A1_665)
  local L2_666, L3_667, L4_668, L5_669
  L2_666 = A1_665.WhomToOrderVar
  L2_666 = A0_664[L2_666]
  L3_667 = A1_665.TargetOfOrderVar
  L3_667 = A0_664[L3_667]
  L4_668 = GetTable
  L5_669 = A0_664
  L4_668 = L4_668(L5_669, A1_665.SrcVarTable, false)
  L5_669 = nil
  if A1_665.SrcVar ~= nil and L4_668 ~= nil then
    L5_669 = L4_668[A1_665.SrcVar]
  else
    L5_669 = GetPosition(L3_667)
  end
  if L3_667 == nil then
    L3_667 = L2_666
  end
  IssueOrder(L2_666, A1_665.Order, L5_669, L3_667)
end
BBIssueOrder = L0_0
function L0_0(A0_670, A1_671)
  local L2_672
  L2_672 = GetParam
  L2_672 = L2_672("NewRange", A0_670, A1_671)
  SetSpellCastRange(L2_672)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_673, A1_674)
  GetTable(A0_673, A1_674.DestVarTable, true)[A1_674.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_675, A1_676)
  local L2_677, L3_678
  L2_677 = A1_676.ObjectVar1
  L2_677 = A0_675[L2_677]
  L3_678 = A1_676.ObjectVar2
  L3_678 = A0_675[L3_678]
  GetTable(A0_675, A1_676.DestVarTable, true)[A1_676.DestVar] = DistanceBetweenObjectBounds(L2_677, L3_678)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_679, A1_680)
  local L2_681, L3_682, L4_683
  L2_681 = A1_680.ObjectVar
  L2_681 = A0_679[L2_681]
  L3_682 = GetTable
  L4_683 = A0_679
  L3_682 = L3_682(L4_683, A1_680.PointVarTable, true)
  L4_683 = A1_680.PointVar
  L4_683 = L3_682[L4_683]
  GetTable(A0_679, A1_680.DestVarTable, true)[A1_680.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_681, L4_683)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_684, A1_685)
  local L2_686, L3_687
  L2_686 = GetParam
  L3_687 = "Point1"
  L2_686 = L2_686(L3_687, A0_684, A1_685)
  L3_687 = GetParam
  L3_687 = L3_687("Point2", A0_684, A1_685)
  GetTable(A0_684, A1_685.DestVarTable, true)[A1_685.DestVar] = DistanceBetweenPoints(L2_686, L3_687)
end
BBDistanceBetweenPoints = L0_0
function L0_0(A0_688, A1_689)
  local L2_690, L3_691
  L2_690 = GetParam
  L3_691 = "Point1"
  L2_690 = L2_690(L3_691, A0_688, A1_689)
  L3_691 = GetParam
  L3_691 = L3_691("Point2", A0_688, A1_689)
  GetTable(A0_688, A1_689.DestVarTable, true)[A1_689.DestVar] = DistanceBetweenPointsXZ(L2_690, L3_691)
end
BBDistanceBetweenPointsXZ = L0_0
function L0_0(A0_692, A1_693)
  local L2_694, L3_695, L4_696
  L2_694 = A1_693.ObjectVar
  L2_694 = A0_692[L2_694]
  L3_695 = GetTable
  L4_696 = A0_692
  L3_695 = L3_695(L4_696, A1_693.PointVarTable, true)
  L4_696 = A1_693.PointVar
  L4_696 = L3_695[L4_696]
  GetTable(A0_692, A1_693.DestVarTable, true)[A1_693.DestVar] = WalkDistanceBetweenObjectCenterAndPoint(L2_694, L4_696)
end
BBWalkDistanceBetweenObjectAndPoint = L0_0
L0_0 = 0
OBJECT_BOUNDARY = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
function L0_0(A0_697, A1_698, A2_699)
  local L3_700, L4_701, L5_702, L6_703, L7_704, L8_705
  L5_702 = 0
  L6_703 = nil
  L7_704 = A1_698.ObjectDistanceType
  L8_705 = A1_698.ObjectVar1
  L3_700 = A0_697[L8_705]
  L8_705 = A1_698.ObjectVar2
  L4_701 = A0_697[L8_705]
  if nil == L4_701 then
    L8_705 = A1_698.Point2Var
    if nil ~= L8_705 then
      L8_705 = GetTable
      L8_705 = L8_705(A0_697, A1_698.Point2VarTable, true)
      L4_701 = L8_705[A1_698.Point2Var]
      L5_702 = L5_702 + 1
    end
  end
  if nil == L3_700 then
    L8_705 = A1_698.Point1Var
    if nil ~= L8_705 then
      L8_705 = GetTable
      L8_705 = L8_705(A0_697, A1_698.Point1VarTable, true)
      L3_700 = L8_705[A1_698.Point1Var]
      L5_702 = L5_702 + 1
      if 1 == L5_702 then
        L3_700, L4_701 = L4_701, L3_700
      end
    end
  end
  if nil ~= L7_704 then
    if 0 == L5_702 then
      L8_705 = OBJECT_CENTER
      if L8_705 == L7_704 then
        L6_703 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_705 = OBJECT_BOUNDARY
        if L8_705 == L7_704 then
          L6_703 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_705 = A1_698.OwnerVar
          L8_705 = A0_697[L8_705]
          Say(L8_705, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_702 then
      L8_705 = OBJECT_CENTER
      if L8_705 == L7_704 then
        L6_703 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_705 = OBJECT_BOUNDARY
        if L8_705 == L7_704 then
          L6_703 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_705 = A1_698.OwnerVar
          L8_705 = A0_697[L8_705]
          Say(L8_705, "invalid object distance type", 0)
        end
      end
    else
      L6_703 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_705 = A1_698.Distance
  if A1_698.DistanceVar ~= nil and GetTable(A0_697, A1_698.DistanceVarTable, true) ~= nil then
    L8_705 = L8_705 + GetTable(A0_697, A1_698.DistanceVarTable, true)[A1_698.DistanceVar]
  end
  if L3_700 ~= nil and L4_701 ~= nil and L6_703 ~= nil and L8_705 ~= nil then
    if not L6_703(L3_700, L4_701, L8_705) then
      ExecuteBuildingBlocks(A2_699, A0_697)
      A0_697.LastIfSucceeded = true
    else
      A0_697.LastIfSucceeded = false
    end
  else
    A0_697.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_706, A1_707, A2_708)
  if A0_706.LastIfSucceeded == false then
    BBIfDistanceBetween(A0_706, A1_707, A2_708)
  end
end
BBElseIfDistanceBetween = L0_0
function L0_0(A0_709, A1_710, A2_711)
  if A0_709.LastIfSucceeded == true then
    BBIfDistanceBetween(A0_709, A1_710, A2_711)
  end
end
BBAndIfDistanceBetween = L0_0
function L0_0(A0_712, A1_713, A2_714)
  if A0_712.LastIfSucceeded == true then
    ExecuteBuildingBlocks(A2_714, A0_712)
    A0_712.LastIfSucceeded = true
  else
    BBIfDistanceBetween(A0_712, A1_713, A2_714)
  end
end
BBOrIfDistanceBetween = L0_0
function L0_0(A0_715, A1_716)
  local L2_717, L3_718
  L2_717 = A1_716.TargetVar
  L2_717 = A0_715[L2_717]
  L3_718 = A1_716.CasterVar
  L3_718 = A0_715[L3_718]
  GetTable(A0_715, A1_716.DestVarTable, true)[A1_716.DestVar] = SpellBuffCount(L2_717, A1_716.BuffName, L3_718)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_719, A1_720)
  local L2_721
  L2_721 = A1_720.TargetVar
  L2_721 = A0_719[L2_721]
  GetTable(A0_719, A1_720.DestVarTable, true)[A1_720.DestVar] = SpellBuffCount(L2_721, A1_720.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_722, A1_723)
  local L2_724, L3_725
  L2_724 = GetTable
  L3_725 = A0_722
  L2_724 = L2_724(L3_725, A1_723.ScaleVarTable, false)
  L3_725 = nil
  if A1_723.OwnerVar ~= nil then
    L3_725 = A0_722[A1_723.OwnerVar]
  else
    L3_725 = A0_722.Owner
  end
  if A1_723.ScaleVar ~= nil and A1_723.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_724[A1_723.ScaleVar], L3_725)
  else
    SetScaleSkinCoef(A1_723.Scale, L3_725)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_726, A1_727)
  SpellBuffAdd(A0_726[A1_727.TargetVar], A0_726[A1_727.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_726.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_728, A1_729, A2_730)
  local L3_731, L4_732
  L3_731 = A1_729.TargetVar
  L3_731 = A0_728[L3_731]
  L4_732 = A1_729.NumStacks
  if GetParam("NumStacks", A0_728, A1_729) == 0 then
    L4_732 = SpellBuffCount(L3_731, A1_729.BuffName, caster)
  else
    L4_732 = GetParam("NumStacks", A0_728, A1_729)
  end
  while L4_732 > 0 do
    SpellBuffRemove(L3_731, A1_729.BuffName, A0_728[A1_729.AttackerVar])
    L4_732 = L4_732 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_733, A1_734)
  local L2_735, L3_736
  L2_735 = GetParam
  L3_736 = "Unit"
  L2_735 = L2_735(L3_736, A0_733, A1_734)
  unit = L2_735
  L2_735 = unit
  if L2_735 == nil then
    L2_735 = ReportError
    L3_736 = "Could not resolve Unit param"
    L2_735(L3_736)
    return
  end
  L2_735 = true
  L3_736 = GetParam
  L3_736 = L3_736("ChampionToShowTo", A0_733, A1_734)
  if L3_736 == nil then
    L2_735 = false
    L3_736 = GetParam("ChampionToShowToByFlag", A0_733, A1_734)
  end
  if L3_736 == nil then
    ReportError("Could not resolve ChampionToShowTo param")
    return
  end
  SetShowHealthBarToChampion(unit, A1_734.Show, L3_736, L2_735, A1_734.ApplyToSpectator)
end
BBSetShowHealthBarToChampion = L0_0
function L0_0(A0_737, A1_738)
  if GetParam("Vector", A0_737, A1_738) ~= nil then
    GetTable(A0_737, A1_738.DestVarTable, false)[A1_738.DestVar] = math.sqrt(GetParam("Vector", A0_737, A1_738).x * GetParam("Vector", A0_737, A1_738).x + GetParam("Vector", A0_737, A1_738).y * GetParam("Vector", A0_737, A1_738).y + GetParam("Vector", A0_737, A1_738).z * GetParam("Vector", A0_737, A1_738).z)
  end
end
BBGetVectorLength = L0_0
function L0_0(A0_739, A1_740, A2_741)
  if A0_739.EmoteId == A1_740.EmoteId then
    ExecuteBuildingBlocks(A2_741, A0_739)
    A0_739.LastIfSucceeded = true
  else
    A0_739.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_742, A1_743, A2_744)
  if A0_742.LastIfSucceeded == false then
    BBIfEmoteIs(A0_742, A1_743, A2_744)
  end
end
BBElseIfEmoteIs = L0_0
function L0_0(A0_745, A1_746, A2_747)
  if A0_745.LastIfSucceeded == true then
    BBIfEmoteIs(A0_745, A1_746, A2_747)
  end
end
BBAndIfEmoteIs = L0_0
function L0_0(A0_748, A1_749, A2_750)
  if A0_748.LastIfSucceeded == true then
    ExecuteBuildingBlocks(A2_750, A0_748)
    A0_748.LastIfSucceeded = true
  else
    BBIfEmoteIs(A0_748, A1_749, A2_750)
  end
end
BBOrIfEmoteIs = L0_0
function L0_0(A0_751, A1_752, A2_753)
  if A0_751.EmoteId ~= A1_752.EmoteId then
    ExecuteBuildingBlocks(A2_753, A0_751)
    A0_751.LastIfSucceeded = true
  else
    A0_751.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_754, A1_755, A2_756)
  if A0_754.LastIfSucceeded == false then
    BBIfEmoteIsNot(A0_754, A1_755, A2_756)
  end
end
BBElseIfEmoteIsNot = L0_0
function L0_0(A0_757, A1_758, A2_759)
  if A0_757.LastIfSucceeded == true then
    BBIfEmoteIsNot(A0_757, A1_758, A2_759)
  end
end
BBAndIfEmoteIsNot = L0_0
function L0_0(A0_760, A1_761, A2_762)
  if A0_760.LastIfSucceeded == true then
    ExecuteBuildingBlocks(A2_762, A0_760)
    A0_760.LastIfSucceeded = true
  else
    BBIfEmoteIsNot(A0_760, A1_761, A2_762)
  end
end
BBOrIfEmoteIsNot = L0_0
function L0_0(A0_763, A1_764)
  local L2_765, L3_766, L4_767, L5_768
  L2_765 = GetTable
  L3_766 = A0_763
  L4_767 = A1_764.String1VarTable
  L5_768 = false
  L2_765 = L2_765(L3_766, L4_767, L5_768)
  L3_766 = A1_764.String1Var
  L3_766 = L2_765[L3_766]
  L4_767 = GetTable
  L5_768 = A0_763
  L4_767 = L4_767(L5_768, A1_764.String2VarTable, false)
  L5_768 = A1_764.String2Var
  L5_768 = L4_767[L5_768]
  GetTable(A0_763, A1_764.ResultVarTable, false)[A1_764.ResultVar] = L3_766 .. L5_768
end
BBConcatenateStrings = L0_0
function L0_0(A0_769, A1_770)
  local L2_771, L3_772
  L2_771 = GetTable
  L3_772 = A0_769
  L2_771 = L2_771(L3_772, A1_770.VariableVarTable, false)
  L3_772 = A1_770.VariableVar
  L3_772 = L2_771[L3_772]
  GetTable(A0_769, A1_770.ResultVarTable, false)[A1_770.ResultVar] = "(" .. L3_772 .. ")"
end
BBEncaseInParantheses = L0_0
function L0_0(A0_773, A1_774)
  BBGetMinionKills(A0_773, A1_774)
  A0_773.MinionKillSource = GetParam("MinionKillTarget")
  A0_773.MinionKills = A0_773.MinionsKilled + GetParam("MinionKills", A0_773, A1_774)
  BBSetMinionKills(A0_773, A1_774)
end
BBIncreaseMinionKills = L0_0
function L0_0(A0_775, A1_776)
end
BBForcePreload = L0_0
