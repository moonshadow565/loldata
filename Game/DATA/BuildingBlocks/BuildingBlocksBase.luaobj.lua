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
        do break end
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
  ClientPrint(tostring(L3_28) .. ": " .. type(L2_27[A1_26.SrcVar]))
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
      L6_35 = L6_35 .. A1_30.SrcVarTable .. "." .. (A1_30.SrcVar or "")
    else
      L6_35 = L6_35 .. (A1_30.SrcVar or "")
    end
  else
    L6_35 = L6_35 .. L2_31
  end
  if type(L5_34) ~= "table" and type(L5_34) ~= "nil" then
    L6_35 = L6_35 .. " " .. tostring(L5_34)
  end
  L6_35 = L6_35 .. "</font>"
  ClientPrint(L6_35)
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
  ClientPrint(L3_39)
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
    ClientPrint(L13_53)
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
function L0_0(A0_117, A1_118)
  local L2_119, L3_120, L4_121, L5_122
  L2_119 = GetTable
  L3_120 = A0_117
  L4_121 = A1_118.DestVarTable
  L5_122 = true
  L2_119 = L2_119(L3_120, L4_121, L5_122)
  L3_120 = nil
  L4_121 = GetTable
  L5_122 = A0_117
  L4_121 = L4_121(L5_122, A1_118.SpellSlotVarTable, false)
  L5_122 = A1_118.SpellSlotVar
  if L5_122 ~= nil and L4_121 ~= nil then
    L5_122 = A1_118.SpellSlotVar
    L3_120 = L4_121[L5_122]
  else
    L3_120 = A1_118.SpellSlotValue
  end
  L5_122 = A1_118.Function
  L5_122 = L5_122(A0_117[A1_118.OwnerVar], L3_120, A1_118.SpellbookType, A1_118.SlotType)
  SetVarInTable(A0_117, A1_118, L5_122)
end
BBGetSlotSpellInfo = L0_0
function L0_0(A0_123, A1_124)
  local L2_125, L3_126, L4_127
  L2_125 = GetTable
  L3_126 = A0_123
  L4_127 = A1_124.SrcVarTable
  L2_125 = L2_125(L3_126, L4_127, false)
  L3_126 = nil
  L4_127 = A1_124.SrcVar
  if L4_127 ~= nil and L2_125 ~= nil then
    L4_127 = A1_124.SrcVar
    L3_126 = L2_125[L4_127]
  else
    L3_126 = A1_124.SrcValue
  end
  L4_127 = nil
  if A1_124.SpellSlotVar ~= nil and GetTable(A0_123, A1_124.SpellSlotVarTable, false) ~= nil then
    L4_127 = GetTable(A0_123, A1_124.SpellSlotVarTable, false)[A1_124.SpellSlotVar]
  else
    L4_127 = A1_124.SpellSlotValue
  end
  SetSlotSpellCooldownTime(A0_123[A1_124.OwnerVar], L4_127, A1_124.SpellbookType, A1_124.SlotType, L3_126)
end
BBSetSlotSpellCooldownTime = L0_0
function L0_0(A0_128, A1_129)
  if A0_128.Level ~= nil and A1_129.SrcValueByLevel ~= nil then
    A0_128.ReturnValue = A1_129.SrcValueByLevel[A0_128.Level]
  elseif A1_129.SrcVar ~= nil and GetTable(A0_128, A1_129.SrcVarTable, false) ~= nil then
    A0_128.ReturnValue = GetTable(A0_128, A1_129.SrcVarTable, false)[A1_129.SrcVar]
  else
    A0_128.ReturnValue = A1_129.SrcValue
  end
end
BBSetReturnValue = L0_0
function L0_0(A0_130, A1_131)
  if type(A0_130) == "string" and type(A1_131) == "string" then
    A0_130 = string.lower(A0_130)
    A1_131 = string.lower(A1_131)
  end
  return A0_130 == A1_131
end
CO_EQUAL = L0_0
function L0_0(A0_132, A1_133)
  if type(A0_132) == "string" and type(A1_133) == "string" then
    A0_132 = string.lower(A0_132)
    A1_133 = string.lower(A1_133)
  end
  return A0_132 ~= A1_133
end
CO_NOT_EQUAL = L0_0
function L0_0(A0_134, A1_135)
  local L2_136
  L2_136 = A0_134 < A1_135
  return L2_136
end
CO_LESS_THAN = L0_0
function L0_0(A0_137, A1_138)
  local L2_139
  L2_139 = A1_138 < A0_137
  return L2_139
end
CO_GREATER_THAN = L0_0
function L0_0(A0_140, A1_141)
  local L2_142
  L2_142 = A0_140 <= A1_141
  return L2_142
end
CO_LESS_THAN_OR_EQUAL = L0_0
function L0_0(A0_143, A1_144)
  local L2_145
  L2_145 = A1_144 <= A0_143
  return L2_145
end
CO_GREATER_THAN_OR_EQUAL = L0_0
function L0_0(A0_146, A1_147)
  return GetTeamID(A0_146) == GetTeamID(A1_147)
end
CO_SAME_TEAM = L0_0
function L0_0(A0_148, A1_149)
  return GetTeamID(A0_148) ~= GetTeamID(A1_149)
end
CO_DIFFERENT_TEAM = L0_0
function L0_0(A0_150, A1_151)
  return GetSourceType() == A1_151 or GetSourceType() == A0_150
end
CO_DAMAGE_SOURCETYPE_IS = L0_0
function L0_0(A0_152, A1_153)
  return GetSourceType() ~= A1_153 and GetSourceType() ~= A0_152
end
CO_DAMAGE_SOURCETYPE_IS_NOT = L0_0
function L0_0(A0_154)
  return IsObjectAI(A0_154)
end
CO_IS_TYPE_AI = L0_0
function L0_0(A0_155)
  return IsObjectAI(A0_155) ~= true
end
CO_IS_NOT_AI = L0_0
function L0_0(A0_156)
  return IsObjectHero(A0_156)
end
CO_IS_TYPE_HERO = L0_0
function L0_0(A0_157)
  return IsObjectHero(A0_157) ~= true
end
CO_IS_NOT_HERO = L0_0
function L0_0(A0_158)
  return IsClone(A0_158)
end
CO_IS_CLONE = L0_0
function L0_0(A0_159)
  return IsClone(A0_159) ~= true
end
CO_IS_NOT_CLONE = L0_0
function L0_0(A0_160)
  return IsMelee(A0_160)
end
CO_IS_MELEE = L0_0
function L0_0(A0_161)
  return IsMelee(A0_161) ~= true
end
CO_IS_RANGED = L0_0
function L0_0(A0_162)
  return A0_162 > math.random()
end
CO_RANDOM_CHANCE_LESS_THAN = L0_0
function L0_0(A0_163)
  return IsTurretAI(A0_163)
end
CO_IS_TYPE_TURRET = L0_0
function L0_0(A0_164)
  return IsTurretAI(A0_164) ~= true
end
CO_IS_NOT_TURRET = L0_0
function L0_0(A0_165)
  return IsDampener(A0_165)
end
CO_IS_TYPE_INHIBITOR = L0_0
function L0_0(A0_166)
  return IsDampener(A0_166) ~= true
end
CO_IS_NOT_INHIBITOR = L0_0
function L0_0(A0_167)
  return IsHQ(A0_167)
end
CO_IS_TYPE_NEXUS = L0_0
function L0_0(A0_168)
  return IsHQ(A0_168) ~= true
end
CO_IS_NOT_NEXUS = L0_0
function L0_0(A0_169)
  return IsDead(A0_169)
end
CO_IS_DEAD = L0_0
function L0_0(A0_170)
  return IsDead(A0_170) ~= true
end
CO_IS_NOT_DEAD = L0_0
function L0_0(A0_171)
  return IsDeadOrZombie(A0_171)
end
CO_IS_DEAD_OR_ZOMBIE = L0_0
function L0_0(A0_172, A1_173)
  return BBIsTargetInFrontOfMe(A0_172, A1_173)
end
CO_IS_TARGET_IN_FRONT_OF_ME = L0_0
function L0_0(A0_174, A1_175)
  return BBIsTargetBehindMe(A0_174, A1_175)
end
CO_IS_TARGET_BEHIND_ME = L0_0
function L0_0(A0_176)
  return IsWard(A0_176)
end
CO_IS_WARD = L0_0
function L0_0(A0_177)
  return IsStructure(A0_177)
end
CO_IS_STRUCTURE = L0_0
function L0_0(A0_178)
  return IsStructure(A0_178) ~= true
end
CO_IS_NOT_STRUCTURE = L0_0
function L0_0(A0_179)
  local L1_180
  L1_180 = A0_179 ~= nil
  return L1_180
end
CO_IS_NOT_NIL = L0_0
function L0_0(A0_181, A1_182, A2_183)
  GetTable(A0_181, A1_182.MacroVarTable, true)[A1_182.MacroVar] = A2_183
end
BBCreateMacro = L0_0
function L0_0(A0_184, A1_185)
  local L2_186
  L2_186 = GetParam
  L2_186 = L2_186("Macro", A0_184, A1_185)
  if L2_186 ~= nil and type(L2_186) == "table" then
    ExecuteBuildingBlocks(L2_186, A0_184)
  else
    DebugClientPrint("Designer Error: Macro variable is not initialized inside of event. Macro Variable was: " .. tostring(A1_185.MacroVar) .. " and current block data is: " .. gCurrentBuildingBlockString .. ". This error probably occurred due to variable not being initialized yet, being misnamed or two events being called out of sequence. It is highly recommended that script macros either be initialized OnBuffActivate, OnCharActivate or in the same event. Pro Devs may violate this rule at the risk of being forced to read this error message again.")
  end
end
BBRunMacro = L0_0
function L0_0(A0_187, A1_188, A2_189)
  local L3_190, L4_191, L5_192, L6_193
  L3_190 = GetTable
  L4_191 = A0_187
  L5_192 = A1_188.Src1VarTable
  L6_193 = false
  L3_190 = L3_190(L4_191, L5_192, L6_193)
  L4_191 = GetTable
  L5_192 = A0_187
  L6_193 = A1_188.Src2VarTable
  L4_191 = L4_191(L5_192, L6_193, false)
  L5_192 = false
  L6_193 = nil
  if L3_190 ~= nil and A1_188.Src1Var ~= nil then
    L6_193 = L3_190[A1_188.Src1Var]
  else
    L6_193 = A1_188.Value1
  end
  if L4_191 ~= nil and A1_188.Src2Var ~= nil then
    L5_192 = A1_188.CompareOp(L6_193, L4_191[A1_188.Src2Var])
  else
    L5_192 = A1_188.CompareOp(L6_193, A1_188.Value2)
  end
  if L5_192 then
    ExecuteBuildingBlocks(A2_189, A0_187)
    A0_187.LastIfSucceeded = true
  else
    A0_187.LastIfSucceeded = false
  end
end
BBIf = L0_0
function L0_0(A0_194, A1_195, A2_196)
  if A0_194.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_196, A0_194)
    A0_194.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_197, A1_198, A2_199)
  if A0_197.LastIfSucceeded == true then
    ExecuteBuildingBlocks(A2_199, A0_197)
    A0_197.LastIfSucceeded = true
  else
    BBIf(A0_197, A1_198, A2_199)
  end
end
BBOrIf = L0_0
function L0_0(A0_200, A1_201, A2_202)
  local L3_203, L4_204, L5_205, L6_206
  L3_203 = A0_200.LastIfSucceeded
  if L3_203 == false then
    L3_203 = GetTable
    L4_204 = A0_200
    L5_205 = A1_201.Src1VarTable
    L6_206 = false
    L3_203 = L3_203(L4_204, L5_205, L6_206)
    L4_204 = GetTable
    L5_205 = A0_200
    L6_206 = A1_201.Src2VarTable
    L4_204 = L4_204(L5_205, L6_206, false)
    L5_205 = false
    L6_206 = nil
    if L3_203 ~= nil and A1_201.Src1Var ~= nil then
      L6_206 = L3_203[A1_201.Src1Var]
    else
      L6_206 = A1_201.Value1
    end
    if L4_204 ~= nil and A1_201.Src2Var ~= nil then
      L5_205 = A1_201.CompareOp(L6_206, L4_204[A1_201.Src2Var])
    else
      L5_205 = A1_201.CompareOp(L6_206, A1_201.Value2)
    end
    if L5_205 then
      ExecuteBuildingBlocks(A2_202, A0_200)
      A0_200.LastIfSucceeded = true
    else
      A0_200.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_207, A1_208, A2_209)
  local L3_210
  if A1_208.TargetVar ~= nil then
    L3_210 = A0_207[A1_208.TargetVar]
  else
    L3_210 = A0_207.Target
  end
  if HasBuffOfType(L3_210, A1_208.BuffType) then
    ExecuteBuildingBlocks(A2_209, A0_207)
    A0_207.LastIfSucceeded = true
  else
    A0_207.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_211, A1_212, A2_213)
  local L3_214, L4_215
  if A1_212.OwnerVar ~= nil then
    L3_214 = A0_211[A1_212.OwnerVar]
  else
    L3_214 = A0_211.Owner
  end
  if A1_212.AttackerVar ~= nil then
    L4_215 = A0_211[A1_212.AttackerVar]
  else
    L4_215 = A0_211.Attacker
  end
  if SpellBuffCount(L3_214, A1_212.BuffName, L4_215) > 0 then
    ExecuteBuildingBlocks(A2_213, A0_211)
    A0_211.LastIfSucceeded = true
  else
    A0_211.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_216, A1_217, A2_218)
  if BBIsMissileAutoAttack(A0_216, A1_217) then
    ExecuteBuildingBlocks(A2_218, A0_216)
    A0_216.LastIfSucceeded = true
  else
    A0_216.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_219, A1_220, A2_221)
  if BBIsMissileConsideredAsAutoAttack(A0_219, A1_220) then
    ExecuteBuildingBlocks(A2_221, A0_219)
    A0_219.LastIfSucceeded = true
  else
    A0_219.LastIfSucceeded = false
  end
end
BBIfMissileConsideredAsAutoAttack = L0_0
function L0_0(A0_222, A1_223)
  A0_222.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_224, A1_225, A2_226)
  local L3_227, L4_228
  if A1_225.OwnerVar ~= nil then
    L3_227 = A0_224[A1_225.OwnerVar]
  else
    L3_227 = A0_224.Owner
  end
  if A1_225.CasterVar ~= nil then
    L4_228 = A0_224[A1_225.CasterVar]
  else
    L4_228 = A0_224.Caster
  end
  if SpellBuffCount(L3_227, A1_225.BuffName, L4_228) <= 0 then
    ExecuteBuildingBlocks(A2_226, A0_224)
    A0_224.LastIfSucceeded = true
  else
    A0_224.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_229, A1_230, A2_231)
  local L3_232, L4_233
  if A1_230.OwnerVar ~= nil then
    L3_232 = A0_229[A1_230.OwnerVar]
  else
    L3_232 = A0_229.Owner
  end
  if HasPARType(L3_232, A1_230.PARType) then
    ExecuteBuildingBlocks(A2_231, A0_229)
    A0_229.LastIfSucceeded = true
  else
    A0_229.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_234, A1_235, A2_236)
  local L3_237, L4_238
  if A1_235.OwnerVar ~= nil then
    L3_237 = A0_234[A1_235.OwnerVar]
  else
    L3_237 = A0_234.Owner
  end
  if not HasPARType(L3_237, A1_235.PARType) then
    ExecuteBuildingBlocks(A2_236, A0_234)
    A0_234.LastIfSucceeded = true
  else
    A0_234.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_239, A1_240, A2_241)
  local L3_242, L4_243, L5_244, L6_245, L7_246
  L3_242 = GetTable
  L4_243 = A0_239
  L5_244 = A1_240.Src1VarTable
  L6_245 = false
  L3_242 = L3_242(L4_243, L5_244, L6_245)
  L4_243 = GetTable
  L5_244 = A0_239
  L6_245 = A1_240.Src2VarTable
  L7_246 = false
  L4_243 = L4_243(L5_244, L6_245, L7_246)
  L5_244 = true
  while L5_244 do
    L6_245 = false
    L7_246 = nil
    if L3_242 ~= nil and A1_240.Src1Var ~= nil then
      L7_246 = L3_242[A1_240.Src1Var]
    else
      L7_246 = A1_240.Value1
    end
    if L4_243 ~= nil and A1_240.Src2Var ~= nil then
      L6_245 = A1_240.CompareOp(L7_246, L4_243[A1_240.Src2Var])
    else
      L6_245 = A1_240.CompareOp(L7_246, A1_240.Value2)
    end
    if L6_245 then
      ExecuteBuildingBlocks(A2_241, A0_239)
    else
      L5_244 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_247, A1_248)
  return A0_247 * A1_248
end
MO_MULTIPLY = L0_0
function L0_0(A0_249, A1_250)
  return A0_249 + A1_250
end
MO_ADD = L0_0
function L0_0(A0_251, A1_252)
  return A0_251 - A1_252
end
MO_SUBTRACT = L0_0
function L0_0(A0_253, A1_254)
  return A0_253 / A1_254
end
MO_DIVIDE = L0_0
function L0_0(A0_255, A1_256)
  if A0_255 < A1_256 then
    return A0_255
  else
    return A1_256
  end
end
MO_MIN = L0_0
function L0_0(A0_257, A1_258)
  if A1_258 < A0_257 then
    return A0_257
  else
    return A1_258
  end
end
MO_MAX = L0_0
function L0_0(A0_259, A1_260)
  return A0_259 % A1_260
end
MO_MODULO = L0_0
function L0_0(A0_261)
  return math.floor(A0_261 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_262)
  return math.ceil(A0_262)
end
MO_ROUNDUP = L0_0
function L0_0(A0_263)
  return math.floor(A0_263)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_264)
  return math.sin(math.rad(A0_264))
end
MO_SIN = L0_0
function L0_0(A0_265)
  return math.cos(math.rad(A0_265))
end
MO_COSINE = L0_0
function L0_0(A0_266)
  return math.tan(math.rad(A0_266))
end
MO_TANGENT = L0_0
function L0_0(A0_267)
  return math.deg(math.asin(A0_267))
end
MO_ASIN = L0_0
function L0_0(A0_268)
  return math.deg(math.acos(A0_268))
end
MO_ACOS = L0_0
function L0_0(A0_269)
  return math.deg(math.atan(A0_269))
end
MO_ATAN = L0_0
function L0_0(A0_270, A1_271)
  return math.pow(A0_270, A1_271)
end
MO_POW = L0_0
function L0_0(A0_272)
  return math.sqrt(A0_272)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_273, A1_274)
  local L2_275
  L2_275 = A0_273 and A1_274
  return L2_275
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_276, A1_277)
  local L2_278
  L2_278 = A0_276 or A1_277
  return L2_278
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_279)
  local L1_280
  L1_280 = not A0_279
  return L1_280
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_281)
  return math.abs(A0_281)
end
MO_ABS = L0_0
function L0_0(A0_282, A1_283)
  return math.random(A0_282, A1_283)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_284, A1_285)
  local L2_286, L3_287, L4_288, L5_289
  L2_286 = GetMathNumber
  L3_287 = A0_284
  L4_288 = A1_285.Src1VarTable
  L5_289 = A1_285.Src1Var
  L2_286 = L2_286(L3_287, L4_288, L5_289, A1_285.Src1Value)
  L3_287 = GetMathNumber
  L4_288 = A0_284
  L5_289 = A1_285.Src2VarTable
  L3_287 = L3_287(L4_288, L5_289, A1_285.Src2Var, A1_285.Src2Value)
  L4_288 = GetTable
  L5_289 = A0_284
  L4_288 = L4_288(L5_289, A1_285.DestVarTable)
  L5_289 = A1_285.MathOp
  L5_289 = L5_289(L2_286, L3_287)
  SetVarInTable(A0_284, A1_285, L5_289)
end
BBMath = L0_0
function L0_0(A0_290, A1_291, A2_292, A3_293)
  if A2_292 ~= nil and GetTable(A0_290, A1_291)[A2_292] ~= nil then
    return GetTable(A0_290, A1_291)[A2_292]
  end
  return A3_293
end
GetMathNumber = L0_0
function L0_0(A0_294, A1_295)
  if type(A1_295) == "number" then
    return A1_295
  elseif type(A1_295) == "function" then
    return A1_295(A0_294)
  elseif type(A1_295) == "string" then
    return A0_294[A1_295]
  end
end
GetNumber = L0_0
function L0_0(A0_296, A1_297)
  return VectorAdd(A0_296, A1_297)
end
VEC_ADD = L0_0
function L0_0(A0_298, A1_299)
  return VectorSubtract(A0_298, A1_299)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_300, A1_301)
  return VectorScalarMultiply(A0_300, A1_301)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_302, A1_303)
  return VectorScalarDivide(A0_302, A1_303)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_304, A1_305)
  return VectorRotateY(A0_304, A1_305)
end
VEC_ROTATE = L0_0
function L0_0(A0_306, A1_307)
  BBMath(A0_306, A1_307)
end
BBVectorMath = L0_0
function L0_0(A0_308, A1_309)
  local L2_310, L3_311, L4_312, L5_313
  L2_310 = A0_308.InstanceVars
  L3_311 = L2_310.InterpDelta
  if L3_311 == nil then
    L3_311 = A1_309.Amount
    L4_312 = A1_309.AmountVar
    if L4_312 ~= nil then
      L4_312 = GetTable
      L5_313 = A0_308
      L4_312 = L4_312(L5_313, A1_309.AmountVarTable)
      L5_313 = A1_309.AmountVar
      L3_311 = L4_312[L5_313]
    end
    L4_312 = GetPosition
    L5_313 = A1_309.TargetVar
    L5_313 = A0_308[L5_313]
    L4_312 = L4_312(L5_313)
    L2_310.KnockBackStart = L4_312
    L4_312 = GetNormalizedPositionDelta
    L5_313 = A1_309.TargetVar
    L5_313 = A0_308[L5_313]
    L4_312 = L4_312(L5_313, A0_308[A1_309.AttackerVar], true)
    L5_313 = {}
    L5_313.x = L4_312.x * L3_311
    L5_313.y = 0
    L5_313.z = L4_312.z * L3_311
    L2_310.InterpDelta = L5_313
    L5_313 = GetTime
    L5_313 = L5_313()
    L2_310.StartTime = L5_313
    L5_313 = A1_309.KnockBackDuration
    L2_310.KnockBackDuration = L5_313
  end
  L3_311 = A1_309.TargetVar
  L3_311 = A0_308[L3_311]
  L4_312 = GetTime
  L4_312 = L4_312()
  L5_313 = L2_310.StartTime
  L4_312 = L4_312 - L5_313
  L5_313 = L2_310.KnockBackDuration
  L4_312 = L4_312 / L5_313
  L5_313 = {}
  L5_313.x = L2_310.KnockBackStart.x + L2_310.InterpDelta.x * L4_312
  L5_313.y = L2_310.KnockBackStart.y
  L5_313.z = L2_310.KnockBackStart.z + L2_310.InterpDelta.z * L4_312
  SetPosition(L3_311, L5_313)
end
BBKnockback = L0_0
function L0_0(A0_314, A1_315)
  local L2_316, L3_317
  L2_316 = GetParam
  L3_317 = "Left"
  L2_316 = L2_316(L3_317, A0_314, A1_315)
  L3_317 = GetParam
  L3_317 = L3_317("Right", A0_314, A1_315)
  GetTable(A0_314, A1_315.DestVarTable, true)[A1_315.DestVar] = tostring(L2_316) .. tostring(L3_317)
end
BBAppendString = L0_0
function L0_0(A0_318, A1_319)
  local L2_320
  L2_320 = 0
  if A1_319.Delta ~= nil then
    L2_320 = L2_320 + A1_319.Delta
  end
  if A1_319.DeltaByLevel ~= nil and A0_318.Level ~= nil then
    L2_320 = L2_320 + A1_319.DeltaByLevel[A0_318.Level]
  end
  if A1_319.DeltaVar ~= nil then
    L2_320 = L2_320 + GetTable(A0_318, A1_319.DeltaVarTable, true)[A1_319.DeltaVar]
  end
  if A1_319.TargetVar ~= nil then
    A1_319.Stat(L2_320, A0_318[A1_319.TargetVar])
  else
    A1_319.Stat(L2_320)
  end
end
BBIncStat = L0_0
function L0_0(A0_321, A1_322)
  local L2_323
  L2_323 = 0
  if A1_322.Delta ~= nil then
    L2_323 = L2_323 + A1_322.Delta
  end
  if A1_322.DeltaByLevel ~= nil and A0_321.Level ~= nil then
    L2_323 = L2_323 + A1_322.DeltaByLevel[A0_321.Level]
  end
  if A1_322.DeltaVar ~= nil then
    L2_323 = L2_323 + GetTable(A0_321, A1_322.DeltaVarTable, true)[A1_322.DeltaVar]
  end
  if A1_322.TargetVar ~= nil then
    A1_322.Stat(L2_323, A0_321[A1_322.TargetVar])
  else
    A1_322.Stat(L2_323)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_324, A1_325)
  local L2_326, L3_327
  L2_326 = A1_325.TargetVar
  L3_327 = 0
  if A1_325.LaneVar ~= nil then
    L3_327 = L3_327 + GetTable(A0_324, A1_325.LaneVarTable, true)[A1_325.LaneVar]
  end
  if A1_325.Lane ~= nil then
    L3_327 = L3_327 + A1_325.Lane
  end
  SetMinionLane(A0_324[L2_326], L3_327)
end
BBSetMinionLane = L0_0
function L0_0(A0_328, A1_329)
  if A1_329.AttackVar ~= nil then
  end
  if A1_329.Attack ~= nil then
  end
  if A1_329.TotalCoefficientVar ~= nil then
  end
  if A1_329.TotalCoefficient ~= nil then
  end
  if A1_329.TargetVar ~= nil then
    GetTable(A0_328, A1_329.DestVarTable, false)[A1_329.DestVar] = (0 + GetTable(A0_328, A1_329.AttackVarTable, true)[A1_329.AttackVar] + A1_329.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_328[A1_329.TargetVar])) + GetFlatCritDamageMod(A0_328[A1_329.TargetVar])) * (0 + GetTable(A0_328, A1_329.TotalCoefficientVarTable, true)[A1_329.TotalCoefficientVar] + A1_329.TotalCoefficient)
  else
    GetTable(A0_328, A1_329.DestVarTable, false)[A1_329.DestVar] = 2 * A1_329.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_330, A1_331)
  local L2_332, L3_333, L4_334, L5_335, L6_336, L7_337
  L2_332 = GetTable
  L3_333 = A0_330
  L4_334 = A1_331.DestVarTable
  L5_335 = false
  L2_332 = L2_332(L3_333, L4_334, L5_335)
  L3_333 = GetTable
  L4_334 = A0_330
  L5_335 = A1_331.AmountVarTable
  L6_336 = true
  L3_333 = L3_333(L4_334, L5_335, L6_336)
  L4_334 = GetTable
  L5_335 = A0_330
  L6_336 = A0_330.NextBuffVars
  L7_337 = false
  L4_334 = L4_334(L5_335, L6_336, L7_337)
  L5_335 = A1_331.AmountVar
  L5_335 = L3_333[L5_335]
  L6_336 = A1_331.Amount
  L5_335 = L5_335 + L6_336
  L4_334.InitializeShield_Amount = L5_335
  L5_335 = A1_331.AmountVar
  if L5_335 ~= nil then
    L5_335 = A1_331.HealShieldMod
    if L5_335 ~= nil and L5_335 == true then
      L6_336 = A1_331.AttackerVar
      L7_337 = 0
      if L6_336 ~= nil then
        L7_337 = GetPercentHealingAmountMod(A0_330[L6_336])
      end
      L4_334.InitializeShield_Amount, L3_333[A1_331.AmountVar] = (A1_331.Amount + L3_333[A1_331.AmountVar]) * (1 + L7_337), (A1_331.Amount + L3_333[A1_331.AmountVar]) * (1 + L7_337)
    end
  end
  L5_335 = SpellBuffAddNoRenew
  L6_336 = A1_331.AttackerVar
  L6_336 = A0_330[L6_336]
  L7_337 = A1_331.UnitVar
  L7_337 = A0_330[L7_337]
  L5_335(L6_336, L7_337, "InitializeShieldMarker", 0, 1, 25000, L4_334)
  L5_335 = BBIncreaseShield
  L6_336 = A0_330
  L7_337 = A1_331
  L5_335(L6_336, L7_337)
end
BBInitializeShield = L0_0
function L0_0(A0_338, A1_339)
  if A1_339.CDVar ~= nil then
  end
  if A1_339.CD ~= nil then
  end
  if A1_339.TargetVar ~= nil then
    GetTable(A0_338, A1_339.DestVarTable, false)[A1_339.DestVar] = (0 + GetTable(A0_338, A1_339.CDVarTable, true)[A1_339.CDVar] + A1_339.CD) * (1 + GetPercentCooldownMod(A0_338[A1_339.TargetVar]))
  else
    GetTable(A0_338, A1_339.DestVarTable, false)[A1_339.DestVar] = A1_339.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_340, A1_341)
  local L2_342, L3_343
  L3_343 = A1_341.TargetVar
  if L3_343 ~= nil then
    L2_342 = A1_341.Stat(A0_340[L3_343])
  else
    L2_342 = A1_341.Stat()
  end
  SetVarInTable(A0_340, A1_341, L2_342)
end
BBGetStat = L0_0
function L0_0(A0_344, A1_345)
  if A1_345.TargetVar ~= nil then
    GetTable(A0_344, A1_345.DestVarTable, false)[A1_345.DestVar] = GetLevel(A0_344[A1_345.TargetVar])
  else
    GetTable(A0_344, A1_345.DestVarTable, false)[A1_345.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_346, A1_347)
  if A1_347.TargetVar ~= nil then
    GetTable(A0_346, A1_347.DestVarTable, false)[A1_347.DestVar] = GetUnitSignificance(A0_346[A1_347.TargetVar])
  else
    GetTable(A0_346, A1_347.DestVarTable, false)[A1_347.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_348, A1_349)
  if A1_349.TargetVar ~= nil then
    GetTable(A0_348, A1_349.DestVarTable, false)[A1_349.DestVar] = GetArmor(A0_348[A1_349.TargetVar])
  else
    GetTable(A0_348, A1_349.DestVarTable, false)[A1_349.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_350, A1_351)
  if A1_351.TargetVar ~= nil then
    GetTable(A0_350, A1_351.DestVarTable, false)[A1_351.DestVar] = GetSpellBlock(A0_350[A1_351.TargetVar])
  else
    GetTable(A0_350, A1_351.DestVarTable, false)[A1_351.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_352, A1_353)
  local L2_354, L3_355
  L3_355 = A1_353.TargetVar
  if L3_355 ~= nil then
    L2_354 = GetTeamID(A0_352[L3_355])
  else
    L2_354 = GetTeamID()
  end
  SetVarInTable(A0_352, A1_353, L2_354)
end
BBGetTeamID = L0_0
function L0_0(A0_356, A1_357)
  local L2_358, L3_359, L4_360
  L2_358 = GetTable
  L3_359 = A0_356
  L4_360 = A1_357.DestVarTable
  L2_358 = L2_358(L3_359, L4_360, false)
  L3_359 = A1_357.TargetVar
  L4_360 = nil
  if L3_359 ~= nil then
    L4_360 = GetTeamID(A0_356[L3_359])
  else
    L4_360 = GetTeamID()
  end
  if L4_360 == TEAM_ORDER then
    L2_358[A1_357.DestVar] = TEAM_CHAOS
  elseif L4_360 == TEAM_CHAOS then
    L2_358[A1_357.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_361, A1_362)
  if A1_362.TargetVar ~= nil then
    GetTable(A0_361, A1_362.DestVarTable, false)[A1_362.DestVar] = GetUnitSkinName(A0_361[A1_362.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_363, A1_364)
  local L2_365, L3_366, L4_367
  L2_365 = GetTable
  L3_366 = A0_363
  L4_367 = A1_364.DestVarTable
  L2_365 = L2_365(L3_366, L4_367, false)
  L3_366 = A0_363.Owner
  L4_367 = nil
  if A1_364.TargetVar ~= nil then
    L4_367 = GetTotalAttackDamage(A0_363[A1_364.TargetVar])
  else
    L4_367 = GetTotalAttackDamage()
  end
  SetVarInTable(A0_363, A1_364, L4_367)
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_368, A1_369)
  GetTable(A0_368, A1_369.DestVarTable, true)[A1_369.DestVar] = A1_369.Status(A0_368[A1_369.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_370, A1_371)
  local L2_372
  L2_372 = A1_371.TargetVar
  L2_372 = A0_370[L2_372]
  ClearAttackTarget(L2_372)
end
BBClearAttackTarget = L0_0
function L0_0(A0_373, A1_374)
  local L2_375, L3_376
  L2_375 = GetTable
  L3_376 = A0_373
  L2_375 = L2_375(L3_376, A1_374.DestVarTable, true)
  L3_376 = A1_374.Info
  L3_376 = L3_376(A0_373[A1_374.TargetVar])
  SetVarInTable(A0_373, A1_374, L3_376)
end
BBGetCastInfo = L0_0
function L0_0(A0_377, A1_378, A2_379)
  local L3_380, L4_381, L5_382, L6_383
  L3_380 = GetTable
  L4_381 = A0_377
  L5_382 = A1_378.TrackTimeVarTable
  L6_383 = false
  L3_380 = L3_380(L4_381, L5_382, L6_383)
  L4_381 = GetTime
  L4_381 = L4_381()
  L5_382 = A1_378.ExecuteImmediately
  L6_383 = GetParam
  L6_383 = L6_383("TimeBetweenExecutions", A0_377, A1_378)
  if A1_378.TickTimeVar ~= nil and GetTable(A0_377, A1_378.TickTimeVarTable, false)[A1_378.TickTimeVar] ~= nil then
    L6_383 = GetTable(A0_377, A1_378.TickTimeVarTable, false)[A1_378.TickTimeVar]
  end
  if L3_380[A1_378.TrackTimeVar] == nil then
    L3_380[A1_378.TrackTimeVar] = L4_381
    if L5_382 == true then
      ExecuteBuildingBlocks(A2_379, A0_377)
    end
  end
  if L4_381 >= L3_380[A1_378.TrackTimeVar] + L6_383 then
    L3_380[A1_378.TrackTimeVar] = L3_380[A1_378.TrackTimeVar] + L6_383
    ExecuteBuildingBlocks(A2_379, A0_377)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_384, A1_385, A2_386)
  GetTable(A0_384, A1_385.TrackTimeVarTable, false)[A1_385.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_387, A1_388)
  local L2_389
  L2_389 = A1_388.SrcValue
  if A1_388.SrcVar ~= nil then
    L2_389 = GetTable(A0_387, A1_388.SrcVarTable, true)[A1_388.SrcVar]
  end
  A1_388.Status(A0_387[A1_388.TargetVar], L2_389)
end
BBSetStatus = L0_0
function L0_0(A0_390, A1_391)
  local L2_392
  L2_392 = A1_391.ToAlert
  if GetTable(A0_390, A1_391.SrcVarTable, false) ~= nil and A1_391.SrcVar ~= nil then
    L2_392 = L2_392 .. GetTable(A0_390, A1_391.SrcVarTable, false)[A1_391.SrcVar]
  end
  _ALERT(L2_392)
end
BBAlert = L0_0
function L0_0(A0_393, A1_394)
  local L2_395, L3_396, L4_397, L5_398, L6_399, L7_400
  L2_395 = GetParam
  L3_396 = "Message"
  L4_397 = A0_393
  L5_398 = A1_394
  L2_395 = L2_395(L3_396, L4_397, L5_398)
  if L2_395 == nil then
    L3_396 = ReportError
    L4_397 = "Could not resolve Message param"
    L3_396(L4_397)
    return
  end
  L3_396 = true
  L4_397 = GetParam
  L5_398 = "OnUnit"
  L6_399 = A0_393
  L7_400 = A1_394
  L4_397 = L4_397(L5_398, L6_399, L7_400)
  if L4_397 == nil then
    L3_396 = false
    L5_398 = GetParam
    L6_399 = "OnUnitByFlag"
    L7_400 = A0_393
    L5_398 = L5_398(L6_399, L7_400, A1_394)
    L4_397 = L5_398
  end
  if L4_397 == nil then
    L5_398 = ReportError
    L6_399 = "Could not resolve OnUnit param"
    L5_398(L6_399)
    return
  end
  L5_398 = true
  L6_399 = GetParam
  L7_400 = "ChampionToSayTo"
  L6_399 = L6_399(L7_400, A0_393, A1_394)
  if L6_399 == nil then
    L5_398 = false
    L7_400 = GetParam
    L7_400 = L7_400("ChampionToSayToByFlag", A0_393, A1_394)
    L6_399 = L7_400
  end
  if L6_399 == nil then
    L7_400 = ReportError
    L7_400("Could not resolve ChampionToSayTo param")
    return
  end
  L7_400 = GetParam
  L7_400 = L7_400("ShowToSpectator", A0_393, A1_394)
  if L7_400 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  SayWithFloatingTextOnUnitToChampion(tostring(L2_395), A1_394.TextType, L4_397, L3_396, L6_399, L5_398, L7_400)
end
BBSayWithFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_401, A1_402)
  local L2_403, L3_404, L4_405
  L2_403 = A1_402.ToSay
  L3_404 = GetTable
  L4_405 = A0_401
  L3_404 = L3_404(L4_405, A1_402.SrcVarTable, false)
  if L3_404 ~= nil then
    L4_405 = A1_402.SrcVar
    if L4_405 ~= nil then
      L4_405 = L2_403
      L2_403 = L4_405 .. tostring(L3_404[A1_402.SrcVar])
    end
  end
  L4_405 = nil
  if A1_402.OwnerVar ~= nil then
    L4_405 = A0_401[A1_402.OwnerVar]
  else
    L4_405 = A0_401.Owner
  end
  if A1_402.TextType == nil then
    A1_402.TextType = 0
  end
  Say(L4_405, L2_403, A1_402.TextType)
end
BBSay = L0_0
function L0_0(A0_406, A1_407)
  local L2_408, L3_409, L4_410
  L2_408 = A1_407.ToSay
  L3_409 = GetTable
  L4_410 = A0_406
  L3_409 = L3_409(L4_410, A1_407.SrcVarTable, false)
  if L3_409 ~= nil then
    L4_410 = A1_407.SrcVar
    if L4_410 ~= nil then
      L4_410 = L2_408
      L2_408 = L4_410 .. tostring(L3_409[A1_407.SrcVar])
    end
  end
  L4_410 = nil
  if A1_407.OwnerVar ~= nil then
    L4_410 = A0_406[A1_407.OwnerVar]
  else
    L4_410 = A0_406.Owner
  end
  if A1_407.TextType == nil then
    A1_407.TextType = 0
  end
  Say(L4_410, L2_408, A1_407.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_411, A1_412)
  GetTable(A0_411, A1_412.DestVarTable, true)[A1_412.DestVar] = BBLuaGetGold(A0_411, A1_412)
end
BBGetGold = L0_0
function L0_0(A0_413, A1_414)
  GetTable(A0_413, A1_414.DestVarTable, true)[A1_414.DestVar] = BBLuaGetTotalGold(A0_413, A1_414)
end
BBGetTotalGold = L0_0
function L0_0(A0_415, A1_416)
  SpellBuffAdd(A0_415[A1_416.OwnerVar], A0_415[A1_416.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_415.NextBuffVars)
  BBTeleportToPositionHelper(A0_415, A1_416)
end
BBTeleportToPosition = L0_0
function L0_0(A0_417, A1_418)
  if A1_418.XVar ~= nil and GetTable(A0_417, A1_418.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_417, A1_418.XVarTable, true)[A1_418.XVar]
  else
    Xloc = A1_418.X
  end
  if A1_418.YVar ~= nil and GetTable(A0_417, A1_418.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_417, A1_418.YVarTable, true)[A1_418.YVar]
  else
    Yloc = A1_418.Y
  end
  if A1_418.ZVar ~= nil and GetTable(A0_417, A1_418.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_417, A1_418.ZVarTable, true)[A1_418.ZVar]
  else
    Zloc = A1_418.Z
  end
  A1_418.OwnerVar, A0_417.position = A1_418.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_418.CastPositionName = "position"
  BBTeleportToPosition(A0_417, A1_418)
end
BBTeleportToPoint = L0_0
function L0_0(A0_419, A1_420)
  DefUpdateAura(GetTable(A0_419, A1_420.CenterTable, false)[A1_420.CenterVar], A1_420.Range, A1_420.UnitScan, A1_420.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_421, A1_422)
  ReincarnateNonDeadHero(GetTable(A0_421, A1_422.TargetTable, false)[A1_422.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_423, A1_424)
  GetTable(A0_423, A1_424.DestVarTable, true)[A1_424.DestVar] = A1_424.Function(A0_423[A1_424.OwnerVar], A1_424.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_425, A1_426)
  local L2_427, L3_428, L4_429, L5_430
  L2_427 = A1_426.WhomToOrderVar
  L2_427 = A0_425[L2_427]
  L3_428 = A1_426.TargetOfOrderVar
  L3_428 = A0_425[L3_428]
  L4_429 = GetTable
  L5_430 = A0_425
  L4_429 = L4_429(L5_430, A1_426.SrcVarTable, false)
  L5_430 = nil
  if A1_426.SrcVar ~= nil and L4_429 ~= nil then
    L5_430 = L4_429[A1_426.SrcVar]
  else
    L5_430 = GetPosition(L3_428)
  end
  if L3_428 == nil then
    L3_428 = L2_427
  end
  IssueOrder(L2_427, A1_426.Order, L5_430, L3_428)
end
BBIssueOrder = L0_0
function L0_0(A0_431, A1_432)
  local L2_433
  L2_433 = GetParam
  L2_433 = L2_433("NewRange", A0_431, A1_432)
  SetSpellCastRange(L2_433)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_434, A1_435)
  GetTable(A0_434, A1_435.DestVarTable, true)[A1_435.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_436, A1_437)
  local L2_438, L3_439
  L2_438 = A1_437.ObjectVar1
  L2_438 = A0_436[L2_438]
  L3_439 = A1_437.ObjectVar2
  L3_439 = A0_436[L3_439]
  GetTable(A0_436, A1_437.DestVarTable, true)[A1_437.DestVar] = DistanceBetweenObjectBounds(L2_438, L3_439)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_440, A1_441)
  local L2_442, L3_443, L4_444
  L2_442 = A1_441.ObjectVar
  L2_442 = A0_440[L2_442]
  L3_443 = GetTable
  L4_444 = A0_440
  L3_443 = L3_443(L4_444, A1_441.PointVarTable, true)
  L4_444 = A1_441.PointVar
  L4_444 = L3_443[L4_444]
  GetTable(A0_440, A1_441.DestVarTable, true)[A1_441.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_442, L4_444)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_445, A1_446)
  local L2_447, L3_448
  L2_447 = GetParam
  L3_448 = "Point1"
  L2_447 = L2_447(L3_448, A0_445, A1_446)
  L3_448 = GetParam
  L3_448 = L3_448("Point2", A0_445, A1_446)
  GetTable(A0_445, A1_446.DestVarTable, true)[A1_446.DestVar] = DistanceBetweenPoints(L2_447, L3_448)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_449, A1_450, A2_451)
  local L3_452, L4_453, L5_454, L6_455, L7_456, L8_457
  L5_454 = 0
  L6_455 = nil
  L7_456 = A1_450.ObjectDistanceType
  L8_457 = A1_450.ObjectVar1
  L3_452 = A0_449[L8_457]
  L8_457 = A1_450.ObjectVar2
  L4_453 = A0_449[L8_457]
  if nil == L4_453 then
    L8_457 = A1_450.Point2Var
    if nil ~= L8_457 then
      L8_457 = GetTable
      L8_457 = L8_457(A0_449, A1_450.Point2VarTable, true)
      L4_453 = L8_457[A1_450.Point2Var]
      L5_454 = L5_454 + 1
    end
  end
  if nil == L3_452 then
    L8_457 = A1_450.Point1Var
    if nil ~= L8_457 then
      L8_457 = GetTable
      L8_457 = L8_457(A0_449, A1_450.Point1VarTable, true)
      L3_452 = L8_457[A1_450.Point1Var]
      L5_454 = L5_454 + 1
      if 1 == L5_454 then
        L3_452, L4_453 = L4_453, L3_452
      end
    end
  end
  if nil ~= L7_456 then
    if 0 == L5_454 then
      L8_457 = OBJECT_CENTER
      if L8_457 == L7_456 then
        L6_455 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_457 = OBJECT_BOUNDARY
        if L8_457 == L7_456 then
          L6_455 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_457 = A1_450.OwnerVar
          L8_457 = A0_449[L8_457]
          Say(L8_457, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_454 then
      L8_457 = OBJECT_CENTER
      if L8_457 == L7_456 then
        L6_455 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_457 = OBJECT_BOUNDARY
        if L8_457 == L7_456 then
          L6_455 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_457 = A1_450.OwnerVar
          L8_457 = A0_449[L8_457]
          Say(L8_457, "invalid object distance type", 0)
        end
      end
    else
      L6_455 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_457 = A1_450.Distance
  if A1_450.DistanceVar ~= nil and GetTable(A0_449, A1_450.DistanceVarTable, true) ~= nil then
    L8_457 = L8_457 + GetTable(A0_449, A1_450.DistanceVarTable, true)[A1_450.DistanceVar]
  end
  if L3_452 ~= nil and L4_453 ~= nil and L6_455 ~= nil and L8_457 ~= nil then
    if not L6_455(L3_452, L4_453, L8_457) then
      ExecuteBuildingBlocks(A2_451, A0_449)
      A0_449.LastIfSucceeded = true
    else
      A0_449.LastIfSucceeded = false
    end
  else
    A0_449.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_458, A1_459)
  local L2_460, L3_461
  L2_460 = A1_459.TargetVar
  L2_460 = A0_458[L2_460]
  L3_461 = A1_459.CasterVar
  L3_461 = A0_458[L3_461]
  GetTable(A0_458, A1_459.DestVarTable, true)[A1_459.DestVar] = SpellBuffCount(L2_460, A1_459.BuffName, L3_461)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_462, A1_463)
  local L2_464
  L2_464 = A1_463.TargetVar
  L2_464 = A0_462[L2_464]
  GetTable(A0_462, A1_463.DestVarTable, true)[A1_463.DestVar] = SpellBuffCount(L2_464, A1_463.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_465, A1_466)
  local L2_467, L3_468
  L2_467 = GetTable
  L3_468 = A0_465
  L2_467 = L2_467(L3_468, A1_466.ScaleVarTable, false)
  L3_468 = nil
  if A1_466.OwnerVar ~= nil then
    L3_468 = A0_465[A1_466.OwnerVar]
  else
    L3_468 = A0_465.Owner
  end
  if A1_466.ScaleVar ~= nil and A1_466.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_467[A1_466.ScaleVar], L3_468)
  else
    SetScaleSkinCoef(A1_466.Scale, L3_468)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_469, A1_470)
  SpellBuffAdd(A0_469[A1_470.TargetVar], A0_469[A1_470.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_469.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_471, A1_472, A2_473)
  local L3_474, L4_475
  L3_474 = A1_472.TargetVar
  L3_474 = A0_471[L3_474]
  L4_475 = A1_472.NumStacks
  if GetParam("NumStacks", A0_471, A1_472) == 0 then
    L4_475 = SpellBuffCount(L3_474, A1_472.BuffName, caster)
  else
    L4_475 = GetParam("NumStacks", A0_471, A1_472)
  end
  while L4_475 > 0 do
    SpellBuffRemove(L3_474, A1_472.BuffName, A0_471[A1_472.AttackerVar])
    L4_475 = L4_475 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_476, A1_477, A2_478)
  if A0_476.EmoteId == A1_477.EmoteId then
    ExecuteBuildingBlocks(A2_478, A0_476)
    A0_476.LastIfSucceeded = true
  else
    A0_476.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_479, A1_480, A2_481)
  if A0_479.EmoteId ~= A1_480.EmoteId then
    ExecuteBuildingBlocks(A2_481, A0_479)
    A0_479.LastIfSucceeded = true
  else
    A0_479.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_482, A1_483)
  local L2_484, L3_485, L4_486, L5_487
  L2_484 = GetTable
  L3_485 = A0_482
  L4_486 = A1_483.String1VarTable
  L5_487 = false
  L2_484 = L2_484(L3_485, L4_486, L5_487)
  L3_485 = A1_483.String1Var
  L3_485 = L2_484[L3_485]
  L4_486 = GetTable
  L5_487 = A0_482
  L4_486 = L4_486(L5_487, A1_483.String2VarTable, false)
  L5_487 = A1_483.String2Var
  L5_487 = L4_486[L5_487]
  GetTable(A0_482, A1_483.ResultVarTable, false)[A1_483.ResultVar] = L3_485 .. L5_487
end
BBConcatenateStrings = L0_0
function L0_0(A0_488, A1_489)
  BBGetMinionKills(A0_488, A1_489)
  A0_488.MinionKillSource = GetParam("MinionKillTarget")
  A0_488.MinionKills = A0_488.MinionsKilled + GetParam("MinionKills", A0_488, A1_489)
  BBSetMinionKills(A0_488, A1_489)
end
BBIncreaseMinionKills = L0_0
