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
  local L2_17, L3_18, L4_19, L5_20, L6_21, L7_22, L8_23, L9_24, L10_25
  L2_17 = {}
  for L6_21, L7_22 in L3_18(L4_19) do
    L2_17[L6_21] = L7_22
    L8_23 = GetHashedGameObjName
    L9_24 = L6_21
    L8_23 = L8_23(L9_24)
    L2_17[L8_23] = L7_22
  end
  for L6_21, L7_22 in L3_18(L4_19) do
    L8_23 = L7_22.VarTable
    L9_24 = L7_22.Var
    L10_25 = GetTable
    L10_25 = L10_25(A0_15, L8_23, false)
    L2_17[L6_21] = L10_25[L9_24]
    L2_17[GetHashedGameObjName(L6_21)] = L10_25[L9_24]
  end
  L2_17.InstanceVars = L3_18
  L2_17.CharVars = L3_18
  L2_17.NextBuffVars = L3_18
  L2_17.AvatarVars = L3_18
  L2_17.SpellVars = L3_18
  L2_17.WorldVars = L3_18
  L2_17.Target = L3_18
  L2_17[L3_18] = L4_19
  L2_17.Attacker = L3_18
  L2_17[L3_18] = L4_19
  L2_17.Owner = L3_18
  L2_17[L3_18] = L4_19
  L2_17.Caster = L3_18
  L2_17.GoldRedirectTarget = L3_18
  L5_20(L6_21, L7_22)
  for L8_23, L9_24 in L5_20(L6_21) do
    L10_25 = L9_24.VarTable
    GetTable(A0_15, L10_25, false)[L9_24.Var] = L2_17[L8_23]
  end
end
BBExecuteFunction = L0_0
function L0_0(A0_26, A1_27)
  local L2_28, L3_29
  L2_28 = GetParam
  L3_29 = "Required"
  L2_28 = L2_28(L3_29, A0_26, A1_27)
  L3_29 = gDebugMode
  if L3_29 ~= nil and L2_28 == nil then
    L3_29 = ALREADY_WARNED
    L3_29 = L3_29[A1_27.RequiredVar]
    if L3_29 == nil then
      L3_29 = A1_27.RequiredVar
      if L3_29 ~= nil then
        L3_29 = A1_27.RequiredVarTable
        if L3_29 == nil then
          L3_29 = "PassThroughParams"
        end
        DebugClientPrint("Missing Required Variable: " .. L3_29 .. "." .. A1_27.RequiredVar .. " Current block data is: " .. tostring(gCurrentBuildingBlockString))
        ALREADY_WARNED[A1_27.RequiredVar] = true
      end
    end
  end
end
BBRequireVar = L0_0
L0_0 = {}
ALREADY_WARNED = L0_0
function L0_0(A0_30, A1_31, A2_32)
  ExecuteBuildingBlocks(A2_32, A0_30)
end
BBCom = L0_0
function L0_0(A0_33, A1_34, A2_35)
  if A1_34.IsConditionTrue(A0_33) then
    ExecuteBuildingBlocks(A2_35, A0_33)
  end
end
BBConditionallyExecute = L0_0
function L0_0(A0_36, A1_37)
  local L2_38, L3_39
  L2_38 = GetTable
  L3_39 = A0_36
  L2_38 = L2_38(L3_39, A1_37.SrcVarTable, false)
  L3_39 = A1_37.ToSay
  L3_39 = L3_39 or ""
  DebugClientPrint(tostring(L3_39) .. ": " .. type(L2_38[A1_37.SrcVar]))
end
BBPrintTypeToChat = L0_0
function L0_0(A0_40, A1_41)
  local L2_42, L3_43, L4_44, L5_45, L6_46
  L2_42 = A1_41.ToSay
  L2_42 = L2_42 or ""
  L3_43 = A1_41.Color
  L3_43 = L3_43 or "FFFFFF"
  L4_44 = GetTable
  L5_45 = A0_40
  L6_46 = A1_41.SrcVarTable
  L4_44 = L4_44(L5_45, L6_46, false)
  L5_45 = A1_41.SrcVar
  L5_45 = L4_44[L5_45]
  L6_46 = "<font color=\""
  L6_46 = L6_46 .. L3_43 .. "\">"
  if L2_42 == "" then
    if A1_41.SrcVarTable ~= nil then
      L6_46 = L6_46 .. "(DEBUG) " .. A1_41.SrcVarTable .. "." .. (A1_41.SrcVar or "")
    else
      L6_46 = L6_46 .. "(DEBUG) " .. (A1_41.SrcVar or "")
    end
  else
    L6_46 = L6_46 .. "(DEBUG) " .. L2_42
  end
  if type(L5_45) ~= "table" and type(L5_45) ~= "nil" then
    L6_46 = L6_46 .. " " .. tostring(L5_45)
  end
  L6_46 = L6_46 .. "</font>"
  DebugClientPrint(L6_46)
  if type(L5_45) == "table" then
    PrintTableToChat(L5_45)
  end
end
BBPrintToChat = L0_0
function L0_0(A0_47, A1_48)
  local L2_49, L3_50
  L2_49 = GetTable
  L3_50 = A0_47
  L2_49 = L2_49(L3_50, A1_48.TableName, true)
  L3_50 = A1_48.TableName
  L3_50 = L3_50 or "PassThroughParams"
  DebugClientPrint(L3_50)
  PrintTableToChat(L2_49)
end
BBPrintTableToChat = L0_0
function L0_0(A0_51, A1_52)
  local L2_53, L3_54, L4_55, L5_56, L6_57, L7_58, L8_59, L9_60, L10_61, L11_62, L12_63, L13_64
  A1_52 = A1_52 or 0
  if A1_52 > 10 then
    return
  end
  L2_53 = nil
  L3_54 = "|"
  for L7_58 = 1, A1_52 do
    L9_60 = "----"
    L3_54 = L8_59 .. L9_60
  end
  L6_57(L7_58)
  for L9_60, L10_61 in L6_57(L7_58) do
    L11_62 = nil
    L12_63 = tostring
    L13_64 = L9_60
    L12_63 = L12_63(L13_64)
    if L12_63 == "PassThroughParams" then
      L11_62 = "{{ PassThroughParams }}"
    else
      L13_64 = type
      L13_64 = L13_64(L10_61)
      if L13_64 == "table" then
        L11_62 = "Table"
      else
        L13_64 = tostring
        L13_64 = L13_64(L10_61)
        L11_62 = L13_64
      end
    end
    L13_64 = L3_54
    L13_64 = L13_64 .. L12_63 .. ": " .. L11_62
    DebugClientPrint(L13_64)
    if type(L10_61) == "table" then
      PrintTableToChat(L10_61, A1_52 + 1)
    end
  end
  L6_57(L7_58)
end
PrintTableToChat = L0_0
function L0_0(A0_65, A1_66)
end
BBDebugPrintToChat = L0_0
function L0_0(A0_67, A1_68)
  local L2_69, L3_70
  L2_69 = GetTable
  L3_70 = A0_67
  L2_69 = L2_69(L3_70, A1_68.TableName, true)
  L3_70 = A1_68.TableName
  L3_70 = L3_70 or "PassThroughParams"
  DebugClientPrint(L3_70)
  DebugPrintTableToChat(L2_69)
end
BBDebugPrintTableToChat = L0_0
function L0_0(A0_71, A1_72)
  local L2_73, L3_74, L4_75, L5_76, L6_77, L7_78, L8_79, L9_80, L10_81, L11_82, L12_83, L13_84
  A1_72 = A1_72 or 0
  if A1_72 > 10 then
    return
  end
  L2_73 = nil
  L3_74 = "|"
  for L7_78 = 1, A1_72 do
    L9_80 = "----"
    L3_74 = L8_79 .. L9_80
  end
  L6_77(L7_78)
  for L9_80, L10_81 in L6_77(L7_78) do
    L11_82 = nil
    L12_83 = tostring
    L13_84 = L9_80
    L12_83 = L12_83(L13_84)
    if L12_83 == "PassThroughParams" then
      L11_82 = "{{ PassThroughParams }}"
    else
      L13_84 = type
      L13_84 = L13_84(L10_81)
      if L13_84 == "table" then
        L11_82 = "Table"
      else
        L13_84 = tostring
        L13_84 = L13_84(L10_81)
        L11_82 = L13_84
      end
    end
    L13_84 = L3_74
    L13_84 = L13_84 .. L12_83 .. ": " .. L11_82
    DebugClientPrint(L13_84)
    if type(L10_81) == "table" then
      DebugPrintTableToChat(L10_81, A1_72 + 1)
    end
  end
  L6_77(L7_78)
end
DebugPrintTableToChat = L0_0
function L0_0(A0_85, A1_86, A2_87)
  local L3_88
  if A1_86 ~= nil then
    L3_88 = A0_85[A1_86]
    if L3_88 == nil and A2_87 then
      A0_85[A1_86] = {}
      return A0_85[A1_86]
    end
  end
  if L3_88 == nil then
    L3_88 = A0_85
  end
  return L3_88
end
GetTable = L0_0
function L0_0(A0_89, A1_90, A2_91)
  if A2_91[A0_89 .. "Var"] ~= nil and GetTable(A1_90, A2_91[A0_89 .. "VarTable"], false) ~= nil then
    return GetTable(A1_90, A2_91[A0_89 .. "VarTable"], false)[A2_91[A0_89 .. "Var"]]
  else
    return A2_91[A0_89]
  end
end
GetParam = L0_0
function L0_0(A0_92, A1_93)
  GetTable(A0_92, A1_93.DestVarTable, true)[A1_93.DestVar] = {}
end
BBCreateCustomTable = L0_0
function L0_0(A0_94, A1_95)
  GetTable(A0_94, A1_95.TableNameVarTable, false)[A1_95.TableNameVar] = nil
end
BBDestroyCustomTable = L0_0
function L0_0(A0_96, A1_97)
  if type(GetTable(A0_96, A1_97.DestTableVarTable, false)[A1_97.DestTableVar]) == "nil" then
    GetTable(A0_96, A1_97.DestTableVarTable, false)[A1_97.DestTableVar] = {}
  end
  if type(GetTable(A0_96, A1_97.DestTableVarTable, false)[A1_97.DestTableVar]) == "table" then
    GetTable(A0_96, A1_97.DestTableVarTable, false)[A1_97.DestTableVar][GetParam("Key", A0_96, A1_97)] = GetParam("Value", A0_96, A1_97)
  end
end
BBSetKeyValueInCustomTable = L0_0
function L0_0(A0_98, A1_99)
  if type(GetTable(A0_98, A1_99.SrcTableVarTable, false)[A1_99.SrcTableVar]) == "table" then
    GetTable(A0_98, A1_99.DestVarTable, true)[A1_99.DestVar] = GetTable(A0_98, A1_99.SrcTableVarTable, false)[A1_99.SrcTableVar][GetParam("SrcKey", A0_98, A1_99)]
  end
end
BBGetKeyValueInCustomTable = L0_0
function L0_0(A0_100, A1_101)
  local L2_102, L3_103, L4_104
  L2_102 = GetTable
  L3_103 = A0_100
  L4_104 = A1_101.DestTableVarTable
  L2_102 = L2_102(L3_103, L4_104, false)
  L3_103 = GetParam
  L4_104 = "DestIndex"
  L3_103 = L3_103(L4_104, A0_100, A1_101)
  L4_104 = GetParam
  L4_104 = L4_104("Value", A0_100, A1_101)
  if type(L2_102[A1_101.DestTableVar]) == "nil" then
    L2_102[A1_101.DestTableVar] = {}
  end
  if type(L2_102[A1_101.DestTableVar]) == "table" then
    if L3_103 then
      table.insert(L2_102[A1_101.DestTableVar], L3_103, L4_104)
      if A1_101.OutIndexVar then
        GetTable(A0_100, A1_101.OutIndexVarTable, true)[A1_101.OutIndexVar] = L3_103
      end
    else
      table.insert(L2_102[A1_101.DestTableVar], L4_104)
      if A1_101.OutIndexVar then
        GetTable(A0_100, A1_101.OutIndexVarTable, true)[A1_101.OutIndexVar] = table.getn(L2_102[A1_101.DestTableVar])
      end
    end
  end
end
BBInsertIntoInCustomTable = L0_0
function L0_0(A0_105, A1_106)
  local L2_107, L3_108
  L2_107 = GetTable
  L3_108 = A0_105
  L2_107 = L2_107(L3_108, A1_106.TableVarTable, false)
  L3_108 = GetParam
  L3_108 = L3_108("Index", A0_105, A1_106)
  if type(L2_107[A1_106.TableVar]) == "nil" then
    DebugClientPrint("Table specified does not exist: " .. tostring(A1_106.TableVarTable) .. "." .. tostring(A1_106.TableVar))
    return
  end
  if type(L2_107[A1_106.TableVar]) == "table" then
    if GetParam("Key", A0_105, A1_106) then
      L2_107[A1_106.TableVar][GetParam("Key", A0_105, A1_106)] = nil
    elseif L3_108 then
      table.remove(L2_107[A1_106.TableVar], L3_108)
    else
      DebugClientPrint("Specified index/key was nil: " .. tostring(A1_106.IndexVarTable) .. "." .. tostring(A1_106.IndexVar))
    end
  end
end
BBRemoveFromCustomTable = L0_0
function L0_0(A0_109, A1_110, A2_111)
  local L3_112, L4_113, L5_114, L6_115, L7_116, L8_117
  L3_112 = GetTable
  L3_112 = L3_112(L4_113, L5_114, L6_115)
  if L4_113 == "table" then
    if L4_113 then
      for L8_117, _FORV_9_ in L5_114(L6_115) do
        table.insert(L4_113, L8_117)
      end
      L5_114(L6_115)
      for L8_117, _FORV_9_ in L5_114(L6_115) do
        GetTable(A0_109, A1_110.DestKeyVarTable, true)[A1_110.DestKeyVar] = _FORV_9_
        GetTable(A0_109, A1_110.DestValueVarTable, true)[A1_110.DestValueVar] = L3_112[A1_110.TableVar][_FORV_9_]
        ExecuteBuildingBlocks(A2_111, A0_109)
      end
    else
      for L7_116, L8_117 in L4_113(L5_114) do
        GetTable(A0_109, A1_110.DestKeyVarTable, true)[A1_110.DestKeyVar] = L7_116
        GetTable(A0_109, A1_110.DestValueVarTable, true)[A1_110.DestValueVar] = L8_117
        ExecuteBuildingBlocks(A2_111, A0_109)
      end
    end
  end
end
BBForEachInCustomTable = L0_0
function L0_0(A0_118, A1_119)
  local L2_120, L3_121, L4_122, L5_123, L6_124
  L2_120 = GetTable
  L3_121 = A0_118
  L4_122 = A1_119.SrcTableVarTable
  L5_123 = false
  L2_120 = L2_120(L3_121, L4_122, L5_123)
  L3_121 = GetParam
  L4_122 = "Value"
  L5_123 = A0_118
  L6_124 = A1_119
  L3_121 = L3_121(L4_122, L5_123, L6_124)
  L4_122 = GetTable
  L5_123 = A0_118
  L6_124 = A1_119.MatchingKeyVarTable
  L4_122 = L4_122(L5_123, L6_124, false)
  L5_123 = GetTable
  L6_124 = A0_118
  L5_123 = L5_123(L6_124, A1_119.WasFoundVarTable, false)
  L6_124 = A1_119.WasFoundVar
  L5_123[L6_124] = false
  L6_124 = type
  L6_124 = L6_124(L2_120[A1_119.SrcTableVar])
  if L6_124 == "table" then
    L6_124 = GetTable
    L6_124 = L6_124(A0_118, A1_119.DestVarTable, true)
    for _FORV_10_, _FORV_11_ in pairs(L6_124) do
      if _FORV_11_ == L3_121 then
        L5_123[A1_119.WasFoundVar] = true
        L4_122[A1_119.MatchingKeyVar] = _FORV_10_
      end
    end
  end
end
BBCustomTableContainsValue = L0_0
function L0_0(A0_125, A1_126, A2_127)
  for _FORV_9_, _FORV_10_ in pairs(GetTable(A0_125, A1_126.TableVarTable, false)[A1_126.TableVar]) do
  end
  GetTable(A0_125, A1_126.SizeVarTable, false)[A1_126.SizeVar] = 0 + 1
end
BBGetSizeOfCustomTable = L0_0
function L0_0(A0_128, A1_129, A2_130, A3_131)
  local L4_132
  L4_132 = GetParam
  L4_132 = L4_132("Unit", A0_128, A1_129)
  if L4_132 ~= nil then
    A1_129.DestPos = GetPosition(L4_132)
    A1_129.DestPosVar = "__TempDestPos"
    GetTable(A0_128, A1_129.DestPosVarTable, false)[A1_129.DestPosVar] = GetPosition(L4_132)
  end
  A1_129.RegionGroup = A2_130
  BBGetRegionTag(A0_128, A1_129)
  for _FORV_11_, _FORV_12_ in ipairs(A3_131) do
  end
  return true
end
CheckIfUnitOrPointIsInRegionTagList = L0_0
function L0_0(A0_133, A1_134)
  local L2_135, L3_136
  L2_135 = GameplayLane
  L3_136 = {
    LANE_Top_Order,
    LANE_Mid_Order,
    LANE_Bot_Order
  }
  resultTable = GetTable(A0_133, A1_134.ResultVarTable, false)
  resultTable[A1_134.ResultVar] = CheckIfUnitOrPointIsInRegionTagList(A0_133, A1_134, L2_135, L3_136)
end
BBGetIsOrderSide = L0_0
function L0_0(A0_137, A1_138)
  local L2_139, L3_140
  L2_139 = GameplayArea
  L3_140 = {AREA_Jungle_Top, AREA_Jungle_Bot}
  resultTable = GetTable(A0_137, A1_138.ResultVarTable, false)
  resultTable[A1_138.ResultVar] = CheckIfUnitOrPointIsInRegionTagList(A0_137, A1_138, L2_139, L3_140)
end
BBGetIsJungle = L0_0
function L0_0(A0_141, A1_142)
  local L2_143, L3_144
  L2_143 = GameplayArea
  L3_144 = {
    AREA_Lane_Top,
    AREA_Lane_Mid,
    AREA_Lane_Bot
  }
  resultTable = GetTable(A0_141, A1_142.ResultVarTable, false)
  resultTable[A1_142.ResultVar] = CheckIfUnitOrPointIsInRegionTagList(A0_141, A1_142, L2_143, L3_144)
end
BBGetIsLane = L0_0
function L0_0(A0_145, A1_146)
  local L2_147, L3_148
  L2_147 = GameplayArea
  L3_148 = {AREA_River_Top, AREA_River_Bot}
  resultTable = GetTable(A0_145, A1_146.ResultVarTable, false)
  resultTable[A1_146.ResultVar] = CheckIfUnitOrPointIsInRegionTagList(A0_145, A1_146, L2_147, L3_148)
end
BBGetIsRiver = L0_0
function L0_0(A0_149, A1_150)
  local L2_151, L3_152
  L2_151 = GameplayArea
  L3_152 = {AREA_BasePerimeter_Top, AREA_BasePerimeter_Bot}
  resultTable = GetTable(A0_149, A1_150.ResultVarTable, false)
  resultTable[A1_150.ResultVar] = CheckIfUnitOrPointIsInRegionTagList(A0_149, A1_150, L2_151, L3_152)
end
BBGetIsBasePerimeter = L0_0
function L0_0(A0_153, A1_154)
  local L2_155, L3_156, L4_157, L5_158
  L2_155 = GameplayLane
  L3_156 = {L4_157, L5_158}
  L4_157 = LANE_Top_Order
  L5_158 = LANE_Top_Chaos
  L4_157 = {L5_158, LANE_Mid_Chaos}
  L5_158 = LANE_Mid_Order
  L5_158 = {LANE_Bot_Order, LANE_Bot_Chaos}
  if CheckIfUnitOrPointIsInRegionTagList(A0_153, A1_154, L2_155, L3_156) then
  elseif CheckIfUnitOrPointIsInRegionTagList(A0_153, A1_154, L2_155, L4_157) then
  elseif CheckIfUnitOrPointIsInRegionTagList(A0_153, A1_154, L2_155, L5_158) then
  end
  resultTable = GetTable(A0_153, A1_154.ResultVarTable, false)
  resultTable[A1_154.ResultVar] = 0
end
BBGetNearestLane = L0_0
function L0_0(A0_159, A1_160)
  local L2_161, L3_162, L4_163, L5_164, L6_165, L7_166, L8_167, L9_168
  L2_161 = GetParam
  L3_162 = "Unit"
  L4_163 = A0_159
  L5_164 = A1_160
  L2_161 = L2_161(L3_162, L4_163, L5_164)
  L3_162 = GetParam
  L4_163 = "X"
  L5_164 = A0_159
  L6_165 = A1_160
  L3_162 = L3_162(L4_163, L5_164, L6_165)
  L4_163 = GetParam
  L5_164 = "Z"
  L6_165 = A0_159
  L7_166 = A1_160
  L4_163 = L4_163(L5_164, L6_165, L7_166)
  if L2_161 ~= nil then
    L5_164 = GetPosition
    L6_165 = L2_161
    L5_164 = L5_164(L6_165)
    L3_162 = L5_164.x
    L4_163 = L5_164.z
  end
  L5_164 = 2
  L6_165 = 1
  L7_166 = 0
  L8_167 = 4
  L9_168 = 3
  if L4_163 > 12250 then
  elseif L4_163 < 2650 then
  elseif L3_162 > 12250 then
  elseif L3_162 < 2650 then
  elseif L4_163 - L3_162 > 4500 then
  else
  end
  if L4_163 > 13000 then
  elseif L4_163 < 1800 then
  elseif L3_162 > 13000 then
  elseif L3_162 < 1800 then
  elseif L4_163 - L3_162 > 1150 then
  else
  end
  GetTable(A0_159, A1_160.NearLaneVarTable, false)[A1_160.NearLaneVar] = L7_166
  GetTable(A0_159, A1_160.NearSectionVarTable, false)[A1_160.NearSectionVar] = L9_168
  GetTable(A0_159, A1_160.BlueSideVarTable, false)[A1_160.BlueSideVar] = true
end
BBGetLocationHints = L0_0
function L0_0(A0_169, A1_170)
  local L2_171, L3_172, L4_173, L5_174
  L2_171 = GetTable
  L3_172 = A0_169
  L4_173 = A1_170.DestVarTable
  L5_174 = true
  L2_171 = L2_171(L3_172, L4_173, L5_174)
  L3_172 = nil
  L4_173 = GetTable
  L5_174 = A0_169
  L4_173 = L4_173(L5_174, A1_170.SpellSlotVarTable, false)
  L5_174 = A1_170.SpellSlotVar
  if L5_174 ~= nil and L4_173 ~= nil then
    L5_174 = A1_170.SpellSlotVar
    L3_172 = L4_173[L5_174]
  else
    L3_172 = A1_170.SpellSlotValue
  end
  L5_174 = A1_170.Function
  L5_174 = L5_174(A0_169[A1_170.OwnerVar], L3_172, A1_170.SpellbookType, A1_170.SlotType)
  SetVarInTable(A0_169, A1_170, L5_174)
end
BBGetSlotSpellInfo = L0_0
function L0_0(A0_175, A1_176)
  local L2_177, L3_178, L4_179
  L2_177 = GetTable
  L3_178 = A0_175
  L4_179 = A1_176.SrcVarTable
  L2_177 = L2_177(L3_178, L4_179, false)
  L3_178 = nil
  L4_179 = A1_176.SrcVar
  if L4_179 ~= nil and L2_177 ~= nil then
    L4_179 = A1_176.SrcVar
    L3_178 = L2_177[L4_179]
  else
    L3_178 = A1_176.SrcValue
  end
  L4_179 = nil
  if A1_176.SpellSlotVar ~= nil and GetTable(A0_175, A1_176.SpellSlotVarTable, false) ~= nil then
    L4_179 = GetTable(A0_175, A1_176.SpellSlotVarTable, false)[A1_176.SpellSlotVar]
  else
    L4_179 = A1_176.SpellSlotValue
  end
  SetSlotSpellCooldownTime(A0_175[A1_176.OwnerVar], L4_179, A1_176.SpellbookType, A1_176.SlotType, L3_178)
end
BBSetSlotSpellCooldownTime = L0_0
function L0_0(A0_180, A1_181)
  if A0_180.Level ~= nil and A1_181.SrcValueByLevel ~= nil then
    A0_180.ReturnValue = A1_181.SrcValueByLevel[A0_180.Level]
  elseif A1_181.SrcVar ~= nil and GetTable(A0_180, A1_181.SrcVarTable, false) ~= nil then
    A0_180.ReturnValue = GetTable(A0_180, A1_181.SrcVarTable, false)[A1_181.SrcVar]
  else
    A0_180.ReturnValue = A1_181.SrcValue
  end
end
BBSetReturnValue = L0_0
function L0_0(A0_182, A1_183)
  A0_182.ReturnValue = true
end
BBCancelOrderBeforeIssued = L0_0
function L0_0(A0_184, A1_185)
  if type(A0_184) == "string" and type(A1_185) == "string" then
    A0_184 = string.lower(A0_184)
    A1_185 = string.lower(A1_185)
  end
  return A0_184 == A1_185
end
CO_EQUAL = L0_0
function L0_0(A0_186, A1_187)
  if type(A0_186) == "string" and type(A1_187) == "string" then
    A0_186 = string.lower(A0_186)
    A1_187 = string.lower(A1_187)
  end
  return A0_186 ~= A1_187
end
CO_NOT_EQUAL = L0_0
function L0_0(A0_188, A1_189)
  local L2_190
  L2_190 = A0_188 < A1_189
  return L2_190
end
CO_LESS_THAN = L0_0
function L0_0(A0_191, A1_192)
  local L2_193
  L2_193 = A1_192 < A0_191
  return L2_193
end
CO_GREATER_THAN = L0_0
function L0_0(A0_194, A1_195)
  local L2_196
  L2_196 = A0_194 <= A1_195
  return L2_196
end
CO_LESS_THAN_OR_EQUAL = L0_0
function L0_0(A0_197, A1_198)
  local L2_199
  L2_199 = A1_198 <= A0_197
  return L2_199
end
CO_GREATER_THAN_OR_EQUAL = L0_0
function L0_0(A0_200, A1_201)
  return GetTeamID(A0_200) == GetTeamID(A1_201)
end
CO_SAME_TEAM = L0_0
function L0_0(A0_202, A1_203)
  return GetTeamID(A0_202) ~= GetTeamID(A1_203)
end
CO_DIFFERENT_TEAM = L0_0
function L0_0(A0_204, A1_205)
  return GetSourceType() == A1_205 or GetSourceType() == A0_204
end
CO_DAMAGE_SOURCETYPE_IS = L0_0
function L0_0(A0_206, A1_207)
  return GetSourceType() ~= A1_207 and GetSourceType() ~= A0_206
end
CO_DAMAGE_SOURCETYPE_IS_NOT = L0_0
function L0_0(A0_208)
  return IsObjectAI(A0_208)
end
CO_IS_TYPE_AI = L0_0
function L0_0(A0_209)
  return IsObjectAI(A0_209) ~= true
end
CO_IS_NOT_AI = L0_0
function L0_0(A0_210)
  return IsObjectHero(A0_210)
end
CO_IS_TYPE_HERO = L0_0
function L0_0(A0_211)
  return IsObjectHero(A0_211) ~= true
end
CO_IS_NOT_HERO = L0_0
function L0_0(A0_212)
  return IsObjectMarker(A0_212)
end
CO_IS_TYPE_MARKER = L0_0
function L0_0(A0_213)
  return IsObjectMarker(A0_213) ~= true
end
CO_IS_NOT_MARKER = L0_0
function L0_0(A0_214)
  return IsClone(A0_214)
end
CO_IS_CLONE = L0_0
function L0_0(A0_215)
  return IsClone(A0_215) ~= true
end
CO_IS_NOT_CLONE = L0_0
function L0_0(A0_216)
  return IsMelee(A0_216)
end
CO_IS_MELEE = L0_0
function L0_0(A0_217)
  return IsMelee(A0_217) ~= true
end
CO_IS_RANGED = L0_0
function L0_0(A0_218)
  return A0_218 > math.random()
end
CO_RANDOM_CHANCE_LESS_THAN = L0_0
function L0_0(A0_219)
  return IsTurretAI(A0_219)
end
CO_IS_TYPE_TURRET = L0_0
function L0_0(A0_220)
  return IsTurretAI(A0_220) ~= true
end
CO_IS_NOT_TURRET = L0_0
function L0_0(A0_221)
  return IsDampener(A0_221)
end
CO_IS_TYPE_INHIBITOR = L0_0
function L0_0(A0_222)
  return IsDampener(A0_222) ~= true
end
CO_IS_NOT_INHIBITOR = L0_0
function L0_0(A0_223)
  return IsHQ(A0_223)
end
CO_IS_TYPE_NEXUS = L0_0
function L0_0(A0_224)
  return IsHQ(A0_224) ~= true
end
CO_IS_NOT_NEXUS = L0_0
function L0_0(A0_225)
  return IsDead(A0_225)
end
CO_IS_DEAD = L0_0
function L0_0(A0_226)
  return IsDead(A0_226) ~= true
end
CO_IS_NOT_DEAD = L0_0
function L0_0(A0_227)
  return IsDeadOrZombie(A0_227)
end
CO_IS_DEAD_OR_ZOMBIE = L0_0
function L0_0(A0_228, A1_229)
  return BBIsTargetInFrontOfMe(A0_228, A1_229)
end
CO_IS_TARGET_IN_FRONT_OF_ME = L0_0
function L0_0(A0_230, A1_231)
  return BBIsTargetBehindMe(A0_230, A1_231)
end
CO_IS_TARGET_BEHIND_ME = L0_0
function L0_0(A0_232)
  return IsWard(A0_232)
end
CO_IS_WARD = L0_0
function L0_0(A0_233)
  return IsStructure(A0_233)
end
CO_IS_STRUCTURE = L0_0
function L0_0(A0_234)
  return IsStructure(A0_234) ~= true
end
CO_IS_NOT_STRUCTURE = L0_0
function L0_0(A0_235)
  local L1_236
  L1_236 = A0_235 ~= nil
  return L1_236
end
CO_IS_NOT_NIL = L0_0
function L0_0(A0_237, A1_238, A2_239)
  GetTable(A0_237, A1_238.MacroVarTable, true)[A1_238.MacroVar] = A2_239
end
BBCreateMacro = L0_0
function L0_0(A0_240, A1_241)
  local L2_242
  L2_242 = GetParam
  L2_242 = L2_242("Macro", A0_240, A1_241)
  if L2_242 ~= nil and type(L2_242) == "table" then
    ExecuteBuildingBlocks(L2_242, A0_240)
  else
    DebugClientPrint("Designer Error: Macro variable is not initialized inside of event. Macro Variable was: " .. tostring(A1_241.MacroVar) .. " and current block data is: " .. gCurrentBuildingBlockString .. ". This error probably occurred due to variable not being initialized yet, being misnamed or two events being called out of sequence. It is highly recommended that script macros either be initialized OnBuffActivate, OnCharActivate or in the same event. Pro Devs may violate this rule at the risk of being forced to read this error message again.")
  end
end
BBRunMacro = L0_0
function L0_0(A0_243, A1_244, A2_245)
  local L3_246, L4_247, L5_248, L6_249, L7_250, L8_251
  L3_246 = GetTable
  L3_246 = L3_246(L4_247, L5_248, L6_249)
  L3_246[L4_247] = A2_245
  if L4_247 == nil then
    A2_245.InPerBlockParams = A1_244
    for L7_250 = 1, 6 do
      L8_251 = "FunctionParameter"
      L8_251 = L8_251 .. L7_250 .. "Var"
      if A1_244[L8_251 .. "Table"] ~= nil then
        DebugClientPrint("Designer Error: CreateFunction can only input parameters to PassThroughParams. Current block data is: " .. gCurrentBuildingBlockString .. ".")
      end
    end
  end
end
BBCreateFunction = L0_0
function L0_0(A0_252, A1_253)
  local L2_254, L3_255, L4_256, L5_257, L6_258
  for L5_257 = 1, 6 do
    L6_258 = "FunctionOutput"
    L6_258 = L6_258 .. L5_257 .. "Var"
    if A1_253[L6_258] ~= nil and A1_253[L6_258] ~= "" then
      if A1_253[L6_258 .. "Table"] ~= nil then
        DebugClientPrint("Designer Error: EndFunction can only output from PassThroughParams. Current block data is: " .. gCurrentBuildingBlockString .. ".")
      else
        A0_252[L6_258] = A0_252[A1_253[L6_258]]
      end
    end
  end
end
BBEndFunction = L0_0
function L0_0(A0_259, A1_260)
  local L2_261, L3_262, L4_263, L5_264, L6_265, L7_266, L8_267, L9_268
  L2_261 = GetParam
  L3_262 = "Function"
  L2_261 = L2_261(L3_262, L4_263, L5_264)
  L3_262 = {}
  L3_262.InstanceVars = L4_263
  L3_262.CharVars = L4_263
  L3_262.NextBuffVars = L4_263
  L3_262.AvatarVars = L4_263
  L3_262.SpellVars = L4_263
  L3_262.WorldVars = L4_263
  L3_262.Target = L4_263
  L3_262[L4_263] = L5_264
  L3_262.Attacker = L4_263
  L3_262[L4_263] = L5_264
  L3_262.Owner = L4_263
  L3_262[L4_263] = L5_264
  L3_262.Caster = L4_263
  L3_262.GoldRedirectTarget = L4_263
  L3_262.Unit = L4_263
  L3_262.Other1 = L4_263
  L3_262.Other2 = L4_263
  L3_262.Other3 = L4_263
  L3_262.Nothing = L4_263
  if L2_261 ~= nil then
    if L4_263 == "table" then
      if L4_263 ~= nil then
        for L8_267 = 1, 6 do
          L9_268 = "FunctionParameter"
          L9_268 = L9_268 .. L8_267 .. "Var"
          if A1_260[L9_268] ~= nil and A1_260[L9_268] ~= "" and L4_263[L9_268] ~= nil and L4_263[L9_268] ~= "" then
            L3_262[L4_263[L9_268]] = GetTable(A0_259, A1_260[L9_268 .. "Table"], false)[A1_260[L9_268]]
          end
        end
      end
      L4_263(L5_264, L6_265)
      for L7_266 = 1, 6 do
        L8_267 = "FunctionOutput"
        L9_268 = L7_266
        L8_267 = L8_267 .. L9_268 .. "Var"
        L9_268 = A1_260[L8_267]
        if L9_268 ~= nil then
          L9_268 = A1_260[L8_267]
          if L9_268 ~= "" then
            L9_268 = L3_262
            GetTable(A0_259, A1_260[L8_267 .. "Table"], false)[A1_260[L8_267]] = L9_268[L8_267]
          end
        end
      end
    end
  else
    L8_267 = gCurrentBuildingBlockString
    L9_268 = ". This error probably occurred due to variable not being initialized yet, being misnamed or two events being called out of sequence. It is highly recommended that script functions either be initialized OnBuffActivate, OnCharActivate or in the same event. Pro Devs may violate this rule at the risk of being forced to read this error message again."
    L4_263(L5_264)
  end
end
BBRunFunction = L0_0
function L0_0(A0_269, A1_270, A2_271)
  local L3_272, L4_273, L5_274, L6_275
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
BBIf = L0_0
function L0_0(A0_276, A1_277, A2_278)
  if A0_276.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_278, A0_276)
    A0_276.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_279, A1_280, A2_281)
  if A0_279.LastIfSucceeded == true then
    ExecuteBuildingBlocks(A2_281, A0_279)
    A0_279.LastIfSucceeded = true
  else
    BBIf(A0_279, A1_280, A2_281)
  end
end
BBOrIf = L0_0
function L0_0(A0_282, A1_283, A2_284)
  if A0_282.LastIfSucceeded == true then
    BBIf(A0_282, A1_283, A2_284)
  end
end
BBAndIf = L0_0
function L0_0(A0_285, A1_286, A2_287)
  local L3_288, L4_289, L5_290, L6_291
  L3_288 = A0_285.LastIfSucceeded
  if L3_288 == false then
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
end
BBElseIf = L0_0
function L0_0(A0_292, A1_293, A2_294)
  local L3_295
  if A1_293.TargetVar ~= nil then
    L3_295 = A0_292[A1_293.TargetVar]
  else
    L3_295 = A0_292.Target
  end
  if HasBuffOfType(L3_295, A1_293.BuffType) then
    ExecuteBuildingBlocks(A2_294, A0_292)
    A0_292.LastIfSucceeded = true
  else
    A0_292.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_296, A1_297, A2_298)
  local L3_299, L4_300
  if A1_297.OwnerVar ~= nil then
    L3_299 = A0_296[A1_297.OwnerVar]
  else
    L3_299 = A0_296.Owner
  end
  if A1_297.AttackerVar ~= nil then
    L4_300 = A0_296[A1_297.AttackerVar]
  else
    L4_300 = A0_296.Attacker
  end
  if SpellBuffCount(L3_299, A1_297.BuffName, L4_300) > 0 then
    ExecuteBuildingBlocks(A2_298, A0_296)
    A0_296.LastIfSucceeded = true
  else
    A0_296.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_301, A1_302, A2_303)
  if BBIsMissileAutoAttack(A0_301, A1_302) then
    ExecuteBuildingBlocks(A2_303, A0_301)
    A0_301.LastIfSucceeded = true
  else
    A0_301.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_304, A1_305, A2_306)
  if BBIsMissileConsideredAsAutoAttack(A0_304, A1_305) then
    ExecuteBuildingBlocks(A2_306, A0_304)
    A0_304.LastIfSucceeded = true
  else
    A0_304.LastIfSucceeded = false
  end
end
BBIfMissileConsideredAsAutoAttack = L0_0
function L0_0(A0_307, A1_308)
  A0_307.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_309, A1_310, A2_311)
  local L3_312, L4_313
  if A1_310.OwnerVar ~= nil then
    L3_312 = A0_309[A1_310.OwnerVar]
  else
    L3_312 = A0_309.Owner
  end
  if A1_310.CasterVar ~= nil then
    L4_313 = A0_309[A1_310.CasterVar]
  else
    L4_313 = A0_309.Caster
  end
  if SpellBuffCount(L3_312, A1_310.BuffName, L4_313) <= 0 then
    ExecuteBuildingBlocks(A2_311, A0_309)
    A0_309.LastIfSucceeded = true
  else
    A0_309.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_314, A1_315, A2_316)
  local L3_317
  if A1_315.TargetVar ~= nil then
    L3_317 = A0_314[A1_315.TargetVar]
  else
    L3_317 = A0_314.Owner
  end
  if HasUnitTag(L3_317, A1_315.UnitTag) ~= A1_315.InvertResult then
    ExecuteBuildingBlocks(A2_316, A0_314)
    A0_314.LastIfSucceeded = true
  else
    A0_314.LastIfSucceeded = false
  end
end
BBIfHasUnitTag = L0_0
function L0_0(A0_318, A1_319, A2_320)
  local L3_321, L4_322
  L4_322 = A1_319.OwnerVar
  if L4_322 ~= nil then
    L4_322 = A1_319.OwnerVar
    L3_321 = A0_318[L4_322]
  else
    L3_321 = A0_318.Owner
  end
  L4_322 = GetParam
  L4_322 = L4_322("SpellSlot", A0_318, A1_319)
  if HasSpellTag(L3_321, L4_322, A1_319.SpellbookType, A1_319.SlotType, A1_319.SpellTag) ~= A1_319.InvertResult then
    ExecuteBuildingBlocks(A2_320, A0_318)
    A0_318.LastIfSucceeded = true
  else
    A0_318.LastIfSucceeded = false
  end
end
BBIfHasSpellTag = L0_0
function L0_0(A0_323, A1_324, A2_325)
  local L3_326, L4_327
  if A1_324.OwnerVar ~= nil then
    L3_326 = A0_323[A1_324.OwnerVar]
  else
    L3_326 = A0_323.Owner
  end
  if HasPARType(L3_326, A1_324.PARType) then
    ExecuteBuildingBlocks(A2_325, A0_323)
    A0_323.LastIfSucceeded = true
  else
    A0_323.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_328, A1_329, A2_330)
  local L3_331, L4_332
  if A1_329.OwnerVar ~= nil then
    L3_331 = A0_328[A1_329.OwnerVar]
  else
    L3_331 = A0_328.Owner
  end
  if not HasPARType(L3_331, A1_329.PARType) then
    ExecuteBuildingBlocks(A2_330, A0_328)
    A0_328.LastIfSucceeded = true
  else
    A0_328.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_333, A1_334, A2_335)
  local L3_336, L4_337, L5_338, L6_339, L7_340
  L3_336 = GetTable
  L4_337 = A0_333
  L5_338 = A1_334.Src1VarTable
  L6_339 = false
  L3_336 = L3_336(L4_337, L5_338, L6_339)
  L4_337 = GetTable
  L5_338 = A0_333
  L6_339 = A1_334.Src2VarTable
  L7_340 = false
  L4_337 = L4_337(L5_338, L6_339, L7_340)
  L5_338 = true
  while L5_338 do
    L6_339 = false
    L7_340 = nil
    if L3_336 ~= nil and A1_334.Src1Var ~= nil then
      L7_340 = L3_336[A1_334.Src1Var]
    else
      L7_340 = A1_334.Value1
    end
    if L4_337 ~= nil and A1_334.Src2Var ~= nil then
      L6_339 = A1_334.CompareOp(L7_340, L4_337[A1_334.Src2Var])
    else
      L6_339 = A1_334.CompareOp(L7_340, A1_334.Value2)
    end
    if L6_339 then
      ExecuteBuildingBlocks(A2_335, A0_333)
    else
      L5_338 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_341, A1_342, A2_343)
  local L3_344, L4_345, L5_346
  L3_344 = GetParam
  L4_345 = "Start"
  L5_346 = A0_341
  L3_344 = L3_344(L4_345, L5_346, A1_342)
  L4_345 = GetParam
  L5_346 = "End"
  L4_345 = L4_345(L5_346, A0_341, A1_342)
  L5_346 = L3_344
  while L4_345 >= L5_346 do
    SetVarInTable(A0_341, A1_342, L5_346)
    ExecuteBuildingBlocks(A2_343, A0_341)
    L5_346 = L5_346 + 1
  end
end
BBFor = L0_0
function L0_0(A0_347, A1_348)
  return A0_347 * A1_348
end
MO_MULTIPLY = L0_0
function L0_0(A0_349, A1_350)
  return A0_349 + A1_350
end
MO_ADD = L0_0
function L0_0(A0_351, A1_352)
  return A0_351 - A1_352
end
MO_SUBTRACT = L0_0
function L0_0(A0_353, A1_354)
  return A0_353 / A1_354
end
MO_DIVIDE = L0_0
function L0_0(A0_355, A1_356)
  if A0_355 < A1_356 then
    return A0_355
  else
    return A1_356
  end
end
MO_MIN = L0_0
function L0_0(A0_357, A1_358)
  if A1_358 < A0_357 then
    return A0_357
  else
    return A1_358
  end
end
MO_MAX = L0_0
function L0_0(A0_359, A1_360)
  return A0_359 % A1_360
end
MO_MODULO = L0_0
function L0_0(A0_361)
  return math.floor(A0_361 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_362)
  return math.ceil(A0_362)
end
MO_ROUNDUP = L0_0
function L0_0(A0_363)
  return math.floor(A0_363)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_364)
  return math.sin(math.rad(A0_364))
end
MO_SIN = L0_0
function L0_0(A0_365)
  return math.cos(math.rad(A0_365))
end
MO_COSINE = L0_0
function L0_0(A0_366)
  return math.tan(math.rad(A0_366))
end
MO_TANGENT = L0_0
function L0_0(A0_367)
  return math.deg(math.asin(A0_367))
end
MO_ASIN = L0_0
function L0_0(A0_368)
  return math.deg(math.acos(A0_368))
end
MO_ACOS = L0_0
function L0_0(A0_369)
  return math.deg(math.atan(A0_369))
end
MO_ATAN = L0_0
function L0_0(A0_370, A1_371)
  return math.pow(A0_370, A1_371)
end
MO_POW = L0_0
function L0_0(A0_372)
  return math.sqrt(A0_372)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_373, A1_374)
  local L2_375
  L2_375 = A0_373 and A1_374
  return L2_375
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_376, A1_377)
  local L2_378
  L2_378 = A0_376 or A1_377
  return L2_378
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_379)
  local L1_380
  L1_380 = not A0_379
  return L1_380
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_381)
  return math.abs(A0_381)
end
MO_ABS = L0_0
function L0_0(A0_382, A1_383)
  return math.random(A0_382, A1_383)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_384, A1_385)
  local L2_386, L3_387, L4_388, L5_389
  L2_386 = GetMathNumber
  L3_387 = A0_384
  L4_388 = A1_385.Src1VarTable
  L5_389 = A1_385.Src1Var
  L2_386 = L2_386(L3_387, L4_388, L5_389, A1_385.Src1Value)
  L3_387 = GetMathNumber
  L4_388 = A0_384
  L5_389 = A1_385.Src2VarTable
  L3_387 = L3_387(L4_388, L5_389, A1_385.Src2Var, A1_385.Src2Value)
  L4_388 = GetTable
  L5_389 = A0_384
  L4_388 = L4_388(L5_389, A1_385.DestVarTable)
  L5_389 = A1_385.MathOp
  L5_389 = L5_389(L2_386, L3_387)
  SetVarInTable(A0_384, A1_385, L5_389)
end
BBMath = L0_0
function L0_0(A0_390, A1_391, A2_392, A3_393)
  if A2_392 ~= nil and GetTable(A0_390, A1_391)[A2_392] ~= nil then
    return GetTable(A0_390, A1_391)[A2_392]
  end
  return A3_393
end
GetMathNumber = L0_0
function L0_0(A0_394, A1_395)
  if type(A1_395) == "number" then
    return A1_395
  elseif type(A1_395) == "function" then
    return A1_395(A0_394)
  elseif type(A1_395) == "string" then
    return A0_394[A1_395]
  end
end
GetNumber = L0_0
function L0_0(A0_396, A1_397)
  return VectorAdd(A0_396, A1_397)
end
VEC_ADD = L0_0
function L0_0(A0_398, A1_399)
  return VectorSubtract(A0_398, A1_399)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_400, A1_401)
  return VectorScalarMultiply(A0_400, A1_401)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_402, A1_403)
  return VectorScalarDivide(A0_402, A1_403)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_404, A1_405)
  return VectorRotateY(A0_404, A1_405)
end
VEC_ROTATE = L0_0
function L0_0(A0_406, A1_407)
  BBMath(A0_406, A1_407)
end
BBVectorMath = L0_0
function L0_0(A0_408, A1_409)
  local L2_410, L3_411, L4_412, L5_413
  L2_410 = A0_408.InstanceVars
  L3_411 = L2_410.InterpDelta
  if L3_411 == nil then
    L3_411 = A1_409.Amount
    L4_412 = A1_409.AmountVar
    if L4_412 ~= nil then
      L4_412 = GetTable
      L5_413 = A0_408
      L4_412 = L4_412(L5_413, A1_409.AmountVarTable)
      L5_413 = A1_409.AmountVar
      L3_411 = L4_412[L5_413]
    end
    L4_412 = GetPosition
    L5_413 = A1_409.TargetVar
    L5_413 = A0_408[L5_413]
    L4_412 = L4_412(L5_413)
    L2_410.KnockBackStart = L4_412
    L4_412 = GetNormalizedPositionDelta
    L5_413 = A1_409.TargetVar
    L5_413 = A0_408[L5_413]
    L4_412 = L4_412(L5_413, A0_408[A1_409.AttackerVar], true)
    L5_413 = {}
    L5_413.x = L4_412.x * L3_411
    L5_413.y = 0
    L5_413.z = L4_412.z * L3_411
    L2_410.InterpDelta = L5_413
    L5_413 = GetTime
    L5_413 = L5_413()
    L2_410.StartTime = L5_413
    L5_413 = A1_409.KnockBackDuration
    L2_410.KnockBackDuration = L5_413
  end
  L3_411 = A1_409.TargetVar
  L3_411 = A0_408[L3_411]
  L4_412 = GetTime
  L4_412 = L4_412()
  L5_413 = L2_410.StartTime
  L4_412 = L4_412 - L5_413
  L5_413 = L2_410.KnockBackDuration
  L4_412 = L4_412 / L5_413
  L5_413 = {}
  L5_413.x = L2_410.KnockBackStart.x + L2_410.InterpDelta.x * L4_412
  L5_413.y = L2_410.KnockBackStart.y
  L5_413.z = L2_410.KnockBackStart.z + L2_410.InterpDelta.z * L4_412
  SetPosition(L3_411, L5_413)
end
BBKnockback = L0_0
function L0_0(A0_414, A1_415)
  local L2_416, L3_417
  L2_416 = GetParam
  L3_417 = "Left"
  L2_416 = L2_416(L3_417, A0_414, A1_415)
  L3_417 = GetParam
  L3_417 = L3_417("Right", A0_414, A1_415)
  GetTable(A0_414, A1_415.DestVarTable, true)[A1_415.DestVar] = tostring(L2_416) .. tostring(L3_417)
end
BBAppendString = L0_0
function L0_0(A0_418, A1_419)
  local L2_420
  L2_420 = 0
  if A1_419.Delta ~= nil then
    L2_420 = L2_420 + A1_419.Delta
  end
  if A1_419.DeltaByLevel ~= nil and A0_418.Level ~= nil then
    L2_420 = L2_420 + A1_419.DeltaByLevel[A0_418.Level]
  end
  if A1_419.DeltaVar ~= nil then
    L2_420 = L2_420 + GetTable(A0_418, A1_419.DeltaVarTable, true)[A1_419.DeltaVar]
  end
  if A1_419.TargetVar ~= nil then
    A1_419.Stat(L2_420, A0_418[A1_419.TargetVar])
  else
    A1_419.Stat(L2_420)
  end
end
BBIncStat = L0_0
function L0_0(A0_421, A1_422)
  local L2_423
  L2_423 = 0
  if A1_422.Delta ~= nil then
    L2_423 = L2_423 + A1_422.Delta
  end
  if A1_422.DeltaByLevel ~= nil and A0_421.Level ~= nil then
    L2_423 = L2_423 + A1_422.DeltaByLevel[A0_421.Level]
  end
  if A1_422.DeltaVar ~= nil then
    L2_423 = L2_423 + GetTable(A0_421, A1_422.DeltaVarTable, true)[A1_422.DeltaVar]
  end
  if A1_422.TargetVar ~= nil then
    A1_422.Stat(L2_423, A0_421[A1_422.TargetVar])
  else
    A1_422.Stat(L2_423)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_424, A1_425)
  local L2_426, L3_427
  L2_426 = A1_425.TargetVar
  L3_427 = 0
  if A1_425.LaneVar ~= nil then
    L3_427 = L3_427 + GetTable(A0_424, A1_425.LaneVarTable, true)[A1_425.LaneVar]
  end
  if A1_425.Lane ~= nil then
    L3_427 = L3_427 + A1_425.Lane
  end
  SetMinionLane(A0_424[L2_426], L3_427)
end
BBSetMinionLane = L0_0
function L0_0(A0_428, A1_429)
  if A1_429.AttackVar ~= nil then
  end
  if A1_429.Attack ~= nil then
  end
  if A1_429.TotalCoefficientVar ~= nil then
  end
  if A1_429.TotalCoefficient ~= nil then
  end
  if A1_429.TargetVar ~= nil then
    GetTable(A0_428, A1_429.DestVarTable, false)[A1_429.DestVar] = (0 + GetTable(A0_428, A1_429.AttackVarTable, true)[A1_429.AttackVar] + A1_429.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_428[A1_429.TargetVar])) + GetFlatCritDamageMod(A0_428[A1_429.TargetVar])) * (0 + GetTable(A0_428, A1_429.TotalCoefficientVarTable, true)[A1_429.TotalCoefficientVar] + A1_429.TotalCoefficient)
  else
    GetTable(A0_428, A1_429.DestVarTable, false)[A1_429.DestVar] = 2 * A1_429.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_430, A1_431)
  local L2_432, L3_433, L4_434, L5_435, L6_436, L7_437
  L2_432 = GetTable
  L3_433 = A0_430
  L4_434 = A1_431.DestVarTable
  L5_435 = false
  L2_432 = L2_432(L3_433, L4_434, L5_435)
  L3_433 = GetTable
  L4_434 = A0_430
  L5_435 = A1_431.AmountVarTable
  L6_436 = true
  L3_433 = L3_433(L4_434, L5_435, L6_436)
  L4_434 = GetTable
  L5_435 = A0_430
  L6_436 = A0_430.NextBuffVars
  L7_437 = false
  L4_434 = L4_434(L5_435, L6_436, L7_437)
  L5_435 = A1_431.AmountVar
  L5_435 = L3_433[L5_435]
  L6_436 = A1_431.Amount
  L5_435 = L5_435 + L6_436
  L4_434.InitializeShield_Amount = L5_435
  L5_435 = A1_431.AmountVar
  if L5_435 ~= nil then
    L5_435 = A1_431.HealShieldMod
    if L5_435 ~= nil and L5_435 == true then
      L6_436 = A1_431.AttackerVar
      L7_437 = 0
      if L6_436 ~= nil then
        L7_437 = GetPercentHealingAmountMod(A0_430[L6_436])
      end
      L4_434.InitializeShield_Amount, L3_433[A1_431.AmountVar] = (A1_431.Amount + L3_433[A1_431.AmountVar]) * (1 + L7_437), (A1_431.Amount + L3_433[A1_431.AmountVar]) * (1 + L7_437)
    end
  end
  L5_435 = SpellBuffAddNoRenew
  L6_436 = A1_431.AttackerVar
  L6_436 = A0_430[L6_436]
  L7_437 = A1_431.UnitVar
  L7_437 = A0_430[L7_437]
  L5_435(L6_436, L7_437, "InitializeShieldMarker", 0, 1, 25000, L4_434)
  L5_435 = BBIncreaseShield
  L6_436 = A0_430
  L7_437 = A1_431
  L5_435(L6_436, L7_437)
end
BBInitializeShield = L0_0
function L0_0(A0_438, A1_439)
  if A1_439.CDVar ~= nil then
  end
  if A1_439.CD ~= nil then
  end
  if A1_439.TargetVar ~= nil then
    GetTable(A0_438, A1_439.DestVarTable, false)[A1_439.DestVar] = (0 + GetTable(A0_438, A1_439.CDVarTable, true)[A1_439.CDVar] + A1_439.CD) * (1 + GetPercentCooldownMod(A0_438[A1_439.TargetVar]))
  else
    GetTable(A0_438, A1_439.DestVarTable, false)[A1_439.DestVar] = A1_439.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_440, A1_441)
  local L2_442, L3_443
  L3_443 = A1_441.TargetVar
  if L3_443 ~= nil then
    L2_442 = A1_441.Stat(A0_440[L3_443])
  else
    L2_442 = A1_441.Stat()
  end
  SetVarInTable(A0_440, A1_441, L2_442)
end
BBGetStat = L0_0
function L0_0(A0_444, A1_445)
  if A1_445.TargetVar ~= nil then
    GetTable(A0_444, A1_445.DestVarTable, false)[A1_445.DestVar] = GetLevel(A0_444[A1_445.TargetVar])
  else
    GetTable(A0_444, A1_445.DestVarTable, false)[A1_445.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_446, A1_447)
  if A1_447.TargetVar ~= nil then
    GetTable(A0_446, A1_447.DestVarTable, false)[A1_447.DestVar] = GetUnitSignificance(A0_446[A1_447.TargetVar])
  else
    GetTable(A0_446, A1_447.DestVarTable, false)[A1_447.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_448, A1_449)
  if A1_449.TargetVar ~= nil then
    GetTable(A0_448, A1_449.DestVarTable, false)[A1_449.DestVar] = GetArmor(A0_448[A1_449.TargetVar])
  else
    GetTable(A0_448, A1_449.DestVarTable, false)[A1_449.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_450, A1_451)
  if A1_451.TargetVar ~= nil then
    GetTable(A0_450, A1_451.DestVarTable, false)[A1_451.DestVar] = GetSpellBlock(A0_450[A1_451.TargetVar])
  else
    GetTable(A0_450, A1_451.DestVarTable, false)[A1_451.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_452, A1_453)
  local L2_454, L3_455
  L3_455 = A1_453.TargetVar
  if L3_455 ~= nil then
    L2_454 = GetTeamID(A0_452[L3_455])
  else
    L2_454 = GetTeamID()
  end
  SetVarInTable(A0_452, A1_453, L2_454)
end
BBGetTeamID = L0_0
function L0_0(A0_456, A1_457)
  local L2_458, L3_459, L4_460
  L2_458 = GetTable
  L3_459 = A0_456
  L4_460 = A1_457.DestVarTable
  L2_458 = L2_458(L3_459, L4_460, false)
  L3_459 = A1_457.TargetVar
  L4_460 = nil
  if L3_459 ~= nil then
    L4_460 = GetTeamID(A0_456[L3_459])
  else
    L4_460 = GetTeamID()
  end
  if L4_460 == TEAM_ORDER then
    L2_458[A1_457.DestVar] = TEAM_CHAOS
  elseif L4_460 == TEAM_CHAOS then
    L2_458[A1_457.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_461, A1_462)
  if A1_462.TargetVar ~= nil then
    GetTable(A0_461, A1_462.DestVarTable, false)[A1_462.DestVar] = GetUnitSkinName(A0_461[A1_462.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_463, A1_464)
  local L2_465, L3_466, L4_467
  L2_465 = GetTable
  L3_466 = A0_463
  L4_467 = A1_464.DestVarTable
  L2_465 = L2_465(L3_466, L4_467, false)
  L3_466 = A0_463.Owner
  L4_467 = nil
  if A1_464.TargetVar ~= nil then
    L4_467 = GetTotalAttackDamage(A0_463[A1_464.TargetVar])
  else
    L4_467 = GetTotalAttackDamage()
  end
  SetVarInTable(A0_463, A1_464, L4_467)
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_468, A1_469)
  GetTable(A0_468, A1_469.DestVarTable, true)[A1_469.DestVar] = A1_469.Status(A0_468[A1_469.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_470, A1_471)
  local L2_472
  L2_472 = A1_471.TargetVar
  L2_472 = A0_470[L2_472]
  ClearAttackTarget(L2_472)
end
BBClearAttackTarget = L0_0
function L0_0(A0_473, A1_474)
  local L2_475, L3_476
  L2_475 = GetTable
  L3_476 = A0_473
  L2_475 = L2_475(L3_476, A1_474.DestVarTable, true)
  L3_476 = A1_474.Info
  L3_476 = L3_476(A0_473[A1_474.TargetVar])
  SetVarInTable(A0_473, A1_474, L3_476)
end
BBGetCastInfo = L0_0
function L0_0(A0_477, A1_478, A2_479)
  local L3_480, L4_481, L5_482, L6_483
  L3_480 = GetTable
  L4_481 = A0_477
  L5_482 = A1_478.TrackTimeVarTable
  L6_483 = false
  L3_480 = L3_480(L4_481, L5_482, L6_483)
  L4_481 = GetTime
  L4_481 = L4_481()
  L5_482 = A1_478.ExecuteImmediately
  L6_483 = GetParam
  L6_483 = L6_483("TimeBetweenExecutions", A0_477, A1_478)
  if A1_478.TickTimeVar ~= nil and GetTable(A0_477, A1_478.TickTimeVarTable, false)[A1_478.TickTimeVar] ~= nil then
    L6_483 = GetTable(A0_477, A1_478.TickTimeVarTable, false)[A1_478.TickTimeVar]
  end
  if L3_480[A1_478.TrackTimeVar] == nil then
    L3_480[A1_478.TrackTimeVar] = L4_481
    if L5_482 == true then
      ExecuteBuildingBlocks(A2_479, A0_477)
    end
  end
  if L4_481 >= L3_480[A1_478.TrackTimeVar] + L6_483 then
    L3_480[A1_478.TrackTimeVar] = L3_480[A1_478.TrackTimeVar] + L6_483
    ExecuteBuildingBlocks(A2_479, A0_477)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_484, A1_485, A2_486)
  GetTable(A0_484, A1_485.TrackTimeVarTable, false)[A1_485.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_487, A1_488)
  local L2_489
  L2_489 = A1_488.SrcValue
  if A1_488.SrcVar ~= nil then
    L2_489 = GetTable(A0_487, A1_488.SrcVarTable, true)[A1_488.SrcVar]
  end
  A1_488.Status(A0_487[A1_488.TargetVar], L2_489)
end
BBSetStatus = L0_0
function L0_0(A0_490, A1_491)
  local L2_492
  L2_492 = A1_491.ToAlert
  if GetTable(A0_490, A1_491.SrcVarTable, false) ~= nil and A1_491.SrcVar ~= nil then
    L2_492 = L2_492 .. GetTable(A0_490, A1_491.SrcVarTable, false)[A1_491.SrcVar]
  end
  _ALERT(L2_492)
end
BBAlert = L0_0
function L0_0(A0_493, A1_494)
  local L2_495, L3_496, L4_497, L5_498, L6_499, L7_500
  L2_495 = GetParam
  L3_496 = "Value"
  L4_497 = A0_493
  L5_498 = A1_494
  L2_495 = L2_495(L3_496, L4_497, L5_498)
  if L2_495 == nil then
    L3_496 = ReportError
    L4_497 = "Could not resolve Value param"
    L3_496(L4_497)
    return
  end
  L3_496 = true
  L4_497 = GetParam
  L5_498 = "OnUnit"
  L6_499 = A0_493
  L7_500 = A1_494
  L4_497 = L4_497(L5_498, L6_499, L7_500)
  if L4_497 == nil then
    L3_496 = false
    L5_498 = GetParam
    L6_499 = "OnUnitByFlag"
    L7_500 = A0_493
    L5_498 = L5_498(L6_499, L7_500, A1_494)
    L4_497 = L5_498
  end
  if L4_497 == nil then
    L5_498 = ReportError
    L6_499 = "Could not resolve OnUnit param"
    L5_498(L6_499)
    return
  end
  L5_498 = true
  L6_499 = GetParam
  L7_500 = "ChampionToSayTo"
  L6_499 = L6_499(L7_500, A0_493, A1_494)
  if L6_499 == nil then
    L5_498 = false
    L7_500 = GetParam
    L7_500 = L7_500("ChampionToSayToByFlag", A0_493, A1_494)
    L6_499 = L7_500
  end
  if L6_499 == nil then
    L7_500 = ReportError
    L7_500("Could not resolve ChampionToSayTo param")
    return
  end
  L7_500 = GetParam
  L7_500 = L7_500("ShowToSpectator", A0_493, A1_494)
  if L7_500 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  DisplayNumericFloatingTextOnUnitToChampion(L2_495, A1_494.TextType, L4_497, L3_496, L6_499, L5_498, L7_500)
end
BBDisplayNumericFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_501, A1_502)
  local L2_503, L3_504, L4_505, L5_506, L6_507, L7_508
  L2_503 = GetParam
  L3_504 = "Message"
  L4_505 = A0_501
  L5_506 = A1_502
  L2_503 = L2_503(L3_504, L4_505, L5_506)
  if L2_503 == nil then
    L3_504 = ReportError
    L4_505 = "Could not resolve Message param"
    L3_504(L4_505)
    return
  end
  L3_504 = true
  L4_505 = GetParam
  L5_506 = "OnUnit"
  L6_507 = A0_501
  L7_508 = A1_502
  L4_505 = L4_505(L5_506, L6_507, L7_508)
  if L4_505 == nil then
    L3_504 = false
    L5_506 = GetParam
    L6_507 = "OnUnitByFlag"
    L7_508 = A0_501
    L5_506 = L5_506(L6_507, L7_508, A1_502)
    L4_505 = L5_506
  end
  if L4_505 == nil then
    L5_506 = ReportError
    L6_507 = "Could not resolve OnUnit param"
    L5_506(L6_507)
    return
  end
  L5_506 = true
  L6_507 = GetParam
  L7_508 = "ChampionToSayTo"
  L6_507 = L6_507(L7_508, A0_501, A1_502)
  if L6_507 == nil then
    L5_506 = false
    L7_508 = GetParam
    L7_508 = L7_508("ChampionToSayToByFlag", A0_501, A1_502)
    L6_507 = L7_508
  end
  if L6_507 == nil then
    L7_508 = ReportError
    L7_508("Could not resolve ChampionToSayTo param")
    return
  end
  L7_508 = GetParam
  L7_508 = L7_508("ShowToSpectator", A0_501, A1_502)
  if L7_508 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  SayWithFloatingTextOnUnitToChampion(tostring(L2_503), A1_502.TextType, L4_505, L3_504, L6_507, L5_506, L7_508)
end
BBSayWithFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_509, A1_510)
  local L2_511, L3_512, L4_513
  L2_511 = A1_510.ToSay
  L3_512 = GetTable
  L4_513 = A0_509
  L3_512 = L3_512(L4_513, A1_510.SrcVarTable, false)
  if L3_512 ~= nil then
    L4_513 = A1_510.SrcVar
    if L4_513 ~= nil then
      L4_513 = L2_511
      L2_511 = L4_513 .. tostring(L3_512[A1_510.SrcVar])
    end
  end
  L4_513 = nil
  if A1_510.OwnerVar ~= nil then
    L4_513 = A0_509[A1_510.OwnerVar]
  else
    L4_513 = A0_509.Owner
  end
  if A1_510.TextType == nil then
    A1_510.TextType = 0
  end
  Say(L4_513, L2_511, A1_510.TextType)
end
BBSay = L0_0
function L0_0(A0_514, A1_515)
  local L2_516, L3_517, L4_518
  L2_516 = A1_515.ToSay
  L3_517 = GetTable
  L4_518 = A0_514
  L3_517 = L3_517(L4_518, A1_515.SrcVarTable, false)
  if L3_517 ~= nil then
    L4_518 = A1_515.SrcVar
    if L4_518 ~= nil then
      L4_518 = L2_516
      L2_516 = L4_518 .. tostring(L3_517[A1_515.SrcVar])
    end
  end
  L4_518 = nil
  if A1_515.OwnerVar ~= nil then
    L4_518 = A0_514[A1_515.OwnerVar]
  else
    L4_518 = A0_514.Owner
  end
  if A1_515.TextType == nil then
    A1_515.TextType = 0
  end
  Say(L4_518, L2_516, A1_515.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_519, A1_520)
  GetTable(A0_519, A1_520.DestVarTable, true)[A1_520.DestVar] = BBLuaGetGold(A0_519, A1_520)
end
BBGetGold = L0_0
function L0_0(A0_521, A1_522)
  GetTable(A0_521, A1_522.DestVarTable, true)[A1_522.DestVar] = BBLuaGetTotalGold(A0_521, A1_522)
end
BBGetTotalGold = L0_0
function L0_0(A0_523, A1_524)
  SpellBuffAdd(A0_523[A1_524.OwnerVar], A0_523[A1_524.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_523.NextBuffVars)
  BBTeleportToPositionHelper(A0_523, A1_524)
end
BBTeleportToPosition = L0_0
function L0_0(A0_525, A1_526)
  if A1_526.XVar ~= nil and GetTable(A0_525, A1_526.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_525, A1_526.XVarTable, true)[A1_526.XVar]
  else
    Xloc = A1_526.X
  end
  if A1_526.YVar ~= nil and GetTable(A0_525, A1_526.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_525, A1_526.YVarTable, true)[A1_526.YVar]
  else
    Yloc = A1_526.Y
  end
  if A1_526.ZVar ~= nil and GetTable(A0_525, A1_526.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_525, A1_526.ZVarTable, true)[A1_526.ZVar]
  else
    Zloc = A1_526.Z
  end
  A1_526.OwnerVar, A0_525.position = A1_526.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_526.CastPositionName = "position"
  BBTeleportToPosition(A0_525, A1_526)
end
BBTeleportToPoint = L0_0
function L0_0(A0_527, A1_528)
  A1_528.TimeoutInFOW = 999999
  A1_528.BindFlexToOwnerPAR = false
  A1_528.Flags = 0
  A1_528.FollowsGroundTilt = false
  A1_528.FacesTarget = false
  A1_528.HideFromSpectator = false
  A1_528.SendIfOnScreenOrDiscard = false
  A1_528.PersistsThroughReconnect = true
  A1_528.FOWVisibilityRadius = 10
  A1_528.Scale = 1
  A1_528.BindObjectVar = A1_528.BindObject1Var
  A1_528.EffectID2Var = A1_528.OtherTeamEffectIDVar
  A1_528.TargetObjectVar = A1_528.BindObject2Var
  A1_528.FOWTeamOverrideVar = A1_528.FOWTeamVar
  A1_528.BoneName = A1_528.BindObject1BoneName
  A1_528.TargetBoneName = A1_528.BindObject2BoneName
  A1_528.EffectName = A1_528.EffectParticleFile
  A1_528.EffectNameForOtherTeam = A1_528.OtherTeamParticleFile
  BBSpellEffectCreate(A0_527, A1_528)
end
BBSpellEffectCreate_EasyBeam = L0_0
function L0_0(A0_529, A1_530)
  A1_530.TimeoutInFOW = 999999
  A1_530.BindFlexToOwnerPAR = false
  A1_530.Flags = 0
  A1_530.FollowsGroundTilt = false
  A1_530.FacesTarget = false
  A1_530.HideFromSpectator = false
  A1_530.SendIfOnScreenOrDiscard = true
  A1_530.PersistsThroughReconnect = false
  A1_530.FOWVisibilityRadius = 10
  A1_530.Scale = 1
  A1_530.FOWTeamOverrideVar = A1_530.FOWTeamVar
  A1_530.EffectName = A1_530.ParticleFile
  A1_530.EffectNameForOtherTeam = A1_530.ParticleFileForOtherTeam
  A1_530.BoneName = A1_530.BindObjectBoneName
  BBSpellEffectCreate(A0_529, A1_530)
end
BBSpellEffectCreate_EasyHit = L0_0
function L0_0(A0_531, A1_532)
  ReincarnateNonDeadHero(GetTable(A0_531, A1_532.TargetTable, false)[A1_532.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_533, A1_534)
  GetTable(A0_533, A1_534.DestVarTable, true)[A1_534.DestVar] = A1_534.Function(A0_533[A1_534.OwnerVar], A1_534.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_535, A1_536)
  local L2_537, L3_538, L4_539, L5_540
  L2_537 = A1_536.WhomToOrderVar
  L2_537 = A0_535[L2_537]
  L3_538 = A1_536.TargetOfOrderVar
  L3_538 = A0_535[L3_538]
  L4_539 = GetTable
  L5_540 = A0_535
  L4_539 = L4_539(L5_540, A1_536.SrcVarTable, false)
  L5_540 = nil
  if A1_536.SrcVar ~= nil and L4_539 ~= nil then
    L5_540 = L4_539[A1_536.SrcVar]
  else
    L5_540 = GetPosition(L3_538)
  end
  if L3_538 == nil then
    L3_538 = L2_537
  end
  IssueOrder(L2_537, A1_536.Order, L5_540, L3_538)
end
BBIssueOrder = L0_0
function L0_0(A0_541, A1_542)
  local L2_543
  L2_543 = GetParam
  L2_543 = L2_543("NewRange", A0_541, A1_542)
  SetSpellCastRange(L2_543)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_544, A1_545)
  GetTable(A0_544, A1_545.DestVarTable, true)[A1_545.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_546, A1_547)
  local L2_548, L3_549
  L2_548 = A1_547.ObjectVar1
  L2_548 = A0_546[L2_548]
  L3_549 = A1_547.ObjectVar2
  L3_549 = A0_546[L3_549]
  GetTable(A0_546, A1_547.DestVarTable, true)[A1_547.DestVar] = DistanceBetweenObjectBounds(L2_548, L3_549)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_550, A1_551)
  local L2_552, L3_553, L4_554
  L2_552 = A1_551.ObjectVar
  L2_552 = A0_550[L2_552]
  L3_553 = GetTable
  L4_554 = A0_550
  L3_553 = L3_553(L4_554, A1_551.PointVarTable, true)
  L4_554 = A1_551.PointVar
  L4_554 = L3_553[L4_554]
  GetTable(A0_550, A1_551.DestVarTable, true)[A1_551.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_552, L4_554)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_555, A1_556)
  local L2_557, L3_558
  L2_557 = GetParam
  L3_558 = "Point1"
  L2_557 = L2_557(L3_558, A0_555, A1_556)
  L3_558 = GetParam
  L3_558 = L3_558("Point2", A0_555, A1_556)
  GetTable(A0_555, A1_556.DestVarTable, true)[A1_556.DestVar] = DistanceBetweenPoints(L2_557, L3_558)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_559, A1_560, A2_561)
  local L3_562, L4_563, L5_564, L6_565, L7_566, L8_567
  L5_564 = 0
  L6_565 = nil
  L7_566 = A1_560.ObjectDistanceType
  L8_567 = A1_560.ObjectVar1
  L3_562 = A0_559[L8_567]
  L8_567 = A1_560.ObjectVar2
  L4_563 = A0_559[L8_567]
  if nil == L4_563 then
    L8_567 = A1_560.Point2Var
    if nil ~= L8_567 then
      L8_567 = GetTable
      L8_567 = L8_567(A0_559, A1_560.Point2VarTable, true)
      L4_563 = L8_567[A1_560.Point2Var]
      L5_564 = L5_564 + 1
    end
  end
  if nil == L3_562 then
    L8_567 = A1_560.Point1Var
    if nil ~= L8_567 then
      L8_567 = GetTable
      L8_567 = L8_567(A0_559, A1_560.Point1VarTable, true)
      L3_562 = L8_567[A1_560.Point1Var]
      L5_564 = L5_564 + 1
      if 1 == L5_564 then
        L3_562, L4_563 = L4_563, L3_562
      end
    end
  end
  if nil ~= L7_566 then
    if 0 == L5_564 then
      L8_567 = OBJECT_CENTER
      if L8_567 == L7_566 then
        L6_565 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_567 = OBJECT_BOUNDARY
        if L8_567 == L7_566 then
          L6_565 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_567 = A1_560.OwnerVar
          L8_567 = A0_559[L8_567]
          Say(L8_567, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_564 then
      L8_567 = OBJECT_CENTER
      if L8_567 == L7_566 then
        L6_565 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_567 = OBJECT_BOUNDARY
        if L8_567 == L7_566 then
          L6_565 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_567 = A1_560.OwnerVar
          L8_567 = A0_559[L8_567]
          Say(L8_567, "invalid object distance type", 0)
        end
      end
    else
      L6_565 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_567 = A1_560.Distance
  if A1_560.DistanceVar ~= nil and GetTable(A0_559, A1_560.DistanceVarTable, true) ~= nil then
    L8_567 = L8_567 + GetTable(A0_559, A1_560.DistanceVarTable, true)[A1_560.DistanceVar]
  end
  if L3_562 ~= nil and L4_563 ~= nil and L6_565 ~= nil and L8_567 ~= nil then
    if not L6_565(L3_562, L4_563, L8_567) then
      ExecuteBuildingBlocks(A2_561, A0_559)
      A0_559.LastIfSucceeded = true
    else
      A0_559.LastIfSucceeded = false
    end
  else
    A0_559.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_568, A1_569)
  local L2_570, L3_571
  L2_570 = A1_569.TargetVar
  L2_570 = A0_568[L2_570]
  L3_571 = A1_569.CasterVar
  L3_571 = A0_568[L3_571]
  GetTable(A0_568, A1_569.DestVarTable, true)[A1_569.DestVar] = SpellBuffCount(L2_570, A1_569.BuffName, L3_571)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_572, A1_573)
  local L2_574
  L2_574 = A1_573.TargetVar
  L2_574 = A0_572[L2_574]
  GetTable(A0_572, A1_573.DestVarTable, true)[A1_573.DestVar] = SpellBuffCount(L2_574, A1_573.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_575, A1_576)
  local L2_577, L3_578
  L2_577 = GetTable
  L3_578 = A0_575
  L2_577 = L2_577(L3_578, A1_576.ScaleVarTable, false)
  L3_578 = nil
  if A1_576.OwnerVar ~= nil then
    L3_578 = A0_575[A1_576.OwnerVar]
  else
    L3_578 = A0_575.Owner
  end
  if A1_576.ScaleVar ~= nil and A1_576.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_577[A1_576.ScaleVar], L3_578)
  else
    SetScaleSkinCoef(A1_576.Scale, L3_578)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_579, A1_580)
  SpellBuffAdd(A0_579[A1_580.TargetVar], A0_579[A1_580.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_579.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_581, A1_582, A2_583)
  local L3_584, L4_585
  L3_584 = A1_582.TargetVar
  L3_584 = A0_581[L3_584]
  L4_585 = A1_582.NumStacks
  if GetParam("NumStacks", A0_581, A1_582) == 0 then
    L4_585 = SpellBuffCount(L3_584, A1_582.BuffName, caster)
  else
    L4_585 = GetParam("NumStacks", A0_581, A1_582)
  end
  while L4_585 > 0 do
    SpellBuffRemove(L3_584, A1_582.BuffName, A0_581[A1_582.AttackerVar])
    L4_585 = L4_585 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_586, A1_587)
  local L2_588, L3_589
  L2_588 = GetParam
  L3_589 = "Unit"
  L2_588 = L2_588(L3_589, A0_586, A1_587)
  unit = L2_588
  L2_588 = unit
  if L2_588 == nil then
    L2_588 = ReportError
    L3_589 = "Could not resolve Unit param"
    L2_588(L3_589)
    return
  end
  L2_588 = true
  L3_589 = GetParam
  L3_589 = L3_589("ChampionToShowTo", A0_586, A1_587)
  if L3_589 == nil then
    L2_588 = false
    L3_589 = GetParam("ChampionToShowToByFlag", A0_586, A1_587)
  end
  if L3_589 == nil then
    ReportError("Could not resolve ChampionToShowTo param")
    return
  end
  SetShowHealthBarToChampion(unit, A1_587.Show, L3_589, L2_588, A1_587.ApplyToSpectator)
end
BBSetShowHealthBarToChampion = L0_0
function L0_0(A0_590, A1_591)
  if GetParam("Vector", A0_590, A1_591) ~= nil then
    GetTable(A0_590, A1_591.DestVarTable, false)[A1_591.DestVar] = math.sqrt(GetParam("Vector", A0_590, A1_591).x * GetParam("Vector", A0_590, A1_591).x + GetParam("Vector", A0_590, A1_591).y * GetParam("Vector", A0_590, A1_591).y + GetParam("Vector", A0_590, A1_591).z * GetParam("Vector", A0_590, A1_591).z)
  end
end
BBGetVectorLength = L0_0
function L0_0(A0_592, A1_593, A2_594)
  if A0_592.EmoteId == A1_593.EmoteId then
    ExecuteBuildingBlocks(A2_594, A0_592)
    A0_592.LastIfSucceeded = true
  else
    A0_592.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_595, A1_596, A2_597)
  if A0_595.EmoteId ~= A1_596.EmoteId then
    ExecuteBuildingBlocks(A2_597, A0_595)
    A0_595.LastIfSucceeded = true
  else
    A0_595.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_598, A1_599)
  local L2_600, L3_601, L4_602, L5_603
  L2_600 = GetTable
  L3_601 = A0_598
  L4_602 = A1_599.String1VarTable
  L5_603 = false
  L2_600 = L2_600(L3_601, L4_602, L5_603)
  L3_601 = A1_599.String1Var
  L3_601 = L2_600[L3_601]
  L4_602 = GetTable
  L5_603 = A0_598
  L4_602 = L4_602(L5_603, A1_599.String2VarTable, false)
  L5_603 = A1_599.String2Var
  L5_603 = L4_602[L5_603]
  GetTable(A0_598, A1_599.ResultVarTable, false)[A1_599.ResultVar] = L3_601 .. L5_603
end
BBConcatenateStrings = L0_0
function L0_0(A0_604, A1_605)
  local L2_606, L3_607
  L2_606 = GetTable
  L3_607 = A0_604
  L2_606 = L2_606(L3_607, A1_605.VariableVarTable, false)
  L3_607 = A1_605.VariableVar
  L3_607 = L2_606[L3_607]
  GetTable(A0_604, A1_605.ResultVarTable, false)[A1_605.ResultVar] = "(" .. L3_607 .. ")"
end
BBEncaseInParantheses = L0_0
function L0_0(A0_608, A1_609)
  BBGetMinionKills(A0_608, A1_609)
  A0_608.MinionKillSource = GetParam("MinionKillTarget")
  A0_608.MinionKills = A0_608.MinionsKilled + GetParam("MinionKills", A0_608, A1_609)
  BBSetMinionKills(A0_608, A1_609)
end
BBIncreaseMinionKills = L0_0
