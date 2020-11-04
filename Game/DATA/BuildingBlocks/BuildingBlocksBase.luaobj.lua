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
  ExecuteBuildingBlocks(A0_27.FunctionSubBlocks, A0_27)
end
BBExecuteFunctionSubBlocks = L0_0
function L0_0(A0_29, A1_30)
  local L2_31, L3_32
  L2_31 = GetParam
  L3_32 = "Required"
  L2_31 = L2_31(L3_32, A0_29, A1_30)
  L3_32 = gDebugMode
  if L3_32 ~= nil and L2_31 == nil then
    L3_32 = ALREADY_WARNED
    L3_32 = L3_32[A1_30.RequiredVar]
    if L3_32 == nil then
      L3_32 = A1_30.RequiredVar
      if L3_32 ~= nil then
        L3_32 = A1_30.RequiredVarTable
        if L3_32 == nil then
          L3_32 = "PassThroughParams"
        end
        DebugClientPrint("Missing Required Variable: " .. L3_32 .. "." .. A1_30.RequiredVar .. " Current block data is: " .. tostring(gCurrentBuildingBlockString))
        ALREADY_WARNED[A1_30.RequiredVar] = true
      end
    end
  end
end
BBRequireVar = L0_0
L0_0 = {}
ALREADY_WARNED = L0_0
function L0_0(A0_33, A1_34, A2_35)
  ExecuteBuildingBlocks(A2_35, A0_33)
end
BBCom = L0_0
function L0_0(A0_36, A1_37, A2_38)
  if A1_37.IsConditionTrue(A0_36) then
    ExecuteBuildingBlocks(A2_38, A0_36)
  end
end
BBConditionallyExecute = L0_0
function L0_0(A0_39, A1_40)
  local L2_41, L3_42
  L2_41 = GetTable
  L3_42 = A0_39
  L2_41 = L2_41(L3_42, A1_40.SrcVarTable, false)
  L3_42 = A1_40.ToSay
  L3_42 = L3_42 or ""
  DebugClientPrint(tostring(L3_42) .. ": " .. type(L2_41[A1_40.SrcVar]))
end
BBPrintTypeToChat = L0_0
function L0_0(A0_43, A1_44)
  local L2_45, L3_46, L4_47, L5_48, L6_49
  L2_45 = A1_44.ToSay
  L2_45 = L2_45 or ""
  L3_46 = A1_44.Color
  L3_46 = L3_46 or "FFFFFF"
  L4_47 = GetTable
  L5_48 = A0_43
  L6_49 = A1_44.SrcVarTable
  L4_47 = L4_47(L5_48, L6_49, false)
  L5_48 = A1_44.SrcVar
  L5_48 = L4_47[L5_48]
  L6_49 = "<font color=\""
  L6_49 = L6_49 .. L3_46 .. "\">"
  if L2_45 == "" then
    if A1_44.SrcVarTable ~= nil then
      L6_49 = L6_49 .. "(DEBUG) " .. A1_44.SrcVarTable .. "." .. (A1_44.SrcVar or "")
    else
      L6_49 = L6_49 .. "(DEBUG) " .. (A1_44.SrcVar or "")
    end
  else
    L6_49 = L6_49 .. "(DEBUG) " .. L2_45
  end
  if type(L5_48) ~= "table" and type(L5_48) ~= "nil" then
    L6_49 = L6_49 .. " " .. tostring(L5_48)
  end
  L6_49 = L6_49 .. "</font>"
  DebugClientPrint(L6_49)
  if type(L5_48) == "table" then
    PrintTableToChat(L5_48)
  end
end
BBPrintToChat = L0_0
function L0_0(A0_50, A1_51)
  local L2_52, L3_53
  L2_52 = GetTable
  L3_53 = A0_50
  L2_52 = L2_52(L3_53, A1_51.TableName, true)
  L3_53 = A1_51.TableName
  L3_53 = L3_53 or "PassThroughParams"
  DebugClientPrint(L3_53)
  PrintTableToChat(L2_52)
end
BBPrintTableToChat = L0_0
function L0_0(A0_54, A1_55)
  local L2_56, L3_57, L4_58, L5_59, L6_60, L7_61, L8_62, L9_63, L10_64, L11_65, L12_66, L13_67
  A1_55 = A1_55 or 0
  if A1_55 > 10 then
    return
  end
  L2_56 = nil
  L3_57 = "|"
  for L7_61 = 1, A1_55 do
    L9_63 = "----"
    L3_57 = L8_62 .. L9_63
  end
  L6_60(L7_61)
  for L9_63, L10_64 in L6_60(L7_61) do
    L11_65 = nil
    L12_66 = tostring
    L13_67 = L9_63
    L12_66 = L12_66(L13_67)
    if L12_66 == "PassThroughParams" then
      L11_65 = "{{ PassThroughParams }}"
    else
      L13_67 = type
      L13_67 = L13_67(L10_64)
      if L13_67 == "table" then
        L11_65 = "Table"
      else
        L13_67 = tostring
        L13_67 = L13_67(L10_64)
        L11_65 = L13_67
      end
    end
    L13_67 = L3_57
    L13_67 = L13_67 .. L12_66 .. ": " .. L11_65
    DebugClientPrint(L13_67)
    if type(L10_64) == "table" then
      PrintTableToChat(L10_64, A1_55 + 1)
    end
  end
  L6_60(L7_61)
end
PrintTableToChat = L0_0
function L0_0(A0_68, A1_69)
end
BBDebugPrintToChat = L0_0
function L0_0(A0_70, A1_71)
  local L2_72, L3_73
  L2_72 = GetTable
  L3_73 = A0_70
  L2_72 = L2_72(L3_73, A1_71.TableName, true)
  L3_73 = A1_71.TableName
  L3_73 = L3_73 or "PassThroughParams"
  DebugClientPrint(L3_73)
  DebugPrintTableToChat(L2_72)
end
BBDebugPrintTableToChat = L0_0
function L0_0(A0_74, A1_75)
  local L2_76, L3_77, L4_78, L5_79, L6_80, L7_81, L8_82, L9_83, L10_84, L11_85, L12_86, L13_87
  A1_75 = A1_75 or 0
  if A1_75 > 10 then
    return
  end
  L2_76 = nil
  L3_77 = "|"
  for L7_81 = 1, A1_75 do
    L9_83 = "----"
    L3_77 = L8_82 .. L9_83
  end
  L6_80(L7_81)
  for L9_83, L10_84 in L6_80(L7_81) do
    L11_85 = nil
    L12_86 = tostring
    L13_87 = L9_83
    L12_86 = L12_86(L13_87)
    if L12_86 == "PassThroughParams" then
      L11_85 = "{{ PassThroughParams }}"
    else
      L13_87 = type
      L13_87 = L13_87(L10_84)
      if L13_87 == "table" then
        L11_85 = "Table"
      else
        L13_87 = tostring
        L13_87 = L13_87(L10_84)
        L11_85 = L13_87
      end
    end
    L13_87 = L3_77
    L13_87 = L13_87 .. L12_86 .. ": " .. L11_85
    DebugClientPrint(L13_87)
    if type(L10_84) == "table" then
      DebugPrintTableToChat(L10_84, A1_75 + 1)
    end
  end
  L6_80(L7_81)
end
DebugPrintTableToChat = L0_0
function L0_0(A0_88, A1_89, A2_90)
  local L3_91
  if A1_89 ~= nil then
    L3_91 = A0_88[A1_89]
    if L3_91 == nil and A2_90 then
      A0_88[A1_89] = {}
      return A0_88[A1_89]
    end
  end
  if L3_91 == nil then
    L3_91 = A0_88
  end
  return L3_91
end
GetTable = L0_0
function L0_0(A0_92, A1_93, A2_94)
  local L3_95
  if A1_93 == "PassThroughParams" then
    return A0_92
  end
  if A1_93 ~= nil then
    L3_95 = A0_92[A1_93]
    if L3_95 == nil and A2_94 then
      A0_92[A1_93] = {}
      return A0_92[A1_93]
    end
  end
  if L3_95 == nil then
    L3_95 = A0_92
  end
  return L3_95
end
GetTable2 = L0_0
function L0_0(A0_96, A1_97, A2_98)
  if A2_98[A0_96 .. "Var"] ~= nil and GetTable(A1_97, A2_98[A0_96 .. "VarTable"], false) ~= nil then
    return GetTable(A1_97, A2_98[A0_96 .. "VarTable"], false)[A2_98[A0_96 .. "Var"]]
  else
    return A2_98[A0_96]
  end
end
GetParam = L0_0
function L0_0(A0_99, A1_100)
  GetTable(A0_99, A1_100.DestVarTable, true)[A1_100.DestVar] = {}
end
BBCreateCustomTable = L0_0
function L0_0(A0_101, A1_102)
  GetTable(A0_101, A1_102.TableNameVarTable, false)[A1_102.TableNameVar] = nil
end
BBDestroyCustomTable = L0_0
function L0_0(A0_103, A1_104)
  if type(GetTable(A0_103, A1_104.DestTableVarTable, false)[A1_104.DestTableVar]) == "nil" then
    GetTable(A0_103, A1_104.DestTableVarTable, false)[A1_104.DestTableVar] = {}
  end
  if type(GetTable(A0_103, A1_104.DestTableVarTable, false)[A1_104.DestTableVar]) == "table" then
    GetTable(A0_103, A1_104.DestTableVarTable, false)[A1_104.DestTableVar][GetParam("Key", A0_103, A1_104)] = GetParam("Value", A0_103, A1_104)
  end
end
BBSetKeyValueInCustomTable = L0_0
function L0_0(A0_105, A1_106)
  if type(GetTable(A0_105, A1_106.SrcTableVarTable, false)[A1_106.SrcTableVar]) == "table" then
    GetTable(A0_105, A1_106.DestVarTable, true)[A1_106.DestVar] = GetTable(A0_105, A1_106.SrcTableVarTable, false)[A1_106.SrcTableVar][GetParam("SrcKey", A0_105, A1_106)]
  end
end
BBGetKeyValueInCustomTable = L0_0
function L0_0(A0_107, A1_108)
  local L2_109, L3_110, L4_111
  L2_109 = GetTable
  L3_110 = A0_107
  L4_111 = A1_108.DestTableVarTable
  L2_109 = L2_109(L3_110, L4_111, false)
  L3_110 = GetParam
  L4_111 = "DestIndex"
  L3_110 = L3_110(L4_111, A0_107, A1_108)
  L4_111 = GetParam
  L4_111 = L4_111("Value", A0_107, A1_108)
  if type(L2_109[A1_108.DestTableVar]) == "nil" then
    L2_109[A1_108.DestTableVar] = {}
  end
  if type(L2_109[A1_108.DestTableVar]) == "table" then
    if L3_110 then
      table.insert(L2_109[A1_108.DestTableVar], L3_110, L4_111)
      if A1_108.OutIndexVar then
        GetTable(A0_107, A1_108.OutIndexVarTable, true)[A1_108.OutIndexVar] = L3_110
      end
    else
      table.insert(L2_109[A1_108.DestTableVar], L4_111)
      if A1_108.OutIndexVar then
        GetTable(A0_107, A1_108.OutIndexVarTable, true)[A1_108.OutIndexVar] = table.getn(L2_109[A1_108.DestTableVar])
      end
    end
  end
end
BBInsertIntoInCustomTable = L0_0
function L0_0(A0_112, A1_113)
  local L2_114, L3_115
  L2_114 = GetTable
  L3_115 = A0_112
  L2_114 = L2_114(L3_115, A1_113.TableVarTable, false)
  L3_115 = GetParam
  L3_115 = L3_115("Index", A0_112, A1_113)
  if type(L2_114[A1_113.TableVar]) == "nil" then
    DebugClientPrint("Table specified does not exist: " .. tostring(A1_113.TableVarTable) .. "." .. tostring(A1_113.TableVar))
    return
  end
  if type(L2_114[A1_113.TableVar]) == "table" then
    if GetParam("Key", A0_112, A1_113) then
      L2_114[A1_113.TableVar][GetParam("Key", A0_112, A1_113)] = nil
    elseif L3_115 then
      table.remove(L2_114[A1_113.TableVar], L3_115)
    else
      DebugClientPrint("Specified index/key was nil: " .. tostring(A1_113.IndexVarTable) .. "." .. tostring(A1_113.IndexVar))
    end
  end
end
BBRemoveFromCustomTable = L0_0
function L0_0(A0_116, A1_117, A2_118)
  local L3_119, L4_120, L5_121, L6_122, L7_123, L8_124
  L3_119 = GetTable
  L3_119 = L3_119(L4_120, L5_121, L6_122)
  if L4_120 == "table" then
    if L4_120 then
      for L8_124, _FORV_9_ in L5_121(L6_122) do
        table.insert(L4_120, L8_124)
      end
      L5_121(L6_122)
      for L8_124, _FORV_9_ in L5_121(L6_122) do
        GetTable(A0_116, A1_117.DestKeyVarTable, true)[A1_117.DestKeyVar] = _FORV_9_
        GetTable(A0_116, A1_117.DestValueVarTable, true)[A1_117.DestValueVar] = L3_119[A1_117.TableVar][_FORV_9_]
        ExecuteBuildingBlocks(A2_118, A0_116)
      end
    else
      for L7_123, L8_124 in L4_120(L5_121) do
        GetTable(A0_116, A1_117.DestKeyVarTable, true)[A1_117.DestKeyVar] = L7_123
        GetTable(A0_116, A1_117.DestValueVarTable, true)[A1_117.DestValueVar] = L8_124
        ExecuteBuildingBlocks(A2_118, A0_116)
      end
    end
  end
end
BBForEachInCustomTable = L0_0
function L0_0(A0_125, A1_126)
  local L2_127, L3_128, L4_129, L5_130, L6_131
  L2_127 = GetTable
  L3_128 = A0_125
  L4_129 = A1_126.SrcTableVarTable
  L5_130 = false
  L2_127 = L2_127(L3_128, L4_129, L5_130)
  L3_128 = GetParam
  L4_129 = "Value"
  L5_130 = A0_125
  L6_131 = A1_126
  L3_128 = L3_128(L4_129, L5_130, L6_131)
  L4_129 = GetTable
  L5_130 = A0_125
  L6_131 = A1_126.MatchingKeyVarTable
  L4_129 = L4_129(L5_130, L6_131, false)
  L5_130 = GetTable
  L6_131 = A0_125
  L5_130 = L5_130(L6_131, A1_126.WasFoundVarTable, false)
  L6_131 = A1_126.WasFoundVar
  L5_130[L6_131] = false
  L6_131 = type
  L6_131 = L6_131(L2_127[A1_126.SrcTableVar])
  if L6_131 == "table" then
    L6_131 = GetTable
    L6_131 = L6_131(A0_125, A1_126.DestVarTable, true)
    for _FORV_10_, _FORV_11_ in pairs(L6_131) do
      if _FORV_11_ == L3_128 then
        L5_130[A1_126.WasFoundVar] = true
        L4_129[A1_126.MatchingKeyVar] = _FORV_10_
      end
    end
  end
end
BBCustomTableContainsValue = L0_0
function L0_0(A0_132, A1_133, A2_134)
  for _FORV_9_, _FORV_10_ in pairs(GetTable(A0_132, A1_133.TableVarTable, false)[A1_133.TableVar]) do
  end
  GetTable(A0_132, A1_133.SizeVarTable, false)[A1_133.SizeVar] = 0 + 1
end
BBGetSizeOfCustomTable = L0_0
function L0_0(A0_135, A1_136, A2_137, A3_138)
  local L4_139
  L4_139 = GetParam
  L4_139 = L4_139("Unit", A0_135, A1_136)
  if L4_139 ~= nil then
    A1_136.DestPos = GetPosition(L4_139)
    A1_136.DestPosVar = "__TempDestPos"
    GetTable(A0_135, A1_136.DestPosVarTable, false)[A1_136.DestPosVar] = GetPosition(L4_139)
  end
  A1_136.RegionGroup = A2_137
  BBGetRegionTag(A0_135, A1_136)
  for _FORV_11_, _FORV_12_ in ipairs(A3_138) do
  end
  return true
end
CheckIfUnitOrPointIsInRegionTagList = L0_0
function L0_0(A0_140, A1_141)
  local L2_142, L3_143
  L2_142 = GameplayLane
  L3_143 = {
    LANE_Top_Order,
    LANE_Mid_Order,
    LANE_Bot_Order
  }
  resultTable = GetTable(A0_140, A1_141.ResultVarTable, false)
  resultTable[A1_141.ResultVar] = CheckIfUnitOrPointIsInRegionTagList(A0_140, A1_141, L2_142, L3_143)
end
BBGetIsOrderSide = L0_0
function L0_0(A0_144, A1_145)
  local L2_146, L3_147
  L2_146 = GameplayArea
  L3_147 = {AREA_Jungle_Top, AREA_Jungle_Bot}
  resultTable = GetTable(A0_144, A1_145.ResultVarTable, false)
  resultTable[A1_145.ResultVar] = CheckIfUnitOrPointIsInRegionTagList(A0_144, A1_145, L2_146, L3_147)
end
BBGetIsJungle = L0_0
function L0_0(A0_148, A1_149)
  local L2_150, L3_151
  L2_150 = GameplayArea
  L3_151 = {
    AREA_Lane_Top,
    AREA_Lane_Mid,
    AREA_Lane_Bot
  }
  resultTable = GetTable(A0_148, A1_149.ResultVarTable, false)
  resultTable[A1_149.ResultVar] = CheckIfUnitOrPointIsInRegionTagList(A0_148, A1_149, L2_150, L3_151)
end
BBGetIsLane = L0_0
function L0_0(A0_152, A1_153)
  local L2_154, L3_155
  L2_154 = GameplayArea
  L3_155 = {AREA_River_Top, AREA_River_Bot}
  resultTable = GetTable(A0_152, A1_153.ResultVarTable, false)
  resultTable[A1_153.ResultVar] = CheckIfUnitOrPointIsInRegionTagList(A0_152, A1_153, L2_154, L3_155)
end
BBGetIsRiver = L0_0
function L0_0(A0_156, A1_157)
  local L2_158, L3_159
  L2_158 = GameplayArea
  L3_159 = {AREA_BasePerimeter_Top, AREA_BasePerimeter_Bot}
  resultTable = GetTable(A0_156, A1_157.ResultVarTable, false)
  resultTable[A1_157.ResultVar] = CheckIfUnitOrPointIsInRegionTagList(A0_156, A1_157, L2_158, L3_159)
end
BBGetIsBasePerimeter = L0_0
function L0_0(A0_160, A1_161)
  local L2_162, L3_163, L4_164, L5_165
  L2_162 = GameplayLane
  L3_163 = {L4_164, L5_165}
  L4_164 = LANE_Top_Order
  L5_165 = LANE_Top_Chaos
  L4_164 = {L5_165, LANE_Mid_Chaos}
  L5_165 = LANE_Mid_Order
  L5_165 = {LANE_Bot_Order, LANE_Bot_Chaos}
  if CheckIfUnitOrPointIsInRegionTagList(A0_160, A1_161, L2_162, L3_163) then
  elseif CheckIfUnitOrPointIsInRegionTagList(A0_160, A1_161, L2_162, L4_164) then
  elseif CheckIfUnitOrPointIsInRegionTagList(A0_160, A1_161, L2_162, L5_165) then
  end
  resultTable = GetTable(A0_160, A1_161.ResultVarTable, false)
  resultTable[A1_161.ResultVar] = 0
end
BBGetNearestLane = L0_0
function L0_0(A0_166, A1_167)
  local L2_168, L3_169, L4_170, L5_171, L6_172, L7_173, L8_174, L9_175
  L2_168 = GetParam
  L3_169 = "Unit"
  L4_170 = A0_166
  L5_171 = A1_167
  L2_168 = L2_168(L3_169, L4_170, L5_171)
  L3_169 = GetParam
  L4_170 = "X"
  L5_171 = A0_166
  L6_172 = A1_167
  L3_169 = L3_169(L4_170, L5_171, L6_172)
  L4_170 = GetParam
  L5_171 = "Z"
  L6_172 = A0_166
  L7_173 = A1_167
  L4_170 = L4_170(L5_171, L6_172, L7_173)
  if L2_168 ~= nil then
    L5_171 = GetPosition
    L6_172 = L2_168
    L5_171 = L5_171(L6_172)
    L3_169 = L5_171.x
    L4_170 = L5_171.z
  end
  L5_171 = 2
  L6_172 = 1
  L7_173 = 0
  L8_174 = 4
  L9_175 = 3
  if L4_170 > 12250 then
  elseif L4_170 < 2650 then
  elseif L3_169 > 12250 then
  elseif L3_169 < 2650 then
  elseif L4_170 - L3_169 > 4500 then
  else
  end
  if L4_170 > 13000 then
  elseif L4_170 < 1800 then
  elseif L3_169 > 13000 then
  elseif L3_169 < 1800 then
  elseif L4_170 - L3_169 > 1150 then
  else
  end
  GetTable(A0_166, A1_167.NearLaneVarTable, false)[A1_167.NearLaneVar] = L7_173
  GetTable(A0_166, A1_167.NearSectionVarTable, false)[A1_167.NearSectionVar] = L9_175
  GetTable(A0_166, A1_167.BlueSideVarTable, false)[A1_167.BlueSideVar] = true
end
BBGetLocationHints = L0_0
function L0_0(A0_176, A1_177)
  local L2_178, L3_179, L4_180, L5_181
  L2_178 = GetTable
  L3_179 = A0_176
  L4_180 = A1_177.DestVarTable
  L5_181 = true
  L2_178 = L2_178(L3_179, L4_180, L5_181)
  L3_179 = nil
  L4_180 = GetTable
  L5_181 = A0_176
  L4_180 = L4_180(L5_181, A1_177.SpellSlotVarTable, false)
  L5_181 = A1_177.SpellSlotVar
  if L5_181 ~= nil and L4_180 ~= nil then
    L5_181 = A1_177.SpellSlotVar
    L3_179 = L4_180[L5_181]
  else
    L3_179 = A1_177.SpellSlotValue
  end
  L5_181 = A1_177.Function
  L5_181 = L5_181(A0_176[A1_177.OwnerVar], L3_179, A1_177.SpellbookType, A1_177.SlotType)
  SetVarInTable(A0_176, A1_177, L5_181)
end
BBGetSlotSpellInfo = L0_0
function L0_0(A0_182, A1_183)
  local L2_184, L3_185, L4_186
  L2_184 = GetTable
  L3_185 = A0_182
  L4_186 = A1_183.SrcVarTable
  L2_184 = L2_184(L3_185, L4_186, false)
  L3_185 = nil
  L4_186 = A1_183.SrcVar
  if L4_186 ~= nil and L2_184 ~= nil then
    L4_186 = A1_183.SrcVar
    L3_185 = L2_184[L4_186]
  else
    L3_185 = A1_183.SrcValue
  end
  L4_186 = nil
  if A1_183.SpellSlotVar ~= nil and GetTable(A0_182, A1_183.SpellSlotVarTable, false) ~= nil then
    L4_186 = GetTable(A0_182, A1_183.SpellSlotVarTable, false)[A1_183.SpellSlotVar]
  else
    L4_186 = A1_183.SpellSlotValue
  end
  SetSlotSpellCooldownTime(A0_182[A1_183.OwnerVar], L4_186, A1_183.SpellbookType, A1_183.SlotType, L3_185)
end
BBSetSlotSpellCooldownTime = L0_0
function L0_0(A0_187, A1_188)
  if A0_187.Level ~= nil and A1_188.SrcValueByLevel ~= nil then
    A0_187.ReturnValue = A1_188.SrcValueByLevel[A0_187.Level]
  elseif A1_188.SrcVar ~= nil and GetTable(A0_187, A1_188.SrcVarTable, false) ~= nil then
    A0_187.ReturnValue = GetTable(A0_187, A1_188.SrcVarTable, false)[A1_188.SrcVar]
  else
    A0_187.ReturnValue = A1_188.SrcValue
  end
end
BBSetReturnValue = L0_0
function L0_0(A0_189, A1_190)
  A0_189.ReturnValue = true
end
BBCancelOrderBeforeIssued = L0_0
function L0_0(A0_191, A1_192)
  if type(A0_191) == "string" and type(A1_192) == "string" then
    A0_191 = string.lower(A0_191)
    A1_192 = string.lower(A1_192)
  end
  return A0_191 == A1_192
end
CO_EQUAL = L0_0
function L0_0(A0_193, A1_194)
  if type(A0_193) == "string" and type(A1_194) == "string" then
    A0_193 = string.lower(A0_193)
    A1_194 = string.lower(A1_194)
  end
  return A0_193 ~= A1_194
end
CO_NOT_EQUAL = L0_0
function L0_0(A0_195, A1_196)
  local L2_197
  L2_197 = A0_195 < A1_196
  return L2_197
end
CO_LESS_THAN = L0_0
function L0_0(A0_198, A1_199)
  local L2_200
  L2_200 = A1_199 < A0_198
  return L2_200
end
CO_GREATER_THAN = L0_0
function L0_0(A0_201, A1_202)
  local L2_203
  L2_203 = A0_201 <= A1_202
  return L2_203
end
CO_LESS_THAN_OR_EQUAL = L0_0
function L0_0(A0_204, A1_205)
  local L2_206
  L2_206 = A1_205 <= A0_204
  return L2_206
end
CO_GREATER_THAN_OR_EQUAL = L0_0
function L0_0(A0_207, A1_208)
  return GetTeamID(A0_207) == GetTeamID(A1_208)
end
CO_SAME_TEAM = L0_0
function L0_0(A0_209, A1_210)
  return GetTeamID(A0_209) ~= GetTeamID(A1_210)
end
CO_DIFFERENT_TEAM = L0_0
function L0_0(A0_211, A1_212)
  return GetSourceType() == A1_212 or GetSourceType() == A0_211
end
CO_DAMAGE_SOURCETYPE_IS = L0_0
function L0_0(A0_213, A1_214)
  return GetSourceType() ~= A1_214 and GetSourceType() ~= A0_213
end
CO_DAMAGE_SOURCETYPE_IS_NOT = L0_0
function L0_0(A0_215)
  return IsObjectAI(A0_215)
end
CO_IS_TYPE_AI = L0_0
function L0_0(A0_216)
  return IsObjectAI(A0_216) ~= true
end
CO_IS_NOT_AI = L0_0
function L0_0(A0_217)
  return IsObjectHero(A0_217)
end
CO_IS_TYPE_HERO = L0_0
function L0_0(A0_218)
  return IsObjectHero(A0_218) ~= true
end
CO_IS_NOT_HERO = L0_0
function L0_0(A0_219)
  return IsObjectMarker(A0_219)
end
CO_IS_TYPE_MARKER = L0_0
function L0_0(A0_220)
  return IsObjectMarker(A0_220) ~= true
end
CO_IS_NOT_MARKER = L0_0
function L0_0(A0_221)
  return IsClone(A0_221)
end
CO_IS_CLONE = L0_0
function L0_0(A0_222)
  return IsClone(A0_222) ~= true
end
CO_IS_NOT_CLONE = L0_0
function L0_0(A0_223)
  return IsMelee(A0_223)
end
CO_IS_MELEE = L0_0
function L0_0(A0_224)
  return IsMelee(A0_224) ~= true
end
CO_IS_RANGED = L0_0
function L0_0(A0_225)
  return A0_225 > math.random()
end
CO_RANDOM_CHANCE_LESS_THAN = L0_0
function L0_0(A0_226)
  return IsTurretAI(A0_226)
end
CO_IS_TYPE_TURRET = L0_0
function L0_0(A0_227)
  return IsTurretAI(A0_227) ~= true
end
CO_IS_NOT_TURRET = L0_0
function L0_0(A0_228)
  return IsDampener(A0_228)
end
CO_IS_TYPE_INHIBITOR = L0_0
function L0_0(A0_229)
  return IsDampener(A0_229) ~= true
end
CO_IS_NOT_INHIBITOR = L0_0
function L0_0(A0_230)
  return IsHQ(A0_230)
end
CO_IS_TYPE_NEXUS = L0_0
function L0_0(A0_231)
  return IsHQ(A0_231) ~= true
end
CO_IS_NOT_NEXUS = L0_0
function L0_0(A0_232)
  return IsDead(A0_232)
end
CO_IS_DEAD = L0_0
function L0_0(A0_233)
  return IsDead(A0_233) ~= true
end
CO_IS_NOT_DEAD = L0_0
function L0_0(A0_234)
  return IsDeadOrZombie(A0_234)
end
CO_IS_DEAD_OR_ZOMBIE = L0_0
function L0_0(A0_235, A1_236)
  return BBIsTargetInFrontOfMe(A0_235, A1_236)
end
CO_IS_TARGET_IN_FRONT_OF_ME = L0_0
function L0_0(A0_237, A1_238)
  return BBIsTargetBehindMe(A0_237, A1_238)
end
CO_IS_TARGET_BEHIND_ME = L0_0
function L0_0(A0_239)
  return IsWard(A0_239)
end
CO_IS_WARD = L0_0
function L0_0(A0_240)
  return IsStructure(A0_240)
end
CO_IS_STRUCTURE = L0_0
function L0_0(A0_241)
  return IsStructure(A0_241) ~= true
end
CO_IS_NOT_STRUCTURE = L0_0
function L0_0(A0_242)
  local L1_243
  L1_243 = A0_242 ~= nil
  return L1_243
end
CO_IS_NOT_NIL = L0_0
function L0_0(A0_244, A1_245, A2_246)
  GetTable(A0_244, A1_245.MacroVarTable, true)[A1_245.MacroVar] = A2_246
end
BBCreateMacro = L0_0
function L0_0(A0_247, A1_248)
  local L2_249
  L2_249 = GetParam
  L2_249 = L2_249("Macro", A0_247, A1_248)
  if L2_249 ~= nil and type(L2_249) == "table" then
    ExecuteBuildingBlocks(L2_249, A0_247)
  else
    DebugClientPrint("Designer Error: Macro variable is not initialized inside of event. Macro Variable was: " .. tostring(A1_248.MacroVar) .. " and current block data is: " .. gCurrentBuildingBlockString .. ". This error probably occurred due to variable not being initialized yet, being misnamed or two events being called out of sequence. It is highly recommended that script macros either be initialized OnBuffActivate, OnCharActivate or in the same event. Pro Devs may violate this rule at the risk of being forced to read this error message again.")
  end
end
BBRunMacro = L0_0
function L0_0(A0_250, A1_251, A2_252)
  local L3_253, L4_254, L5_255, L6_256, L7_257, L8_258
  L3_253 = GetTable
  L3_253 = L3_253(L4_254, L5_255, L6_256)
  L3_253[L4_254] = A2_252
  if L4_254 == nil then
    A2_252.InPerBlockParams = A1_251
    for L7_257 = 1, 6 do
      L8_258 = "FunctionParameter"
      L8_258 = L8_258 .. L7_257 .. "Var"
      if A1_251[L8_258 .. "Table"] ~= nil then
        DebugClientPrint("Designer Error: CreateFunction can only input parameters to PassThroughParams. Current block data is: " .. gCurrentBuildingBlockString .. ".")
      end
    end
  end
end
BBCreateFunction = L0_0
function L0_0(A0_259, A1_260)
  local L2_261, L3_262, L4_263, L5_264, L6_265
  for L5_264 = 1, 6 do
    L6_265 = "FunctionOutput"
    L6_265 = L6_265 .. L5_264 .. "Var"
    if A1_260[L6_265] ~= nil and A1_260[L6_265] ~= "" then
      if A1_260[L6_265 .. "Table"] ~= nil then
        DebugClientPrint("Designer Error: EndFunction can only output from PassThroughParams. Current block data is: " .. gCurrentBuildingBlockString .. ".")
      else
        A0_259[L6_265] = A0_259[A1_260[L6_265]]
      end
    end
  end
end
BBEndFunction = L0_0
function L0_0(A0_266, A1_267)
  local L2_268, L3_269, L4_270, L5_271, L6_272, L7_273, L8_274, L9_275
  L2_268 = GetParam
  L3_269 = "Function"
  L2_268 = L2_268(L3_269, L4_270, L5_271)
  L3_269 = {}
  L3_269.InstanceVars = L4_270
  L3_269.CharVars = L4_270
  L3_269.NextBuffVars = L4_270
  L3_269.AvatarVars = L4_270
  L3_269.SpellVars = L4_270
  L3_269.WorldVars = L4_270
  L3_269.Target = L4_270
  L3_269[L4_270] = L5_271
  L3_269.Attacker = L4_270
  L3_269[L4_270] = L5_271
  L3_269.Owner = L4_270
  L3_269[L4_270] = L5_271
  L3_269.Caster = L4_270
  L3_269.GoldRedirectTarget = L4_270
  L3_269.Unit = L4_270
  L3_269.Other1 = L4_270
  L3_269.Other2 = L4_270
  L3_269.Other3 = L4_270
  L3_269.Nothing = L4_270
  if L2_268 ~= nil then
    if L4_270 == "table" then
      if L4_270 ~= nil then
        for L8_274 = 1, 6 do
          L9_275 = "FunctionParameter"
          L9_275 = L9_275 .. L8_274 .. "Var"
          if A1_267[L9_275] ~= nil and A1_267[L9_275] ~= "" and L4_270[L9_275] ~= nil and L4_270[L9_275] ~= "" then
            L3_269[L4_270[L9_275]] = GetTable(A0_266, A1_267[L9_275 .. "Table"], false)[A1_267[L9_275]]
          end
        end
      end
      L4_270(L5_271, L6_272)
      for L7_273 = 1, 6 do
        L8_274 = "FunctionOutput"
        L9_275 = L7_273
        L8_274 = L8_274 .. L9_275 .. "Var"
        L9_275 = A1_267[L8_274]
        if L9_275 ~= nil then
          L9_275 = A1_267[L8_274]
          if L9_275 ~= "" then
            L9_275 = L3_269
            GetTable(A0_266, A1_267[L8_274 .. "Table"], false)[A1_267[L8_274]] = L9_275[L8_274]
          end
        end
      end
    end
  else
    L8_274 = gCurrentBuildingBlockString
    L9_275 = ". This error probably occurred due to variable not being initialized yet, being misnamed or two events being called out of sequence. It is highly recommended that script functions either be initialized OnBuffActivate, OnCharActivate or in the same event. Pro Devs may violate this rule at the risk of being forced to read this error message again."
    L4_270(L5_271)
  end
end
BBRunFunction = L0_0
function L0_0(A0_276, A1_277, A2_278)
  local L3_279, L4_280, L5_281, L6_282
  L3_279 = GetTable
  L4_280 = A0_276
  L5_281 = A1_277.Src1VarTable
  L6_282 = false
  L3_279 = L3_279(L4_280, L5_281, L6_282)
  L4_280 = GetTable
  L5_281 = A0_276
  L6_282 = A1_277.Src2VarTable
  L4_280 = L4_280(L5_281, L6_282, false)
  L5_281 = false
  L6_282 = nil
  if L3_279 ~= nil and A1_277.Src1Var ~= nil then
    L6_282 = L3_279[A1_277.Src1Var]
  else
    L6_282 = A1_277.Value1
  end
  if L4_280 ~= nil and A1_277.Src2Var ~= nil then
    L5_281 = A1_277.CompareOp(L6_282, L4_280[A1_277.Src2Var])
  else
    L5_281 = A1_277.CompareOp(L6_282, A1_277.Value2)
  end
  if L5_281 then
    ExecuteBuildingBlocks(A2_278, A0_276)
    A0_276.LastIfSucceeded = true
  else
    A0_276.LastIfSucceeded = false
  end
end
BBIf = L0_0
function L0_0(A0_283, A1_284, A2_285)
  if A0_283.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_285, A0_283)
    A0_283.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_286, A1_287, A2_288)
  if A0_286.LastIfSucceeded == true then
    ExecuteBuildingBlocks(A2_288, A0_286)
    A0_286.LastIfSucceeded = true
  else
    BBIf(A0_286, A1_287, A2_288)
  end
end
BBOrIf = L0_0
function L0_0(A0_289, A1_290, A2_291)
  if A0_289.LastIfSucceeded == true then
    BBIf(A0_289, A1_290, A2_291)
  end
end
BBAndIf = L0_0
function L0_0(A0_292, A1_293, A2_294)
  local L3_295, L4_296, L5_297, L6_298
  L3_295 = A0_292.LastIfSucceeded
  if L3_295 == false then
    L3_295 = GetTable
    L4_296 = A0_292
    L5_297 = A1_293.Src1VarTable
    L6_298 = false
    L3_295 = L3_295(L4_296, L5_297, L6_298)
    L4_296 = GetTable
    L5_297 = A0_292
    L6_298 = A1_293.Src2VarTable
    L4_296 = L4_296(L5_297, L6_298, false)
    L5_297 = false
    L6_298 = nil
    if L3_295 ~= nil and A1_293.Src1Var ~= nil then
      L6_298 = L3_295[A1_293.Src1Var]
    else
      L6_298 = A1_293.Value1
    end
    if L4_296 ~= nil and A1_293.Src2Var ~= nil then
      L5_297 = A1_293.CompareOp(L6_298, L4_296[A1_293.Src2Var])
    else
      L5_297 = A1_293.CompareOp(L6_298, A1_293.Value2)
    end
    if L5_297 then
      ExecuteBuildingBlocks(A2_294, A0_292)
      A0_292.LastIfSucceeded = true
    else
      A0_292.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_299, A1_300, A2_301)
  local L3_302
  if A1_300.TargetVar ~= nil then
    L3_302 = A0_299[A1_300.TargetVar]
  else
    L3_302 = A0_299.Target
  end
  if HasBuffOfType(L3_302, A1_300.BuffType) then
    ExecuteBuildingBlocks(A2_301, A0_299)
    A0_299.LastIfSucceeded = true
  else
    A0_299.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_303, A1_304, A2_305)
  local L3_306, L4_307
  if A1_304.OwnerVar ~= nil then
    L3_306 = A0_303[A1_304.OwnerVar]
  else
    L3_306 = A0_303.Owner
  end
  if A1_304.AttackerVar ~= nil then
    L4_307 = A0_303[A1_304.AttackerVar]
  else
    L4_307 = A0_303.Attacker
  end
  if SpellBuffCount(L3_306, A1_304.BuffName, L4_307) > 0 then
    ExecuteBuildingBlocks(A2_305, A0_303)
    A0_303.LastIfSucceeded = true
  else
    A0_303.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_308, A1_309, A2_310)
  if BBIsMissileAutoAttack(A0_308, A1_309) then
    ExecuteBuildingBlocks(A2_310, A0_308)
    A0_308.LastIfSucceeded = true
  else
    A0_308.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_311, A1_312, A2_313)
  if BBIsMissileConsideredAsAutoAttack(A0_311, A1_312) then
    ExecuteBuildingBlocks(A2_313, A0_311)
    A0_311.LastIfSucceeded = true
  else
    A0_311.LastIfSucceeded = false
  end
end
BBIfMissileConsideredAsAutoAttack = L0_0
function L0_0(A0_314, A1_315)
  A0_314.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_316, A1_317, A2_318)
  local L3_319, L4_320
  if A1_317.OwnerVar ~= nil then
    L3_319 = A0_316[A1_317.OwnerVar]
  else
    L3_319 = A0_316.Owner
  end
  if A1_317.CasterVar ~= nil then
    L4_320 = A0_316[A1_317.CasterVar]
  else
    L4_320 = A0_316.Caster
  end
  if SpellBuffCount(L3_319, A1_317.BuffName, L4_320) <= 0 then
    ExecuteBuildingBlocks(A2_318, A0_316)
    A0_316.LastIfSucceeded = true
  else
    A0_316.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_321, A1_322, A2_323)
  local L3_324
  if A1_322.TargetVar ~= nil then
    L3_324 = A0_321[A1_322.TargetVar]
  else
    L3_324 = A0_321.Owner
  end
  if HasUnitTag(L3_324, A1_322.UnitTag) ~= A1_322.InvertResult then
    ExecuteBuildingBlocks(A2_323, A0_321)
    A0_321.LastIfSucceeded = true
  else
    A0_321.LastIfSucceeded = false
  end
end
BBIfHasUnitTag = L0_0
function L0_0(A0_325, A1_326, A2_327)
  local L3_328, L4_329
  L4_329 = A1_326.OwnerVar
  if L4_329 ~= nil then
    L4_329 = A1_326.OwnerVar
    L3_328 = A0_325[L4_329]
  else
    L3_328 = A0_325.Owner
  end
  L4_329 = GetParam
  L4_329 = L4_329("SpellSlot", A0_325, A1_326)
  if HasSpellTag(L3_328, L4_329, A1_326.SpellbookType, A1_326.SlotType, A1_326.SpellTag) ~= A1_326.InvertResult then
    ExecuteBuildingBlocks(A2_327, A0_325)
    A0_325.LastIfSucceeded = true
  else
    A0_325.LastIfSucceeded = false
  end
end
BBIfHasSpellTag = L0_0
function L0_0(A0_330, A1_331, A2_332)
  local L3_333, L4_334
  if A1_331.OwnerVar ~= nil then
    L3_333 = A0_330[A1_331.OwnerVar]
  else
    L3_333 = A0_330.Owner
  end
  if HasPARType(L3_333, A1_331.PARType) then
    ExecuteBuildingBlocks(A2_332, A0_330)
    A0_330.LastIfSucceeded = true
  else
    A0_330.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_335, A1_336, A2_337)
  local L3_338, L4_339
  if A1_336.OwnerVar ~= nil then
    L3_338 = A0_335[A1_336.OwnerVar]
  else
    L3_338 = A0_335.Owner
  end
  if not HasPARType(L3_338, A1_336.PARType) then
    ExecuteBuildingBlocks(A2_337, A0_335)
    A0_335.LastIfSucceeded = true
  else
    A0_335.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_340, A1_341, A2_342)
  local L3_343, L4_344, L5_345, L6_346, L7_347
  L3_343 = GetTable
  L4_344 = A0_340
  L5_345 = A1_341.Src1VarTable
  L6_346 = false
  L3_343 = L3_343(L4_344, L5_345, L6_346)
  L4_344 = GetTable
  L5_345 = A0_340
  L6_346 = A1_341.Src2VarTable
  L7_347 = false
  L4_344 = L4_344(L5_345, L6_346, L7_347)
  L5_345 = true
  while L5_345 do
    L6_346 = false
    L7_347 = nil
    if L3_343 ~= nil and A1_341.Src1Var ~= nil then
      L7_347 = L3_343[A1_341.Src1Var]
    else
      L7_347 = A1_341.Value1
    end
    if L4_344 ~= nil and A1_341.Src2Var ~= nil then
      L6_346 = A1_341.CompareOp(L7_347, L4_344[A1_341.Src2Var])
    else
      L6_346 = A1_341.CompareOp(L7_347, A1_341.Value2)
    end
    if L6_346 then
      ExecuteBuildingBlocks(A2_342, A0_340)
    else
      L5_345 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_348, A1_349, A2_350)
  local L3_351, L4_352, L5_353
  L3_351 = GetParam
  L4_352 = "Start"
  L5_353 = A0_348
  L3_351 = L3_351(L4_352, L5_353, A1_349)
  L4_352 = GetParam
  L5_353 = "End"
  L4_352 = L4_352(L5_353, A0_348, A1_349)
  L5_353 = L3_351
  while L4_352 >= L5_353 do
    SetVarInTable(A0_348, A1_349, L5_353)
    ExecuteBuildingBlocks(A2_350, A0_348)
    L5_353 = L5_353 + 1
  end
end
BBFor = L0_0
function L0_0(A0_354, A1_355)
  return A0_354 * A1_355
end
MO_MULTIPLY = L0_0
function L0_0(A0_356, A1_357)
  return A0_356 + A1_357
end
MO_ADD = L0_0
function L0_0(A0_358, A1_359)
  return A0_358 - A1_359
end
MO_SUBTRACT = L0_0
function L0_0(A0_360, A1_361)
  return A0_360 / A1_361
end
MO_DIVIDE = L0_0
function L0_0(A0_362, A1_363)
  if A0_362 < A1_363 then
    return A0_362
  else
    return A1_363
  end
end
MO_MIN = L0_0
function L0_0(A0_364, A1_365)
  if A1_365 < A0_364 then
    return A0_364
  else
    return A1_365
  end
end
MO_MAX = L0_0
function L0_0(A0_366, A1_367)
  return A0_366 % A1_367
end
MO_MODULO = L0_0
function L0_0(A0_368)
  return math.floor(A0_368 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_369)
  return math.ceil(A0_369)
end
MO_ROUNDUP = L0_0
function L0_0(A0_370)
  return math.floor(A0_370)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_371)
  return math.sin(math.rad(A0_371))
end
MO_SIN = L0_0
function L0_0(A0_372)
  return math.cos(math.rad(A0_372))
end
MO_COSINE = L0_0
function L0_0(A0_373)
  return math.tan(math.rad(A0_373))
end
MO_TANGENT = L0_0
function L0_0(A0_374)
  return math.deg(math.asin(A0_374))
end
MO_ASIN = L0_0
function L0_0(A0_375)
  return math.deg(math.acos(A0_375))
end
MO_ACOS = L0_0
function L0_0(A0_376)
  return math.deg(math.atan(A0_376))
end
MO_ATAN = L0_0
function L0_0(A0_377, A1_378)
  return math.pow(A0_377, A1_378)
end
MO_POW = L0_0
function L0_0(A0_379)
  return math.sqrt(A0_379)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_380, A1_381)
  local L2_382
  L2_382 = A0_380 and A1_381
  return L2_382
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_383, A1_384)
  local L2_385
  L2_385 = A0_383 or A1_384
  return L2_385
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_386)
  local L1_387
  L1_387 = not A0_386
  return L1_387
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_388)
  return math.abs(A0_388)
end
MO_ABS = L0_0
function L0_0(A0_389, A1_390)
  return math.random(A0_389, A1_390)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_391, A1_392)
  local L2_393, L3_394, L4_395, L5_396
  L2_393 = GetMathNumber
  L3_394 = A0_391
  L4_395 = A1_392.Src1VarTable
  L5_396 = A1_392.Src1Var
  L2_393 = L2_393(L3_394, L4_395, L5_396, A1_392.Src1Value)
  L3_394 = GetMathNumber
  L4_395 = A0_391
  L5_396 = A1_392.Src2VarTable
  L3_394 = L3_394(L4_395, L5_396, A1_392.Src2Var, A1_392.Src2Value)
  L4_395 = GetTable
  L5_396 = A0_391
  L4_395 = L4_395(L5_396, A1_392.DestVarTable)
  L5_396 = A1_392.MathOp
  L5_396 = L5_396(L2_393, L3_394)
  SetVarInTable(A0_391, A1_392, L5_396)
end
BBMath = L0_0
function L0_0(A0_397, A1_398, A2_399, A3_400)
  if A2_399 ~= nil and GetTable(A0_397, A1_398)[A2_399] ~= nil then
    return GetTable(A0_397, A1_398)[A2_399]
  end
  return A3_400
end
GetMathNumber = L0_0
function L0_0(A0_401, A1_402)
  if type(A1_402) == "number" then
    return A1_402
  elseif type(A1_402) == "function" then
    return A1_402(A0_401)
  elseif type(A1_402) == "string" then
    return A0_401[A1_402]
  end
end
GetNumber = L0_0
function L0_0(A0_403, A1_404)
  return VectorAdd(A0_403, A1_404)
end
VEC_ADD = L0_0
function L0_0(A0_405, A1_406)
  return VectorSubtract(A0_405, A1_406)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_407, A1_408)
  return VectorScalarMultiply(A0_407, A1_408)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_409, A1_410)
  return VectorScalarDivide(A0_409, A1_410)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_411, A1_412)
  return VectorRotateY(A0_411, A1_412)
end
VEC_ROTATE = L0_0
function L0_0(A0_413, A1_414)
  BBMath(A0_413, A1_414)
end
BBVectorMath = L0_0
function L0_0(A0_415, A1_416)
  local L2_417, L3_418, L4_419, L5_420
  L2_417 = A0_415.InstanceVars
  L3_418 = L2_417.InterpDelta
  if L3_418 == nil then
    L3_418 = A1_416.Amount
    L4_419 = A1_416.AmountVar
    if L4_419 ~= nil then
      L4_419 = GetTable
      L5_420 = A0_415
      L4_419 = L4_419(L5_420, A1_416.AmountVarTable)
      L5_420 = A1_416.AmountVar
      L3_418 = L4_419[L5_420]
    end
    L4_419 = GetPosition
    L5_420 = A1_416.TargetVar
    L5_420 = A0_415[L5_420]
    L4_419 = L4_419(L5_420)
    L2_417.KnockBackStart = L4_419
    L4_419 = GetNormalizedPositionDelta
    L5_420 = A1_416.TargetVar
    L5_420 = A0_415[L5_420]
    L4_419 = L4_419(L5_420, A0_415[A1_416.AttackerVar], true)
    L5_420 = {}
    L5_420.x = L4_419.x * L3_418
    L5_420.y = 0
    L5_420.z = L4_419.z * L3_418
    L2_417.InterpDelta = L5_420
    L5_420 = GetTime
    L5_420 = L5_420()
    L2_417.StartTime = L5_420
    L5_420 = A1_416.KnockBackDuration
    L2_417.KnockBackDuration = L5_420
  end
  L3_418 = A1_416.TargetVar
  L3_418 = A0_415[L3_418]
  L4_419 = GetTime
  L4_419 = L4_419()
  L5_420 = L2_417.StartTime
  L4_419 = L4_419 - L5_420
  L5_420 = L2_417.KnockBackDuration
  L4_419 = L4_419 / L5_420
  L5_420 = {}
  L5_420.x = L2_417.KnockBackStart.x + L2_417.InterpDelta.x * L4_419
  L5_420.y = L2_417.KnockBackStart.y
  L5_420.z = L2_417.KnockBackStart.z + L2_417.InterpDelta.z * L4_419
  SetPosition(L3_418, L5_420)
end
BBKnockback = L0_0
function L0_0(A0_421, A1_422)
  local L2_423, L3_424
  L2_423 = GetParam
  L3_424 = "Left"
  L2_423 = L2_423(L3_424, A0_421, A1_422)
  L3_424 = GetParam
  L3_424 = L3_424("Right", A0_421, A1_422)
  GetTable(A0_421, A1_422.DestVarTable, true)[A1_422.DestVar] = tostring(L2_423) .. tostring(L3_424)
end
BBAppendString = L0_0
function L0_0(A0_425, A1_426)
  local L2_427
  L2_427 = 0
  if A1_426.Delta ~= nil then
    L2_427 = L2_427 + A1_426.Delta
  end
  if A1_426.DeltaByLevel ~= nil and A0_425.Level ~= nil then
    L2_427 = L2_427 + A1_426.DeltaByLevel[A0_425.Level]
  end
  if A1_426.DeltaVar ~= nil then
    L2_427 = L2_427 + GetTable(A0_425, A1_426.DeltaVarTable, true)[A1_426.DeltaVar]
  end
  if A1_426.TargetVar ~= nil then
    A1_426.Stat(L2_427, A0_425[A1_426.TargetVar])
  else
    A1_426.Stat(L2_427)
  end
end
BBIncStat = L0_0
function L0_0(A0_428, A1_429)
  local L2_430
  L2_430 = 0
  if A1_429.Delta ~= nil then
    L2_430 = L2_430 + A1_429.Delta
  end
  if A1_429.DeltaByLevel ~= nil and A0_428.Level ~= nil then
    L2_430 = L2_430 + A1_429.DeltaByLevel[A0_428.Level]
  end
  if A1_429.DeltaVar ~= nil then
    L2_430 = L2_430 + GetTable(A0_428, A1_429.DeltaVarTable, true)[A1_429.DeltaVar]
  end
  if A1_429.TargetVar ~= nil then
    A1_429.Stat(L2_430, A0_428[A1_429.TargetVar])
  else
    A1_429.Stat(L2_430)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_431, A1_432)
  local L2_433, L3_434
  L2_433 = A1_432.TargetVar
  L3_434 = 0
  if A1_432.LaneVar ~= nil then
    L3_434 = L3_434 + GetTable(A0_431, A1_432.LaneVarTable, true)[A1_432.LaneVar]
  end
  if A1_432.Lane ~= nil then
    L3_434 = L3_434 + A1_432.Lane
  end
  SetMinionLane(A0_431[L2_433], L3_434)
end
BBSetMinionLane = L0_0
function L0_0(A0_435, A1_436)
  if A1_436.AttackVar ~= nil then
  end
  if A1_436.Attack ~= nil then
  end
  if A1_436.TotalCoefficientVar ~= nil then
  end
  if A1_436.TotalCoefficient ~= nil then
  end
  if A1_436.TargetVar ~= nil then
    GetTable(A0_435, A1_436.DestVarTable, false)[A1_436.DestVar] = (0 + GetTable(A0_435, A1_436.AttackVarTable, true)[A1_436.AttackVar] + A1_436.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_435[A1_436.TargetVar])) + GetFlatCritDamageMod(A0_435[A1_436.TargetVar])) * (0 + GetTable(A0_435, A1_436.TotalCoefficientVarTable, true)[A1_436.TotalCoefficientVar] + A1_436.TotalCoefficient)
  else
    GetTable(A0_435, A1_436.DestVarTable, false)[A1_436.DestVar] = 2 * A1_436.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_437, A1_438)
  local L2_439, L3_440, L4_441, L5_442, L6_443, L7_444
  L2_439 = GetTable
  L3_440 = A0_437
  L4_441 = A1_438.DestVarTable
  L5_442 = false
  L2_439 = L2_439(L3_440, L4_441, L5_442)
  L3_440 = GetTable
  L4_441 = A0_437
  L5_442 = A1_438.AmountVarTable
  L6_443 = true
  L3_440 = L3_440(L4_441, L5_442, L6_443)
  L4_441 = GetTable
  L5_442 = A0_437
  L6_443 = A0_437.NextBuffVars
  L7_444 = false
  L4_441 = L4_441(L5_442, L6_443, L7_444)
  L5_442 = A1_438.AmountVar
  L5_442 = L3_440[L5_442]
  L6_443 = A1_438.Amount
  L5_442 = L5_442 + L6_443
  L4_441.InitializeShield_Amount = L5_442
  L5_442 = A1_438.AmountVar
  if L5_442 ~= nil then
    L5_442 = A1_438.HealShieldMod
    if L5_442 ~= nil and L5_442 == true then
      L6_443 = A1_438.AttackerVar
      L7_444 = 0
      if L6_443 ~= nil then
        L7_444 = GetPercentHealingAmountMod(A0_437[L6_443])
      end
      L4_441.InitializeShield_Amount, L3_440[A1_438.AmountVar] = (A1_438.Amount + L3_440[A1_438.AmountVar]) * (1 + L7_444), (A1_438.Amount + L3_440[A1_438.AmountVar]) * (1 + L7_444)
    end
  end
  L5_442 = SpellBuffAddNoRenew
  L6_443 = A1_438.AttackerVar
  L6_443 = A0_437[L6_443]
  L7_444 = A1_438.UnitVar
  L7_444 = A0_437[L7_444]
  L5_442(L6_443, L7_444, "InitializeShieldMarker", 0, 1, 25000, L4_441)
  L5_442 = BBIncreaseShield
  L6_443 = A0_437
  L7_444 = A1_438
  L5_442(L6_443, L7_444)
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
  ReincarnateNonDeadHero(GetTable(A0_538, A1_539.TargetTable, false)[A1_539.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_540, A1_541)
  GetTable(A0_540, A1_541.DestVarTable, true)[A1_541.DestVar] = A1_541.Function(A0_540[A1_541.OwnerVar], A1_541.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_542, A1_543)
  local L2_544, L3_545, L4_546, L5_547
  L2_544 = A1_543.WhomToOrderVar
  L2_544 = A0_542[L2_544]
  L3_545 = A1_543.TargetOfOrderVar
  L3_545 = A0_542[L3_545]
  L4_546 = GetTable
  L5_547 = A0_542
  L4_546 = L4_546(L5_547, A1_543.SrcVarTable, false)
  L5_547 = nil
  if A1_543.SrcVar ~= nil and L4_546 ~= nil then
    L5_547 = L4_546[A1_543.SrcVar]
  else
    L5_547 = GetPosition(L3_545)
  end
  if L3_545 == nil then
    L3_545 = L2_544
  end
  IssueOrder(L2_544, A1_543.Order, L5_547, L3_545)
end
BBIssueOrder = L0_0
function L0_0(A0_548, A1_549)
  local L2_550
  L2_550 = GetParam
  L2_550 = L2_550("NewRange", A0_548, A1_549)
  SetSpellCastRange(L2_550)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_551, A1_552)
  GetTable(A0_551, A1_552.DestVarTable, true)[A1_552.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_553, A1_554)
  local L2_555, L3_556
  L2_555 = A1_554.ObjectVar1
  L2_555 = A0_553[L2_555]
  L3_556 = A1_554.ObjectVar2
  L3_556 = A0_553[L3_556]
  GetTable(A0_553, A1_554.DestVarTable, true)[A1_554.DestVar] = DistanceBetweenObjectBounds(L2_555, L3_556)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_557, A1_558)
  local L2_559, L3_560, L4_561
  L2_559 = A1_558.ObjectVar
  L2_559 = A0_557[L2_559]
  L3_560 = GetTable
  L4_561 = A0_557
  L3_560 = L3_560(L4_561, A1_558.PointVarTable, true)
  L4_561 = A1_558.PointVar
  L4_561 = L3_560[L4_561]
  GetTable(A0_557, A1_558.DestVarTable, true)[A1_558.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_559, L4_561)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_562, A1_563)
  local L2_564, L3_565
  L2_564 = GetParam
  L3_565 = "Point1"
  L2_564 = L2_564(L3_565, A0_562, A1_563)
  L3_565 = GetParam
  L3_565 = L3_565("Point2", A0_562, A1_563)
  GetTable(A0_562, A1_563.DestVarTable, true)[A1_563.DestVar] = DistanceBetweenPoints(L2_564, L3_565)
end
BBDistanceBetweenPoints = L0_0
function L0_0(A0_566, A1_567)
  local L2_568, L3_569
  L2_568 = GetParam
  L3_569 = "Point1"
  L2_568 = L2_568(L3_569, A0_566, A1_567)
  L3_569 = GetParam
  L3_569 = L3_569("Point2", A0_566, A1_567)
  GetTable(A0_566, A1_567.DestVarTable, true)[A1_567.DestVar] = DistanceBetweenPointsXZ(L2_568, L3_569)
end
BBDistanceBetweenPointsXZ = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_570, A1_571, A2_572)
  local L3_573, L4_574, L5_575, L6_576, L7_577, L8_578
  L5_575 = 0
  L6_576 = nil
  L7_577 = A1_571.ObjectDistanceType
  L8_578 = A1_571.ObjectVar1
  L3_573 = A0_570[L8_578]
  L8_578 = A1_571.ObjectVar2
  L4_574 = A0_570[L8_578]
  if nil == L4_574 then
    L8_578 = A1_571.Point2Var
    if nil ~= L8_578 then
      L8_578 = GetTable
      L8_578 = L8_578(A0_570, A1_571.Point2VarTable, true)
      L4_574 = L8_578[A1_571.Point2Var]
      L5_575 = L5_575 + 1
    end
  end
  if nil == L3_573 then
    L8_578 = A1_571.Point1Var
    if nil ~= L8_578 then
      L8_578 = GetTable
      L8_578 = L8_578(A0_570, A1_571.Point1VarTable, true)
      L3_573 = L8_578[A1_571.Point1Var]
      L5_575 = L5_575 + 1
      if 1 == L5_575 then
        L3_573, L4_574 = L4_574, L3_573
      end
    end
  end
  if nil ~= L7_577 then
    if 0 == L5_575 then
      L8_578 = OBJECT_CENTER
      if L8_578 == L7_577 then
        L6_576 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_578 = OBJECT_BOUNDARY
        if L8_578 == L7_577 then
          L6_576 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_578 = A1_571.OwnerVar
          L8_578 = A0_570[L8_578]
          Say(L8_578, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_575 then
      L8_578 = OBJECT_CENTER
      if L8_578 == L7_577 then
        L6_576 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_578 = OBJECT_BOUNDARY
        if L8_578 == L7_577 then
          L6_576 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_578 = A1_571.OwnerVar
          L8_578 = A0_570[L8_578]
          Say(L8_578, "invalid object distance type", 0)
        end
      end
    else
      L6_576 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_578 = A1_571.Distance
  if A1_571.DistanceVar ~= nil and GetTable(A0_570, A1_571.DistanceVarTable, true) ~= nil then
    L8_578 = L8_578 + GetTable(A0_570, A1_571.DistanceVarTable, true)[A1_571.DistanceVar]
  end
  if L3_573 ~= nil and L4_574 ~= nil and L6_576 ~= nil and L8_578 ~= nil then
    if not L6_576(L3_573, L4_574, L8_578) then
      ExecuteBuildingBlocks(A2_572, A0_570)
      A0_570.LastIfSucceeded = true
    else
      A0_570.LastIfSucceeded = false
    end
  else
    A0_570.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_579, A1_580)
  local L2_581, L3_582
  L2_581 = A1_580.TargetVar
  L2_581 = A0_579[L2_581]
  L3_582 = A1_580.CasterVar
  L3_582 = A0_579[L3_582]
  GetTable(A0_579, A1_580.DestVarTable, true)[A1_580.DestVar] = SpellBuffCount(L2_581, A1_580.BuffName, L3_582)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_583, A1_584)
  local L2_585
  L2_585 = A1_584.TargetVar
  L2_585 = A0_583[L2_585]
  GetTable(A0_583, A1_584.DestVarTable, true)[A1_584.DestVar] = SpellBuffCount(L2_585, A1_584.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_586, A1_587)
  local L2_588, L3_589
  L2_588 = GetTable
  L3_589 = A0_586
  L2_588 = L2_588(L3_589, A1_587.ScaleVarTable, false)
  L3_589 = nil
  if A1_587.OwnerVar ~= nil then
    L3_589 = A0_586[A1_587.OwnerVar]
  else
    L3_589 = A0_586.Owner
  end
  if A1_587.ScaleVar ~= nil and A1_587.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_588[A1_587.ScaleVar], L3_589)
  else
    SetScaleSkinCoef(A1_587.Scale, L3_589)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_590, A1_591)
  SpellBuffAdd(A0_590[A1_591.TargetVar], A0_590[A1_591.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_590.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_592, A1_593, A2_594)
  local L3_595, L4_596
  L3_595 = A1_593.TargetVar
  L3_595 = A0_592[L3_595]
  L4_596 = A1_593.NumStacks
  if GetParam("NumStacks", A0_592, A1_593) == 0 then
    L4_596 = SpellBuffCount(L3_595, A1_593.BuffName, caster)
  else
    L4_596 = GetParam("NumStacks", A0_592, A1_593)
  end
  while L4_596 > 0 do
    SpellBuffRemove(L3_595, A1_593.BuffName, A0_592[A1_593.AttackerVar])
    L4_596 = L4_596 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_597, A1_598)
  local L2_599, L3_600
  L2_599 = GetParam
  L3_600 = "Unit"
  L2_599 = L2_599(L3_600, A0_597, A1_598)
  unit = L2_599
  L2_599 = unit
  if L2_599 == nil then
    L2_599 = ReportError
    L3_600 = "Could not resolve Unit param"
    L2_599(L3_600)
    return
  end
  L2_599 = true
  L3_600 = GetParam
  L3_600 = L3_600("ChampionToShowTo", A0_597, A1_598)
  if L3_600 == nil then
    L2_599 = false
    L3_600 = GetParam("ChampionToShowToByFlag", A0_597, A1_598)
  end
  if L3_600 == nil then
    ReportError("Could not resolve ChampionToShowTo param")
    return
  end
  SetShowHealthBarToChampion(unit, A1_598.Show, L3_600, L2_599, A1_598.ApplyToSpectator)
end
BBSetShowHealthBarToChampion = L0_0
function L0_0(A0_601, A1_602)
  if GetParam("Vector", A0_601, A1_602) ~= nil then
    GetTable(A0_601, A1_602.DestVarTable, false)[A1_602.DestVar] = math.sqrt(GetParam("Vector", A0_601, A1_602).x * GetParam("Vector", A0_601, A1_602).x + GetParam("Vector", A0_601, A1_602).y * GetParam("Vector", A0_601, A1_602).y + GetParam("Vector", A0_601, A1_602).z * GetParam("Vector", A0_601, A1_602).z)
  end
end
BBGetVectorLength = L0_0
function L0_0(A0_603, A1_604, A2_605)
  if A0_603.EmoteId == A1_604.EmoteId then
    ExecuteBuildingBlocks(A2_605, A0_603)
    A0_603.LastIfSucceeded = true
  else
    A0_603.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_606, A1_607, A2_608)
  if A0_606.EmoteId ~= A1_607.EmoteId then
    ExecuteBuildingBlocks(A2_608, A0_606)
    A0_606.LastIfSucceeded = true
  else
    A0_606.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_609, A1_610)
  local L2_611, L3_612, L4_613, L5_614
  L2_611 = GetTable
  L3_612 = A0_609
  L4_613 = A1_610.String1VarTable
  L5_614 = false
  L2_611 = L2_611(L3_612, L4_613, L5_614)
  L3_612 = A1_610.String1Var
  L3_612 = L2_611[L3_612]
  L4_613 = GetTable
  L5_614 = A0_609
  L4_613 = L4_613(L5_614, A1_610.String2VarTable, false)
  L5_614 = A1_610.String2Var
  L5_614 = L4_613[L5_614]
  GetTable(A0_609, A1_610.ResultVarTable, false)[A1_610.ResultVar] = L3_612 .. L5_614
end
BBConcatenateStrings = L0_0
function L0_0(A0_615, A1_616)
  local L2_617, L3_618
  L2_617 = GetTable
  L3_618 = A0_615
  L2_617 = L2_617(L3_618, A1_616.VariableVarTable, false)
  L3_618 = A1_616.VariableVar
  L3_618 = L2_617[L3_618]
  GetTable(A0_615, A1_616.ResultVarTable, false)[A1_616.ResultVar] = "(" .. L3_618 .. ")"
end
BBEncaseInParantheses = L0_0
function L0_0(A0_619, A1_620)
  BBGetMinionKills(A0_619, A1_620)
  A0_619.MinionKillSource = GetParam("MinionKillTarget")
  A0_619.MinionKills = A0_619.MinionsKilled + GetParam("MinionKills", A0_619, A1_620)
  BBSetMinionKills(A0_619, A1_620)
end
BBIncreaseMinionKills = L0_0
