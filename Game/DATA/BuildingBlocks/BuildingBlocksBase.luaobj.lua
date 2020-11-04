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
  local L3_302, L4_303, L5_304
  L5_304 = GetParam
  L5_304 = L5_304("BuffName", A0_299, A1_300)
  if A1_300.OwnerVar ~= nil then
    L3_302 = A0_299[A1_300.OwnerVar]
  else
    L3_302 = A0_299.Owner
  end
  if A1_300.AttackerVar ~= nil then
    L4_303 = A0_299[A1_300.AttackerVar]
  else
    L4_303 = A0_299.Attacker
  end
  if SpellBuffCount(L3_302, L5_304, L4_303) > 0 then
    ExecuteBuildingBlocks(A2_301, A0_299)
    A0_299.LastIfSucceeded = true
  else
    A0_299.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_305, A1_306, A2_307)
  if BBIsMissileAutoAttack(A0_305, A1_306) then
    ExecuteBuildingBlocks(A2_307, A0_305)
    A0_305.LastIfSucceeded = true
  else
    A0_305.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_308, A1_309, A2_310)
  if BBIsMissileConsideredAsAutoAttack(A0_308, A1_309) then
    ExecuteBuildingBlocks(A2_310, A0_308)
    A0_308.LastIfSucceeded = true
  else
    A0_308.LastIfSucceeded = false
  end
end
BBIfMissileConsideredAsAutoAttack = L0_0
function L0_0(A0_311, A1_312)
  A0_311.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_313, A1_314, A2_315)
  local L3_316, L4_317
  if A1_314.OwnerVar ~= nil then
    L3_316 = A0_313[A1_314.OwnerVar]
  else
    L3_316 = A0_313.Owner
  end
  if A1_314.CasterVar ~= nil then
    L4_317 = A0_313[A1_314.CasterVar]
  else
    L4_317 = A0_313.Caster
  end
  if SpellBuffCount(L3_316, A1_314.BuffName, L4_317) <= 0 then
    ExecuteBuildingBlocks(A2_315, A0_313)
    A0_313.LastIfSucceeded = true
  else
    A0_313.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_318, A1_319, A2_320)
  local L3_321
  if A1_319.TargetVar ~= nil then
    L3_321 = A0_318[A1_319.TargetVar]
  else
    L3_321 = A0_318.Owner
  end
  if HasUnitTag(L3_321, A1_319.UnitTag) ~= A1_319.InvertResult then
    ExecuteBuildingBlocks(A2_320, A0_318)
    A0_318.LastIfSucceeded = true
  else
    A0_318.LastIfSucceeded = false
  end
end
BBIfHasUnitTag = L0_0
function L0_0(A0_322, A1_323, A2_324)
  local L3_325, L4_326
  L4_326 = A1_323.OwnerVar
  if L4_326 ~= nil then
    L4_326 = A1_323.OwnerVar
    L3_325 = A0_322[L4_326]
  else
    L3_325 = A0_322.Owner
  end
  L4_326 = GetParam
  L4_326 = L4_326("SpellSlot", A0_322, A1_323)
  if HasSpellTag(L3_325, L4_326, A1_323.SpellbookType, A1_323.SlotType, A1_323.SpellTag) ~= A1_323.InvertResult then
    ExecuteBuildingBlocks(A2_324, A0_322)
    A0_322.LastIfSucceeded = true
  else
    A0_322.LastIfSucceeded = false
  end
end
BBIfHasSpellTag = L0_0
function L0_0(A0_327, A1_328, A2_329)
  local L3_330, L4_331
  if A1_328.OwnerVar ~= nil then
    L3_330 = A0_327[A1_328.OwnerVar]
  else
    L3_330 = A0_327.Owner
  end
  if HasPARType(L3_330, A1_328.PARType) then
    ExecuteBuildingBlocks(A2_329, A0_327)
    A0_327.LastIfSucceeded = true
  else
    A0_327.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_332, A1_333, A2_334)
  local L3_335, L4_336
  if A1_333.OwnerVar ~= nil then
    L3_335 = A0_332[A1_333.OwnerVar]
  else
    L3_335 = A0_332.Owner
  end
  if not HasPARType(L3_335, A1_333.PARType) then
    ExecuteBuildingBlocks(A2_334, A0_332)
    A0_332.LastIfSucceeded = true
  else
    A0_332.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_337, A1_338, A2_339)
  local L3_340, L4_341, L5_342, L6_343, L7_344
  L3_340 = GetTable
  L4_341 = A0_337
  L5_342 = A1_338.Src1VarTable
  L6_343 = false
  L3_340 = L3_340(L4_341, L5_342, L6_343)
  L4_341 = GetTable
  L5_342 = A0_337
  L6_343 = A1_338.Src2VarTable
  L7_344 = false
  L4_341 = L4_341(L5_342, L6_343, L7_344)
  L5_342 = true
  while L5_342 do
    L6_343 = false
    L7_344 = nil
    if L3_340 ~= nil and A1_338.Src1Var ~= nil then
      L7_344 = L3_340[A1_338.Src1Var]
    else
      L7_344 = A1_338.Value1
    end
    if L4_341 ~= nil and A1_338.Src2Var ~= nil then
      L6_343 = A1_338.CompareOp(L7_344, L4_341[A1_338.Src2Var])
    else
      L6_343 = A1_338.CompareOp(L7_344, A1_338.Value2)
    end
    if L6_343 then
      ExecuteBuildingBlocks(A2_339, A0_337)
    else
      L5_342 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_345, A1_346, A2_347)
  local L3_348, L4_349, L5_350
  L3_348 = GetParam
  L4_349 = "Start"
  L5_350 = A0_345
  L3_348 = L3_348(L4_349, L5_350, A1_346)
  L4_349 = GetParam
  L5_350 = "End"
  L4_349 = L4_349(L5_350, A0_345, A1_346)
  L5_350 = L3_348
  while L4_349 >= L5_350 do
    SetVarInTable(A0_345, A1_346, L5_350)
    ExecuteBuildingBlocks(A2_347, A0_345)
    L5_350 = L5_350 + 1
  end
end
BBFor = L0_0
function L0_0(A0_351, A1_352)
  return A0_351 * A1_352
end
MO_MULTIPLY = L0_0
function L0_0(A0_353, A1_354)
  return A0_353 + A1_354
end
MO_ADD = L0_0
function L0_0(A0_355, A1_356)
  return A0_355 - A1_356
end
MO_SUBTRACT = L0_0
function L0_0(A0_357, A1_358)
  return A0_357 / A1_358
end
MO_DIVIDE = L0_0
function L0_0(A0_359, A1_360)
  return math.floor(A0_359 / A1_360)
end
MO_INT_DIVIDE = L0_0
function L0_0(A0_361, A1_362)
  if A0_361 < A1_362 then
    return A0_361
  else
    return A1_362
  end
end
MO_MIN = L0_0
function L0_0(A0_363, A1_364)
  if A1_364 < A0_363 then
    return A0_363
  else
    return A1_364
  end
end
MO_MAX = L0_0
function L0_0(A0_365, A1_366)
  return A0_365 % A1_366
end
MO_MODULO = L0_0
function L0_0(A0_367)
  return math.floor(A0_367 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_368)
  return math.ceil(A0_368)
end
MO_ROUNDUP = L0_0
function L0_0(A0_369)
  return math.floor(A0_369)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_370)
  return math.sin(math.rad(A0_370))
end
MO_SIN = L0_0
function L0_0(A0_371)
  return math.cos(math.rad(A0_371))
end
MO_COSINE = L0_0
function L0_0(A0_372)
  return math.tan(math.rad(A0_372))
end
MO_TANGENT = L0_0
function L0_0(A0_373)
  return math.deg(math.asin(A0_373))
end
MO_ASIN = L0_0
function L0_0(A0_374)
  return math.deg(math.acos(A0_374))
end
MO_ACOS = L0_0
function L0_0(A0_375)
  return math.deg(math.atan(A0_375))
end
MO_ATAN = L0_0
function L0_0(A0_376, A1_377)
  return math.pow(A0_376, A1_377)
end
MO_POW = L0_0
function L0_0(A0_378)
  return math.sqrt(A0_378)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_379, A1_380)
  local L2_381
  L2_381 = A0_379 and A1_380
  return L2_381
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_382, A1_383)
  local L2_384
  L2_384 = A0_382 or A1_383
  return L2_384
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_385)
  local L1_386
  L1_386 = not A0_385
  return L1_386
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_387)
  return math.abs(A0_387)
end
MO_ABS = L0_0
function L0_0(A0_388, A1_389)
  return math.random(A0_388, A1_389)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_390, A1_391)
  local L2_392, L3_393, L4_394, L5_395
  L2_392 = GetMathNumber
  L3_393 = A0_390
  L4_394 = A1_391.Src1VarTable
  L5_395 = A1_391.Src1Var
  L2_392 = L2_392(L3_393, L4_394, L5_395, A1_391.Src1Value)
  L3_393 = GetMathNumber
  L4_394 = A0_390
  L5_395 = A1_391.Src2VarTable
  L3_393 = L3_393(L4_394, L5_395, A1_391.Src2Var, A1_391.Src2Value)
  L4_394 = GetTable
  L5_395 = A0_390
  L4_394 = L4_394(L5_395, A1_391.DestVarTable)
  L5_395 = A1_391.MathOp
  L5_395 = L5_395(L2_392, L3_393)
  SetVarInTable(A0_390, A1_391, L5_395)
end
BBMath = L0_0
function L0_0(A0_396, A1_397, A2_398, A3_399)
  if A2_398 ~= nil and GetTable(A0_396, A1_397)[A2_398] ~= nil then
    return GetTable(A0_396, A1_397)[A2_398]
  end
  return A3_399
end
GetMathNumber = L0_0
function L0_0(A0_400, A1_401)
  if type(A1_401) == "number" then
    return A1_401
  elseif type(A1_401) == "function" then
    return A1_401(A0_400)
  elseif type(A1_401) == "string" then
    return A0_400[A1_401]
  end
end
GetNumber = L0_0
function L0_0(A0_402, A1_403)
  return VectorAdd(A0_402, A1_403)
end
VEC_ADD = L0_0
function L0_0(A0_404, A1_405)
  return VectorSubtract(A0_404, A1_405)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_406, A1_407)
  return VectorScalarMultiply(A0_406, A1_407)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_408, A1_409)
  return VectorScalarDivide(A0_408, A1_409)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_410, A1_411)
  return VectorRotateY(A0_410, A1_411)
end
VEC_ROTATE = L0_0
function L0_0(A0_412, A1_413)
  BBMath(A0_412, A1_413)
end
BBVectorMath = L0_0
function L0_0(A0_414, A1_415)
  rangeSize = GetMathNumber(A0_414, A1_415.RangeEndVarTable, A1_415.RangeEndVar, A1_415.RangeEnd) - GetMathNumber(A0_414, A1_415.RangeBeginVarTable, A1_415.RangeBeginVar, A1_415.RangeBegin)
  if rangeSize == 0 then
    ratio = 0
  else
    ratio = (GetMathNumber(A0_414, A1_415.ValueVarTable, A1_415.ValueVar, A1_415.Value) - GetMathNumber(A0_414, A1_415.RangeBeginVarTable, A1_415.RangeBeginVar, A1_415.RangeBegin)) / rangeSize
  end
  if A1_415.Clamp == true then
    if 0 > ratio then
      ratio = 0
    elseif ratio > 1 then
      ratio = 1
    end
  end
  GetTable(A0_414, A1_415.RatioVarTable)[A1_415.RatioVar] = ratio
end
BBInterpolateFromValue = L0_0
function L0_0(A0_416, A1_417)
  local L2_418, L3_419
  L2_418 = GetMathNumber
  L3_419 = A0_416
  L2_418 = L2_418(L3_419, A1_417.RangeBeginVarTable, A1_417.RangeBeginVar, A1_417.RangeBegin)
  L3_419 = GetMathNumber
  L3_419 = L3_419(A0_416, A1_417.RangeEndVarTable, A1_417.RangeEndVar, A1_417.RangeEnd)
  rangeSize = L3_419 - L2_418
  scaler = rangeSize * GetMathNumber(A0_416, A1_417.RatioVarTable, A1_417.RatioVar, A1_417.Ratio)
  if A1_417.Clamp == true then
    if GetMathNumber(A0_416, A1_417.RatioVarTable, A1_417.RatioVar, A1_417.Ratio) < 0 then
    else
    end
  end
  GetTable(A0_416, A1_417.ValueVarTable)[A1_417.ValueVar] = L3_419
end
BBInterpolateFromRatio = L0_0
function L0_0(A0_420, A1_421)
  local L2_422, L3_423
  L2_422 = GetParam
  L3_423 = "Left"
  L2_422 = L2_422(L3_423, A0_420, A1_421)
  L3_423 = GetParam
  L3_423 = L3_423("Right", A0_420, A1_421)
  GetTable(A0_420, A1_421.DestVarTable, true)[A1_421.DestVar] = tostring(L2_422) .. tostring(L3_423)
end
BBAppendString = L0_0
function L0_0(A0_424, A1_425)
  local L2_426
  L2_426 = 0
  if A1_425.Delta ~= nil then
    L2_426 = L2_426 + A1_425.Delta
  end
  if A1_425.DeltaByLevel ~= nil and A0_424.Level ~= nil then
    L2_426 = L2_426 + A1_425.DeltaByLevel[A0_424.Level]
  end
  if A1_425.DeltaVar ~= nil then
    L2_426 = L2_426 + GetTable(A0_424, A1_425.DeltaVarTable, true)[A1_425.DeltaVar]
  end
  if A1_425.TargetVar ~= nil then
    A1_425.Stat(L2_426, A0_424[A1_425.TargetVar])
  else
    A1_425.Stat(L2_426)
  end
end
BBIncStat = L0_0
function L0_0(A0_427, A1_428)
  local L2_429
  L2_429 = 0
  if A1_428.Delta ~= nil then
    L2_429 = L2_429 + A1_428.Delta
  end
  if A1_428.DeltaByLevel ~= nil and A0_427.Level ~= nil then
    L2_429 = L2_429 + A1_428.DeltaByLevel[A0_427.Level]
  end
  if A1_428.DeltaVar ~= nil then
    L2_429 = L2_429 + GetTable(A0_427, A1_428.DeltaVarTable, true)[A1_428.DeltaVar]
  end
  if A1_428.TargetVar ~= nil then
    A1_428.Stat(L2_429, A0_427[A1_428.TargetVar])
  else
    A1_428.Stat(L2_429)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_430, A1_431)
  local L2_432, L3_433
  L2_432 = A1_431.TargetVar
  L3_433 = 0
  if A1_431.LaneVar ~= nil then
    L3_433 = L3_433 + GetTable(A0_430, A1_431.LaneVarTable, true)[A1_431.LaneVar]
  end
  if A1_431.Lane ~= nil then
    L3_433 = L3_433 + A1_431.Lane
  end
  SetMinionLane(A0_430[L2_432], L3_433)
end
BBSetMinionLane = L0_0
function L0_0(A0_434, A1_435)
  if A1_435.AttackVar ~= nil then
  end
  if A1_435.Attack ~= nil then
  end
  if A1_435.TotalCoefficientVar ~= nil then
  end
  if A1_435.TotalCoefficient ~= nil then
  end
  if A1_435.TargetVar ~= nil then
    GetTable(A0_434, A1_435.DestVarTable, false)[A1_435.DestVar] = (0 + GetTable(A0_434, A1_435.AttackVarTable, true)[A1_435.AttackVar] + A1_435.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_434[A1_435.TargetVar])) + GetFlatCritDamageMod(A0_434[A1_435.TargetVar])) * (0 + GetTable(A0_434, A1_435.TotalCoefficientVarTable, true)[A1_435.TotalCoefficientVar] + A1_435.TotalCoefficient)
  else
    GetTable(A0_434, A1_435.DestVarTable, false)[A1_435.DestVar] = 2 * A1_435.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_436, A1_437)
  local L2_438, L3_439, L4_440, L5_441, L6_442, L7_443, L8_444
  L2_438 = GetTable
  L3_439 = A0_436
  L4_440 = A1_437.DestVarTable
  L5_441 = false
  L2_438 = L2_438(L3_439, L4_440, L5_441)
  L3_439 = GetTable
  L4_440 = A0_436
  L5_441 = A1_437.AmountVarTable
  L6_442 = true
  L3_439 = L3_439(L4_440, L5_441, L6_442)
  L4_440 = GetTable
  L5_441 = A0_436
  L6_442 = A0_436.NextBuffVars
  L7_443 = false
  L4_440 = L4_440(L5_441, L6_442, L7_443)
  L5_441 = A1_437.AmountVar
  L5_441 = L3_439[L5_441]
  L6_442 = A1_437.Amount
  L5_441 = L5_441 + L6_442
  L4_440.InitializeShield_Amount = L5_441
  L5_441 = A1_437.AmountVar
  if L5_441 ~= nil then
    L5_441 = A1_437.HealShieldMod
    if L5_441 ~= nil and L5_441 == true then
      L6_442 = A1_437.Amount
      L7_443 = A1_437.AmountVar
      L7_443 = L3_439[L7_443]
      L6_442 = L6_442 + L7_443
      L7_443 = A1_437.AttackerVar
      L8_444 = 0
      if L7_443 ~= nil then
        L8_444 = GetPercentHealingAmountMod(A0_436[L7_443])
      end
      L6_442 = L6_442 * (1 + L8_444)
      L6_442 = L6_442 * (1 + GetPercentIncomingHealingAmountMod(A0_436[A1_437.UnitVar]))
      L3_439[A1_437.AmountVar] = L6_442
      L4_440.InitializeShield_Amount = L6_442
    end
  end
  L5_441 = SpellBuffAddNoRenew
  L6_442 = A1_437.AttackerVar
  L6_442 = A0_436[L6_442]
  L7_443 = A1_437.UnitVar
  L7_443 = A0_436[L7_443]
  L8_444 = "InitializeShieldMarker"
  L5_441(L6_442, L7_443, L8_444, 0, 1, 25000, L4_440)
  L5_441 = BBIncreaseShield
  L6_442 = A0_436
  L7_443 = A1_437
  L5_441(L6_442, L7_443)
end
BBInitializeShield = L0_0
function L0_0(A0_445, A1_446)
  if A1_446.CDVar ~= nil then
  end
  if A1_446.CD ~= nil then
  end
  if A1_446.TargetVar ~= nil then
    GetTable(A0_445, A1_446.DestVarTable, false)[A1_446.DestVar] = (0 + GetTable(A0_445, A1_446.CDVarTable, true)[A1_446.CDVar] + A1_446.CD) * (1 + GetPercentCooldownMod(A0_445[A1_446.TargetVar]))
  else
    GetTable(A0_445, A1_446.DestVarTable, false)[A1_446.DestVar] = A1_446.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_447, A1_448)
  local L2_449, L3_450
  L3_450 = A1_448.TargetVar
  if L3_450 ~= nil then
    L2_449 = A1_448.Stat(A0_447[L3_450])
  else
    L2_449 = A1_448.Stat()
  end
  SetVarInTable(A0_447, A1_448, L2_449)
end
BBGetStat = L0_0
function L0_0(A0_451, A1_452)
  if A1_452.TargetVar ~= nil then
    GetTable(A0_451, A1_452.DestVarTable, false)[A1_452.DestVar] = GetLevel(A0_451[A1_452.TargetVar])
  else
    GetTable(A0_451, A1_452.DestVarTable, false)[A1_452.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_453, A1_454)
  if A1_454.TargetVar ~= nil then
    GetTable(A0_453, A1_454.DestVarTable, false)[A1_454.DestVar] = GetUnitSignificance(A0_453[A1_454.TargetVar])
  else
    GetTable(A0_453, A1_454.DestVarTable, false)[A1_454.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_455, A1_456)
  if A1_456.TargetVar ~= nil then
    GetTable(A0_455, A1_456.DestVarTable, false)[A1_456.DestVar] = GetArmor(A0_455[A1_456.TargetVar])
  else
    GetTable(A0_455, A1_456.DestVarTable, false)[A1_456.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_457, A1_458)
  if A1_458.TargetVar ~= nil then
    GetTable(A0_457, A1_458.DestVarTable, false)[A1_458.DestVar] = GetSpellBlock(A0_457[A1_458.TargetVar])
  else
    GetTable(A0_457, A1_458.DestVarTable, false)[A1_458.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_459, A1_460)
  local L2_461, L3_462
  L3_462 = A1_460.TargetVar
  if L3_462 ~= nil then
    L2_461 = GetTeamID(A0_459[L3_462])
  else
    L2_461 = GetTeamID()
  end
  SetVarInTable(A0_459, A1_460, L2_461)
end
BBGetTeamID = L0_0
function L0_0(A0_463, A1_464)
  local L2_465, L3_466, L4_467
  L2_465 = GetTable
  L3_466 = A0_463
  L4_467 = A1_464.DestVarTable
  L2_465 = L2_465(L3_466, L4_467, false)
  L3_466 = A1_464.TargetVar
  L4_467 = nil
  if L3_466 ~= nil then
    L4_467 = GetTeamID(A0_463[L3_466])
  else
    L4_467 = GetTeamID()
  end
  if L4_467 == TEAM_ORDER then
    L2_465[A1_464.DestVar] = TEAM_CHAOS
  elseif L4_467 == TEAM_CHAOS then
    L2_465[A1_464.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_468, A1_469)
  if A1_469.TargetVar ~= nil then
    GetTable(A0_468, A1_469.DestVarTable, false)[A1_469.DestVar] = GetUnitSkinName(A0_468[A1_469.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_470, A1_471)
  local L2_472, L3_473, L4_474
  L2_472 = GetTable
  L3_473 = A0_470
  L4_474 = A1_471.DestVarTable
  L2_472 = L2_472(L3_473, L4_474, false)
  L3_473 = A0_470.Owner
  L4_474 = nil
  if A1_471.TargetVar ~= nil then
    L4_474 = GetTotalAttackDamage(A0_470[A1_471.TargetVar])
  else
    L4_474 = GetTotalAttackDamage()
  end
  SetVarInTable(A0_470, A1_471, L4_474)
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_475, A1_476)
  GetTable(A0_475, A1_476.DestVarTable, true)[A1_476.DestVar] = A1_476.Status(A0_475[A1_476.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_477, A1_478)
  local L2_479
  L2_479 = A1_478.TargetVar
  L2_479 = A0_477[L2_479]
  ClearAttackTarget(L2_479)
end
BBClearAttackTarget = L0_0
function L0_0(A0_480, A1_481)
  local L2_482, L3_483
  L2_482 = GetTable
  L3_483 = A0_480
  L2_482 = L2_482(L3_483, A1_481.DestVarTable, true)
  L3_483 = A1_481.Info
  L3_483 = L3_483(A0_480[A1_481.TargetVar])
  SetVarInTable(A0_480, A1_481, L3_483)
end
BBGetCastInfo = L0_0
function L0_0(A0_484, A1_485, A2_486)
  local L3_487, L4_488, L5_489, L6_490
  L3_487 = GetTable
  L4_488 = A0_484
  L5_489 = A1_485.TrackTimeVarTable
  L6_490 = false
  L3_487 = L3_487(L4_488, L5_489, L6_490)
  L4_488 = GetTime
  L4_488 = L4_488()
  L5_489 = A1_485.ExecuteImmediately
  L6_490 = GetParam
  L6_490 = L6_490("TimeBetweenExecutions", A0_484, A1_485)
  if A1_485.TickTimeVar ~= nil and GetTable(A0_484, A1_485.TickTimeVarTable, false)[A1_485.TickTimeVar] ~= nil then
    L6_490 = GetTable(A0_484, A1_485.TickTimeVarTable, false)[A1_485.TickTimeVar]
  end
  if L3_487[A1_485.TrackTimeVar] == nil then
    L3_487[A1_485.TrackTimeVar] = L4_488
    if L5_489 == true then
      ExecuteBuildingBlocks(A2_486, A0_484)
    end
  end
  if L4_488 >= L3_487[A1_485.TrackTimeVar] + L6_490 then
    L3_487[A1_485.TrackTimeVar] = L3_487[A1_485.TrackTimeVar] + L6_490
    ExecuteBuildingBlocks(A2_486, A0_484)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_491, A1_492, A2_493)
  GetTable(A0_491, A1_492.TrackTimeVarTable, false)[A1_492.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_494, A1_495)
  local L2_496
  L2_496 = A1_495.SrcValue
  if A1_495.SrcVar ~= nil then
    L2_496 = GetTable(A0_494, A1_495.SrcVarTable, true)[A1_495.SrcVar]
  end
  A1_495.Status(A0_494[A1_495.TargetVar], L2_496)
end
BBSetStatus = L0_0
function L0_0(A0_497, A1_498)
  local L2_499
  L2_499 = A1_498.ToAlert
  if GetTable(A0_497, A1_498.SrcVarTable, false) ~= nil and A1_498.SrcVar ~= nil then
    L2_499 = L2_499 .. GetTable(A0_497, A1_498.SrcVarTable, false)[A1_498.SrcVar]
  end
  _ALERT(L2_499)
end
BBAlert = L0_0
function L0_0(A0_500, A1_501)
  local L2_502, L3_503, L4_504, L5_505, L6_506, L7_507
  L2_502 = GetParam
  L3_503 = "Value"
  L4_504 = A0_500
  L5_505 = A1_501
  L2_502 = L2_502(L3_503, L4_504, L5_505)
  if L2_502 == nil then
    L3_503 = ReportError
    L4_504 = "Could not resolve Value param"
    L3_503(L4_504)
    return
  end
  L3_503 = true
  L4_504 = GetParam
  L5_505 = "OnUnit"
  L6_506 = A0_500
  L7_507 = A1_501
  L4_504 = L4_504(L5_505, L6_506, L7_507)
  if L4_504 == nil then
    L3_503 = false
    L5_505 = GetParam
    L6_506 = "OnUnitByFlag"
    L7_507 = A0_500
    L5_505 = L5_505(L6_506, L7_507, A1_501)
    L4_504 = L5_505
  end
  if L4_504 == nil then
    L5_505 = ReportError
    L6_506 = "Could not resolve OnUnit param"
    L5_505(L6_506)
    return
  end
  L5_505 = true
  L6_506 = GetParam
  L7_507 = "ChampionToSayTo"
  L6_506 = L6_506(L7_507, A0_500, A1_501)
  if L6_506 == nil then
    L5_505 = false
    L7_507 = GetParam
    L7_507 = L7_507("ChampionToSayToByFlag", A0_500, A1_501)
    L6_506 = L7_507
  end
  if L6_506 == nil then
    L7_507 = ReportError
    L7_507("Could not resolve ChampionToSayTo param")
    return
  end
  L7_507 = GetParam
  L7_507 = L7_507("ShowToSpectator", A0_500, A1_501)
  if L7_507 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  DisplayNumericFloatingTextOnUnitToChampion(L2_502, A1_501.TextType, L4_504, L3_503, L6_506, L5_505, L7_507)
end
BBDisplayNumericFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_508, A1_509)
  local L2_510, L3_511, L4_512, L5_513, L6_514, L7_515
  L2_510 = GetParam
  L3_511 = "Message"
  L4_512 = A0_508
  L5_513 = A1_509
  L2_510 = L2_510(L3_511, L4_512, L5_513)
  if L2_510 == nil then
    L3_511 = ReportError
    L4_512 = "Could not resolve Message param"
    L3_511(L4_512)
    return
  end
  L3_511 = true
  L4_512 = GetParam
  L5_513 = "OnUnit"
  L6_514 = A0_508
  L7_515 = A1_509
  L4_512 = L4_512(L5_513, L6_514, L7_515)
  if L4_512 == nil then
    L3_511 = false
    L5_513 = GetParam
    L6_514 = "OnUnitByFlag"
    L7_515 = A0_508
    L5_513 = L5_513(L6_514, L7_515, A1_509)
    L4_512 = L5_513
  end
  if L4_512 == nil then
    L5_513 = ReportError
    L6_514 = "Could not resolve OnUnit param"
    L5_513(L6_514)
    return
  end
  L5_513 = true
  L6_514 = GetParam
  L7_515 = "ChampionToSayTo"
  L6_514 = L6_514(L7_515, A0_508, A1_509)
  if L6_514 == nil then
    L5_513 = false
    L7_515 = GetParam
    L7_515 = L7_515("ChampionToSayToByFlag", A0_508, A1_509)
    L6_514 = L7_515
  end
  if L6_514 == nil then
    L7_515 = ReportError
    L7_515("Could not resolve ChampionToSayTo param")
    return
  end
  L7_515 = GetParam
  L7_515 = L7_515("ShowToSpectator", A0_508, A1_509)
  if L7_515 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  SayWithFloatingTextOnUnitToChampion(tostring(L2_510), A1_509.TextType, L4_512, L3_511, L6_514, L5_513, L7_515)
end
BBSayWithFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_516, A1_517)
  local L2_518, L3_519, L4_520
  L2_518 = A1_517.ToSay
  L3_519 = GetTable
  L4_520 = A0_516
  L3_519 = L3_519(L4_520, A1_517.SrcVarTable, false)
  if L3_519 ~= nil then
    L4_520 = A1_517.SrcVar
    if L4_520 ~= nil then
      L4_520 = L2_518
      L2_518 = L4_520 .. tostring(L3_519[A1_517.SrcVar])
    end
  end
  L4_520 = nil
  if A1_517.OwnerVar ~= nil then
    L4_520 = A0_516[A1_517.OwnerVar]
  else
    L4_520 = A0_516.Owner
  end
  if A1_517.TextType == nil then
    A1_517.TextType = 0
  end
  Say(L4_520, L2_518, A1_517.TextType)
end
BBSay = L0_0
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
BBDebugSay = L0_0
function L0_0(A0_526, A1_527)
  GetTable(A0_526, A1_527.DestVarTable, true)[A1_527.DestVar] = BBLuaGetGold(A0_526, A1_527)
end
BBGetGold = L0_0
function L0_0(A0_528, A1_529)
  GetTable(A0_528, A1_529.DestVarTable, true)[A1_529.DestVar] = BBLuaGetTotalGold(A0_528, A1_529)
end
BBGetTotalGold = L0_0
function L0_0(A0_530, A1_531)
  A0_530.CharVars.TeleportTargetPosition = GetTable(A0_530, A1_531.CastPositionNameTable)[A1_531.CastPositionName]
  SpellBuffAdd(A0_530[A1_531.OwnerVar], A0_530[A1_531.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_530.NextBuffVars)
  BBTeleportToPositionHelper(A0_530, A1_531)
end
BBTeleportToPosition = L0_0
function L0_0(A0_532, A1_533)
  if A1_533.XVar ~= nil and GetTable(A0_532, A1_533.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_532, A1_533.XVarTable, true)[A1_533.XVar]
  else
    Xloc = A1_533.X
  end
  if A1_533.YVar ~= nil and GetTable(A0_532, A1_533.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_532, A1_533.YVarTable, true)[A1_533.YVar]
  else
    Yloc = A1_533.Y
  end
  if A1_533.ZVar ~= nil and GetTable(A0_532, A1_533.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_532, A1_533.ZVarTable, true)[A1_533.ZVar]
  else
    Zloc = A1_533.Z
  end
  A1_533.OwnerVar, A0_532.position = A1_533.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_533.CastPositionName = "position"
  BBTeleportToPosition(A0_532, A1_533)
end
BBTeleportToPoint = L0_0
function L0_0(A0_534, A1_535)
  A1_535.TimeoutInFOW = 999999
  A1_535.BindFlexToOwnerPAR = false
  A1_535.Flags = 0
  A1_535.FollowsGroundTilt = false
  A1_535.FacesTarget = false
  A1_535.HideFromSpectator = false
  A1_535.SendIfOnScreenOrDiscard = false
  A1_535.PersistsThroughReconnect = true
  A1_535.FOWVisibilityRadius = 10
  A1_535.Scale = 1
  A1_535.BindObjectVar = A1_535.BindObject1Var
  A1_535.EffectID2Var = A1_535.OtherTeamEffectIDVar
  A1_535.TargetObjectVar = A1_535.BindObject2Var
  A1_535.FOWTeamOverrideVar = A1_535.FOWTeamVar
  A1_535.BoneName = A1_535.BindObject1BoneName
  A1_535.TargetBoneName = A1_535.BindObject2BoneName
  A1_535.EffectName = A1_535.EffectParticleFile
  A1_535.EffectNameForOtherTeam = A1_535.OtherTeamParticleFile
  BBSpellEffectCreate(A0_534, A1_535)
end
BBSpellEffectCreate_EasyBeam = L0_0
function L0_0(A0_536, A1_537)
  A1_537.TimeoutInFOW = 999999
  A1_537.BindFlexToOwnerPAR = false
  A1_537.Flags = 0
  A1_537.FollowsGroundTilt = false
  A1_537.FacesTarget = false
  A1_537.HideFromSpectator = false
  A1_537.SendIfOnScreenOrDiscard = true
  A1_537.PersistsThroughReconnect = false
  A1_537.FOWVisibilityRadius = 10
  A1_537.Scale = 1
  A1_537.FOWTeamOverrideVar = A1_537.FOWTeamVar
  A1_537.EffectName = A1_537.ParticleFile
  A1_537.EffectNameForOtherTeam = A1_537.ParticleFileForOtherTeam
  A1_537.BoneName = A1_537.BindObjectBoneName
  BBSpellEffectCreate(A0_536, A1_537)
end
BBSpellEffectCreate_EasyHit = L0_0
function L0_0(A0_538, A1_539)
  local L2_540, L3_541, L4_542, L5_543, L6_544, L7_545, L8_546, L9_547, L10_548, L11_549, L12_550
  L3_541 = A1_539.TargetVar
  if L3_541 ~= nil then
    L3_541 = A1_539.TargetVar
    L2_540 = A0_538[L3_541]
  else
    L2_540 = A0_538.Target
  end
  L3_541 = {
    L4_542,
    L5_543,
    L6_544
  }
  L4_542.maxSlot = 3
  L4_542.spellbook = L5_543
  L4_542.stype = L5_543
  L5_543.maxSlot = 6
  L5_543.spellbook = L6_544
  L5_543.stype = L6_544
  L6_544.maxSlot = 1
  L7_545 = SPELLBOOK_SUMMONER
  L6_544.spellbook = L7_545
  L7_545 = SpellSlots
  L6_544.stype = L7_545
  for L7_545, L8_546 in L4_542(L5_543) do
    A1_539.SpellbookType = L9_547
    A1_539.SlotType = L9_547
    for L12_550 = 0, L8_546.maxSlot do
      if HasSpellTag(L2_540, L12_550, A1_539.SpellbookType, A1_539.SlotType, A1_539.SpellTag) ~= A1_539.InvertResult then
        A1_539.SpellSlot = L12_550
        BBSealSpellSlot(A0_538, A1_539)
      end
    end
  end
end
BBSealSpellSlotsWithTag = L0_0
function L0_0(A0_551, A1_552)
  ReincarnateNonDeadHero(GetTable(A0_551, A1_552.TargetTable, false)[A1_552.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_553, A1_554)
  GetTable(A0_553, A1_554.DestVarTable, true)[A1_554.DestVar] = A1_554.Function(A0_553[A1_554.OwnerVar], A1_554.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_555, A1_556)
  local L2_557, L3_558, L4_559, L5_560
  L2_557 = A1_556.WhomToOrderVar
  L2_557 = A0_555[L2_557]
  L3_558 = A1_556.TargetOfOrderVar
  L3_558 = A0_555[L3_558]
  L4_559 = GetTable
  L5_560 = A0_555
  L4_559 = L4_559(L5_560, A1_556.SrcVarTable, false)
  L5_560 = nil
  if A1_556.SrcVar ~= nil and L4_559 ~= nil then
    L5_560 = L4_559[A1_556.SrcVar]
  else
    L5_560 = GetPosition(L3_558)
  end
  if L3_558 == nil then
    L3_558 = L2_557
  end
  IssueOrder(L2_557, A1_556.Order, L5_560, L3_558)
end
BBIssueOrder = L0_0
function L0_0(A0_561, A1_562)
  local L2_563
  L2_563 = GetParam
  L2_563 = L2_563("NewRange", A0_561, A1_562)
  SetSpellCastRange(L2_563)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_564, A1_565)
  GetTable(A0_564, A1_565.DestVarTable, true)[A1_565.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_566, A1_567)
  local L2_568, L3_569
  L2_568 = A1_567.ObjectVar1
  L2_568 = A0_566[L2_568]
  L3_569 = A1_567.ObjectVar2
  L3_569 = A0_566[L3_569]
  GetTable(A0_566, A1_567.DestVarTable, true)[A1_567.DestVar] = DistanceBetweenObjectBounds(L2_568, L3_569)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_570, A1_571)
  local L2_572, L3_573, L4_574
  L2_572 = A1_571.ObjectVar
  L2_572 = A0_570[L2_572]
  L3_573 = GetTable
  L4_574 = A0_570
  L3_573 = L3_573(L4_574, A1_571.PointVarTable, true)
  L4_574 = A1_571.PointVar
  L4_574 = L3_573[L4_574]
  GetTable(A0_570, A1_571.DestVarTable, true)[A1_571.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_572, L4_574)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_575, A1_576)
  local L2_577, L3_578
  L2_577 = GetParam
  L3_578 = "Point1"
  L2_577 = L2_577(L3_578, A0_575, A1_576)
  L3_578 = GetParam
  L3_578 = L3_578("Point2", A0_575, A1_576)
  GetTable(A0_575, A1_576.DestVarTable, true)[A1_576.DestVar] = DistanceBetweenPoints(L2_577, L3_578)
end
BBDistanceBetweenPoints = L0_0
function L0_0(A0_579, A1_580)
  local L2_581, L3_582
  L2_581 = GetParam
  L3_582 = "Point1"
  L2_581 = L2_581(L3_582, A0_579, A1_580)
  L3_582 = GetParam
  L3_582 = L3_582("Point2", A0_579, A1_580)
  GetTable(A0_579, A1_580.DestVarTable, true)[A1_580.DestVar] = DistanceBetweenPointsXZ(L2_581, L3_582)
end
BBDistanceBetweenPointsXZ = L0_0
function L0_0(A0_583, A1_584)
  local L2_585, L3_586, L4_587
  L2_585 = A1_584.ObjectVar
  L2_585 = A0_583[L2_585]
  L3_586 = GetTable
  L4_587 = A0_583
  L3_586 = L3_586(L4_587, A1_584.PointVarTable, true)
  L4_587 = A1_584.PointVar
  L4_587 = L3_586[L4_587]
  GetTable(A0_583, A1_584.DestVarTable, true)[A1_584.DestVar] = WalkDistanceBetweenObjectCenterAndPoint(L2_585, L4_587)
end
BBWalkDistanceBetweenObjectAndPoint = L0_0
L0_0 = 0
OBJECT_BOUNDARY = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
function L0_0(A0_588, A1_589, A2_590)
  local L3_591, L4_592, L5_593, L6_594, L7_595, L8_596
  L5_593 = 0
  L6_594 = nil
  L7_595 = A1_589.ObjectDistanceType
  L8_596 = A1_589.ObjectVar1
  L3_591 = A0_588[L8_596]
  L8_596 = A1_589.ObjectVar2
  L4_592 = A0_588[L8_596]
  if nil == L4_592 then
    L8_596 = A1_589.Point2Var
    if nil ~= L8_596 then
      L8_596 = GetTable
      L8_596 = L8_596(A0_588, A1_589.Point2VarTable, true)
      L4_592 = L8_596[A1_589.Point2Var]
      L5_593 = L5_593 + 1
    end
  end
  if nil == L3_591 then
    L8_596 = A1_589.Point1Var
    if nil ~= L8_596 then
      L8_596 = GetTable
      L8_596 = L8_596(A0_588, A1_589.Point1VarTable, true)
      L3_591 = L8_596[A1_589.Point1Var]
      L5_593 = L5_593 + 1
      if 1 == L5_593 then
        L3_591, L4_592 = L4_592, L3_591
      end
    end
  end
  if nil ~= L7_595 then
    if 0 == L5_593 then
      L8_596 = OBJECT_CENTER
      if L8_596 == L7_595 then
        L6_594 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_596 = OBJECT_BOUNDARY
        if L8_596 == L7_595 then
          L6_594 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_596 = A1_589.OwnerVar
          L8_596 = A0_588[L8_596]
          Say(L8_596, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_593 then
      L8_596 = OBJECT_CENTER
      if L8_596 == L7_595 then
        L6_594 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_596 = OBJECT_BOUNDARY
        if L8_596 == L7_595 then
          L6_594 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_596 = A1_589.OwnerVar
          L8_596 = A0_588[L8_596]
          Say(L8_596, "invalid object distance type", 0)
        end
      end
    else
      L6_594 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_596 = A1_589.Distance
  if A1_589.DistanceVar ~= nil and GetTable(A0_588, A1_589.DistanceVarTable, true) ~= nil then
    L8_596 = L8_596 + GetTable(A0_588, A1_589.DistanceVarTable, true)[A1_589.DistanceVar]
  end
  if L3_591 ~= nil and L4_592 ~= nil and L6_594 ~= nil and L8_596 ~= nil then
    if not L6_594(L3_591, L4_592, L8_596) then
      ExecuteBuildingBlocks(A2_590, A0_588)
      A0_588.LastIfSucceeded = true
    else
      A0_588.LastIfSucceeded = false
    end
  else
    A0_588.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_597, A1_598)
  local L2_599, L3_600
  L2_599 = A1_598.TargetVar
  L2_599 = A0_597[L2_599]
  L3_600 = A1_598.CasterVar
  L3_600 = A0_597[L3_600]
  GetTable(A0_597, A1_598.DestVarTable, true)[A1_598.DestVar] = SpellBuffCount(L2_599, A1_598.BuffName, L3_600)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_601, A1_602)
  local L2_603
  L2_603 = A1_602.TargetVar
  L2_603 = A0_601[L2_603]
  GetTable(A0_601, A1_602.DestVarTable, true)[A1_602.DestVar] = SpellBuffCount(L2_603, A1_602.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_604, A1_605)
  local L2_606, L3_607
  L2_606 = GetTable
  L3_607 = A0_604
  L2_606 = L2_606(L3_607, A1_605.ScaleVarTable, false)
  L3_607 = nil
  if A1_605.OwnerVar ~= nil then
    L3_607 = A0_604[A1_605.OwnerVar]
  else
    L3_607 = A0_604.Owner
  end
  if A1_605.ScaleVar ~= nil and A1_605.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_606[A1_605.ScaleVar], L3_607)
  else
    SetScaleSkinCoef(A1_605.Scale, L3_607)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_608, A1_609)
  SpellBuffAdd(A0_608[A1_609.TargetVar], A0_608[A1_609.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_608.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_610, A1_611, A2_612)
  local L3_613, L4_614
  L3_613 = A1_611.TargetVar
  L3_613 = A0_610[L3_613]
  L4_614 = A1_611.NumStacks
  if GetParam("NumStacks", A0_610, A1_611) == 0 then
    L4_614 = SpellBuffCount(L3_613, A1_611.BuffName, caster)
  else
    L4_614 = GetParam("NumStacks", A0_610, A1_611)
  end
  while L4_614 > 0 do
    SpellBuffRemove(L3_613, A1_611.BuffName, A0_610[A1_611.AttackerVar])
    L4_614 = L4_614 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_615, A1_616)
  local L2_617, L3_618
  L2_617 = GetParam
  L3_618 = "Unit"
  L2_617 = L2_617(L3_618, A0_615, A1_616)
  unit = L2_617
  L2_617 = unit
  if L2_617 == nil then
    L2_617 = ReportError
    L3_618 = "Could not resolve Unit param"
    L2_617(L3_618)
    return
  end
  L2_617 = true
  L3_618 = GetParam
  L3_618 = L3_618("ChampionToShowTo", A0_615, A1_616)
  if L3_618 == nil then
    L2_617 = false
    L3_618 = GetParam("ChampionToShowToByFlag", A0_615, A1_616)
  end
  if L3_618 == nil then
    ReportError("Could not resolve ChampionToShowTo param")
    return
  end
  SetShowHealthBarToChampion(unit, A1_616.Show, L3_618, L2_617, A1_616.ApplyToSpectator)
end
BBSetShowHealthBarToChampion = L0_0
function L0_0(A0_619, A1_620)
  if GetParam("Vector", A0_619, A1_620) ~= nil then
    GetTable(A0_619, A1_620.DestVarTable, false)[A1_620.DestVar] = math.sqrt(GetParam("Vector", A0_619, A1_620).x * GetParam("Vector", A0_619, A1_620).x + GetParam("Vector", A0_619, A1_620).y * GetParam("Vector", A0_619, A1_620).y + GetParam("Vector", A0_619, A1_620).z * GetParam("Vector", A0_619, A1_620).z)
  end
end
BBGetVectorLength = L0_0
function L0_0(A0_621, A1_622, A2_623)
  if A0_621.EmoteId == A1_622.EmoteId then
    ExecuteBuildingBlocks(A2_623, A0_621)
    A0_621.LastIfSucceeded = true
  else
    A0_621.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_624, A1_625, A2_626)
  if A0_624.EmoteId ~= A1_625.EmoteId then
    ExecuteBuildingBlocks(A2_626, A0_624)
    A0_624.LastIfSucceeded = true
  else
    A0_624.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_627, A1_628)
  local L2_629, L3_630, L4_631, L5_632
  L2_629 = GetTable
  L3_630 = A0_627
  L4_631 = A1_628.String1VarTable
  L5_632 = false
  L2_629 = L2_629(L3_630, L4_631, L5_632)
  L3_630 = A1_628.String1Var
  L3_630 = L2_629[L3_630]
  L4_631 = GetTable
  L5_632 = A0_627
  L4_631 = L4_631(L5_632, A1_628.String2VarTable, false)
  L5_632 = A1_628.String2Var
  L5_632 = L4_631[L5_632]
  GetTable(A0_627, A1_628.ResultVarTable, false)[A1_628.ResultVar] = L3_630 .. L5_632
end
BBConcatenateStrings = L0_0
function L0_0(A0_633, A1_634)
  local L2_635, L3_636
  L2_635 = GetTable
  L3_636 = A0_633
  L2_635 = L2_635(L3_636, A1_634.VariableVarTable, false)
  L3_636 = A1_634.VariableVar
  L3_636 = L2_635[L3_636]
  GetTable(A0_633, A1_634.ResultVarTable, false)[A1_634.ResultVar] = "(" .. L3_636 .. ")"
end
BBEncaseInParantheses = L0_0
function L0_0(A0_637, A1_638)
  BBGetMinionKills(A0_637, A1_638)
  A0_637.MinionKillSource = GetParam("MinionKillTarget")
  A0_637.MinionKills = A0_637.MinionsKilled + GetParam("MinionKills", A0_637, A1_638)
  BBSetMinionKills(A0_637, A1_638)
end
BBIncreaseMinionKills = L0_0
function L0_0(A0_639, A1_640)
end
BBForcePreload = L0_0
