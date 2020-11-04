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
  local L4_121, L5_122
  L4_121 = GetParam
  L5_122 = "Unit"
  L4_121 = L4_121(L5_122, A0_117, A1_118)
  if L4_121 ~= nil then
    L5_122 = GetPosition
    L5_122 = L5_122(L4_121)
    A1_118.DestPos = L5_122
    A1_118.DestPosVar = "__TempDestPos"
    GetTable(A0_117, A1_118.DestPosVarTable, false)[A1_118.DestPosVar] = L5_122
  end
  A1_118.RegionGroup = A2_119
  L5_122 = BBGetRegionTag
  L5_122(A0_117, A1_118)
  L5_122 = GetTable
  L5_122 = L5_122(A0_117, A1_118.ResultVarTable, false)
  for _FORV_11_, _FORV_12_ in ipairs(A3_120) do
  end
  L5_122 = GetTable(A0_117, A1_118.ResultVarTable, false)
  L5_122[A1_118.ResultVar] = true
end
CheckIfUnitOrPointIsInRegionTagList = L0_0
function L0_0(A0_123, A1_124)
  local L2_125, L3_126
  L2_125 = GameplayLane
  L3_126 = {
    LANE_Top_Order,
    LANE_Mid_Order,
    LANE_Bot_Order
  }
  CheckIfUnitOrPointIsInRegionTagList(A0_123, A1_124, L2_125, L3_126)
end
BBGetIsOrderSide = L0_0
function L0_0(A0_127, A1_128)
  local L2_129, L3_130
  L2_129 = GameplayArea
  L3_130 = {AREA_Jungle_Top, AREA_Jungle_Bot}
  CheckIfUnitOrPointIsInRegionTagList(A0_127, A1_128, L2_129, L3_130)
end
BBGetIsJungle = L0_0
function L0_0(A0_131, A1_132)
  local L2_133, L3_134
  L2_133 = GameplayArea
  L3_134 = {
    AREA_Lane_Top,
    AREA_Lane_Mid,
    AREA_Lane_Bot
  }
  CheckIfUnitOrPointIsInRegionTagList(A0_131, A1_132, L2_133, L3_134)
end
BBGetIsLane = L0_0
function L0_0(A0_135, A1_136)
  local L2_137, L3_138
  L2_137 = GameplayArea
  L3_138 = {AREA_River_Top, AREA_River_Bot}
  CheckIfUnitOrPointIsInRegionTagList(A0_135, A1_136, L2_137, L3_138)
end
BBGetIsRiver = L0_0
function L0_0(A0_139, A1_140)
  local L2_141, L3_142
  L2_141 = GameplayArea
  L3_142 = {AREA_BasePerimeter_Top, AREA_BasePerimeter_Bot}
  CheckIfUnitOrPointIsInRegionTagList(A0_139, A1_140, L2_141, L3_142)
end
BBGetIsBasePerimeter = L0_0
function L0_0(A0_143, A1_144)
  local L2_145, L3_146, L4_147, L5_148, L6_149, L7_150, L8_151, L9_152
  L2_145 = GetParam
  L3_146 = "Unit"
  L4_147 = A0_143
  L5_148 = A1_144
  L2_145 = L2_145(L3_146, L4_147, L5_148)
  L3_146 = GetParam
  L4_147 = "X"
  L5_148 = A0_143
  L6_149 = A1_144
  L3_146 = L3_146(L4_147, L5_148, L6_149)
  L4_147 = GetParam
  L5_148 = "Z"
  L6_149 = A0_143
  L7_150 = A1_144
  L4_147 = L4_147(L5_148, L6_149, L7_150)
  if L2_145 ~= nil then
    L5_148 = GetPosition
    L6_149 = L2_145
    L5_148 = L5_148(L6_149)
    L3_146 = L5_148.x
    L4_147 = L5_148.z
  end
  L5_148 = 2
  L6_149 = 1
  L7_150 = 0
  L8_151 = 4
  L9_152 = 3
  if L4_147 > 12250 then
  elseif L4_147 < 2650 then
  elseif L3_146 > 12250 then
  elseif L3_146 < 2650 then
  elseif L4_147 - L3_146 > 4500 then
  else
  end
  if L4_147 > 13000 then
  elseif L4_147 < 1800 then
  elseif L3_146 > 13000 then
  elseif L3_146 < 1800 then
  elseif L4_147 - L3_146 > 1150 then
  else
  end
  GetTable(A0_143, A1_144.NearLaneVarTable, false)[A1_144.NearLaneVar] = L7_150
  GetTable(A0_143, A1_144.NearSectionVarTable, false)[A1_144.NearSectionVar] = L9_152
  GetTable(A0_143, A1_144.BlueSideVarTable, false)[A1_144.BlueSideVar] = true
end
BBGetLocationHints = L0_0
function L0_0(A0_153, A1_154)
  local L2_155, L3_156, L4_157, L5_158
  L2_155 = GetTable
  L3_156 = A0_153
  L4_157 = A1_154.DestVarTable
  L5_158 = true
  L2_155 = L2_155(L3_156, L4_157, L5_158)
  L3_156 = nil
  L4_157 = GetTable
  L5_158 = A0_153
  L4_157 = L4_157(L5_158, A1_154.SpellSlotVarTable, false)
  L5_158 = A1_154.SpellSlotVar
  if L5_158 ~= nil and L4_157 ~= nil then
    L5_158 = A1_154.SpellSlotVar
    L3_156 = L4_157[L5_158]
  else
    L3_156 = A1_154.SpellSlotValue
  end
  L5_158 = A1_154.Function
  L5_158 = L5_158(A0_153[A1_154.OwnerVar], L3_156, A1_154.SpellbookType, A1_154.SlotType)
  SetVarInTable(A0_153, A1_154, L5_158)
end
BBGetSlotSpellInfo = L0_0
function L0_0(A0_159, A1_160)
  local L2_161, L3_162, L4_163
  L2_161 = GetTable
  L3_162 = A0_159
  L4_163 = A1_160.SrcVarTable
  L2_161 = L2_161(L3_162, L4_163, false)
  L3_162 = nil
  L4_163 = A1_160.SrcVar
  if L4_163 ~= nil and L2_161 ~= nil then
    L4_163 = A1_160.SrcVar
    L3_162 = L2_161[L4_163]
  else
    L3_162 = A1_160.SrcValue
  end
  L4_163 = nil
  if A1_160.SpellSlotVar ~= nil and GetTable(A0_159, A1_160.SpellSlotVarTable, false) ~= nil then
    L4_163 = GetTable(A0_159, A1_160.SpellSlotVarTable, false)[A1_160.SpellSlotVar]
  else
    L4_163 = A1_160.SpellSlotValue
  end
  SetSlotSpellCooldownTime(A0_159[A1_160.OwnerVar], L4_163, A1_160.SpellbookType, A1_160.SlotType, L3_162)
end
BBSetSlotSpellCooldownTime = L0_0
function L0_0(A0_164, A1_165)
  if A0_164.Level ~= nil and A1_165.SrcValueByLevel ~= nil then
    A0_164.ReturnValue = A1_165.SrcValueByLevel[A0_164.Level]
  elseif A1_165.SrcVar ~= nil and GetTable(A0_164, A1_165.SrcVarTable, false) ~= nil then
    A0_164.ReturnValue = GetTable(A0_164, A1_165.SrcVarTable, false)[A1_165.SrcVar]
  else
    A0_164.ReturnValue = A1_165.SrcValue
  end
end
BBSetReturnValue = L0_0
function L0_0(A0_166, A1_167)
  A0_166.ReturnValue = true
end
BBCancelOrderBeforeIssued = L0_0
function L0_0(A0_168, A1_169)
  if type(A0_168) == "string" and type(A1_169) == "string" then
    A0_168 = string.lower(A0_168)
    A1_169 = string.lower(A1_169)
  end
  return A0_168 == A1_169
end
CO_EQUAL = L0_0
function L0_0(A0_170, A1_171)
  if type(A0_170) == "string" and type(A1_171) == "string" then
    A0_170 = string.lower(A0_170)
    A1_171 = string.lower(A1_171)
  end
  return A0_170 ~= A1_171
end
CO_NOT_EQUAL = L0_0
function L0_0(A0_172, A1_173)
  local L2_174
  L2_174 = A0_172 < A1_173
  return L2_174
end
CO_LESS_THAN = L0_0
function L0_0(A0_175, A1_176)
  local L2_177
  L2_177 = A1_176 < A0_175
  return L2_177
end
CO_GREATER_THAN = L0_0
function L0_0(A0_178, A1_179)
  local L2_180
  L2_180 = A0_178 <= A1_179
  return L2_180
end
CO_LESS_THAN_OR_EQUAL = L0_0
function L0_0(A0_181, A1_182)
  local L2_183
  L2_183 = A1_182 <= A0_181
  return L2_183
end
CO_GREATER_THAN_OR_EQUAL = L0_0
function L0_0(A0_184, A1_185)
  return GetTeamID(A0_184) == GetTeamID(A1_185)
end
CO_SAME_TEAM = L0_0
function L0_0(A0_186, A1_187)
  return GetTeamID(A0_186) ~= GetTeamID(A1_187)
end
CO_DIFFERENT_TEAM = L0_0
function L0_0(A0_188, A1_189)
  return GetSourceType() == A1_189 or GetSourceType() == A0_188
end
CO_DAMAGE_SOURCETYPE_IS = L0_0
function L0_0(A0_190, A1_191)
  return GetSourceType() ~= A1_191 and GetSourceType() ~= A0_190
end
CO_DAMAGE_SOURCETYPE_IS_NOT = L0_0
function L0_0(A0_192)
  return IsObjectAI(A0_192)
end
CO_IS_TYPE_AI = L0_0
function L0_0(A0_193)
  return IsObjectAI(A0_193) ~= true
end
CO_IS_NOT_AI = L0_0
function L0_0(A0_194)
  return IsObjectHero(A0_194)
end
CO_IS_TYPE_HERO = L0_0
function L0_0(A0_195)
  return IsObjectHero(A0_195) ~= true
end
CO_IS_NOT_HERO = L0_0
function L0_0(A0_196)
  return IsObjectMarker(A0_196)
end
CO_IS_TYPE_MARKER = L0_0
function L0_0(A0_197)
  return IsObjectMarker(A0_197) ~= true
end
CO_IS_NOT_MARKER = L0_0
function L0_0(A0_198)
  return IsClone(A0_198)
end
CO_IS_CLONE = L0_0
function L0_0(A0_199)
  return IsClone(A0_199) ~= true
end
CO_IS_NOT_CLONE = L0_0
function L0_0(A0_200)
  return IsMelee(A0_200)
end
CO_IS_MELEE = L0_0
function L0_0(A0_201)
  return IsMelee(A0_201) ~= true
end
CO_IS_RANGED = L0_0
function L0_0(A0_202)
  return A0_202 > math.random()
end
CO_RANDOM_CHANCE_LESS_THAN = L0_0
function L0_0(A0_203)
  return IsTurretAI(A0_203)
end
CO_IS_TYPE_TURRET = L0_0
function L0_0(A0_204)
  return IsTurretAI(A0_204) ~= true
end
CO_IS_NOT_TURRET = L0_0
function L0_0(A0_205)
  return IsDampener(A0_205)
end
CO_IS_TYPE_INHIBITOR = L0_0
function L0_0(A0_206)
  return IsDampener(A0_206) ~= true
end
CO_IS_NOT_INHIBITOR = L0_0
function L0_0(A0_207)
  return IsHQ(A0_207)
end
CO_IS_TYPE_NEXUS = L0_0
function L0_0(A0_208)
  return IsHQ(A0_208) ~= true
end
CO_IS_NOT_NEXUS = L0_0
function L0_0(A0_209)
  return IsDead(A0_209)
end
CO_IS_DEAD = L0_0
function L0_0(A0_210)
  return IsDead(A0_210) ~= true
end
CO_IS_NOT_DEAD = L0_0
function L0_0(A0_211)
  return IsDeadOrZombie(A0_211)
end
CO_IS_DEAD_OR_ZOMBIE = L0_0
function L0_0(A0_212, A1_213)
  return BBIsTargetInFrontOfMe(A0_212, A1_213)
end
CO_IS_TARGET_IN_FRONT_OF_ME = L0_0
function L0_0(A0_214, A1_215)
  return BBIsTargetBehindMe(A0_214, A1_215)
end
CO_IS_TARGET_BEHIND_ME = L0_0
function L0_0(A0_216)
  return IsWard(A0_216)
end
CO_IS_WARD = L0_0
function L0_0(A0_217)
  return IsStructure(A0_217)
end
CO_IS_STRUCTURE = L0_0
function L0_0(A0_218)
  return IsStructure(A0_218) ~= true
end
CO_IS_NOT_STRUCTURE = L0_0
function L0_0(A0_219)
  local L1_220
  L1_220 = A0_219 ~= nil
  return L1_220
end
CO_IS_NOT_NIL = L0_0
function L0_0(A0_221, A1_222, A2_223)
  GetTable(A0_221, A1_222.MacroVarTable, true)[A1_222.MacroVar] = A2_223
end
BBCreateMacro = L0_0
function L0_0(A0_224, A1_225)
  local L2_226
  L2_226 = GetParam
  L2_226 = L2_226("Macro", A0_224, A1_225)
  if L2_226 ~= nil and type(L2_226) == "table" then
    ExecuteBuildingBlocks(L2_226, A0_224)
  else
    DebugClientPrint("Designer Error: Macro variable is not initialized inside of event. Macro Variable was: " .. tostring(A1_225.MacroVar) .. " and current block data is: " .. gCurrentBuildingBlockString .. ". This error probably occurred due to variable not being initialized yet, being misnamed or two events being called out of sequence. It is highly recommended that script macros either be initialized OnBuffActivate, OnCharActivate or in the same event. Pro Devs may violate this rule at the risk of being forced to read this error message again.")
  end
end
BBRunMacro = L0_0
function L0_0(A0_227, A1_228, A2_229)
  local L3_230, L4_231, L5_232, L6_233, L7_234, L8_235
  L3_230 = GetTable
  L3_230 = L3_230(L4_231, L5_232, L6_233)
  L3_230[L4_231] = A2_229
  if L4_231 == nil then
    A2_229.InPerBlockParams = A1_228
    for L7_234 = 1, 6 do
      L8_235 = "FunctionParameter"
      L8_235 = L8_235 .. L7_234 .. "Var"
      if A1_228[L8_235 .. "Table"] ~= nil then
        DebugClientPrint("Designer Error: CreateFunction can only input parameters to PassThroughParams. Current block data is: " .. gCurrentBuildingBlockString .. ".")
      end
    end
  end
end
BBCreateFunction = L0_0
function L0_0(A0_236, A1_237)
  local L2_238, L3_239, L4_240, L5_241, L6_242
  for L5_241 = 1, 6 do
    L6_242 = "FunctionOutput"
    L6_242 = L6_242 .. L5_241 .. "Var"
    if A1_237[L6_242] ~= nil and A1_237[L6_242] ~= "" then
      if A1_237[L6_242 .. "Table"] ~= nil then
        DebugClientPrint("Designer Error: EndFunction can only output from PassThroughParams. Current block data is: " .. gCurrentBuildingBlockString .. ".")
      else
        A0_236[L6_242] = A0_236[A1_237[L6_242]]
      end
    end
  end
end
BBEndFunction = L0_0
function L0_0(A0_243, A1_244)
  local L2_245, L3_246, L4_247, L5_248, L6_249, L7_250, L8_251, L9_252
  L2_245 = GetParam
  L3_246 = "Function"
  L2_245 = L2_245(L3_246, L4_247, L5_248)
  L3_246 = {}
  L3_246.InstanceVars = L4_247
  L3_246.CharVars = L4_247
  L3_246.NextBuffVars = L4_247
  L3_246.AvatarVars = L4_247
  L3_246.SpellVars = L4_247
  L3_246.WorldVars = L4_247
  L3_246.Target = L4_247
  L3_246[L4_247] = L5_248
  L3_246.Attacker = L4_247
  L3_246[L4_247] = L5_248
  L3_246.Owner = L4_247
  L3_246[L4_247] = L5_248
  L3_246.Caster = L4_247
  L3_246.GoldRedirectTarget = L4_247
  L3_246.Unit = L4_247
  L3_246.Other1 = L4_247
  L3_246.Other2 = L4_247
  L3_246.Other3 = L4_247
  L3_246.Nothing = L4_247
  if L2_245 ~= nil then
    if L4_247 == "table" then
      if L4_247 ~= nil then
        for L8_251 = 1, 6 do
          L9_252 = "FunctionParameter"
          L9_252 = L9_252 .. L8_251 .. "Var"
          if A1_244[L9_252] ~= nil and A1_244[L9_252] ~= "" and L4_247[L9_252] ~= nil and L4_247[L9_252] ~= "" then
            L3_246[L4_247[L9_252]] = GetTable(A0_243, A1_244[L9_252 .. "Table"], false)[A1_244[L9_252]]
          end
        end
      end
      L4_247(L5_248, L6_249)
      for L7_250 = 1, 6 do
        L8_251 = "FunctionOutput"
        L9_252 = L7_250
        L8_251 = L8_251 .. L9_252 .. "Var"
        L9_252 = A1_244[L8_251]
        if L9_252 ~= nil then
          L9_252 = A1_244[L8_251]
          if L9_252 ~= "" then
            L9_252 = L3_246
            GetTable(A0_243, A1_244[L8_251 .. "Table"], false)[A1_244[L8_251]] = L9_252[L8_251]
          end
        end
      end
    end
  else
    L8_251 = gCurrentBuildingBlockString
    L9_252 = ". This error probably occurred due to variable not being initialized yet, being misnamed or two events being called out of sequence. It is highly recommended that script functions either be initialized OnBuffActivate, OnCharActivate or in the same event. Pro Devs may violate this rule at the risk of being forced to read this error message again."
    L4_247(L5_248)
  end
end
BBRunFunction = L0_0
function L0_0(A0_253, A1_254, A2_255)
  local L3_256, L4_257, L5_258, L6_259
  L3_256 = GetTable
  L4_257 = A0_253
  L5_258 = A1_254.Src1VarTable
  L6_259 = false
  L3_256 = L3_256(L4_257, L5_258, L6_259)
  L4_257 = GetTable
  L5_258 = A0_253
  L6_259 = A1_254.Src2VarTable
  L4_257 = L4_257(L5_258, L6_259, false)
  L5_258 = false
  L6_259 = nil
  if L3_256 ~= nil and A1_254.Src1Var ~= nil then
    L6_259 = L3_256[A1_254.Src1Var]
  else
    L6_259 = A1_254.Value1
  end
  if L4_257 ~= nil and A1_254.Src2Var ~= nil then
    L5_258 = A1_254.CompareOp(L6_259, L4_257[A1_254.Src2Var])
  else
    L5_258 = A1_254.CompareOp(L6_259, A1_254.Value2)
  end
  if L5_258 then
    ExecuteBuildingBlocks(A2_255, A0_253)
    A0_253.LastIfSucceeded = true
  else
    A0_253.LastIfSucceeded = false
  end
end
BBIf = L0_0
function L0_0(A0_260, A1_261, A2_262)
  if A0_260.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_262, A0_260)
    A0_260.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_263, A1_264, A2_265)
  if A0_263.LastIfSucceeded == true then
    ExecuteBuildingBlocks(A2_265, A0_263)
    A0_263.LastIfSucceeded = true
  else
    BBIf(A0_263, A1_264, A2_265)
  end
end
BBOrIf = L0_0
function L0_0(A0_266, A1_267, A2_268)
  if A0_266.LastIfSucceeded == true then
    BBIf(A0_266, A1_267, A2_268)
  end
end
BBAndIf = L0_0
function L0_0(A0_269, A1_270, A2_271)
  local L3_272, L4_273, L5_274, L6_275
  L3_272 = A0_269.LastIfSucceeded
  if L3_272 == false then
    L3_272 = GetTable
    L4_273 = A0_269
    L5_274 = A1_270.Src1VarTable
    L6_275 = false
    L3_272 = L3_272(L4_273, L5_274, L6_275)
    L4_273 = GetTable
    L5_274 = A0_269
    L6_275 = A1_270.Src2VarTable
    L4_273 = L4_273(L5_274, L6_275, false)
    L5_274 = false
    L6_275 = nil
    if L3_272 ~= nil and A1_270.Src1Var ~= nil then
      L6_275 = L3_272[A1_270.Src1Var]
    else
      L6_275 = A1_270.Value1
    end
    if L4_273 ~= nil and A1_270.Src2Var ~= nil then
      L5_274 = A1_270.CompareOp(L6_275, L4_273[A1_270.Src2Var])
    else
      L5_274 = A1_270.CompareOp(L6_275, A1_270.Value2)
    end
    if L5_274 then
      ExecuteBuildingBlocks(A2_271, A0_269)
      A0_269.LastIfSucceeded = true
    else
      A0_269.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_276, A1_277, A2_278)
  local L3_279
  if A1_277.TargetVar ~= nil then
    L3_279 = A0_276[A1_277.TargetVar]
  else
    L3_279 = A0_276.Target
  end
  if HasBuffOfType(L3_279, A1_277.BuffType) then
    ExecuteBuildingBlocks(A2_278, A0_276)
    A0_276.LastIfSucceeded = true
  else
    A0_276.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_280, A1_281, A2_282)
  local L3_283, L4_284
  if A1_281.OwnerVar ~= nil then
    L3_283 = A0_280[A1_281.OwnerVar]
  else
    L3_283 = A0_280.Owner
  end
  if A1_281.AttackerVar ~= nil then
    L4_284 = A0_280[A1_281.AttackerVar]
  else
    L4_284 = A0_280.Attacker
  end
  if SpellBuffCount(L3_283, A1_281.BuffName, L4_284) > 0 then
    ExecuteBuildingBlocks(A2_282, A0_280)
    A0_280.LastIfSucceeded = true
  else
    A0_280.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_285, A1_286, A2_287)
  if BBIsMissileAutoAttack(A0_285, A1_286) then
    ExecuteBuildingBlocks(A2_287, A0_285)
    A0_285.LastIfSucceeded = true
  else
    A0_285.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_288, A1_289, A2_290)
  if BBIsMissileConsideredAsAutoAttack(A0_288, A1_289) then
    ExecuteBuildingBlocks(A2_290, A0_288)
    A0_288.LastIfSucceeded = true
  else
    A0_288.LastIfSucceeded = false
  end
end
BBIfMissileConsideredAsAutoAttack = L0_0
function L0_0(A0_291, A1_292)
  A0_291.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_293, A1_294, A2_295)
  local L3_296, L4_297
  if A1_294.OwnerVar ~= nil then
    L3_296 = A0_293[A1_294.OwnerVar]
  else
    L3_296 = A0_293.Owner
  end
  if A1_294.CasterVar ~= nil then
    L4_297 = A0_293[A1_294.CasterVar]
  else
    L4_297 = A0_293.Caster
  end
  if SpellBuffCount(L3_296, A1_294.BuffName, L4_297) <= 0 then
    ExecuteBuildingBlocks(A2_295, A0_293)
    A0_293.LastIfSucceeded = true
  else
    A0_293.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_298, A1_299, A2_300)
  local L3_301
  if A1_299.TargetVar ~= nil then
    L3_301 = A0_298[A1_299.TargetVar]
  else
    L3_301 = A0_298.Owner
  end
  if HasUnitTag(L3_301, A1_299.UnitTag) ~= A1_299.InvertResult then
    ExecuteBuildingBlocks(A2_300, A0_298)
    A0_298.LastIfSucceeded = true
  else
    A0_298.LastIfSucceeded = false
  end
end
BBIfHasUnitTag = L0_0
function L0_0(A0_302, A1_303, A2_304)
  local L3_305, L4_306
  if A1_303.OwnerVar ~= nil then
    L3_305 = A0_302[A1_303.OwnerVar]
  else
    L3_305 = A0_302.Owner
  end
  if HasPARType(L3_305, A1_303.PARType) then
    ExecuteBuildingBlocks(A2_304, A0_302)
    A0_302.LastIfSucceeded = true
  else
    A0_302.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_307, A1_308, A2_309)
  local L3_310, L4_311
  if A1_308.OwnerVar ~= nil then
    L3_310 = A0_307[A1_308.OwnerVar]
  else
    L3_310 = A0_307.Owner
  end
  if not HasPARType(L3_310, A1_308.PARType) then
    ExecuteBuildingBlocks(A2_309, A0_307)
    A0_307.LastIfSucceeded = true
  else
    A0_307.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_312, A1_313, A2_314)
  local L3_315, L4_316, L5_317, L6_318, L7_319
  L3_315 = GetTable
  L4_316 = A0_312
  L5_317 = A1_313.Src1VarTable
  L6_318 = false
  L3_315 = L3_315(L4_316, L5_317, L6_318)
  L4_316 = GetTable
  L5_317 = A0_312
  L6_318 = A1_313.Src2VarTable
  L7_319 = false
  L4_316 = L4_316(L5_317, L6_318, L7_319)
  L5_317 = true
  while L5_317 do
    L6_318 = false
    L7_319 = nil
    if L3_315 ~= nil and A1_313.Src1Var ~= nil then
      L7_319 = L3_315[A1_313.Src1Var]
    else
      L7_319 = A1_313.Value1
    end
    if L4_316 ~= nil and A1_313.Src2Var ~= nil then
      L6_318 = A1_313.CompareOp(L7_319, L4_316[A1_313.Src2Var])
    else
      L6_318 = A1_313.CompareOp(L7_319, A1_313.Value2)
    end
    if L6_318 then
      ExecuteBuildingBlocks(A2_314, A0_312)
    else
      L5_317 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_320, A1_321)
  return A0_320 * A1_321
end
MO_MULTIPLY = L0_0
function L0_0(A0_322, A1_323)
  return A0_322 + A1_323
end
MO_ADD = L0_0
function L0_0(A0_324, A1_325)
  return A0_324 - A1_325
end
MO_SUBTRACT = L0_0
function L0_0(A0_326, A1_327)
  return A0_326 / A1_327
end
MO_DIVIDE = L0_0
function L0_0(A0_328, A1_329)
  if A0_328 < A1_329 then
    return A0_328
  else
    return A1_329
  end
end
MO_MIN = L0_0
function L0_0(A0_330, A1_331)
  if A1_331 < A0_330 then
    return A0_330
  else
    return A1_331
  end
end
MO_MAX = L0_0
function L0_0(A0_332, A1_333)
  return A0_332 % A1_333
end
MO_MODULO = L0_0
function L0_0(A0_334)
  return math.floor(A0_334 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_335)
  return math.ceil(A0_335)
end
MO_ROUNDUP = L0_0
function L0_0(A0_336)
  return math.floor(A0_336)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_337)
  return math.sin(math.rad(A0_337))
end
MO_SIN = L0_0
function L0_0(A0_338)
  return math.cos(math.rad(A0_338))
end
MO_COSINE = L0_0
function L0_0(A0_339)
  return math.tan(math.rad(A0_339))
end
MO_TANGENT = L0_0
function L0_0(A0_340)
  return math.deg(math.asin(A0_340))
end
MO_ASIN = L0_0
function L0_0(A0_341)
  return math.deg(math.acos(A0_341))
end
MO_ACOS = L0_0
function L0_0(A0_342)
  return math.deg(math.atan(A0_342))
end
MO_ATAN = L0_0
function L0_0(A0_343, A1_344)
  return math.pow(A0_343, A1_344)
end
MO_POW = L0_0
function L0_0(A0_345)
  return math.sqrt(A0_345)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_346, A1_347)
  local L2_348
  L2_348 = A0_346 and A1_347
  return L2_348
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_349, A1_350)
  local L2_351
  L2_351 = A0_349 or A1_350
  return L2_351
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_352)
  local L1_353
  L1_353 = not A0_352
  return L1_353
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_354)
  return math.abs(A0_354)
end
MO_ABS = L0_0
function L0_0(A0_355, A1_356)
  return math.random(A0_355, A1_356)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_357, A1_358)
  local L2_359, L3_360, L4_361, L5_362
  L2_359 = GetMathNumber
  L3_360 = A0_357
  L4_361 = A1_358.Src1VarTable
  L5_362 = A1_358.Src1Var
  L2_359 = L2_359(L3_360, L4_361, L5_362, A1_358.Src1Value)
  L3_360 = GetMathNumber
  L4_361 = A0_357
  L5_362 = A1_358.Src2VarTable
  L3_360 = L3_360(L4_361, L5_362, A1_358.Src2Var, A1_358.Src2Value)
  L4_361 = GetTable
  L5_362 = A0_357
  L4_361 = L4_361(L5_362, A1_358.DestVarTable)
  L5_362 = A1_358.MathOp
  L5_362 = L5_362(L2_359, L3_360)
  SetVarInTable(A0_357, A1_358, L5_362)
end
BBMath = L0_0
function L0_0(A0_363, A1_364, A2_365, A3_366)
  if A2_365 ~= nil and GetTable(A0_363, A1_364)[A2_365] ~= nil then
    return GetTable(A0_363, A1_364)[A2_365]
  end
  return A3_366
end
GetMathNumber = L0_0
function L0_0(A0_367, A1_368)
  if type(A1_368) == "number" then
    return A1_368
  elseif type(A1_368) == "function" then
    return A1_368(A0_367)
  elseif type(A1_368) == "string" then
    return A0_367[A1_368]
  end
end
GetNumber = L0_0
function L0_0(A0_369, A1_370)
  return VectorAdd(A0_369, A1_370)
end
VEC_ADD = L0_0
function L0_0(A0_371, A1_372)
  return VectorSubtract(A0_371, A1_372)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_373, A1_374)
  return VectorScalarMultiply(A0_373, A1_374)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_375, A1_376)
  return VectorScalarDivide(A0_375, A1_376)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_377, A1_378)
  return VectorRotateY(A0_377, A1_378)
end
VEC_ROTATE = L0_0
function L0_0(A0_379, A1_380)
  BBMath(A0_379, A1_380)
end
BBVectorMath = L0_0
function L0_0(A0_381, A1_382)
  local L2_383, L3_384, L4_385, L5_386
  L2_383 = A0_381.InstanceVars
  L3_384 = L2_383.InterpDelta
  if L3_384 == nil then
    L3_384 = A1_382.Amount
    L4_385 = A1_382.AmountVar
    if L4_385 ~= nil then
      L4_385 = GetTable
      L5_386 = A0_381
      L4_385 = L4_385(L5_386, A1_382.AmountVarTable)
      L5_386 = A1_382.AmountVar
      L3_384 = L4_385[L5_386]
    end
    L4_385 = GetPosition
    L5_386 = A1_382.TargetVar
    L5_386 = A0_381[L5_386]
    L4_385 = L4_385(L5_386)
    L2_383.KnockBackStart = L4_385
    L4_385 = GetNormalizedPositionDelta
    L5_386 = A1_382.TargetVar
    L5_386 = A0_381[L5_386]
    L4_385 = L4_385(L5_386, A0_381[A1_382.AttackerVar], true)
    L5_386 = {}
    L5_386.x = L4_385.x * L3_384
    L5_386.y = 0
    L5_386.z = L4_385.z * L3_384
    L2_383.InterpDelta = L5_386
    L5_386 = GetTime
    L5_386 = L5_386()
    L2_383.StartTime = L5_386
    L5_386 = A1_382.KnockBackDuration
    L2_383.KnockBackDuration = L5_386
  end
  L3_384 = A1_382.TargetVar
  L3_384 = A0_381[L3_384]
  L4_385 = GetTime
  L4_385 = L4_385()
  L5_386 = L2_383.StartTime
  L4_385 = L4_385 - L5_386
  L5_386 = L2_383.KnockBackDuration
  L4_385 = L4_385 / L5_386
  L5_386 = {}
  L5_386.x = L2_383.KnockBackStart.x + L2_383.InterpDelta.x * L4_385
  L5_386.y = L2_383.KnockBackStart.y
  L5_386.z = L2_383.KnockBackStart.z + L2_383.InterpDelta.z * L4_385
  SetPosition(L3_384, L5_386)
end
BBKnockback = L0_0
function L0_0(A0_387, A1_388)
  local L2_389, L3_390
  L2_389 = GetParam
  L3_390 = "Left"
  L2_389 = L2_389(L3_390, A0_387, A1_388)
  L3_390 = GetParam
  L3_390 = L3_390("Right", A0_387, A1_388)
  GetTable(A0_387, A1_388.DestVarTable, true)[A1_388.DestVar] = tostring(L2_389) .. tostring(L3_390)
end
BBAppendString = L0_0
function L0_0(A0_391, A1_392)
  local L2_393
  L2_393 = 0
  if A1_392.Delta ~= nil then
    L2_393 = L2_393 + A1_392.Delta
  end
  if A1_392.DeltaByLevel ~= nil and A0_391.Level ~= nil then
    L2_393 = L2_393 + A1_392.DeltaByLevel[A0_391.Level]
  end
  if A1_392.DeltaVar ~= nil then
    L2_393 = L2_393 + GetTable(A0_391, A1_392.DeltaVarTable, true)[A1_392.DeltaVar]
  end
  if A1_392.TargetVar ~= nil then
    A1_392.Stat(L2_393, A0_391[A1_392.TargetVar])
  else
    A1_392.Stat(L2_393)
  end
end
BBIncStat = L0_0
function L0_0(A0_394, A1_395)
  local L2_396
  L2_396 = 0
  if A1_395.Delta ~= nil then
    L2_396 = L2_396 + A1_395.Delta
  end
  if A1_395.DeltaByLevel ~= nil and A0_394.Level ~= nil then
    L2_396 = L2_396 + A1_395.DeltaByLevel[A0_394.Level]
  end
  if A1_395.DeltaVar ~= nil then
    L2_396 = L2_396 + GetTable(A0_394, A1_395.DeltaVarTable, true)[A1_395.DeltaVar]
  end
  if A1_395.TargetVar ~= nil then
    A1_395.Stat(L2_396, A0_394[A1_395.TargetVar])
  else
    A1_395.Stat(L2_396)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_397, A1_398)
  local L2_399, L3_400
  L2_399 = A1_398.TargetVar
  L3_400 = 0
  if A1_398.LaneVar ~= nil then
    L3_400 = L3_400 + GetTable(A0_397, A1_398.LaneVarTable, true)[A1_398.LaneVar]
  end
  if A1_398.Lane ~= nil then
    L3_400 = L3_400 + A1_398.Lane
  end
  SetMinionLane(A0_397[L2_399], L3_400)
end
BBSetMinionLane = L0_0
function L0_0(A0_401, A1_402)
  if A1_402.AttackVar ~= nil then
  end
  if A1_402.Attack ~= nil then
  end
  if A1_402.TotalCoefficientVar ~= nil then
  end
  if A1_402.TotalCoefficient ~= nil then
  end
  if A1_402.TargetVar ~= nil then
    GetTable(A0_401, A1_402.DestVarTable, false)[A1_402.DestVar] = (0 + GetTable(A0_401, A1_402.AttackVarTable, true)[A1_402.AttackVar] + A1_402.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_401[A1_402.TargetVar])) + GetFlatCritDamageMod(A0_401[A1_402.TargetVar])) * (0 + GetTable(A0_401, A1_402.TotalCoefficientVarTable, true)[A1_402.TotalCoefficientVar] + A1_402.TotalCoefficient)
  else
    GetTable(A0_401, A1_402.DestVarTable, false)[A1_402.DestVar] = 2 * A1_402.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_403, A1_404)
  local L2_405, L3_406, L4_407, L5_408, L6_409, L7_410
  L2_405 = GetTable
  L3_406 = A0_403
  L4_407 = A1_404.DestVarTable
  L5_408 = false
  L2_405 = L2_405(L3_406, L4_407, L5_408)
  L3_406 = GetTable
  L4_407 = A0_403
  L5_408 = A1_404.AmountVarTable
  L6_409 = true
  L3_406 = L3_406(L4_407, L5_408, L6_409)
  L4_407 = GetTable
  L5_408 = A0_403
  L6_409 = A0_403.NextBuffVars
  L7_410 = false
  L4_407 = L4_407(L5_408, L6_409, L7_410)
  L5_408 = A1_404.AmountVar
  L5_408 = L3_406[L5_408]
  L6_409 = A1_404.Amount
  L5_408 = L5_408 + L6_409
  L4_407.InitializeShield_Amount = L5_408
  L5_408 = A1_404.AmountVar
  if L5_408 ~= nil then
    L5_408 = A1_404.HealShieldMod
    if L5_408 ~= nil and L5_408 == true then
      L6_409 = A1_404.AttackerVar
      L7_410 = 0
      if L6_409 ~= nil then
        L7_410 = GetPercentHealingAmountMod(A0_403[L6_409])
      end
      L4_407.InitializeShield_Amount, L3_406[A1_404.AmountVar] = (A1_404.Amount + L3_406[A1_404.AmountVar]) * (1 + L7_410), (A1_404.Amount + L3_406[A1_404.AmountVar]) * (1 + L7_410)
    end
  end
  L5_408 = SpellBuffAddNoRenew
  L6_409 = A1_404.AttackerVar
  L6_409 = A0_403[L6_409]
  L7_410 = A1_404.UnitVar
  L7_410 = A0_403[L7_410]
  L5_408(L6_409, L7_410, "InitializeShieldMarker", 0, 1, 25000, L4_407)
  L5_408 = BBIncreaseShield
  L6_409 = A0_403
  L7_410 = A1_404
  L5_408(L6_409, L7_410)
end
BBInitializeShield = L0_0
function L0_0(A0_411, A1_412)
  if A1_412.CDVar ~= nil then
  end
  if A1_412.CD ~= nil then
  end
  if A1_412.TargetVar ~= nil then
    GetTable(A0_411, A1_412.DestVarTable, false)[A1_412.DestVar] = (0 + GetTable(A0_411, A1_412.CDVarTable, true)[A1_412.CDVar] + A1_412.CD) * (1 + GetPercentCooldownMod(A0_411[A1_412.TargetVar]))
  else
    GetTable(A0_411, A1_412.DestVarTable, false)[A1_412.DestVar] = A1_412.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_413, A1_414)
  local L2_415, L3_416
  L3_416 = A1_414.TargetVar
  if L3_416 ~= nil then
    L2_415 = A1_414.Stat(A0_413[L3_416])
  else
    L2_415 = A1_414.Stat()
  end
  SetVarInTable(A0_413, A1_414, L2_415)
end
BBGetStat = L0_0
function L0_0(A0_417, A1_418)
  if A1_418.TargetVar ~= nil then
    GetTable(A0_417, A1_418.DestVarTable, false)[A1_418.DestVar] = GetLevel(A0_417[A1_418.TargetVar])
  else
    GetTable(A0_417, A1_418.DestVarTable, false)[A1_418.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_419, A1_420)
  if A1_420.TargetVar ~= nil then
    GetTable(A0_419, A1_420.DestVarTable, false)[A1_420.DestVar] = GetUnitSignificance(A0_419[A1_420.TargetVar])
  else
    GetTable(A0_419, A1_420.DestVarTable, false)[A1_420.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_421, A1_422)
  if A1_422.TargetVar ~= nil then
    GetTable(A0_421, A1_422.DestVarTable, false)[A1_422.DestVar] = GetArmor(A0_421[A1_422.TargetVar])
  else
    GetTable(A0_421, A1_422.DestVarTable, false)[A1_422.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_423, A1_424)
  if A1_424.TargetVar ~= nil then
    GetTable(A0_423, A1_424.DestVarTable, false)[A1_424.DestVar] = GetSpellBlock(A0_423[A1_424.TargetVar])
  else
    GetTable(A0_423, A1_424.DestVarTable, false)[A1_424.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_425, A1_426)
  local L2_427, L3_428
  L3_428 = A1_426.TargetVar
  if L3_428 ~= nil then
    L2_427 = GetTeamID(A0_425[L3_428])
  else
    L2_427 = GetTeamID()
  end
  SetVarInTable(A0_425, A1_426, L2_427)
end
BBGetTeamID = L0_0
function L0_0(A0_429, A1_430)
  local L2_431, L3_432, L4_433
  L2_431 = GetTable
  L3_432 = A0_429
  L4_433 = A1_430.DestVarTable
  L2_431 = L2_431(L3_432, L4_433, false)
  L3_432 = A1_430.TargetVar
  L4_433 = nil
  if L3_432 ~= nil then
    L4_433 = GetTeamID(A0_429[L3_432])
  else
    L4_433 = GetTeamID()
  end
  if L4_433 == TEAM_ORDER then
    L2_431[A1_430.DestVar] = TEAM_CHAOS
  elseif L4_433 == TEAM_CHAOS then
    L2_431[A1_430.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_434, A1_435)
  if A1_435.TargetVar ~= nil then
    GetTable(A0_434, A1_435.DestVarTable, false)[A1_435.DestVar] = GetUnitSkinName(A0_434[A1_435.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_436, A1_437)
  local L2_438, L3_439, L4_440
  L2_438 = GetTable
  L3_439 = A0_436
  L4_440 = A1_437.DestVarTable
  L2_438 = L2_438(L3_439, L4_440, false)
  L3_439 = A0_436.Owner
  L4_440 = nil
  if A1_437.TargetVar ~= nil then
    L4_440 = GetTotalAttackDamage(A0_436[A1_437.TargetVar])
  else
    L4_440 = GetTotalAttackDamage()
  end
  SetVarInTable(A0_436, A1_437, L4_440)
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_441, A1_442)
  GetTable(A0_441, A1_442.DestVarTable, true)[A1_442.DestVar] = A1_442.Status(A0_441[A1_442.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_443, A1_444)
  local L2_445
  L2_445 = A1_444.TargetVar
  L2_445 = A0_443[L2_445]
  ClearAttackTarget(L2_445)
end
BBClearAttackTarget = L0_0
function L0_0(A0_446, A1_447)
  local L2_448, L3_449
  L2_448 = GetTable
  L3_449 = A0_446
  L2_448 = L2_448(L3_449, A1_447.DestVarTable, true)
  L3_449 = A1_447.Info
  L3_449 = L3_449(A0_446[A1_447.TargetVar])
  SetVarInTable(A0_446, A1_447, L3_449)
end
BBGetCastInfo = L0_0
function L0_0(A0_450, A1_451, A2_452)
  local L3_453, L4_454, L5_455, L6_456
  L3_453 = GetTable
  L4_454 = A0_450
  L5_455 = A1_451.TrackTimeVarTable
  L6_456 = false
  L3_453 = L3_453(L4_454, L5_455, L6_456)
  L4_454 = GetTime
  L4_454 = L4_454()
  L5_455 = A1_451.ExecuteImmediately
  L6_456 = GetParam
  L6_456 = L6_456("TimeBetweenExecutions", A0_450, A1_451)
  if A1_451.TickTimeVar ~= nil and GetTable(A0_450, A1_451.TickTimeVarTable, false)[A1_451.TickTimeVar] ~= nil then
    L6_456 = GetTable(A0_450, A1_451.TickTimeVarTable, false)[A1_451.TickTimeVar]
  end
  if L3_453[A1_451.TrackTimeVar] == nil then
    L3_453[A1_451.TrackTimeVar] = L4_454
    if L5_455 == true then
      ExecuteBuildingBlocks(A2_452, A0_450)
    end
  end
  if L4_454 >= L3_453[A1_451.TrackTimeVar] + L6_456 then
    L3_453[A1_451.TrackTimeVar] = L3_453[A1_451.TrackTimeVar] + L6_456
    ExecuteBuildingBlocks(A2_452, A0_450)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_457, A1_458, A2_459)
  GetTable(A0_457, A1_458.TrackTimeVarTable, false)[A1_458.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_460, A1_461)
  local L2_462
  L2_462 = A1_461.SrcValue
  if A1_461.SrcVar ~= nil then
    L2_462 = GetTable(A0_460, A1_461.SrcVarTable, true)[A1_461.SrcVar]
  end
  A1_461.Status(A0_460[A1_461.TargetVar], L2_462)
end
BBSetStatus = L0_0
function L0_0(A0_463, A1_464)
  local L2_465
  L2_465 = A1_464.ToAlert
  if GetTable(A0_463, A1_464.SrcVarTable, false) ~= nil and A1_464.SrcVar ~= nil then
    L2_465 = L2_465 .. GetTable(A0_463, A1_464.SrcVarTable, false)[A1_464.SrcVar]
  end
  _ALERT(L2_465)
end
BBAlert = L0_0
function L0_0(A0_466, A1_467)
  local L2_468, L3_469, L4_470, L5_471, L6_472, L7_473
  L2_468 = GetParam
  L3_469 = "Value"
  L4_470 = A0_466
  L5_471 = A1_467
  L2_468 = L2_468(L3_469, L4_470, L5_471)
  if L2_468 == nil then
    L3_469 = ReportError
    L4_470 = "Could not resolve Value param"
    L3_469(L4_470)
    return
  end
  L3_469 = true
  L4_470 = GetParam
  L5_471 = "OnUnit"
  L6_472 = A0_466
  L7_473 = A1_467
  L4_470 = L4_470(L5_471, L6_472, L7_473)
  if L4_470 == nil then
    L3_469 = false
    L5_471 = GetParam
    L6_472 = "OnUnitByFlag"
    L7_473 = A0_466
    L5_471 = L5_471(L6_472, L7_473, A1_467)
    L4_470 = L5_471
  end
  if L4_470 == nil then
    L5_471 = ReportError
    L6_472 = "Could not resolve OnUnit param"
    L5_471(L6_472)
    return
  end
  L5_471 = true
  L6_472 = GetParam
  L7_473 = "ChampionToSayTo"
  L6_472 = L6_472(L7_473, A0_466, A1_467)
  if L6_472 == nil then
    L5_471 = false
    L7_473 = GetParam
    L7_473 = L7_473("ChampionToSayToByFlag", A0_466, A1_467)
    L6_472 = L7_473
  end
  if L6_472 == nil then
    L7_473 = ReportError
    L7_473("Could not resolve ChampionToSayTo param")
    return
  end
  L7_473 = GetParam
  L7_473 = L7_473("ShowToSpectator", A0_466, A1_467)
  if L7_473 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  DisplayNumericFloatingTextOnUnitToChampion(L2_468, A1_467.TextType, L4_470, L3_469, L6_472, L5_471, L7_473)
end
BBDisplayNumericFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_474, A1_475)
  local L2_476, L3_477, L4_478, L5_479, L6_480, L7_481
  L2_476 = GetParam
  L3_477 = "Message"
  L4_478 = A0_474
  L5_479 = A1_475
  L2_476 = L2_476(L3_477, L4_478, L5_479)
  if L2_476 == nil then
    L3_477 = ReportError
    L4_478 = "Could not resolve Message param"
    L3_477(L4_478)
    return
  end
  L3_477 = true
  L4_478 = GetParam
  L5_479 = "OnUnit"
  L6_480 = A0_474
  L7_481 = A1_475
  L4_478 = L4_478(L5_479, L6_480, L7_481)
  if L4_478 == nil then
    L3_477 = false
    L5_479 = GetParam
    L6_480 = "OnUnitByFlag"
    L7_481 = A0_474
    L5_479 = L5_479(L6_480, L7_481, A1_475)
    L4_478 = L5_479
  end
  if L4_478 == nil then
    L5_479 = ReportError
    L6_480 = "Could not resolve OnUnit param"
    L5_479(L6_480)
    return
  end
  L5_479 = true
  L6_480 = GetParam
  L7_481 = "ChampionToSayTo"
  L6_480 = L6_480(L7_481, A0_474, A1_475)
  if L6_480 == nil then
    L5_479 = false
    L7_481 = GetParam
    L7_481 = L7_481("ChampionToSayToByFlag", A0_474, A1_475)
    L6_480 = L7_481
  end
  if L6_480 == nil then
    L7_481 = ReportError
    L7_481("Could not resolve ChampionToSayTo param")
    return
  end
  L7_481 = GetParam
  L7_481 = L7_481("ShowToSpectator", A0_474, A1_475)
  if L7_481 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  SayWithFloatingTextOnUnitToChampion(tostring(L2_476), A1_475.TextType, L4_478, L3_477, L6_480, L5_479, L7_481)
end
BBSayWithFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_482, A1_483)
  local L2_484, L3_485, L4_486
  L2_484 = A1_483.ToSay
  L3_485 = GetTable
  L4_486 = A0_482
  L3_485 = L3_485(L4_486, A1_483.SrcVarTable, false)
  if L3_485 ~= nil then
    L4_486 = A1_483.SrcVar
    if L4_486 ~= nil then
      L4_486 = L2_484
      L2_484 = L4_486 .. tostring(L3_485[A1_483.SrcVar])
    end
  end
  L4_486 = nil
  if A1_483.OwnerVar ~= nil then
    L4_486 = A0_482[A1_483.OwnerVar]
  else
    L4_486 = A0_482.Owner
  end
  if A1_483.TextType == nil then
    A1_483.TextType = 0
  end
  Say(L4_486, L2_484, A1_483.TextType)
end
BBSay = L0_0
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
BBDebugSay = L0_0
function L0_0(A0_492, A1_493)
  GetTable(A0_492, A1_493.DestVarTable, true)[A1_493.DestVar] = BBLuaGetGold(A0_492, A1_493)
end
BBGetGold = L0_0
function L0_0(A0_494, A1_495)
  GetTable(A0_494, A1_495.DestVarTable, true)[A1_495.DestVar] = BBLuaGetTotalGold(A0_494, A1_495)
end
BBGetTotalGold = L0_0
function L0_0(A0_496, A1_497)
  SpellBuffAdd(A0_496[A1_497.OwnerVar], A0_496[A1_497.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_496.NextBuffVars)
  BBTeleportToPositionHelper(A0_496, A1_497)
end
BBTeleportToPosition = L0_0
function L0_0(A0_498, A1_499)
  if A1_499.XVar ~= nil and GetTable(A0_498, A1_499.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_498, A1_499.XVarTable, true)[A1_499.XVar]
  else
    Xloc = A1_499.X
  end
  if A1_499.YVar ~= nil and GetTable(A0_498, A1_499.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_498, A1_499.YVarTable, true)[A1_499.YVar]
  else
    Yloc = A1_499.Y
  end
  if A1_499.ZVar ~= nil and GetTable(A0_498, A1_499.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_498, A1_499.ZVarTable, true)[A1_499.ZVar]
  else
    Zloc = A1_499.Z
  end
  A1_499.OwnerVar, A0_498.position = A1_499.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_499.CastPositionName = "position"
  BBTeleportToPosition(A0_498, A1_499)
end
BBTeleportToPoint = L0_0
function L0_0(A0_500, A1_501)
  A1_501.TimeoutInFOW = 999999
  A1_501.BindFlexToOwnerPAR = false
  A1_501.Flags = 0
  A1_501.FollowsGroundTilt = false
  A1_501.FacesTarget = false
  A1_501.HideFromSpectator = false
  A1_501.SendIfOnScreenOrDiscard = false
  A1_501.PersistsThroughReconnect = true
  A1_501.FOWVisibilityRadius = 10
  A1_501.Scale = 1
  A1_501.BindObjectVar = A1_501.BindObject1Var
  A1_501.EffectID2Var = A1_501.OtherTeamEffectIDVar
  A1_501.TargetObjectVar = A1_501.BindObject2Var
  A1_501.FOWTeamOverrideVar = A1_501.FOWTeamVar
  A1_501.BoneName = A1_501.BindObject1BoneName
  A1_501.TargetBoneName = A1_501.BindObject2BoneName
  A1_501.EffectName = A1_501.EffectParticleFile
  A1_501.EffectNameForOtherTeam = A1_501.OtherTeamParticleFile
  BBSpellEffectCreate(A0_500, A1_501)
end
BBSpellEffectCreate_EasyBeam = L0_0
function L0_0(A0_502, A1_503)
  A1_503.TimeoutInFOW = 999999
  A1_503.BindFlexToOwnerPAR = false
  A1_503.Flags = 0
  A1_503.FollowsGroundTilt = false
  A1_503.FacesTarget = false
  A1_503.HideFromSpectator = false
  A1_503.SendIfOnScreenOrDiscard = true
  A1_503.PersistsThroughReconnect = false
  A1_503.FOWVisibilityRadius = 10
  A1_503.Scale = 1
  A1_503.FOWTeamOverrideVar = A1_503.FOWTeamVar
  A1_503.EffectName = A1_503.ParticleFile
  A1_503.EffectNameForOtherTeam = A1_503.ParticleFileForOtherTeam
  A1_503.BoneName = A1_503.BindObjectBoneName
  BBSpellEffectCreate(A0_502, A1_503)
end
BBSpellEffectCreate_EasyHit = L0_0
function L0_0(A0_504, A1_505)
  ReincarnateNonDeadHero(GetTable(A0_504, A1_505.TargetTable, false)[A1_505.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_506, A1_507)
  GetTable(A0_506, A1_507.DestVarTable, true)[A1_507.DestVar] = A1_507.Function(A0_506[A1_507.OwnerVar], A1_507.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_508, A1_509)
  local L2_510, L3_511, L4_512, L5_513
  L2_510 = A1_509.WhomToOrderVar
  L2_510 = A0_508[L2_510]
  L3_511 = A1_509.TargetOfOrderVar
  L3_511 = A0_508[L3_511]
  L4_512 = GetTable
  L5_513 = A0_508
  L4_512 = L4_512(L5_513, A1_509.SrcVarTable, false)
  L5_513 = nil
  if A1_509.SrcVar ~= nil and L4_512 ~= nil then
    L5_513 = L4_512[A1_509.SrcVar]
  else
    L5_513 = GetPosition(L3_511)
  end
  if L3_511 == nil then
    L3_511 = L2_510
  end
  IssueOrder(L2_510, A1_509.Order, L5_513, L3_511)
end
BBIssueOrder = L0_0
function L0_0(A0_514, A1_515)
  local L2_516
  L2_516 = GetParam
  L2_516 = L2_516("NewRange", A0_514, A1_515)
  SetSpellCastRange(L2_516)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_517, A1_518)
  GetTable(A0_517, A1_518.DestVarTable, true)[A1_518.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_519, A1_520)
  local L2_521, L3_522
  L2_521 = A1_520.ObjectVar1
  L2_521 = A0_519[L2_521]
  L3_522 = A1_520.ObjectVar2
  L3_522 = A0_519[L3_522]
  GetTable(A0_519, A1_520.DestVarTable, true)[A1_520.DestVar] = DistanceBetweenObjectBounds(L2_521, L3_522)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_523, A1_524)
  local L2_525, L3_526, L4_527
  L2_525 = A1_524.ObjectVar
  L2_525 = A0_523[L2_525]
  L3_526 = GetTable
  L4_527 = A0_523
  L3_526 = L3_526(L4_527, A1_524.PointVarTable, true)
  L4_527 = A1_524.PointVar
  L4_527 = L3_526[L4_527]
  GetTable(A0_523, A1_524.DestVarTable, true)[A1_524.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_525, L4_527)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_528, A1_529)
  local L2_530, L3_531
  L2_530 = GetParam
  L3_531 = "Point1"
  L2_530 = L2_530(L3_531, A0_528, A1_529)
  L3_531 = GetParam
  L3_531 = L3_531("Point2", A0_528, A1_529)
  GetTable(A0_528, A1_529.DestVarTable, true)[A1_529.DestVar] = DistanceBetweenPoints(L2_530, L3_531)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_532, A1_533, A2_534)
  local L3_535, L4_536, L5_537, L6_538, L7_539, L8_540
  L5_537 = 0
  L6_538 = nil
  L7_539 = A1_533.ObjectDistanceType
  L8_540 = A1_533.ObjectVar1
  L3_535 = A0_532[L8_540]
  L8_540 = A1_533.ObjectVar2
  L4_536 = A0_532[L8_540]
  if nil == L4_536 then
    L8_540 = A1_533.Point2Var
    if nil ~= L8_540 then
      L8_540 = GetTable
      L8_540 = L8_540(A0_532, A1_533.Point2VarTable, true)
      L4_536 = L8_540[A1_533.Point2Var]
      L5_537 = L5_537 + 1
    end
  end
  if nil == L3_535 then
    L8_540 = A1_533.Point1Var
    if nil ~= L8_540 then
      L8_540 = GetTable
      L8_540 = L8_540(A0_532, A1_533.Point1VarTable, true)
      L3_535 = L8_540[A1_533.Point1Var]
      L5_537 = L5_537 + 1
      if 1 == L5_537 then
        L3_535, L4_536 = L4_536, L3_535
      end
    end
  end
  if nil ~= L7_539 then
    if 0 == L5_537 then
      L8_540 = OBJECT_CENTER
      if L8_540 == L7_539 then
        L6_538 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_540 = OBJECT_BOUNDARY
        if L8_540 == L7_539 then
          L6_538 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_540 = A1_533.OwnerVar
          L8_540 = A0_532[L8_540]
          Say(L8_540, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_537 then
      L8_540 = OBJECT_CENTER
      if L8_540 == L7_539 then
        L6_538 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_540 = OBJECT_BOUNDARY
        if L8_540 == L7_539 then
          L6_538 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_540 = A1_533.OwnerVar
          L8_540 = A0_532[L8_540]
          Say(L8_540, "invalid object distance type", 0)
        end
      end
    else
      L6_538 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_540 = A1_533.Distance
  if A1_533.DistanceVar ~= nil and GetTable(A0_532, A1_533.DistanceVarTable, true) ~= nil then
    L8_540 = L8_540 + GetTable(A0_532, A1_533.DistanceVarTable, true)[A1_533.DistanceVar]
  end
  if L3_535 ~= nil and L4_536 ~= nil and L6_538 ~= nil and L8_540 ~= nil then
    if not L6_538(L3_535, L4_536, L8_540) then
      ExecuteBuildingBlocks(A2_534, A0_532)
      A0_532.LastIfSucceeded = true
    else
      A0_532.LastIfSucceeded = false
    end
  else
    A0_532.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_541, A1_542)
  local L2_543, L3_544
  L2_543 = A1_542.TargetVar
  L2_543 = A0_541[L2_543]
  L3_544 = A1_542.CasterVar
  L3_544 = A0_541[L3_544]
  GetTable(A0_541, A1_542.DestVarTable, true)[A1_542.DestVar] = SpellBuffCount(L2_543, A1_542.BuffName, L3_544)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_545, A1_546)
  local L2_547
  L2_547 = A1_546.TargetVar
  L2_547 = A0_545[L2_547]
  GetTable(A0_545, A1_546.DestVarTable, true)[A1_546.DestVar] = SpellBuffCount(L2_547, A1_546.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_548, A1_549)
  local L2_550, L3_551
  L2_550 = GetTable
  L3_551 = A0_548
  L2_550 = L2_550(L3_551, A1_549.ScaleVarTable, false)
  L3_551 = nil
  if A1_549.OwnerVar ~= nil then
    L3_551 = A0_548[A1_549.OwnerVar]
  else
    L3_551 = A0_548.Owner
  end
  if A1_549.ScaleVar ~= nil and A1_549.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_550[A1_549.ScaleVar], L3_551)
  else
    SetScaleSkinCoef(A1_549.Scale, L3_551)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_552, A1_553)
  SpellBuffAdd(A0_552[A1_553.TargetVar], A0_552[A1_553.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_552.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_554, A1_555, A2_556)
  local L3_557, L4_558
  L3_557 = A1_555.TargetVar
  L3_557 = A0_554[L3_557]
  L4_558 = A1_555.NumStacks
  if GetParam("NumStacks", A0_554, A1_555) == 0 then
    L4_558 = SpellBuffCount(L3_557, A1_555.BuffName, caster)
  else
    L4_558 = GetParam("NumStacks", A0_554, A1_555)
  end
  while L4_558 > 0 do
    SpellBuffRemove(L3_557, A1_555.BuffName, A0_554[A1_555.AttackerVar])
    L4_558 = L4_558 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_559, A1_560)
  local L2_561, L3_562
  L2_561 = GetParam
  L3_562 = "Unit"
  L2_561 = L2_561(L3_562, A0_559, A1_560)
  unit = L2_561
  L2_561 = unit
  if L2_561 == nil then
    L2_561 = ReportError
    L3_562 = "Could not resolve Unit param"
    L2_561(L3_562)
    return
  end
  L2_561 = true
  L3_562 = GetParam
  L3_562 = L3_562("ChampionToShowTo", A0_559, A1_560)
  if L3_562 == nil then
    L2_561 = false
    L3_562 = GetParam("ChampionToShowToByFlag", A0_559, A1_560)
  end
  if L3_562 == nil then
    ReportError("Could not resolve ChampionToShowTo param")
    return
  end
  SetShowHealthBarToChampion(unit, A1_560.Show, L3_562, L2_561, A1_560.ApplyToSpectator)
end
BBSetShowHealthBarToChampion = L0_0
function L0_0(A0_563, A1_564)
  if GetParam("Vector", A0_563, A1_564) ~= nil then
    GetTable(A0_563, A1_564.DestVarTable, false)[A1_564.DestVar] = math.sqrt(GetParam("Vector", A0_563, A1_564).x * GetParam("Vector", A0_563, A1_564).x + GetParam("Vector", A0_563, A1_564).y * GetParam("Vector", A0_563, A1_564).y + GetParam("Vector", A0_563, A1_564).z * GetParam("Vector", A0_563, A1_564).z)
  end
end
BBGetVectorLength = L0_0
function L0_0(A0_565, A1_566, A2_567)
  if A0_565.EmoteId == A1_566.EmoteId then
    ExecuteBuildingBlocks(A2_567, A0_565)
    A0_565.LastIfSucceeded = true
  else
    A0_565.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_568, A1_569, A2_570)
  if A0_568.EmoteId ~= A1_569.EmoteId then
    ExecuteBuildingBlocks(A2_570, A0_568)
    A0_568.LastIfSucceeded = true
  else
    A0_568.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_571, A1_572)
  local L2_573, L3_574, L4_575, L5_576
  L2_573 = GetTable
  L3_574 = A0_571
  L4_575 = A1_572.String1VarTable
  L5_576 = false
  L2_573 = L2_573(L3_574, L4_575, L5_576)
  L3_574 = A1_572.String1Var
  L3_574 = L2_573[L3_574]
  L4_575 = GetTable
  L5_576 = A0_571
  L4_575 = L4_575(L5_576, A1_572.String2VarTable, false)
  L5_576 = A1_572.String2Var
  L5_576 = L4_575[L5_576]
  GetTable(A0_571, A1_572.ResultVarTable, false)[A1_572.ResultVar] = L3_574 .. L5_576
end
BBConcatenateStrings = L0_0
function L0_0(A0_577, A1_578)
  local L2_579, L3_580
  L2_579 = GetTable
  L3_580 = A0_577
  L2_579 = L2_579(L3_580, A1_578.VariableVarTable, false)
  L3_580 = A1_578.VariableVar
  L3_580 = L2_579[L3_580]
  GetTable(A0_577, A1_578.ResultVarTable, false)[A1_578.ResultVar] = "(" .. L3_580 .. ")"
end
BBEncaseInParantheses = L0_0
function L0_0(A0_581, A1_582)
  BBGetMinionKills(A0_581, A1_582)
  A0_581.MinionKillSource = GetParam("MinionKillTarget")
  A0_581.MinionKills = A0_581.MinionsKilled + GetParam("MinionKills", A0_581, A1_582)
  BBSetMinionKills(A0_581, A1_582)
end
BBIncreaseMinionKills = L0_0
