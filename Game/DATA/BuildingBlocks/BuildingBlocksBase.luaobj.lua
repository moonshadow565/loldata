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
        ClientPrint("Missing Required Variable: " .. L3_18 .. "." .. A1_16.RequiredVar .. " Current block data is: " .. tostring(gCurrentBuildingBlockString))
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
    ClientPrint("Table specified does not exist: " .. tostring(A1_95.TableVarTable) .. "." .. tostring(A1_95.TableVar))
    return
  end
  if type(L2_96[A1_95.TableVar]) == "table" then
    if GetParam("Key", A0_94, A1_95) then
      L2_96[A1_95.TableVar][GetParam("Key", A0_94, A1_95)] = nil
    elseif L3_97 then
      table.remove(L2_96[A1_95.TableVar], L3_97)
    else
      ClientPrint("Specified index/key was nil: " .. tostring(A1_95.IndexVarTable) .. "." .. tostring(A1_95.IndexVar))
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
    ClientPrint("Designer Error: Macro variable is not initialized inside of event. Macro Variable was: " .. tostring(A1_185.MacroVar) .. " and current block data is: " .. gCurrentBuildingBlockString .. ". This error probably occurred due to variable not being initialized yet, being misnamed or two events being called out of sequence. It is highly recommended that script macros either be initialized OnBuffActivate, OnCharActivate or in the same event. Pro Devs may violate this rule at the risk of being forced to read this error message again.")
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
  local L3_200, L4_201, L5_202, L6_203
  L3_200 = A0_197.LastIfSucceeded
  if L3_200 == false then
    L3_200 = GetTable
    L4_201 = A0_197
    L5_202 = A1_198.Src1VarTable
    L6_203 = false
    L3_200 = L3_200(L4_201, L5_202, L6_203)
    L4_201 = GetTable
    L5_202 = A0_197
    L6_203 = A1_198.Src2VarTable
    L4_201 = L4_201(L5_202, L6_203, false)
    L5_202 = false
    L6_203 = nil
    if L3_200 ~= nil and A1_198.Src1Var ~= nil then
      L6_203 = L3_200[A1_198.Src1Var]
    else
      L6_203 = A1_198.Value1
    end
    if L4_201 ~= nil and A1_198.Src2Var ~= nil then
      L5_202 = A1_198.CompareOp(L6_203, L4_201[A1_198.Src2Var])
    else
      L5_202 = A1_198.CompareOp(L6_203, A1_198.Value2)
    end
    if L5_202 then
      ExecuteBuildingBlocks(A2_199, A0_197)
      A0_197.LastIfSucceeded = true
    else
      A0_197.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_204, A1_205, A2_206)
  local L3_207
  if A1_205.TargetVar ~= nil then
    L3_207 = A0_204[A1_205.TargetVar]
  else
    L3_207 = A0_204.Target
  end
  if HasBuffOfType(L3_207, A1_205.BuffType) then
    ExecuteBuildingBlocks(A2_206, A0_204)
    A0_204.LastIfSucceeded = true
  else
    A0_204.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_208, A1_209, A2_210)
  local L3_211, L4_212
  if A1_209.OwnerVar ~= nil then
    L3_211 = A0_208[A1_209.OwnerVar]
  else
    L3_211 = A0_208.Owner
  end
  if A1_209.AttackerVar ~= nil then
    L4_212 = A0_208[A1_209.AttackerVar]
  else
    L4_212 = A0_208.Attacker
  end
  if SpellBuffCount(L3_211, A1_209.BuffName, L4_212) > 0 then
    ExecuteBuildingBlocks(A2_210, A0_208)
    A0_208.LastIfSucceeded = true
  else
    A0_208.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_213, A1_214, A2_215)
  if BBIsMissileAutoAttack(A0_213, A1_214) then
    ExecuteBuildingBlocks(A2_215, A0_213)
    A0_213.LastIfSucceeded = true
  else
    A0_213.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_216, A1_217, A2_218)
  if BBIsMissileConsideredAsAutoAttack(A0_216, A1_217) then
    ExecuteBuildingBlocks(A2_218, A0_216)
    A0_216.LastIfSucceeded = true
  else
    A0_216.LastIfSucceeded = false
  end
end
BBIfMissileConsideredAsAutoAttack = L0_0
function L0_0(A0_219, A1_220)
  A0_219.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_221, A1_222, A2_223)
  local L3_224, L4_225
  if A1_222.OwnerVar ~= nil then
    L3_224 = A0_221[A1_222.OwnerVar]
  else
    L3_224 = A0_221.Owner
  end
  if A1_222.CasterVar ~= nil then
    L4_225 = A0_221[A1_222.CasterVar]
  else
    L4_225 = A0_221.Caster
  end
  if SpellBuffCount(L3_224, A1_222.BuffName, L4_225) <= 0 then
    ExecuteBuildingBlocks(A2_223, A0_221)
    A0_221.LastIfSucceeded = true
  else
    A0_221.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_226, A1_227, A2_228)
  local L3_229, L4_230
  if A1_227.OwnerVar ~= nil then
    L3_229 = A0_226[A1_227.OwnerVar]
  else
    L3_229 = A0_226.Owner
  end
  if HasPARType(L3_229, A1_227.PARType) then
    ExecuteBuildingBlocks(A2_228, A0_226)
    A0_226.LastIfSucceeded = true
  else
    A0_226.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_231, A1_232, A2_233)
  local L3_234, L4_235
  if A1_232.OwnerVar ~= nil then
    L3_234 = A0_231[A1_232.OwnerVar]
  else
    L3_234 = A0_231.Owner
  end
  if not HasPARType(L3_234, A1_232.PARType) then
    ExecuteBuildingBlocks(A2_233, A0_231)
    A0_231.LastIfSucceeded = true
  else
    A0_231.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_236, A1_237, A2_238)
  local L3_239, L4_240, L5_241, L6_242, L7_243
  L3_239 = GetTable
  L4_240 = A0_236
  L5_241 = A1_237.Src1VarTable
  L6_242 = false
  L3_239 = L3_239(L4_240, L5_241, L6_242)
  L4_240 = GetTable
  L5_241 = A0_236
  L6_242 = A1_237.Src2VarTable
  L7_243 = false
  L4_240 = L4_240(L5_241, L6_242, L7_243)
  L5_241 = true
  while L5_241 do
    L6_242 = false
    L7_243 = nil
    if L3_239 ~= nil and A1_237.Src1Var ~= nil then
      L7_243 = L3_239[A1_237.Src1Var]
    else
      L7_243 = A1_237.Value1
    end
    if L4_240 ~= nil and A1_237.Src2Var ~= nil then
      L6_242 = A1_237.CompareOp(L7_243, L4_240[A1_237.Src2Var])
    else
      L6_242 = A1_237.CompareOp(L7_243, A1_237.Value2)
    end
    if L6_242 then
      ExecuteBuildingBlocks(A2_238, A0_236)
    else
      L5_241 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_244, A1_245)
  return A0_244 * A1_245
end
MO_MULTIPLY = L0_0
function L0_0(A0_246, A1_247)
  return A0_246 + A1_247
end
MO_ADD = L0_0
function L0_0(A0_248, A1_249)
  return A0_248 - A1_249
end
MO_SUBTRACT = L0_0
function L0_0(A0_250, A1_251)
  return A0_250 / A1_251
end
MO_DIVIDE = L0_0
function L0_0(A0_252, A1_253)
  if A0_252 < A1_253 then
    return A0_252
  else
    return A1_253
  end
end
MO_MIN = L0_0
function L0_0(A0_254, A1_255)
  if A1_255 < A0_254 then
    return A0_254
  else
    return A1_255
  end
end
MO_MAX = L0_0
function L0_0(A0_256, A1_257)
  return A0_256 % A1_257
end
MO_MODULO = L0_0
function L0_0(A0_258)
  return math.floor(A0_258 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_259)
  return math.ceil(A0_259)
end
MO_ROUNDUP = L0_0
function L0_0(A0_260)
  return math.floor(A0_260)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_261)
  return math.sin(math.rad(A0_261))
end
MO_SIN = L0_0
function L0_0(A0_262)
  return math.cos(math.rad(A0_262))
end
MO_COSINE = L0_0
function L0_0(A0_263)
  return math.tan(math.rad(A0_263))
end
MO_TANGENT = L0_0
function L0_0(A0_264)
  return math.deg(math.asin(A0_264))
end
MO_ASIN = L0_0
function L0_0(A0_265)
  return math.deg(math.acos(A0_265))
end
MO_ACOS = L0_0
function L0_0(A0_266)
  return math.deg(math.atan(A0_266))
end
MO_ATAN = L0_0
function L0_0(A0_267, A1_268)
  return math.pow(A0_267, A1_268)
end
MO_POW = L0_0
function L0_0(A0_269)
  return math.sqrt(A0_269)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_270, A1_271)
  local L2_272
  L2_272 = A0_270 and A1_271
  return L2_272
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_273, A1_274)
  local L2_275
  L2_275 = A0_273 or A1_274
  return L2_275
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_276)
  local L1_277
  L1_277 = not A0_276
  return L1_277
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_278)
  return math.abs(A0_278)
end
MO_ABS = L0_0
function L0_0(A0_279, A1_280)
  return math.random(A0_279, A1_280)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_281, A1_282)
  local L2_283, L3_284, L4_285, L5_286
  L2_283 = GetMathNumber
  L3_284 = A0_281
  L4_285 = A1_282.Src1VarTable
  L5_286 = A1_282.Src1Var
  L2_283 = L2_283(L3_284, L4_285, L5_286, A1_282.Src1Value)
  L3_284 = GetMathNumber
  L4_285 = A0_281
  L5_286 = A1_282.Src2VarTable
  L3_284 = L3_284(L4_285, L5_286, A1_282.Src2Var, A1_282.Src2Value)
  L4_285 = GetTable
  L5_286 = A0_281
  L4_285 = L4_285(L5_286, A1_282.DestVarTable)
  L5_286 = A1_282.MathOp
  L5_286 = L5_286(L2_283, L3_284)
  SetVarInTable(A0_281, A1_282, L5_286)
end
BBMath = L0_0
function L0_0(A0_287, A1_288, A2_289, A3_290)
  if A2_289 ~= nil and GetTable(A0_287, A1_288)[A2_289] ~= nil then
    return GetTable(A0_287, A1_288)[A2_289]
  end
  return A3_290
end
GetMathNumber = L0_0
function L0_0(A0_291, A1_292)
  if type(A1_292) == "number" then
    return A1_292
  elseif type(A1_292) == "function" then
    return A1_292(A0_291)
  elseif type(A1_292) == "string" then
    return A0_291[A1_292]
  end
end
GetNumber = L0_0
function L0_0(A0_293, A1_294)
  return VectorAdd(A0_293, A1_294)
end
VEC_ADD = L0_0
function L0_0(A0_295, A1_296)
  return VectorSubtract(A0_295, A1_296)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_297, A1_298)
  return VectorScalarMultiply(A0_297, A1_298)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_299, A1_300)
  return VectorScalarDivide(A0_299, A1_300)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_301, A1_302)
  return VectorRotateY(A0_301, A1_302)
end
VEC_ROTATE = L0_0
function L0_0(A0_303, A1_304)
  BBMath(A0_303, A1_304)
end
BBVectorMath = L0_0
function L0_0(A0_305, A1_306)
  local L2_307, L3_308, L4_309, L5_310
  L2_307 = A0_305.InstanceVars
  L3_308 = L2_307.InterpDelta
  if L3_308 == nil then
    L3_308 = A1_306.Amount
    L4_309 = A1_306.AmountVar
    if L4_309 ~= nil then
      L4_309 = GetTable
      L5_310 = A0_305
      L4_309 = L4_309(L5_310, A1_306.AmountVarTable)
      L5_310 = A1_306.AmountVar
      L3_308 = L4_309[L5_310]
    end
    L4_309 = GetPosition
    L5_310 = A1_306.TargetVar
    L5_310 = A0_305[L5_310]
    L4_309 = L4_309(L5_310)
    L2_307.KnockBackStart = L4_309
    L4_309 = GetNormalizedPositionDelta
    L5_310 = A1_306.TargetVar
    L5_310 = A0_305[L5_310]
    L4_309 = L4_309(L5_310, A0_305[A1_306.AttackerVar], true)
    L5_310 = {}
    L5_310.x = L4_309.x * L3_308
    L5_310.y = 0
    L5_310.z = L4_309.z * L3_308
    L2_307.InterpDelta = L5_310
    L5_310 = GetTime
    L5_310 = L5_310()
    L2_307.StartTime = L5_310
    L5_310 = A1_306.KnockBackDuration
    L2_307.KnockBackDuration = L5_310
  end
  L3_308 = A1_306.TargetVar
  L3_308 = A0_305[L3_308]
  L4_309 = GetTime
  L4_309 = L4_309()
  L5_310 = L2_307.StartTime
  L4_309 = L4_309 - L5_310
  L5_310 = L2_307.KnockBackDuration
  L4_309 = L4_309 / L5_310
  L5_310 = {}
  L5_310.x = L2_307.KnockBackStart.x + L2_307.InterpDelta.x * L4_309
  L5_310.y = L2_307.KnockBackStart.y
  L5_310.z = L2_307.KnockBackStart.z + L2_307.InterpDelta.z * L4_309
  SetPosition(L3_308, L5_310)
end
BBKnockback = L0_0
function L0_0(A0_311, A1_312)
  local L2_313, L3_314
  L2_313 = GetParam
  L3_314 = "Left"
  L2_313 = L2_313(L3_314, A0_311, A1_312)
  L3_314 = GetParam
  L3_314 = L3_314("Right", A0_311, A1_312)
  GetTable(A0_311, A1_312.DestVarTable, true)[A1_312.DestVar] = tostring(L2_313) .. tostring(L3_314)
end
BBAppendString = L0_0
function L0_0(A0_315, A1_316)
  local L2_317
  L2_317 = 0
  if A1_316.Delta ~= nil then
    L2_317 = L2_317 + A1_316.Delta
  end
  if A1_316.DeltaByLevel ~= nil and A0_315.Level ~= nil then
    L2_317 = L2_317 + A1_316.DeltaByLevel[A0_315.Level]
  end
  if A1_316.DeltaVar ~= nil then
    L2_317 = L2_317 + GetTable(A0_315, A1_316.DeltaVarTable, true)[A1_316.DeltaVar]
  end
  if A1_316.TargetVar ~= nil then
    A1_316.Stat(L2_317, A0_315[A1_316.TargetVar])
  else
    A1_316.Stat(L2_317)
  end
end
BBIncStat = L0_0
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
BBIncPermanentStat = L0_0
function L0_0(A0_321, A1_322)
  local L2_323, L3_324
  L2_323 = A1_322.TargetVar
  L3_324 = 0
  if A1_322.LaneVar ~= nil then
    L3_324 = L3_324 + GetTable(A0_321, A1_322.LaneVarTable, true)[A1_322.LaneVar]
  end
  if A1_322.Lane ~= nil then
    L3_324 = L3_324 + A1_322.Lane
  end
  SetMinionLane(A0_321[L2_323], L3_324)
end
BBSetMinionLane = L0_0
function L0_0(A0_325, A1_326)
  if A1_326.AttackVar ~= nil then
  end
  if A1_326.Attack ~= nil then
  end
  if A1_326.TotalCoefficientVar ~= nil then
  end
  if A1_326.TotalCoefficient ~= nil then
  end
  if A1_326.TargetVar ~= nil then
    GetTable(A0_325, A1_326.DestVarTable, false)[A1_326.DestVar] = (0 + GetTable(A0_325, A1_326.AttackVarTable, true)[A1_326.AttackVar] + A1_326.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_325[A1_326.TargetVar])) + GetFlatCritDamageMod(A0_325[A1_326.TargetVar])) * (0 + GetTable(A0_325, A1_326.TotalCoefficientVarTable, true)[A1_326.TotalCoefficientVar] + A1_326.TotalCoefficient)
  else
    GetTable(A0_325, A1_326.DestVarTable, false)[A1_326.DestVar] = 2 * A1_326.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_327, A1_328)
  local L2_329, L3_330, L4_331, L5_332, L6_333, L7_334
  L2_329 = GetTable
  L3_330 = A0_327
  L4_331 = A1_328.DestVarTable
  L5_332 = false
  L2_329 = L2_329(L3_330, L4_331, L5_332)
  L3_330 = GetTable
  L4_331 = A0_327
  L5_332 = A1_328.AmountVarTable
  L6_333 = true
  L3_330 = L3_330(L4_331, L5_332, L6_333)
  L4_331 = GetTable
  L5_332 = A0_327
  L6_333 = A0_327.NextBuffVars
  L7_334 = false
  L4_331 = L4_331(L5_332, L6_333, L7_334)
  L5_332 = A1_328.AmountVar
  L5_332 = L3_330[L5_332]
  L6_333 = A1_328.Amount
  L5_332 = L5_332 + L6_333
  L4_331.InitializeShield_Amount = L5_332
  L5_332 = A1_328.AmountVar
  if L5_332 ~= nil then
    L5_332 = A1_328.HealShieldMod
    if L5_332 ~= nil and L5_332 == true then
      L6_333 = A1_328.AttackerVar
      L7_334 = 0
      if L6_333 ~= nil then
        L7_334 = GetPercentHealingAmountMod(A0_327[L6_333])
      end
      L4_331.InitializeShield_Amount, L3_330[A1_328.AmountVar] = (A1_328.Amount + L3_330[A1_328.AmountVar]) * (1 + L7_334), (A1_328.Amount + L3_330[A1_328.AmountVar]) * (1 + L7_334)
    end
  end
  L5_332 = SpellBuffAddNoRenew
  L6_333 = A1_328.AttackerVar
  L6_333 = A0_327[L6_333]
  L7_334 = A1_328.UnitVar
  L7_334 = A0_327[L7_334]
  L5_332(L6_333, L7_334, "InitializeShieldMarker", 0, 1, 25000, L4_331)
  L5_332 = BBIncreaseShield
  L6_333 = A0_327
  L7_334 = A1_328
  L5_332(L6_333, L7_334)
end
BBInitializeShield = L0_0
function L0_0(A0_335, A1_336)
  if A1_336.CDVar ~= nil then
  end
  if A1_336.CD ~= nil then
  end
  if A1_336.TargetVar ~= nil then
    GetTable(A0_335, A1_336.DestVarTable, false)[A1_336.DestVar] = (0 + GetTable(A0_335, A1_336.CDVarTable, true)[A1_336.CDVar] + A1_336.CD) * (1 + GetPercentCooldownMod(A0_335[A1_336.TargetVar]))
  else
    GetTable(A0_335, A1_336.DestVarTable, false)[A1_336.DestVar] = A1_336.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_337, A1_338)
  local L2_339, L3_340
  L3_340 = A1_338.TargetVar
  if L3_340 ~= nil then
    L2_339 = A1_338.Stat(A0_337[L3_340])
  else
    L2_339 = A1_338.Stat()
  end
  SetVarInTable(A0_337, A1_338, L2_339)
end
BBGetStat = L0_0
function L0_0(A0_341, A1_342)
  if A1_342.TargetVar ~= nil then
    GetTable(A0_341, A1_342.DestVarTable, false)[A1_342.DestVar] = GetLevel(A0_341[A1_342.TargetVar])
  else
    GetTable(A0_341, A1_342.DestVarTable, false)[A1_342.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_343, A1_344)
  if A1_344.TargetVar ~= nil then
    GetTable(A0_343, A1_344.DestVarTable, false)[A1_344.DestVar] = GetUnitSignificance(A0_343[A1_344.TargetVar])
  else
    GetTable(A0_343, A1_344.DestVarTable, false)[A1_344.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_345, A1_346)
  if A1_346.TargetVar ~= nil then
    GetTable(A0_345, A1_346.DestVarTable, false)[A1_346.DestVar] = GetArmor(A0_345[A1_346.TargetVar])
  else
    GetTable(A0_345, A1_346.DestVarTable, false)[A1_346.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_347, A1_348)
  if A1_348.TargetVar ~= nil then
    GetTable(A0_347, A1_348.DestVarTable, false)[A1_348.DestVar] = GetSpellBlock(A0_347[A1_348.TargetVar])
  else
    GetTable(A0_347, A1_348.DestVarTable, false)[A1_348.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_349, A1_350)
  local L2_351, L3_352
  L3_352 = A1_350.TargetVar
  if L3_352 ~= nil then
    L2_351 = GetTeamID(A0_349[L3_352])
  else
    L2_351 = GetTeamID()
  end
  SetVarInTable(A0_349, A1_350, L2_351)
end
BBGetTeamID = L0_0
function L0_0(A0_353, A1_354)
  local L2_355, L3_356, L4_357
  L2_355 = GetTable
  L3_356 = A0_353
  L4_357 = A1_354.DestVarTable
  L2_355 = L2_355(L3_356, L4_357, false)
  L3_356 = A1_354.TargetVar
  L4_357 = nil
  if L3_356 ~= nil then
    L4_357 = GetTeamID(A0_353[L3_356])
  else
    L4_357 = GetTeamID()
  end
  if L4_357 == TEAM_ORDER then
    L2_355[A1_354.DestVar] = TEAM_CHAOS
  elseif L4_357 == TEAM_CHAOS then
    L2_355[A1_354.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_358, A1_359)
  if A1_359.TargetVar ~= nil then
    GetTable(A0_358, A1_359.DestVarTable, false)[A1_359.DestVar] = GetUnitSkinName(A0_358[A1_359.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_360, A1_361)
  local L2_362, L3_363, L4_364
  L2_362 = GetTable
  L3_363 = A0_360
  L4_364 = A1_361.DestVarTable
  L2_362 = L2_362(L3_363, L4_364, false)
  L3_363 = A0_360.Owner
  L4_364 = nil
  if A1_361.TargetVar ~= nil then
    L4_364 = GetTotalAttackDamage(A0_360[A1_361.TargetVar])
  else
    L4_364 = GetTotalAttackDamage()
  end
  SetVarInTable(A0_360, A1_361, L4_364)
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_365, A1_366)
  GetTable(A0_365, A1_366.DestVarTable, true)[A1_366.DestVar] = A1_366.Status(A0_365[A1_366.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_367, A1_368)
  local L2_369
  L2_369 = A1_368.TargetVar
  L2_369 = A0_367[L2_369]
  ClearAttackTarget(L2_369)
end
BBClearAttackTarget = L0_0
function L0_0(A0_370, A1_371)
  local L2_372, L3_373
  L2_372 = GetTable
  L3_373 = A0_370
  L2_372 = L2_372(L3_373, A1_371.DestVarTable, true)
  L3_373 = A1_371.Info
  L3_373 = L3_373(A0_370[A1_371.TargetVar])
  SetVarInTable(A0_370, A1_371, L3_373)
end
BBGetCastInfo = L0_0
function L0_0(A0_374, A1_375, A2_376)
  local L3_377, L4_378, L5_379, L6_380
  L3_377 = GetTable
  L4_378 = A0_374
  L5_379 = A1_375.TrackTimeVarTable
  L6_380 = false
  L3_377 = L3_377(L4_378, L5_379, L6_380)
  L4_378 = GetTime
  L4_378 = L4_378()
  L5_379 = A1_375.ExecuteImmediately
  L6_380 = GetParam
  L6_380 = L6_380("TimeBetweenExecutions", A0_374, A1_375)
  if A1_375.TickTimeVar ~= nil and GetTable(A0_374, A1_375.TickTimeVarTable, false)[A1_375.TickTimeVar] ~= nil then
    L6_380 = GetTable(A0_374, A1_375.TickTimeVarTable, false)[A1_375.TickTimeVar]
  end
  if L3_377[A1_375.TrackTimeVar] == nil then
    L3_377[A1_375.TrackTimeVar] = L4_378
    if L5_379 == true then
      ExecuteBuildingBlocks(A2_376, A0_374)
    end
  end
  if L4_378 >= L3_377[A1_375.TrackTimeVar] + L6_380 then
    L3_377[A1_375.TrackTimeVar] = L3_377[A1_375.TrackTimeVar] + L6_380
    ExecuteBuildingBlocks(A2_376, A0_374)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_381, A1_382, A2_383)
  GetTable(A0_381, A1_382.TrackTimeVarTable, false)[A1_382.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_384, A1_385)
  local L2_386
  L2_386 = A1_385.SrcValue
  if A1_385.SrcVar ~= nil then
    L2_386 = GetTable(A0_384, A1_385.SrcVarTable, true)[A1_385.SrcVar]
  end
  A1_385.Status(A0_384[A1_385.TargetVar], L2_386)
end
BBSetStatus = L0_0
function L0_0(A0_387, A1_388)
  local L2_389
  L2_389 = A1_388.ToAlert
  if GetTable(A0_387, A1_388.SrcVarTable, false) ~= nil and A1_388.SrcVar ~= nil then
    L2_389 = L2_389 .. GetTable(A0_387, A1_388.SrcVarTable, false)[A1_388.SrcVar]
  end
  _ALERT(L2_389)
end
BBAlert = L0_0
function L0_0(A0_390, A1_391)
  local L2_392, L3_393, L4_394, L5_395, L6_396, L7_397
  L2_392 = GetParam
  L3_393 = "Message"
  L4_394 = A0_390
  L5_395 = A1_391
  L2_392 = L2_392(L3_393, L4_394, L5_395)
  if L2_392 == nil then
    L3_393 = ReportError
    L4_394 = "Could not resolve Message param"
    L3_393(L4_394)
    return
  end
  L3_393 = true
  L4_394 = GetParam
  L5_395 = "OnUnit"
  L6_396 = A0_390
  L7_397 = A1_391
  L4_394 = L4_394(L5_395, L6_396, L7_397)
  if L4_394 == nil then
    L3_393 = false
    L5_395 = GetParam
    L6_396 = "OnUnitByFlag"
    L7_397 = A0_390
    L5_395 = L5_395(L6_396, L7_397, A1_391)
    L4_394 = L5_395
  end
  if L4_394 == nil then
    L5_395 = ReportError
    L6_396 = "Could not resolve OnUnit param"
    L5_395(L6_396)
    return
  end
  L5_395 = true
  L6_396 = GetParam
  L7_397 = "ChampionToSayTo"
  L6_396 = L6_396(L7_397, A0_390, A1_391)
  if L6_396 == nil then
    L5_395 = false
    L7_397 = GetParam
    L7_397 = L7_397("ChampionToSayToByFlag", A0_390, A1_391)
    L6_396 = L7_397
  end
  if L6_396 == nil then
    L7_397 = ReportError
    L7_397("Could not resolve ChampionToSayTo param")
    return
  end
  L7_397 = GetParam
  L7_397 = L7_397("ShowToSpectator", A0_390, A1_391)
  if L7_397 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  SayWithFloatingTextOnUnitToChampion(tostring(L2_392), A1_391.TextType, L4_394, L3_393, L6_396, L5_395, L7_397)
end
BBSayWithFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_398, A1_399)
  local L2_400, L3_401, L4_402
  L2_400 = A1_399.ToSay
  L3_401 = GetTable
  L4_402 = A0_398
  L3_401 = L3_401(L4_402, A1_399.SrcVarTable, false)
  if L3_401 ~= nil then
    L4_402 = A1_399.SrcVar
    if L4_402 ~= nil then
      L4_402 = L2_400
      L2_400 = L4_402 .. tostring(L3_401[A1_399.SrcVar])
    end
  end
  L4_402 = nil
  if A1_399.OwnerVar ~= nil then
    L4_402 = A0_398[A1_399.OwnerVar]
  else
    L4_402 = A0_398.Owner
  end
  if A1_399.TextType == nil then
    A1_399.TextType = 0
  end
  Say(L4_402, L2_400, A1_399.TextType)
end
BBSay = L0_0
function L0_0(A0_403, A1_404)
  local L2_405, L3_406, L4_407
  L2_405 = A1_404.ToSay
  L3_406 = GetTable
  L4_407 = A0_403
  L3_406 = L3_406(L4_407, A1_404.SrcVarTable, false)
  if L3_406 ~= nil then
    L4_407 = A1_404.SrcVar
    if L4_407 ~= nil then
      L4_407 = L2_405
      L2_405 = L4_407 .. tostring(L3_406[A1_404.SrcVar])
    end
  end
  L4_407 = nil
  if A1_404.OwnerVar ~= nil then
    L4_407 = A0_403[A1_404.OwnerVar]
  else
    L4_407 = A0_403.Owner
  end
  if A1_404.TextType == nil then
    A1_404.TextType = 0
  end
  Say(L4_407, L2_405, A1_404.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_408, A1_409)
  GetTable(A0_408, A1_409.DestVarTable, true)[A1_409.DestVar] = BBLuaGetGold(A0_408, A1_409)
end
BBGetGold = L0_0
function L0_0(A0_410, A1_411)
  GetTable(A0_410, A1_411.DestVarTable, true)[A1_411.DestVar] = BBLuaGetTotalGold(A0_410, A1_411)
end
BBGetTotalGold = L0_0
function L0_0(A0_412, A1_413)
  SpellBuffAdd(A0_412[A1_413.OwnerVar], A0_412[A1_413.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_412.NextBuffVars)
  BBTeleportToPositionHelper(A0_412, A1_413)
end
BBTeleportToPosition = L0_0
function L0_0(A0_414, A1_415)
  if A1_415.XVar ~= nil and GetTable(A0_414, A1_415.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_414, A1_415.XVarTable, true)[A1_415.XVar]
  else
    Xloc = A1_415.X
  end
  if A1_415.YVar ~= nil and GetTable(A0_414, A1_415.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_414, A1_415.YVarTable, true)[A1_415.YVar]
  else
    Yloc = A1_415.Y
  end
  if A1_415.ZVar ~= nil and GetTable(A0_414, A1_415.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_414, A1_415.ZVarTable, true)[A1_415.ZVar]
  else
    Zloc = A1_415.Z
  end
  A1_415.OwnerVar, A0_414.position = A1_415.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_415.CastPositionName = "position"
  BBTeleportToPosition(A0_414, A1_415)
end
BBTeleportToPoint = L0_0
function L0_0(A0_416, A1_417)
  DefUpdateAura(GetTable(A0_416, A1_417.CenterTable, false)[A1_417.CenterVar], A1_417.Range, A1_417.UnitScan, A1_417.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_418, A1_419)
  ReincarnateNonDeadHero(GetTable(A0_418, A1_419.TargetTable, false)[A1_419.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_420, A1_421)
  GetTable(A0_420, A1_421.DestVarTable, true)[A1_421.DestVar] = A1_421.Function(A0_420[A1_421.OwnerVar], A1_421.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_422, A1_423)
  local L2_424, L3_425, L4_426, L5_427
  L2_424 = A1_423.WhomToOrderVar
  L2_424 = A0_422[L2_424]
  L3_425 = A1_423.TargetOfOrderVar
  L3_425 = A0_422[L3_425]
  L4_426 = GetTable
  L5_427 = A0_422
  L4_426 = L4_426(L5_427, A1_423.SrcVarTable, false)
  L5_427 = nil
  if A1_423.SrcVar ~= nil and L4_426 ~= nil then
    L5_427 = L4_426[A1_423.SrcVar]
  else
    L5_427 = GetPosition(L3_425)
  end
  if L3_425 == nil then
    L3_425 = L2_424
  end
  IssueOrder(L2_424, A1_423.Order, L5_427, L3_425)
end
BBIssueOrder = L0_0
function L0_0(A0_428, A1_429)
  local L2_430
  L2_430 = GetParam
  L2_430 = L2_430("NewRange", A0_428, A1_429)
  SetSpellCastRange(L2_430)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_431, A1_432)
  GetTable(A0_431, A1_432.DestVarTable, true)[A1_432.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_433, A1_434)
  local L2_435, L3_436
  L2_435 = A1_434.ObjectVar1
  L2_435 = A0_433[L2_435]
  L3_436 = A1_434.ObjectVar2
  L3_436 = A0_433[L3_436]
  GetTable(A0_433, A1_434.DestVarTable, true)[A1_434.DestVar] = DistanceBetweenObjectBounds(L2_435, L3_436)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_437, A1_438)
  local L2_439, L3_440, L4_441
  L2_439 = A1_438.ObjectVar
  L2_439 = A0_437[L2_439]
  L3_440 = GetTable
  L4_441 = A0_437
  L3_440 = L3_440(L4_441, A1_438.PointVarTable, true)
  L4_441 = A1_438.PointVar
  L4_441 = L3_440[L4_441]
  GetTable(A0_437, A1_438.DestVarTable, true)[A1_438.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_439, L4_441)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_442, A1_443)
  local L2_444, L3_445
  L2_444 = GetParam
  L3_445 = "Point1"
  L2_444 = L2_444(L3_445, A0_442, A1_443)
  L3_445 = GetParam
  L3_445 = L3_445("Point2", A0_442, A1_443)
  GetTable(A0_442, A1_443.DestVarTable, true)[A1_443.DestVar] = DistanceBetweenPoints(L2_444, L3_445)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_446, A1_447, A2_448)
  local L3_449, L4_450, L5_451, L6_452, L7_453, L8_454
  L5_451 = 0
  L6_452 = nil
  L7_453 = A1_447.ObjectDistanceType
  L8_454 = A1_447.ObjectVar1
  L3_449 = A0_446[L8_454]
  L8_454 = A1_447.ObjectVar2
  L4_450 = A0_446[L8_454]
  if nil == L4_450 then
    L8_454 = A1_447.Point2Var
    if nil ~= L8_454 then
      L8_454 = GetTable
      L8_454 = L8_454(A0_446, A1_447.Point2VarTable, true)
      L4_450 = L8_454[A1_447.Point2Var]
      L5_451 = L5_451 + 1
    end
  end
  if nil == L3_449 then
    L8_454 = A1_447.Point1Var
    if nil ~= L8_454 then
      L8_454 = GetTable
      L8_454 = L8_454(A0_446, A1_447.Point1VarTable, true)
      L3_449 = L8_454[A1_447.Point1Var]
      L5_451 = L5_451 + 1
      if 1 == L5_451 then
        L3_449, L4_450 = L4_450, L3_449
      end
    end
  end
  if nil ~= L7_453 then
    if 0 == L5_451 then
      L8_454 = OBJECT_CENTER
      if L8_454 == L7_453 then
        L6_452 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_454 = OBJECT_BOUNDARY
        if L8_454 == L7_453 then
          L6_452 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_454 = A1_447.OwnerVar
          L8_454 = A0_446[L8_454]
          Say(L8_454, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_451 then
      L8_454 = OBJECT_CENTER
      if L8_454 == L7_453 then
        L6_452 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_454 = OBJECT_BOUNDARY
        if L8_454 == L7_453 then
          L6_452 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_454 = A1_447.OwnerVar
          L8_454 = A0_446[L8_454]
          Say(L8_454, "invalid object distance type", 0)
        end
      end
    else
      L6_452 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_454 = A1_447.Distance
  if A1_447.DistanceVar ~= nil and GetTable(A0_446, A1_447.DistanceVarTable, true) ~= nil then
    L8_454 = L8_454 + GetTable(A0_446, A1_447.DistanceVarTable, true)[A1_447.DistanceVar]
  end
  if L3_449 ~= nil and L4_450 ~= nil and L6_452 ~= nil and L8_454 ~= nil then
    if not L6_452(L3_449, L4_450, L8_454) then
      ExecuteBuildingBlocks(A2_448, A0_446)
      A0_446.LastIfSucceeded = true
    else
      A0_446.LastIfSucceeded = false
    end
  else
    A0_446.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_455, A1_456)
  local L2_457, L3_458
  L2_457 = A1_456.TargetVar
  L2_457 = A0_455[L2_457]
  L3_458 = A1_456.CasterVar
  L3_458 = A0_455[L3_458]
  GetTable(A0_455, A1_456.DestVarTable, true)[A1_456.DestVar] = SpellBuffCount(L2_457, A1_456.BuffName, L3_458)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_459, A1_460)
  local L2_461
  L2_461 = A1_460.TargetVar
  L2_461 = A0_459[L2_461]
  GetTable(A0_459, A1_460.DestVarTable, true)[A1_460.DestVar] = SpellBuffCount(L2_461, A1_460.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_462, A1_463)
  local L2_464, L3_465
  L2_464 = GetTable
  L3_465 = A0_462
  L2_464 = L2_464(L3_465, A1_463.ScaleVarTable, false)
  L3_465 = nil
  if A1_463.OwnerVar ~= nil then
    L3_465 = A0_462[A1_463.OwnerVar]
  else
    L3_465 = A0_462.Owner
  end
  if A1_463.ScaleVar ~= nil and A1_463.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_464[A1_463.ScaleVar], L3_465)
  else
    SetScaleSkinCoef(A1_463.Scale, L3_465)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_466, A1_467)
  SpellBuffAdd(A0_466[A1_467.TargetVar], A0_466[A1_467.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_466.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_468, A1_469, A2_470)
  local L3_471, L4_472
  L3_471 = A1_469.TargetVar
  L3_471 = A0_468[L3_471]
  L4_472 = A1_469.NumStacks
  if GetParam("NumStacks", A0_468, A1_469) == 0 then
    L4_472 = SpellBuffCount(L3_471, A1_469.BuffName, caster)
  else
    L4_472 = GetParam("NumStacks", A0_468, A1_469)
  end
  while L4_472 > 0 do
    SpellBuffRemove(L3_471, A1_469.BuffName, A0_468[A1_469.AttackerVar])
    L4_472 = L4_472 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_473, A1_474, A2_475)
  if A0_473.EmoteId == A1_474.EmoteId then
    ExecuteBuildingBlocks(A2_475, A0_473)
    A0_473.LastIfSucceeded = true
  else
    A0_473.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_476, A1_477, A2_478)
  if A0_476.EmoteId ~= A1_477.EmoteId then
    ExecuteBuildingBlocks(A2_478, A0_476)
    A0_476.LastIfSucceeded = true
  else
    A0_476.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_479, A1_480)
  local L2_481, L3_482, L4_483, L5_484
  L2_481 = GetTable
  L3_482 = A0_479
  L4_483 = A1_480.String1VarTable
  L5_484 = false
  L2_481 = L2_481(L3_482, L4_483, L5_484)
  L3_482 = A1_480.String1Var
  L3_482 = L2_481[L3_482]
  L4_483 = GetTable
  L5_484 = A0_479
  L4_483 = L4_483(L5_484, A1_480.String2VarTable, false)
  L5_484 = A1_480.String2Var
  L5_484 = L4_483[L5_484]
  GetTable(A0_479, A1_480.ResultVarTable, false)[A1_480.ResultVar] = L3_482 .. L5_484
end
BBConcatenateStrings = L0_0
function L0_0(A0_485, A1_486)
  BBGetMinionKills(A0_485, A1_486)
  A0_485.MinionKillSource = GetParam("MinionKillTarget")
  A0_485.MinionKills = A0_485.MinionsKilled + GetParam("MinionKills", A0_485, A1_486)
  BBSetMinionKills(A0_485, A1_486)
end
BBIncreaseMinionKills = L0_0
