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
  if A0_370 < A1_371 then
    return A0_370
  else
    return A1_371
  end
end
MO_MIN = L0_0
function L0_0(A0_372, A1_373)
  if A1_373 < A0_372 then
    return A0_372
  else
    return A1_373
  end
end
MO_MAX = L0_0
function L0_0(A0_374, A1_375)
  return A0_374 % A1_375
end
MO_MODULO = L0_0
function L0_0(A0_376)
  return math.floor(A0_376 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_377)
  return math.ceil(A0_377)
end
MO_ROUNDUP = L0_0
function L0_0(A0_378)
  return math.floor(A0_378)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_379)
  return math.sin(math.rad(A0_379))
end
MO_SIN = L0_0
function L0_0(A0_380)
  return math.cos(math.rad(A0_380))
end
MO_COSINE = L0_0
function L0_0(A0_381)
  return math.tan(math.rad(A0_381))
end
MO_TANGENT = L0_0
function L0_0(A0_382)
  return math.deg(math.asin(A0_382))
end
MO_ASIN = L0_0
function L0_0(A0_383)
  return math.deg(math.acos(A0_383))
end
MO_ACOS = L0_0
function L0_0(A0_384)
  return math.deg(math.atan(A0_384))
end
MO_ATAN = L0_0
function L0_0(A0_385, A1_386)
  return math.pow(A0_385, A1_386)
end
MO_POW = L0_0
function L0_0(A0_387)
  return math.sqrt(A0_387)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_388, A1_389)
  local L2_390
  L2_390 = A0_388 and A1_389
  return L2_390
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_391, A1_392)
  local L2_393
  L2_393 = A0_391 or A1_392
  return L2_393
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_394)
  local L1_395
  L1_395 = not A0_394
  return L1_395
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_396)
  return math.abs(A0_396)
end
MO_ABS = L0_0
function L0_0(A0_397, A1_398)
  return math.random(A0_397, A1_398)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_399, A1_400)
  local L2_401, L3_402, L4_403, L5_404
  L2_401 = GetMathNumber
  L3_402 = A0_399
  L4_403 = A1_400.Src1VarTable
  L5_404 = A1_400.Src1Var
  L2_401 = L2_401(L3_402, L4_403, L5_404, A1_400.Src1Value)
  L3_402 = GetMathNumber
  L4_403 = A0_399
  L5_404 = A1_400.Src2VarTable
  L3_402 = L3_402(L4_403, L5_404, A1_400.Src2Var, A1_400.Src2Value)
  L4_403 = GetTable
  L5_404 = A0_399
  L4_403 = L4_403(L5_404, A1_400.DestVarTable)
  L5_404 = A1_400.MathOp
  L5_404 = L5_404(L2_401, L3_402)
  SetVarInTable(A0_399, A1_400, L5_404)
end
BBMath = L0_0
function L0_0(A0_405, A1_406, A2_407, A3_408)
  if A2_407 ~= nil and GetTable(A0_405, A1_406)[A2_407] ~= nil then
    return GetTable(A0_405, A1_406)[A2_407]
  end
  return A3_408
end
GetMathNumber = L0_0
function L0_0(A0_409, A1_410)
  if type(A1_410) == "number" then
    return A1_410
  elseif type(A1_410) == "function" then
    return A1_410(A0_409)
  elseif type(A1_410) == "string" then
    return A0_409[A1_410]
  end
end
GetNumber = L0_0
function L0_0(A0_411, A1_412)
  return VectorAdd(A0_411, A1_412)
end
VEC_ADD = L0_0
function L0_0(A0_413, A1_414)
  return VectorSubtract(A0_413, A1_414)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_415, A1_416)
  return VectorScalarMultiply(A0_415, A1_416)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_417, A1_418)
  return VectorScalarDivide(A0_417, A1_418)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_419, A1_420)
  return VectorRotateY(A0_419, A1_420)
end
VEC_ROTATE = L0_0
function L0_0(A0_421, A1_422)
  BBMath(A0_421, A1_422)
end
BBVectorMath = L0_0
function L0_0(A0_423, A1_424)
  local L2_425, L3_426, L4_427, L5_428
  L2_425 = A0_423.InstanceVars
  L3_426 = L2_425.InterpDelta
  if L3_426 == nil then
    L3_426 = A1_424.Amount
    L4_427 = A1_424.AmountVar
    if L4_427 ~= nil then
      L4_427 = GetTable
      L5_428 = A0_423
      L4_427 = L4_427(L5_428, A1_424.AmountVarTable)
      L5_428 = A1_424.AmountVar
      L3_426 = L4_427[L5_428]
    end
    L4_427 = GetPosition
    L5_428 = A1_424.TargetVar
    L5_428 = A0_423[L5_428]
    L4_427 = L4_427(L5_428)
    L2_425.KnockBackStart = L4_427
    L4_427 = GetNormalizedPositionDelta
    L5_428 = A1_424.TargetVar
    L5_428 = A0_423[L5_428]
    L4_427 = L4_427(L5_428, A0_423[A1_424.AttackerVar], true)
    L5_428 = {}
    L5_428.x = L4_427.x * L3_426
    L5_428.y = 0
    L5_428.z = L4_427.z * L3_426
    L2_425.InterpDelta = L5_428
    L5_428 = GetTime
    L5_428 = L5_428()
    L2_425.StartTime = L5_428
    L5_428 = A1_424.KnockBackDuration
    L2_425.KnockBackDuration = L5_428
  end
  L3_426 = A1_424.TargetVar
  L3_426 = A0_423[L3_426]
  L4_427 = GetTime
  L4_427 = L4_427()
  L5_428 = L2_425.StartTime
  L4_427 = L4_427 - L5_428
  L5_428 = L2_425.KnockBackDuration
  L4_427 = L4_427 / L5_428
  L5_428 = {}
  L5_428.x = L2_425.KnockBackStart.x + L2_425.InterpDelta.x * L4_427
  L5_428.y = L2_425.KnockBackStart.y
  L5_428.z = L2_425.KnockBackStart.z + L2_425.InterpDelta.z * L4_427
  SetPosition(L3_426, L5_428)
end
BBKnockback = L0_0
function L0_0(A0_429, A1_430)
  local L2_431, L3_432
  L2_431 = GetParam
  L3_432 = "Left"
  L2_431 = L2_431(L3_432, A0_429, A1_430)
  L3_432 = GetParam
  L3_432 = L3_432("Right", A0_429, A1_430)
  GetTable(A0_429, A1_430.DestVarTable, true)[A1_430.DestVar] = tostring(L2_431) .. tostring(L3_432)
end
BBAppendString = L0_0
function L0_0(A0_433, A1_434)
  local L2_435
  L2_435 = 0
  if A1_434.Delta ~= nil then
    L2_435 = L2_435 + A1_434.Delta
  end
  if A1_434.DeltaByLevel ~= nil and A0_433.Level ~= nil then
    L2_435 = L2_435 + A1_434.DeltaByLevel[A0_433.Level]
  end
  if A1_434.DeltaVar ~= nil then
    L2_435 = L2_435 + GetTable(A0_433, A1_434.DeltaVarTable, true)[A1_434.DeltaVar]
  end
  if A1_434.TargetVar ~= nil then
    A1_434.Stat(L2_435, A0_433[A1_434.TargetVar])
  else
    A1_434.Stat(L2_435)
  end
end
BBIncStat = L0_0
function L0_0(A0_436, A1_437)
  local L2_438
  L2_438 = 0
  if A1_437.Delta ~= nil then
    L2_438 = L2_438 + A1_437.Delta
  end
  if A1_437.DeltaByLevel ~= nil and A0_436.Level ~= nil then
    L2_438 = L2_438 + A1_437.DeltaByLevel[A0_436.Level]
  end
  if A1_437.DeltaVar ~= nil then
    L2_438 = L2_438 + GetTable(A0_436, A1_437.DeltaVarTable, true)[A1_437.DeltaVar]
  end
  if A1_437.TargetVar ~= nil then
    A1_437.Stat(L2_438, A0_436[A1_437.TargetVar])
  else
    A1_437.Stat(L2_438)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_439, A1_440)
  local L2_441, L3_442
  L2_441 = A1_440.TargetVar
  L3_442 = 0
  if A1_440.LaneVar ~= nil then
    L3_442 = L3_442 + GetTable(A0_439, A1_440.LaneVarTable, true)[A1_440.LaneVar]
  end
  if A1_440.Lane ~= nil then
    L3_442 = L3_442 + A1_440.Lane
  end
  SetMinionLane(A0_439[L2_441], L3_442)
end
BBSetMinionLane = L0_0
function L0_0(A0_443, A1_444)
  if A1_444.AttackVar ~= nil then
  end
  if A1_444.Attack ~= nil then
  end
  if A1_444.TotalCoefficientVar ~= nil then
  end
  if A1_444.TotalCoefficient ~= nil then
  end
  if A1_444.TargetVar ~= nil then
    GetTable(A0_443, A1_444.DestVarTable, false)[A1_444.DestVar] = (0 + GetTable(A0_443, A1_444.AttackVarTable, true)[A1_444.AttackVar] + A1_444.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_443[A1_444.TargetVar])) + GetFlatCritDamageMod(A0_443[A1_444.TargetVar])) * (0 + GetTable(A0_443, A1_444.TotalCoefficientVarTable, true)[A1_444.TotalCoefficientVar] + A1_444.TotalCoefficient)
  else
    GetTable(A0_443, A1_444.DestVarTable, false)[A1_444.DestVar] = 2 * A1_444.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_445, A1_446)
  local L2_447, L3_448, L4_449, L5_450, L6_451, L7_452
  L2_447 = GetTable
  L3_448 = A0_445
  L4_449 = A1_446.DestVarTable
  L5_450 = false
  L2_447 = L2_447(L3_448, L4_449, L5_450)
  L3_448 = GetTable
  L4_449 = A0_445
  L5_450 = A1_446.AmountVarTable
  L6_451 = true
  L3_448 = L3_448(L4_449, L5_450, L6_451)
  L4_449 = GetTable
  L5_450 = A0_445
  L6_451 = A0_445.NextBuffVars
  L7_452 = false
  L4_449 = L4_449(L5_450, L6_451, L7_452)
  L5_450 = A1_446.AmountVar
  L5_450 = L3_448[L5_450]
  L6_451 = A1_446.Amount
  L5_450 = L5_450 + L6_451
  L4_449.InitializeShield_Amount = L5_450
  L5_450 = A1_446.AmountVar
  if L5_450 ~= nil then
    L5_450 = A1_446.HealShieldMod
    if L5_450 ~= nil and L5_450 == true then
      L6_451 = A1_446.AttackerVar
      L7_452 = 0
      if L6_451 ~= nil then
        L7_452 = GetPercentHealingAmountMod(A0_445[L6_451])
      end
      L4_449.InitializeShield_Amount, L3_448[A1_446.AmountVar] = (A1_446.Amount + L3_448[A1_446.AmountVar]) * (1 + L7_452), (A1_446.Amount + L3_448[A1_446.AmountVar]) * (1 + L7_452)
    end
  end
  L5_450 = SpellBuffAddNoRenew
  L6_451 = A1_446.AttackerVar
  L6_451 = A0_445[L6_451]
  L7_452 = A1_446.UnitVar
  L7_452 = A0_445[L7_452]
  L5_450(L6_451, L7_452, "InitializeShieldMarker", 0, 1, 25000, L4_449)
  L5_450 = BBIncreaseShield
  L6_451 = A0_445
  L7_452 = A1_446
  L5_450(L6_451, L7_452)
end
BBInitializeShield = L0_0
function L0_0(A0_453, A1_454)
  if A1_454.CDVar ~= nil then
  end
  if A1_454.CD ~= nil then
  end
  if A1_454.TargetVar ~= nil then
    GetTable(A0_453, A1_454.DestVarTable, false)[A1_454.DestVar] = (0 + GetTable(A0_453, A1_454.CDVarTable, true)[A1_454.CDVar] + A1_454.CD) * (1 + GetPercentCooldownMod(A0_453[A1_454.TargetVar]))
  else
    GetTable(A0_453, A1_454.DestVarTable, false)[A1_454.DestVar] = A1_454.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_455, A1_456)
  local L2_457, L3_458
  L3_458 = A1_456.TargetVar
  if L3_458 ~= nil then
    L2_457 = A1_456.Stat(A0_455[L3_458])
  else
    L2_457 = A1_456.Stat()
  end
  SetVarInTable(A0_455, A1_456, L2_457)
end
BBGetStat = L0_0
function L0_0(A0_459, A1_460)
  if A1_460.TargetVar ~= nil then
    GetTable(A0_459, A1_460.DestVarTable, false)[A1_460.DestVar] = GetLevel(A0_459[A1_460.TargetVar])
  else
    GetTable(A0_459, A1_460.DestVarTable, false)[A1_460.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_461, A1_462)
  if A1_462.TargetVar ~= nil then
    GetTable(A0_461, A1_462.DestVarTable, false)[A1_462.DestVar] = GetUnitSignificance(A0_461[A1_462.TargetVar])
  else
    GetTable(A0_461, A1_462.DestVarTable, false)[A1_462.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_463, A1_464)
  if A1_464.TargetVar ~= nil then
    GetTable(A0_463, A1_464.DestVarTable, false)[A1_464.DestVar] = GetArmor(A0_463[A1_464.TargetVar])
  else
    GetTable(A0_463, A1_464.DestVarTable, false)[A1_464.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_465, A1_466)
  if A1_466.TargetVar ~= nil then
    GetTable(A0_465, A1_466.DestVarTable, false)[A1_466.DestVar] = GetSpellBlock(A0_465[A1_466.TargetVar])
  else
    GetTable(A0_465, A1_466.DestVarTable, false)[A1_466.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_467, A1_468)
  local L2_469, L3_470
  L3_470 = A1_468.TargetVar
  if L3_470 ~= nil then
    L2_469 = GetTeamID(A0_467[L3_470])
  else
    L2_469 = GetTeamID()
  end
  SetVarInTable(A0_467, A1_468, L2_469)
end
BBGetTeamID = L0_0
function L0_0(A0_471, A1_472)
  local L2_473, L3_474, L4_475
  L2_473 = GetTable
  L3_474 = A0_471
  L4_475 = A1_472.DestVarTable
  L2_473 = L2_473(L3_474, L4_475, false)
  L3_474 = A1_472.TargetVar
  L4_475 = nil
  if L3_474 ~= nil then
    L4_475 = GetTeamID(A0_471[L3_474])
  else
    L4_475 = GetTeamID()
  end
  if L4_475 == TEAM_ORDER then
    L2_473[A1_472.DestVar] = TEAM_CHAOS
  elseif L4_475 == TEAM_CHAOS then
    L2_473[A1_472.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_476, A1_477)
  if A1_477.TargetVar ~= nil then
    GetTable(A0_476, A1_477.DestVarTable, false)[A1_477.DestVar] = GetUnitSkinName(A0_476[A1_477.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_478, A1_479)
  local L2_480, L3_481, L4_482
  L2_480 = GetTable
  L3_481 = A0_478
  L4_482 = A1_479.DestVarTable
  L2_480 = L2_480(L3_481, L4_482, false)
  L3_481 = A0_478.Owner
  L4_482 = nil
  if A1_479.TargetVar ~= nil then
    L4_482 = GetTotalAttackDamage(A0_478[A1_479.TargetVar])
  else
    L4_482 = GetTotalAttackDamage()
  end
  SetVarInTable(A0_478, A1_479, L4_482)
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_483, A1_484)
  GetTable(A0_483, A1_484.DestVarTable, true)[A1_484.DestVar] = A1_484.Status(A0_483[A1_484.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_485, A1_486)
  local L2_487
  L2_487 = A1_486.TargetVar
  L2_487 = A0_485[L2_487]
  ClearAttackTarget(L2_487)
end
BBClearAttackTarget = L0_0
function L0_0(A0_488, A1_489)
  local L2_490, L3_491
  L2_490 = GetTable
  L3_491 = A0_488
  L2_490 = L2_490(L3_491, A1_489.DestVarTable, true)
  L3_491 = A1_489.Info
  L3_491 = L3_491(A0_488[A1_489.TargetVar])
  SetVarInTable(A0_488, A1_489, L3_491)
end
BBGetCastInfo = L0_0
function L0_0(A0_492, A1_493, A2_494)
  local L3_495, L4_496, L5_497, L6_498
  L3_495 = GetTable
  L4_496 = A0_492
  L5_497 = A1_493.TrackTimeVarTable
  L6_498 = false
  L3_495 = L3_495(L4_496, L5_497, L6_498)
  L4_496 = GetTime
  L4_496 = L4_496()
  L5_497 = A1_493.ExecuteImmediately
  L6_498 = GetParam
  L6_498 = L6_498("TimeBetweenExecutions", A0_492, A1_493)
  if A1_493.TickTimeVar ~= nil and GetTable(A0_492, A1_493.TickTimeVarTable, false)[A1_493.TickTimeVar] ~= nil then
    L6_498 = GetTable(A0_492, A1_493.TickTimeVarTable, false)[A1_493.TickTimeVar]
  end
  if L3_495[A1_493.TrackTimeVar] == nil then
    L3_495[A1_493.TrackTimeVar] = L4_496
    if L5_497 == true then
      ExecuteBuildingBlocks(A2_494, A0_492)
    end
  end
  if L4_496 >= L3_495[A1_493.TrackTimeVar] + L6_498 then
    L3_495[A1_493.TrackTimeVar] = L3_495[A1_493.TrackTimeVar] + L6_498
    ExecuteBuildingBlocks(A2_494, A0_492)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_499, A1_500, A2_501)
  GetTable(A0_499, A1_500.TrackTimeVarTable, false)[A1_500.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_502, A1_503)
  local L2_504
  L2_504 = A1_503.SrcValue
  if A1_503.SrcVar ~= nil then
    L2_504 = GetTable(A0_502, A1_503.SrcVarTable, true)[A1_503.SrcVar]
  end
  A1_503.Status(A0_502[A1_503.TargetVar], L2_504)
end
BBSetStatus = L0_0
function L0_0(A0_505, A1_506)
  local L2_507
  L2_507 = A1_506.ToAlert
  if GetTable(A0_505, A1_506.SrcVarTable, false) ~= nil and A1_506.SrcVar ~= nil then
    L2_507 = L2_507 .. GetTable(A0_505, A1_506.SrcVarTable, false)[A1_506.SrcVar]
  end
  _ALERT(L2_507)
end
BBAlert = L0_0
function L0_0(A0_508, A1_509)
  local L2_510, L3_511, L4_512, L5_513, L6_514, L7_515
  L2_510 = GetParam
  L3_511 = "Value"
  L4_512 = A0_508
  L5_513 = A1_509
  L2_510 = L2_510(L3_511, L4_512, L5_513)
  if L2_510 == nil then
    L3_511 = ReportError
    L4_512 = "Could not resolve Value param"
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
  DisplayNumericFloatingTextOnUnitToChampion(L2_510, A1_509.TextType, L4_512, L3_511, L6_514, L5_513, L7_515)
end
BBDisplayNumericFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_516, A1_517)
  local L2_518, L3_519, L4_520, L5_521, L6_522, L7_523
  L2_518 = GetParam
  L3_519 = "Message"
  L4_520 = A0_516
  L5_521 = A1_517
  L2_518 = L2_518(L3_519, L4_520, L5_521)
  if L2_518 == nil then
    L3_519 = ReportError
    L4_520 = "Could not resolve Message param"
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
  SayWithFloatingTextOnUnitToChampion(tostring(L2_518), A1_517.TextType, L4_520, L3_519, L6_522, L5_521, L7_523)
end
BBSayWithFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_524, A1_525)
  local L2_526, L3_527, L4_528
  L2_526 = A1_525.ToSay
  L3_527 = GetTable
  L4_528 = A0_524
  L3_527 = L3_527(L4_528, A1_525.SrcVarTable, false)
  if L3_527 ~= nil then
    L4_528 = A1_525.SrcVar
    if L4_528 ~= nil then
      L4_528 = L2_526
      L2_526 = L4_528 .. tostring(L3_527[A1_525.SrcVar])
    end
  end
  L4_528 = nil
  if A1_525.OwnerVar ~= nil then
    L4_528 = A0_524[A1_525.OwnerVar]
  else
    L4_528 = A0_524.Owner
  end
  if A1_525.TextType == nil then
    A1_525.TextType = 0
  end
  Say(L4_528, L2_526, A1_525.TextType)
end
BBSay = L0_0
function L0_0(A0_529, A1_530)
  local L2_531, L3_532, L4_533
  L2_531 = A1_530.ToSay
  L3_532 = GetTable
  L4_533 = A0_529
  L3_532 = L3_532(L4_533, A1_530.SrcVarTable, false)
  if L3_532 ~= nil then
    L4_533 = A1_530.SrcVar
    if L4_533 ~= nil then
      L4_533 = L2_531
      L2_531 = L4_533 .. tostring(L3_532[A1_530.SrcVar])
    end
  end
  L4_533 = nil
  if A1_530.OwnerVar ~= nil then
    L4_533 = A0_529[A1_530.OwnerVar]
  else
    L4_533 = A0_529.Owner
  end
  if A1_530.TextType == nil then
    A1_530.TextType = 0
  end
  Say(L4_533, L2_531, A1_530.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_534, A1_535)
  GetTable(A0_534, A1_535.DestVarTable, true)[A1_535.DestVar] = BBLuaGetGold(A0_534, A1_535)
end
BBGetGold = L0_0
function L0_0(A0_536, A1_537)
  GetTable(A0_536, A1_537.DestVarTable, true)[A1_537.DestVar] = BBLuaGetTotalGold(A0_536, A1_537)
end
BBGetTotalGold = L0_0
function L0_0(A0_538, A1_539)
  A0_538.CharVars.TeleportTargetPosition = GetTable(A0_538, A1_539.CastPositionNameTable)[A1_539.CastPositionName]
  SpellBuffAdd(A0_538[A1_539.OwnerVar], A0_538[A1_539.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_538.NextBuffVars)
  BBTeleportToPositionHelper(A0_538, A1_539)
end
BBTeleportToPosition = L0_0
function L0_0(A0_540, A1_541)
  if A1_541.XVar ~= nil and GetTable(A0_540, A1_541.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_540, A1_541.XVarTable, true)[A1_541.XVar]
  else
    Xloc = A1_541.X
  end
  if A1_541.YVar ~= nil and GetTable(A0_540, A1_541.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_540, A1_541.YVarTable, true)[A1_541.YVar]
  else
    Yloc = A1_541.Y
  end
  if A1_541.ZVar ~= nil and GetTable(A0_540, A1_541.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_540, A1_541.ZVarTable, true)[A1_541.ZVar]
  else
    Zloc = A1_541.Z
  end
  A1_541.OwnerVar, A0_540.position = A1_541.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_541.CastPositionName = "position"
  BBTeleportToPosition(A0_540, A1_541)
end
BBTeleportToPoint = L0_0
function L0_0(A0_542, A1_543)
  A1_543.TimeoutInFOW = 999999
  A1_543.BindFlexToOwnerPAR = false
  A1_543.Flags = 0
  A1_543.FollowsGroundTilt = false
  A1_543.FacesTarget = false
  A1_543.HideFromSpectator = false
  A1_543.SendIfOnScreenOrDiscard = false
  A1_543.PersistsThroughReconnect = true
  A1_543.FOWVisibilityRadius = 10
  A1_543.Scale = 1
  A1_543.BindObjectVar = A1_543.BindObject1Var
  A1_543.EffectID2Var = A1_543.OtherTeamEffectIDVar
  A1_543.TargetObjectVar = A1_543.BindObject2Var
  A1_543.FOWTeamOverrideVar = A1_543.FOWTeamVar
  A1_543.BoneName = A1_543.BindObject1BoneName
  A1_543.TargetBoneName = A1_543.BindObject2BoneName
  A1_543.EffectName = A1_543.EffectParticleFile
  A1_543.EffectNameForOtherTeam = A1_543.OtherTeamParticleFile
  BBSpellEffectCreate(A0_542, A1_543)
end
BBSpellEffectCreate_EasyBeam = L0_0
function L0_0(A0_544, A1_545)
  A1_545.TimeoutInFOW = 999999
  A1_545.BindFlexToOwnerPAR = false
  A1_545.Flags = 0
  A1_545.FollowsGroundTilt = false
  A1_545.FacesTarget = false
  A1_545.HideFromSpectator = false
  A1_545.SendIfOnScreenOrDiscard = true
  A1_545.PersistsThroughReconnect = false
  A1_545.FOWVisibilityRadius = 10
  A1_545.Scale = 1
  A1_545.FOWTeamOverrideVar = A1_545.FOWTeamVar
  A1_545.EffectName = A1_545.ParticleFile
  A1_545.EffectNameForOtherTeam = A1_545.ParticleFileForOtherTeam
  A1_545.BoneName = A1_545.BindObjectBoneName
  BBSpellEffectCreate(A0_544, A1_545)
end
BBSpellEffectCreate_EasyHit = L0_0
function L0_0(A0_546, A1_547)
  local L2_548, L3_549, L4_550, L5_551, L6_552, L7_553, L8_554, L9_555, L10_556, L11_557, L12_558
  L3_549 = A1_547.TargetVar
  if L3_549 ~= nil then
    L3_549 = A1_547.TargetVar
    L2_548 = A0_546[L3_549]
  else
    L2_548 = A0_546.Target
  end
  L3_549 = {
    L4_550,
    L5_551,
    L6_552
  }
  L4_550.maxSlot = 3
  L4_550.spellbook = L5_551
  L4_550.stype = L5_551
  L5_551.maxSlot = 6
  L5_551.spellbook = L6_552
  L5_551.stype = L6_552
  L6_552.maxSlot = 1
  L7_553 = SPELLBOOK_SUMMONER
  L6_552.spellbook = L7_553
  L7_553 = SpellSlots
  L6_552.stype = L7_553
  for L7_553, L8_554 in L4_550(L5_551) do
    A1_547.SpellbookType = L9_555
    A1_547.SlotType = L9_555
    for L12_558 = 0, L8_554.maxSlot do
      if HasSpellTag(L2_548, L12_558, A1_547.SpellbookType, A1_547.SlotType, A1_547.SpellTag) ~= A1_547.InvertResult then
        A1_547.SpellSlot = L12_558
        BBSealSpellSlot(A0_546, A1_547)
      end
    end
  end
end
BBSealSpellSlotsWithTag = L0_0
function L0_0(A0_559, A1_560)
  ReincarnateNonDeadHero(GetTable(A0_559, A1_560.TargetTable, false)[A1_560.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_561, A1_562)
  GetTable(A0_561, A1_562.DestVarTable, true)[A1_562.DestVar] = A1_562.Function(A0_561[A1_562.OwnerVar], A1_562.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_563, A1_564)
  local L2_565, L3_566, L4_567, L5_568
  L2_565 = A1_564.WhomToOrderVar
  L2_565 = A0_563[L2_565]
  L3_566 = A1_564.TargetOfOrderVar
  L3_566 = A0_563[L3_566]
  L4_567 = GetTable
  L5_568 = A0_563
  L4_567 = L4_567(L5_568, A1_564.SrcVarTable, false)
  L5_568 = nil
  if A1_564.SrcVar ~= nil and L4_567 ~= nil then
    L5_568 = L4_567[A1_564.SrcVar]
  else
    L5_568 = GetPosition(L3_566)
  end
  if L3_566 == nil then
    L3_566 = L2_565
  end
  IssueOrder(L2_565, A1_564.Order, L5_568, L3_566)
end
BBIssueOrder = L0_0
function L0_0(A0_569, A1_570)
  local L2_571
  L2_571 = GetParam
  L2_571 = L2_571("NewRange", A0_569, A1_570)
  SetSpellCastRange(L2_571)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_572, A1_573)
  GetTable(A0_572, A1_573.DestVarTable, true)[A1_573.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_574, A1_575)
  local L2_576, L3_577
  L2_576 = A1_575.ObjectVar1
  L2_576 = A0_574[L2_576]
  L3_577 = A1_575.ObjectVar2
  L3_577 = A0_574[L3_577]
  GetTable(A0_574, A1_575.DestVarTable, true)[A1_575.DestVar] = DistanceBetweenObjectBounds(L2_576, L3_577)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_578, A1_579)
  local L2_580, L3_581, L4_582
  L2_580 = A1_579.ObjectVar
  L2_580 = A0_578[L2_580]
  L3_581 = GetTable
  L4_582 = A0_578
  L3_581 = L3_581(L4_582, A1_579.PointVarTable, true)
  L4_582 = A1_579.PointVar
  L4_582 = L3_581[L4_582]
  GetTable(A0_578, A1_579.DestVarTable, true)[A1_579.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_580, L4_582)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_583, A1_584)
  local L2_585, L3_586
  L2_585 = GetParam
  L3_586 = "Point1"
  L2_585 = L2_585(L3_586, A0_583, A1_584)
  L3_586 = GetParam
  L3_586 = L3_586("Point2", A0_583, A1_584)
  GetTable(A0_583, A1_584.DestVarTable, true)[A1_584.DestVar] = DistanceBetweenPoints(L2_585, L3_586)
end
BBDistanceBetweenPoints = L0_0
function L0_0(A0_587, A1_588)
  local L2_589, L3_590
  L2_589 = GetParam
  L3_590 = "Point1"
  L2_589 = L2_589(L3_590, A0_587, A1_588)
  L3_590 = GetParam
  L3_590 = L3_590("Point2", A0_587, A1_588)
  GetTable(A0_587, A1_588.DestVarTable, true)[A1_588.DestVar] = DistanceBetweenPointsXZ(L2_589, L3_590)
end
BBDistanceBetweenPointsXZ = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_591, A1_592, A2_593)
  local L3_594, L4_595, L5_596, L6_597, L7_598, L8_599
  L5_596 = 0
  L6_597 = nil
  L7_598 = A1_592.ObjectDistanceType
  L8_599 = A1_592.ObjectVar1
  L3_594 = A0_591[L8_599]
  L8_599 = A1_592.ObjectVar2
  L4_595 = A0_591[L8_599]
  if nil == L4_595 then
    L8_599 = A1_592.Point2Var
    if nil ~= L8_599 then
      L8_599 = GetTable
      L8_599 = L8_599(A0_591, A1_592.Point2VarTable, true)
      L4_595 = L8_599[A1_592.Point2Var]
      L5_596 = L5_596 + 1
    end
  end
  if nil == L3_594 then
    L8_599 = A1_592.Point1Var
    if nil ~= L8_599 then
      L8_599 = GetTable
      L8_599 = L8_599(A0_591, A1_592.Point1VarTable, true)
      L3_594 = L8_599[A1_592.Point1Var]
      L5_596 = L5_596 + 1
      if 1 == L5_596 then
        L3_594, L4_595 = L4_595, L3_594
      end
    end
  end
  if nil ~= L7_598 then
    if 0 == L5_596 then
      L8_599 = OBJECT_CENTER
      if L8_599 == L7_598 then
        L6_597 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_599 = OBJECT_BOUNDARY
        if L8_599 == L7_598 then
          L6_597 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_599 = A1_592.OwnerVar
          L8_599 = A0_591[L8_599]
          Say(L8_599, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_596 then
      L8_599 = OBJECT_CENTER
      if L8_599 == L7_598 then
        L6_597 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_599 = OBJECT_BOUNDARY
        if L8_599 == L7_598 then
          L6_597 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_599 = A1_592.OwnerVar
          L8_599 = A0_591[L8_599]
          Say(L8_599, "invalid object distance type", 0)
        end
      end
    else
      L6_597 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_599 = A1_592.Distance
  if A1_592.DistanceVar ~= nil and GetTable(A0_591, A1_592.DistanceVarTable, true) ~= nil then
    L8_599 = L8_599 + GetTable(A0_591, A1_592.DistanceVarTable, true)[A1_592.DistanceVar]
  end
  if L3_594 ~= nil and L4_595 ~= nil and L6_597 ~= nil and L8_599 ~= nil then
    if not L6_597(L3_594, L4_595, L8_599) then
      ExecuteBuildingBlocks(A2_593, A0_591)
      A0_591.LastIfSucceeded = true
    else
      A0_591.LastIfSucceeded = false
    end
  else
    A0_591.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_600, A1_601)
  local L2_602, L3_603
  L2_602 = A1_601.TargetVar
  L2_602 = A0_600[L2_602]
  L3_603 = A1_601.CasterVar
  L3_603 = A0_600[L3_603]
  GetTable(A0_600, A1_601.DestVarTable, true)[A1_601.DestVar] = SpellBuffCount(L2_602, A1_601.BuffName, L3_603)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_604, A1_605)
  local L2_606
  L2_606 = A1_605.TargetVar
  L2_606 = A0_604[L2_606]
  GetTable(A0_604, A1_605.DestVarTable, true)[A1_605.DestVar] = SpellBuffCount(L2_606, A1_605.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_607, A1_608)
  local L2_609, L3_610
  L2_609 = GetTable
  L3_610 = A0_607
  L2_609 = L2_609(L3_610, A1_608.ScaleVarTable, false)
  L3_610 = nil
  if A1_608.OwnerVar ~= nil then
    L3_610 = A0_607[A1_608.OwnerVar]
  else
    L3_610 = A0_607.Owner
  end
  if A1_608.ScaleVar ~= nil and A1_608.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_609[A1_608.ScaleVar], L3_610)
  else
    SetScaleSkinCoef(A1_608.Scale, L3_610)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_611, A1_612)
  SpellBuffAdd(A0_611[A1_612.TargetVar], A0_611[A1_612.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_611.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_613, A1_614, A2_615)
  local L3_616, L4_617
  L3_616 = A1_614.TargetVar
  L3_616 = A0_613[L3_616]
  L4_617 = A1_614.NumStacks
  if GetParam("NumStacks", A0_613, A1_614) == 0 then
    L4_617 = SpellBuffCount(L3_616, A1_614.BuffName, caster)
  else
    L4_617 = GetParam("NumStacks", A0_613, A1_614)
  end
  while L4_617 > 0 do
    SpellBuffRemove(L3_616, A1_614.BuffName, A0_613[A1_614.AttackerVar])
    L4_617 = L4_617 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_618, A1_619)
  local L2_620, L3_621
  L2_620 = GetParam
  L3_621 = "Unit"
  L2_620 = L2_620(L3_621, A0_618, A1_619)
  unit = L2_620
  L2_620 = unit
  if L2_620 == nil then
    L2_620 = ReportError
    L3_621 = "Could not resolve Unit param"
    L2_620(L3_621)
    return
  end
  L2_620 = true
  L3_621 = GetParam
  L3_621 = L3_621("ChampionToShowTo", A0_618, A1_619)
  if L3_621 == nil then
    L2_620 = false
    L3_621 = GetParam("ChampionToShowToByFlag", A0_618, A1_619)
  end
  if L3_621 == nil then
    ReportError("Could not resolve ChampionToShowTo param")
    return
  end
  SetShowHealthBarToChampion(unit, A1_619.Show, L3_621, L2_620, A1_619.ApplyToSpectator)
end
BBSetShowHealthBarToChampion = L0_0
function L0_0(A0_622, A1_623)
  if GetParam("Vector", A0_622, A1_623) ~= nil then
    GetTable(A0_622, A1_623.DestVarTable, false)[A1_623.DestVar] = math.sqrt(GetParam("Vector", A0_622, A1_623).x * GetParam("Vector", A0_622, A1_623).x + GetParam("Vector", A0_622, A1_623).y * GetParam("Vector", A0_622, A1_623).y + GetParam("Vector", A0_622, A1_623).z * GetParam("Vector", A0_622, A1_623).z)
  end
end
BBGetVectorLength = L0_0
function L0_0(A0_624, A1_625, A2_626)
  if A0_624.EmoteId == A1_625.EmoteId then
    ExecuteBuildingBlocks(A2_626, A0_624)
    A0_624.LastIfSucceeded = true
  else
    A0_624.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_627, A1_628, A2_629)
  if A0_627.EmoteId ~= A1_628.EmoteId then
    ExecuteBuildingBlocks(A2_629, A0_627)
    A0_627.LastIfSucceeded = true
  else
    A0_627.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_630, A1_631)
  local L2_632, L3_633, L4_634, L5_635
  L2_632 = GetTable
  L3_633 = A0_630
  L4_634 = A1_631.String1VarTable
  L5_635 = false
  L2_632 = L2_632(L3_633, L4_634, L5_635)
  L3_633 = A1_631.String1Var
  L3_633 = L2_632[L3_633]
  L4_634 = GetTable
  L5_635 = A0_630
  L4_634 = L4_634(L5_635, A1_631.String2VarTable, false)
  L5_635 = A1_631.String2Var
  L5_635 = L4_634[L5_635]
  GetTable(A0_630, A1_631.ResultVarTable, false)[A1_631.ResultVar] = L3_633 .. L5_635
end
BBConcatenateStrings = L0_0
function L0_0(A0_636, A1_637)
  local L2_638, L3_639
  L2_638 = GetTable
  L3_639 = A0_636
  L2_638 = L2_638(L3_639, A1_637.VariableVarTable, false)
  L3_639 = A1_637.VariableVar
  L3_639 = L2_638[L3_639]
  GetTable(A0_636, A1_637.ResultVarTable, false)[A1_637.ResultVar] = "(" .. L3_639 .. ")"
end
BBEncaseInParantheses = L0_0
function L0_0(A0_640, A1_641)
  BBGetMinionKills(A0_640, A1_641)
  A0_640.MinionKillSource = GetParam("MinionKillTarget")
  A0_640.MinionKills = A0_640.MinionsKilled + GetParam("MinionKills", A0_640, A1_641)
  BBSetMinionKills(A0_640, A1_641)
end
BBIncreaseMinionKills = L0_0
