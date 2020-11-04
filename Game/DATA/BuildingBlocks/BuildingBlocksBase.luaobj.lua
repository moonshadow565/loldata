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
function L0_0(A0_117, A1_118, A2_119, A3_120)
  local L4_121
  L4_121 = GetParam
  L4_121 = L4_121("Unit", A0_117, A1_118)
  if L4_121 ~= nil then
    A1_118.DestPos = GetPosition(L4_121)
    A1_118.DestPosVar = "__TempDestPos"
    GetTable(A0_117, A1_118.DestPosVarTable, false)[A1_118.DestPosVar] = GetPosition(L4_121)
  end
  A1_118.RegionGroup = A2_119
  BBGetRegionTag(A0_117, A1_118)
  for _FORV_11_, _FORV_12_ in ipairs(A3_120) do
  end
  return true
end
CheckIfUnitOrPointIsInRegionTagList = L0_0
function L0_0(A0_122, A1_123)
  local L2_124, L3_125
  L2_124 = GameplayLane
  L3_125 = {
    LANE_Top_Order,
    LANE_Mid_Order,
    LANE_Bot_Order
  }
  resultTable = GetTable(A0_122, A1_123.ResultVarTable, false)
  resultTable[A1_123.ResultVar] = CheckIfUnitOrPointIsInRegionTagList(A0_122, A1_123, L2_124, L3_125)
end
BBGetIsOrderSide = L0_0
function L0_0(A0_126, A1_127)
  local L2_128, L3_129
  L2_128 = GameplayArea
  L3_129 = {AREA_Jungle_Top, AREA_Jungle_Bot}
  resultTable = GetTable(A0_126, A1_127.ResultVarTable, false)
  resultTable[A1_127.ResultVar] = CheckIfUnitOrPointIsInRegionTagList(A0_126, A1_127, L2_128, L3_129)
end
BBGetIsJungle = L0_0
function L0_0(A0_130, A1_131)
  local L2_132, L3_133
  L2_132 = GameplayArea
  L3_133 = {
    AREA_Lane_Top,
    AREA_Lane_Mid,
    AREA_Lane_Bot
  }
  resultTable = GetTable(A0_130, A1_131.ResultVarTable, false)
  resultTable[A1_131.ResultVar] = CheckIfUnitOrPointIsInRegionTagList(A0_130, A1_131, L2_132, L3_133)
end
BBGetIsLane = L0_0
function L0_0(A0_134, A1_135)
  local L2_136, L3_137
  L2_136 = GameplayArea
  L3_137 = {AREA_River_Top, AREA_River_Bot}
  resultTable = GetTable(A0_134, A1_135.ResultVarTable, false)
  resultTable[A1_135.ResultVar] = CheckIfUnitOrPointIsInRegionTagList(A0_134, A1_135, L2_136, L3_137)
end
BBGetIsRiver = L0_0
function L0_0(A0_138, A1_139)
  local L2_140, L3_141
  L2_140 = GameplayArea
  L3_141 = {AREA_BasePerimeter_Top, AREA_BasePerimeter_Bot}
  resultTable = GetTable(A0_138, A1_139.ResultVarTable, false)
  resultTable[A1_139.ResultVar] = CheckIfUnitOrPointIsInRegionTagList(A0_138, A1_139, L2_140, L3_141)
end
BBGetIsBasePerimeter = L0_0
function L0_0(A0_142, A1_143)
  local L2_144, L3_145, L4_146, L5_147
  L2_144 = GameplayLane
  L3_145 = {L4_146, L5_147}
  L4_146 = LANE_Top_Order
  L5_147 = LANE_Top_Chaos
  L4_146 = {L5_147, LANE_Mid_Chaos}
  L5_147 = LANE_Mid_Order
  L5_147 = {LANE_Bot_Order, LANE_Bot_Chaos}
  if CheckIfUnitOrPointIsInRegionTagList(A0_142, A1_143, L2_144, L3_145) then
  elseif CheckIfUnitOrPointIsInRegionTagList(A0_142, A1_143, L2_144, L4_146) then
  elseif CheckIfUnitOrPointIsInRegionTagList(A0_142, A1_143, L2_144, L5_147) then
  end
  resultTable = GetTable(A0_142, A1_143.ResultVarTable, false)
  resultTable[A1_143.ResultVar] = 0
end
BBGetNearestLane = L0_0
function L0_0(A0_148, A1_149)
  local L2_150, L3_151, L4_152, L5_153, L6_154, L7_155, L8_156, L9_157
  L2_150 = GetParam
  L3_151 = "Unit"
  L4_152 = A0_148
  L5_153 = A1_149
  L2_150 = L2_150(L3_151, L4_152, L5_153)
  L3_151 = GetParam
  L4_152 = "X"
  L5_153 = A0_148
  L6_154 = A1_149
  L3_151 = L3_151(L4_152, L5_153, L6_154)
  L4_152 = GetParam
  L5_153 = "Z"
  L6_154 = A0_148
  L7_155 = A1_149
  L4_152 = L4_152(L5_153, L6_154, L7_155)
  if L2_150 ~= nil then
    L5_153 = GetPosition
    L6_154 = L2_150
    L5_153 = L5_153(L6_154)
    L3_151 = L5_153.x
    L4_152 = L5_153.z
  end
  L5_153 = 2
  L6_154 = 1
  L7_155 = 0
  L8_156 = 4
  L9_157 = 3
  if L4_152 > 12250 then
  elseif L4_152 < 2650 then
  elseif L3_151 > 12250 then
  elseif L3_151 < 2650 then
  elseif L4_152 - L3_151 > 4500 then
  else
  end
  if L4_152 > 13000 then
  elseif L4_152 < 1800 then
  elseif L3_151 > 13000 then
  elseif L3_151 < 1800 then
  elseif L4_152 - L3_151 > 1150 then
  else
  end
  GetTable(A0_148, A1_149.NearLaneVarTable, false)[A1_149.NearLaneVar] = L7_155
  GetTable(A0_148, A1_149.NearSectionVarTable, false)[A1_149.NearSectionVar] = L9_157
  GetTable(A0_148, A1_149.BlueSideVarTable, false)[A1_149.BlueSideVar] = true
end
BBGetLocationHints = L0_0
function L0_0(A0_158, A1_159)
  local L2_160, L3_161, L4_162, L5_163
  L2_160 = GetTable
  L3_161 = A0_158
  L4_162 = A1_159.DestVarTable
  L5_163 = true
  L2_160 = L2_160(L3_161, L4_162, L5_163)
  L3_161 = nil
  L4_162 = GetTable
  L5_163 = A0_158
  L4_162 = L4_162(L5_163, A1_159.SpellSlotVarTable, false)
  L5_163 = A1_159.SpellSlotVar
  if L5_163 ~= nil and L4_162 ~= nil then
    L5_163 = A1_159.SpellSlotVar
    L3_161 = L4_162[L5_163]
  else
    L3_161 = A1_159.SpellSlotValue
  end
  L5_163 = A1_159.Function
  L5_163 = L5_163(A0_158[A1_159.OwnerVar], L3_161, A1_159.SpellbookType, A1_159.SlotType)
  SetVarInTable(A0_158, A1_159, L5_163)
end
BBGetSlotSpellInfo = L0_0
function L0_0(A0_164, A1_165)
  local L2_166, L3_167, L4_168
  L2_166 = GetTable
  L3_167 = A0_164
  L4_168 = A1_165.SrcVarTable
  L2_166 = L2_166(L3_167, L4_168, false)
  L3_167 = nil
  L4_168 = A1_165.SrcVar
  if L4_168 ~= nil and L2_166 ~= nil then
    L4_168 = A1_165.SrcVar
    L3_167 = L2_166[L4_168]
  else
    L3_167 = A1_165.SrcValue
  end
  L4_168 = nil
  if A1_165.SpellSlotVar ~= nil and GetTable(A0_164, A1_165.SpellSlotVarTable, false) ~= nil then
    L4_168 = GetTable(A0_164, A1_165.SpellSlotVarTable, false)[A1_165.SpellSlotVar]
  else
    L4_168 = A1_165.SpellSlotValue
  end
  SetSlotSpellCooldownTime(A0_164[A1_165.OwnerVar], L4_168, A1_165.SpellbookType, A1_165.SlotType, L3_167)
end
BBSetSlotSpellCooldownTime = L0_0
function L0_0(A0_169, A1_170)
  if A0_169.Level ~= nil and A1_170.SrcValueByLevel ~= nil then
    A0_169.ReturnValue = A1_170.SrcValueByLevel[A0_169.Level]
  elseif A1_170.SrcVar ~= nil and GetTable(A0_169, A1_170.SrcVarTable, false) ~= nil then
    A0_169.ReturnValue = GetTable(A0_169, A1_170.SrcVarTable, false)[A1_170.SrcVar]
  else
    A0_169.ReturnValue = A1_170.SrcValue
  end
end
BBSetReturnValue = L0_0
function L0_0(A0_171, A1_172)
  A0_171.ReturnValue = true
end
BBCancelOrderBeforeIssued = L0_0
function L0_0(A0_173, A1_174)
  if type(A0_173) == "string" and type(A1_174) == "string" then
    A0_173 = string.lower(A0_173)
    A1_174 = string.lower(A1_174)
  end
  return A0_173 == A1_174
end
CO_EQUAL = L0_0
function L0_0(A0_175, A1_176)
  if type(A0_175) == "string" and type(A1_176) == "string" then
    A0_175 = string.lower(A0_175)
    A1_176 = string.lower(A1_176)
  end
  return A0_175 ~= A1_176
end
CO_NOT_EQUAL = L0_0
function L0_0(A0_177, A1_178)
  local L2_179
  L2_179 = A0_177 < A1_178
  return L2_179
end
CO_LESS_THAN = L0_0
function L0_0(A0_180, A1_181)
  local L2_182
  L2_182 = A1_181 < A0_180
  return L2_182
end
CO_GREATER_THAN = L0_0
function L0_0(A0_183, A1_184)
  local L2_185
  L2_185 = A0_183 <= A1_184
  return L2_185
end
CO_LESS_THAN_OR_EQUAL = L0_0
function L0_0(A0_186, A1_187)
  local L2_188
  L2_188 = A1_187 <= A0_186
  return L2_188
end
CO_GREATER_THAN_OR_EQUAL = L0_0
function L0_0(A0_189, A1_190)
  return GetTeamID(A0_189) == GetTeamID(A1_190)
end
CO_SAME_TEAM = L0_0
function L0_0(A0_191, A1_192)
  return GetTeamID(A0_191) ~= GetTeamID(A1_192)
end
CO_DIFFERENT_TEAM = L0_0
function L0_0(A0_193, A1_194)
  return GetSourceType() == A1_194 or GetSourceType() == A0_193
end
CO_DAMAGE_SOURCETYPE_IS = L0_0
function L0_0(A0_195, A1_196)
  return GetSourceType() ~= A1_196 and GetSourceType() ~= A0_195
end
CO_DAMAGE_SOURCETYPE_IS_NOT = L0_0
function L0_0(A0_197)
  return IsObjectAI(A0_197)
end
CO_IS_TYPE_AI = L0_0
function L0_0(A0_198)
  return IsObjectAI(A0_198) ~= true
end
CO_IS_NOT_AI = L0_0
function L0_0(A0_199)
  return IsObjectHero(A0_199)
end
CO_IS_TYPE_HERO = L0_0
function L0_0(A0_200)
  return IsObjectHero(A0_200) ~= true
end
CO_IS_NOT_HERO = L0_0
function L0_0(A0_201)
  return IsObjectMarker(A0_201)
end
CO_IS_TYPE_MARKER = L0_0
function L0_0(A0_202)
  return IsObjectMarker(A0_202) ~= true
end
CO_IS_NOT_MARKER = L0_0
function L0_0(A0_203)
  return IsClone(A0_203)
end
CO_IS_CLONE = L0_0
function L0_0(A0_204)
  return IsClone(A0_204) ~= true
end
CO_IS_NOT_CLONE = L0_0
function L0_0(A0_205)
  return IsMelee(A0_205)
end
CO_IS_MELEE = L0_0
function L0_0(A0_206)
  return IsMelee(A0_206) ~= true
end
CO_IS_RANGED = L0_0
function L0_0(A0_207)
  return A0_207 > math.random()
end
CO_RANDOM_CHANCE_LESS_THAN = L0_0
function L0_0(A0_208)
  return IsTurretAI(A0_208)
end
CO_IS_TYPE_TURRET = L0_0
function L0_0(A0_209)
  return IsTurretAI(A0_209) ~= true
end
CO_IS_NOT_TURRET = L0_0
function L0_0(A0_210)
  return IsDampener(A0_210)
end
CO_IS_TYPE_INHIBITOR = L0_0
function L0_0(A0_211)
  return IsDampener(A0_211) ~= true
end
CO_IS_NOT_INHIBITOR = L0_0
function L0_0(A0_212)
  return IsHQ(A0_212)
end
CO_IS_TYPE_NEXUS = L0_0
function L0_0(A0_213)
  return IsHQ(A0_213) ~= true
end
CO_IS_NOT_NEXUS = L0_0
function L0_0(A0_214)
  return IsDead(A0_214)
end
CO_IS_DEAD = L0_0
function L0_0(A0_215)
  return IsDead(A0_215) ~= true
end
CO_IS_NOT_DEAD = L0_0
function L0_0(A0_216)
  return IsDeadOrZombie(A0_216)
end
CO_IS_DEAD_OR_ZOMBIE = L0_0
function L0_0(A0_217, A1_218)
  return BBIsTargetInFrontOfMe(A0_217, A1_218)
end
CO_IS_TARGET_IN_FRONT_OF_ME = L0_0
function L0_0(A0_219, A1_220)
  return BBIsTargetBehindMe(A0_219, A1_220)
end
CO_IS_TARGET_BEHIND_ME = L0_0
function L0_0(A0_221)
  return IsWard(A0_221)
end
CO_IS_WARD = L0_0
function L0_0(A0_222)
  return IsStructure(A0_222)
end
CO_IS_STRUCTURE = L0_0
function L0_0(A0_223)
  return IsStructure(A0_223) ~= true
end
CO_IS_NOT_STRUCTURE = L0_0
function L0_0(A0_224)
  local L1_225
  L1_225 = A0_224 ~= nil
  return L1_225
end
CO_IS_NOT_NIL = L0_0
function L0_0(A0_226, A1_227, A2_228)
  GetTable(A0_226, A1_227.MacroVarTable, true)[A1_227.MacroVar] = A2_228
end
BBCreateMacro = L0_0
function L0_0(A0_229, A1_230)
  local L2_231
  L2_231 = GetParam
  L2_231 = L2_231("Macro", A0_229, A1_230)
  if L2_231 ~= nil and type(L2_231) == "table" then
    ExecuteBuildingBlocks(L2_231, A0_229)
  else
    DebugClientPrint("Designer Error: Macro variable is not initialized inside of event. Macro Variable was: " .. tostring(A1_230.MacroVar) .. " and current block data is: " .. gCurrentBuildingBlockString .. ". This error probably occurred due to variable not being initialized yet, being misnamed or two events being called out of sequence. It is highly recommended that script macros either be initialized OnBuffActivate, OnCharActivate or in the same event. Pro Devs may violate this rule at the risk of being forced to read this error message again.")
  end
end
BBRunMacro = L0_0
function L0_0(A0_232, A1_233, A2_234)
  local L3_235, L4_236, L5_237, L6_238, L7_239, L8_240
  L3_235 = GetTable
  L3_235 = L3_235(L4_236, L5_237, L6_238)
  L3_235[L4_236] = A2_234
  if L4_236 == nil then
    A2_234.InPerBlockParams = A1_233
    for L7_239 = 1, 6 do
      L8_240 = "FunctionParameter"
      L8_240 = L8_240 .. L7_239 .. "Var"
      if A1_233[L8_240 .. "Table"] ~= nil then
        DebugClientPrint("Designer Error: CreateFunction can only input parameters to PassThroughParams. Current block data is: " .. gCurrentBuildingBlockString .. ".")
      end
    end
  end
end
BBCreateFunction = L0_0
function L0_0(A0_241, A1_242)
  local L2_243, L3_244, L4_245, L5_246, L6_247
  for L5_246 = 1, 6 do
    L6_247 = "FunctionOutput"
    L6_247 = L6_247 .. L5_246 .. "Var"
    if A1_242[L6_247] ~= nil and A1_242[L6_247] ~= "" then
      if A1_242[L6_247 .. "Table"] ~= nil then
        DebugClientPrint("Designer Error: EndFunction can only output from PassThroughParams. Current block data is: " .. gCurrentBuildingBlockString .. ".")
      else
        A0_241[L6_247] = A0_241[A1_242[L6_247]]
      end
    end
  end
end
BBEndFunction = L0_0
function L0_0(A0_248, A1_249)
  local L2_250, L3_251, L4_252, L5_253, L6_254, L7_255, L8_256, L9_257
  L2_250 = GetParam
  L3_251 = "Function"
  L2_250 = L2_250(L3_251, L4_252, L5_253)
  L3_251 = {}
  L3_251.InstanceVars = L4_252
  L3_251.CharVars = L4_252
  L3_251.NextBuffVars = L4_252
  L3_251.AvatarVars = L4_252
  L3_251.SpellVars = L4_252
  L3_251.WorldVars = L4_252
  L3_251.Target = L4_252
  L3_251[L4_252] = L5_253
  L3_251.Attacker = L4_252
  L3_251[L4_252] = L5_253
  L3_251.Owner = L4_252
  L3_251[L4_252] = L5_253
  L3_251.Caster = L4_252
  L3_251.GoldRedirectTarget = L4_252
  L3_251.Unit = L4_252
  L3_251.Other1 = L4_252
  L3_251.Other2 = L4_252
  L3_251.Other3 = L4_252
  L3_251.Nothing = L4_252
  if L2_250 ~= nil then
    if L4_252 == "table" then
      if L4_252 ~= nil then
        for L8_256 = 1, 6 do
          L9_257 = "FunctionParameter"
          L9_257 = L9_257 .. L8_256 .. "Var"
          if A1_249[L9_257] ~= nil and A1_249[L9_257] ~= "" and L4_252[L9_257] ~= nil and L4_252[L9_257] ~= "" then
            L3_251[L4_252[L9_257]] = GetTable(A0_248, A1_249[L9_257 .. "Table"], false)[A1_249[L9_257]]
          end
        end
      end
      L4_252(L5_253, L6_254)
      for L7_255 = 1, 6 do
        L8_256 = "FunctionOutput"
        L9_257 = L7_255
        L8_256 = L8_256 .. L9_257 .. "Var"
        L9_257 = A1_249[L8_256]
        if L9_257 ~= nil then
          L9_257 = A1_249[L8_256]
          if L9_257 ~= "" then
            L9_257 = L3_251
            GetTable(A0_248, A1_249[L8_256 .. "Table"], false)[A1_249[L8_256]] = L9_257[L8_256]
          end
        end
      end
    end
  else
    L8_256 = gCurrentBuildingBlockString
    L9_257 = ". This error probably occurred due to variable not being initialized yet, being misnamed or two events being called out of sequence. It is highly recommended that script functions either be initialized OnBuffActivate, OnCharActivate or in the same event. Pro Devs may violate this rule at the risk of being forced to read this error message again."
    L4_252(L5_253)
  end
end
BBRunFunction = L0_0
function L0_0(A0_258, A1_259, A2_260)
  local L3_261, L4_262, L5_263, L6_264
  L3_261 = GetTable
  L4_262 = A0_258
  L5_263 = A1_259.Src1VarTable
  L6_264 = false
  L3_261 = L3_261(L4_262, L5_263, L6_264)
  L4_262 = GetTable
  L5_263 = A0_258
  L6_264 = A1_259.Src2VarTable
  L4_262 = L4_262(L5_263, L6_264, false)
  L5_263 = false
  L6_264 = nil
  if L3_261 ~= nil and A1_259.Src1Var ~= nil then
    L6_264 = L3_261[A1_259.Src1Var]
  else
    L6_264 = A1_259.Value1
  end
  if L4_262 ~= nil and A1_259.Src2Var ~= nil then
    L5_263 = A1_259.CompareOp(L6_264, L4_262[A1_259.Src2Var])
  else
    L5_263 = A1_259.CompareOp(L6_264, A1_259.Value2)
  end
  if L5_263 then
    ExecuteBuildingBlocks(A2_260, A0_258)
    A0_258.LastIfSucceeded = true
  else
    A0_258.LastIfSucceeded = false
  end
end
BBIf = L0_0
function L0_0(A0_265, A1_266, A2_267)
  if A0_265.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_267, A0_265)
    A0_265.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_268, A1_269, A2_270)
  if A0_268.LastIfSucceeded == true then
    ExecuteBuildingBlocks(A2_270, A0_268)
    A0_268.LastIfSucceeded = true
  else
    BBIf(A0_268, A1_269, A2_270)
  end
end
BBOrIf = L0_0
function L0_0(A0_271, A1_272, A2_273)
  if A0_271.LastIfSucceeded == true then
    BBIf(A0_271, A1_272, A2_273)
  end
end
BBAndIf = L0_0
function L0_0(A0_274, A1_275, A2_276)
  local L3_277, L4_278, L5_279, L6_280
  L3_277 = A0_274.LastIfSucceeded
  if L3_277 == false then
    L3_277 = GetTable
    L4_278 = A0_274
    L5_279 = A1_275.Src1VarTable
    L6_280 = false
    L3_277 = L3_277(L4_278, L5_279, L6_280)
    L4_278 = GetTable
    L5_279 = A0_274
    L6_280 = A1_275.Src2VarTable
    L4_278 = L4_278(L5_279, L6_280, false)
    L5_279 = false
    L6_280 = nil
    if L3_277 ~= nil and A1_275.Src1Var ~= nil then
      L6_280 = L3_277[A1_275.Src1Var]
    else
      L6_280 = A1_275.Value1
    end
    if L4_278 ~= nil and A1_275.Src2Var ~= nil then
      L5_279 = A1_275.CompareOp(L6_280, L4_278[A1_275.Src2Var])
    else
      L5_279 = A1_275.CompareOp(L6_280, A1_275.Value2)
    end
    if L5_279 then
      ExecuteBuildingBlocks(A2_276, A0_274)
      A0_274.LastIfSucceeded = true
    else
      A0_274.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_281, A1_282, A2_283)
  local L3_284
  if A1_282.TargetVar ~= nil then
    L3_284 = A0_281[A1_282.TargetVar]
  else
    L3_284 = A0_281.Target
  end
  if HasBuffOfType(L3_284, A1_282.BuffType) then
    ExecuteBuildingBlocks(A2_283, A0_281)
    A0_281.LastIfSucceeded = true
  else
    A0_281.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_285, A1_286, A2_287)
  local L3_288, L4_289
  if A1_286.OwnerVar ~= nil then
    L3_288 = A0_285[A1_286.OwnerVar]
  else
    L3_288 = A0_285.Owner
  end
  if A1_286.AttackerVar ~= nil then
    L4_289 = A0_285[A1_286.AttackerVar]
  else
    L4_289 = A0_285.Attacker
  end
  if SpellBuffCount(L3_288, A1_286.BuffName, L4_289) > 0 then
    ExecuteBuildingBlocks(A2_287, A0_285)
    A0_285.LastIfSucceeded = true
  else
    A0_285.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_290, A1_291, A2_292)
  if BBIsMissileAutoAttack(A0_290, A1_291) then
    ExecuteBuildingBlocks(A2_292, A0_290)
    A0_290.LastIfSucceeded = true
  else
    A0_290.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_293, A1_294, A2_295)
  if BBIsMissileConsideredAsAutoAttack(A0_293, A1_294) then
    ExecuteBuildingBlocks(A2_295, A0_293)
    A0_293.LastIfSucceeded = true
  else
    A0_293.LastIfSucceeded = false
  end
end
BBIfMissileConsideredAsAutoAttack = L0_0
function L0_0(A0_296, A1_297)
  A0_296.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_298, A1_299, A2_300)
  local L3_301, L4_302
  if A1_299.OwnerVar ~= nil then
    L3_301 = A0_298[A1_299.OwnerVar]
  else
    L3_301 = A0_298.Owner
  end
  if A1_299.CasterVar ~= nil then
    L4_302 = A0_298[A1_299.CasterVar]
  else
    L4_302 = A0_298.Caster
  end
  if SpellBuffCount(L3_301, A1_299.BuffName, L4_302) <= 0 then
    ExecuteBuildingBlocks(A2_300, A0_298)
    A0_298.LastIfSucceeded = true
  else
    A0_298.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_303, A1_304, A2_305)
  local L3_306
  if A1_304.TargetVar ~= nil then
    L3_306 = A0_303[A1_304.TargetVar]
  else
    L3_306 = A0_303.Owner
  end
  if HasUnitTag(L3_306, A1_304.UnitTag) ~= A1_304.InvertResult then
    ExecuteBuildingBlocks(A2_305, A0_303)
    A0_303.LastIfSucceeded = true
  else
    A0_303.LastIfSucceeded = false
  end
end
BBIfHasUnitTag = L0_0
function L0_0(A0_307, A1_308, A2_309)
  local L3_310, L4_311
  if A1_308.OwnerVar ~= nil then
    L3_310 = A0_307[A1_308.OwnerVar]
  else
    L3_310 = A0_307.Owner
  end
  if HasPARType(L3_310, A1_308.PARType) then
    ExecuteBuildingBlocks(A2_309, A0_307)
    A0_307.LastIfSucceeded = true
  else
    A0_307.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_312, A1_313, A2_314)
  local L3_315, L4_316
  if A1_313.OwnerVar ~= nil then
    L3_315 = A0_312[A1_313.OwnerVar]
  else
    L3_315 = A0_312.Owner
  end
  if not HasPARType(L3_315, A1_313.PARType) then
    ExecuteBuildingBlocks(A2_314, A0_312)
    A0_312.LastIfSucceeded = true
  else
    A0_312.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_317, A1_318, A2_319)
  local L3_320, L4_321, L5_322, L6_323, L7_324
  L3_320 = GetTable
  L4_321 = A0_317
  L5_322 = A1_318.Src1VarTable
  L6_323 = false
  L3_320 = L3_320(L4_321, L5_322, L6_323)
  L4_321 = GetTable
  L5_322 = A0_317
  L6_323 = A1_318.Src2VarTable
  L7_324 = false
  L4_321 = L4_321(L5_322, L6_323, L7_324)
  L5_322 = true
  while L5_322 do
    L6_323 = false
    L7_324 = nil
    if L3_320 ~= nil and A1_318.Src1Var ~= nil then
      L7_324 = L3_320[A1_318.Src1Var]
    else
      L7_324 = A1_318.Value1
    end
    if L4_321 ~= nil and A1_318.Src2Var ~= nil then
      L6_323 = A1_318.CompareOp(L7_324, L4_321[A1_318.Src2Var])
    else
      L6_323 = A1_318.CompareOp(L7_324, A1_318.Value2)
    end
    if L6_323 then
      ExecuteBuildingBlocks(A2_319, A0_317)
    else
      L5_322 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_325, A1_326)
  return A0_325 * A1_326
end
MO_MULTIPLY = L0_0
function L0_0(A0_327, A1_328)
  return A0_327 + A1_328
end
MO_ADD = L0_0
function L0_0(A0_329, A1_330)
  return A0_329 - A1_330
end
MO_SUBTRACT = L0_0
function L0_0(A0_331, A1_332)
  return A0_331 / A1_332
end
MO_DIVIDE = L0_0
function L0_0(A0_333, A1_334)
  if A0_333 < A1_334 then
    return A0_333
  else
    return A1_334
  end
end
MO_MIN = L0_0
function L0_0(A0_335, A1_336)
  if A1_336 < A0_335 then
    return A0_335
  else
    return A1_336
  end
end
MO_MAX = L0_0
function L0_0(A0_337, A1_338)
  return A0_337 % A1_338
end
MO_MODULO = L0_0
function L0_0(A0_339)
  return math.floor(A0_339 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_340)
  return math.ceil(A0_340)
end
MO_ROUNDUP = L0_0
function L0_0(A0_341)
  return math.floor(A0_341)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_342)
  return math.sin(math.rad(A0_342))
end
MO_SIN = L0_0
function L0_0(A0_343)
  return math.cos(math.rad(A0_343))
end
MO_COSINE = L0_0
function L0_0(A0_344)
  return math.tan(math.rad(A0_344))
end
MO_TANGENT = L0_0
function L0_0(A0_345)
  return math.deg(math.asin(A0_345))
end
MO_ASIN = L0_0
function L0_0(A0_346)
  return math.deg(math.acos(A0_346))
end
MO_ACOS = L0_0
function L0_0(A0_347)
  return math.deg(math.atan(A0_347))
end
MO_ATAN = L0_0
function L0_0(A0_348, A1_349)
  return math.pow(A0_348, A1_349)
end
MO_POW = L0_0
function L0_0(A0_350)
  return math.sqrt(A0_350)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_351, A1_352)
  local L2_353
  L2_353 = A0_351 and A1_352
  return L2_353
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_354, A1_355)
  local L2_356
  L2_356 = A0_354 or A1_355
  return L2_356
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_357)
  local L1_358
  L1_358 = not A0_357
  return L1_358
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_359)
  return math.abs(A0_359)
end
MO_ABS = L0_0
function L0_0(A0_360, A1_361)
  return math.random(A0_360, A1_361)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_362, A1_363)
  local L2_364, L3_365, L4_366, L5_367
  L2_364 = GetMathNumber
  L3_365 = A0_362
  L4_366 = A1_363.Src1VarTable
  L5_367 = A1_363.Src1Var
  L2_364 = L2_364(L3_365, L4_366, L5_367, A1_363.Src1Value)
  L3_365 = GetMathNumber
  L4_366 = A0_362
  L5_367 = A1_363.Src2VarTable
  L3_365 = L3_365(L4_366, L5_367, A1_363.Src2Var, A1_363.Src2Value)
  L4_366 = GetTable
  L5_367 = A0_362
  L4_366 = L4_366(L5_367, A1_363.DestVarTable)
  L5_367 = A1_363.MathOp
  L5_367 = L5_367(L2_364, L3_365)
  SetVarInTable(A0_362, A1_363, L5_367)
end
BBMath = L0_0
function L0_0(A0_368, A1_369, A2_370, A3_371)
  if A2_370 ~= nil and GetTable(A0_368, A1_369)[A2_370] ~= nil then
    return GetTable(A0_368, A1_369)[A2_370]
  end
  return A3_371
end
GetMathNumber = L0_0
function L0_0(A0_372, A1_373)
  if type(A1_373) == "number" then
    return A1_373
  elseif type(A1_373) == "function" then
    return A1_373(A0_372)
  elseif type(A1_373) == "string" then
    return A0_372[A1_373]
  end
end
GetNumber = L0_0
function L0_0(A0_374, A1_375)
  return VectorAdd(A0_374, A1_375)
end
VEC_ADD = L0_0
function L0_0(A0_376, A1_377)
  return VectorSubtract(A0_376, A1_377)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_378, A1_379)
  return VectorScalarMultiply(A0_378, A1_379)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_380, A1_381)
  return VectorScalarDivide(A0_380, A1_381)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_382, A1_383)
  return VectorRotateY(A0_382, A1_383)
end
VEC_ROTATE = L0_0
function L0_0(A0_384, A1_385)
  BBMath(A0_384, A1_385)
end
BBVectorMath = L0_0
function L0_0(A0_386, A1_387)
  local L2_388, L3_389, L4_390, L5_391
  L2_388 = A0_386.InstanceVars
  L3_389 = L2_388.InterpDelta
  if L3_389 == nil then
    L3_389 = A1_387.Amount
    L4_390 = A1_387.AmountVar
    if L4_390 ~= nil then
      L4_390 = GetTable
      L5_391 = A0_386
      L4_390 = L4_390(L5_391, A1_387.AmountVarTable)
      L5_391 = A1_387.AmountVar
      L3_389 = L4_390[L5_391]
    end
    L4_390 = GetPosition
    L5_391 = A1_387.TargetVar
    L5_391 = A0_386[L5_391]
    L4_390 = L4_390(L5_391)
    L2_388.KnockBackStart = L4_390
    L4_390 = GetNormalizedPositionDelta
    L5_391 = A1_387.TargetVar
    L5_391 = A0_386[L5_391]
    L4_390 = L4_390(L5_391, A0_386[A1_387.AttackerVar], true)
    L5_391 = {}
    L5_391.x = L4_390.x * L3_389
    L5_391.y = 0
    L5_391.z = L4_390.z * L3_389
    L2_388.InterpDelta = L5_391
    L5_391 = GetTime
    L5_391 = L5_391()
    L2_388.StartTime = L5_391
    L5_391 = A1_387.KnockBackDuration
    L2_388.KnockBackDuration = L5_391
  end
  L3_389 = A1_387.TargetVar
  L3_389 = A0_386[L3_389]
  L4_390 = GetTime
  L4_390 = L4_390()
  L5_391 = L2_388.StartTime
  L4_390 = L4_390 - L5_391
  L5_391 = L2_388.KnockBackDuration
  L4_390 = L4_390 / L5_391
  L5_391 = {}
  L5_391.x = L2_388.KnockBackStart.x + L2_388.InterpDelta.x * L4_390
  L5_391.y = L2_388.KnockBackStart.y
  L5_391.z = L2_388.KnockBackStart.z + L2_388.InterpDelta.z * L4_390
  SetPosition(L3_389, L5_391)
end
BBKnockback = L0_0
function L0_0(A0_392, A1_393)
  local L2_394, L3_395
  L2_394 = GetParam
  L3_395 = "Left"
  L2_394 = L2_394(L3_395, A0_392, A1_393)
  L3_395 = GetParam
  L3_395 = L3_395("Right", A0_392, A1_393)
  GetTable(A0_392, A1_393.DestVarTable, true)[A1_393.DestVar] = tostring(L2_394) .. tostring(L3_395)
end
BBAppendString = L0_0
function L0_0(A0_396, A1_397)
  local L2_398
  L2_398 = 0
  if A1_397.Delta ~= nil then
    L2_398 = L2_398 + A1_397.Delta
  end
  if A1_397.DeltaByLevel ~= nil and A0_396.Level ~= nil then
    L2_398 = L2_398 + A1_397.DeltaByLevel[A0_396.Level]
  end
  if A1_397.DeltaVar ~= nil then
    L2_398 = L2_398 + GetTable(A0_396, A1_397.DeltaVarTable, true)[A1_397.DeltaVar]
  end
  if A1_397.TargetVar ~= nil then
    A1_397.Stat(L2_398, A0_396[A1_397.TargetVar])
  else
    A1_397.Stat(L2_398)
  end
end
BBIncStat = L0_0
function L0_0(A0_399, A1_400)
  local L2_401
  L2_401 = 0
  if A1_400.Delta ~= nil then
    L2_401 = L2_401 + A1_400.Delta
  end
  if A1_400.DeltaByLevel ~= nil and A0_399.Level ~= nil then
    L2_401 = L2_401 + A1_400.DeltaByLevel[A0_399.Level]
  end
  if A1_400.DeltaVar ~= nil then
    L2_401 = L2_401 + GetTable(A0_399, A1_400.DeltaVarTable, true)[A1_400.DeltaVar]
  end
  if A1_400.TargetVar ~= nil then
    A1_400.Stat(L2_401, A0_399[A1_400.TargetVar])
  else
    A1_400.Stat(L2_401)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_402, A1_403)
  local L2_404, L3_405
  L2_404 = A1_403.TargetVar
  L3_405 = 0
  if A1_403.LaneVar ~= nil then
    L3_405 = L3_405 + GetTable(A0_402, A1_403.LaneVarTable, true)[A1_403.LaneVar]
  end
  if A1_403.Lane ~= nil then
    L3_405 = L3_405 + A1_403.Lane
  end
  SetMinionLane(A0_402[L2_404], L3_405)
end
BBSetMinionLane = L0_0
function L0_0(A0_406, A1_407)
  if A1_407.AttackVar ~= nil then
  end
  if A1_407.Attack ~= nil then
  end
  if A1_407.TotalCoefficientVar ~= nil then
  end
  if A1_407.TotalCoefficient ~= nil then
  end
  if A1_407.TargetVar ~= nil then
    GetTable(A0_406, A1_407.DestVarTable, false)[A1_407.DestVar] = (0 + GetTable(A0_406, A1_407.AttackVarTable, true)[A1_407.AttackVar] + A1_407.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_406[A1_407.TargetVar])) + GetFlatCritDamageMod(A0_406[A1_407.TargetVar])) * (0 + GetTable(A0_406, A1_407.TotalCoefficientVarTable, true)[A1_407.TotalCoefficientVar] + A1_407.TotalCoefficient)
  else
    GetTable(A0_406, A1_407.DestVarTable, false)[A1_407.DestVar] = 2 * A1_407.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_408, A1_409)
  local L2_410, L3_411, L4_412, L5_413, L6_414, L7_415
  L2_410 = GetTable
  L3_411 = A0_408
  L4_412 = A1_409.DestVarTable
  L5_413 = false
  L2_410 = L2_410(L3_411, L4_412, L5_413)
  L3_411 = GetTable
  L4_412 = A0_408
  L5_413 = A1_409.AmountVarTable
  L6_414 = true
  L3_411 = L3_411(L4_412, L5_413, L6_414)
  L4_412 = GetTable
  L5_413 = A0_408
  L6_414 = A0_408.NextBuffVars
  L7_415 = false
  L4_412 = L4_412(L5_413, L6_414, L7_415)
  L5_413 = A1_409.AmountVar
  L5_413 = L3_411[L5_413]
  L6_414 = A1_409.Amount
  L5_413 = L5_413 + L6_414
  L4_412.InitializeShield_Amount = L5_413
  L5_413 = A1_409.AmountVar
  if L5_413 ~= nil then
    L5_413 = A1_409.HealShieldMod
    if L5_413 ~= nil and L5_413 == true then
      L6_414 = A1_409.AttackerVar
      L7_415 = 0
      if L6_414 ~= nil then
        L7_415 = GetPercentHealingAmountMod(A0_408[L6_414])
      end
      L4_412.InitializeShield_Amount, L3_411[A1_409.AmountVar] = (A1_409.Amount + L3_411[A1_409.AmountVar]) * (1 + L7_415), (A1_409.Amount + L3_411[A1_409.AmountVar]) * (1 + L7_415)
    end
  end
  L5_413 = SpellBuffAddNoRenew
  L6_414 = A1_409.AttackerVar
  L6_414 = A0_408[L6_414]
  L7_415 = A1_409.UnitVar
  L7_415 = A0_408[L7_415]
  L5_413(L6_414, L7_415, "InitializeShieldMarker", 0, 1, 25000, L4_412)
  L5_413 = BBIncreaseShield
  L6_414 = A0_408
  L7_415 = A1_409
  L5_413(L6_414, L7_415)
end
BBInitializeShield = L0_0
function L0_0(A0_416, A1_417)
  if A1_417.CDVar ~= nil then
  end
  if A1_417.CD ~= nil then
  end
  if A1_417.TargetVar ~= nil then
    GetTable(A0_416, A1_417.DestVarTable, false)[A1_417.DestVar] = (0 + GetTable(A0_416, A1_417.CDVarTable, true)[A1_417.CDVar] + A1_417.CD) * (1 + GetPercentCooldownMod(A0_416[A1_417.TargetVar]))
  else
    GetTable(A0_416, A1_417.DestVarTable, false)[A1_417.DestVar] = A1_417.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_418, A1_419)
  local L2_420, L3_421
  L3_421 = A1_419.TargetVar
  if L3_421 ~= nil then
    L2_420 = A1_419.Stat(A0_418[L3_421])
  else
    L2_420 = A1_419.Stat()
  end
  SetVarInTable(A0_418, A1_419, L2_420)
end
BBGetStat = L0_0
function L0_0(A0_422, A1_423)
  if A1_423.TargetVar ~= nil then
    GetTable(A0_422, A1_423.DestVarTable, false)[A1_423.DestVar] = GetLevel(A0_422[A1_423.TargetVar])
  else
    GetTable(A0_422, A1_423.DestVarTable, false)[A1_423.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_424, A1_425)
  if A1_425.TargetVar ~= nil then
    GetTable(A0_424, A1_425.DestVarTable, false)[A1_425.DestVar] = GetUnitSignificance(A0_424[A1_425.TargetVar])
  else
    GetTable(A0_424, A1_425.DestVarTable, false)[A1_425.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_426, A1_427)
  if A1_427.TargetVar ~= nil then
    GetTable(A0_426, A1_427.DestVarTable, false)[A1_427.DestVar] = GetArmor(A0_426[A1_427.TargetVar])
  else
    GetTable(A0_426, A1_427.DestVarTable, false)[A1_427.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_428, A1_429)
  if A1_429.TargetVar ~= nil then
    GetTable(A0_428, A1_429.DestVarTable, false)[A1_429.DestVar] = GetSpellBlock(A0_428[A1_429.TargetVar])
  else
    GetTable(A0_428, A1_429.DestVarTable, false)[A1_429.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_430, A1_431)
  local L2_432, L3_433
  L3_433 = A1_431.TargetVar
  if L3_433 ~= nil then
    L2_432 = GetTeamID(A0_430[L3_433])
  else
    L2_432 = GetTeamID()
  end
  SetVarInTable(A0_430, A1_431, L2_432)
end
BBGetTeamID = L0_0
function L0_0(A0_434, A1_435)
  local L2_436, L3_437, L4_438
  L2_436 = GetTable
  L3_437 = A0_434
  L4_438 = A1_435.DestVarTable
  L2_436 = L2_436(L3_437, L4_438, false)
  L3_437 = A1_435.TargetVar
  L4_438 = nil
  if L3_437 ~= nil then
    L4_438 = GetTeamID(A0_434[L3_437])
  else
    L4_438 = GetTeamID()
  end
  if L4_438 == TEAM_ORDER then
    L2_436[A1_435.DestVar] = TEAM_CHAOS
  elseif L4_438 == TEAM_CHAOS then
    L2_436[A1_435.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_439, A1_440)
  if A1_440.TargetVar ~= nil then
    GetTable(A0_439, A1_440.DestVarTable, false)[A1_440.DestVar] = GetUnitSkinName(A0_439[A1_440.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_441, A1_442)
  local L2_443, L3_444, L4_445
  L2_443 = GetTable
  L3_444 = A0_441
  L4_445 = A1_442.DestVarTable
  L2_443 = L2_443(L3_444, L4_445, false)
  L3_444 = A0_441.Owner
  L4_445 = nil
  if A1_442.TargetVar ~= nil then
    L4_445 = GetTotalAttackDamage(A0_441[A1_442.TargetVar])
  else
    L4_445 = GetTotalAttackDamage()
  end
  SetVarInTable(A0_441, A1_442, L4_445)
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_446, A1_447)
  GetTable(A0_446, A1_447.DestVarTable, true)[A1_447.DestVar] = A1_447.Status(A0_446[A1_447.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_448, A1_449)
  local L2_450
  L2_450 = A1_449.TargetVar
  L2_450 = A0_448[L2_450]
  ClearAttackTarget(L2_450)
end
BBClearAttackTarget = L0_0
function L0_0(A0_451, A1_452)
  local L2_453, L3_454
  L2_453 = GetTable
  L3_454 = A0_451
  L2_453 = L2_453(L3_454, A1_452.DestVarTable, true)
  L3_454 = A1_452.Info
  L3_454 = L3_454(A0_451[A1_452.TargetVar])
  SetVarInTable(A0_451, A1_452, L3_454)
end
BBGetCastInfo = L0_0
function L0_0(A0_455, A1_456, A2_457)
  local L3_458, L4_459, L5_460, L6_461
  L3_458 = GetTable
  L4_459 = A0_455
  L5_460 = A1_456.TrackTimeVarTable
  L6_461 = false
  L3_458 = L3_458(L4_459, L5_460, L6_461)
  L4_459 = GetTime
  L4_459 = L4_459()
  L5_460 = A1_456.ExecuteImmediately
  L6_461 = GetParam
  L6_461 = L6_461("TimeBetweenExecutions", A0_455, A1_456)
  if A1_456.TickTimeVar ~= nil and GetTable(A0_455, A1_456.TickTimeVarTable, false)[A1_456.TickTimeVar] ~= nil then
    L6_461 = GetTable(A0_455, A1_456.TickTimeVarTable, false)[A1_456.TickTimeVar]
  end
  if L3_458[A1_456.TrackTimeVar] == nil then
    L3_458[A1_456.TrackTimeVar] = L4_459
    if L5_460 == true then
      ExecuteBuildingBlocks(A2_457, A0_455)
    end
  end
  if L4_459 >= L3_458[A1_456.TrackTimeVar] + L6_461 then
    L3_458[A1_456.TrackTimeVar] = L3_458[A1_456.TrackTimeVar] + L6_461
    ExecuteBuildingBlocks(A2_457, A0_455)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_462, A1_463, A2_464)
  GetTable(A0_462, A1_463.TrackTimeVarTable, false)[A1_463.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_465, A1_466)
  local L2_467
  L2_467 = A1_466.SrcValue
  if A1_466.SrcVar ~= nil then
    L2_467 = GetTable(A0_465, A1_466.SrcVarTable, true)[A1_466.SrcVar]
  end
  A1_466.Status(A0_465[A1_466.TargetVar], L2_467)
end
BBSetStatus = L0_0
function L0_0(A0_468, A1_469)
  local L2_470
  L2_470 = A1_469.ToAlert
  if GetTable(A0_468, A1_469.SrcVarTable, false) ~= nil and A1_469.SrcVar ~= nil then
    L2_470 = L2_470 .. GetTable(A0_468, A1_469.SrcVarTable, false)[A1_469.SrcVar]
  end
  _ALERT(L2_470)
end
BBAlert = L0_0
function L0_0(A0_471, A1_472)
  local L2_473, L3_474, L4_475, L5_476, L6_477, L7_478
  L2_473 = GetParam
  L3_474 = "Value"
  L4_475 = A0_471
  L5_476 = A1_472
  L2_473 = L2_473(L3_474, L4_475, L5_476)
  if L2_473 == nil then
    L3_474 = ReportError
    L4_475 = "Could not resolve Value param"
    L3_474(L4_475)
    return
  end
  L3_474 = true
  L4_475 = GetParam
  L5_476 = "OnUnit"
  L6_477 = A0_471
  L7_478 = A1_472
  L4_475 = L4_475(L5_476, L6_477, L7_478)
  if L4_475 == nil then
    L3_474 = false
    L5_476 = GetParam
    L6_477 = "OnUnitByFlag"
    L7_478 = A0_471
    L5_476 = L5_476(L6_477, L7_478, A1_472)
    L4_475 = L5_476
  end
  if L4_475 == nil then
    L5_476 = ReportError
    L6_477 = "Could not resolve OnUnit param"
    L5_476(L6_477)
    return
  end
  L5_476 = true
  L6_477 = GetParam
  L7_478 = "ChampionToSayTo"
  L6_477 = L6_477(L7_478, A0_471, A1_472)
  if L6_477 == nil then
    L5_476 = false
    L7_478 = GetParam
    L7_478 = L7_478("ChampionToSayToByFlag", A0_471, A1_472)
    L6_477 = L7_478
  end
  if L6_477 == nil then
    L7_478 = ReportError
    L7_478("Could not resolve ChampionToSayTo param")
    return
  end
  L7_478 = GetParam
  L7_478 = L7_478("ShowToSpectator", A0_471, A1_472)
  if L7_478 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  DisplayNumericFloatingTextOnUnitToChampion(L2_473, A1_472.TextType, L4_475, L3_474, L6_477, L5_476, L7_478)
end
BBDisplayNumericFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_479, A1_480)
  local L2_481, L3_482, L4_483, L5_484, L6_485, L7_486
  L2_481 = GetParam
  L3_482 = "Message"
  L4_483 = A0_479
  L5_484 = A1_480
  L2_481 = L2_481(L3_482, L4_483, L5_484)
  if L2_481 == nil then
    L3_482 = ReportError
    L4_483 = "Could not resolve Message param"
    L3_482(L4_483)
    return
  end
  L3_482 = true
  L4_483 = GetParam
  L5_484 = "OnUnit"
  L6_485 = A0_479
  L7_486 = A1_480
  L4_483 = L4_483(L5_484, L6_485, L7_486)
  if L4_483 == nil then
    L3_482 = false
    L5_484 = GetParam
    L6_485 = "OnUnitByFlag"
    L7_486 = A0_479
    L5_484 = L5_484(L6_485, L7_486, A1_480)
    L4_483 = L5_484
  end
  if L4_483 == nil then
    L5_484 = ReportError
    L6_485 = "Could not resolve OnUnit param"
    L5_484(L6_485)
    return
  end
  L5_484 = true
  L6_485 = GetParam
  L7_486 = "ChampionToSayTo"
  L6_485 = L6_485(L7_486, A0_479, A1_480)
  if L6_485 == nil then
    L5_484 = false
    L7_486 = GetParam
    L7_486 = L7_486("ChampionToSayToByFlag", A0_479, A1_480)
    L6_485 = L7_486
  end
  if L6_485 == nil then
    L7_486 = ReportError
    L7_486("Could not resolve ChampionToSayTo param")
    return
  end
  L7_486 = GetParam
  L7_486 = L7_486("ShowToSpectator", A0_479, A1_480)
  if L7_486 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  SayWithFloatingTextOnUnitToChampion(tostring(L2_481), A1_480.TextType, L4_483, L3_482, L6_485, L5_484, L7_486)
end
BBSayWithFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_487, A1_488)
  local L2_489, L3_490, L4_491
  L2_489 = A1_488.ToSay
  L3_490 = GetTable
  L4_491 = A0_487
  L3_490 = L3_490(L4_491, A1_488.SrcVarTable, false)
  if L3_490 ~= nil then
    L4_491 = A1_488.SrcVar
    if L4_491 ~= nil then
      L4_491 = L2_489
      L2_489 = L4_491 .. tostring(L3_490[A1_488.SrcVar])
    end
  end
  L4_491 = nil
  if A1_488.OwnerVar ~= nil then
    L4_491 = A0_487[A1_488.OwnerVar]
  else
    L4_491 = A0_487.Owner
  end
  if A1_488.TextType == nil then
    A1_488.TextType = 0
  end
  Say(L4_491, L2_489, A1_488.TextType)
end
BBSay = L0_0
function L0_0(A0_492, A1_493)
  local L2_494, L3_495, L4_496
  L2_494 = A1_493.ToSay
  L3_495 = GetTable
  L4_496 = A0_492
  L3_495 = L3_495(L4_496, A1_493.SrcVarTable, false)
  if L3_495 ~= nil then
    L4_496 = A1_493.SrcVar
    if L4_496 ~= nil then
      L4_496 = L2_494
      L2_494 = L4_496 .. tostring(L3_495[A1_493.SrcVar])
    end
  end
  L4_496 = nil
  if A1_493.OwnerVar ~= nil then
    L4_496 = A0_492[A1_493.OwnerVar]
  else
    L4_496 = A0_492.Owner
  end
  if A1_493.TextType == nil then
    A1_493.TextType = 0
  end
  Say(L4_496, L2_494, A1_493.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_497, A1_498)
  GetTable(A0_497, A1_498.DestVarTable, true)[A1_498.DestVar] = BBLuaGetGold(A0_497, A1_498)
end
BBGetGold = L0_0
function L0_0(A0_499, A1_500)
  GetTable(A0_499, A1_500.DestVarTable, true)[A1_500.DestVar] = BBLuaGetTotalGold(A0_499, A1_500)
end
BBGetTotalGold = L0_0
function L0_0(A0_501, A1_502)
  SpellBuffAdd(A0_501[A1_502.OwnerVar], A0_501[A1_502.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_501.NextBuffVars)
  BBTeleportToPositionHelper(A0_501, A1_502)
end
BBTeleportToPosition = L0_0
function L0_0(A0_503, A1_504)
  if A1_504.XVar ~= nil and GetTable(A0_503, A1_504.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_503, A1_504.XVarTable, true)[A1_504.XVar]
  else
    Xloc = A1_504.X
  end
  if A1_504.YVar ~= nil and GetTable(A0_503, A1_504.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_503, A1_504.YVarTable, true)[A1_504.YVar]
  else
    Yloc = A1_504.Y
  end
  if A1_504.ZVar ~= nil and GetTable(A0_503, A1_504.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_503, A1_504.ZVarTable, true)[A1_504.ZVar]
  else
    Zloc = A1_504.Z
  end
  A1_504.OwnerVar, A0_503.position = A1_504.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_504.CastPositionName = "position"
  BBTeleportToPosition(A0_503, A1_504)
end
BBTeleportToPoint = L0_0
function L0_0(A0_505, A1_506)
  A1_506.TimeoutInFOW = 999999
  A1_506.BindFlexToOwnerPAR = false
  A1_506.Flags = 0
  A1_506.FollowsGroundTilt = false
  A1_506.FacesTarget = false
  A1_506.HideFromSpectator = false
  A1_506.SendIfOnScreenOrDiscard = false
  A1_506.PersistsThroughReconnect = true
  A1_506.FOWVisibilityRadius = 10
  A1_506.Scale = 1
  A1_506.BindObjectVar = A1_506.BindObject1Var
  A1_506.EffectID2Var = A1_506.OtherTeamEffectIDVar
  A1_506.TargetObjectVar = A1_506.BindObject2Var
  A1_506.FOWTeamOverrideVar = A1_506.FOWTeamVar
  A1_506.BoneName = A1_506.BindObject1BoneName
  A1_506.TargetBoneName = A1_506.BindObject2BoneName
  A1_506.EffectName = A1_506.EffectParticleFile
  A1_506.EffectNameForOtherTeam = A1_506.OtherTeamParticleFile
  BBSpellEffectCreate(A0_505, A1_506)
end
BBSpellEffectCreate_EasyBeam = L0_0
function L0_0(A0_507, A1_508)
  A1_508.TimeoutInFOW = 999999
  A1_508.BindFlexToOwnerPAR = false
  A1_508.Flags = 0
  A1_508.FollowsGroundTilt = false
  A1_508.FacesTarget = false
  A1_508.HideFromSpectator = false
  A1_508.SendIfOnScreenOrDiscard = true
  A1_508.PersistsThroughReconnect = false
  A1_508.FOWVisibilityRadius = 10
  A1_508.Scale = 1
  A1_508.FOWTeamOverrideVar = A1_508.FOWTeamVar
  A1_508.EffectName = A1_508.ParticleFile
  A1_508.EffectNameForOtherTeam = A1_508.ParticleFileForOtherTeam
  A1_508.BoneName = A1_508.BindObjectBoneName
  BBSpellEffectCreate(A0_507, A1_508)
end
BBSpellEffectCreate_EasyHit = L0_0
function L0_0(A0_509, A1_510)
  ReincarnateNonDeadHero(GetTable(A0_509, A1_510.TargetTable, false)[A1_510.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_511, A1_512)
  GetTable(A0_511, A1_512.DestVarTable, true)[A1_512.DestVar] = A1_512.Function(A0_511[A1_512.OwnerVar], A1_512.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_513, A1_514)
  local L2_515, L3_516, L4_517, L5_518
  L2_515 = A1_514.WhomToOrderVar
  L2_515 = A0_513[L2_515]
  L3_516 = A1_514.TargetOfOrderVar
  L3_516 = A0_513[L3_516]
  L4_517 = GetTable
  L5_518 = A0_513
  L4_517 = L4_517(L5_518, A1_514.SrcVarTable, false)
  L5_518 = nil
  if A1_514.SrcVar ~= nil and L4_517 ~= nil then
    L5_518 = L4_517[A1_514.SrcVar]
  else
    L5_518 = GetPosition(L3_516)
  end
  if L3_516 == nil then
    L3_516 = L2_515
  end
  IssueOrder(L2_515, A1_514.Order, L5_518, L3_516)
end
BBIssueOrder = L0_0
function L0_0(A0_519, A1_520)
  local L2_521
  L2_521 = GetParam
  L2_521 = L2_521("NewRange", A0_519, A1_520)
  SetSpellCastRange(L2_521)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_522, A1_523)
  GetTable(A0_522, A1_523.DestVarTable, true)[A1_523.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_524, A1_525)
  local L2_526, L3_527
  L2_526 = A1_525.ObjectVar1
  L2_526 = A0_524[L2_526]
  L3_527 = A1_525.ObjectVar2
  L3_527 = A0_524[L3_527]
  GetTable(A0_524, A1_525.DestVarTable, true)[A1_525.DestVar] = DistanceBetweenObjectBounds(L2_526, L3_527)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_528, A1_529)
  local L2_530, L3_531, L4_532
  L2_530 = A1_529.ObjectVar
  L2_530 = A0_528[L2_530]
  L3_531 = GetTable
  L4_532 = A0_528
  L3_531 = L3_531(L4_532, A1_529.PointVarTable, true)
  L4_532 = A1_529.PointVar
  L4_532 = L3_531[L4_532]
  GetTable(A0_528, A1_529.DestVarTable, true)[A1_529.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_530, L4_532)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_533, A1_534)
  local L2_535, L3_536
  L2_535 = GetParam
  L3_536 = "Point1"
  L2_535 = L2_535(L3_536, A0_533, A1_534)
  L3_536 = GetParam
  L3_536 = L3_536("Point2", A0_533, A1_534)
  GetTable(A0_533, A1_534.DestVarTable, true)[A1_534.DestVar] = DistanceBetweenPoints(L2_535, L3_536)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_537, A1_538, A2_539)
  local L3_540, L4_541, L5_542, L6_543, L7_544, L8_545
  L5_542 = 0
  L6_543 = nil
  L7_544 = A1_538.ObjectDistanceType
  L8_545 = A1_538.ObjectVar1
  L3_540 = A0_537[L8_545]
  L8_545 = A1_538.ObjectVar2
  L4_541 = A0_537[L8_545]
  if nil == L4_541 then
    L8_545 = A1_538.Point2Var
    if nil ~= L8_545 then
      L8_545 = GetTable
      L8_545 = L8_545(A0_537, A1_538.Point2VarTable, true)
      L4_541 = L8_545[A1_538.Point2Var]
      L5_542 = L5_542 + 1
    end
  end
  if nil == L3_540 then
    L8_545 = A1_538.Point1Var
    if nil ~= L8_545 then
      L8_545 = GetTable
      L8_545 = L8_545(A0_537, A1_538.Point1VarTable, true)
      L3_540 = L8_545[A1_538.Point1Var]
      L5_542 = L5_542 + 1
      if 1 == L5_542 then
        L3_540, L4_541 = L4_541, L3_540
      end
    end
  end
  if nil ~= L7_544 then
    if 0 == L5_542 then
      L8_545 = OBJECT_CENTER
      if L8_545 == L7_544 then
        L6_543 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_545 = OBJECT_BOUNDARY
        if L8_545 == L7_544 then
          L6_543 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_545 = A1_538.OwnerVar
          L8_545 = A0_537[L8_545]
          Say(L8_545, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_542 then
      L8_545 = OBJECT_CENTER
      if L8_545 == L7_544 then
        L6_543 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_545 = OBJECT_BOUNDARY
        if L8_545 == L7_544 then
          L6_543 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_545 = A1_538.OwnerVar
          L8_545 = A0_537[L8_545]
          Say(L8_545, "invalid object distance type", 0)
        end
      end
    else
      L6_543 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_545 = A1_538.Distance
  if A1_538.DistanceVar ~= nil and GetTable(A0_537, A1_538.DistanceVarTable, true) ~= nil then
    L8_545 = L8_545 + GetTable(A0_537, A1_538.DistanceVarTable, true)[A1_538.DistanceVar]
  end
  if L3_540 ~= nil and L4_541 ~= nil and L6_543 ~= nil and L8_545 ~= nil then
    if not L6_543(L3_540, L4_541, L8_545) then
      ExecuteBuildingBlocks(A2_539, A0_537)
      A0_537.LastIfSucceeded = true
    else
      A0_537.LastIfSucceeded = false
    end
  else
    A0_537.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_546, A1_547)
  local L2_548, L3_549
  L2_548 = A1_547.TargetVar
  L2_548 = A0_546[L2_548]
  L3_549 = A1_547.CasterVar
  L3_549 = A0_546[L3_549]
  GetTable(A0_546, A1_547.DestVarTable, true)[A1_547.DestVar] = SpellBuffCount(L2_548, A1_547.BuffName, L3_549)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_550, A1_551)
  local L2_552
  L2_552 = A1_551.TargetVar
  L2_552 = A0_550[L2_552]
  GetTable(A0_550, A1_551.DestVarTable, true)[A1_551.DestVar] = SpellBuffCount(L2_552, A1_551.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_553, A1_554)
  local L2_555, L3_556
  L2_555 = GetTable
  L3_556 = A0_553
  L2_555 = L2_555(L3_556, A1_554.ScaleVarTable, false)
  L3_556 = nil
  if A1_554.OwnerVar ~= nil then
    L3_556 = A0_553[A1_554.OwnerVar]
  else
    L3_556 = A0_553.Owner
  end
  if A1_554.ScaleVar ~= nil and A1_554.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_555[A1_554.ScaleVar], L3_556)
  else
    SetScaleSkinCoef(A1_554.Scale, L3_556)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_557, A1_558)
  SpellBuffAdd(A0_557[A1_558.TargetVar], A0_557[A1_558.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_557.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_559, A1_560, A2_561)
  local L3_562, L4_563
  L3_562 = A1_560.TargetVar
  L3_562 = A0_559[L3_562]
  L4_563 = A1_560.NumStacks
  if GetParam("NumStacks", A0_559, A1_560) == 0 then
    L4_563 = SpellBuffCount(L3_562, A1_560.BuffName, caster)
  else
    L4_563 = GetParam("NumStacks", A0_559, A1_560)
  end
  while L4_563 > 0 do
    SpellBuffRemove(L3_562, A1_560.BuffName, A0_559[A1_560.AttackerVar])
    L4_563 = L4_563 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_564, A1_565)
  local L2_566, L3_567
  L2_566 = GetParam
  L3_567 = "Unit"
  L2_566 = L2_566(L3_567, A0_564, A1_565)
  unit = L2_566
  L2_566 = unit
  if L2_566 == nil then
    L2_566 = ReportError
    L3_567 = "Could not resolve Unit param"
    L2_566(L3_567)
    return
  end
  L2_566 = true
  L3_567 = GetParam
  L3_567 = L3_567("ChampionToShowTo", A0_564, A1_565)
  if L3_567 == nil then
    L2_566 = false
    L3_567 = GetParam("ChampionToShowToByFlag", A0_564, A1_565)
  end
  if L3_567 == nil then
    ReportError("Could not resolve ChampionToShowTo param")
    return
  end
  SetShowHealthBarToChampion(unit, A1_565.Show, L3_567, L2_566, A1_565.ApplyToSpectator)
end
BBSetShowHealthBarToChampion = L0_0
function L0_0(A0_568, A1_569)
  if GetParam("Vector", A0_568, A1_569) ~= nil then
    GetTable(A0_568, A1_569.DestVarTable, false)[A1_569.DestVar] = math.sqrt(GetParam("Vector", A0_568, A1_569).x * GetParam("Vector", A0_568, A1_569).x + GetParam("Vector", A0_568, A1_569).y * GetParam("Vector", A0_568, A1_569).y + GetParam("Vector", A0_568, A1_569).z * GetParam("Vector", A0_568, A1_569).z)
  end
end
BBGetVectorLength = L0_0
function L0_0(A0_570, A1_571, A2_572)
  if A0_570.EmoteId == A1_571.EmoteId then
    ExecuteBuildingBlocks(A2_572, A0_570)
    A0_570.LastIfSucceeded = true
  else
    A0_570.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_573, A1_574, A2_575)
  if A0_573.EmoteId ~= A1_574.EmoteId then
    ExecuteBuildingBlocks(A2_575, A0_573)
    A0_573.LastIfSucceeded = true
  else
    A0_573.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_576, A1_577)
  local L2_578, L3_579, L4_580, L5_581
  L2_578 = GetTable
  L3_579 = A0_576
  L4_580 = A1_577.String1VarTable
  L5_581 = false
  L2_578 = L2_578(L3_579, L4_580, L5_581)
  L3_579 = A1_577.String1Var
  L3_579 = L2_578[L3_579]
  L4_580 = GetTable
  L5_581 = A0_576
  L4_580 = L4_580(L5_581, A1_577.String2VarTable, false)
  L5_581 = A1_577.String2Var
  L5_581 = L4_580[L5_581]
  GetTable(A0_576, A1_577.ResultVarTable, false)[A1_577.ResultVar] = L3_579 .. L5_581
end
BBConcatenateStrings = L0_0
function L0_0(A0_582, A1_583)
  local L2_584, L3_585
  L2_584 = GetTable
  L3_585 = A0_582
  L2_584 = L2_584(L3_585, A1_583.VariableVarTable, false)
  L3_585 = A1_583.VariableVar
  L3_585 = L2_584[L3_585]
  GetTable(A0_582, A1_583.ResultVarTable, false)[A1_583.ResultVar] = "(" .. L3_585 .. ")"
end
BBEncaseInParantheses = L0_0
function L0_0(A0_586, A1_587)
  BBGetMinionKills(A0_586, A1_587)
  A0_586.MinionKillSource = GetParam("MinionKillTarget")
  A0_586.MinionKills = A0_586.MinionsKilled + GetParam("MinionKills", A0_586, A1_587)
  BBSetMinionKills(A0_586, A1_587)
end
BBIncreaseMinionKills = L0_0
