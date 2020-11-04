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
function L0_0(A0_15, A1_16, A2_17)
  local L3_18, L4_19, L5_20, L6_21, L7_22, L8_23, L9_24, L10_25, L11_26
  L3_18 = {}
  for L7_22, L8_23 in L4_19(L5_20) do
    L3_18[L7_22] = L8_23
    L9_24 = GetHashedGameObjName
    L10_25 = L7_22
    L9_24 = L9_24(L10_25)
    L3_18[L9_24] = L8_23
  end
  for L7_22, L8_23 in L4_19(L5_20) do
    L9_24 = L8_23.VarTable
    L10_25 = L8_23.Var
    L11_26 = GetTable
    L11_26 = L11_26(A0_15, L9_24, false)
    L3_18[L7_22] = L11_26[L10_25]
    L3_18[GetHashedGameObjName(L7_22)] = L11_26[L10_25]
  end
  L3_18.InstanceVars = L4_19
  L3_18.CharVars = L4_19
  L3_18.NextBuffVars = L4_19
  L3_18.AvatarVars = L4_19
  L3_18.SpellVars = L4_19
  L3_18.WorldVars = L4_19
  L3_18.Target = L4_19
  L3_18[L4_19] = L5_20
  L3_18.Attacker = L4_19
  L3_18[L4_19] = L5_20
  L3_18.Owner = L4_19
  L3_18[L4_19] = L5_20
  L3_18.FunctionSubBlocks = A2_17
  L3_18.CallerPTP = A0_15
  L3_18.Caster = L4_19
  L3_18.GoldRedirectTarget = L4_19
  L6_21(L7_22, L8_23)
  for L9_24, L10_25 in L6_21(L7_22) do
    L11_26 = L10_25.VarTable
    GetTable2(A0_15, L11_26, true)[L10_25.Var] = L3_18[L9_24]
  end
end
BBExecuteFunction = L0_0
function L0_0(A0_27, A1_28)
  local L2_29, L3_30, L4_31, L5_32, L6_33, L7_34, L8_35
  L2_29 = A0_27.CallerPTP
  L3_30 = A1_28.Exports
  if L3_30 ~= nil then
    for L7_34, L8_35 in L4_31(L5_32) do
      L2_29[L8_35] = A0_27[L8_35]
      L2_29[GetHashedGameObjName(L8_35)] = A0_27[L8_35]
    end
  end
  L4_31(L5_32, L6_33)
end
BBExecuteFunctionSubBlocks = L0_0
function L0_0(A0_36, A1_37)
  local L2_38, L3_39
  L2_38 = GetParam
  L3_39 = "Required"
  L2_38 = L2_38(L3_39, A0_36, A1_37)
  L3_39 = gDebugMode
  if L3_39 ~= nil and L2_38 == nil then
    L3_39 = ALREADY_WARNED
    L3_39 = L3_39[A1_37.RequiredVar]
    if L3_39 == nil then
      L3_39 = A1_37.RequiredVar
      if L3_39 ~= nil then
        L3_39 = A1_37.RequiredVarTable
        if L3_39 == nil then
          L3_39 = "PassThroughParams"
        end
        DebugClientPrint("Missing Required Variable: " .. L3_39 .. "." .. A1_37.RequiredVar .. " Current block data is: " .. tostring(gCurrentBuildingBlockString))
        ALREADY_WARNED[A1_37.RequiredVar] = true
      end
    end
  end
end
BBRequireVar = L0_0
L0_0 = {}
ALREADY_WARNED = L0_0
function L0_0(A0_40, A1_41, A2_42)
  ExecuteBuildingBlocks(A2_42, A0_40)
end
BBCom = L0_0
function L0_0(A0_43, A1_44, A2_45)
  if A1_44.IsConditionTrue(A0_43) then
    ExecuteBuildingBlocks(A2_45, A0_43)
  end
end
BBConditionallyExecute = L0_0
function L0_0(A0_46, A1_47)
  local L2_48, L3_49
  L2_48 = GetTable
  L3_49 = A0_46
  L2_48 = L2_48(L3_49, A1_47.SrcVarTable, false)
  L3_49 = A1_47.ToSay
  L3_49 = L3_49 or ""
  DebugClientPrint(tostring(L3_49) .. ": " .. type(L2_48[A1_47.SrcVar]))
end
BBPrintTypeToChat = L0_0
function L0_0(A0_50, A1_51)
  local L2_52, L3_53, L4_54, L5_55, L6_56
  L2_52 = A1_51.ToSay
  L2_52 = L2_52 or ""
  L3_53 = A1_51.Color
  L3_53 = L3_53 or "FFFFFF"
  L4_54 = GetTable
  L5_55 = A0_50
  L6_56 = A1_51.SrcVarTable
  L4_54 = L4_54(L5_55, L6_56, false)
  L5_55 = A1_51.SrcVar
  L5_55 = L4_54[L5_55]
  L6_56 = "<font color=\""
  L6_56 = L6_56 .. L3_53 .. "\">"
  if L2_52 == "" then
    if A1_51.SrcVarTable ~= nil then
      L6_56 = L6_56 .. "(DEBUG) " .. A1_51.SrcVarTable .. "." .. (A1_51.SrcVar or "")
    else
      L6_56 = L6_56 .. "(DEBUG) " .. (A1_51.SrcVar or "")
    end
  else
    L6_56 = L6_56 .. "(DEBUG) " .. L2_52
  end
  if type(L5_55) ~= "table" and type(L5_55) ~= "nil" then
    L6_56 = L6_56 .. " " .. tostring(L5_55)
  end
  L6_56 = L6_56 .. "</font>"
  DebugClientPrint(L6_56)
  if type(L5_55) == "table" then
    PrintTableToChat(L5_55)
  end
end
BBPrintToChat = L0_0
function L0_0(A0_57, A1_58)
  local L2_59, L3_60
  L2_59 = GetTable
  L3_60 = A0_57
  L2_59 = L2_59(L3_60, A1_58.TableName, true)
  L3_60 = A1_58.TableName
  L3_60 = L3_60 or "PassThroughParams"
  DebugClientPrint(L3_60)
  PrintTableToChat(L2_59)
end
BBPrintTableToChat = L0_0
function L0_0(A0_61, A1_62)
  local L2_63, L3_64, L4_65, L5_66, L6_67, L7_68, L8_69, L9_70, L10_71, L11_72, L12_73, L13_74
  A1_62 = A1_62 or 0
  if A1_62 > 10 then
    return
  end
  L2_63 = nil
  L3_64 = "|"
  for L7_68 = 1, A1_62 do
    L9_70 = "----"
    L3_64 = L8_69 .. L9_70
  end
  L6_67(L7_68)
  for L9_70, L10_71 in L6_67(L7_68) do
    L11_72 = nil
    L12_73 = tostring
    L13_74 = L9_70
    L12_73 = L12_73(L13_74)
    if L12_73 == "PassThroughParams" then
      L11_72 = "{{ PassThroughParams }}"
    else
      L13_74 = type
      L13_74 = L13_74(L10_71)
      if L13_74 == "table" then
        L11_72 = "Table"
      else
        L13_74 = tostring
        L13_74 = L13_74(L10_71)
        L11_72 = L13_74
      end
    end
    L13_74 = L3_64
    L13_74 = L13_74 .. L12_73 .. ": " .. L11_72
    DebugClientPrint(L13_74)
    if type(L10_71) == "table" then
      PrintTableToChat(L10_71, A1_62 + 1)
    end
  end
  L6_67(L7_68)
end
PrintTableToChat = L0_0
function L0_0(A0_75, A1_76)
end
BBDebugPrintToChat = L0_0
function L0_0(A0_77, A1_78)
  local L2_79, L3_80
  L2_79 = GetTable
  L3_80 = A0_77
  L2_79 = L2_79(L3_80, A1_78.TableName, true)
  L3_80 = A1_78.TableName
  L3_80 = L3_80 or "PassThroughParams"
  DebugClientPrint(L3_80)
  DebugPrintTableToChat(L2_79)
end
BBDebugPrintTableToChat = L0_0
function L0_0(A0_81, A1_82)
  local L2_83, L3_84, L4_85, L5_86, L6_87, L7_88, L8_89, L9_90, L10_91, L11_92, L12_93, L13_94
  A1_82 = A1_82 or 0
  if A1_82 > 10 then
    return
  end
  L2_83 = nil
  L3_84 = "|"
  for L7_88 = 1, A1_82 do
    L9_90 = "----"
    L3_84 = L8_89 .. L9_90
  end
  L6_87(L7_88)
  for L9_90, L10_91 in L6_87(L7_88) do
    L11_92 = nil
    L12_93 = tostring
    L13_94 = L9_90
    L12_93 = L12_93(L13_94)
    if L12_93 == "PassThroughParams" then
      L11_92 = "{{ PassThroughParams }}"
    else
      L13_94 = type
      L13_94 = L13_94(L10_91)
      if L13_94 == "table" then
        L11_92 = "Table"
      else
        L13_94 = tostring
        L13_94 = L13_94(L10_91)
        L11_92 = L13_94
      end
    end
    L13_94 = L3_84
    L13_94 = L13_94 .. L12_93 .. ": " .. L11_92
    DebugClientPrint(L13_94)
    if type(L10_91) == "table" then
      DebugPrintTableToChat(L10_91, A1_82 + 1)
    end
  end
  L6_87(L7_88)
end
DebugPrintTableToChat = L0_0
function L0_0(A0_95, A1_96, A2_97)
  local L3_98
  if A1_96 ~= nil then
    L3_98 = A0_95[A1_96]
    if L3_98 == nil and A2_97 then
      A0_95[A1_96] = {}
      return A0_95[A1_96]
    end
  end
  if L3_98 == nil then
    L3_98 = A0_95
  end
  return L3_98
end
GetTable = L0_0
function L0_0(A0_99, A1_100, A2_101)
  local L3_102
  if A1_100 == "PassThroughParams" then
    return A0_99
  end
  if A1_100 ~= nil then
    L3_102 = A0_99[A1_100]
    if L3_102 == nil and A2_101 then
      A0_99[A1_100] = {}
      return A0_99[A1_100]
    end
  end
  if L3_102 == nil then
    L3_102 = A0_99
  end
  return L3_102
end
GetTable2 = L0_0
function L0_0(A0_103, A1_104, A2_105)
  if A2_105[A0_103 .. "Var"] ~= nil and GetTable(A1_104, A2_105[A0_103 .. "VarTable"], false) ~= nil then
    return GetTable(A1_104, A2_105[A0_103 .. "VarTable"], false)[A2_105[A0_103 .. "Var"]]
  else
    return A2_105[A0_103]
  end
end
GetParam = L0_0
function L0_0(A0_106, A1_107)
  GetTable(A0_106, A1_107.DestVarTable, true)[A1_107.DestVar] = {}
end
BBCreateCustomTable = L0_0
function L0_0(A0_108, A1_109)
  GetTable(A0_108, A1_109.TableNameVarTable, false)[A1_109.TableNameVar] = nil
end
BBDestroyCustomTable = L0_0
function L0_0(A0_110, A1_111)
  if type(GetTable(A0_110, A1_111.DestTableVarTable, false)[A1_111.DestTableVar]) == "nil" then
    GetTable(A0_110, A1_111.DestTableVarTable, false)[A1_111.DestTableVar] = {}
  end
  if type(GetTable(A0_110, A1_111.DestTableVarTable, false)[A1_111.DestTableVar]) == "table" then
    GetTable(A0_110, A1_111.DestTableVarTable, false)[A1_111.DestTableVar][GetParam("Key", A0_110, A1_111)] = GetParam("Value", A0_110, A1_111)
  end
end
BBSetKeyValueInCustomTable = L0_0
function L0_0(A0_112, A1_113)
  if type(GetTable(A0_112, A1_113.SrcTableVarTable, false)[A1_113.SrcTableVar]) == "table" then
    GetTable(A0_112, A1_113.DestVarTable, true)[A1_113.DestVar] = GetTable(A0_112, A1_113.SrcTableVarTable, false)[A1_113.SrcTableVar][GetParam("SrcKey", A0_112, A1_113)]
  end
end
BBGetKeyValueInCustomTable = L0_0
function L0_0(A0_114, A1_115)
  local L2_116, L3_117, L4_118
  L2_116 = GetTable
  L3_117 = A0_114
  L4_118 = A1_115.DestTableVarTable
  L2_116 = L2_116(L3_117, L4_118, false)
  L3_117 = GetParam
  L4_118 = "DestIndex"
  L3_117 = L3_117(L4_118, A0_114, A1_115)
  L4_118 = GetParam
  L4_118 = L4_118("Value", A0_114, A1_115)
  if type(L2_116[A1_115.DestTableVar]) == "nil" then
    L2_116[A1_115.DestTableVar] = {}
  end
  if type(L2_116[A1_115.DestTableVar]) == "table" then
    if L3_117 then
      table.insert(L2_116[A1_115.DestTableVar], L3_117, L4_118)
      if A1_115.OutIndexVar then
        GetTable(A0_114, A1_115.OutIndexVarTable, true)[A1_115.OutIndexVar] = L3_117
      end
    else
      table.insert(L2_116[A1_115.DestTableVar], L4_118)
      if A1_115.OutIndexVar then
        GetTable(A0_114, A1_115.OutIndexVarTable, true)[A1_115.OutIndexVar] = table.getn(L2_116[A1_115.DestTableVar])
      end
    end
  end
end
BBInsertIntoInCustomTable = L0_0
function L0_0(A0_119, A1_120)
  local L2_121, L3_122
  L2_121 = GetTable
  L3_122 = A0_119
  L2_121 = L2_121(L3_122, A1_120.TableVarTable, false)
  L3_122 = GetParam
  L3_122 = L3_122("Index", A0_119, A1_120)
  if type(L2_121[A1_120.TableVar]) == "nil" then
    DebugClientPrint("Table specified does not exist: " .. tostring(A1_120.TableVarTable) .. "." .. tostring(A1_120.TableVar))
    return
  end
  if type(L2_121[A1_120.TableVar]) == "table" then
    if GetParam("Key", A0_119, A1_120) then
      L2_121[A1_120.TableVar][GetParam("Key", A0_119, A1_120)] = nil
    elseif L3_122 then
      table.remove(L2_121[A1_120.TableVar], L3_122)
    else
      DebugClientPrint("Specified index/key was nil: " .. tostring(A1_120.IndexVarTable) .. "." .. tostring(A1_120.IndexVar))
    end
  end
end
BBRemoveFromCustomTable = L0_0
function L0_0(A0_123, A1_124, A2_125)
  local L3_126, L4_127, L5_128, L6_129, L7_130, L8_131
  L3_126 = GetTable
  L3_126 = L3_126(L4_127, L5_128, L6_129)
  if L4_127 == "table" then
    if L4_127 then
      for L8_131, _FORV_9_ in L5_128(L6_129) do
        table.insert(L4_127, L8_131)
      end
      L5_128(L6_129)
      for L8_131, _FORV_9_ in L5_128(L6_129) do
        GetTable(A0_123, A1_124.DestKeyVarTable, true)[A1_124.DestKeyVar] = _FORV_9_
        GetTable(A0_123, A1_124.DestValueVarTable, true)[A1_124.DestValueVar] = L3_126[A1_124.TableVar][_FORV_9_]
        ExecuteBuildingBlocks(A2_125, A0_123)
      end
    else
      for L7_130, L8_131 in L4_127(L5_128) do
        GetTable(A0_123, A1_124.DestKeyVarTable, true)[A1_124.DestKeyVar] = L7_130
        GetTable(A0_123, A1_124.DestValueVarTable, true)[A1_124.DestValueVar] = L8_131
        ExecuteBuildingBlocks(A2_125, A0_123)
      end
    end
  end
end
BBForEachInCustomTable = L0_0
function L0_0(A0_132, A1_133)
  local L2_134, L3_135, L4_136, L5_137, L6_138
  L2_134 = GetTable
  L3_135 = A0_132
  L4_136 = A1_133.SrcTableVarTable
  L5_137 = false
  L2_134 = L2_134(L3_135, L4_136, L5_137)
  L3_135 = GetParam
  L4_136 = "Value"
  L5_137 = A0_132
  L6_138 = A1_133
  L3_135 = L3_135(L4_136, L5_137, L6_138)
  L4_136 = GetTable
  L5_137 = A0_132
  L6_138 = A1_133.MatchingKeyVarTable
  L4_136 = L4_136(L5_137, L6_138, false)
  L5_137 = GetTable
  L6_138 = A0_132
  L5_137 = L5_137(L6_138, A1_133.WasFoundVarTable, false)
  L6_138 = A1_133.WasFoundVar
  L5_137[L6_138] = false
  L6_138 = type
  L6_138 = L6_138(L2_134[A1_133.SrcTableVar])
  if L6_138 == "table" then
    L6_138 = GetTable
    L6_138 = L6_138(A0_132, A1_133.DestVarTable, true)
    for _FORV_10_, _FORV_11_ in pairs(L6_138) do
      if _FORV_11_ == L3_135 then
        L5_137[A1_133.WasFoundVar] = true
        L4_136[A1_133.MatchingKeyVar] = _FORV_10_
      end
    end
  end
end
BBCustomTableContainsValue = L0_0
function L0_0(A0_139, A1_140, A2_141)
  for _FORV_9_, _FORV_10_ in pairs(GetTable(A0_139, A1_140.TableVarTable, false)[A1_140.TableVar]) do
  end
  GetTable(A0_139, A1_140.SizeVarTable, false)[A1_140.SizeVar] = 0 + 1
end
BBGetSizeOfCustomTable = L0_0
function L0_0(A0_142, A1_143, A2_144, A3_145)
  local L4_146
  L4_146 = GetParam
  L4_146 = L4_146("Unit", A0_142, A1_143)
  if L4_146 ~= nil then
    A1_143.DestPos = GetPosition(L4_146)
    A1_143.DestPosVar = "__TempDestPos"
    GetTable(A0_142, A1_143.DestPosVarTable, false)[A1_143.DestPosVar] = GetPosition(L4_146)
  end
  A1_143.RegionGroup = A2_144
  BBGetRegionTag(A0_142, A1_143)
  for _FORV_11_, _FORV_12_ in ipairs(A3_145) do
  end
  return true
end
CheckIfUnitOrPointIsInRegionTagList = L0_0
function L0_0(A0_147, A1_148)
  local L2_149, L3_150
  L2_149 = GameplayLane
  L3_150 = {
    LANE_Top_Order,
    LANE_Mid_Order,
    LANE_Bot_Order
  }
  resultTable = GetTable(A0_147, A1_148.ResultVarTable, false)
  resultTable[A1_148.ResultVar] = CheckIfUnitOrPointIsInRegionTagList(A0_147, A1_148, L2_149, L3_150)
end
BBGetIsOrderSide = L0_0
function L0_0(A0_151, A1_152)
  local L2_153, L3_154
  L2_153 = GameplayArea
  L3_154 = {AREA_Jungle_Top, AREA_Jungle_Bot}
  resultTable = GetTable(A0_151, A1_152.ResultVarTable, false)
  resultTable[A1_152.ResultVar] = CheckIfUnitOrPointIsInRegionTagList(A0_151, A1_152, L2_153, L3_154)
end
BBGetIsJungle = L0_0
function L0_0(A0_155, A1_156)
  local L2_157, L3_158
  L2_157 = GameplayArea
  L3_158 = {
    AREA_Lane_Top,
    AREA_Lane_Mid,
    AREA_Lane_Bot
  }
  resultTable = GetTable(A0_155, A1_156.ResultVarTable, false)
  resultTable[A1_156.ResultVar] = CheckIfUnitOrPointIsInRegionTagList(A0_155, A1_156, L2_157, L3_158)
end
BBGetIsLane = L0_0
function L0_0(A0_159, A1_160)
  local L2_161, L3_162
  L2_161 = GameplayArea
  L3_162 = {AREA_River_Top, AREA_River_Bot}
  resultTable = GetTable(A0_159, A1_160.ResultVarTable, false)
  resultTable[A1_160.ResultVar] = CheckIfUnitOrPointIsInRegionTagList(A0_159, A1_160, L2_161, L3_162)
end
BBGetIsRiver = L0_0
function L0_0(A0_163, A1_164)
  local L2_165, L3_166
  L2_165 = GameplayArea
  L3_166 = {AREA_BasePerimeter_Top, AREA_BasePerimeter_Bot}
  resultTable = GetTable(A0_163, A1_164.ResultVarTable, false)
  resultTable[A1_164.ResultVar] = CheckIfUnitOrPointIsInRegionTagList(A0_163, A1_164, L2_165, L3_166)
end
BBGetIsBasePerimeter = L0_0
function L0_0(A0_167, A1_168)
  local L2_169, L3_170, L4_171, L5_172
  L2_169 = GameplayLane
  L3_170 = {L4_171, L5_172}
  L4_171 = LANE_Top_Order
  L5_172 = LANE_Top_Chaos
  L4_171 = {L5_172, LANE_Mid_Chaos}
  L5_172 = LANE_Mid_Order
  L5_172 = {LANE_Bot_Order, LANE_Bot_Chaos}
  if CheckIfUnitOrPointIsInRegionTagList(A0_167, A1_168, L2_169, L3_170) then
  elseif CheckIfUnitOrPointIsInRegionTagList(A0_167, A1_168, L2_169, L4_171) then
  elseif CheckIfUnitOrPointIsInRegionTagList(A0_167, A1_168, L2_169, L5_172) then
  end
  resultTable = GetTable(A0_167, A1_168.ResultVarTable, false)
  resultTable[A1_168.ResultVar] = 0
end
BBGetNearestLane = L0_0
function L0_0(A0_173, A1_174)
  local L2_175, L3_176, L4_177, L5_178, L6_179, L7_180, L8_181, L9_182
  L2_175 = GetParam
  L3_176 = "Unit"
  L4_177 = A0_173
  L5_178 = A1_174
  L2_175 = L2_175(L3_176, L4_177, L5_178)
  L3_176 = GetParam
  L4_177 = "X"
  L5_178 = A0_173
  L6_179 = A1_174
  L3_176 = L3_176(L4_177, L5_178, L6_179)
  L4_177 = GetParam
  L5_178 = "Z"
  L6_179 = A0_173
  L7_180 = A1_174
  L4_177 = L4_177(L5_178, L6_179, L7_180)
  if L2_175 ~= nil then
    L5_178 = GetPosition
    L6_179 = L2_175
    L5_178 = L5_178(L6_179)
    L3_176 = L5_178.x
    L4_177 = L5_178.z
  end
  L5_178 = 2
  L6_179 = 1
  L7_180 = 0
  L8_181 = 4
  L9_182 = 3
  if L4_177 > 12250 then
  elseif L4_177 < 2650 then
  elseif L3_176 > 12250 then
  elseif L3_176 < 2650 then
  elseif L4_177 - L3_176 > 4500 then
  else
  end
  if L4_177 > 13000 then
  elseif L4_177 < 1800 then
  elseif L3_176 > 13000 then
  elseif L3_176 < 1800 then
  elseif L4_177 - L3_176 > 1150 then
  else
  end
  GetTable(A0_173, A1_174.NearLaneVarTable, false)[A1_174.NearLaneVar] = L7_180
  GetTable(A0_173, A1_174.NearSectionVarTable, false)[A1_174.NearSectionVar] = L9_182
  GetTable(A0_173, A1_174.BlueSideVarTable, false)[A1_174.BlueSideVar] = true
end
BBGetLocationHints = L0_0
function L0_0(A0_183, A1_184)
  local L2_185, L3_186, L4_187, L5_188
  L2_185 = GetTable
  L3_186 = A0_183
  L4_187 = A1_184.DestVarTable
  L5_188 = true
  L2_185 = L2_185(L3_186, L4_187, L5_188)
  L3_186 = nil
  L4_187 = GetTable
  L5_188 = A0_183
  L4_187 = L4_187(L5_188, A1_184.SpellSlotVarTable, false)
  L5_188 = A1_184.SpellSlotVar
  if L5_188 ~= nil and L4_187 ~= nil then
    L5_188 = A1_184.SpellSlotVar
    L3_186 = L4_187[L5_188]
  else
    L3_186 = A1_184.SpellSlotValue
  end
  L5_188 = A1_184.Function
  L5_188 = L5_188(A0_183[A1_184.OwnerVar], L3_186, A1_184.SpellbookType, A1_184.SlotType)
  SetVarInTable(A0_183, A1_184, L5_188)
end
BBGetSlotSpellInfo = L0_0
function L0_0(A0_189, A1_190)
  local L2_191, L3_192, L4_193
  L2_191 = GetTable
  L3_192 = A0_189
  L4_193 = A1_190.SrcVarTable
  L2_191 = L2_191(L3_192, L4_193, false)
  L3_192 = nil
  L4_193 = A1_190.SrcVar
  if L4_193 ~= nil and L2_191 ~= nil then
    L4_193 = A1_190.SrcVar
    L3_192 = L2_191[L4_193]
  else
    L3_192 = A1_190.SrcValue
  end
  L4_193 = nil
  if A1_190.SpellSlotVar ~= nil and GetTable(A0_189, A1_190.SpellSlotVarTable, false) ~= nil then
    L4_193 = GetTable(A0_189, A1_190.SpellSlotVarTable, false)[A1_190.SpellSlotVar]
  else
    L4_193 = A1_190.SpellSlotValue
  end
  SetSlotSpellCooldownTime(A0_189[A1_190.OwnerVar], L4_193, A1_190.SpellbookType, A1_190.SlotType, L3_192)
end
BBSetSlotSpellCooldownTime = L0_0
function L0_0(A0_194, A1_195)
  if A0_194.Level ~= nil and A1_195.SrcValueByLevel ~= nil then
    A0_194.ReturnValue = A1_195.SrcValueByLevel[A0_194.Level]
  elseif A1_195.SrcVar ~= nil and GetTable(A0_194, A1_195.SrcVarTable, false) ~= nil then
    A0_194.ReturnValue = GetTable(A0_194, A1_195.SrcVarTable, false)[A1_195.SrcVar]
  else
    A0_194.ReturnValue = A1_195.SrcValue
  end
end
BBSetReturnValue = L0_0
function L0_0(A0_196, A1_197)
  A0_196.ReturnValue = true
end
BBCancelOrderBeforeIssued = L0_0
function L0_0(A0_198, A1_199)
  if type(A0_198) == "string" and type(A1_199) == "string" then
    A0_198 = string.lower(A0_198)
    A1_199 = string.lower(A1_199)
  end
  return A0_198 == A1_199
end
CO_EQUAL = L0_0
function L0_0(A0_200, A1_201)
  if type(A0_200) == "string" and type(A1_201) == "string" then
    A0_200 = string.lower(A0_200)
    A1_201 = string.lower(A1_201)
  end
  return A0_200 ~= A1_201
end
CO_NOT_EQUAL = L0_0
function L0_0(A0_202, A1_203)
  local L2_204
  L2_204 = A0_202 < A1_203
  return L2_204
end
CO_LESS_THAN = L0_0
function L0_0(A0_205, A1_206)
  local L2_207
  L2_207 = A1_206 < A0_205
  return L2_207
end
CO_GREATER_THAN = L0_0
function L0_0(A0_208, A1_209)
  local L2_210
  L2_210 = A0_208 <= A1_209
  return L2_210
end
CO_LESS_THAN_OR_EQUAL = L0_0
function L0_0(A0_211, A1_212)
  local L2_213
  L2_213 = A1_212 <= A0_211
  return L2_213
end
CO_GREATER_THAN_OR_EQUAL = L0_0
function L0_0(A0_214, A1_215)
  return GetTeamID(A0_214) == GetTeamID(A1_215)
end
CO_SAME_TEAM = L0_0
function L0_0(A0_216, A1_217)
  return GetTeamID(A0_216) ~= GetTeamID(A1_217)
end
CO_DIFFERENT_TEAM = L0_0
function L0_0(A0_218, A1_219)
  return GetSourceType() == A1_219 or GetSourceType() == A0_218
end
CO_DAMAGE_SOURCETYPE_IS = L0_0
function L0_0(A0_220, A1_221)
  return GetSourceType() ~= A1_221 and GetSourceType() ~= A0_220
end
CO_DAMAGE_SOURCETYPE_IS_NOT = L0_0
function L0_0(A0_222)
  return IsObjectAI(A0_222)
end
CO_IS_TYPE_AI = L0_0
function L0_0(A0_223)
  return IsObjectAI(A0_223) ~= true
end
CO_IS_NOT_AI = L0_0
function L0_0(A0_224)
  return IsObjectHero(A0_224)
end
CO_IS_TYPE_HERO = L0_0
function L0_0(A0_225)
  return IsObjectHero(A0_225) ~= true
end
CO_IS_NOT_HERO = L0_0
function L0_0(A0_226)
  return IsObjectMarker(A0_226)
end
CO_IS_TYPE_MARKER = L0_0
function L0_0(A0_227)
  return IsObjectMarker(A0_227) ~= true
end
CO_IS_NOT_MARKER = L0_0
function L0_0(A0_228)
  return IsClone(A0_228)
end
CO_IS_CLONE = L0_0
function L0_0(A0_229)
  return IsClone(A0_229) ~= true
end
CO_IS_NOT_CLONE = L0_0
function L0_0(A0_230)
  return IsMelee(A0_230)
end
CO_IS_MELEE = L0_0
function L0_0(A0_231)
  return IsMelee(A0_231) ~= true
end
CO_IS_RANGED = L0_0
function L0_0(A0_232)
  return A0_232 > math.random()
end
CO_RANDOM_CHANCE_LESS_THAN = L0_0
function L0_0(A0_233)
  return IsTurretAI(A0_233)
end
CO_IS_TYPE_TURRET = L0_0
function L0_0(A0_234)
  return IsTurretAI(A0_234) ~= true
end
CO_IS_NOT_TURRET = L0_0
function L0_0(A0_235)
  return IsDampener(A0_235)
end
CO_IS_TYPE_INHIBITOR = L0_0
function L0_0(A0_236)
  return IsDampener(A0_236) ~= true
end
CO_IS_NOT_INHIBITOR = L0_0
function L0_0(A0_237)
  return IsHQ(A0_237)
end
CO_IS_TYPE_NEXUS = L0_0
function L0_0(A0_238)
  return IsHQ(A0_238) ~= true
end
CO_IS_NOT_NEXUS = L0_0
function L0_0(A0_239)
  return IsDead(A0_239)
end
CO_IS_DEAD = L0_0
function L0_0(A0_240)
  return IsDead(A0_240) ~= true
end
CO_IS_NOT_DEAD = L0_0
function L0_0(A0_241)
  return IsDeadOrZombie(A0_241)
end
CO_IS_DEAD_OR_ZOMBIE = L0_0
function L0_0(A0_242, A1_243)
  return BBIsTargetInFrontOfMe(A0_242, A1_243)
end
CO_IS_TARGET_IN_FRONT_OF_ME = L0_0
function L0_0(A0_244, A1_245)
  return BBIsTargetBehindMe(A0_244, A1_245)
end
CO_IS_TARGET_BEHIND_ME = L0_0
function L0_0(A0_246)
  return IsWard(A0_246)
end
CO_IS_WARD = L0_0
function L0_0(A0_247)
  return IsStructure(A0_247)
end
CO_IS_STRUCTURE = L0_0
function L0_0(A0_248)
  return IsStructure(A0_248) ~= true
end
CO_IS_NOT_STRUCTURE = L0_0
function L0_0(A0_249)
  local L1_250
  L1_250 = A0_249 ~= nil
  return L1_250
end
CO_IS_NOT_NIL = L0_0
function L0_0(A0_251, A1_252, A2_253)
  GetTable(A0_251, A1_252.MacroVarTable, true)[A1_252.MacroVar] = A2_253
end
BBCreateMacro = L0_0
function L0_0(A0_254, A1_255)
  local L2_256
  L2_256 = GetParam
  L2_256 = L2_256("Macro", A0_254, A1_255)
  if L2_256 ~= nil and type(L2_256) == "table" then
    ExecuteBuildingBlocks(L2_256, A0_254)
  else
    DebugClientPrint("Designer Error: Macro variable is not initialized inside of event. Macro Variable was: " .. tostring(A1_255.MacroVar) .. " and current block data is: " .. gCurrentBuildingBlockString .. ". This error probably occurred due to variable not being initialized yet, being misnamed or two events being called out of sequence. It is highly recommended that script macros either be initialized OnBuffActivate, OnCharActivate or in the same event. Pro Devs may violate this rule at the risk of being forced to read this error message again.")
  end
end
BBRunMacro = L0_0
function L0_0(A0_257, A1_258, A2_259)
  local L3_260, L4_261, L5_262, L6_263, L7_264, L8_265
  L3_260 = GetTable
  L3_260 = L3_260(L4_261, L5_262, L6_263)
  L3_260[L4_261] = A2_259
  if L4_261 == nil then
    A2_259.InPerBlockParams = A1_258
    for L7_264 = 1, 6 do
      L8_265 = "FunctionParameter"
      L8_265 = L8_265 .. L7_264 .. "Var"
      if A1_258[L8_265 .. "Table"] ~= nil then
        DebugClientPrint("Designer Error: CreateFunction can only input parameters to PassThroughParams. Current block data is: " .. gCurrentBuildingBlockString .. ".")
      end
    end
  end
end
BBCreateFunction = L0_0
function L0_0(A0_266, A1_267)
  local L2_268, L3_269, L4_270, L5_271, L6_272
  for L5_271 = 1, 6 do
    L6_272 = "FunctionOutput"
    L6_272 = L6_272 .. L5_271 .. "Var"
    if A1_267[L6_272] ~= nil and A1_267[L6_272] ~= "" then
      if A1_267[L6_272 .. "Table"] ~= nil then
        DebugClientPrint("Designer Error: EndFunction can only output from PassThroughParams. Current block data is: " .. gCurrentBuildingBlockString .. ".")
      else
        A0_266[L6_272] = A0_266[A1_267[L6_272]]
      end
    end
  end
end
BBEndFunction = L0_0
function L0_0(A0_273, A1_274)
  local L2_275, L3_276, L4_277, L5_278, L6_279, L7_280, L8_281, L9_282
  L2_275 = GetParam
  L3_276 = "Function"
  L2_275 = L2_275(L3_276, L4_277, L5_278)
  L3_276 = {}
  L3_276.InstanceVars = L4_277
  L3_276.CharVars = L4_277
  L3_276.NextBuffVars = L4_277
  L3_276.AvatarVars = L4_277
  L3_276.SpellVars = L4_277
  L3_276.WorldVars = L4_277
  L3_276.Target = L4_277
  L3_276[L4_277] = L5_278
  L3_276.Attacker = L4_277
  L3_276[L4_277] = L5_278
  L3_276.Owner = L4_277
  L3_276[L4_277] = L5_278
  L3_276.Caster = L4_277
  L3_276.GoldRedirectTarget = L4_277
  L3_276.Unit = L4_277
  L3_276.Other1 = L4_277
  L3_276.Other2 = L4_277
  L3_276.Other3 = L4_277
  L3_276.Nothing = L4_277
  if L2_275 ~= nil then
    if L4_277 == "table" then
      if L4_277 ~= nil then
        for L8_281 = 1, 6 do
          L9_282 = "FunctionParameter"
          L9_282 = L9_282 .. L8_281 .. "Var"
          if A1_274[L9_282] ~= nil and A1_274[L9_282] ~= "" and L4_277[L9_282] ~= nil and L4_277[L9_282] ~= "" then
            L3_276[L4_277[L9_282]] = GetTable(A0_273, A1_274[L9_282 .. "Table"], false)[A1_274[L9_282]]
          end
        end
      end
      L4_277(L5_278, L6_279)
      for L7_280 = 1, 6 do
        L8_281 = "FunctionOutput"
        L9_282 = L7_280
        L8_281 = L8_281 .. L9_282 .. "Var"
        L9_282 = A1_274[L8_281]
        if L9_282 ~= nil then
          L9_282 = A1_274[L8_281]
          if L9_282 ~= "" then
            L9_282 = L3_276
            GetTable(A0_273, A1_274[L8_281 .. "Table"], false)[A1_274[L8_281]] = L9_282[L8_281]
          end
        end
      end
    end
  else
    L8_281 = gCurrentBuildingBlockString
    L9_282 = ". This error probably occurred due to variable not being initialized yet, being misnamed or two events being called out of sequence. It is highly recommended that script functions either be initialized OnBuffActivate, OnCharActivate or in the same event. Pro Devs may violate this rule at the risk of being forced to read this error message again."
    L4_277(L5_278)
  end
end
BBRunFunction = L0_0
function L0_0(A0_283, A1_284, A2_285)
  local L3_286, L4_287, L5_288, L6_289
  L3_286 = GetTable
  L4_287 = A0_283
  L5_288 = A1_284.Src1VarTable
  L6_289 = false
  L3_286 = L3_286(L4_287, L5_288, L6_289)
  L4_287 = GetTable
  L5_288 = A0_283
  L6_289 = A1_284.Src2VarTable
  L4_287 = L4_287(L5_288, L6_289, false)
  L5_288 = false
  L6_289 = nil
  if L3_286 ~= nil and A1_284.Src1Var ~= nil then
    L6_289 = L3_286[A1_284.Src1Var]
  else
    L6_289 = A1_284.Value1
  end
  if L4_287 ~= nil and A1_284.Src2Var ~= nil then
    L5_288 = A1_284.CompareOp(L6_289, L4_287[A1_284.Src2Var])
  else
    L5_288 = A1_284.CompareOp(L6_289, A1_284.Value2)
  end
  if L5_288 then
    ExecuteBuildingBlocks(A2_285, A0_283)
    A0_283.LastIfSucceeded = true
  else
    A0_283.LastIfSucceeded = false
  end
end
BBIf = L0_0
function L0_0(A0_290, A1_291, A2_292)
  if A0_290.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_292, A0_290)
    A0_290.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_293, A1_294, A2_295)
  if A0_293.LastIfSucceeded == true then
    ExecuteBuildingBlocks(A2_295, A0_293)
    A0_293.LastIfSucceeded = true
  else
    BBIf(A0_293, A1_294, A2_295)
  end
end
BBOrIf = L0_0
function L0_0(A0_296, A1_297, A2_298)
  if A0_296.LastIfSucceeded == true then
    BBIf(A0_296, A1_297, A2_298)
  end
end
BBAndIf = L0_0
function L0_0(A0_299, A1_300, A2_301)
  local L3_302, L4_303, L5_304, L6_305
  L3_302 = A0_299.LastIfSucceeded
  if L3_302 == false then
    L3_302 = GetTable
    L4_303 = A0_299
    L5_304 = A1_300.Src1VarTable
    L6_305 = false
    L3_302 = L3_302(L4_303, L5_304, L6_305)
    L4_303 = GetTable
    L5_304 = A0_299
    L6_305 = A1_300.Src2VarTable
    L4_303 = L4_303(L5_304, L6_305, false)
    L5_304 = false
    L6_305 = nil
    if L3_302 ~= nil and A1_300.Src1Var ~= nil then
      L6_305 = L3_302[A1_300.Src1Var]
    else
      L6_305 = A1_300.Value1
    end
    if L4_303 ~= nil and A1_300.Src2Var ~= nil then
      L5_304 = A1_300.CompareOp(L6_305, L4_303[A1_300.Src2Var])
    else
      L5_304 = A1_300.CompareOp(L6_305, A1_300.Value2)
    end
    if L5_304 then
      ExecuteBuildingBlocks(A2_301, A0_299)
      A0_299.LastIfSucceeded = true
    else
      A0_299.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_306, A1_307, A2_308)
  local L3_309
  if A1_307.TargetVar ~= nil then
    L3_309 = A0_306[A1_307.TargetVar]
  else
    L3_309 = A0_306.Target
  end
  if HasBuffOfType(L3_309, A1_307.BuffType) then
    ExecuteBuildingBlocks(A2_308, A0_306)
    A0_306.LastIfSucceeded = true
  else
    A0_306.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_310, A1_311, A2_312)
  local L3_313, L4_314
  if A1_311.OwnerVar ~= nil then
    L3_313 = A0_310[A1_311.OwnerVar]
  else
    L3_313 = A0_310.Owner
  end
  if A1_311.AttackerVar ~= nil then
    L4_314 = A0_310[A1_311.AttackerVar]
  else
    L4_314 = A0_310.Attacker
  end
  if SpellBuffCount(L3_313, A1_311.BuffName, L4_314) > 0 then
    ExecuteBuildingBlocks(A2_312, A0_310)
    A0_310.LastIfSucceeded = true
  else
    A0_310.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_315, A1_316, A2_317)
  if BBIsMissileAutoAttack(A0_315, A1_316) then
    ExecuteBuildingBlocks(A2_317, A0_315)
    A0_315.LastIfSucceeded = true
  else
    A0_315.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_318, A1_319, A2_320)
  if BBIsMissileConsideredAsAutoAttack(A0_318, A1_319) then
    ExecuteBuildingBlocks(A2_320, A0_318)
    A0_318.LastIfSucceeded = true
  else
    A0_318.LastIfSucceeded = false
  end
end
BBIfMissileConsideredAsAutoAttack = L0_0
function L0_0(A0_321, A1_322)
  A0_321.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_323, A1_324, A2_325)
  local L3_326, L4_327
  if A1_324.OwnerVar ~= nil then
    L3_326 = A0_323[A1_324.OwnerVar]
  else
    L3_326 = A0_323.Owner
  end
  if A1_324.CasterVar ~= nil then
    L4_327 = A0_323[A1_324.CasterVar]
  else
    L4_327 = A0_323.Caster
  end
  if SpellBuffCount(L3_326, A1_324.BuffName, L4_327) <= 0 then
    ExecuteBuildingBlocks(A2_325, A0_323)
    A0_323.LastIfSucceeded = true
  else
    A0_323.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_328, A1_329, A2_330)
  local L3_331
  if A1_329.TargetVar ~= nil then
    L3_331 = A0_328[A1_329.TargetVar]
  else
    L3_331 = A0_328.Owner
  end
  if HasUnitTag(L3_331, A1_329.UnitTag) ~= A1_329.InvertResult then
    ExecuteBuildingBlocks(A2_330, A0_328)
    A0_328.LastIfSucceeded = true
  else
    A0_328.LastIfSucceeded = false
  end
end
BBIfHasUnitTag = L0_0
function L0_0(A0_332, A1_333, A2_334)
  local L3_335, L4_336
  L4_336 = A1_333.OwnerVar
  if L4_336 ~= nil then
    L4_336 = A1_333.OwnerVar
    L3_335 = A0_332[L4_336]
  else
    L3_335 = A0_332.Owner
  end
  L4_336 = GetParam
  L4_336 = L4_336("SpellSlot", A0_332, A1_333)
  if HasSpellTag(L3_335, L4_336, A1_333.SpellbookType, A1_333.SlotType, A1_333.SpellTag) ~= A1_333.InvertResult then
    ExecuteBuildingBlocks(A2_334, A0_332)
    A0_332.LastIfSucceeded = true
  else
    A0_332.LastIfSucceeded = false
  end
end
BBIfHasSpellTag = L0_0
function L0_0(A0_337, A1_338, A2_339)
  local L3_340, L4_341
  if A1_338.OwnerVar ~= nil then
    L3_340 = A0_337[A1_338.OwnerVar]
  else
    L3_340 = A0_337.Owner
  end
  if HasPARType(L3_340, A1_338.PARType) then
    ExecuteBuildingBlocks(A2_339, A0_337)
    A0_337.LastIfSucceeded = true
  else
    A0_337.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_342, A1_343, A2_344)
  local L3_345, L4_346
  if A1_343.OwnerVar ~= nil then
    L3_345 = A0_342[A1_343.OwnerVar]
  else
    L3_345 = A0_342.Owner
  end
  if not HasPARType(L3_345, A1_343.PARType) then
    ExecuteBuildingBlocks(A2_344, A0_342)
    A0_342.LastIfSucceeded = true
  else
    A0_342.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_347, A1_348, A2_349)
  local L3_350, L4_351, L5_352, L6_353, L7_354
  L3_350 = GetTable
  L4_351 = A0_347
  L5_352 = A1_348.Src1VarTable
  L6_353 = false
  L3_350 = L3_350(L4_351, L5_352, L6_353)
  L4_351 = GetTable
  L5_352 = A0_347
  L6_353 = A1_348.Src2VarTable
  L7_354 = false
  L4_351 = L4_351(L5_352, L6_353, L7_354)
  L5_352 = true
  while L5_352 do
    L6_353 = false
    L7_354 = nil
    if L3_350 ~= nil and A1_348.Src1Var ~= nil then
      L7_354 = L3_350[A1_348.Src1Var]
    else
      L7_354 = A1_348.Value1
    end
    if L4_351 ~= nil and A1_348.Src2Var ~= nil then
      L6_353 = A1_348.CompareOp(L7_354, L4_351[A1_348.Src2Var])
    else
      L6_353 = A1_348.CompareOp(L7_354, A1_348.Value2)
    end
    if L6_353 then
      ExecuteBuildingBlocks(A2_349, A0_347)
    else
      L5_352 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_355, A1_356, A2_357)
  local L3_358, L4_359, L5_360
  L3_358 = GetParam
  L4_359 = "Start"
  L5_360 = A0_355
  L3_358 = L3_358(L4_359, L5_360, A1_356)
  L4_359 = GetParam
  L5_360 = "End"
  L4_359 = L4_359(L5_360, A0_355, A1_356)
  L5_360 = L3_358
  while L4_359 >= L5_360 do
    SetVarInTable(A0_355, A1_356, L5_360)
    ExecuteBuildingBlocks(A2_357, A0_355)
    L5_360 = L5_360 + 1
  end
end
BBFor = L0_0
function L0_0(A0_361, A1_362)
  return A0_361 * A1_362
end
MO_MULTIPLY = L0_0
function L0_0(A0_363, A1_364)
  return A0_363 + A1_364
end
MO_ADD = L0_0
function L0_0(A0_365, A1_366)
  return A0_365 - A1_366
end
MO_SUBTRACT = L0_0
function L0_0(A0_367, A1_368)
  return A0_367 / A1_368
end
MO_DIVIDE = L0_0
function L0_0(A0_369, A1_370)
  if A0_369 < A1_370 then
    return A0_369
  else
    return A1_370
  end
end
MO_MIN = L0_0
function L0_0(A0_371, A1_372)
  if A1_372 < A0_371 then
    return A0_371
  else
    return A1_372
  end
end
MO_MAX = L0_0
function L0_0(A0_373, A1_374)
  return A0_373 % A1_374
end
MO_MODULO = L0_0
function L0_0(A0_375)
  return math.floor(A0_375 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_376)
  return math.ceil(A0_376)
end
MO_ROUNDUP = L0_0
function L0_0(A0_377)
  return math.floor(A0_377)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_378)
  return math.sin(math.rad(A0_378))
end
MO_SIN = L0_0
function L0_0(A0_379)
  return math.cos(math.rad(A0_379))
end
MO_COSINE = L0_0
function L0_0(A0_380)
  return math.tan(math.rad(A0_380))
end
MO_TANGENT = L0_0
function L0_0(A0_381)
  return math.deg(math.asin(A0_381))
end
MO_ASIN = L0_0
function L0_0(A0_382)
  return math.deg(math.acos(A0_382))
end
MO_ACOS = L0_0
function L0_0(A0_383)
  return math.deg(math.atan(A0_383))
end
MO_ATAN = L0_0
function L0_0(A0_384, A1_385)
  return math.pow(A0_384, A1_385)
end
MO_POW = L0_0
function L0_0(A0_386)
  return math.sqrt(A0_386)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_387, A1_388)
  local L2_389
  L2_389 = A0_387 and A1_388
  return L2_389
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_390, A1_391)
  local L2_392
  L2_392 = A0_390 or A1_391
  return L2_392
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_393)
  local L1_394
  L1_394 = not A0_393
  return L1_394
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_395)
  return math.abs(A0_395)
end
MO_ABS = L0_0
function L0_0(A0_396, A1_397)
  return math.random(A0_396, A1_397)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_398, A1_399)
  local L2_400, L3_401, L4_402, L5_403
  L2_400 = GetMathNumber
  L3_401 = A0_398
  L4_402 = A1_399.Src1VarTable
  L5_403 = A1_399.Src1Var
  L2_400 = L2_400(L3_401, L4_402, L5_403, A1_399.Src1Value)
  L3_401 = GetMathNumber
  L4_402 = A0_398
  L5_403 = A1_399.Src2VarTable
  L3_401 = L3_401(L4_402, L5_403, A1_399.Src2Var, A1_399.Src2Value)
  L4_402 = GetTable
  L5_403 = A0_398
  L4_402 = L4_402(L5_403, A1_399.DestVarTable)
  L5_403 = A1_399.MathOp
  L5_403 = L5_403(L2_400, L3_401)
  SetVarInTable(A0_398, A1_399, L5_403)
end
BBMath = L0_0
function L0_0(A0_404, A1_405, A2_406, A3_407)
  if A2_406 ~= nil and GetTable(A0_404, A1_405)[A2_406] ~= nil then
    return GetTable(A0_404, A1_405)[A2_406]
  end
  return A3_407
end
GetMathNumber = L0_0
function L0_0(A0_408, A1_409)
  if type(A1_409) == "number" then
    return A1_409
  elseif type(A1_409) == "function" then
    return A1_409(A0_408)
  elseif type(A1_409) == "string" then
    return A0_408[A1_409]
  end
end
GetNumber = L0_0
function L0_0(A0_410, A1_411)
  return VectorAdd(A0_410, A1_411)
end
VEC_ADD = L0_0
function L0_0(A0_412, A1_413)
  return VectorSubtract(A0_412, A1_413)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_414, A1_415)
  return VectorScalarMultiply(A0_414, A1_415)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_416, A1_417)
  return VectorScalarDivide(A0_416, A1_417)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_418, A1_419)
  return VectorRotateY(A0_418, A1_419)
end
VEC_ROTATE = L0_0
function L0_0(A0_420, A1_421)
  BBMath(A0_420, A1_421)
end
BBVectorMath = L0_0
function L0_0(A0_422, A1_423)
  local L2_424, L3_425, L4_426, L5_427
  L2_424 = A0_422.InstanceVars
  L3_425 = L2_424.InterpDelta
  if L3_425 == nil then
    L3_425 = A1_423.Amount
    L4_426 = A1_423.AmountVar
    if L4_426 ~= nil then
      L4_426 = GetTable
      L5_427 = A0_422
      L4_426 = L4_426(L5_427, A1_423.AmountVarTable)
      L5_427 = A1_423.AmountVar
      L3_425 = L4_426[L5_427]
    end
    L4_426 = GetPosition
    L5_427 = A1_423.TargetVar
    L5_427 = A0_422[L5_427]
    L4_426 = L4_426(L5_427)
    L2_424.KnockBackStart = L4_426
    L4_426 = GetNormalizedPositionDelta
    L5_427 = A1_423.TargetVar
    L5_427 = A0_422[L5_427]
    L4_426 = L4_426(L5_427, A0_422[A1_423.AttackerVar], true)
    L5_427 = {}
    L5_427.x = L4_426.x * L3_425
    L5_427.y = 0
    L5_427.z = L4_426.z * L3_425
    L2_424.InterpDelta = L5_427
    L5_427 = GetTime
    L5_427 = L5_427()
    L2_424.StartTime = L5_427
    L5_427 = A1_423.KnockBackDuration
    L2_424.KnockBackDuration = L5_427
  end
  L3_425 = A1_423.TargetVar
  L3_425 = A0_422[L3_425]
  L4_426 = GetTime
  L4_426 = L4_426()
  L5_427 = L2_424.StartTime
  L4_426 = L4_426 - L5_427
  L5_427 = L2_424.KnockBackDuration
  L4_426 = L4_426 / L5_427
  L5_427 = {}
  L5_427.x = L2_424.KnockBackStart.x + L2_424.InterpDelta.x * L4_426
  L5_427.y = L2_424.KnockBackStart.y
  L5_427.z = L2_424.KnockBackStart.z + L2_424.InterpDelta.z * L4_426
  SetPosition(L3_425, L5_427)
end
BBKnockback = L0_0
function L0_0(A0_428, A1_429)
  local L2_430, L3_431
  L2_430 = GetParam
  L3_431 = "Left"
  L2_430 = L2_430(L3_431, A0_428, A1_429)
  L3_431 = GetParam
  L3_431 = L3_431("Right", A0_428, A1_429)
  GetTable(A0_428, A1_429.DestVarTable, true)[A1_429.DestVar] = tostring(L2_430) .. tostring(L3_431)
end
BBAppendString = L0_0
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
BBIncStat = L0_0
function L0_0(A0_435, A1_436)
  local L2_437
  L2_437 = 0
  if A1_436.Delta ~= nil then
    L2_437 = L2_437 + A1_436.Delta
  end
  if A1_436.DeltaByLevel ~= nil and A0_435.Level ~= nil then
    L2_437 = L2_437 + A1_436.DeltaByLevel[A0_435.Level]
  end
  if A1_436.DeltaVar ~= nil then
    L2_437 = L2_437 + GetTable(A0_435, A1_436.DeltaVarTable, true)[A1_436.DeltaVar]
  end
  if A1_436.TargetVar ~= nil then
    A1_436.Stat(L2_437, A0_435[A1_436.TargetVar])
  else
    A1_436.Stat(L2_437)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_438, A1_439)
  local L2_440, L3_441
  L2_440 = A1_439.TargetVar
  L3_441 = 0
  if A1_439.LaneVar ~= nil then
    L3_441 = L3_441 + GetTable(A0_438, A1_439.LaneVarTable, true)[A1_439.LaneVar]
  end
  if A1_439.Lane ~= nil then
    L3_441 = L3_441 + A1_439.Lane
  end
  SetMinionLane(A0_438[L2_440], L3_441)
end
BBSetMinionLane = L0_0
function L0_0(A0_442, A1_443)
  if A1_443.AttackVar ~= nil then
  end
  if A1_443.Attack ~= nil then
  end
  if A1_443.TotalCoefficientVar ~= nil then
  end
  if A1_443.TotalCoefficient ~= nil then
  end
  if A1_443.TargetVar ~= nil then
    GetTable(A0_442, A1_443.DestVarTable, false)[A1_443.DestVar] = (0 + GetTable(A0_442, A1_443.AttackVarTable, true)[A1_443.AttackVar] + A1_443.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_442[A1_443.TargetVar])) + GetFlatCritDamageMod(A0_442[A1_443.TargetVar])) * (0 + GetTable(A0_442, A1_443.TotalCoefficientVarTable, true)[A1_443.TotalCoefficientVar] + A1_443.TotalCoefficient)
  else
    GetTable(A0_442, A1_443.DestVarTable, false)[A1_443.DestVar] = 2 * A1_443.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_444, A1_445)
  local L2_446, L3_447, L4_448, L5_449, L6_450, L7_451
  L2_446 = GetTable
  L3_447 = A0_444
  L4_448 = A1_445.DestVarTable
  L5_449 = false
  L2_446 = L2_446(L3_447, L4_448, L5_449)
  L3_447 = GetTable
  L4_448 = A0_444
  L5_449 = A1_445.AmountVarTable
  L6_450 = true
  L3_447 = L3_447(L4_448, L5_449, L6_450)
  L4_448 = GetTable
  L5_449 = A0_444
  L6_450 = A0_444.NextBuffVars
  L7_451 = false
  L4_448 = L4_448(L5_449, L6_450, L7_451)
  L5_449 = A1_445.AmountVar
  L5_449 = L3_447[L5_449]
  L6_450 = A1_445.Amount
  L5_449 = L5_449 + L6_450
  L4_448.InitializeShield_Amount = L5_449
  L5_449 = A1_445.AmountVar
  if L5_449 ~= nil then
    L5_449 = A1_445.HealShieldMod
    if L5_449 ~= nil and L5_449 == true then
      L6_450 = A1_445.AttackerVar
      L7_451 = 0
      if L6_450 ~= nil then
        L7_451 = GetPercentHealingAmountMod(A0_444[L6_450])
      end
      L4_448.InitializeShield_Amount, L3_447[A1_445.AmountVar] = (A1_445.Amount + L3_447[A1_445.AmountVar]) * (1 + L7_451), (A1_445.Amount + L3_447[A1_445.AmountVar]) * (1 + L7_451)
    end
  end
  L5_449 = SpellBuffAddNoRenew
  L6_450 = A1_445.AttackerVar
  L6_450 = A0_444[L6_450]
  L7_451 = A1_445.UnitVar
  L7_451 = A0_444[L7_451]
  L5_449(L6_450, L7_451, "InitializeShieldMarker", 0, 1, 25000, L4_448)
  L5_449 = BBIncreaseShield
  L6_450 = A0_444
  L7_451 = A1_445
  L5_449(L6_450, L7_451)
end
BBInitializeShield = L0_0
function L0_0(A0_452, A1_453)
  if A1_453.CDVar ~= nil then
  end
  if A1_453.CD ~= nil then
  end
  if A1_453.TargetVar ~= nil then
    GetTable(A0_452, A1_453.DestVarTable, false)[A1_453.DestVar] = (0 + GetTable(A0_452, A1_453.CDVarTable, true)[A1_453.CDVar] + A1_453.CD) * (1 + GetPercentCooldownMod(A0_452[A1_453.TargetVar]))
  else
    GetTable(A0_452, A1_453.DestVarTable, false)[A1_453.DestVar] = A1_453.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_454, A1_455)
  local L2_456, L3_457
  L3_457 = A1_455.TargetVar
  if L3_457 ~= nil then
    L2_456 = A1_455.Stat(A0_454[L3_457])
  else
    L2_456 = A1_455.Stat()
  end
  SetVarInTable(A0_454, A1_455, L2_456)
end
BBGetStat = L0_0
function L0_0(A0_458, A1_459)
  if A1_459.TargetVar ~= nil then
    GetTable(A0_458, A1_459.DestVarTable, false)[A1_459.DestVar] = GetLevel(A0_458[A1_459.TargetVar])
  else
    GetTable(A0_458, A1_459.DestVarTable, false)[A1_459.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_460, A1_461)
  if A1_461.TargetVar ~= nil then
    GetTable(A0_460, A1_461.DestVarTable, false)[A1_461.DestVar] = GetUnitSignificance(A0_460[A1_461.TargetVar])
  else
    GetTable(A0_460, A1_461.DestVarTable, false)[A1_461.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_462, A1_463)
  if A1_463.TargetVar ~= nil then
    GetTable(A0_462, A1_463.DestVarTable, false)[A1_463.DestVar] = GetArmor(A0_462[A1_463.TargetVar])
  else
    GetTable(A0_462, A1_463.DestVarTable, false)[A1_463.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_464, A1_465)
  if A1_465.TargetVar ~= nil then
    GetTable(A0_464, A1_465.DestVarTable, false)[A1_465.DestVar] = GetSpellBlock(A0_464[A1_465.TargetVar])
  else
    GetTable(A0_464, A1_465.DestVarTable, false)[A1_465.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_466, A1_467)
  local L2_468, L3_469
  L3_469 = A1_467.TargetVar
  if L3_469 ~= nil then
    L2_468 = GetTeamID(A0_466[L3_469])
  else
    L2_468 = GetTeamID()
  end
  SetVarInTable(A0_466, A1_467, L2_468)
end
BBGetTeamID = L0_0
function L0_0(A0_470, A1_471)
  local L2_472, L3_473, L4_474
  L2_472 = GetTable
  L3_473 = A0_470
  L4_474 = A1_471.DestVarTable
  L2_472 = L2_472(L3_473, L4_474, false)
  L3_473 = A1_471.TargetVar
  L4_474 = nil
  if L3_473 ~= nil then
    L4_474 = GetTeamID(A0_470[L3_473])
  else
    L4_474 = GetTeamID()
  end
  if L4_474 == TEAM_ORDER then
    L2_472[A1_471.DestVar] = TEAM_CHAOS
  elseif L4_474 == TEAM_CHAOS then
    L2_472[A1_471.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_475, A1_476)
  if A1_476.TargetVar ~= nil then
    GetTable(A0_475, A1_476.DestVarTable, false)[A1_476.DestVar] = GetUnitSkinName(A0_475[A1_476.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_477, A1_478)
  local L2_479, L3_480, L4_481
  L2_479 = GetTable
  L3_480 = A0_477
  L4_481 = A1_478.DestVarTable
  L2_479 = L2_479(L3_480, L4_481, false)
  L3_480 = A0_477.Owner
  L4_481 = nil
  if A1_478.TargetVar ~= nil then
    L4_481 = GetTotalAttackDamage(A0_477[A1_478.TargetVar])
  else
    L4_481 = GetTotalAttackDamage()
  end
  SetVarInTable(A0_477, A1_478, L4_481)
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_482, A1_483)
  GetTable(A0_482, A1_483.DestVarTable, true)[A1_483.DestVar] = A1_483.Status(A0_482[A1_483.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_484, A1_485)
  local L2_486
  L2_486 = A1_485.TargetVar
  L2_486 = A0_484[L2_486]
  ClearAttackTarget(L2_486)
end
BBClearAttackTarget = L0_0
function L0_0(A0_487, A1_488)
  local L2_489, L3_490
  L2_489 = GetTable
  L3_490 = A0_487
  L2_489 = L2_489(L3_490, A1_488.DestVarTable, true)
  L3_490 = A1_488.Info
  L3_490 = L3_490(A0_487[A1_488.TargetVar])
  SetVarInTable(A0_487, A1_488, L3_490)
end
BBGetCastInfo = L0_0
function L0_0(A0_491, A1_492, A2_493)
  local L3_494, L4_495, L5_496, L6_497
  L3_494 = GetTable
  L4_495 = A0_491
  L5_496 = A1_492.TrackTimeVarTable
  L6_497 = false
  L3_494 = L3_494(L4_495, L5_496, L6_497)
  L4_495 = GetTime
  L4_495 = L4_495()
  L5_496 = A1_492.ExecuteImmediately
  L6_497 = GetParam
  L6_497 = L6_497("TimeBetweenExecutions", A0_491, A1_492)
  if A1_492.TickTimeVar ~= nil and GetTable(A0_491, A1_492.TickTimeVarTable, false)[A1_492.TickTimeVar] ~= nil then
    L6_497 = GetTable(A0_491, A1_492.TickTimeVarTable, false)[A1_492.TickTimeVar]
  end
  if L3_494[A1_492.TrackTimeVar] == nil then
    L3_494[A1_492.TrackTimeVar] = L4_495
    if L5_496 == true then
      ExecuteBuildingBlocks(A2_493, A0_491)
    end
  end
  if L4_495 >= L3_494[A1_492.TrackTimeVar] + L6_497 then
    L3_494[A1_492.TrackTimeVar] = L3_494[A1_492.TrackTimeVar] + L6_497
    ExecuteBuildingBlocks(A2_493, A0_491)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_498, A1_499, A2_500)
  GetTable(A0_498, A1_499.TrackTimeVarTable, false)[A1_499.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_501, A1_502)
  local L2_503
  L2_503 = A1_502.SrcValue
  if A1_502.SrcVar ~= nil then
    L2_503 = GetTable(A0_501, A1_502.SrcVarTable, true)[A1_502.SrcVar]
  end
  A1_502.Status(A0_501[A1_502.TargetVar], L2_503)
end
BBSetStatus = L0_0
function L0_0(A0_504, A1_505)
  local L2_506
  L2_506 = A1_505.ToAlert
  if GetTable(A0_504, A1_505.SrcVarTable, false) ~= nil and A1_505.SrcVar ~= nil then
    L2_506 = L2_506 .. GetTable(A0_504, A1_505.SrcVarTable, false)[A1_505.SrcVar]
  end
  _ALERT(L2_506)
end
BBAlert = L0_0
function L0_0(A0_507, A1_508)
  local L2_509, L3_510, L4_511, L5_512, L6_513, L7_514
  L2_509 = GetParam
  L3_510 = "Value"
  L4_511 = A0_507
  L5_512 = A1_508
  L2_509 = L2_509(L3_510, L4_511, L5_512)
  if L2_509 == nil then
    L3_510 = ReportError
    L4_511 = "Could not resolve Value param"
    L3_510(L4_511)
    return
  end
  L3_510 = true
  L4_511 = GetParam
  L5_512 = "OnUnit"
  L6_513 = A0_507
  L7_514 = A1_508
  L4_511 = L4_511(L5_512, L6_513, L7_514)
  if L4_511 == nil then
    L3_510 = false
    L5_512 = GetParam
    L6_513 = "OnUnitByFlag"
    L7_514 = A0_507
    L5_512 = L5_512(L6_513, L7_514, A1_508)
    L4_511 = L5_512
  end
  if L4_511 == nil then
    L5_512 = ReportError
    L6_513 = "Could not resolve OnUnit param"
    L5_512(L6_513)
    return
  end
  L5_512 = true
  L6_513 = GetParam
  L7_514 = "ChampionToSayTo"
  L6_513 = L6_513(L7_514, A0_507, A1_508)
  if L6_513 == nil then
    L5_512 = false
    L7_514 = GetParam
    L7_514 = L7_514("ChampionToSayToByFlag", A0_507, A1_508)
    L6_513 = L7_514
  end
  if L6_513 == nil then
    L7_514 = ReportError
    L7_514("Could not resolve ChampionToSayTo param")
    return
  end
  L7_514 = GetParam
  L7_514 = L7_514("ShowToSpectator", A0_507, A1_508)
  if L7_514 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  DisplayNumericFloatingTextOnUnitToChampion(L2_509, A1_508.TextType, L4_511, L3_510, L6_513, L5_512, L7_514)
end
BBDisplayNumericFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_515, A1_516)
  local L2_517, L3_518, L4_519, L5_520, L6_521, L7_522
  L2_517 = GetParam
  L3_518 = "Message"
  L4_519 = A0_515
  L5_520 = A1_516
  L2_517 = L2_517(L3_518, L4_519, L5_520)
  if L2_517 == nil then
    L3_518 = ReportError
    L4_519 = "Could not resolve Message param"
    L3_518(L4_519)
    return
  end
  L3_518 = true
  L4_519 = GetParam
  L5_520 = "OnUnit"
  L6_521 = A0_515
  L7_522 = A1_516
  L4_519 = L4_519(L5_520, L6_521, L7_522)
  if L4_519 == nil then
    L3_518 = false
    L5_520 = GetParam
    L6_521 = "OnUnitByFlag"
    L7_522 = A0_515
    L5_520 = L5_520(L6_521, L7_522, A1_516)
    L4_519 = L5_520
  end
  if L4_519 == nil then
    L5_520 = ReportError
    L6_521 = "Could not resolve OnUnit param"
    L5_520(L6_521)
    return
  end
  L5_520 = true
  L6_521 = GetParam
  L7_522 = "ChampionToSayTo"
  L6_521 = L6_521(L7_522, A0_515, A1_516)
  if L6_521 == nil then
    L5_520 = false
    L7_522 = GetParam
    L7_522 = L7_522("ChampionToSayToByFlag", A0_515, A1_516)
    L6_521 = L7_522
  end
  if L6_521 == nil then
    L7_522 = ReportError
    L7_522("Could not resolve ChampionToSayTo param")
    return
  end
  L7_522 = GetParam
  L7_522 = L7_522("ShowToSpectator", A0_515, A1_516)
  if L7_522 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  SayWithFloatingTextOnUnitToChampion(tostring(L2_517), A1_516.TextType, L4_519, L3_518, L6_521, L5_520, L7_522)
end
BBSayWithFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_523, A1_524)
  local L2_525, L3_526, L4_527
  L2_525 = A1_524.ToSay
  L3_526 = GetTable
  L4_527 = A0_523
  L3_526 = L3_526(L4_527, A1_524.SrcVarTable, false)
  if L3_526 ~= nil then
    L4_527 = A1_524.SrcVar
    if L4_527 ~= nil then
      L4_527 = L2_525
      L2_525 = L4_527 .. tostring(L3_526[A1_524.SrcVar])
    end
  end
  L4_527 = nil
  if A1_524.OwnerVar ~= nil then
    L4_527 = A0_523[A1_524.OwnerVar]
  else
    L4_527 = A0_523.Owner
  end
  if A1_524.TextType == nil then
    A1_524.TextType = 0
  end
  Say(L4_527, L2_525, A1_524.TextType)
end
BBSay = L0_0
function L0_0(A0_528, A1_529)
  local L2_530, L3_531, L4_532
  L2_530 = A1_529.ToSay
  L3_531 = GetTable
  L4_532 = A0_528
  L3_531 = L3_531(L4_532, A1_529.SrcVarTable, false)
  if L3_531 ~= nil then
    L4_532 = A1_529.SrcVar
    if L4_532 ~= nil then
      L4_532 = L2_530
      L2_530 = L4_532 .. tostring(L3_531[A1_529.SrcVar])
    end
  end
  L4_532 = nil
  if A1_529.OwnerVar ~= nil then
    L4_532 = A0_528[A1_529.OwnerVar]
  else
    L4_532 = A0_528.Owner
  end
  if A1_529.TextType == nil then
    A1_529.TextType = 0
  end
  Say(L4_532, L2_530, A1_529.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_533, A1_534)
  GetTable(A0_533, A1_534.DestVarTable, true)[A1_534.DestVar] = BBLuaGetGold(A0_533, A1_534)
end
BBGetGold = L0_0
function L0_0(A0_535, A1_536)
  GetTable(A0_535, A1_536.DestVarTable, true)[A1_536.DestVar] = BBLuaGetTotalGold(A0_535, A1_536)
end
BBGetTotalGold = L0_0
function L0_0(A0_537, A1_538)
  A0_537.CharVars.TeleportTargetPosition = GetTable(A0_537, A1_538.CastPositionNameTable)[A1_538.CastPositionName]
  SpellBuffAdd(A0_537[A1_538.OwnerVar], A0_537[A1_538.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_537.NextBuffVars)
  BBTeleportToPositionHelper(A0_537, A1_538)
end
BBTeleportToPosition = L0_0
function L0_0(A0_539, A1_540)
  if A1_540.XVar ~= nil and GetTable(A0_539, A1_540.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_539, A1_540.XVarTable, true)[A1_540.XVar]
  else
    Xloc = A1_540.X
  end
  if A1_540.YVar ~= nil and GetTable(A0_539, A1_540.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_539, A1_540.YVarTable, true)[A1_540.YVar]
  else
    Yloc = A1_540.Y
  end
  if A1_540.ZVar ~= nil and GetTable(A0_539, A1_540.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_539, A1_540.ZVarTable, true)[A1_540.ZVar]
  else
    Zloc = A1_540.Z
  end
  A1_540.OwnerVar, A0_539.position = A1_540.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_540.CastPositionName = "position"
  BBTeleportToPosition(A0_539, A1_540)
end
BBTeleportToPoint = L0_0
function L0_0(A0_541, A1_542)
  A1_542.TimeoutInFOW = 999999
  A1_542.BindFlexToOwnerPAR = false
  A1_542.Flags = 0
  A1_542.FollowsGroundTilt = false
  A1_542.FacesTarget = false
  A1_542.HideFromSpectator = false
  A1_542.SendIfOnScreenOrDiscard = false
  A1_542.PersistsThroughReconnect = true
  A1_542.FOWVisibilityRadius = 10
  A1_542.Scale = 1
  A1_542.BindObjectVar = A1_542.BindObject1Var
  A1_542.EffectID2Var = A1_542.OtherTeamEffectIDVar
  A1_542.TargetObjectVar = A1_542.BindObject2Var
  A1_542.FOWTeamOverrideVar = A1_542.FOWTeamVar
  A1_542.BoneName = A1_542.BindObject1BoneName
  A1_542.TargetBoneName = A1_542.BindObject2BoneName
  A1_542.EffectName = A1_542.EffectParticleFile
  A1_542.EffectNameForOtherTeam = A1_542.OtherTeamParticleFile
  BBSpellEffectCreate(A0_541, A1_542)
end
BBSpellEffectCreate_EasyBeam = L0_0
function L0_0(A0_543, A1_544)
  A1_544.TimeoutInFOW = 999999
  A1_544.BindFlexToOwnerPAR = false
  A1_544.Flags = 0
  A1_544.FollowsGroundTilt = false
  A1_544.FacesTarget = false
  A1_544.HideFromSpectator = false
  A1_544.SendIfOnScreenOrDiscard = true
  A1_544.PersistsThroughReconnect = false
  A1_544.FOWVisibilityRadius = 10
  A1_544.Scale = 1
  A1_544.FOWTeamOverrideVar = A1_544.FOWTeamVar
  A1_544.EffectName = A1_544.ParticleFile
  A1_544.EffectNameForOtherTeam = A1_544.ParticleFileForOtherTeam
  A1_544.BoneName = A1_544.BindObjectBoneName
  BBSpellEffectCreate(A0_543, A1_544)
end
BBSpellEffectCreate_EasyHit = L0_0
function L0_0(A0_545, A1_546)
  local L2_547, L3_548, L4_549, L5_550, L6_551, L7_552, L8_553, L9_554, L10_555, L11_556, L12_557
  L3_548 = A1_546.TargetVar
  if L3_548 ~= nil then
    L3_548 = A1_546.TargetVar
    L2_547 = A0_545[L3_548]
  else
    L2_547 = A0_545.Target
  end
  L3_548 = {
    L4_549,
    L5_550,
    L6_551
  }
  L4_549.maxSlot = 3
  L4_549.spellbook = L5_550
  L4_549.stype = L5_550
  L5_550.maxSlot = 6
  L5_550.spellbook = L6_551
  L5_550.stype = L6_551
  L6_551.maxSlot = 1
  L7_552 = SPELLBOOK_SUMMONER
  L6_551.spellbook = L7_552
  L7_552 = SpellSlots
  L6_551.stype = L7_552
  for L7_552, L8_553 in L4_549(L5_550) do
    A1_546.SpellbookType = L9_554
    A1_546.SlotType = L9_554
    for L12_557 = 0, L8_553.maxSlot do
      if HasSpellTag(L2_547, L12_557, A1_546.SpellbookType, A1_546.SlotType, A1_546.SpellTag) ~= A1_546.InvertResult then
        A1_546.SpellSlot = L12_557
        BBSealSpellSlot(A0_545, A1_546)
      end
    end
  end
end
BBSealSpellSlotsWithTag = L0_0
function L0_0(A0_558, A1_559)
  ReincarnateNonDeadHero(GetTable(A0_558, A1_559.TargetTable, false)[A1_559.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_560, A1_561)
  GetTable(A0_560, A1_561.DestVarTable, true)[A1_561.DestVar] = A1_561.Function(A0_560[A1_561.OwnerVar], A1_561.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_562, A1_563)
  local L2_564, L3_565, L4_566, L5_567
  L2_564 = A1_563.WhomToOrderVar
  L2_564 = A0_562[L2_564]
  L3_565 = A1_563.TargetOfOrderVar
  L3_565 = A0_562[L3_565]
  L4_566 = GetTable
  L5_567 = A0_562
  L4_566 = L4_566(L5_567, A1_563.SrcVarTable, false)
  L5_567 = nil
  if A1_563.SrcVar ~= nil and L4_566 ~= nil then
    L5_567 = L4_566[A1_563.SrcVar]
  else
    L5_567 = GetPosition(L3_565)
  end
  if L3_565 == nil then
    L3_565 = L2_564
  end
  IssueOrder(L2_564, A1_563.Order, L5_567, L3_565)
end
BBIssueOrder = L0_0
function L0_0(A0_568, A1_569)
  local L2_570
  L2_570 = GetParam
  L2_570 = L2_570("NewRange", A0_568, A1_569)
  SetSpellCastRange(L2_570)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_571, A1_572)
  GetTable(A0_571, A1_572.DestVarTable, true)[A1_572.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_573, A1_574)
  local L2_575, L3_576
  L2_575 = A1_574.ObjectVar1
  L2_575 = A0_573[L2_575]
  L3_576 = A1_574.ObjectVar2
  L3_576 = A0_573[L3_576]
  GetTable(A0_573, A1_574.DestVarTable, true)[A1_574.DestVar] = DistanceBetweenObjectBounds(L2_575, L3_576)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_577, A1_578)
  local L2_579, L3_580, L4_581
  L2_579 = A1_578.ObjectVar
  L2_579 = A0_577[L2_579]
  L3_580 = GetTable
  L4_581 = A0_577
  L3_580 = L3_580(L4_581, A1_578.PointVarTable, true)
  L4_581 = A1_578.PointVar
  L4_581 = L3_580[L4_581]
  GetTable(A0_577, A1_578.DestVarTable, true)[A1_578.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_579, L4_581)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_582, A1_583)
  local L2_584, L3_585
  L2_584 = GetParam
  L3_585 = "Point1"
  L2_584 = L2_584(L3_585, A0_582, A1_583)
  L3_585 = GetParam
  L3_585 = L3_585("Point2", A0_582, A1_583)
  GetTable(A0_582, A1_583.DestVarTable, true)[A1_583.DestVar] = DistanceBetweenPoints(L2_584, L3_585)
end
BBDistanceBetweenPoints = L0_0
function L0_0(A0_586, A1_587)
  local L2_588, L3_589
  L2_588 = GetParam
  L3_589 = "Point1"
  L2_588 = L2_588(L3_589, A0_586, A1_587)
  L3_589 = GetParam
  L3_589 = L3_589("Point2", A0_586, A1_587)
  GetTable(A0_586, A1_587.DestVarTable, true)[A1_587.DestVar] = DistanceBetweenPointsXZ(L2_588, L3_589)
end
BBDistanceBetweenPointsXZ = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_590, A1_591, A2_592)
  local L3_593, L4_594, L5_595, L6_596, L7_597, L8_598
  L5_595 = 0
  L6_596 = nil
  L7_597 = A1_591.ObjectDistanceType
  L8_598 = A1_591.ObjectVar1
  L3_593 = A0_590[L8_598]
  L8_598 = A1_591.ObjectVar2
  L4_594 = A0_590[L8_598]
  if nil == L4_594 then
    L8_598 = A1_591.Point2Var
    if nil ~= L8_598 then
      L8_598 = GetTable
      L8_598 = L8_598(A0_590, A1_591.Point2VarTable, true)
      L4_594 = L8_598[A1_591.Point2Var]
      L5_595 = L5_595 + 1
    end
  end
  if nil == L3_593 then
    L8_598 = A1_591.Point1Var
    if nil ~= L8_598 then
      L8_598 = GetTable
      L8_598 = L8_598(A0_590, A1_591.Point1VarTable, true)
      L3_593 = L8_598[A1_591.Point1Var]
      L5_595 = L5_595 + 1
      if 1 == L5_595 then
        L3_593, L4_594 = L4_594, L3_593
      end
    end
  end
  if nil ~= L7_597 then
    if 0 == L5_595 then
      L8_598 = OBJECT_CENTER
      if L8_598 == L7_597 then
        L6_596 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_598 = OBJECT_BOUNDARY
        if L8_598 == L7_597 then
          L6_596 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_598 = A1_591.OwnerVar
          L8_598 = A0_590[L8_598]
          Say(L8_598, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_595 then
      L8_598 = OBJECT_CENTER
      if L8_598 == L7_597 then
        L6_596 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_598 = OBJECT_BOUNDARY
        if L8_598 == L7_597 then
          L6_596 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_598 = A1_591.OwnerVar
          L8_598 = A0_590[L8_598]
          Say(L8_598, "invalid object distance type", 0)
        end
      end
    else
      L6_596 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_598 = A1_591.Distance
  if A1_591.DistanceVar ~= nil and GetTable(A0_590, A1_591.DistanceVarTable, true) ~= nil then
    L8_598 = L8_598 + GetTable(A0_590, A1_591.DistanceVarTable, true)[A1_591.DistanceVar]
  end
  if L3_593 ~= nil and L4_594 ~= nil and L6_596 ~= nil and L8_598 ~= nil then
    if not L6_596(L3_593, L4_594, L8_598) then
      ExecuteBuildingBlocks(A2_592, A0_590)
      A0_590.LastIfSucceeded = true
    else
      A0_590.LastIfSucceeded = false
    end
  else
    A0_590.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_599, A1_600)
  local L2_601, L3_602
  L2_601 = A1_600.TargetVar
  L2_601 = A0_599[L2_601]
  L3_602 = A1_600.CasterVar
  L3_602 = A0_599[L3_602]
  GetTable(A0_599, A1_600.DestVarTable, true)[A1_600.DestVar] = SpellBuffCount(L2_601, A1_600.BuffName, L3_602)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_603, A1_604)
  local L2_605
  L2_605 = A1_604.TargetVar
  L2_605 = A0_603[L2_605]
  GetTable(A0_603, A1_604.DestVarTable, true)[A1_604.DestVar] = SpellBuffCount(L2_605, A1_604.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_606, A1_607)
  local L2_608, L3_609
  L2_608 = GetTable
  L3_609 = A0_606
  L2_608 = L2_608(L3_609, A1_607.ScaleVarTable, false)
  L3_609 = nil
  if A1_607.OwnerVar ~= nil then
    L3_609 = A0_606[A1_607.OwnerVar]
  else
    L3_609 = A0_606.Owner
  end
  if A1_607.ScaleVar ~= nil and A1_607.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_608[A1_607.ScaleVar], L3_609)
  else
    SetScaleSkinCoef(A1_607.Scale, L3_609)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_610, A1_611)
  SpellBuffAdd(A0_610[A1_611.TargetVar], A0_610[A1_611.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_610.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_612, A1_613, A2_614)
  local L3_615, L4_616
  L3_615 = A1_613.TargetVar
  L3_615 = A0_612[L3_615]
  L4_616 = A1_613.NumStacks
  if GetParam("NumStacks", A0_612, A1_613) == 0 then
    L4_616 = SpellBuffCount(L3_615, A1_613.BuffName, caster)
  else
    L4_616 = GetParam("NumStacks", A0_612, A1_613)
  end
  while L4_616 > 0 do
    SpellBuffRemove(L3_615, A1_613.BuffName, A0_612[A1_613.AttackerVar])
    L4_616 = L4_616 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_617, A1_618)
  local L2_619, L3_620
  L2_619 = GetParam
  L3_620 = "Unit"
  L2_619 = L2_619(L3_620, A0_617, A1_618)
  unit = L2_619
  L2_619 = unit
  if L2_619 == nil then
    L2_619 = ReportError
    L3_620 = "Could not resolve Unit param"
    L2_619(L3_620)
    return
  end
  L2_619 = true
  L3_620 = GetParam
  L3_620 = L3_620("ChampionToShowTo", A0_617, A1_618)
  if L3_620 == nil then
    L2_619 = false
    L3_620 = GetParam("ChampionToShowToByFlag", A0_617, A1_618)
  end
  if L3_620 == nil then
    ReportError("Could not resolve ChampionToShowTo param")
    return
  end
  SetShowHealthBarToChampion(unit, A1_618.Show, L3_620, L2_619, A1_618.ApplyToSpectator)
end
BBSetShowHealthBarToChampion = L0_0
function L0_0(A0_621, A1_622)
  if GetParam("Vector", A0_621, A1_622) ~= nil then
    GetTable(A0_621, A1_622.DestVarTable, false)[A1_622.DestVar] = math.sqrt(GetParam("Vector", A0_621, A1_622).x * GetParam("Vector", A0_621, A1_622).x + GetParam("Vector", A0_621, A1_622).y * GetParam("Vector", A0_621, A1_622).y + GetParam("Vector", A0_621, A1_622).z * GetParam("Vector", A0_621, A1_622).z)
  end
end
BBGetVectorLength = L0_0
function L0_0(A0_623, A1_624, A2_625)
  if A0_623.EmoteId == A1_624.EmoteId then
    ExecuteBuildingBlocks(A2_625, A0_623)
    A0_623.LastIfSucceeded = true
  else
    A0_623.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_626, A1_627, A2_628)
  if A0_626.EmoteId ~= A1_627.EmoteId then
    ExecuteBuildingBlocks(A2_628, A0_626)
    A0_626.LastIfSucceeded = true
  else
    A0_626.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_629, A1_630)
  local L2_631, L3_632, L4_633, L5_634
  L2_631 = GetTable
  L3_632 = A0_629
  L4_633 = A1_630.String1VarTable
  L5_634 = false
  L2_631 = L2_631(L3_632, L4_633, L5_634)
  L3_632 = A1_630.String1Var
  L3_632 = L2_631[L3_632]
  L4_633 = GetTable
  L5_634 = A0_629
  L4_633 = L4_633(L5_634, A1_630.String2VarTable, false)
  L5_634 = A1_630.String2Var
  L5_634 = L4_633[L5_634]
  GetTable(A0_629, A1_630.ResultVarTable, false)[A1_630.ResultVar] = L3_632 .. L5_634
end
BBConcatenateStrings = L0_0
function L0_0(A0_635, A1_636)
  local L2_637, L3_638
  L2_637 = GetTable
  L3_638 = A0_635
  L2_637 = L2_637(L3_638, A1_636.VariableVarTable, false)
  L3_638 = A1_636.VariableVar
  L3_638 = L2_637[L3_638]
  GetTable(A0_635, A1_636.ResultVarTable, false)[A1_636.ResultVar] = "(" .. L3_638 .. ")"
end
BBEncaseInParantheses = L0_0
function L0_0(A0_639, A1_640)
  BBGetMinionKills(A0_639, A1_640)
  A0_639.MinionKillSource = GetParam("MinionKillTarget")
  A0_639.MinionKills = A0_639.MinionsKilled + GetParam("MinionKills", A0_639, A1_640)
  BBSetMinionKills(A0_639, A1_640)
end
BBIncreaseMinionKills = L0_0
