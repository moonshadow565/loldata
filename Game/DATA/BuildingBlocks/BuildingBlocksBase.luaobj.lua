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
    ExecuteBuildingBlocks(A2_281, A0_279)
    A0_279.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_282, A1_283, A2_284)
  if A0_282.LastIfSucceeded == true then
    ExecuteBuildingBlocks(A2_284, A0_282)
    A0_282.LastIfSucceeded = true
  else
    BBIf(A0_282, A1_283, A2_284)
  end
end
BBOrIf = L0_0
function L0_0(A0_285, A1_286, A2_287)
  if A0_285.LastIfSucceeded == true then
    BBIf(A0_285, A1_286, A2_287)
  end
end
BBAndIf = L0_0
function L0_0(A0_288, A1_289, A2_290)
  local L3_291, L4_292, L5_293, L6_294
  L3_291 = A0_288.LastIfSucceeded
  if L3_291 == false then
    L3_291 = GetTable
    L4_292 = A0_288
    L5_293 = A1_289.Src1VarTable
    L6_294 = false
    L3_291 = L3_291(L4_292, L5_293, L6_294)
    L4_292 = GetTable
    L5_293 = A0_288
    L6_294 = A1_289.Src2VarTable
    L4_292 = L4_292(L5_293, L6_294, false)
    L5_293 = false
    L6_294 = nil
    if L3_291 ~= nil and A1_289.Src1Var ~= nil then
      L6_294 = L3_291[A1_289.Src1Var]
    else
      L6_294 = A1_289.Value1
    end
    if L4_292 ~= nil and A1_289.Src2Var ~= nil then
      L5_293 = A1_289.CompareOp(L6_294, L4_292[A1_289.Src2Var])
    else
      L5_293 = A1_289.CompareOp(L6_294, A1_289.Value2)
    end
    if L5_293 then
      ExecuteBuildingBlocks(A2_290, A0_288)
      A0_288.LastIfSucceeded = true
    else
      A0_288.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_295, A1_296, A2_297)
  local L3_298
  if A1_296.TargetVar ~= nil then
    L3_298 = A0_295[A1_296.TargetVar]
  else
    L3_298 = A0_295.Target
  end
  if HasBuffOfType(L3_298, A1_296.BuffType) then
    ExecuteBuildingBlocks(A2_297, A0_295)
    A0_295.LastIfSucceeded = true
  else
    A0_295.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_299, A1_300, A2_301)
  local L3_302, L4_303
  L4_303 = A1_300.TargetVar
  if L4_303 ~= nil then
    L4_303 = A1_300.TargetVar
    L3_302 = A0_299[L4_303]
  else
    L3_302 = A0_299.Target
  end
  L4_303 = GetParam
  L4_303 = L4_303("Team", A0_299, A1_300)
  if HasBuffOfTypeFromTeam(L3_302, A1_300.BuffType, L4_303) then
    ExecuteBuildingBlocks(A2_301, A0_299)
    A0_299.LastIfSucceeded = true
  else
    A0_299.LastIfSucceeded = false
  end
end
BBIfHasBuffOfTypeFromTeam = L0_0
function L0_0(A0_304, A1_305, A2_306)
  local L3_307, L4_308, L5_309
  L5_309 = GetParam
  L5_309 = L5_309("BuffName", A0_304, A1_305)
  if A1_305.OwnerVar ~= nil then
    L3_307 = A0_304[A1_305.OwnerVar]
  else
    L3_307 = A0_304.Owner
  end
  if A1_305.AttackerVar ~= nil then
    L4_308 = A0_304[A1_305.AttackerVar]
  else
    L4_308 = A0_304.Attacker
  end
  if SpellBuffCount(L3_307, L5_309, L4_308) > 0 then
    ExecuteBuildingBlocks(A2_306, A0_304)
    A0_304.LastIfSucceeded = true
  else
    A0_304.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_310, A1_311, A2_312)
  if BBIsMissileAutoAttack(A0_310, A1_311) then
    ExecuteBuildingBlocks(A2_312, A0_310)
    A0_310.LastIfSucceeded = true
  else
    A0_310.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_313, A1_314, A2_315)
  if BBIsMissileConsideredAsAutoAttack(A0_313, A1_314) then
    ExecuteBuildingBlocks(A2_315, A0_313)
    A0_313.LastIfSucceeded = true
  else
    A0_313.LastIfSucceeded = false
  end
end
BBIfMissileConsideredAsAutoAttack = L0_0
function L0_0(A0_316, A1_317)
  A0_316.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_318, A1_319, A2_320)
  local L3_321, L4_322
  if A1_319.OwnerVar ~= nil then
    L3_321 = A0_318[A1_319.OwnerVar]
  else
    L3_321 = A0_318.Owner
  end
  if A1_319.CasterVar ~= nil then
    L4_322 = A0_318[A1_319.CasterVar]
  else
    L4_322 = A0_318.Caster
  end
  if SpellBuffCount(L3_321, A1_319.BuffName, L4_322) <= 0 then
    ExecuteBuildingBlocks(A2_320, A0_318)
    A0_318.LastIfSucceeded = true
  else
    A0_318.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_323, A1_324, A2_325)
  local L3_326
  if A1_324.TargetVar ~= nil then
    L3_326 = A0_323[A1_324.TargetVar]
  else
    L3_326 = A0_323.Owner
  end
  if HasUnitTag(L3_326, A1_324.UnitTag) ~= A1_324.InvertResult then
    ExecuteBuildingBlocks(A2_325, A0_323)
    A0_323.LastIfSucceeded = true
  else
    A0_323.LastIfSucceeded = false
  end
end
BBIfHasUnitTag = L0_0
function L0_0(A0_327, A1_328, A2_329)
  local L3_330, L4_331
  L4_331 = A1_328.OwnerVar
  if L4_331 ~= nil then
    L4_331 = A1_328.OwnerVar
    L3_330 = A0_327[L4_331]
  else
    L3_330 = A0_327.Owner
  end
  L4_331 = GetParam
  L4_331 = L4_331("SpellSlot", A0_327, A1_328)
  if HasSpellTag(L3_330, L4_331, A1_328.SpellbookType, A1_328.SlotType, A1_328.SpellTag) ~= A1_328.InvertResult then
    ExecuteBuildingBlocks(A2_329, A0_327)
    A0_327.LastIfSucceeded = true
  else
    A0_327.LastIfSucceeded = false
  end
end
BBIfHasSpellTag = L0_0
function L0_0(A0_332, A1_333, A2_334)
  local L3_335, L4_336
  if A1_333.OwnerVar ~= nil then
    L3_335 = A0_332[A1_333.OwnerVar]
  else
    L3_335 = A0_332.Owner
  end
  if HasPARType(L3_335, A1_333.PARType) then
    ExecuteBuildingBlocks(A2_334, A0_332)
    A0_332.LastIfSucceeded = true
  else
    A0_332.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_337, A1_338, A2_339)
  local L3_340, L4_341
  if A1_338.OwnerVar ~= nil then
    L3_340 = A0_337[A1_338.OwnerVar]
  else
    L3_340 = A0_337.Owner
  end
  if not HasPARType(L3_340, A1_338.PARType) then
    ExecuteBuildingBlocks(A2_339, A0_337)
    A0_337.LastIfSucceeded = true
  else
    A0_337.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_342, A1_343, A2_344)
  local L3_345, L4_346, L5_347, L6_348, L7_349
  L3_345 = GetTable
  L4_346 = A0_342
  L5_347 = A1_343.Src1VarTable
  L6_348 = false
  L3_345 = L3_345(L4_346, L5_347, L6_348)
  L4_346 = GetTable
  L5_347 = A0_342
  L6_348 = A1_343.Src2VarTable
  L7_349 = false
  L4_346 = L4_346(L5_347, L6_348, L7_349)
  L5_347 = true
  while L5_347 do
    L6_348 = false
    L7_349 = nil
    if L3_345 ~= nil and A1_343.Src1Var ~= nil then
      L7_349 = L3_345[A1_343.Src1Var]
    else
      L7_349 = A1_343.Value1
    end
    if L4_346 ~= nil and A1_343.Src2Var ~= nil then
      L6_348 = A1_343.CompareOp(L7_349, L4_346[A1_343.Src2Var])
    else
      L6_348 = A1_343.CompareOp(L7_349, A1_343.Value2)
    end
    if L6_348 then
      ExecuteBuildingBlocks(A2_344, A0_342)
    else
      L5_347 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_350, A1_351, A2_352)
  local L3_353, L4_354, L5_355
  L3_353 = GetParam
  L4_354 = "Start"
  L5_355 = A0_350
  L3_353 = L3_353(L4_354, L5_355, A1_351)
  L4_354 = GetParam
  L5_355 = "End"
  L4_354 = L4_354(L5_355, A0_350, A1_351)
  L5_355 = L3_353
  while L4_354 >= L5_355 do
    SetVarInTable(A0_350, A1_351, L5_355)
    ExecuteBuildingBlocks(A2_352, A0_350)
    L5_355 = L5_355 + 1
  end
end
BBFor = L0_0
function L0_0(A0_356, A1_357)
  return A0_356 * A1_357
end
MO_MULTIPLY = L0_0
function L0_0(A0_358, A1_359)
  return A0_358 + A1_359
end
MO_ADD = L0_0
function L0_0(A0_360, A1_361)
  return A0_360 - A1_361
end
MO_SUBTRACT = L0_0
function L0_0(A0_362, A1_363)
  return A0_362 / A1_363
end
MO_DIVIDE = L0_0
function L0_0(A0_364, A1_365)
  return math.floor(A0_364 / A1_365)
end
MO_INT_DIVIDE = L0_0
function L0_0(A0_366, A1_367)
  if A0_366 < A1_367 then
    return A0_366
  else
    return A1_367
  end
end
MO_MIN = L0_0
function L0_0(A0_368, A1_369)
  if A1_369 < A0_368 then
    return A0_368
  else
    return A1_369
  end
end
MO_MAX = L0_0
function L0_0(A0_370, A1_371)
  return A0_370 % A1_371
end
MO_MODULO = L0_0
function L0_0(A0_372)
  return math.floor(A0_372 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_373)
  return math.ceil(A0_373)
end
MO_ROUNDUP = L0_0
function L0_0(A0_374)
  return math.floor(A0_374)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_375)
  return math.sin(math.rad(A0_375))
end
MO_SIN = L0_0
function L0_0(A0_376)
  return math.cos(math.rad(A0_376))
end
MO_COSINE = L0_0
function L0_0(A0_377)
  return math.tan(math.rad(A0_377))
end
MO_TANGENT = L0_0
function L0_0(A0_378)
  return math.deg(math.asin(A0_378))
end
MO_ASIN = L0_0
function L0_0(A0_379)
  return math.deg(math.acos(A0_379))
end
MO_ACOS = L0_0
function L0_0(A0_380)
  return math.deg(math.atan(A0_380))
end
MO_ATAN = L0_0
function L0_0(A0_381, A1_382)
  return math.pow(A0_381, A1_382)
end
MO_POW = L0_0
function L0_0(A0_383)
  return math.sqrt(A0_383)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_384, A1_385)
  local L2_386
  L2_386 = A0_384 and A1_385
  return L2_386
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_387, A1_388)
  local L2_389
  L2_389 = A0_387 or A1_388
  return L2_389
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_390)
  local L1_391
  L1_391 = not A0_390
  return L1_391
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_392)
  return math.abs(A0_392)
end
MO_ABS = L0_0
function L0_0(A0_393, A1_394)
  return math.random(A0_393, A1_394)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_395, A1_396)
  local L2_397, L3_398, L4_399, L5_400
  L2_397 = GetMathNumber
  L3_398 = A0_395
  L4_399 = A1_396.Src1VarTable
  L5_400 = A1_396.Src1Var
  L2_397 = L2_397(L3_398, L4_399, L5_400, A1_396.Src1Value)
  L3_398 = GetMathNumber
  L4_399 = A0_395
  L5_400 = A1_396.Src2VarTable
  L3_398 = L3_398(L4_399, L5_400, A1_396.Src2Var, A1_396.Src2Value)
  L4_399 = GetTable
  L5_400 = A0_395
  L4_399 = L4_399(L5_400, A1_396.DestVarTable)
  L5_400 = A1_396.MathOp
  L5_400 = L5_400(L2_397, L3_398)
  SetVarInTable(A0_395, A1_396, L5_400)
end
BBMath = L0_0
function L0_0(A0_401, A1_402, A2_403, A3_404)
  if A2_403 ~= nil and GetTable(A0_401, A1_402)[A2_403] ~= nil then
    return GetTable(A0_401, A1_402)[A2_403]
  end
  return A3_404
end
GetMathNumber = L0_0
function L0_0(A0_405, A1_406)
  if type(A1_406) == "number" then
    return A1_406
  elseif type(A1_406) == "function" then
    return A1_406(A0_405)
  elseif type(A1_406) == "string" then
    return A0_405[A1_406]
  end
end
GetNumber = L0_0
function L0_0(A0_407, A1_408)
  return VectorAdd(A0_407, A1_408)
end
VEC_ADD = L0_0
function L0_0(A0_409, A1_410)
  return VectorSubtract(A0_409, A1_410)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_411, A1_412)
  return VectorScalarMultiply(A0_411, A1_412)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_413, A1_414)
  return VectorScalarDivide(A0_413, A1_414)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_415, A1_416)
  return VectorRotateY(A0_415, A1_416)
end
VEC_ROTATE = L0_0
function L0_0(A0_417, A1_418)
  BBMath(A0_417, A1_418)
end
BBVectorMath = L0_0
function L0_0(A0_419, A1_420)
  rangeSize = GetMathNumber(A0_419, A1_420.RangeEndVarTable, A1_420.RangeEndVar, A1_420.RangeEnd) - GetMathNumber(A0_419, A1_420.RangeBeginVarTable, A1_420.RangeBeginVar, A1_420.RangeBegin)
  if rangeSize == 0 then
    ratio = 0
  else
    ratio = (GetMathNumber(A0_419, A1_420.ValueVarTable, A1_420.ValueVar, A1_420.Value) - GetMathNumber(A0_419, A1_420.RangeBeginVarTable, A1_420.RangeBeginVar, A1_420.RangeBegin)) / rangeSize
  end
  if A1_420.Clamp == true then
    if 0 > ratio then
      ratio = 0
    elseif ratio > 1 then
      ratio = 1
    end
  end
  GetTable(A0_419, A1_420.RatioVarTable)[A1_420.RatioVar] = ratio
end
BBInterpolateFromValue = L0_0
function L0_0(A0_421, A1_422)
  local L2_423, L3_424
  L2_423 = GetMathNumber
  L3_424 = A0_421
  L2_423 = L2_423(L3_424, A1_422.RangeBeginVarTable, A1_422.RangeBeginVar, A1_422.RangeBegin)
  L3_424 = GetMathNumber
  L3_424 = L3_424(A0_421, A1_422.RangeEndVarTable, A1_422.RangeEndVar, A1_422.RangeEnd)
  rangeSize = L3_424 - L2_423
  scaler = rangeSize * GetMathNumber(A0_421, A1_422.RatioVarTable, A1_422.RatioVar, A1_422.Ratio)
  if A1_422.Clamp == true then
    if GetMathNumber(A0_421, A1_422.RatioVarTable, A1_422.RatioVar, A1_422.Ratio) < 0 then
    else
    end
  end
  GetTable(A0_421, A1_422.ValueVarTable)[A1_422.ValueVar] = L3_424
end
BBInterpolateFromRatio = L0_0
function L0_0(A0_425, A1_426)
  local L2_427, L3_428
  L2_427 = GetParam
  L3_428 = "Left"
  L2_427 = L2_427(L3_428, A0_425, A1_426)
  L3_428 = GetParam
  L3_428 = L3_428("Right", A0_425, A1_426)
  GetTable(A0_425, A1_426.DestVarTable, true)[A1_426.DestVar] = tostring(L2_427) .. tostring(L3_428)
end
BBAppendString = L0_0
function L0_0(A0_429, A1_430)
  local L2_431
  L2_431 = 0
  if A1_430.Delta ~= nil then
    L2_431 = L2_431 + A1_430.Delta
  end
  if A1_430.DeltaByLevel ~= nil and A0_429.Level ~= nil then
    L2_431 = L2_431 + A1_430.DeltaByLevel[A0_429.Level]
  end
  if A1_430.DeltaVar ~= nil then
    L2_431 = L2_431 + GetTable(A0_429, A1_430.DeltaVarTable, true)[A1_430.DeltaVar]
  end
  if A1_430.TargetVar ~= nil then
    A1_430.Stat(L2_431, A0_429[A1_430.TargetVar])
  else
    A1_430.Stat(L2_431)
  end
end
BBIncStat = L0_0
function L0_0(A0_432, A1_433)
  local L2_434
  L2_434 = 0
  if A1_433.Delta ~= nil then
    L2_434 = L2_434 + A1_433.Delta
  end
  if A1_433.DeltaByLevel ~= nil and A0_432.Level ~= nil then
    L2_434 = L2_434 + A1_433.DeltaByLevel[A0_432.Level]
  end
  if A1_433.DeltaVar ~= nil then
    L2_434 = L2_434 + GetTable(A0_432, A1_433.DeltaVarTable, true)[A1_433.DeltaVar]
  end
  if A1_433.TargetVar ~= nil then
    A1_433.Stat(L2_434, A0_432[A1_433.TargetVar])
  else
    A1_433.Stat(L2_434)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_435, A1_436)
  local L2_437, L3_438
  L2_437 = A1_436.TargetVar
  L3_438 = 0
  if A1_436.LaneVar ~= nil then
    L3_438 = L3_438 + GetTable(A0_435, A1_436.LaneVarTable, true)[A1_436.LaneVar]
  end
  if A1_436.Lane ~= nil then
    L3_438 = L3_438 + A1_436.Lane
  end
  SetMinionLane(A0_435[L2_437], L3_438)
end
BBSetMinionLane = L0_0
function L0_0(A0_439, A1_440)
  if A1_440.AttackVar ~= nil then
  end
  if A1_440.Attack ~= nil then
  end
  if A1_440.TotalCoefficientVar ~= nil then
  end
  if A1_440.TotalCoefficient ~= nil then
  end
  if A1_440.TargetVar ~= nil then
    GetTable(A0_439, A1_440.DestVarTable, false)[A1_440.DestVar] = (0 + GetTable(A0_439, A1_440.AttackVarTable, true)[A1_440.AttackVar] + A1_440.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_439[A1_440.TargetVar])) + GetFlatCritDamageMod(A0_439[A1_440.TargetVar])) * (0 + GetTable(A0_439, A1_440.TotalCoefficientVarTable, true)[A1_440.TotalCoefficientVar] + A1_440.TotalCoefficient)
  else
    GetTable(A0_439, A1_440.DestVarTable, false)[A1_440.DestVar] = 2 * A1_440.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_441, A1_442)
  local L2_443, L3_444, L4_445, L5_446, L6_447, L7_448, L8_449
  L2_443 = GetTable
  L3_444 = A0_441
  L4_445 = A1_442.DestVarTable
  L5_446 = false
  L2_443 = L2_443(L3_444, L4_445, L5_446)
  L3_444 = GetTable
  L4_445 = A0_441
  L5_446 = A1_442.AmountVarTable
  L6_447 = true
  L3_444 = L3_444(L4_445, L5_446, L6_447)
  L4_445 = GetTable
  L5_446 = A0_441
  L6_447 = A0_441.NextBuffVars
  L7_448 = false
  L4_445 = L4_445(L5_446, L6_447, L7_448)
  L5_446 = A1_442.AmountVar
  L5_446 = L3_444[L5_446]
  L6_447 = A1_442.Amount
  L5_446 = L5_446 + L6_447
  L4_445.InitializeShield_Amount = L5_446
  L5_446 = A1_442.AmountVar
  if L5_446 ~= nil then
    L5_446 = A1_442.HealShieldMod
    if L5_446 ~= nil and L5_446 == true then
      L6_447 = A1_442.Amount
      L7_448 = A1_442.AmountVar
      L7_448 = L3_444[L7_448]
      L6_447 = L6_447 + L7_448
      L7_448 = A1_442.AttackerVar
      L8_449 = 0
      if L7_448 ~= nil then
        L8_449 = GetPercentHealingAmountMod(A0_441[L7_448])
      end
      L6_447 = L6_447 * (1 + L8_449)
      L6_447 = L6_447 * (1 + GetPercentIncomingHealingAmountMod(A0_441[A1_442.UnitVar]))
      L3_444[A1_442.AmountVar] = L6_447
      L4_445.InitializeShield_Amount = L6_447
    end
  end
  L5_446 = SpellBuffAddNoRenew
  L6_447 = A1_442.AttackerVar
  L6_447 = A0_441[L6_447]
  L7_448 = A1_442.UnitVar
  L7_448 = A0_441[L7_448]
  L8_449 = "InitializeShieldMarker"
  L5_446(L6_447, L7_448, L8_449, 0, 1, 25000, L4_445)
  L5_446 = BBIncreaseShield
  L6_447 = A0_441
  L7_448 = A1_442
  L5_446(L6_447, L7_448)
end
BBInitializeShield = L0_0
function L0_0(A0_450, A1_451)
  if A1_451.CDVar ~= nil then
  end
  if A1_451.CD ~= nil then
  end
  if A1_451.TargetVar ~= nil then
    GetTable(A0_450, A1_451.DestVarTable, false)[A1_451.DestVar] = (0 + GetTable(A0_450, A1_451.CDVarTable, true)[A1_451.CDVar] + A1_451.CD) * (1 + GetPercentCooldownMod(A0_450[A1_451.TargetVar]))
  else
    GetTable(A0_450, A1_451.DestVarTable, false)[A1_451.DestVar] = A1_451.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_452, A1_453)
  local L2_454, L3_455
  L3_455 = A1_453.TargetVar
  if L3_455 ~= nil then
    L2_454 = A1_453.Stat(A0_452[L3_455])
  else
    L2_454 = A1_453.Stat()
  end
  SetVarInTable(A0_452, A1_453, L2_454)
end
BBGetStat = L0_0
function L0_0(A0_456, A1_457)
  if A1_457.TargetVar ~= nil then
    GetTable(A0_456, A1_457.DestVarTable, false)[A1_457.DestVar] = GetLevel(A0_456[A1_457.TargetVar])
  else
    GetTable(A0_456, A1_457.DestVarTable, false)[A1_457.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_458, A1_459)
  if A1_459.TargetVar ~= nil then
    GetTable(A0_458, A1_459.DestVarTable, false)[A1_459.DestVar] = GetUnitSignificance(A0_458[A1_459.TargetVar])
  else
    GetTable(A0_458, A1_459.DestVarTable, false)[A1_459.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_460, A1_461)
  if A1_461.TargetVar ~= nil then
    GetTable(A0_460, A1_461.DestVarTable, false)[A1_461.DestVar] = GetArmor(A0_460[A1_461.TargetVar])
  else
    GetTable(A0_460, A1_461.DestVarTable, false)[A1_461.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_462, A1_463)
  if A1_463.TargetVar ~= nil then
    GetTable(A0_462, A1_463.DestVarTable, false)[A1_463.DestVar] = GetSpellBlock(A0_462[A1_463.TargetVar])
  else
    GetTable(A0_462, A1_463.DestVarTable, false)[A1_463.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_464, A1_465)
  local L2_466, L3_467
  L3_467 = A1_465.TargetVar
  if L3_467 ~= nil then
    L2_466 = GetTeamID(A0_464[L3_467])
  else
    L2_466 = GetTeamID()
  end
  SetVarInTable(A0_464, A1_465, L2_466)
end
BBGetTeamID = L0_0
function L0_0(A0_468, A1_469)
  local L2_470, L3_471, L4_472
  L2_470 = GetTable
  L3_471 = A0_468
  L4_472 = A1_469.DestVarTable
  L2_470 = L2_470(L3_471, L4_472, false)
  L3_471 = A1_469.TargetVar
  L4_472 = nil
  if L3_471 ~= nil then
    L4_472 = GetTeamID(A0_468[L3_471])
  else
    L4_472 = GetTeamID()
  end
  if L4_472 == TEAM_ORDER then
    L2_470[A1_469.DestVar] = TEAM_CHAOS
  elseif L4_472 == TEAM_CHAOS then
    L2_470[A1_469.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_473, A1_474)
  if A1_474.TargetVar ~= nil then
    GetTable(A0_473, A1_474.DestVarTable, false)[A1_474.DestVar] = GetUnitSkinName(A0_473[A1_474.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_475, A1_476)
  local L2_477, L3_478, L4_479
  L2_477 = GetTable
  L3_478 = A0_475
  L4_479 = A1_476.DestVarTable
  L2_477 = L2_477(L3_478, L4_479, false)
  L3_478 = A0_475.Owner
  L4_479 = nil
  if A1_476.TargetVar ~= nil then
    L4_479 = GetTotalAttackDamage(A0_475[A1_476.TargetVar])
  else
    L4_479 = GetTotalAttackDamage()
  end
  SetVarInTable(A0_475, A1_476, L4_479)
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_480, A1_481)
  GetTable(A0_480, A1_481.DestVarTable, true)[A1_481.DestVar] = A1_481.Status(A0_480[A1_481.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_482, A1_483)
  local L2_484
  L2_484 = A1_483.TargetVar
  L2_484 = A0_482[L2_484]
  ClearAttackTarget(L2_484)
end
BBClearAttackTarget = L0_0
function L0_0(A0_485, A1_486)
  local L2_487, L3_488
  L2_487 = GetTable
  L3_488 = A0_485
  L2_487 = L2_487(L3_488, A1_486.DestVarTable, true)
  L3_488 = A1_486.Info
  L3_488 = L3_488(A0_485[A1_486.TargetVar])
  SetVarInTable(A0_485, A1_486, L3_488)
end
BBGetCastInfo = L0_0
function L0_0(A0_489, A1_490, A2_491)
  local L3_492, L4_493, L5_494, L6_495
  L3_492 = GetTable
  L4_493 = A0_489
  L5_494 = A1_490.TrackTimeVarTable
  L6_495 = false
  L3_492 = L3_492(L4_493, L5_494, L6_495)
  L4_493 = GetTime
  L4_493 = L4_493()
  L5_494 = A1_490.ExecuteImmediately
  L6_495 = GetParam
  L6_495 = L6_495("TimeBetweenExecutions", A0_489, A1_490)
  if A1_490.TickTimeVar ~= nil and GetTable(A0_489, A1_490.TickTimeVarTable, false)[A1_490.TickTimeVar] ~= nil then
    L6_495 = GetTable(A0_489, A1_490.TickTimeVarTable, false)[A1_490.TickTimeVar]
  end
  if L3_492[A1_490.TrackTimeVar] == nil then
    L3_492[A1_490.TrackTimeVar] = L4_493
    if L5_494 == true then
      ExecuteBuildingBlocks(A2_491, A0_489)
    end
  end
  if L4_493 >= L3_492[A1_490.TrackTimeVar] + L6_495 then
    L3_492[A1_490.TrackTimeVar] = L3_492[A1_490.TrackTimeVar] + L6_495
    ExecuteBuildingBlocks(A2_491, A0_489)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_496, A1_497, A2_498)
  GetTable(A0_496, A1_497.TrackTimeVarTable, false)[A1_497.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_499, A1_500)
  local L2_501
  L2_501 = A1_500.SrcValue
  if A1_500.SrcVar ~= nil then
    L2_501 = GetTable(A0_499, A1_500.SrcVarTable, true)[A1_500.SrcVar]
  end
  A1_500.Status(A0_499[A1_500.TargetVar], L2_501)
end
BBSetStatus = L0_0
function L0_0(A0_502, A1_503)
  local L2_504
  L2_504 = A1_503.ToAlert
  if GetTable(A0_502, A1_503.SrcVarTable, false) ~= nil and A1_503.SrcVar ~= nil then
    L2_504 = L2_504 .. GetTable(A0_502, A1_503.SrcVarTable, false)[A1_503.SrcVar]
  end
  _ALERT(L2_504)
end
BBAlert = L0_0
function L0_0(A0_505, A1_506)
  local L2_507, L3_508, L4_509, L5_510, L6_511, L7_512
  L2_507 = GetParam
  L3_508 = "Value"
  L4_509 = A0_505
  L5_510 = A1_506
  L2_507 = L2_507(L3_508, L4_509, L5_510)
  if L2_507 == nil then
    L3_508 = ReportError
    L4_509 = "Could not resolve Value param"
    L3_508(L4_509)
    return
  end
  L3_508 = true
  L4_509 = GetParam
  L5_510 = "OnUnit"
  L6_511 = A0_505
  L7_512 = A1_506
  L4_509 = L4_509(L5_510, L6_511, L7_512)
  if L4_509 == nil then
    L3_508 = false
    L5_510 = GetParam
    L6_511 = "OnUnitByFlag"
    L7_512 = A0_505
    L5_510 = L5_510(L6_511, L7_512, A1_506)
    L4_509 = L5_510
  end
  if L4_509 == nil then
    L5_510 = ReportError
    L6_511 = "Could not resolve OnUnit param"
    L5_510(L6_511)
    return
  end
  L5_510 = true
  L6_511 = GetParam
  L7_512 = "ChampionToSayTo"
  L6_511 = L6_511(L7_512, A0_505, A1_506)
  if L6_511 == nil then
    L5_510 = false
    L7_512 = GetParam
    L7_512 = L7_512("ChampionToSayToByFlag", A0_505, A1_506)
    L6_511 = L7_512
  end
  if L6_511 == nil then
    L7_512 = ReportError
    L7_512("Could not resolve ChampionToSayTo param")
    return
  end
  L7_512 = GetParam
  L7_512 = L7_512("ShowToSpectator", A0_505, A1_506)
  if L7_512 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  DisplayNumericFloatingTextOnUnitToChampion(L2_507, A1_506.TextType, L4_509, L3_508, L6_511, L5_510, L7_512)
end
BBDisplayNumericFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_513, A1_514)
  local L2_515, L3_516, L4_517, L5_518, L6_519, L7_520
  L2_515 = GetParam
  L3_516 = "Message"
  L4_517 = A0_513
  L5_518 = A1_514
  L2_515 = L2_515(L3_516, L4_517, L5_518)
  if L2_515 == nil then
    L3_516 = ReportError
    L4_517 = "Could not resolve Message param"
    L3_516(L4_517)
    return
  end
  L3_516 = true
  L4_517 = GetParam
  L5_518 = "OnUnit"
  L6_519 = A0_513
  L7_520 = A1_514
  L4_517 = L4_517(L5_518, L6_519, L7_520)
  if L4_517 == nil then
    L3_516 = false
    L5_518 = GetParam
    L6_519 = "OnUnitByFlag"
    L7_520 = A0_513
    L5_518 = L5_518(L6_519, L7_520, A1_514)
    L4_517 = L5_518
  end
  if L4_517 == nil then
    L5_518 = ReportError
    L6_519 = "Could not resolve OnUnit param"
    L5_518(L6_519)
    return
  end
  L5_518 = true
  L6_519 = GetParam
  L7_520 = "ChampionToSayTo"
  L6_519 = L6_519(L7_520, A0_513, A1_514)
  if L6_519 == nil then
    L5_518 = false
    L7_520 = GetParam
    L7_520 = L7_520("ChampionToSayToByFlag", A0_513, A1_514)
    L6_519 = L7_520
  end
  if L6_519 == nil then
    L7_520 = ReportError
    L7_520("Could not resolve ChampionToSayTo param")
    return
  end
  L7_520 = GetParam
  L7_520 = L7_520("ShowToSpectator", A0_513, A1_514)
  if L7_520 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  SayWithFloatingTextOnUnitToChampion(tostring(L2_515), A1_514.TextType, L4_517, L3_516, L6_519, L5_518, L7_520)
end
BBSayWithFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_521, A1_522)
  local L2_523, L3_524, L4_525
  L2_523 = A1_522.ToSay
  L3_524 = GetTable
  L4_525 = A0_521
  L3_524 = L3_524(L4_525, A1_522.SrcVarTable, false)
  if L3_524 ~= nil then
    L4_525 = A1_522.SrcVar
    if L4_525 ~= nil then
      L4_525 = L2_523
      L2_523 = L4_525 .. tostring(L3_524[A1_522.SrcVar])
    end
  end
  L4_525 = nil
  if A1_522.OwnerVar ~= nil then
    L4_525 = A0_521[A1_522.OwnerVar]
  else
    L4_525 = A0_521.Owner
  end
  if A1_522.TextType == nil then
    A1_522.TextType = 0
  end
  Say(L4_525, L2_523, A1_522.TextType)
end
BBSay = L0_0
function L0_0(A0_526, A1_527)
  local L2_528, L3_529, L4_530
  L2_528 = A1_527.ToSay
  L3_529 = GetTable
  L4_530 = A0_526
  L3_529 = L3_529(L4_530, A1_527.SrcVarTable, false)
  if L3_529 ~= nil then
    L4_530 = A1_527.SrcVar
    if L4_530 ~= nil then
      L4_530 = L2_528
      L2_528 = L4_530 .. tostring(L3_529[A1_527.SrcVar])
    end
  end
  L4_530 = nil
  if A1_527.OwnerVar ~= nil then
    L4_530 = A0_526[A1_527.OwnerVar]
  else
    L4_530 = A0_526.Owner
  end
  if A1_527.TextType == nil then
    A1_527.TextType = 0
  end
  Say(L4_530, L2_528, A1_527.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_531, A1_532)
  GetTable(A0_531, A1_532.DestVarTable, true)[A1_532.DestVar] = BBLuaGetGold(A0_531, A1_532)
end
BBGetGold = L0_0
function L0_0(A0_533, A1_534)
  GetTable(A0_533, A1_534.DestVarTable, true)[A1_534.DestVar] = BBLuaGetTotalGold(A0_533, A1_534)
end
BBGetTotalGold = L0_0
function L0_0(A0_535, A1_536)
  A0_535.CharVars.TeleportTargetPosition = GetTable(A0_535, A1_536.CastPositionNameTable)[A1_536.CastPositionName]
  SpellBuffAdd(A0_535[A1_536.OwnerVar], A0_535[A1_536.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_535.NextBuffVars)
  BBTeleportToPositionHelper(A0_535, A1_536)
end
BBTeleportToPosition = L0_0
function L0_0(A0_537, A1_538)
  if A1_538.XVar ~= nil and GetTable(A0_537, A1_538.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_537, A1_538.XVarTable, true)[A1_538.XVar]
  else
    Xloc = A1_538.X
  end
  if A1_538.YVar ~= nil and GetTable(A0_537, A1_538.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_537, A1_538.YVarTable, true)[A1_538.YVar]
  else
    Yloc = A1_538.Y
  end
  if A1_538.ZVar ~= nil and GetTable(A0_537, A1_538.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_537, A1_538.ZVarTable, true)[A1_538.ZVar]
  else
    Zloc = A1_538.Z
  end
  A1_538.OwnerVar, A0_537.position = A1_538.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_538.CastPositionName = "position"
  BBTeleportToPosition(A0_537, A1_538)
end
BBTeleportToPoint = L0_0
function L0_0(A0_539, A1_540)
  A1_540.TimeoutInFOW = 999999
  A1_540.BindFlexToOwnerPAR = false
  A1_540.Flags = 0
  A1_540.FollowsGroundTilt = false
  A1_540.FacesTarget = false
  A1_540.HideFromSpectator = false
  A1_540.SendIfOnScreenOrDiscard = false
  A1_540.PersistsThroughReconnect = true
  A1_540.FOWVisibilityRadius = 10
  A1_540.Scale = 1
  A1_540.BindObjectVar = A1_540.BindObject1Var
  A1_540.EffectID2Var = A1_540.OtherTeamEffectIDVar
  A1_540.TargetObjectVar = A1_540.BindObject2Var
  A1_540.FOWTeamOverrideVar = A1_540.FOWTeamVar
  A1_540.BoneName = A1_540.BindObject1BoneName
  A1_540.TargetBoneName = A1_540.BindObject2BoneName
  A1_540.EffectName = A1_540.EffectParticleFile
  A1_540.EffectNameForOtherTeam = A1_540.OtherTeamParticleFile
  BBSpellEffectCreate(A0_539, A1_540)
end
BBSpellEffectCreate_EasyBeam = L0_0
function L0_0(A0_541, A1_542)
  A1_542.TimeoutInFOW = 999999
  A1_542.BindFlexToOwnerPAR = false
  A1_542.Flags = 0
  A1_542.FollowsGroundTilt = false
  A1_542.FacesTarget = false
  A1_542.HideFromSpectator = false
  A1_542.SendIfOnScreenOrDiscard = true
  A1_542.PersistsThroughReconnect = false
  A1_542.FOWVisibilityRadius = 10
  A1_542.Scale = 1
  A1_542.FOWTeamOverrideVar = A1_542.FOWTeamVar
  A1_542.EffectName = A1_542.ParticleFile
  A1_542.EffectNameForOtherTeam = A1_542.ParticleFileForOtherTeam
  A1_542.BoneName = A1_542.BindObjectBoneName
  BBSpellEffectCreate(A0_541, A1_542)
end
BBSpellEffectCreate_EasyHit = L0_0
function L0_0(A0_543, A1_544)
  local L2_545, L3_546, L4_547, L5_548, L6_549, L7_550, L8_551, L9_552, L10_553, L11_554, L12_555
  L3_546 = A1_544.TargetVar
  if L3_546 ~= nil then
    L3_546 = A1_544.TargetVar
    L2_545 = A0_543[L3_546]
  else
    L2_545 = A0_543.Target
  end
  L3_546 = {
    L4_547,
    L5_548,
    L6_549
  }
  L4_547.maxSlot = 3
  L4_547.spellbook = L5_548
  L4_547.stype = L5_548
  L5_548.maxSlot = 6
  L5_548.spellbook = L6_549
  L5_548.stype = L6_549
  L6_549.maxSlot = 1
  L7_550 = SPELLBOOK_SUMMONER
  L6_549.spellbook = L7_550
  L7_550 = SpellSlots
  L6_549.stype = L7_550
  for L7_550, L8_551 in L4_547(L5_548) do
    A1_544.SpellbookType = L9_552
    A1_544.SlotType = L9_552
    for L12_555 = 0, L8_551.maxSlot do
      if HasSpellTag(L2_545, L12_555, A1_544.SpellbookType, A1_544.SlotType, A1_544.SpellTag) ~= A1_544.InvertResult then
        A1_544.SpellSlot = L12_555
        BBSealSpellSlot(A0_543, A1_544)
      end
    end
  end
end
BBSealSpellSlotsWithTag = L0_0
function L0_0(A0_556, A1_557)
  ReincarnateNonDeadHero(GetTable(A0_556, A1_557.TargetTable, false)[A1_557.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_558, A1_559)
  GetTable(A0_558, A1_559.DestVarTable, true)[A1_559.DestVar] = A1_559.Function(A0_558[A1_559.OwnerVar], A1_559.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_560, A1_561)
  local L2_562, L3_563, L4_564, L5_565
  L2_562 = A1_561.WhomToOrderVar
  L2_562 = A0_560[L2_562]
  L3_563 = A1_561.TargetOfOrderVar
  L3_563 = A0_560[L3_563]
  L4_564 = GetTable
  L5_565 = A0_560
  L4_564 = L4_564(L5_565, A1_561.SrcVarTable, false)
  L5_565 = nil
  if A1_561.SrcVar ~= nil and L4_564 ~= nil then
    L5_565 = L4_564[A1_561.SrcVar]
  else
    L5_565 = GetPosition(L3_563)
  end
  if L3_563 == nil then
    L3_563 = L2_562
  end
  IssueOrder(L2_562, A1_561.Order, L5_565, L3_563)
end
BBIssueOrder = L0_0
function L0_0(A0_566, A1_567)
  local L2_568
  L2_568 = GetParam
  L2_568 = L2_568("NewRange", A0_566, A1_567)
  SetSpellCastRange(L2_568)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_569, A1_570)
  GetTable(A0_569, A1_570.DestVarTable, true)[A1_570.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_571, A1_572)
  local L2_573, L3_574
  L2_573 = A1_572.ObjectVar1
  L2_573 = A0_571[L2_573]
  L3_574 = A1_572.ObjectVar2
  L3_574 = A0_571[L3_574]
  GetTable(A0_571, A1_572.DestVarTable, true)[A1_572.DestVar] = DistanceBetweenObjectBounds(L2_573, L3_574)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_575, A1_576)
  local L2_577, L3_578, L4_579
  L2_577 = A1_576.ObjectVar
  L2_577 = A0_575[L2_577]
  L3_578 = GetTable
  L4_579 = A0_575
  L3_578 = L3_578(L4_579, A1_576.PointVarTable, true)
  L4_579 = A1_576.PointVar
  L4_579 = L3_578[L4_579]
  GetTable(A0_575, A1_576.DestVarTable, true)[A1_576.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_577, L4_579)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_580, A1_581)
  local L2_582, L3_583
  L2_582 = GetParam
  L3_583 = "Point1"
  L2_582 = L2_582(L3_583, A0_580, A1_581)
  L3_583 = GetParam
  L3_583 = L3_583("Point2", A0_580, A1_581)
  GetTable(A0_580, A1_581.DestVarTable, true)[A1_581.DestVar] = DistanceBetweenPoints(L2_582, L3_583)
end
BBDistanceBetweenPoints = L0_0
function L0_0(A0_584, A1_585)
  local L2_586, L3_587
  L2_586 = GetParam
  L3_587 = "Point1"
  L2_586 = L2_586(L3_587, A0_584, A1_585)
  L3_587 = GetParam
  L3_587 = L3_587("Point2", A0_584, A1_585)
  GetTable(A0_584, A1_585.DestVarTable, true)[A1_585.DestVar] = DistanceBetweenPointsXZ(L2_586, L3_587)
end
BBDistanceBetweenPointsXZ = L0_0
function L0_0(A0_588, A1_589)
  local L2_590, L3_591, L4_592
  L2_590 = A1_589.ObjectVar
  L2_590 = A0_588[L2_590]
  L3_591 = GetTable
  L4_592 = A0_588
  L3_591 = L3_591(L4_592, A1_589.PointVarTable, true)
  L4_592 = A1_589.PointVar
  L4_592 = L3_591[L4_592]
  GetTable(A0_588, A1_589.DestVarTable, true)[A1_589.DestVar] = WalkDistanceBetweenObjectCenterAndPoint(L2_590, L4_592)
end
BBWalkDistanceBetweenObjectAndPoint = L0_0
L0_0 = 0
OBJECT_BOUNDARY = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
function L0_0(A0_593, A1_594, A2_595)
  local L3_596, L4_597, L5_598, L6_599, L7_600, L8_601
  L5_598 = 0
  L6_599 = nil
  L7_600 = A1_594.ObjectDistanceType
  L8_601 = A1_594.ObjectVar1
  L3_596 = A0_593[L8_601]
  L8_601 = A1_594.ObjectVar2
  L4_597 = A0_593[L8_601]
  if nil == L4_597 then
    L8_601 = A1_594.Point2Var
    if nil ~= L8_601 then
      L8_601 = GetTable
      L8_601 = L8_601(A0_593, A1_594.Point2VarTable, true)
      L4_597 = L8_601[A1_594.Point2Var]
      L5_598 = L5_598 + 1
    end
  end
  if nil == L3_596 then
    L8_601 = A1_594.Point1Var
    if nil ~= L8_601 then
      L8_601 = GetTable
      L8_601 = L8_601(A0_593, A1_594.Point1VarTable, true)
      L3_596 = L8_601[A1_594.Point1Var]
      L5_598 = L5_598 + 1
      if 1 == L5_598 then
        L3_596, L4_597 = L4_597, L3_596
      end
    end
  end
  if nil ~= L7_600 then
    if 0 == L5_598 then
      L8_601 = OBJECT_CENTER
      if L8_601 == L7_600 then
        L6_599 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_601 = OBJECT_BOUNDARY
        if L8_601 == L7_600 then
          L6_599 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_601 = A1_594.OwnerVar
          L8_601 = A0_593[L8_601]
          Say(L8_601, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_598 then
      L8_601 = OBJECT_CENTER
      if L8_601 == L7_600 then
        L6_599 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_601 = OBJECT_BOUNDARY
        if L8_601 == L7_600 then
          L6_599 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_601 = A1_594.OwnerVar
          L8_601 = A0_593[L8_601]
          Say(L8_601, "invalid object distance type", 0)
        end
      end
    else
      L6_599 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_601 = A1_594.Distance
  if A1_594.DistanceVar ~= nil and GetTable(A0_593, A1_594.DistanceVarTable, true) ~= nil then
    L8_601 = L8_601 + GetTable(A0_593, A1_594.DistanceVarTable, true)[A1_594.DistanceVar]
  end
  if L3_596 ~= nil and L4_597 ~= nil and L6_599 ~= nil and L8_601 ~= nil then
    if not L6_599(L3_596, L4_597, L8_601) then
      ExecuteBuildingBlocks(A2_595, A0_593)
      A0_593.LastIfSucceeded = true
    else
      A0_593.LastIfSucceeded = false
    end
  else
    A0_593.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_602, A1_603)
  local L2_604, L3_605
  L2_604 = A1_603.TargetVar
  L2_604 = A0_602[L2_604]
  L3_605 = A1_603.CasterVar
  L3_605 = A0_602[L3_605]
  GetTable(A0_602, A1_603.DestVarTable, true)[A1_603.DestVar] = SpellBuffCount(L2_604, A1_603.BuffName, L3_605)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_606, A1_607)
  local L2_608
  L2_608 = A1_607.TargetVar
  L2_608 = A0_606[L2_608]
  GetTable(A0_606, A1_607.DestVarTable, true)[A1_607.DestVar] = SpellBuffCount(L2_608, A1_607.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_609, A1_610)
  local L2_611, L3_612
  L2_611 = GetTable
  L3_612 = A0_609
  L2_611 = L2_611(L3_612, A1_610.ScaleVarTable, false)
  L3_612 = nil
  if A1_610.OwnerVar ~= nil then
    L3_612 = A0_609[A1_610.OwnerVar]
  else
    L3_612 = A0_609.Owner
  end
  if A1_610.ScaleVar ~= nil and A1_610.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_611[A1_610.ScaleVar], L3_612)
  else
    SetScaleSkinCoef(A1_610.Scale, L3_612)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_613, A1_614)
  SpellBuffAdd(A0_613[A1_614.TargetVar], A0_613[A1_614.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_613.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_615, A1_616, A2_617)
  local L3_618, L4_619
  L3_618 = A1_616.TargetVar
  L3_618 = A0_615[L3_618]
  L4_619 = A1_616.NumStacks
  if GetParam("NumStacks", A0_615, A1_616) == 0 then
    L4_619 = SpellBuffCount(L3_618, A1_616.BuffName, caster)
  else
    L4_619 = GetParam("NumStacks", A0_615, A1_616)
  end
  while L4_619 > 0 do
    SpellBuffRemove(L3_618, A1_616.BuffName, A0_615[A1_616.AttackerVar])
    L4_619 = L4_619 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_620, A1_621)
  local L2_622, L3_623
  L2_622 = GetParam
  L3_623 = "Unit"
  L2_622 = L2_622(L3_623, A0_620, A1_621)
  unit = L2_622
  L2_622 = unit
  if L2_622 == nil then
    L2_622 = ReportError
    L3_623 = "Could not resolve Unit param"
    L2_622(L3_623)
    return
  end
  L2_622 = true
  L3_623 = GetParam
  L3_623 = L3_623("ChampionToShowTo", A0_620, A1_621)
  if L3_623 == nil then
    L2_622 = false
    L3_623 = GetParam("ChampionToShowToByFlag", A0_620, A1_621)
  end
  if L3_623 == nil then
    ReportError("Could not resolve ChampionToShowTo param")
    return
  end
  SetShowHealthBarToChampion(unit, A1_621.Show, L3_623, L2_622, A1_621.ApplyToSpectator)
end
BBSetShowHealthBarToChampion = L0_0
function L0_0(A0_624, A1_625)
  if GetParam("Vector", A0_624, A1_625) ~= nil then
    GetTable(A0_624, A1_625.DestVarTable, false)[A1_625.DestVar] = math.sqrt(GetParam("Vector", A0_624, A1_625).x * GetParam("Vector", A0_624, A1_625).x + GetParam("Vector", A0_624, A1_625).y * GetParam("Vector", A0_624, A1_625).y + GetParam("Vector", A0_624, A1_625).z * GetParam("Vector", A0_624, A1_625).z)
  end
end
BBGetVectorLength = L0_0
function L0_0(A0_626, A1_627, A2_628)
  if A0_626.EmoteId == A1_627.EmoteId then
    ExecuteBuildingBlocks(A2_628, A0_626)
    A0_626.LastIfSucceeded = true
  else
    A0_626.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_629, A1_630, A2_631)
  if A0_629.EmoteId ~= A1_630.EmoteId then
    ExecuteBuildingBlocks(A2_631, A0_629)
    A0_629.LastIfSucceeded = true
  else
    A0_629.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_632, A1_633)
  local L2_634, L3_635, L4_636, L5_637
  L2_634 = GetTable
  L3_635 = A0_632
  L4_636 = A1_633.String1VarTable
  L5_637 = false
  L2_634 = L2_634(L3_635, L4_636, L5_637)
  L3_635 = A1_633.String1Var
  L3_635 = L2_634[L3_635]
  L4_636 = GetTable
  L5_637 = A0_632
  L4_636 = L4_636(L5_637, A1_633.String2VarTable, false)
  L5_637 = A1_633.String2Var
  L5_637 = L4_636[L5_637]
  GetTable(A0_632, A1_633.ResultVarTable, false)[A1_633.ResultVar] = L3_635 .. L5_637
end
BBConcatenateStrings = L0_0
function L0_0(A0_638, A1_639)
  local L2_640, L3_641
  L2_640 = GetTable
  L3_641 = A0_638
  L2_640 = L2_640(L3_641, A1_639.VariableVarTable, false)
  L3_641 = A1_639.VariableVar
  L3_641 = L2_640[L3_641]
  GetTable(A0_638, A1_639.ResultVarTable, false)[A1_639.ResultVar] = "(" .. L3_641 .. ")"
end
BBEncaseInParantheses = L0_0
function L0_0(A0_642, A1_643)
  BBGetMinionKills(A0_642, A1_643)
  A0_642.MinionKillSource = GetParam("MinionKillTarget")
  A0_642.MinionKills = A0_642.MinionsKilled + GetParam("MinionKills", A0_642, A1_643)
  BBSetMinionKills(A0_642, A1_643)
end
BBIncreaseMinionKills = L0_0
function L0_0(A0_644, A1_645)
end
BBForcePreload = L0_0
