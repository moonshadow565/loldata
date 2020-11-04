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
function L0_0(A0_242)
  return IsDeadOrZombie(A0_242) ~= true
end
CO_IS_NEITHER_DEAD_NOR_ZOMBIE = L0_0
function L0_0(A0_243, A1_244)
  return BBIsTargetInFrontOfMe(A0_243, A1_244)
end
CO_IS_TARGET_IN_FRONT_OF_ME = L0_0
function L0_0(A0_245, A1_246)
  return BBIsTargetBehindMe(A0_245, A1_246)
end
CO_IS_TARGET_BEHIND_ME = L0_0
function L0_0(A0_247)
  return IsWard(A0_247)
end
CO_IS_WARD = L0_0
function L0_0(A0_248)
  return IsWard(A0_248) ~= true
end
CO_IS_NOT_WARD = L0_0
function L0_0(A0_249)
  return IsStructure(A0_249)
end
CO_IS_STRUCTURE = L0_0
function L0_0(A0_250)
  return IsStructure(A0_250) ~= true
end
CO_IS_NOT_STRUCTURE = L0_0
function L0_0(A0_251)
  local L1_252
  L1_252 = A0_251 ~= nil
  return L1_252
end
CO_IS_NOT_NIL = L0_0
function L0_0(A0_253, A1_254, A2_255)
  GetTable(A0_253, A1_254.MacroVarTable, true)[A1_254.MacroVar] = A2_255
end
BBCreateMacro = L0_0
function L0_0(A0_256, A1_257)
  local L2_258
  L2_258 = GetParam
  L2_258 = L2_258("Macro", A0_256, A1_257)
  if L2_258 ~= nil and type(L2_258) == "table" then
    ExecuteBuildingBlocks(L2_258, A0_256)
  else
    DebugClientPrint("Designer Error: Macro variable is not initialized inside of event. Macro Variable was: " .. tostring(A1_257.MacroVar) .. " and current block data is: " .. gCurrentBuildingBlockString .. ". This error probably occurred due to variable not being initialized yet, being misnamed or two events being called out of sequence. It is highly recommended that script macros either be initialized OnBuffActivate, OnCharActivate or in the same event. Pro Devs may violate this rule at the risk of being forced to read this error message again.")
  end
end
BBRunMacro = L0_0
function L0_0(A0_259, A1_260, A2_261)
  local L3_262, L4_263, L5_264, L6_265, L7_266, L8_267
  L3_262 = GetTable
  L3_262 = L3_262(L4_263, L5_264, L6_265)
  L3_262[L4_263] = A2_261
  if L4_263 == nil then
    A2_261.InPerBlockParams = A1_260
    for L7_266 = 1, 6 do
      L8_267 = "FunctionParameter"
      L8_267 = L8_267 .. L7_266 .. "Var"
      if A1_260[L8_267 .. "Table"] ~= nil then
        DebugClientPrint("Designer Error: CreateFunction can only input parameters to PassThroughParams. Current block data is: " .. gCurrentBuildingBlockString .. ".")
      end
    end
  end
end
BBCreateFunction = L0_0
function L0_0(A0_268, A1_269)
  local L2_270, L3_271, L4_272, L5_273, L6_274
  for L5_273 = 1, 6 do
    L6_274 = "FunctionOutput"
    L6_274 = L6_274 .. L5_273 .. "Var"
    if A1_269[L6_274] ~= nil and A1_269[L6_274] ~= "" then
      if A1_269[L6_274 .. "Table"] ~= nil then
        DebugClientPrint("Designer Error: EndFunction can only output from PassThroughParams. Current block data is: " .. gCurrentBuildingBlockString .. ".")
      else
        A0_268[L6_274] = A0_268[A1_269[L6_274]]
      end
    end
  end
end
BBEndFunction = L0_0
function L0_0(A0_275, A1_276)
  local L2_277, L3_278, L4_279, L5_280, L6_281, L7_282, L8_283, L9_284
  L2_277 = GetParam
  L3_278 = "Function"
  L2_277 = L2_277(L3_278, L4_279, L5_280)
  L3_278 = {}
  L3_278.InstanceVars = L4_279
  L3_278.CharVars = L4_279
  L3_278.NextBuffVars = L4_279
  L3_278.AvatarVars = L4_279
  L3_278.SpellVars = L4_279
  L3_278.WorldVars = L4_279
  L3_278.Target = L4_279
  L3_278[L4_279] = L5_280
  L3_278.Attacker = L4_279
  L3_278[L4_279] = L5_280
  L3_278.Owner = L4_279
  L3_278[L4_279] = L5_280
  L3_278.Caster = L4_279
  L3_278.GoldRedirectTarget = L4_279
  L3_278.Unit = L4_279
  L3_278.Other1 = L4_279
  L3_278.Other2 = L4_279
  L3_278.Other3 = L4_279
  L3_278.Nothing = L4_279
  if L2_277 ~= nil then
    if L4_279 == "table" then
      if L4_279 ~= nil then
        for L8_283 = 1, 6 do
          L9_284 = "FunctionParameter"
          L9_284 = L9_284 .. L8_283 .. "Var"
          if A1_276[L9_284] ~= nil and A1_276[L9_284] ~= "" and L4_279[L9_284] ~= nil and L4_279[L9_284] ~= "" then
            L3_278[L4_279[L9_284]] = GetTable(A0_275, A1_276[L9_284 .. "Table"], false)[A1_276[L9_284]]
          end
        end
      end
      L4_279(L5_280, L6_281)
      for L7_282 = 1, 6 do
        L8_283 = "FunctionOutput"
        L9_284 = L7_282
        L8_283 = L8_283 .. L9_284 .. "Var"
        L9_284 = A1_276[L8_283]
        if L9_284 ~= nil then
          L9_284 = A1_276[L8_283]
          if L9_284 ~= "" then
            L9_284 = L3_278
            GetTable(A0_275, A1_276[L8_283 .. "Table"], false)[A1_276[L8_283]] = L9_284[L8_283]
          end
        end
      end
    end
  else
    L8_283 = gCurrentBuildingBlockString
    L9_284 = ". This error probably occurred due to variable not being initialized yet, being misnamed or two events being called out of sequence. It is highly recommended that script functions either be initialized OnBuffActivate, OnCharActivate or in the same event. Pro Devs may violate this rule at the risk of being forced to read this error message again."
    L4_279(L5_280)
  end
end
BBRunFunction = L0_0
function L0_0(A0_285, A1_286, A2_287)
  local L3_288, L4_289, L5_290, L6_291
  L3_288 = GetTable
  L4_289 = A0_285
  L5_290 = A1_286.Src1VarTable
  L6_291 = false
  L3_288 = L3_288(L4_289, L5_290, L6_291)
  L4_289 = GetTable
  L5_290 = A0_285
  L6_291 = A1_286.Src2VarTable
  L4_289 = L4_289(L5_290, L6_291, false)
  L5_290 = false
  L6_291 = nil
  if L3_288 ~= nil and A1_286.Src1Var ~= nil then
    L6_291 = L3_288[A1_286.Src1Var]
  else
    L6_291 = A1_286.Value1
  end
  if L4_289 ~= nil and A1_286.Src2Var ~= nil then
    L5_290 = A1_286.CompareOp(L6_291, L4_289[A1_286.Src2Var])
  else
    L5_290 = A1_286.CompareOp(L6_291, A1_286.Value2)
  end
  if L5_290 then
    ExecuteBuildingBlocks(A2_287, A0_285)
    A0_285.LastIfSucceeded = true
  else
    A0_285.LastIfSucceeded = false
  end
end
BBIf = L0_0
function L0_0(A0_292, A1_293, A2_294)
  if A0_292.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_294, A0_292)
    A0_292.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_295, A1_296, A2_297)
  if A0_295.LastIfSucceeded == true then
    ExecuteBuildingBlocks(A2_297, A0_295)
    A0_295.LastIfSucceeded = true
  else
    BBIf(A0_295, A1_296, A2_297)
  end
end
BBOrIf = L0_0
function L0_0(A0_298, A1_299, A2_300)
  if A0_298.LastIfSucceeded == true then
    BBIf(A0_298, A1_299, A2_300)
  end
end
BBAndIf = L0_0
function L0_0(A0_301, A1_302, A2_303)
  local L3_304, L4_305, L5_306, L6_307
  L3_304 = A0_301.LastIfSucceeded
  if L3_304 == false then
    L3_304 = GetTable
    L4_305 = A0_301
    L5_306 = A1_302.Src1VarTable
    L6_307 = false
    L3_304 = L3_304(L4_305, L5_306, L6_307)
    L4_305 = GetTable
    L5_306 = A0_301
    L6_307 = A1_302.Src2VarTable
    L4_305 = L4_305(L5_306, L6_307, false)
    L5_306 = false
    L6_307 = nil
    if L3_304 ~= nil and A1_302.Src1Var ~= nil then
      L6_307 = L3_304[A1_302.Src1Var]
    else
      L6_307 = A1_302.Value1
    end
    if L4_305 ~= nil and A1_302.Src2Var ~= nil then
      L5_306 = A1_302.CompareOp(L6_307, L4_305[A1_302.Src2Var])
    else
      L5_306 = A1_302.CompareOp(L6_307, A1_302.Value2)
    end
    if L5_306 then
      ExecuteBuildingBlocks(A2_303, A0_301)
      A0_301.LastIfSucceeded = true
    else
      A0_301.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_308, A1_309, A2_310)
  local L3_311
  if A1_309.TargetVar ~= nil then
    L3_311 = A0_308[A1_309.TargetVar]
  else
    L3_311 = A0_308.Target
  end
  if HasBuffOfType(L3_311, A1_309.BuffType) then
    ExecuteBuildingBlocks(A2_310, A0_308)
    A0_308.LastIfSucceeded = true
  else
    A0_308.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_312, A1_313, A2_314)
  local L3_315, L4_316, L5_317
  L5_317 = GetParam
  L5_317 = L5_317("BuffName", A0_312, A1_313)
  if A1_313.OwnerVar ~= nil then
    L3_315 = A0_312[A1_313.OwnerVar]
  else
    L3_315 = A0_312.Owner
  end
  if A1_313.AttackerVar ~= nil then
    L4_316 = A0_312[A1_313.AttackerVar]
  else
    L4_316 = A0_312.Attacker
  end
  if SpellBuffCount(L3_315, L5_317, L4_316) > 0 then
    ExecuteBuildingBlocks(A2_314, A0_312)
    A0_312.LastIfSucceeded = true
  else
    A0_312.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_318, A1_319, A2_320)
  if BBIsMissileAutoAttack(A0_318, A1_319) then
    ExecuteBuildingBlocks(A2_320, A0_318)
    A0_318.LastIfSucceeded = true
  else
    A0_318.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_321, A1_322, A2_323)
  if BBIsMissileConsideredAsAutoAttack(A0_321, A1_322) then
    ExecuteBuildingBlocks(A2_323, A0_321)
    A0_321.LastIfSucceeded = true
  else
    A0_321.LastIfSucceeded = false
  end
end
BBIfMissileConsideredAsAutoAttack = L0_0
function L0_0(A0_324, A1_325)
  A0_324.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_326, A1_327, A2_328)
  local L3_329, L4_330
  if A1_327.OwnerVar ~= nil then
    L3_329 = A0_326[A1_327.OwnerVar]
  else
    L3_329 = A0_326.Owner
  end
  if A1_327.CasterVar ~= nil then
    L4_330 = A0_326[A1_327.CasterVar]
  else
    L4_330 = A0_326.Caster
  end
  if SpellBuffCount(L3_329, A1_327.BuffName, L4_330) <= 0 then
    ExecuteBuildingBlocks(A2_328, A0_326)
    A0_326.LastIfSucceeded = true
  else
    A0_326.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_331, A1_332, A2_333)
  local L3_334
  if A1_332.TargetVar ~= nil then
    L3_334 = A0_331[A1_332.TargetVar]
  else
    L3_334 = A0_331.Owner
  end
  if HasUnitTag(L3_334, A1_332.UnitTag) ~= A1_332.InvertResult then
    ExecuteBuildingBlocks(A2_333, A0_331)
    A0_331.LastIfSucceeded = true
  else
    A0_331.LastIfSucceeded = false
  end
end
BBIfHasUnitTag = L0_0
function L0_0(A0_335, A1_336, A2_337)
  local L3_338, L4_339
  L4_339 = A1_336.OwnerVar
  if L4_339 ~= nil then
    L4_339 = A1_336.OwnerVar
    L3_338 = A0_335[L4_339]
  else
    L3_338 = A0_335.Owner
  end
  L4_339 = GetParam
  L4_339 = L4_339("SpellSlot", A0_335, A1_336)
  if HasSpellTag(L3_338, L4_339, A1_336.SpellbookType, A1_336.SlotType, A1_336.SpellTag) ~= A1_336.InvertResult then
    ExecuteBuildingBlocks(A2_337, A0_335)
    A0_335.LastIfSucceeded = true
  else
    A0_335.LastIfSucceeded = false
  end
end
BBIfHasSpellTag = L0_0
function L0_0(A0_340, A1_341, A2_342)
  local L3_343, L4_344
  if A1_341.OwnerVar ~= nil then
    L3_343 = A0_340[A1_341.OwnerVar]
  else
    L3_343 = A0_340.Owner
  end
  if HasPARType(L3_343, A1_341.PARType) then
    ExecuteBuildingBlocks(A2_342, A0_340)
    A0_340.LastIfSucceeded = true
  else
    A0_340.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_345, A1_346, A2_347)
  local L3_348, L4_349
  if A1_346.OwnerVar ~= nil then
    L3_348 = A0_345[A1_346.OwnerVar]
  else
    L3_348 = A0_345.Owner
  end
  if not HasPARType(L3_348, A1_346.PARType) then
    ExecuteBuildingBlocks(A2_347, A0_345)
    A0_345.LastIfSucceeded = true
  else
    A0_345.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_350, A1_351, A2_352)
  local L3_353, L4_354, L5_355, L6_356, L7_357
  L3_353 = GetTable
  L4_354 = A0_350
  L5_355 = A1_351.Src1VarTable
  L6_356 = false
  L3_353 = L3_353(L4_354, L5_355, L6_356)
  L4_354 = GetTable
  L5_355 = A0_350
  L6_356 = A1_351.Src2VarTable
  L7_357 = false
  L4_354 = L4_354(L5_355, L6_356, L7_357)
  L5_355 = true
  while L5_355 do
    L6_356 = false
    L7_357 = nil
    if L3_353 ~= nil and A1_351.Src1Var ~= nil then
      L7_357 = L3_353[A1_351.Src1Var]
    else
      L7_357 = A1_351.Value1
    end
    if L4_354 ~= nil and A1_351.Src2Var ~= nil then
      L6_356 = A1_351.CompareOp(L7_357, L4_354[A1_351.Src2Var])
    else
      L6_356 = A1_351.CompareOp(L7_357, A1_351.Value2)
    end
    if L6_356 then
      ExecuteBuildingBlocks(A2_352, A0_350)
    else
      L5_355 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_358, A1_359, A2_360)
  local L3_361, L4_362, L5_363
  L3_361 = GetParam
  L4_362 = "Start"
  L5_363 = A0_358
  L3_361 = L3_361(L4_362, L5_363, A1_359)
  L4_362 = GetParam
  L5_363 = "End"
  L4_362 = L4_362(L5_363, A0_358, A1_359)
  L5_363 = L3_361
  while L4_362 >= L5_363 do
    SetVarInTable(A0_358, A1_359, L5_363)
    ExecuteBuildingBlocks(A2_360, A0_358)
    L5_363 = L5_363 + 1
  end
end
BBFor = L0_0
function L0_0(A0_364, A1_365)
  return A0_364 * A1_365
end
MO_MULTIPLY = L0_0
function L0_0(A0_366, A1_367)
  return A0_366 + A1_367
end
MO_ADD = L0_0
function L0_0(A0_368, A1_369)
  return A0_368 - A1_369
end
MO_SUBTRACT = L0_0
function L0_0(A0_370, A1_371)
  return A0_370 / A1_371
end
MO_DIVIDE = L0_0
function L0_0(A0_372, A1_373)
  return math.floor(A0_372 / A1_373)
end
MO_INT_DIVIDE = L0_0
function L0_0(A0_374, A1_375)
  if A0_374 < A1_375 then
    return A0_374
  else
    return A1_375
  end
end
MO_MIN = L0_0
function L0_0(A0_376, A1_377)
  if A1_377 < A0_376 then
    return A0_376
  else
    return A1_377
  end
end
MO_MAX = L0_0
function L0_0(A0_378, A1_379)
  return A0_378 % A1_379
end
MO_MODULO = L0_0
function L0_0(A0_380)
  return math.floor(A0_380 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_381)
  return math.ceil(A0_381)
end
MO_ROUNDUP = L0_0
function L0_0(A0_382)
  return math.floor(A0_382)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_383)
  return math.sin(math.rad(A0_383))
end
MO_SIN = L0_0
function L0_0(A0_384)
  return math.cos(math.rad(A0_384))
end
MO_COSINE = L0_0
function L0_0(A0_385)
  return math.tan(math.rad(A0_385))
end
MO_TANGENT = L0_0
function L0_0(A0_386)
  return math.deg(math.asin(A0_386))
end
MO_ASIN = L0_0
function L0_0(A0_387)
  return math.deg(math.acos(A0_387))
end
MO_ACOS = L0_0
function L0_0(A0_388)
  return math.deg(math.atan(A0_388))
end
MO_ATAN = L0_0
function L0_0(A0_389, A1_390)
  return math.pow(A0_389, A1_390)
end
MO_POW = L0_0
function L0_0(A0_391)
  return math.sqrt(A0_391)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_392, A1_393)
  local L2_394
  L2_394 = A0_392 and A1_393
  return L2_394
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_395, A1_396)
  local L2_397
  L2_397 = A0_395 or A1_396
  return L2_397
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_398)
  local L1_399
  L1_399 = not A0_398
  return L1_399
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_400)
  return math.abs(A0_400)
end
MO_ABS = L0_0
function L0_0(A0_401, A1_402)
  return math.random(A0_401, A1_402)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_403, A1_404)
  local L2_405, L3_406, L4_407, L5_408
  L2_405 = GetMathNumber
  L3_406 = A0_403
  L4_407 = A1_404.Src1VarTable
  L5_408 = A1_404.Src1Var
  L2_405 = L2_405(L3_406, L4_407, L5_408, A1_404.Src1Value)
  L3_406 = GetMathNumber
  L4_407 = A0_403
  L5_408 = A1_404.Src2VarTable
  L3_406 = L3_406(L4_407, L5_408, A1_404.Src2Var, A1_404.Src2Value)
  L4_407 = GetTable
  L5_408 = A0_403
  L4_407 = L4_407(L5_408, A1_404.DestVarTable)
  L5_408 = A1_404.MathOp
  L5_408 = L5_408(L2_405, L3_406)
  SetVarInTable(A0_403, A1_404, L5_408)
end
BBMath = L0_0
function L0_0(A0_409, A1_410, A2_411, A3_412)
  if A2_411 ~= nil and GetTable(A0_409, A1_410)[A2_411] ~= nil then
    return GetTable(A0_409, A1_410)[A2_411]
  end
  return A3_412
end
GetMathNumber = L0_0
function L0_0(A0_413, A1_414)
  if type(A1_414) == "number" then
    return A1_414
  elseif type(A1_414) == "function" then
    return A1_414(A0_413)
  elseif type(A1_414) == "string" then
    return A0_413[A1_414]
  end
end
GetNumber = L0_0
function L0_0(A0_415, A1_416)
  return VectorAdd(A0_415, A1_416)
end
VEC_ADD = L0_0
function L0_0(A0_417, A1_418)
  return VectorSubtract(A0_417, A1_418)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_419, A1_420)
  return VectorScalarMultiply(A0_419, A1_420)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_421, A1_422)
  return VectorScalarDivide(A0_421, A1_422)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_423, A1_424)
  return VectorRotateY(A0_423, A1_424)
end
VEC_ROTATE = L0_0
function L0_0(A0_425, A1_426)
  BBMath(A0_425, A1_426)
end
BBVectorMath = L0_0
function L0_0(A0_427, A1_428)
  rangeSize = GetMathNumber(A0_427, A1_428.RangeEndVarTable, A1_428.RangeEndVar, A1_428.RangeEnd) - GetMathNumber(A0_427, A1_428.RangeBeginVarTable, A1_428.RangeBeginVar, A1_428.RangeBegin)
  if rangeSize == 0 then
    ratio = 0
  else
    ratio = (GetMathNumber(A0_427, A1_428.ValueVarTable, A1_428.ValueVar, A1_428.Value) - GetMathNumber(A0_427, A1_428.RangeBeginVarTable, A1_428.RangeBeginVar, A1_428.RangeBegin)) / rangeSize
  end
  if A1_428.Clamp == true then
    if 0 > ratio then
      ratio = 0
    elseif ratio > 1 then
      ratio = 1
    end
  end
  GetTable(A0_427, A1_428.RatioVarTable)[A1_428.RatioVar] = ratio
end
BBInterpolateFromValue = L0_0
function L0_0(A0_429, A1_430)
  local L2_431, L3_432
  L2_431 = GetMathNumber
  L3_432 = A0_429
  L2_431 = L2_431(L3_432, A1_430.RangeBeginVarTable, A1_430.RangeBeginVar, A1_430.RangeBegin)
  L3_432 = GetMathNumber
  L3_432 = L3_432(A0_429, A1_430.RangeEndVarTable, A1_430.RangeEndVar, A1_430.RangeEnd)
  rangeSize = L3_432 - L2_431
  scaler = rangeSize * GetMathNumber(A0_429, A1_430.RatioVarTable, A1_430.RatioVar, A1_430.Ratio)
  if A1_430.Clamp == true then
    if GetMathNumber(A0_429, A1_430.RatioVarTable, A1_430.RatioVar, A1_430.Ratio) < 0 then
    else
    end
  end
  GetTable(A0_429, A1_430.ValueVarTable)[A1_430.ValueVar] = L3_432
end
BBInterpolateFromRatio = L0_0
function L0_0(A0_433, A1_434)
  local L2_435, L3_436, L4_437, L5_438
  L2_435 = A0_433.InstanceVars
  L3_436 = L2_435.InterpDelta
  if L3_436 == nil then
    L3_436 = A1_434.Amount
    L4_437 = A1_434.AmountVar
    if L4_437 ~= nil then
      L4_437 = GetTable
      L5_438 = A0_433
      L4_437 = L4_437(L5_438, A1_434.AmountVarTable)
      L5_438 = A1_434.AmountVar
      L3_436 = L4_437[L5_438]
    end
    L4_437 = GetPosition
    L5_438 = A1_434.TargetVar
    L5_438 = A0_433[L5_438]
    L4_437 = L4_437(L5_438)
    L2_435.KnockBackStart = L4_437
    L4_437 = GetNormalizedPositionDelta
    L5_438 = A1_434.TargetVar
    L5_438 = A0_433[L5_438]
    L4_437 = L4_437(L5_438, A0_433[A1_434.AttackerVar], true)
    L5_438 = {}
    L5_438.x = L4_437.x * L3_436
    L5_438.y = 0
    L5_438.z = L4_437.z * L3_436
    L2_435.InterpDelta = L5_438
    L5_438 = GetTime
    L5_438 = L5_438()
    L2_435.StartTime = L5_438
    L5_438 = A1_434.KnockBackDuration
    L2_435.KnockBackDuration = L5_438
  end
  L3_436 = A1_434.TargetVar
  L3_436 = A0_433[L3_436]
  L4_437 = GetTime
  L4_437 = L4_437()
  L5_438 = L2_435.StartTime
  L4_437 = L4_437 - L5_438
  L5_438 = L2_435.KnockBackDuration
  L4_437 = L4_437 / L5_438
  L5_438 = {}
  L5_438.x = L2_435.KnockBackStart.x + L2_435.InterpDelta.x * L4_437
  L5_438.y = L2_435.KnockBackStart.y
  L5_438.z = L2_435.KnockBackStart.z + L2_435.InterpDelta.z * L4_437
  SetPosition(L3_436, L5_438)
end
BBKnockback = L0_0
function L0_0(A0_439, A1_440)
  local L2_441, L3_442
  L2_441 = GetParam
  L3_442 = "Left"
  L2_441 = L2_441(L3_442, A0_439, A1_440)
  L3_442 = GetParam
  L3_442 = L3_442("Right", A0_439, A1_440)
  GetTable(A0_439, A1_440.DestVarTable, true)[A1_440.DestVar] = tostring(L2_441) .. tostring(L3_442)
end
BBAppendString = L0_0
function L0_0(A0_443, A1_444)
  local L2_445
  L2_445 = 0
  if A1_444.Delta ~= nil then
    L2_445 = L2_445 + A1_444.Delta
  end
  if A1_444.DeltaByLevel ~= nil and A0_443.Level ~= nil then
    L2_445 = L2_445 + A1_444.DeltaByLevel[A0_443.Level]
  end
  if A1_444.DeltaVar ~= nil then
    L2_445 = L2_445 + GetTable(A0_443, A1_444.DeltaVarTable, true)[A1_444.DeltaVar]
  end
  if A1_444.TargetVar ~= nil then
    A1_444.Stat(L2_445, A0_443[A1_444.TargetVar])
  else
    A1_444.Stat(L2_445)
  end
end
BBIncStat = L0_0
function L0_0(A0_446, A1_447)
  local L2_448
  L2_448 = 0
  if A1_447.Delta ~= nil then
    L2_448 = L2_448 + A1_447.Delta
  end
  if A1_447.DeltaByLevel ~= nil and A0_446.Level ~= nil then
    L2_448 = L2_448 + A1_447.DeltaByLevel[A0_446.Level]
  end
  if A1_447.DeltaVar ~= nil then
    L2_448 = L2_448 + GetTable(A0_446, A1_447.DeltaVarTable, true)[A1_447.DeltaVar]
  end
  if A1_447.TargetVar ~= nil then
    A1_447.Stat(L2_448, A0_446[A1_447.TargetVar])
  else
    A1_447.Stat(L2_448)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_449, A1_450)
  local L2_451, L3_452
  L2_451 = A1_450.TargetVar
  L3_452 = 0
  if A1_450.LaneVar ~= nil then
    L3_452 = L3_452 + GetTable(A0_449, A1_450.LaneVarTable, true)[A1_450.LaneVar]
  end
  if A1_450.Lane ~= nil then
    L3_452 = L3_452 + A1_450.Lane
  end
  SetMinionLane(A0_449[L2_451], L3_452)
end
BBSetMinionLane = L0_0
function L0_0(A0_453, A1_454)
  if A1_454.AttackVar ~= nil then
  end
  if A1_454.Attack ~= nil then
  end
  if A1_454.TotalCoefficientVar ~= nil then
  end
  if A1_454.TotalCoefficient ~= nil then
  end
  if A1_454.TargetVar ~= nil then
    GetTable(A0_453, A1_454.DestVarTable, false)[A1_454.DestVar] = (0 + GetTable(A0_453, A1_454.AttackVarTable, true)[A1_454.AttackVar] + A1_454.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_453[A1_454.TargetVar])) + GetFlatCritDamageMod(A0_453[A1_454.TargetVar])) * (0 + GetTable(A0_453, A1_454.TotalCoefficientVarTable, true)[A1_454.TotalCoefficientVar] + A1_454.TotalCoefficient)
  else
    GetTable(A0_453, A1_454.DestVarTable, false)[A1_454.DestVar] = 2 * A1_454.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_455, A1_456)
  local L2_457, L3_458, L4_459, L5_460, L6_461, L7_462
  L2_457 = GetTable
  L3_458 = A0_455
  L4_459 = A1_456.DestVarTable
  L5_460 = false
  L2_457 = L2_457(L3_458, L4_459, L5_460)
  L3_458 = GetTable
  L4_459 = A0_455
  L5_460 = A1_456.AmountVarTable
  L6_461 = true
  L3_458 = L3_458(L4_459, L5_460, L6_461)
  L4_459 = GetTable
  L5_460 = A0_455
  L6_461 = A0_455.NextBuffVars
  L7_462 = false
  L4_459 = L4_459(L5_460, L6_461, L7_462)
  L5_460 = A1_456.AmountVar
  L5_460 = L3_458[L5_460]
  L6_461 = A1_456.Amount
  L5_460 = L5_460 + L6_461
  L4_459.InitializeShield_Amount = L5_460
  L5_460 = A1_456.AmountVar
  if L5_460 ~= nil then
    L5_460 = A1_456.HealShieldMod
    if L5_460 ~= nil and L5_460 == true then
      L6_461 = A1_456.AttackerVar
      L7_462 = 0
      if L6_461 ~= nil then
        L7_462 = GetPercentHealingAmountMod(A0_455[L6_461])
      end
      L4_459.InitializeShield_Amount, L3_458[A1_456.AmountVar] = (A1_456.Amount + L3_458[A1_456.AmountVar]) * (1 + L7_462), (A1_456.Amount + L3_458[A1_456.AmountVar]) * (1 + L7_462)
    end
  end
  L5_460 = SpellBuffAddNoRenew
  L6_461 = A1_456.AttackerVar
  L6_461 = A0_455[L6_461]
  L7_462 = A1_456.UnitVar
  L7_462 = A0_455[L7_462]
  L5_460(L6_461, L7_462, "InitializeShieldMarker", 0, 1, 25000, L4_459)
  L5_460 = BBIncreaseShield
  L6_461 = A0_455
  L7_462 = A1_456
  L5_460(L6_461, L7_462)
end
BBInitializeShield = L0_0
function L0_0(A0_463, A1_464)
  if A1_464.CDVar ~= nil then
  end
  if A1_464.CD ~= nil then
  end
  if A1_464.TargetVar ~= nil then
    GetTable(A0_463, A1_464.DestVarTable, false)[A1_464.DestVar] = (0 + GetTable(A0_463, A1_464.CDVarTable, true)[A1_464.CDVar] + A1_464.CD) * (1 + GetPercentCooldownMod(A0_463[A1_464.TargetVar]))
  else
    GetTable(A0_463, A1_464.DestVarTable, false)[A1_464.DestVar] = A1_464.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_465, A1_466)
  local L2_467, L3_468
  L3_468 = A1_466.TargetVar
  if L3_468 ~= nil then
    L2_467 = A1_466.Stat(A0_465[L3_468])
  else
    L2_467 = A1_466.Stat()
  end
  SetVarInTable(A0_465, A1_466, L2_467)
end
BBGetStat = L0_0
function L0_0(A0_469, A1_470)
  if A1_470.TargetVar ~= nil then
    GetTable(A0_469, A1_470.DestVarTable, false)[A1_470.DestVar] = GetLevel(A0_469[A1_470.TargetVar])
  else
    GetTable(A0_469, A1_470.DestVarTable, false)[A1_470.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_471, A1_472)
  if A1_472.TargetVar ~= nil then
    GetTable(A0_471, A1_472.DestVarTable, false)[A1_472.DestVar] = GetUnitSignificance(A0_471[A1_472.TargetVar])
  else
    GetTable(A0_471, A1_472.DestVarTable, false)[A1_472.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_473, A1_474)
  if A1_474.TargetVar ~= nil then
    GetTable(A0_473, A1_474.DestVarTable, false)[A1_474.DestVar] = GetArmor(A0_473[A1_474.TargetVar])
  else
    GetTable(A0_473, A1_474.DestVarTable, false)[A1_474.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_475, A1_476)
  if A1_476.TargetVar ~= nil then
    GetTable(A0_475, A1_476.DestVarTable, false)[A1_476.DestVar] = GetSpellBlock(A0_475[A1_476.TargetVar])
  else
    GetTable(A0_475, A1_476.DestVarTable, false)[A1_476.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_477, A1_478)
  local L2_479, L3_480
  L3_480 = A1_478.TargetVar
  if L3_480 ~= nil then
    L2_479 = GetTeamID(A0_477[L3_480])
  else
    L2_479 = GetTeamID()
  end
  SetVarInTable(A0_477, A1_478, L2_479)
end
BBGetTeamID = L0_0
function L0_0(A0_481, A1_482)
  local L2_483, L3_484, L4_485
  L2_483 = GetTable
  L3_484 = A0_481
  L4_485 = A1_482.DestVarTable
  L2_483 = L2_483(L3_484, L4_485, false)
  L3_484 = A1_482.TargetVar
  L4_485 = nil
  if L3_484 ~= nil then
    L4_485 = GetTeamID(A0_481[L3_484])
  else
    L4_485 = GetTeamID()
  end
  if L4_485 == TEAM_ORDER then
    L2_483[A1_482.DestVar] = TEAM_CHAOS
  elseif L4_485 == TEAM_CHAOS then
    L2_483[A1_482.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_486, A1_487)
  if A1_487.TargetVar ~= nil then
    GetTable(A0_486, A1_487.DestVarTable, false)[A1_487.DestVar] = GetUnitSkinName(A0_486[A1_487.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_488, A1_489)
  local L2_490, L3_491, L4_492
  L2_490 = GetTable
  L3_491 = A0_488
  L4_492 = A1_489.DestVarTable
  L2_490 = L2_490(L3_491, L4_492, false)
  L3_491 = A0_488.Owner
  L4_492 = nil
  if A1_489.TargetVar ~= nil then
    L4_492 = GetTotalAttackDamage(A0_488[A1_489.TargetVar])
  else
    L4_492 = GetTotalAttackDamage()
  end
  SetVarInTable(A0_488, A1_489, L4_492)
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_493, A1_494)
  GetTable(A0_493, A1_494.DestVarTable, true)[A1_494.DestVar] = A1_494.Status(A0_493[A1_494.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_495, A1_496)
  local L2_497
  L2_497 = A1_496.TargetVar
  L2_497 = A0_495[L2_497]
  ClearAttackTarget(L2_497)
end
BBClearAttackTarget = L0_0
function L0_0(A0_498, A1_499)
  local L2_500, L3_501
  L2_500 = GetTable
  L3_501 = A0_498
  L2_500 = L2_500(L3_501, A1_499.DestVarTable, true)
  L3_501 = A1_499.Info
  L3_501 = L3_501(A0_498[A1_499.TargetVar])
  SetVarInTable(A0_498, A1_499, L3_501)
end
BBGetCastInfo = L0_0
function L0_0(A0_502, A1_503, A2_504)
  local L3_505, L4_506, L5_507, L6_508
  L3_505 = GetTable
  L4_506 = A0_502
  L5_507 = A1_503.TrackTimeVarTable
  L6_508 = false
  L3_505 = L3_505(L4_506, L5_507, L6_508)
  L4_506 = GetTime
  L4_506 = L4_506()
  L5_507 = A1_503.ExecuteImmediately
  L6_508 = GetParam
  L6_508 = L6_508("TimeBetweenExecutions", A0_502, A1_503)
  if A1_503.TickTimeVar ~= nil and GetTable(A0_502, A1_503.TickTimeVarTable, false)[A1_503.TickTimeVar] ~= nil then
    L6_508 = GetTable(A0_502, A1_503.TickTimeVarTable, false)[A1_503.TickTimeVar]
  end
  if L3_505[A1_503.TrackTimeVar] == nil then
    L3_505[A1_503.TrackTimeVar] = L4_506
    if L5_507 == true then
      ExecuteBuildingBlocks(A2_504, A0_502)
    end
  end
  if L4_506 >= L3_505[A1_503.TrackTimeVar] + L6_508 then
    L3_505[A1_503.TrackTimeVar] = L3_505[A1_503.TrackTimeVar] + L6_508
    ExecuteBuildingBlocks(A2_504, A0_502)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_509, A1_510, A2_511)
  GetTable(A0_509, A1_510.TrackTimeVarTable, false)[A1_510.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_512, A1_513)
  local L2_514
  L2_514 = A1_513.SrcValue
  if A1_513.SrcVar ~= nil then
    L2_514 = GetTable(A0_512, A1_513.SrcVarTable, true)[A1_513.SrcVar]
  end
  A1_513.Status(A0_512[A1_513.TargetVar], L2_514)
end
BBSetStatus = L0_0
function L0_0(A0_515, A1_516)
  local L2_517
  L2_517 = A1_516.ToAlert
  if GetTable(A0_515, A1_516.SrcVarTable, false) ~= nil and A1_516.SrcVar ~= nil then
    L2_517 = L2_517 .. GetTable(A0_515, A1_516.SrcVarTable, false)[A1_516.SrcVar]
  end
  _ALERT(L2_517)
end
BBAlert = L0_0
function L0_0(A0_518, A1_519)
  local L2_520, L3_521, L4_522, L5_523, L6_524, L7_525
  L2_520 = GetParam
  L3_521 = "Value"
  L4_522 = A0_518
  L5_523 = A1_519
  L2_520 = L2_520(L3_521, L4_522, L5_523)
  if L2_520 == nil then
    L3_521 = ReportError
    L4_522 = "Could not resolve Value param"
    L3_521(L4_522)
    return
  end
  L3_521 = true
  L4_522 = GetParam
  L5_523 = "OnUnit"
  L6_524 = A0_518
  L7_525 = A1_519
  L4_522 = L4_522(L5_523, L6_524, L7_525)
  if L4_522 == nil then
    L3_521 = false
    L5_523 = GetParam
    L6_524 = "OnUnitByFlag"
    L7_525 = A0_518
    L5_523 = L5_523(L6_524, L7_525, A1_519)
    L4_522 = L5_523
  end
  if L4_522 == nil then
    L5_523 = ReportError
    L6_524 = "Could not resolve OnUnit param"
    L5_523(L6_524)
    return
  end
  L5_523 = true
  L6_524 = GetParam
  L7_525 = "ChampionToSayTo"
  L6_524 = L6_524(L7_525, A0_518, A1_519)
  if L6_524 == nil then
    L5_523 = false
    L7_525 = GetParam
    L7_525 = L7_525("ChampionToSayToByFlag", A0_518, A1_519)
    L6_524 = L7_525
  end
  if L6_524 == nil then
    L7_525 = ReportError
    L7_525("Could not resolve ChampionToSayTo param")
    return
  end
  L7_525 = GetParam
  L7_525 = L7_525("ShowToSpectator", A0_518, A1_519)
  if L7_525 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  DisplayNumericFloatingTextOnUnitToChampion(L2_520, A1_519.TextType, L4_522, L3_521, L6_524, L5_523, L7_525)
end
BBDisplayNumericFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_526, A1_527)
  local L2_528, L3_529, L4_530, L5_531, L6_532, L7_533
  L2_528 = GetParam
  L3_529 = "Message"
  L4_530 = A0_526
  L5_531 = A1_527
  L2_528 = L2_528(L3_529, L4_530, L5_531)
  if L2_528 == nil then
    L3_529 = ReportError
    L4_530 = "Could not resolve Message param"
    L3_529(L4_530)
    return
  end
  L3_529 = true
  L4_530 = GetParam
  L5_531 = "OnUnit"
  L6_532 = A0_526
  L7_533 = A1_527
  L4_530 = L4_530(L5_531, L6_532, L7_533)
  if L4_530 == nil then
    L3_529 = false
    L5_531 = GetParam
    L6_532 = "OnUnitByFlag"
    L7_533 = A0_526
    L5_531 = L5_531(L6_532, L7_533, A1_527)
    L4_530 = L5_531
  end
  if L4_530 == nil then
    L5_531 = ReportError
    L6_532 = "Could not resolve OnUnit param"
    L5_531(L6_532)
    return
  end
  L5_531 = true
  L6_532 = GetParam
  L7_533 = "ChampionToSayTo"
  L6_532 = L6_532(L7_533, A0_526, A1_527)
  if L6_532 == nil then
    L5_531 = false
    L7_533 = GetParam
    L7_533 = L7_533("ChampionToSayToByFlag", A0_526, A1_527)
    L6_532 = L7_533
  end
  if L6_532 == nil then
    L7_533 = ReportError
    L7_533("Could not resolve ChampionToSayTo param")
    return
  end
  L7_533 = GetParam
  L7_533 = L7_533("ShowToSpectator", A0_526, A1_527)
  if L7_533 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  SayWithFloatingTextOnUnitToChampion(tostring(L2_528), A1_527.TextType, L4_530, L3_529, L6_532, L5_531, L7_533)
end
BBSayWithFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_534, A1_535)
  local L2_536, L3_537, L4_538
  L2_536 = A1_535.ToSay
  L3_537 = GetTable
  L4_538 = A0_534
  L3_537 = L3_537(L4_538, A1_535.SrcVarTable, false)
  if L3_537 ~= nil then
    L4_538 = A1_535.SrcVar
    if L4_538 ~= nil then
      L4_538 = L2_536
      L2_536 = L4_538 .. tostring(L3_537[A1_535.SrcVar])
    end
  end
  L4_538 = nil
  if A1_535.OwnerVar ~= nil then
    L4_538 = A0_534[A1_535.OwnerVar]
  else
    L4_538 = A0_534.Owner
  end
  if A1_535.TextType == nil then
    A1_535.TextType = 0
  end
  Say(L4_538, L2_536, A1_535.TextType)
end
BBSay = L0_0
function L0_0(A0_539, A1_540)
  local L2_541, L3_542, L4_543
  L2_541 = A1_540.ToSay
  L3_542 = GetTable
  L4_543 = A0_539
  L3_542 = L3_542(L4_543, A1_540.SrcVarTable, false)
  if L3_542 ~= nil then
    L4_543 = A1_540.SrcVar
    if L4_543 ~= nil then
      L4_543 = L2_541
      L2_541 = L4_543 .. tostring(L3_542[A1_540.SrcVar])
    end
  end
  L4_543 = nil
  if A1_540.OwnerVar ~= nil then
    L4_543 = A0_539[A1_540.OwnerVar]
  else
    L4_543 = A0_539.Owner
  end
  if A1_540.TextType == nil then
    A1_540.TextType = 0
  end
  Say(L4_543, L2_541, A1_540.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_544, A1_545)
  GetTable(A0_544, A1_545.DestVarTable, true)[A1_545.DestVar] = BBLuaGetGold(A0_544, A1_545)
end
BBGetGold = L0_0
function L0_0(A0_546, A1_547)
  GetTable(A0_546, A1_547.DestVarTable, true)[A1_547.DestVar] = BBLuaGetTotalGold(A0_546, A1_547)
end
BBGetTotalGold = L0_0
function L0_0(A0_548, A1_549)
  A0_548.CharVars.TeleportTargetPosition = GetTable(A0_548, A1_549.CastPositionNameTable)[A1_549.CastPositionName]
  SpellBuffAdd(A0_548[A1_549.OwnerVar], A0_548[A1_549.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_548.NextBuffVars)
  BBTeleportToPositionHelper(A0_548, A1_549)
end
BBTeleportToPosition = L0_0
function L0_0(A0_550, A1_551)
  if A1_551.XVar ~= nil and GetTable(A0_550, A1_551.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_550, A1_551.XVarTable, true)[A1_551.XVar]
  else
    Xloc = A1_551.X
  end
  if A1_551.YVar ~= nil and GetTable(A0_550, A1_551.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_550, A1_551.YVarTable, true)[A1_551.YVar]
  else
    Yloc = A1_551.Y
  end
  if A1_551.ZVar ~= nil and GetTable(A0_550, A1_551.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_550, A1_551.ZVarTable, true)[A1_551.ZVar]
  else
    Zloc = A1_551.Z
  end
  A1_551.OwnerVar, A0_550.position = A1_551.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_551.CastPositionName = "position"
  BBTeleportToPosition(A0_550, A1_551)
end
BBTeleportToPoint = L0_0
function L0_0(A0_552, A1_553)
  A1_553.TimeoutInFOW = 999999
  A1_553.BindFlexToOwnerPAR = false
  A1_553.Flags = 0
  A1_553.FollowsGroundTilt = false
  A1_553.FacesTarget = false
  A1_553.HideFromSpectator = false
  A1_553.SendIfOnScreenOrDiscard = false
  A1_553.PersistsThroughReconnect = true
  A1_553.FOWVisibilityRadius = 10
  A1_553.Scale = 1
  A1_553.BindObjectVar = A1_553.BindObject1Var
  A1_553.EffectID2Var = A1_553.OtherTeamEffectIDVar
  A1_553.TargetObjectVar = A1_553.BindObject2Var
  A1_553.FOWTeamOverrideVar = A1_553.FOWTeamVar
  A1_553.BoneName = A1_553.BindObject1BoneName
  A1_553.TargetBoneName = A1_553.BindObject2BoneName
  A1_553.EffectName = A1_553.EffectParticleFile
  A1_553.EffectNameForOtherTeam = A1_553.OtherTeamParticleFile
  BBSpellEffectCreate(A0_552, A1_553)
end
BBSpellEffectCreate_EasyBeam = L0_0
function L0_0(A0_554, A1_555)
  A1_555.TimeoutInFOW = 999999
  A1_555.BindFlexToOwnerPAR = false
  A1_555.Flags = 0
  A1_555.FollowsGroundTilt = false
  A1_555.FacesTarget = false
  A1_555.HideFromSpectator = false
  A1_555.SendIfOnScreenOrDiscard = true
  A1_555.PersistsThroughReconnect = false
  A1_555.FOWVisibilityRadius = 10
  A1_555.Scale = 1
  A1_555.FOWTeamOverrideVar = A1_555.FOWTeamVar
  A1_555.EffectName = A1_555.ParticleFile
  A1_555.EffectNameForOtherTeam = A1_555.ParticleFileForOtherTeam
  A1_555.BoneName = A1_555.BindObjectBoneName
  BBSpellEffectCreate(A0_554, A1_555)
end
BBSpellEffectCreate_EasyHit = L0_0
function L0_0(A0_556, A1_557)
  local L2_558, L3_559, L4_560, L5_561, L6_562, L7_563, L8_564, L9_565, L10_566, L11_567, L12_568
  L3_559 = A1_557.TargetVar
  if L3_559 ~= nil then
    L3_559 = A1_557.TargetVar
    L2_558 = A0_556[L3_559]
  else
    L2_558 = A0_556.Target
  end
  L3_559 = {
    L4_560,
    L5_561,
    L6_562
  }
  L4_560.maxSlot = 3
  L4_560.spellbook = L5_561
  L4_560.stype = L5_561
  L5_561.maxSlot = 6
  L5_561.spellbook = L6_562
  L5_561.stype = L6_562
  L6_562.maxSlot = 1
  L7_563 = SPELLBOOK_SUMMONER
  L6_562.spellbook = L7_563
  L7_563 = SpellSlots
  L6_562.stype = L7_563
  for L7_563, L8_564 in L4_560(L5_561) do
    A1_557.SpellbookType = L9_565
    A1_557.SlotType = L9_565
    for L12_568 = 0, L8_564.maxSlot do
      if HasSpellTag(L2_558, L12_568, A1_557.SpellbookType, A1_557.SlotType, A1_557.SpellTag) ~= A1_557.InvertResult then
        A1_557.SpellSlot = L12_568
        BBSealSpellSlot(A0_556, A1_557)
      end
    end
  end
end
BBSealSpellSlotsWithTag = L0_0
function L0_0(A0_569, A1_570)
  ReincarnateNonDeadHero(GetTable(A0_569, A1_570.TargetTable, false)[A1_570.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_571, A1_572)
  GetTable(A0_571, A1_572.DestVarTable, true)[A1_572.DestVar] = A1_572.Function(A0_571[A1_572.OwnerVar], A1_572.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_573, A1_574)
  local L2_575, L3_576, L4_577, L5_578
  L2_575 = A1_574.WhomToOrderVar
  L2_575 = A0_573[L2_575]
  L3_576 = A1_574.TargetOfOrderVar
  L3_576 = A0_573[L3_576]
  L4_577 = GetTable
  L5_578 = A0_573
  L4_577 = L4_577(L5_578, A1_574.SrcVarTable, false)
  L5_578 = nil
  if A1_574.SrcVar ~= nil and L4_577 ~= nil then
    L5_578 = L4_577[A1_574.SrcVar]
  else
    L5_578 = GetPosition(L3_576)
  end
  if L3_576 == nil then
    L3_576 = L2_575
  end
  IssueOrder(L2_575, A1_574.Order, L5_578, L3_576)
end
BBIssueOrder = L0_0
function L0_0(A0_579, A1_580)
  local L2_581
  L2_581 = GetParam
  L2_581 = L2_581("NewRange", A0_579, A1_580)
  SetSpellCastRange(L2_581)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_582, A1_583)
  GetTable(A0_582, A1_583.DestVarTable, true)[A1_583.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_584, A1_585)
  local L2_586, L3_587
  L2_586 = A1_585.ObjectVar1
  L2_586 = A0_584[L2_586]
  L3_587 = A1_585.ObjectVar2
  L3_587 = A0_584[L3_587]
  GetTable(A0_584, A1_585.DestVarTable, true)[A1_585.DestVar] = DistanceBetweenObjectBounds(L2_586, L3_587)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_588, A1_589)
  local L2_590, L3_591, L4_592
  L2_590 = A1_589.ObjectVar
  L2_590 = A0_588[L2_590]
  L3_591 = GetTable
  L4_592 = A0_588
  L3_591 = L3_591(L4_592, A1_589.PointVarTable, true)
  L4_592 = A1_589.PointVar
  L4_592 = L3_591[L4_592]
  GetTable(A0_588, A1_589.DestVarTable, true)[A1_589.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_590, L4_592)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_593, A1_594)
  local L2_595, L3_596
  L2_595 = GetParam
  L3_596 = "Point1"
  L2_595 = L2_595(L3_596, A0_593, A1_594)
  L3_596 = GetParam
  L3_596 = L3_596("Point2", A0_593, A1_594)
  GetTable(A0_593, A1_594.DestVarTable, true)[A1_594.DestVar] = DistanceBetweenPoints(L2_595, L3_596)
end
BBDistanceBetweenPoints = L0_0
function L0_0(A0_597, A1_598)
  local L2_599, L3_600
  L2_599 = GetParam
  L3_600 = "Point1"
  L2_599 = L2_599(L3_600, A0_597, A1_598)
  L3_600 = GetParam
  L3_600 = L3_600("Point2", A0_597, A1_598)
  GetTable(A0_597, A1_598.DestVarTable, true)[A1_598.DestVar] = DistanceBetweenPointsXZ(L2_599, L3_600)
end
BBDistanceBetweenPointsXZ = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_601, A1_602, A2_603)
  local L3_604, L4_605, L5_606, L6_607, L7_608, L8_609
  L5_606 = 0
  L6_607 = nil
  L7_608 = A1_602.ObjectDistanceType
  L8_609 = A1_602.ObjectVar1
  L3_604 = A0_601[L8_609]
  L8_609 = A1_602.ObjectVar2
  L4_605 = A0_601[L8_609]
  if nil == L4_605 then
    L8_609 = A1_602.Point2Var
    if nil ~= L8_609 then
      L8_609 = GetTable
      L8_609 = L8_609(A0_601, A1_602.Point2VarTable, true)
      L4_605 = L8_609[A1_602.Point2Var]
      L5_606 = L5_606 + 1
    end
  end
  if nil == L3_604 then
    L8_609 = A1_602.Point1Var
    if nil ~= L8_609 then
      L8_609 = GetTable
      L8_609 = L8_609(A0_601, A1_602.Point1VarTable, true)
      L3_604 = L8_609[A1_602.Point1Var]
      L5_606 = L5_606 + 1
      if 1 == L5_606 then
        L3_604, L4_605 = L4_605, L3_604
      end
    end
  end
  if nil ~= L7_608 then
    if 0 == L5_606 then
      L8_609 = OBJECT_CENTER
      if L8_609 == L7_608 then
        L6_607 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_609 = OBJECT_BOUNDARY
        if L8_609 == L7_608 then
          L6_607 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_609 = A1_602.OwnerVar
          L8_609 = A0_601[L8_609]
          Say(L8_609, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_606 then
      L8_609 = OBJECT_CENTER
      if L8_609 == L7_608 then
        L6_607 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_609 = OBJECT_BOUNDARY
        if L8_609 == L7_608 then
          L6_607 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_609 = A1_602.OwnerVar
          L8_609 = A0_601[L8_609]
          Say(L8_609, "invalid object distance type", 0)
        end
      end
    else
      L6_607 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_609 = A1_602.Distance
  if A1_602.DistanceVar ~= nil and GetTable(A0_601, A1_602.DistanceVarTable, true) ~= nil then
    L8_609 = L8_609 + GetTable(A0_601, A1_602.DistanceVarTable, true)[A1_602.DistanceVar]
  end
  if L3_604 ~= nil and L4_605 ~= nil and L6_607 ~= nil and L8_609 ~= nil then
    if not L6_607(L3_604, L4_605, L8_609) then
      ExecuteBuildingBlocks(A2_603, A0_601)
      A0_601.LastIfSucceeded = true
    else
      A0_601.LastIfSucceeded = false
    end
  else
    A0_601.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_610, A1_611)
  local L2_612, L3_613
  L2_612 = A1_611.TargetVar
  L2_612 = A0_610[L2_612]
  L3_613 = A1_611.CasterVar
  L3_613 = A0_610[L3_613]
  GetTable(A0_610, A1_611.DestVarTable, true)[A1_611.DestVar] = SpellBuffCount(L2_612, A1_611.BuffName, L3_613)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_614, A1_615)
  local L2_616
  L2_616 = A1_615.TargetVar
  L2_616 = A0_614[L2_616]
  GetTable(A0_614, A1_615.DestVarTable, true)[A1_615.DestVar] = SpellBuffCount(L2_616, A1_615.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_617, A1_618)
  local L2_619, L3_620
  L2_619 = GetTable
  L3_620 = A0_617
  L2_619 = L2_619(L3_620, A1_618.ScaleVarTable, false)
  L3_620 = nil
  if A1_618.OwnerVar ~= nil then
    L3_620 = A0_617[A1_618.OwnerVar]
  else
    L3_620 = A0_617.Owner
  end
  if A1_618.ScaleVar ~= nil and A1_618.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_619[A1_618.ScaleVar], L3_620)
  else
    SetScaleSkinCoef(A1_618.Scale, L3_620)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_621, A1_622)
  SpellBuffAdd(A0_621[A1_622.TargetVar], A0_621[A1_622.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_621.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_623, A1_624, A2_625)
  local L3_626, L4_627
  L3_626 = A1_624.TargetVar
  L3_626 = A0_623[L3_626]
  L4_627 = A1_624.NumStacks
  if GetParam("NumStacks", A0_623, A1_624) == 0 then
    L4_627 = SpellBuffCount(L3_626, A1_624.BuffName, caster)
  else
    L4_627 = GetParam("NumStacks", A0_623, A1_624)
  end
  while L4_627 > 0 do
    SpellBuffRemove(L3_626, A1_624.BuffName, A0_623[A1_624.AttackerVar])
    L4_627 = L4_627 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_628, A1_629)
  local L2_630, L3_631
  L2_630 = GetParam
  L3_631 = "Unit"
  L2_630 = L2_630(L3_631, A0_628, A1_629)
  unit = L2_630
  L2_630 = unit
  if L2_630 == nil then
    L2_630 = ReportError
    L3_631 = "Could not resolve Unit param"
    L2_630(L3_631)
    return
  end
  L2_630 = true
  L3_631 = GetParam
  L3_631 = L3_631("ChampionToShowTo", A0_628, A1_629)
  if L3_631 == nil then
    L2_630 = false
    L3_631 = GetParam("ChampionToShowToByFlag", A0_628, A1_629)
  end
  if L3_631 == nil then
    ReportError("Could not resolve ChampionToShowTo param")
    return
  end
  SetShowHealthBarToChampion(unit, A1_629.Show, L3_631, L2_630, A1_629.ApplyToSpectator)
end
BBSetShowHealthBarToChampion = L0_0
function L0_0(A0_632, A1_633)
  if GetParam("Vector", A0_632, A1_633) ~= nil then
    GetTable(A0_632, A1_633.DestVarTable, false)[A1_633.DestVar] = math.sqrt(GetParam("Vector", A0_632, A1_633).x * GetParam("Vector", A0_632, A1_633).x + GetParam("Vector", A0_632, A1_633).y * GetParam("Vector", A0_632, A1_633).y + GetParam("Vector", A0_632, A1_633).z * GetParam("Vector", A0_632, A1_633).z)
  end
end
BBGetVectorLength = L0_0
function L0_0(A0_634, A1_635, A2_636)
  if A0_634.EmoteId == A1_635.EmoteId then
    ExecuteBuildingBlocks(A2_636, A0_634)
    A0_634.LastIfSucceeded = true
  else
    A0_634.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_637, A1_638, A2_639)
  if A0_637.EmoteId ~= A1_638.EmoteId then
    ExecuteBuildingBlocks(A2_639, A0_637)
    A0_637.LastIfSucceeded = true
  else
    A0_637.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_640, A1_641)
  local L2_642, L3_643, L4_644, L5_645
  L2_642 = GetTable
  L3_643 = A0_640
  L4_644 = A1_641.String1VarTable
  L5_645 = false
  L2_642 = L2_642(L3_643, L4_644, L5_645)
  L3_643 = A1_641.String1Var
  L3_643 = L2_642[L3_643]
  L4_644 = GetTable
  L5_645 = A0_640
  L4_644 = L4_644(L5_645, A1_641.String2VarTable, false)
  L5_645 = A1_641.String2Var
  L5_645 = L4_644[L5_645]
  GetTable(A0_640, A1_641.ResultVarTable, false)[A1_641.ResultVar] = L3_643 .. L5_645
end
BBConcatenateStrings = L0_0
function L0_0(A0_646, A1_647)
  local L2_648, L3_649
  L2_648 = GetTable
  L3_649 = A0_646
  L2_648 = L2_648(L3_649, A1_647.VariableVarTable, false)
  L3_649 = A1_647.VariableVar
  L3_649 = L2_648[L3_649]
  GetTable(A0_646, A1_647.ResultVarTable, false)[A1_647.ResultVar] = "(" .. L3_649 .. ")"
end
BBEncaseInParantheses = L0_0
function L0_0(A0_650, A1_651)
  BBGetMinionKills(A0_650, A1_651)
  A0_650.MinionKillSource = GetParam("MinionKillTarget")
  A0_650.MinionKills = A0_650.MinionsKilled + GetParam("MinionKills", A0_650, A1_651)
  BBSetMinionKills(A0_650, A1_651)
end
BBIncreaseMinionKills = L0_0
function L0_0(A0_652, A1_653)
end
BBForcePreload = L0_0
