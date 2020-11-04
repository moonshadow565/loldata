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
  local L3_313, L4_314, L5_315
  L5_315 = GetParam
  L5_315 = L5_315("BuffName", A0_310, A1_311)
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
  if SpellBuffCount(L3_313, L5_315, L4_314) > 0 then
    ExecuteBuildingBlocks(A2_312, A0_310)
    A0_310.LastIfSucceeded = true
  else
    A0_310.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_316, A1_317, A2_318)
  if BBIsMissileAutoAttack(A0_316, A1_317) then
    ExecuteBuildingBlocks(A2_318, A0_316)
    A0_316.LastIfSucceeded = true
  else
    A0_316.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_319, A1_320, A2_321)
  if BBIsMissileConsideredAsAutoAttack(A0_319, A1_320) then
    ExecuteBuildingBlocks(A2_321, A0_319)
    A0_319.LastIfSucceeded = true
  else
    A0_319.LastIfSucceeded = false
  end
end
BBIfMissileConsideredAsAutoAttack = L0_0
function L0_0(A0_322, A1_323)
  A0_322.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_324, A1_325, A2_326)
  local L3_327, L4_328
  if A1_325.OwnerVar ~= nil then
    L3_327 = A0_324[A1_325.OwnerVar]
  else
    L3_327 = A0_324.Owner
  end
  if A1_325.CasterVar ~= nil then
    L4_328 = A0_324[A1_325.CasterVar]
  else
    L4_328 = A0_324.Caster
  end
  if SpellBuffCount(L3_327, A1_325.BuffName, L4_328) <= 0 then
    ExecuteBuildingBlocks(A2_326, A0_324)
    A0_324.LastIfSucceeded = true
  else
    A0_324.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_329, A1_330, A2_331)
  local L3_332
  if A1_330.TargetVar ~= nil then
    L3_332 = A0_329[A1_330.TargetVar]
  else
    L3_332 = A0_329.Owner
  end
  if HasUnitTag(L3_332, A1_330.UnitTag) ~= A1_330.InvertResult then
    ExecuteBuildingBlocks(A2_331, A0_329)
    A0_329.LastIfSucceeded = true
  else
    A0_329.LastIfSucceeded = false
  end
end
BBIfHasUnitTag = L0_0
function L0_0(A0_333, A1_334, A2_335)
  local L3_336, L4_337
  L4_337 = A1_334.OwnerVar
  if L4_337 ~= nil then
    L4_337 = A1_334.OwnerVar
    L3_336 = A0_333[L4_337]
  else
    L3_336 = A0_333.Owner
  end
  L4_337 = GetParam
  L4_337 = L4_337("SpellSlot", A0_333, A1_334)
  if HasSpellTag(L3_336, L4_337, A1_334.SpellbookType, A1_334.SlotType, A1_334.SpellTag) ~= A1_334.InvertResult then
    ExecuteBuildingBlocks(A2_335, A0_333)
    A0_333.LastIfSucceeded = true
  else
    A0_333.LastIfSucceeded = false
  end
end
BBIfHasSpellTag = L0_0
function L0_0(A0_338, A1_339, A2_340)
  local L3_341, L4_342
  if A1_339.OwnerVar ~= nil then
    L3_341 = A0_338[A1_339.OwnerVar]
  else
    L3_341 = A0_338.Owner
  end
  if HasPARType(L3_341, A1_339.PARType) then
    ExecuteBuildingBlocks(A2_340, A0_338)
    A0_338.LastIfSucceeded = true
  else
    A0_338.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_343, A1_344, A2_345)
  local L3_346, L4_347
  if A1_344.OwnerVar ~= nil then
    L3_346 = A0_343[A1_344.OwnerVar]
  else
    L3_346 = A0_343.Owner
  end
  if not HasPARType(L3_346, A1_344.PARType) then
    ExecuteBuildingBlocks(A2_345, A0_343)
    A0_343.LastIfSucceeded = true
  else
    A0_343.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_348, A1_349, A2_350)
  local L3_351, L4_352, L5_353, L6_354, L7_355
  L3_351 = GetTable
  L4_352 = A0_348
  L5_353 = A1_349.Src1VarTable
  L6_354 = false
  L3_351 = L3_351(L4_352, L5_353, L6_354)
  L4_352 = GetTable
  L5_353 = A0_348
  L6_354 = A1_349.Src2VarTable
  L7_355 = false
  L4_352 = L4_352(L5_353, L6_354, L7_355)
  L5_353 = true
  while L5_353 do
    L6_354 = false
    L7_355 = nil
    if L3_351 ~= nil and A1_349.Src1Var ~= nil then
      L7_355 = L3_351[A1_349.Src1Var]
    else
      L7_355 = A1_349.Value1
    end
    if L4_352 ~= nil and A1_349.Src2Var ~= nil then
      L6_354 = A1_349.CompareOp(L7_355, L4_352[A1_349.Src2Var])
    else
      L6_354 = A1_349.CompareOp(L7_355, A1_349.Value2)
    end
    if L6_354 then
      ExecuteBuildingBlocks(A2_350, A0_348)
    else
      L5_353 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_356, A1_357, A2_358)
  local L3_359, L4_360, L5_361
  L3_359 = GetParam
  L4_360 = "Start"
  L5_361 = A0_356
  L3_359 = L3_359(L4_360, L5_361, A1_357)
  L4_360 = GetParam
  L5_361 = "End"
  L4_360 = L4_360(L5_361, A0_356, A1_357)
  L5_361 = L3_359
  while L4_360 >= L5_361 do
    SetVarInTable(A0_356, A1_357, L5_361)
    ExecuteBuildingBlocks(A2_358, A0_356)
    L5_361 = L5_361 + 1
  end
end
BBFor = L0_0
function L0_0(A0_362, A1_363)
  return A0_362 * A1_363
end
MO_MULTIPLY = L0_0
function L0_0(A0_364, A1_365)
  return A0_364 + A1_365
end
MO_ADD = L0_0
function L0_0(A0_366, A1_367)
  return A0_366 - A1_367
end
MO_SUBTRACT = L0_0
function L0_0(A0_368, A1_369)
  return A0_368 / A1_369
end
MO_DIVIDE = L0_0
function L0_0(A0_370, A1_371)
  return math.floor(A0_370 / A1_371)
end
MO_INT_DIVIDE = L0_0
function L0_0(A0_372, A1_373)
  if A0_372 < A1_373 then
    return A0_372
  else
    return A1_373
  end
end
MO_MIN = L0_0
function L0_0(A0_374, A1_375)
  if A1_375 < A0_374 then
    return A0_374
  else
    return A1_375
  end
end
MO_MAX = L0_0
function L0_0(A0_376, A1_377)
  return A0_376 % A1_377
end
MO_MODULO = L0_0
function L0_0(A0_378)
  return math.floor(A0_378 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_379)
  return math.ceil(A0_379)
end
MO_ROUNDUP = L0_0
function L0_0(A0_380)
  return math.floor(A0_380)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_381)
  return math.sin(math.rad(A0_381))
end
MO_SIN = L0_0
function L0_0(A0_382)
  return math.cos(math.rad(A0_382))
end
MO_COSINE = L0_0
function L0_0(A0_383)
  return math.tan(math.rad(A0_383))
end
MO_TANGENT = L0_0
function L0_0(A0_384)
  return math.deg(math.asin(A0_384))
end
MO_ASIN = L0_0
function L0_0(A0_385)
  return math.deg(math.acos(A0_385))
end
MO_ACOS = L0_0
function L0_0(A0_386)
  return math.deg(math.atan(A0_386))
end
MO_ATAN = L0_0
function L0_0(A0_387, A1_388)
  return math.pow(A0_387, A1_388)
end
MO_POW = L0_0
function L0_0(A0_389)
  return math.sqrt(A0_389)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_390, A1_391)
  local L2_392
  L2_392 = A0_390 and A1_391
  return L2_392
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_393, A1_394)
  local L2_395
  L2_395 = A0_393 or A1_394
  return L2_395
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_396)
  local L1_397
  L1_397 = not A0_396
  return L1_397
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_398)
  return math.abs(A0_398)
end
MO_ABS = L0_0
function L0_0(A0_399, A1_400)
  return math.random(A0_399, A1_400)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_401, A1_402)
  local L2_403, L3_404, L4_405, L5_406
  L2_403 = GetMathNumber
  L3_404 = A0_401
  L4_405 = A1_402.Src1VarTable
  L5_406 = A1_402.Src1Var
  L2_403 = L2_403(L3_404, L4_405, L5_406, A1_402.Src1Value)
  L3_404 = GetMathNumber
  L4_405 = A0_401
  L5_406 = A1_402.Src2VarTable
  L3_404 = L3_404(L4_405, L5_406, A1_402.Src2Var, A1_402.Src2Value)
  L4_405 = GetTable
  L5_406 = A0_401
  L4_405 = L4_405(L5_406, A1_402.DestVarTable)
  L5_406 = A1_402.MathOp
  L5_406 = L5_406(L2_403, L3_404)
  SetVarInTable(A0_401, A1_402, L5_406)
end
BBMath = L0_0
function L0_0(A0_407, A1_408, A2_409, A3_410)
  if A2_409 ~= nil and GetTable(A0_407, A1_408)[A2_409] ~= nil then
    return GetTable(A0_407, A1_408)[A2_409]
  end
  return A3_410
end
GetMathNumber = L0_0
function L0_0(A0_411, A1_412)
  if type(A1_412) == "number" then
    return A1_412
  elseif type(A1_412) == "function" then
    return A1_412(A0_411)
  elseif type(A1_412) == "string" then
    return A0_411[A1_412]
  end
end
GetNumber = L0_0
function L0_0(A0_413, A1_414)
  return VectorAdd(A0_413, A1_414)
end
VEC_ADD = L0_0
function L0_0(A0_415, A1_416)
  return VectorSubtract(A0_415, A1_416)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_417, A1_418)
  return VectorScalarMultiply(A0_417, A1_418)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_419, A1_420)
  return VectorScalarDivide(A0_419, A1_420)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_421, A1_422)
  return VectorRotateY(A0_421, A1_422)
end
VEC_ROTATE = L0_0
function L0_0(A0_423, A1_424)
  BBMath(A0_423, A1_424)
end
BBVectorMath = L0_0
function L0_0(A0_425, A1_426)
  rangeSize = GetMathNumber(A0_425, A1_426.RangeEndVarTable, A1_426.RangeEndVar, A1_426.RangeEnd) - GetMathNumber(A0_425, A1_426.RangeBeginVarTable, A1_426.RangeBeginVar, A1_426.RangeBegin)
  if rangeSize == 0 then
    ratio = 0
  else
    ratio = (GetMathNumber(A0_425, A1_426.ValueVarTable, A1_426.ValueVar, A1_426.Value) - GetMathNumber(A0_425, A1_426.RangeBeginVarTable, A1_426.RangeBeginVar, A1_426.RangeBegin)) / rangeSize
  end
  if A1_426.Clamp == true then
    if 0 > ratio then
      ratio = 0
    elseif ratio > 1 then
      ratio = 1
    end
  end
  GetTable(A0_425, A1_426.RatioVarTable)[A1_426.RatioVar] = ratio
end
BBInterpolateFromValue = L0_0
function L0_0(A0_427, A1_428)
  local L2_429, L3_430
  L2_429 = GetMathNumber
  L3_430 = A0_427
  L2_429 = L2_429(L3_430, A1_428.RangeBeginVarTable, A1_428.RangeBeginVar, A1_428.RangeBegin)
  L3_430 = GetMathNumber
  L3_430 = L3_430(A0_427, A1_428.RangeEndVarTable, A1_428.RangeEndVar, A1_428.RangeEnd)
  rangeSize = L3_430 - L2_429
  scaler = rangeSize * GetMathNumber(A0_427, A1_428.RatioVarTable, A1_428.RatioVar, A1_428.Ratio)
  if A1_428.Clamp == true then
    if GetMathNumber(A0_427, A1_428.RatioVarTable, A1_428.RatioVar, A1_428.Ratio) < 0 then
    else
    end
  end
  GetTable(A0_427, A1_428.ValueVarTable)[A1_428.ValueVar] = L3_430
end
BBInterpolateFromRatio = L0_0
function L0_0(A0_431, A1_432)
  local L2_433, L3_434, L4_435, L5_436
  L2_433 = A0_431.InstanceVars
  L3_434 = L2_433.InterpDelta
  if L3_434 == nil then
    L3_434 = A1_432.Amount
    L4_435 = A1_432.AmountVar
    if L4_435 ~= nil then
      L4_435 = GetTable
      L5_436 = A0_431
      L4_435 = L4_435(L5_436, A1_432.AmountVarTable)
      L5_436 = A1_432.AmountVar
      L3_434 = L4_435[L5_436]
    end
    L4_435 = GetPosition
    L5_436 = A1_432.TargetVar
    L5_436 = A0_431[L5_436]
    L4_435 = L4_435(L5_436)
    L2_433.KnockBackStart = L4_435
    L4_435 = GetNormalizedPositionDelta
    L5_436 = A1_432.TargetVar
    L5_436 = A0_431[L5_436]
    L4_435 = L4_435(L5_436, A0_431[A1_432.AttackerVar], true)
    L5_436 = {}
    L5_436.x = L4_435.x * L3_434
    L5_436.y = 0
    L5_436.z = L4_435.z * L3_434
    L2_433.InterpDelta = L5_436
    L5_436 = GetTime
    L5_436 = L5_436()
    L2_433.StartTime = L5_436
    L5_436 = A1_432.KnockBackDuration
    L2_433.KnockBackDuration = L5_436
  end
  L3_434 = A1_432.TargetVar
  L3_434 = A0_431[L3_434]
  L4_435 = GetTime
  L4_435 = L4_435()
  L5_436 = L2_433.StartTime
  L4_435 = L4_435 - L5_436
  L5_436 = L2_433.KnockBackDuration
  L4_435 = L4_435 / L5_436
  L5_436 = {}
  L5_436.x = L2_433.KnockBackStart.x + L2_433.InterpDelta.x * L4_435
  L5_436.y = L2_433.KnockBackStart.y
  L5_436.z = L2_433.KnockBackStart.z + L2_433.InterpDelta.z * L4_435
  SetPosition(L3_434, L5_436)
end
BBKnockback = L0_0
function L0_0(A0_437, A1_438)
  local L2_439, L3_440
  L2_439 = GetParam
  L3_440 = "Left"
  L2_439 = L2_439(L3_440, A0_437, A1_438)
  L3_440 = GetParam
  L3_440 = L3_440("Right", A0_437, A1_438)
  GetTable(A0_437, A1_438.DestVarTable, true)[A1_438.DestVar] = tostring(L2_439) .. tostring(L3_440)
end
BBAppendString = L0_0
function L0_0(A0_441, A1_442)
  local L2_443
  L2_443 = 0
  if A1_442.Delta ~= nil then
    L2_443 = L2_443 + A1_442.Delta
  end
  if A1_442.DeltaByLevel ~= nil and A0_441.Level ~= nil then
    L2_443 = L2_443 + A1_442.DeltaByLevel[A0_441.Level]
  end
  if A1_442.DeltaVar ~= nil then
    L2_443 = L2_443 + GetTable(A0_441, A1_442.DeltaVarTable, true)[A1_442.DeltaVar]
  end
  if A1_442.TargetVar ~= nil then
    A1_442.Stat(L2_443, A0_441[A1_442.TargetVar])
  else
    A1_442.Stat(L2_443)
  end
end
BBIncStat = L0_0
function L0_0(A0_444, A1_445)
  local L2_446
  L2_446 = 0
  if A1_445.Delta ~= nil then
    L2_446 = L2_446 + A1_445.Delta
  end
  if A1_445.DeltaByLevel ~= nil and A0_444.Level ~= nil then
    L2_446 = L2_446 + A1_445.DeltaByLevel[A0_444.Level]
  end
  if A1_445.DeltaVar ~= nil then
    L2_446 = L2_446 + GetTable(A0_444, A1_445.DeltaVarTable, true)[A1_445.DeltaVar]
  end
  if A1_445.TargetVar ~= nil then
    A1_445.Stat(L2_446, A0_444[A1_445.TargetVar])
  else
    A1_445.Stat(L2_446)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_447, A1_448)
  local L2_449, L3_450
  L2_449 = A1_448.TargetVar
  L3_450 = 0
  if A1_448.LaneVar ~= nil then
    L3_450 = L3_450 + GetTable(A0_447, A1_448.LaneVarTable, true)[A1_448.LaneVar]
  end
  if A1_448.Lane ~= nil then
    L3_450 = L3_450 + A1_448.Lane
  end
  SetMinionLane(A0_447[L2_449], L3_450)
end
BBSetMinionLane = L0_0
function L0_0(A0_451, A1_452)
  if A1_452.AttackVar ~= nil then
  end
  if A1_452.Attack ~= nil then
  end
  if A1_452.TotalCoefficientVar ~= nil then
  end
  if A1_452.TotalCoefficient ~= nil then
  end
  if A1_452.TargetVar ~= nil then
    GetTable(A0_451, A1_452.DestVarTable, false)[A1_452.DestVar] = (0 + GetTable(A0_451, A1_452.AttackVarTable, true)[A1_452.AttackVar] + A1_452.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_451[A1_452.TargetVar])) + GetFlatCritDamageMod(A0_451[A1_452.TargetVar])) * (0 + GetTable(A0_451, A1_452.TotalCoefficientVarTable, true)[A1_452.TotalCoefficientVar] + A1_452.TotalCoefficient)
  else
    GetTable(A0_451, A1_452.DestVarTable, false)[A1_452.DestVar] = 2 * A1_452.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_453, A1_454)
  local L2_455, L3_456, L4_457, L5_458, L6_459, L7_460
  L2_455 = GetTable
  L3_456 = A0_453
  L4_457 = A1_454.DestVarTable
  L5_458 = false
  L2_455 = L2_455(L3_456, L4_457, L5_458)
  L3_456 = GetTable
  L4_457 = A0_453
  L5_458 = A1_454.AmountVarTable
  L6_459 = true
  L3_456 = L3_456(L4_457, L5_458, L6_459)
  L4_457 = GetTable
  L5_458 = A0_453
  L6_459 = A0_453.NextBuffVars
  L7_460 = false
  L4_457 = L4_457(L5_458, L6_459, L7_460)
  L5_458 = A1_454.AmountVar
  L5_458 = L3_456[L5_458]
  L6_459 = A1_454.Amount
  L5_458 = L5_458 + L6_459
  L4_457.InitializeShield_Amount = L5_458
  L5_458 = A1_454.AmountVar
  if L5_458 ~= nil then
    L5_458 = A1_454.HealShieldMod
    if L5_458 ~= nil and L5_458 == true then
      L6_459 = A1_454.AttackerVar
      L7_460 = 0
      if L6_459 ~= nil then
        L7_460 = GetPercentHealingAmountMod(A0_453[L6_459])
      end
      L4_457.InitializeShield_Amount, L3_456[A1_454.AmountVar] = (A1_454.Amount + L3_456[A1_454.AmountVar]) * (1 + L7_460), (A1_454.Amount + L3_456[A1_454.AmountVar]) * (1 + L7_460)
    end
  end
  L5_458 = SpellBuffAddNoRenew
  L6_459 = A1_454.AttackerVar
  L6_459 = A0_453[L6_459]
  L7_460 = A1_454.UnitVar
  L7_460 = A0_453[L7_460]
  L5_458(L6_459, L7_460, "InitializeShieldMarker", 0, 1, 25000, L4_457)
  L5_458 = BBIncreaseShield
  L6_459 = A0_453
  L7_460 = A1_454
  L5_458(L6_459, L7_460)
end
BBInitializeShield = L0_0
function L0_0(A0_461, A1_462)
  if A1_462.CDVar ~= nil then
  end
  if A1_462.CD ~= nil then
  end
  if A1_462.TargetVar ~= nil then
    GetTable(A0_461, A1_462.DestVarTable, false)[A1_462.DestVar] = (0 + GetTable(A0_461, A1_462.CDVarTable, true)[A1_462.CDVar] + A1_462.CD) * (1 + GetPercentCooldownMod(A0_461[A1_462.TargetVar]))
  else
    GetTable(A0_461, A1_462.DestVarTable, false)[A1_462.DestVar] = A1_462.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_463, A1_464)
  local L2_465, L3_466
  L3_466 = A1_464.TargetVar
  if L3_466 ~= nil then
    L2_465 = A1_464.Stat(A0_463[L3_466])
  else
    L2_465 = A1_464.Stat()
  end
  SetVarInTable(A0_463, A1_464, L2_465)
end
BBGetStat = L0_0
function L0_0(A0_467, A1_468)
  if A1_468.TargetVar ~= nil then
    GetTable(A0_467, A1_468.DestVarTable, false)[A1_468.DestVar] = GetLevel(A0_467[A1_468.TargetVar])
  else
    GetTable(A0_467, A1_468.DestVarTable, false)[A1_468.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_469, A1_470)
  if A1_470.TargetVar ~= nil then
    GetTable(A0_469, A1_470.DestVarTable, false)[A1_470.DestVar] = GetUnitSignificance(A0_469[A1_470.TargetVar])
  else
    GetTable(A0_469, A1_470.DestVarTable, false)[A1_470.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_471, A1_472)
  if A1_472.TargetVar ~= nil then
    GetTable(A0_471, A1_472.DestVarTable, false)[A1_472.DestVar] = GetArmor(A0_471[A1_472.TargetVar])
  else
    GetTable(A0_471, A1_472.DestVarTable, false)[A1_472.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_473, A1_474)
  if A1_474.TargetVar ~= nil then
    GetTable(A0_473, A1_474.DestVarTable, false)[A1_474.DestVar] = GetSpellBlock(A0_473[A1_474.TargetVar])
  else
    GetTable(A0_473, A1_474.DestVarTable, false)[A1_474.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_475, A1_476)
  local L2_477, L3_478
  L3_478 = A1_476.TargetVar
  if L3_478 ~= nil then
    L2_477 = GetTeamID(A0_475[L3_478])
  else
    L2_477 = GetTeamID()
  end
  SetVarInTable(A0_475, A1_476, L2_477)
end
BBGetTeamID = L0_0
function L0_0(A0_479, A1_480)
  local L2_481, L3_482, L4_483
  L2_481 = GetTable
  L3_482 = A0_479
  L4_483 = A1_480.DestVarTable
  L2_481 = L2_481(L3_482, L4_483, false)
  L3_482 = A1_480.TargetVar
  L4_483 = nil
  if L3_482 ~= nil then
    L4_483 = GetTeamID(A0_479[L3_482])
  else
    L4_483 = GetTeamID()
  end
  if L4_483 == TEAM_ORDER then
    L2_481[A1_480.DestVar] = TEAM_CHAOS
  elseif L4_483 == TEAM_CHAOS then
    L2_481[A1_480.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_484, A1_485)
  if A1_485.TargetVar ~= nil then
    GetTable(A0_484, A1_485.DestVarTable, false)[A1_485.DestVar] = GetUnitSkinName(A0_484[A1_485.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_486, A1_487)
  local L2_488, L3_489, L4_490
  L2_488 = GetTable
  L3_489 = A0_486
  L4_490 = A1_487.DestVarTable
  L2_488 = L2_488(L3_489, L4_490, false)
  L3_489 = A0_486.Owner
  L4_490 = nil
  if A1_487.TargetVar ~= nil then
    L4_490 = GetTotalAttackDamage(A0_486[A1_487.TargetVar])
  else
    L4_490 = GetTotalAttackDamage()
  end
  SetVarInTable(A0_486, A1_487, L4_490)
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_491, A1_492)
  GetTable(A0_491, A1_492.DestVarTable, true)[A1_492.DestVar] = A1_492.Status(A0_491[A1_492.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_493, A1_494)
  local L2_495
  L2_495 = A1_494.TargetVar
  L2_495 = A0_493[L2_495]
  ClearAttackTarget(L2_495)
end
BBClearAttackTarget = L0_0
function L0_0(A0_496, A1_497)
  local L2_498, L3_499
  L2_498 = GetTable
  L3_499 = A0_496
  L2_498 = L2_498(L3_499, A1_497.DestVarTable, true)
  L3_499 = A1_497.Info
  L3_499 = L3_499(A0_496[A1_497.TargetVar])
  SetVarInTable(A0_496, A1_497, L3_499)
end
BBGetCastInfo = L0_0
function L0_0(A0_500, A1_501, A2_502)
  local L3_503, L4_504, L5_505, L6_506
  L3_503 = GetTable
  L4_504 = A0_500
  L5_505 = A1_501.TrackTimeVarTable
  L6_506 = false
  L3_503 = L3_503(L4_504, L5_505, L6_506)
  L4_504 = GetTime
  L4_504 = L4_504()
  L5_505 = A1_501.ExecuteImmediately
  L6_506 = GetParam
  L6_506 = L6_506("TimeBetweenExecutions", A0_500, A1_501)
  if A1_501.TickTimeVar ~= nil and GetTable(A0_500, A1_501.TickTimeVarTable, false)[A1_501.TickTimeVar] ~= nil then
    L6_506 = GetTable(A0_500, A1_501.TickTimeVarTable, false)[A1_501.TickTimeVar]
  end
  if L3_503[A1_501.TrackTimeVar] == nil then
    L3_503[A1_501.TrackTimeVar] = L4_504
    if L5_505 == true then
      ExecuteBuildingBlocks(A2_502, A0_500)
    end
  end
  if L4_504 >= L3_503[A1_501.TrackTimeVar] + L6_506 then
    L3_503[A1_501.TrackTimeVar] = L3_503[A1_501.TrackTimeVar] + L6_506
    ExecuteBuildingBlocks(A2_502, A0_500)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_507, A1_508, A2_509)
  GetTable(A0_507, A1_508.TrackTimeVarTable, false)[A1_508.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_510, A1_511)
  local L2_512
  L2_512 = A1_511.SrcValue
  if A1_511.SrcVar ~= nil then
    L2_512 = GetTable(A0_510, A1_511.SrcVarTable, true)[A1_511.SrcVar]
  end
  A1_511.Status(A0_510[A1_511.TargetVar], L2_512)
end
BBSetStatus = L0_0
function L0_0(A0_513, A1_514)
  local L2_515
  L2_515 = A1_514.ToAlert
  if GetTable(A0_513, A1_514.SrcVarTable, false) ~= nil and A1_514.SrcVar ~= nil then
    L2_515 = L2_515 .. GetTable(A0_513, A1_514.SrcVarTable, false)[A1_514.SrcVar]
  end
  _ALERT(L2_515)
end
BBAlert = L0_0
function L0_0(A0_516, A1_517)
  local L2_518, L3_519, L4_520, L5_521, L6_522, L7_523
  L2_518 = GetParam
  L3_519 = "Value"
  L4_520 = A0_516
  L5_521 = A1_517
  L2_518 = L2_518(L3_519, L4_520, L5_521)
  if L2_518 == nil then
    L3_519 = ReportError
    L4_520 = "Could not resolve Value param"
    L3_519(L4_520)
    return
  end
  L3_519 = true
  L4_520 = GetParam
  L5_521 = "OnUnit"
  L6_522 = A0_516
  L7_523 = A1_517
  L4_520 = L4_520(L5_521, L6_522, L7_523)
  if L4_520 == nil then
    L3_519 = false
    L5_521 = GetParam
    L6_522 = "OnUnitByFlag"
    L7_523 = A0_516
    L5_521 = L5_521(L6_522, L7_523, A1_517)
    L4_520 = L5_521
  end
  if L4_520 == nil then
    L5_521 = ReportError
    L6_522 = "Could not resolve OnUnit param"
    L5_521(L6_522)
    return
  end
  L5_521 = true
  L6_522 = GetParam
  L7_523 = "ChampionToSayTo"
  L6_522 = L6_522(L7_523, A0_516, A1_517)
  if L6_522 == nil then
    L5_521 = false
    L7_523 = GetParam
    L7_523 = L7_523("ChampionToSayToByFlag", A0_516, A1_517)
    L6_522 = L7_523
  end
  if L6_522 == nil then
    L7_523 = ReportError
    L7_523("Could not resolve ChampionToSayTo param")
    return
  end
  L7_523 = GetParam
  L7_523 = L7_523("ShowToSpectator", A0_516, A1_517)
  if L7_523 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  DisplayNumericFloatingTextOnUnitToChampion(L2_518, A1_517.TextType, L4_520, L3_519, L6_522, L5_521, L7_523)
end
BBDisplayNumericFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_524, A1_525)
  local L2_526, L3_527, L4_528, L5_529, L6_530, L7_531
  L2_526 = GetParam
  L3_527 = "Message"
  L4_528 = A0_524
  L5_529 = A1_525
  L2_526 = L2_526(L3_527, L4_528, L5_529)
  if L2_526 == nil then
    L3_527 = ReportError
    L4_528 = "Could not resolve Message param"
    L3_527(L4_528)
    return
  end
  L3_527 = true
  L4_528 = GetParam
  L5_529 = "OnUnit"
  L6_530 = A0_524
  L7_531 = A1_525
  L4_528 = L4_528(L5_529, L6_530, L7_531)
  if L4_528 == nil then
    L3_527 = false
    L5_529 = GetParam
    L6_530 = "OnUnitByFlag"
    L7_531 = A0_524
    L5_529 = L5_529(L6_530, L7_531, A1_525)
    L4_528 = L5_529
  end
  if L4_528 == nil then
    L5_529 = ReportError
    L6_530 = "Could not resolve OnUnit param"
    L5_529(L6_530)
    return
  end
  L5_529 = true
  L6_530 = GetParam
  L7_531 = "ChampionToSayTo"
  L6_530 = L6_530(L7_531, A0_524, A1_525)
  if L6_530 == nil then
    L5_529 = false
    L7_531 = GetParam
    L7_531 = L7_531("ChampionToSayToByFlag", A0_524, A1_525)
    L6_530 = L7_531
  end
  if L6_530 == nil then
    L7_531 = ReportError
    L7_531("Could not resolve ChampionToSayTo param")
    return
  end
  L7_531 = GetParam
  L7_531 = L7_531("ShowToSpectator", A0_524, A1_525)
  if L7_531 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  SayWithFloatingTextOnUnitToChampion(tostring(L2_526), A1_525.TextType, L4_528, L3_527, L6_530, L5_529, L7_531)
end
BBSayWithFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_532, A1_533)
  local L2_534, L3_535, L4_536
  L2_534 = A1_533.ToSay
  L3_535 = GetTable
  L4_536 = A0_532
  L3_535 = L3_535(L4_536, A1_533.SrcVarTable, false)
  if L3_535 ~= nil then
    L4_536 = A1_533.SrcVar
    if L4_536 ~= nil then
      L4_536 = L2_534
      L2_534 = L4_536 .. tostring(L3_535[A1_533.SrcVar])
    end
  end
  L4_536 = nil
  if A1_533.OwnerVar ~= nil then
    L4_536 = A0_532[A1_533.OwnerVar]
  else
    L4_536 = A0_532.Owner
  end
  if A1_533.TextType == nil then
    A1_533.TextType = 0
  end
  Say(L4_536, L2_534, A1_533.TextType)
end
BBSay = L0_0
function L0_0(A0_537, A1_538)
  local L2_539, L3_540, L4_541
  L2_539 = A1_538.ToSay
  L3_540 = GetTable
  L4_541 = A0_537
  L3_540 = L3_540(L4_541, A1_538.SrcVarTable, false)
  if L3_540 ~= nil then
    L4_541 = A1_538.SrcVar
    if L4_541 ~= nil then
      L4_541 = L2_539
      L2_539 = L4_541 .. tostring(L3_540[A1_538.SrcVar])
    end
  end
  L4_541 = nil
  if A1_538.OwnerVar ~= nil then
    L4_541 = A0_537[A1_538.OwnerVar]
  else
    L4_541 = A0_537.Owner
  end
  if A1_538.TextType == nil then
    A1_538.TextType = 0
  end
  Say(L4_541, L2_539, A1_538.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_542, A1_543)
  GetTable(A0_542, A1_543.DestVarTable, true)[A1_543.DestVar] = BBLuaGetGold(A0_542, A1_543)
end
BBGetGold = L0_0
function L0_0(A0_544, A1_545)
  GetTable(A0_544, A1_545.DestVarTable, true)[A1_545.DestVar] = BBLuaGetTotalGold(A0_544, A1_545)
end
BBGetTotalGold = L0_0
function L0_0(A0_546, A1_547)
  A0_546.CharVars.TeleportTargetPosition = GetTable(A0_546, A1_547.CastPositionNameTable)[A1_547.CastPositionName]
  SpellBuffAdd(A0_546[A1_547.OwnerVar], A0_546[A1_547.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_546.NextBuffVars)
  BBTeleportToPositionHelper(A0_546, A1_547)
end
BBTeleportToPosition = L0_0
function L0_0(A0_548, A1_549)
  if A1_549.XVar ~= nil and GetTable(A0_548, A1_549.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_548, A1_549.XVarTable, true)[A1_549.XVar]
  else
    Xloc = A1_549.X
  end
  if A1_549.YVar ~= nil and GetTable(A0_548, A1_549.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_548, A1_549.YVarTable, true)[A1_549.YVar]
  else
    Yloc = A1_549.Y
  end
  if A1_549.ZVar ~= nil and GetTable(A0_548, A1_549.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_548, A1_549.ZVarTable, true)[A1_549.ZVar]
  else
    Zloc = A1_549.Z
  end
  A1_549.OwnerVar, A0_548.position = A1_549.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_549.CastPositionName = "position"
  BBTeleportToPosition(A0_548, A1_549)
end
BBTeleportToPoint = L0_0
function L0_0(A0_550, A1_551)
  A1_551.TimeoutInFOW = 999999
  A1_551.BindFlexToOwnerPAR = false
  A1_551.Flags = 0
  A1_551.FollowsGroundTilt = false
  A1_551.FacesTarget = false
  A1_551.HideFromSpectator = false
  A1_551.SendIfOnScreenOrDiscard = false
  A1_551.PersistsThroughReconnect = true
  A1_551.FOWVisibilityRadius = 10
  A1_551.Scale = 1
  A1_551.BindObjectVar = A1_551.BindObject1Var
  A1_551.EffectID2Var = A1_551.OtherTeamEffectIDVar
  A1_551.TargetObjectVar = A1_551.BindObject2Var
  A1_551.FOWTeamOverrideVar = A1_551.FOWTeamVar
  A1_551.BoneName = A1_551.BindObject1BoneName
  A1_551.TargetBoneName = A1_551.BindObject2BoneName
  A1_551.EffectName = A1_551.EffectParticleFile
  A1_551.EffectNameForOtherTeam = A1_551.OtherTeamParticleFile
  BBSpellEffectCreate(A0_550, A1_551)
end
BBSpellEffectCreate_EasyBeam = L0_0
function L0_0(A0_552, A1_553)
  A1_553.TimeoutInFOW = 999999
  A1_553.BindFlexToOwnerPAR = false
  A1_553.Flags = 0
  A1_553.FollowsGroundTilt = false
  A1_553.FacesTarget = false
  A1_553.HideFromSpectator = false
  A1_553.SendIfOnScreenOrDiscard = true
  A1_553.PersistsThroughReconnect = false
  A1_553.FOWVisibilityRadius = 10
  A1_553.Scale = 1
  A1_553.FOWTeamOverrideVar = A1_553.FOWTeamVar
  A1_553.EffectName = A1_553.ParticleFile
  A1_553.EffectNameForOtherTeam = A1_553.ParticleFileForOtherTeam
  A1_553.BoneName = A1_553.BindObjectBoneName
  BBSpellEffectCreate(A0_552, A1_553)
end
BBSpellEffectCreate_EasyHit = L0_0
function L0_0(A0_554, A1_555)
  local L2_556, L3_557, L4_558, L5_559, L6_560, L7_561, L8_562, L9_563, L10_564, L11_565, L12_566
  L3_557 = A1_555.TargetVar
  if L3_557 ~= nil then
    L3_557 = A1_555.TargetVar
    L2_556 = A0_554[L3_557]
  else
    L2_556 = A0_554.Target
  end
  L3_557 = {
    L4_558,
    L5_559,
    L6_560
  }
  L4_558.maxSlot = 3
  L4_558.spellbook = L5_559
  L4_558.stype = L5_559
  L5_559.maxSlot = 6
  L5_559.spellbook = L6_560
  L5_559.stype = L6_560
  L6_560.maxSlot = 1
  L7_561 = SPELLBOOK_SUMMONER
  L6_560.spellbook = L7_561
  L7_561 = SpellSlots
  L6_560.stype = L7_561
  for L7_561, L8_562 in L4_558(L5_559) do
    A1_555.SpellbookType = L9_563
    A1_555.SlotType = L9_563
    for L12_566 = 0, L8_562.maxSlot do
      if HasSpellTag(L2_556, L12_566, A1_555.SpellbookType, A1_555.SlotType, A1_555.SpellTag) ~= A1_555.InvertResult then
        A1_555.SpellSlot = L12_566
        BBSealSpellSlot(A0_554, A1_555)
      end
    end
  end
end
BBSealSpellSlotsWithTag = L0_0
function L0_0(A0_567, A1_568)
  ReincarnateNonDeadHero(GetTable(A0_567, A1_568.TargetTable, false)[A1_568.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_569, A1_570)
  GetTable(A0_569, A1_570.DestVarTable, true)[A1_570.DestVar] = A1_570.Function(A0_569[A1_570.OwnerVar], A1_570.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_571, A1_572)
  local L2_573, L3_574, L4_575, L5_576
  L2_573 = A1_572.WhomToOrderVar
  L2_573 = A0_571[L2_573]
  L3_574 = A1_572.TargetOfOrderVar
  L3_574 = A0_571[L3_574]
  L4_575 = GetTable
  L5_576 = A0_571
  L4_575 = L4_575(L5_576, A1_572.SrcVarTable, false)
  L5_576 = nil
  if A1_572.SrcVar ~= nil and L4_575 ~= nil then
    L5_576 = L4_575[A1_572.SrcVar]
  else
    L5_576 = GetPosition(L3_574)
  end
  if L3_574 == nil then
    L3_574 = L2_573
  end
  IssueOrder(L2_573, A1_572.Order, L5_576, L3_574)
end
BBIssueOrder = L0_0
function L0_0(A0_577, A1_578)
  local L2_579
  L2_579 = GetParam
  L2_579 = L2_579("NewRange", A0_577, A1_578)
  SetSpellCastRange(L2_579)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_580, A1_581)
  GetTable(A0_580, A1_581.DestVarTable, true)[A1_581.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_582, A1_583)
  local L2_584, L3_585
  L2_584 = A1_583.ObjectVar1
  L2_584 = A0_582[L2_584]
  L3_585 = A1_583.ObjectVar2
  L3_585 = A0_582[L3_585]
  GetTable(A0_582, A1_583.DestVarTable, true)[A1_583.DestVar] = DistanceBetweenObjectBounds(L2_584, L3_585)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_586, A1_587)
  local L2_588, L3_589, L4_590
  L2_588 = A1_587.ObjectVar
  L2_588 = A0_586[L2_588]
  L3_589 = GetTable
  L4_590 = A0_586
  L3_589 = L3_589(L4_590, A1_587.PointVarTable, true)
  L4_590 = A1_587.PointVar
  L4_590 = L3_589[L4_590]
  GetTable(A0_586, A1_587.DestVarTable, true)[A1_587.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_588, L4_590)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_591, A1_592)
  local L2_593, L3_594
  L2_593 = GetParam
  L3_594 = "Point1"
  L2_593 = L2_593(L3_594, A0_591, A1_592)
  L3_594 = GetParam
  L3_594 = L3_594("Point2", A0_591, A1_592)
  GetTable(A0_591, A1_592.DestVarTable, true)[A1_592.DestVar] = DistanceBetweenPoints(L2_593, L3_594)
end
BBDistanceBetweenPoints = L0_0
function L0_0(A0_595, A1_596)
  local L2_597, L3_598
  L2_597 = GetParam
  L3_598 = "Point1"
  L2_597 = L2_597(L3_598, A0_595, A1_596)
  L3_598 = GetParam
  L3_598 = L3_598("Point2", A0_595, A1_596)
  GetTable(A0_595, A1_596.DestVarTable, true)[A1_596.DestVar] = DistanceBetweenPointsXZ(L2_597, L3_598)
end
BBDistanceBetweenPointsXZ = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_599, A1_600, A2_601)
  local L3_602, L4_603, L5_604, L6_605, L7_606, L8_607
  L5_604 = 0
  L6_605 = nil
  L7_606 = A1_600.ObjectDistanceType
  L8_607 = A1_600.ObjectVar1
  L3_602 = A0_599[L8_607]
  L8_607 = A1_600.ObjectVar2
  L4_603 = A0_599[L8_607]
  if nil == L4_603 then
    L8_607 = A1_600.Point2Var
    if nil ~= L8_607 then
      L8_607 = GetTable
      L8_607 = L8_607(A0_599, A1_600.Point2VarTable, true)
      L4_603 = L8_607[A1_600.Point2Var]
      L5_604 = L5_604 + 1
    end
  end
  if nil == L3_602 then
    L8_607 = A1_600.Point1Var
    if nil ~= L8_607 then
      L8_607 = GetTable
      L8_607 = L8_607(A0_599, A1_600.Point1VarTable, true)
      L3_602 = L8_607[A1_600.Point1Var]
      L5_604 = L5_604 + 1
      if 1 == L5_604 then
        L3_602, L4_603 = L4_603, L3_602
      end
    end
  end
  if nil ~= L7_606 then
    if 0 == L5_604 then
      L8_607 = OBJECT_CENTER
      if L8_607 == L7_606 then
        L6_605 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_607 = OBJECT_BOUNDARY
        if L8_607 == L7_606 then
          L6_605 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_607 = A1_600.OwnerVar
          L8_607 = A0_599[L8_607]
          Say(L8_607, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_604 then
      L8_607 = OBJECT_CENTER
      if L8_607 == L7_606 then
        L6_605 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_607 = OBJECT_BOUNDARY
        if L8_607 == L7_606 then
          L6_605 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_607 = A1_600.OwnerVar
          L8_607 = A0_599[L8_607]
          Say(L8_607, "invalid object distance type", 0)
        end
      end
    else
      L6_605 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_607 = A1_600.Distance
  if A1_600.DistanceVar ~= nil and GetTable(A0_599, A1_600.DistanceVarTable, true) ~= nil then
    L8_607 = L8_607 + GetTable(A0_599, A1_600.DistanceVarTable, true)[A1_600.DistanceVar]
  end
  if L3_602 ~= nil and L4_603 ~= nil and L6_605 ~= nil and L8_607 ~= nil then
    if not L6_605(L3_602, L4_603, L8_607) then
      ExecuteBuildingBlocks(A2_601, A0_599)
      A0_599.LastIfSucceeded = true
    else
      A0_599.LastIfSucceeded = false
    end
  else
    A0_599.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_608, A1_609)
  local L2_610, L3_611
  L2_610 = A1_609.TargetVar
  L2_610 = A0_608[L2_610]
  L3_611 = A1_609.CasterVar
  L3_611 = A0_608[L3_611]
  GetTable(A0_608, A1_609.DestVarTable, true)[A1_609.DestVar] = SpellBuffCount(L2_610, A1_609.BuffName, L3_611)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_612, A1_613)
  local L2_614
  L2_614 = A1_613.TargetVar
  L2_614 = A0_612[L2_614]
  GetTable(A0_612, A1_613.DestVarTable, true)[A1_613.DestVar] = SpellBuffCount(L2_614, A1_613.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_615, A1_616)
  local L2_617, L3_618
  L2_617 = GetTable
  L3_618 = A0_615
  L2_617 = L2_617(L3_618, A1_616.ScaleVarTable, false)
  L3_618 = nil
  if A1_616.OwnerVar ~= nil then
    L3_618 = A0_615[A1_616.OwnerVar]
  else
    L3_618 = A0_615.Owner
  end
  if A1_616.ScaleVar ~= nil and A1_616.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_617[A1_616.ScaleVar], L3_618)
  else
    SetScaleSkinCoef(A1_616.Scale, L3_618)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_619, A1_620)
  SpellBuffAdd(A0_619[A1_620.TargetVar], A0_619[A1_620.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_619.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_621, A1_622, A2_623)
  local L3_624, L4_625
  L3_624 = A1_622.TargetVar
  L3_624 = A0_621[L3_624]
  L4_625 = A1_622.NumStacks
  if GetParam("NumStacks", A0_621, A1_622) == 0 then
    L4_625 = SpellBuffCount(L3_624, A1_622.BuffName, caster)
  else
    L4_625 = GetParam("NumStacks", A0_621, A1_622)
  end
  while L4_625 > 0 do
    SpellBuffRemove(L3_624, A1_622.BuffName, A0_621[A1_622.AttackerVar])
    L4_625 = L4_625 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_626, A1_627)
  local L2_628, L3_629
  L2_628 = GetParam
  L3_629 = "Unit"
  L2_628 = L2_628(L3_629, A0_626, A1_627)
  unit = L2_628
  L2_628 = unit
  if L2_628 == nil then
    L2_628 = ReportError
    L3_629 = "Could not resolve Unit param"
    L2_628(L3_629)
    return
  end
  L2_628 = true
  L3_629 = GetParam
  L3_629 = L3_629("ChampionToShowTo", A0_626, A1_627)
  if L3_629 == nil then
    L2_628 = false
    L3_629 = GetParam("ChampionToShowToByFlag", A0_626, A1_627)
  end
  if L3_629 == nil then
    ReportError("Could not resolve ChampionToShowTo param")
    return
  end
  SetShowHealthBarToChampion(unit, A1_627.Show, L3_629, L2_628, A1_627.ApplyToSpectator)
end
BBSetShowHealthBarToChampion = L0_0
function L0_0(A0_630, A1_631)
  if GetParam("Vector", A0_630, A1_631) ~= nil then
    GetTable(A0_630, A1_631.DestVarTable, false)[A1_631.DestVar] = math.sqrt(GetParam("Vector", A0_630, A1_631).x * GetParam("Vector", A0_630, A1_631).x + GetParam("Vector", A0_630, A1_631).y * GetParam("Vector", A0_630, A1_631).y + GetParam("Vector", A0_630, A1_631).z * GetParam("Vector", A0_630, A1_631).z)
  end
end
BBGetVectorLength = L0_0
function L0_0(A0_632, A1_633, A2_634)
  if A0_632.EmoteId == A1_633.EmoteId then
    ExecuteBuildingBlocks(A2_634, A0_632)
    A0_632.LastIfSucceeded = true
  else
    A0_632.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_635, A1_636, A2_637)
  if A0_635.EmoteId ~= A1_636.EmoteId then
    ExecuteBuildingBlocks(A2_637, A0_635)
    A0_635.LastIfSucceeded = true
  else
    A0_635.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_638, A1_639)
  local L2_640, L3_641, L4_642, L5_643
  L2_640 = GetTable
  L3_641 = A0_638
  L4_642 = A1_639.String1VarTable
  L5_643 = false
  L2_640 = L2_640(L3_641, L4_642, L5_643)
  L3_641 = A1_639.String1Var
  L3_641 = L2_640[L3_641]
  L4_642 = GetTable
  L5_643 = A0_638
  L4_642 = L4_642(L5_643, A1_639.String2VarTable, false)
  L5_643 = A1_639.String2Var
  L5_643 = L4_642[L5_643]
  GetTable(A0_638, A1_639.ResultVarTable, false)[A1_639.ResultVar] = L3_641 .. L5_643
end
BBConcatenateStrings = L0_0
function L0_0(A0_644, A1_645)
  local L2_646, L3_647
  L2_646 = GetTable
  L3_647 = A0_644
  L2_646 = L2_646(L3_647, A1_645.VariableVarTable, false)
  L3_647 = A1_645.VariableVar
  L3_647 = L2_646[L3_647]
  GetTable(A0_644, A1_645.ResultVarTable, false)[A1_645.ResultVar] = "(" .. L3_647 .. ")"
end
BBEncaseInParantheses = L0_0
function L0_0(A0_648, A1_649)
  BBGetMinionKills(A0_648, A1_649)
  A0_648.MinionKillSource = GetParam("MinionKillTarget")
  A0_648.MinionKills = A0_648.MinionsKilled + GetParam("MinionKills", A0_648, A1_649)
  BBSetMinionKills(A0_648, A1_649)
end
BBIncreaseMinionKills = L0_0
function L0_0(A0_650, A1_651)
end
BBForcePreload = L0_0
