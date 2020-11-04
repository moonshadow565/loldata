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
  if A1_319.OwnerVar ~= nil then
    L3_321 = A0_318[A1_319.OwnerVar]
  else
    L3_321 = A0_318.Owner
  end
  if HasPARType(L3_321, A1_319.PARType) then
    ExecuteBuildingBlocks(A2_320, A0_318)
    A0_318.LastIfSucceeded = true
  else
    A0_318.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_323, A1_324, A2_325)
  local L3_326, L4_327
  if A1_324.OwnerVar ~= nil then
    L3_326 = A0_323[A1_324.OwnerVar]
  else
    L3_326 = A0_323.Owner
  end
  if not HasPARType(L3_326, A1_324.PARType) then
    ExecuteBuildingBlocks(A2_325, A0_323)
    A0_323.LastIfSucceeded = true
  else
    A0_323.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_328, A1_329, A2_330)
  local L3_331, L4_332, L5_333, L6_334, L7_335
  L3_331 = GetTable
  L4_332 = A0_328
  L5_333 = A1_329.Src1VarTable
  L6_334 = false
  L3_331 = L3_331(L4_332, L5_333, L6_334)
  L4_332 = GetTable
  L5_333 = A0_328
  L6_334 = A1_329.Src2VarTable
  L7_335 = false
  L4_332 = L4_332(L5_333, L6_334, L7_335)
  L5_333 = true
  while L5_333 do
    L6_334 = false
    L7_335 = nil
    if L3_331 ~= nil and A1_329.Src1Var ~= nil then
      L7_335 = L3_331[A1_329.Src1Var]
    else
      L7_335 = A1_329.Value1
    end
    if L4_332 ~= nil and A1_329.Src2Var ~= nil then
      L6_334 = A1_329.CompareOp(L7_335, L4_332[A1_329.Src2Var])
    else
      L6_334 = A1_329.CompareOp(L7_335, A1_329.Value2)
    end
    if L6_334 then
      ExecuteBuildingBlocks(A2_330, A0_328)
    else
      L5_333 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_336, A1_337, A2_338)
  local L3_339, L4_340, L5_341
  L3_339 = GetParam
  L4_340 = "Start"
  L5_341 = A0_336
  L3_339 = L3_339(L4_340, L5_341, A1_337)
  L4_340 = GetParam
  L5_341 = "End"
  L4_340 = L4_340(L5_341, A0_336, A1_337)
  L5_341 = L3_339
  while L4_340 >= L5_341 do
    SetVarInTable(A0_336, A1_337, L5_341)
    ExecuteBuildingBlocks(A2_338, A0_336)
    L5_341 = L5_341 + 1
  end
end
BBFor = L0_0
function L0_0(A0_342, A1_343)
  return A0_342 * A1_343
end
MO_MULTIPLY = L0_0
function L0_0(A0_344, A1_345)
  return A0_344 + A1_345
end
MO_ADD = L0_0
function L0_0(A0_346, A1_347)
  return A0_346 - A1_347
end
MO_SUBTRACT = L0_0
function L0_0(A0_348, A1_349)
  return A0_348 / A1_349
end
MO_DIVIDE = L0_0
function L0_0(A0_350, A1_351)
  if A0_350 < A1_351 then
    return A0_350
  else
    return A1_351
  end
end
MO_MIN = L0_0
function L0_0(A0_352, A1_353)
  if A1_353 < A0_352 then
    return A0_352
  else
    return A1_353
  end
end
MO_MAX = L0_0
function L0_0(A0_354, A1_355)
  return A0_354 % A1_355
end
MO_MODULO = L0_0
function L0_0(A0_356)
  return math.floor(A0_356 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_357)
  return math.ceil(A0_357)
end
MO_ROUNDUP = L0_0
function L0_0(A0_358)
  return math.floor(A0_358)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_359)
  return math.sin(math.rad(A0_359))
end
MO_SIN = L0_0
function L0_0(A0_360)
  return math.cos(math.rad(A0_360))
end
MO_COSINE = L0_0
function L0_0(A0_361)
  return math.tan(math.rad(A0_361))
end
MO_TANGENT = L0_0
function L0_0(A0_362)
  return math.deg(math.asin(A0_362))
end
MO_ASIN = L0_0
function L0_0(A0_363)
  return math.deg(math.acos(A0_363))
end
MO_ACOS = L0_0
function L0_0(A0_364)
  return math.deg(math.atan(A0_364))
end
MO_ATAN = L0_0
function L0_0(A0_365, A1_366)
  return math.pow(A0_365, A1_366)
end
MO_POW = L0_0
function L0_0(A0_367)
  return math.sqrt(A0_367)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_368, A1_369)
  local L2_370
  L2_370 = A0_368 and A1_369
  return L2_370
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_371, A1_372)
  local L2_373
  L2_373 = A0_371 or A1_372
  return L2_373
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_374)
  local L1_375
  L1_375 = not A0_374
  return L1_375
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_376)
  return math.abs(A0_376)
end
MO_ABS = L0_0
function L0_0(A0_377, A1_378)
  return math.random(A0_377, A1_378)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_379, A1_380)
  local L2_381, L3_382, L4_383, L5_384
  L2_381 = GetMathNumber
  L3_382 = A0_379
  L4_383 = A1_380.Src1VarTable
  L5_384 = A1_380.Src1Var
  L2_381 = L2_381(L3_382, L4_383, L5_384, A1_380.Src1Value)
  L3_382 = GetMathNumber
  L4_383 = A0_379
  L5_384 = A1_380.Src2VarTable
  L3_382 = L3_382(L4_383, L5_384, A1_380.Src2Var, A1_380.Src2Value)
  L4_383 = GetTable
  L5_384 = A0_379
  L4_383 = L4_383(L5_384, A1_380.DestVarTable)
  L5_384 = A1_380.MathOp
  L5_384 = L5_384(L2_381, L3_382)
  SetVarInTable(A0_379, A1_380, L5_384)
end
BBMath = L0_0
function L0_0(A0_385, A1_386, A2_387, A3_388)
  if A2_387 ~= nil and GetTable(A0_385, A1_386)[A2_387] ~= nil then
    return GetTable(A0_385, A1_386)[A2_387]
  end
  return A3_388
end
GetMathNumber = L0_0
function L0_0(A0_389, A1_390)
  if type(A1_390) == "number" then
    return A1_390
  elseif type(A1_390) == "function" then
    return A1_390(A0_389)
  elseif type(A1_390) == "string" then
    return A0_389[A1_390]
  end
end
GetNumber = L0_0
function L0_0(A0_391, A1_392)
  return VectorAdd(A0_391, A1_392)
end
VEC_ADD = L0_0
function L0_0(A0_393, A1_394)
  return VectorSubtract(A0_393, A1_394)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_395, A1_396)
  return VectorScalarMultiply(A0_395, A1_396)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_397, A1_398)
  return VectorScalarDivide(A0_397, A1_398)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_399, A1_400)
  return VectorRotateY(A0_399, A1_400)
end
VEC_ROTATE = L0_0
function L0_0(A0_401, A1_402)
  BBMath(A0_401, A1_402)
end
BBVectorMath = L0_0
function L0_0(A0_403, A1_404)
  local L2_405, L3_406, L4_407, L5_408
  L2_405 = A0_403.InstanceVars
  L3_406 = L2_405.InterpDelta
  if L3_406 == nil then
    L3_406 = A1_404.Amount
    L4_407 = A1_404.AmountVar
    if L4_407 ~= nil then
      L4_407 = GetTable
      L5_408 = A0_403
      L4_407 = L4_407(L5_408, A1_404.AmountVarTable)
      L5_408 = A1_404.AmountVar
      L3_406 = L4_407[L5_408]
    end
    L4_407 = GetPosition
    L5_408 = A1_404.TargetVar
    L5_408 = A0_403[L5_408]
    L4_407 = L4_407(L5_408)
    L2_405.KnockBackStart = L4_407
    L4_407 = GetNormalizedPositionDelta
    L5_408 = A1_404.TargetVar
    L5_408 = A0_403[L5_408]
    L4_407 = L4_407(L5_408, A0_403[A1_404.AttackerVar], true)
    L5_408 = {}
    L5_408.x = L4_407.x * L3_406
    L5_408.y = 0
    L5_408.z = L4_407.z * L3_406
    L2_405.InterpDelta = L5_408
    L5_408 = GetTime
    L5_408 = L5_408()
    L2_405.StartTime = L5_408
    L5_408 = A1_404.KnockBackDuration
    L2_405.KnockBackDuration = L5_408
  end
  L3_406 = A1_404.TargetVar
  L3_406 = A0_403[L3_406]
  L4_407 = GetTime
  L4_407 = L4_407()
  L5_408 = L2_405.StartTime
  L4_407 = L4_407 - L5_408
  L5_408 = L2_405.KnockBackDuration
  L4_407 = L4_407 / L5_408
  L5_408 = {}
  L5_408.x = L2_405.KnockBackStart.x + L2_405.InterpDelta.x * L4_407
  L5_408.y = L2_405.KnockBackStart.y
  L5_408.z = L2_405.KnockBackStart.z + L2_405.InterpDelta.z * L4_407
  SetPosition(L3_406, L5_408)
end
BBKnockback = L0_0
function L0_0(A0_409, A1_410)
  local L2_411, L3_412
  L2_411 = GetParam
  L3_412 = "Left"
  L2_411 = L2_411(L3_412, A0_409, A1_410)
  L3_412 = GetParam
  L3_412 = L3_412("Right", A0_409, A1_410)
  GetTable(A0_409, A1_410.DestVarTable, true)[A1_410.DestVar] = tostring(L2_411) .. tostring(L3_412)
end
BBAppendString = L0_0
function L0_0(A0_413, A1_414)
  local L2_415
  L2_415 = 0
  if A1_414.Delta ~= nil then
    L2_415 = L2_415 + A1_414.Delta
  end
  if A1_414.DeltaByLevel ~= nil and A0_413.Level ~= nil then
    L2_415 = L2_415 + A1_414.DeltaByLevel[A0_413.Level]
  end
  if A1_414.DeltaVar ~= nil then
    L2_415 = L2_415 + GetTable(A0_413, A1_414.DeltaVarTable, true)[A1_414.DeltaVar]
  end
  if A1_414.TargetVar ~= nil then
    A1_414.Stat(L2_415, A0_413[A1_414.TargetVar])
  else
    A1_414.Stat(L2_415)
  end
end
BBIncStat = L0_0
function L0_0(A0_416, A1_417)
  local L2_418
  L2_418 = 0
  if A1_417.Delta ~= nil then
    L2_418 = L2_418 + A1_417.Delta
  end
  if A1_417.DeltaByLevel ~= nil and A0_416.Level ~= nil then
    L2_418 = L2_418 + A1_417.DeltaByLevel[A0_416.Level]
  end
  if A1_417.DeltaVar ~= nil then
    L2_418 = L2_418 + GetTable(A0_416, A1_417.DeltaVarTable, true)[A1_417.DeltaVar]
  end
  if A1_417.TargetVar ~= nil then
    A1_417.Stat(L2_418, A0_416[A1_417.TargetVar])
  else
    A1_417.Stat(L2_418)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_419, A1_420)
  local L2_421, L3_422
  L2_421 = A1_420.TargetVar
  L3_422 = 0
  if A1_420.LaneVar ~= nil then
    L3_422 = L3_422 + GetTable(A0_419, A1_420.LaneVarTable, true)[A1_420.LaneVar]
  end
  if A1_420.Lane ~= nil then
    L3_422 = L3_422 + A1_420.Lane
  end
  SetMinionLane(A0_419[L2_421], L3_422)
end
BBSetMinionLane = L0_0
function L0_0(A0_423, A1_424)
  if A1_424.AttackVar ~= nil then
  end
  if A1_424.Attack ~= nil then
  end
  if A1_424.TotalCoefficientVar ~= nil then
  end
  if A1_424.TotalCoefficient ~= nil then
  end
  if A1_424.TargetVar ~= nil then
    GetTable(A0_423, A1_424.DestVarTable, false)[A1_424.DestVar] = (0 + GetTable(A0_423, A1_424.AttackVarTable, true)[A1_424.AttackVar] + A1_424.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_423[A1_424.TargetVar])) + GetFlatCritDamageMod(A0_423[A1_424.TargetVar])) * (0 + GetTable(A0_423, A1_424.TotalCoefficientVarTable, true)[A1_424.TotalCoefficientVar] + A1_424.TotalCoefficient)
  else
    GetTable(A0_423, A1_424.DestVarTable, false)[A1_424.DestVar] = 2 * A1_424.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_425, A1_426)
  local L2_427, L3_428, L4_429, L5_430, L6_431, L7_432
  L2_427 = GetTable
  L3_428 = A0_425
  L4_429 = A1_426.DestVarTable
  L5_430 = false
  L2_427 = L2_427(L3_428, L4_429, L5_430)
  L3_428 = GetTable
  L4_429 = A0_425
  L5_430 = A1_426.AmountVarTable
  L6_431 = true
  L3_428 = L3_428(L4_429, L5_430, L6_431)
  L4_429 = GetTable
  L5_430 = A0_425
  L6_431 = A0_425.NextBuffVars
  L7_432 = false
  L4_429 = L4_429(L5_430, L6_431, L7_432)
  L5_430 = A1_426.AmountVar
  L5_430 = L3_428[L5_430]
  L6_431 = A1_426.Amount
  L5_430 = L5_430 + L6_431
  L4_429.InitializeShield_Amount = L5_430
  L5_430 = A1_426.AmountVar
  if L5_430 ~= nil then
    L5_430 = A1_426.HealShieldMod
    if L5_430 ~= nil and L5_430 == true then
      L6_431 = A1_426.AttackerVar
      L7_432 = 0
      if L6_431 ~= nil then
        L7_432 = GetPercentHealingAmountMod(A0_425[L6_431])
      end
      L4_429.InitializeShield_Amount, L3_428[A1_426.AmountVar] = (A1_426.Amount + L3_428[A1_426.AmountVar]) * (1 + L7_432), (A1_426.Amount + L3_428[A1_426.AmountVar]) * (1 + L7_432)
    end
  end
  L5_430 = SpellBuffAddNoRenew
  L6_431 = A1_426.AttackerVar
  L6_431 = A0_425[L6_431]
  L7_432 = A1_426.UnitVar
  L7_432 = A0_425[L7_432]
  L5_430(L6_431, L7_432, "InitializeShieldMarker", 0, 1, 25000, L4_429)
  L5_430 = BBIncreaseShield
  L6_431 = A0_425
  L7_432 = A1_426
  L5_430(L6_431, L7_432)
end
BBInitializeShield = L0_0
function L0_0(A0_433, A1_434)
  if A1_434.CDVar ~= nil then
  end
  if A1_434.CD ~= nil then
  end
  if A1_434.TargetVar ~= nil then
    GetTable(A0_433, A1_434.DestVarTable, false)[A1_434.DestVar] = (0 + GetTable(A0_433, A1_434.CDVarTable, true)[A1_434.CDVar] + A1_434.CD) * (1 + GetPercentCooldownMod(A0_433[A1_434.TargetVar]))
  else
    GetTable(A0_433, A1_434.DestVarTable, false)[A1_434.DestVar] = A1_434.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_435, A1_436)
  local L2_437, L3_438
  L3_438 = A1_436.TargetVar
  if L3_438 ~= nil then
    L2_437 = A1_436.Stat(A0_435[L3_438])
  else
    L2_437 = A1_436.Stat()
  end
  SetVarInTable(A0_435, A1_436, L2_437)
end
BBGetStat = L0_0
function L0_0(A0_439, A1_440)
  if A1_440.TargetVar ~= nil then
    GetTable(A0_439, A1_440.DestVarTable, false)[A1_440.DestVar] = GetLevel(A0_439[A1_440.TargetVar])
  else
    GetTable(A0_439, A1_440.DestVarTable, false)[A1_440.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_441, A1_442)
  if A1_442.TargetVar ~= nil then
    GetTable(A0_441, A1_442.DestVarTable, false)[A1_442.DestVar] = GetUnitSignificance(A0_441[A1_442.TargetVar])
  else
    GetTable(A0_441, A1_442.DestVarTable, false)[A1_442.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_443, A1_444)
  if A1_444.TargetVar ~= nil then
    GetTable(A0_443, A1_444.DestVarTable, false)[A1_444.DestVar] = GetArmor(A0_443[A1_444.TargetVar])
  else
    GetTable(A0_443, A1_444.DestVarTable, false)[A1_444.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_445, A1_446)
  if A1_446.TargetVar ~= nil then
    GetTable(A0_445, A1_446.DestVarTable, false)[A1_446.DestVar] = GetSpellBlock(A0_445[A1_446.TargetVar])
  else
    GetTable(A0_445, A1_446.DestVarTable, false)[A1_446.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_447, A1_448)
  local L2_449, L3_450
  L3_450 = A1_448.TargetVar
  if L3_450 ~= nil then
    L2_449 = GetTeamID(A0_447[L3_450])
  else
    L2_449 = GetTeamID()
  end
  SetVarInTable(A0_447, A1_448, L2_449)
end
BBGetTeamID = L0_0
function L0_0(A0_451, A1_452)
  local L2_453, L3_454, L4_455
  L2_453 = GetTable
  L3_454 = A0_451
  L4_455 = A1_452.DestVarTable
  L2_453 = L2_453(L3_454, L4_455, false)
  L3_454 = A1_452.TargetVar
  L4_455 = nil
  if L3_454 ~= nil then
    L4_455 = GetTeamID(A0_451[L3_454])
  else
    L4_455 = GetTeamID()
  end
  if L4_455 == TEAM_ORDER then
    L2_453[A1_452.DestVar] = TEAM_CHAOS
  elseif L4_455 == TEAM_CHAOS then
    L2_453[A1_452.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_456, A1_457)
  if A1_457.TargetVar ~= nil then
    GetTable(A0_456, A1_457.DestVarTable, false)[A1_457.DestVar] = GetUnitSkinName(A0_456[A1_457.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_458, A1_459)
  local L2_460, L3_461, L4_462
  L2_460 = GetTable
  L3_461 = A0_458
  L4_462 = A1_459.DestVarTable
  L2_460 = L2_460(L3_461, L4_462, false)
  L3_461 = A0_458.Owner
  L4_462 = nil
  if A1_459.TargetVar ~= nil then
    L4_462 = GetTotalAttackDamage(A0_458[A1_459.TargetVar])
  else
    L4_462 = GetTotalAttackDamage()
  end
  SetVarInTable(A0_458, A1_459, L4_462)
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_463, A1_464)
  GetTable(A0_463, A1_464.DestVarTable, true)[A1_464.DestVar] = A1_464.Status(A0_463[A1_464.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_465, A1_466)
  local L2_467
  L2_467 = A1_466.TargetVar
  L2_467 = A0_465[L2_467]
  ClearAttackTarget(L2_467)
end
BBClearAttackTarget = L0_0
function L0_0(A0_468, A1_469)
  local L2_470, L3_471
  L2_470 = GetTable
  L3_471 = A0_468
  L2_470 = L2_470(L3_471, A1_469.DestVarTable, true)
  L3_471 = A1_469.Info
  L3_471 = L3_471(A0_468[A1_469.TargetVar])
  SetVarInTable(A0_468, A1_469, L3_471)
end
BBGetCastInfo = L0_0
function L0_0(A0_472, A1_473, A2_474)
  local L3_475, L4_476, L5_477, L6_478
  L3_475 = GetTable
  L4_476 = A0_472
  L5_477 = A1_473.TrackTimeVarTable
  L6_478 = false
  L3_475 = L3_475(L4_476, L5_477, L6_478)
  L4_476 = GetTime
  L4_476 = L4_476()
  L5_477 = A1_473.ExecuteImmediately
  L6_478 = GetParam
  L6_478 = L6_478("TimeBetweenExecutions", A0_472, A1_473)
  if A1_473.TickTimeVar ~= nil and GetTable(A0_472, A1_473.TickTimeVarTable, false)[A1_473.TickTimeVar] ~= nil then
    L6_478 = GetTable(A0_472, A1_473.TickTimeVarTable, false)[A1_473.TickTimeVar]
  end
  if L3_475[A1_473.TrackTimeVar] == nil then
    L3_475[A1_473.TrackTimeVar] = L4_476
    if L5_477 == true then
      ExecuteBuildingBlocks(A2_474, A0_472)
    end
  end
  if L4_476 >= L3_475[A1_473.TrackTimeVar] + L6_478 then
    L3_475[A1_473.TrackTimeVar] = L3_475[A1_473.TrackTimeVar] + L6_478
    ExecuteBuildingBlocks(A2_474, A0_472)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_479, A1_480, A2_481)
  GetTable(A0_479, A1_480.TrackTimeVarTable, false)[A1_480.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_482, A1_483)
  local L2_484
  L2_484 = A1_483.SrcValue
  if A1_483.SrcVar ~= nil then
    L2_484 = GetTable(A0_482, A1_483.SrcVarTable, true)[A1_483.SrcVar]
  end
  A1_483.Status(A0_482[A1_483.TargetVar], L2_484)
end
BBSetStatus = L0_0
function L0_0(A0_485, A1_486)
  local L2_487
  L2_487 = A1_486.ToAlert
  if GetTable(A0_485, A1_486.SrcVarTable, false) ~= nil and A1_486.SrcVar ~= nil then
    L2_487 = L2_487 .. GetTable(A0_485, A1_486.SrcVarTable, false)[A1_486.SrcVar]
  end
  _ALERT(L2_487)
end
BBAlert = L0_0
function L0_0(A0_488, A1_489)
  local L2_490, L3_491, L4_492, L5_493, L6_494, L7_495
  L2_490 = GetParam
  L3_491 = "Value"
  L4_492 = A0_488
  L5_493 = A1_489
  L2_490 = L2_490(L3_491, L4_492, L5_493)
  if L2_490 == nil then
    L3_491 = ReportError
    L4_492 = "Could not resolve Value param"
    L3_491(L4_492)
    return
  end
  L3_491 = true
  L4_492 = GetParam
  L5_493 = "OnUnit"
  L6_494 = A0_488
  L7_495 = A1_489
  L4_492 = L4_492(L5_493, L6_494, L7_495)
  if L4_492 == nil then
    L3_491 = false
    L5_493 = GetParam
    L6_494 = "OnUnitByFlag"
    L7_495 = A0_488
    L5_493 = L5_493(L6_494, L7_495, A1_489)
    L4_492 = L5_493
  end
  if L4_492 == nil then
    L5_493 = ReportError
    L6_494 = "Could not resolve OnUnit param"
    L5_493(L6_494)
    return
  end
  L5_493 = true
  L6_494 = GetParam
  L7_495 = "ChampionToSayTo"
  L6_494 = L6_494(L7_495, A0_488, A1_489)
  if L6_494 == nil then
    L5_493 = false
    L7_495 = GetParam
    L7_495 = L7_495("ChampionToSayToByFlag", A0_488, A1_489)
    L6_494 = L7_495
  end
  if L6_494 == nil then
    L7_495 = ReportError
    L7_495("Could not resolve ChampionToSayTo param")
    return
  end
  L7_495 = GetParam
  L7_495 = L7_495("ShowToSpectator", A0_488, A1_489)
  if L7_495 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  DisplayNumericFloatingTextOnUnitToChampion(L2_490, A1_489.TextType, L4_492, L3_491, L6_494, L5_493, L7_495)
end
BBDisplayNumericFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_496, A1_497)
  local L2_498, L3_499, L4_500, L5_501, L6_502, L7_503
  L2_498 = GetParam
  L3_499 = "Message"
  L4_500 = A0_496
  L5_501 = A1_497
  L2_498 = L2_498(L3_499, L4_500, L5_501)
  if L2_498 == nil then
    L3_499 = ReportError
    L4_500 = "Could not resolve Message param"
    L3_499(L4_500)
    return
  end
  L3_499 = true
  L4_500 = GetParam
  L5_501 = "OnUnit"
  L6_502 = A0_496
  L7_503 = A1_497
  L4_500 = L4_500(L5_501, L6_502, L7_503)
  if L4_500 == nil then
    L3_499 = false
    L5_501 = GetParam
    L6_502 = "OnUnitByFlag"
    L7_503 = A0_496
    L5_501 = L5_501(L6_502, L7_503, A1_497)
    L4_500 = L5_501
  end
  if L4_500 == nil then
    L5_501 = ReportError
    L6_502 = "Could not resolve OnUnit param"
    L5_501(L6_502)
    return
  end
  L5_501 = true
  L6_502 = GetParam
  L7_503 = "ChampionToSayTo"
  L6_502 = L6_502(L7_503, A0_496, A1_497)
  if L6_502 == nil then
    L5_501 = false
    L7_503 = GetParam
    L7_503 = L7_503("ChampionToSayToByFlag", A0_496, A1_497)
    L6_502 = L7_503
  end
  if L6_502 == nil then
    L7_503 = ReportError
    L7_503("Could not resolve ChampionToSayTo param")
    return
  end
  L7_503 = GetParam
  L7_503 = L7_503("ShowToSpectator", A0_496, A1_497)
  if L7_503 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  SayWithFloatingTextOnUnitToChampion(tostring(L2_498), A1_497.TextType, L4_500, L3_499, L6_502, L5_501, L7_503)
end
BBSayWithFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_504, A1_505)
  local L2_506, L3_507, L4_508
  L2_506 = A1_505.ToSay
  L3_507 = GetTable
  L4_508 = A0_504
  L3_507 = L3_507(L4_508, A1_505.SrcVarTable, false)
  if L3_507 ~= nil then
    L4_508 = A1_505.SrcVar
    if L4_508 ~= nil then
      L4_508 = L2_506
      L2_506 = L4_508 .. tostring(L3_507[A1_505.SrcVar])
    end
  end
  L4_508 = nil
  if A1_505.OwnerVar ~= nil then
    L4_508 = A0_504[A1_505.OwnerVar]
  else
    L4_508 = A0_504.Owner
  end
  if A1_505.TextType == nil then
    A1_505.TextType = 0
  end
  Say(L4_508, L2_506, A1_505.TextType)
end
BBSay = L0_0
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
BBDebugSay = L0_0
function L0_0(A0_514, A1_515)
  GetTable(A0_514, A1_515.DestVarTable, true)[A1_515.DestVar] = BBLuaGetGold(A0_514, A1_515)
end
BBGetGold = L0_0
function L0_0(A0_516, A1_517)
  GetTable(A0_516, A1_517.DestVarTable, true)[A1_517.DestVar] = BBLuaGetTotalGold(A0_516, A1_517)
end
BBGetTotalGold = L0_0
function L0_0(A0_518, A1_519)
  SpellBuffAdd(A0_518[A1_519.OwnerVar], A0_518[A1_519.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_518.NextBuffVars)
  BBTeleportToPositionHelper(A0_518, A1_519)
end
BBTeleportToPosition = L0_0
function L0_0(A0_520, A1_521)
  if A1_521.XVar ~= nil and GetTable(A0_520, A1_521.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_520, A1_521.XVarTable, true)[A1_521.XVar]
  else
    Xloc = A1_521.X
  end
  if A1_521.YVar ~= nil and GetTable(A0_520, A1_521.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_520, A1_521.YVarTable, true)[A1_521.YVar]
  else
    Yloc = A1_521.Y
  end
  if A1_521.ZVar ~= nil and GetTable(A0_520, A1_521.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_520, A1_521.ZVarTable, true)[A1_521.ZVar]
  else
    Zloc = A1_521.Z
  end
  A1_521.OwnerVar, A0_520.position = A1_521.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_521.CastPositionName = "position"
  BBTeleportToPosition(A0_520, A1_521)
end
BBTeleportToPoint = L0_0
function L0_0(A0_522, A1_523)
  A1_523.TimeoutInFOW = 999999
  A1_523.BindFlexToOwnerPAR = false
  A1_523.Flags = 0
  A1_523.FollowsGroundTilt = false
  A1_523.FacesTarget = false
  A1_523.HideFromSpectator = false
  A1_523.SendIfOnScreenOrDiscard = false
  A1_523.PersistsThroughReconnect = true
  A1_523.FOWVisibilityRadius = 10
  A1_523.Scale = 1
  A1_523.BindObjectVar = A1_523.BindObject1Var
  A1_523.EffectID2Var = A1_523.OtherTeamEffectIDVar
  A1_523.TargetObjectVar = A1_523.BindObject2Var
  A1_523.FOWTeamOverrideVar = A1_523.FOWTeamVar
  A1_523.BoneName = A1_523.BindObject1BoneName
  A1_523.TargetBoneName = A1_523.BindObject2BoneName
  A1_523.EffectName = A1_523.EffectParticleFile
  A1_523.EffectNameForOtherTeam = A1_523.OtherTeamParticleFile
  BBSpellEffectCreate(A0_522, A1_523)
end
BBSpellEffectCreate_EasyBeam = L0_0
function L0_0(A0_524, A1_525)
  A1_525.TimeoutInFOW = 999999
  A1_525.BindFlexToOwnerPAR = false
  A1_525.Flags = 0
  A1_525.FollowsGroundTilt = false
  A1_525.FacesTarget = false
  A1_525.HideFromSpectator = false
  A1_525.SendIfOnScreenOrDiscard = true
  A1_525.PersistsThroughReconnect = false
  A1_525.FOWVisibilityRadius = 10
  A1_525.Scale = 1
  A1_525.FOWTeamOverrideVar = A1_525.FOWTeamVar
  A1_525.EffectName = A1_525.ParticleFile
  A1_525.EffectNameForOtherTeam = A1_525.ParticleFileForOtherTeam
  A1_525.BoneName = A1_525.BindObjectBoneName
  BBSpellEffectCreate(A0_524, A1_525)
end
BBSpellEffectCreate_EasyHit = L0_0
function L0_0(A0_526, A1_527)
  ReincarnateNonDeadHero(GetTable(A0_526, A1_527.TargetTable, false)[A1_527.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_528, A1_529)
  GetTable(A0_528, A1_529.DestVarTable, true)[A1_529.DestVar] = A1_529.Function(A0_528[A1_529.OwnerVar], A1_529.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_530, A1_531)
  local L2_532, L3_533, L4_534, L5_535
  L2_532 = A1_531.WhomToOrderVar
  L2_532 = A0_530[L2_532]
  L3_533 = A1_531.TargetOfOrderVar
  L3_533 = A0_530[L3_533]
  L4_534 = GetTable
  L5_535 = A0_530
  L4_534 = L4_534(L5_535, A1_531.SrcVarTable, false)
  L5_535 = nil
  if A1_531.SrcVar ~= nil and L4_534 ~= nil then
    L5_535 = L4_534[A1_531.SrcVar]
  else
    L5_535 = GetPosition(L3_533)
  end
  if L3_533 == nil then
    L3_533 = L2_532
  end
  IssueOrder(L2_532, A1_531.Order, L5_535, L3_533)
end
BBIssueOrder = L0_0
function L0_0(A0_536, A1_537)
  local L2_538
  L2_538 = GetParam
  L2_538 = L2_538("NewRange", A0_536, A1_537)
  SetSpellCastRange(L2_538)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_539, A1_540)
  GetTable(A0_539, A1_540.DestVarTable, true)[A1_540.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_541, A1_542)
  local L2_543, L3_544
  L2_543 = A1_542.ObjectVar1
  L2_543 = A0_541[L2_543]
  L3_544 = A1_542.ObjectVar2
  L3_544 = A0_541[L3_544]
  GetTable(A0_541, A1_542.DestVarTable, true)[A1_542.DestVar] = DistanceBetweenObjectBounds(L2_543, L3_544)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_545, A1_546)
  local L2_547, L3_548, L4_549
  L2_547 = A1_546.ObjectVar
  L2_547 = A0_545[L2_547]
  L3_548 = GetTable
  L4_549 = A0_545
  L3_548 = L3_548(L4_549, A1_546.PointVarTable, true)
  L4_549 = A1_546.PointVar
  L4_549 = L3_548[L4_549]
  GetTable(A0_545, A1_546.DestVarTable, true)[A1_546.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_547, L4_549)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_550, A1_551)
  local L2_552, L3_553
  L2_552 = GetParam
  L3_553 = "Point1"
  L2_552 = L2_552(L3_553, A0_550, A1_551)
  L3_553 = GetParam
  L3_553 = L3_553("Point2", A0_550, A1_551)
  GetTable(A0_550, A1_551.DestVarTable, true)[A1_551.DestVar] = DistanceBetweenPoints(L2_552, L3_553)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_554, A1_555, A2_556)
  local L3_557, L4_558, L5_559, L6_560, L7_561, L8_562
  L5_559 = 0
  L6_560 = nil
  L7_561 = A1_555.ObjectDistanceType
  L8_562 = A1_555.ObjectVar1
  L3_557 = A0_554[L8_562]
  L8_562 = A1_555.ObjectVar2
  L4_558 = A0_554[L8_562]
  if nil == L4_558 then
    L8_562 = A1_555.Point2Var
    if nil ~= L8_562 then
      L8_562 = GetTable
      L8_562 = L8_562(A0_554, A1_555.Point2VarTable, true)
      L4_558 = L8_562[A1_555.Point2Var]
      L5_559 = L5_559 + 1
    end
  end
  if nil == L3_557 then
    L8_562 = A1_555.Point1Var
    if nil ~= L8_562 then
      L8_562 = GetTable
      L8_562 = L8_562(A0_554, A1_555.Point1VarTable, true)
      L3_557 = L8_562[A1_555.Point1Var]
      L5_559 = L5_559 + 1
      if 1 == L5_559 then
        L3_557, L4_558 = L4_558, L3_557
      end
    end
  end
  if nil ~= L7_561 then
    if 0 == L5_559 then
      L8_562 = OBJECT_CENTER
      if L8_562 == L7_561 then
        L6_560 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_562 = OBJECT_BOUNDARY
        if L8_562 == L7_561 then
          L6_560 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_562 = A1_555.OwnerVar
          L8_562 = A0_554[L8_562]
          Say(L8_562, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_559 then
      L8_562 = OBJECT_CENTER
      if L8_562 == L7_561 then
        L6_560 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_562 = OBJECT_BOUNDARY
        if L8_562 == L7_561 then
          L6_560 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_562 = A1_555.OwnerVar
          L8_562 = A0_554[L8_562]
          Say(L8_562, "invalid object distance type", 0)
        end
      end
    else
      L6_560 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_562 = A1_555.Distance
  if A1_555.DistanceVar ~= nil and GetTable(A0_554, A1_555.DistanceVarTable, true) ~= nil then
    L8_562 = L8_562 + GetTable(A0_554, A1_555.DistanceVarTable, true)[A1_555.DistanceVar]
  end
  if L3_557 ~= nil and L4_558 ~= nil and L6_560 ~= nil and L8_562 ~= nil then
    if not L6_560(L3_557, L4_558, L8_562) then
      ExecuteBuildingBlocks(A2_556, A0_554)
      A0_554.LastIfSucceeded = true
    else
      A0_554.LastIfSucceeded = false
    end
  else
    A0_554.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_563, A1_564)
  local L2_565, L3_566
  L2_565 = A1_564.TargetVar
  L2_565 = A0_563[L2_565]
  L3_566 = A1_564.CasterVar
  L3_566 = A0_563[L3_566]
  GetTable(A0_563, A1_564.DestVarTable, true)[A1_564.DestVar] = SpellBuffCount(L2_565, A1_564.BuffName, L3_566)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_567, A1_568)
  local L2_569
  L2_569 = A1_568.TargetVar
  L2_569 = A0_567[L2_569]
  GetTable(A0_567, A1_568.DestVarTable, true)[A1_568.DestVar] = SpellBuffCount(L2_569, A1_568.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_570, A1_571)
  local L2_572, L3_573
  L2_572 = GetTable
  L3_573 = A0_570
  L2_572 = L2_572(L3_573, A1_571.ScaleVarTable, false)
  L3_573 = nil
  if A1_571.OwnerVar ~= nil then
    L3_573 = A0_570[A1_571.OwnerVar]
  else
    L3_573 = A0_570.Owner
  end
  if A1_571.ScaleVar ~= nil and A1_571.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_572[A1_571.ScaleVar], L3_573)
  else
    SetScaleSkinCoef(A1_571.Scale, L3_573)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_574, A1_575)
  SpellBuffAdd(A0_574[A1_575.TargetVar], A0_574[A1_575.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_574.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_576, A1_577, A2_578)
  local L3_579, L4_580
  L3_579 = A1_577.TargetVar
  L3_579 = A0_576[L3_579]
  L4_580 = A1_577.NumStacks
  if GetParam("NumStacks", A0_576, A1_577) == 0 then
    L4_580 = SpellBuffCount(L3_579, A1_577.BuffName, caster)
  else
    L4_580 = GetParam("NumStacks", A0_576, A1_577)
  end
  while L4_580 > 0 do
    SpellBuffRemove(L3_579, A1_577.BuffName, A0_576[A1_577.AttackerVar])
    L4_580 = L4_580 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_581, A1_582)
  local L2_583, L3_584
  L2_583 = GetParam
  L3_584 = "Unit"
  L2_583 = L2_583(L3_584, A0_581, A1_582)
  unit = L2_583
  L2_583 = unit
  if L2_583 == nil then
    L2_583 = ReportError
    L3_584 = "Could not resolve Unit param"
    L2_583(L3_584)
    return
  end
  L2_583 = true
  L3_584 = GetParam
  L3_584 = L3_584("ChampionToShowTo", A0_581, A1_582)
  if L3_584 == nil then
    L2_583 = false
    L3_584 = GetParam("ChampionToShowToByFlag", A0_581, A1_582)
  end
  if L3_584 == nil then
    ReportError("Could not resolve ChampionToShowTo param")
    return
  end
  SetShowHealthBarToChampion(unit, A1_582.Show, L3_584, L2_583, A1_582.ApplyToSpectator)
end
BBSetShowHealthBarToChampion = L0_0
function L0_0(A0_585, A1_586)
  if GetParam("Vector", A0_585, A1_586) ~= nil then
    GetTable(A0_585, A1_586.DestVarTable, false)[A1_586.DestVar] = math.sqrt(GetParam("Vector", A0_585, A1_586).x * GetParam("Vector", A0_585, A1_586).x + GetParam("Vector", A0_585, A1_586).y * GetParam("Vector", A0_585, A1_586).y + GetParam("Vector", A0_585, A1_586).z * GetParam("Vector", A0_585, A1_586).z)
  end
end
BBGetVectorLength = L0_0
function L0_0(A0_587, A1_588, A2_589)
  if A0_587.EmoteId == A1_588.EmoteId then
    ExecuteBuildingBlocks(A2_589, A0_587)
    A0_587.LastIfSucceeded = true
  else
    A0_587.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_590, A1_591, A2_592)
  if A0_590.EmoteId ~= A1_591.EmoteId then
    ExecuteBuildingBlocks(A2_592, A0_590)
    A0_590.LastIfSucceeded = true
  else
    A0_590.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_593, A1_594)
  local L2_595, L3_596, L4_597, L5_598
  L2_595 = GetTable
  L3_596 = A0_593
  L4_597 = A1_594.String1VarTable
  L5_598 = false
  L2_595 = L2_595(L3_596, L4_597, L5_598)
  L3_596 = A1_594.String1Var
  L3_596 = L2_595[L3_596]
  L4_597 = GetTable
  L5_598 = A0_593
  L4_597 = L4_597(L5_598, A1_594.String2VarTable, false)
  L5_598 = A1_594.String2Var
  L5_598 = L4_597[L5_598]
  GetTable(A0_593, A1_594.ResultVarTable, false)[A1_594.ResultVar] = L3_596 .. L5_598
end
BBConcatenateStrings = L0_0
function L0_0(A0_599, A1_600)
  local L2_601, L3_602
  L2_601 = GetTable
  L3_602 = A0_599
  L2_601 = L2_601(L3_602, A1_600.VariableVarTable, false)
  L3_602 = A1_600.VariableVar
  L3_602 = L2_601[L3_602]
  GetTable(A0_599, A1_600.ResultVarTable, false)[A1_600.ResultVar] = "(" .. L3_602 .. ")"
end
BBEncaseInParantheses = L0_0
function L0_0(A0_603, A1_604)
  BBGetMinionKills(A0_603, A1_604)
  A0_603.MinionKillSource = GetParam("MinionKillTarget")
  A0_603.MinionKills = A0_603.MinionsKilled + GetParam("MinionKills", A0_603, A1_604)
  BBSetMinionKills(A0_603, A1_604)
end
BBIncreaseMinionKills = L0_0
