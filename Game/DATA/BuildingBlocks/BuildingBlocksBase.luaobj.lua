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
  local L3_200
  L3_200 = false
  if A0_197.LastIfSucceeded then
    ExecuteBuildingBlocks(A2_199, A0_197)
  else
    BBIf(A0_197, A1_198, A2_199)
  end
end
BBOrIf = L0_0
function L0_0(A0_201, A1_202, A2_203)
  local L3_204, L4_205, L5_206, L6_207
  L3_204 = A0_201.LastIfSucceeded
  if L3_204 == false then
    L3_204 = GetTable
    L4_205 = A0_201
    L5_206 = A1_202.Src1VarTable
    L6_207 = false
    L3_204 = L3_204(L4_205, L5_206, L6_207)
    L4_205 = GetTable
    L5_206 = A0_201
    L6_207 = A1_202.Src2VarTable
    L4_205 = L4_205(L5_206, L6_207, false)
    L5_206 = false
    L6_207 = nil
    if L3_204 ~= nil and A1_202.Src1Var ~= nil then
      L6_207 = L3_204[A1_202.Src1Var]
    else
      L6_207 = A1_202.Value1
    end
    if L4_205 ~= nil and A1_202.Src2Var ~= nil then
      L5_206 = A1_202.CompareOp(L6_207, L4_205[A1_202.Src2Var])
    else
      L5_206 = A1_202.CompareOp(L6_207, A1_202.Value2)
    end
    if L5_206 then
      ExecuteBuildingBlocks(A2_203, A0_201)
      A0_201.LastIfSucceeded = true
    else
      A0_201.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_208, A1_209, A2_210)
  local L3_211
  if A1_209.TargetVar ~= nil then
    L3_211 = A0_208[A1_209.TargetVar]
  else
    L3_211 = A0_208.Target
  end
  if HasBuffOfType(L3_211, A1_209.BuffType) then
    ExecuteBuildingBlocks(A2_210, A0_208)
    A0_208.LastIfSucceeded = true
  else
    A0_208.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_212, A1_213, A2_214)
  local L3_215, L4_216
  if A1_213.OwnerVar ~= nil then
    L3_215 = A0_212[A1_213.OwnerVar]
  else
    L3_215 = A0_212.Owner
  end
  if A1_213.AttackerVar ~= nil then
    L4_216 = A0_212[A1_213.AttackerVar]
  else
    L4_216 = A0_212.Attacker
  end
  if SpellBuffCount(L3_215, A1_213.BuffName, L4_216) > 0 then
    ExecuteBuildingBlocks(A2_214, A0_212)
    A0_212.LastIfSucceeded = true
  else
    A0_212.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_217, A1_218, A2_219)
  if BBIsMissileAutoAttack(A0_217, A1_218) then
    ExecuteBuildingBlocks(A2_219, A0_217)
    A0_217.LastIfSucceeded = true
  else
    A0_217.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_220, A1_221, A2_222)
  if BBIsMissileConsideredAsAutoAttack(A0_220, A1_221) then
    ExecuteBuildingBlocks(A2_222, A0_220)
    A0_220.LastIfSucceeded = true
  else
    A0_220.LastIfSucceeded = false
  end
end
BBIfMissileConsideredAsAutoAttack = L0_0
function L0_0(A0_223, A1_224)
  A0_223.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_225, A1_226, A2_227)
  local L3_228, L4_229
  if A1_226.OwnerVar ~= nil then
    L3_228 = A0_225[A1_226.OwnerVar]
  else
    L3_228 = A0_225.Owner
  end
  if A1_226.CasterVar ~= nil then
    L4_229 = A0_225[A1_226.CasterVar]
  else
    L4_229 = A0_225.Caster
  end
  if SpellBuffCount(L3_228, A1_226.BuffName, L4_229) <= 0 then
    ExecuteBuildingBlocks(A2_227, A0_225)
    A0_225.LastIfSucceeded = true
  else
    A0_225.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_230, A1_231, A2_232)
  local L3_233, L4_234
  if A1_231.OwnerVar ~= nil then
    L3_233 = A0_230[A1_231.OwnerVar]
  else
    L3_233 = A0_230.Owner
  end
  if HasPARType(L3_233, A1_231.PARType) then
    ExecuteBuildingBlocks(A2_232, A0_230)
    A0_230.LastIfSucceeded = true
  else
    A0_230.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_235, A1_236, A2_237)
  local L3_238, L4_239
  if A1_236.OwnerVar ~= nil then
    L3_238 = A0_235[A1_236.OwnerVar]
  else
    L3_238 = A0_235.Owner
  end
  if not HasPARType(L3_238, A1_236.PARType) then
    ExecuteBuildingBlocks(A2_237, A0_235)
    A0_235.LastIfSucceeded = true
  else
    A0_235.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_240, A1_241, A2_242)
  local L3_243, L4_244, L5_245, L6_246, L7_247
  L3_243 = GetTable
  L4_244 = A0_240
  L5_245 = A1_241.Src1VarTable
  L6_246 = false
  L3_243 = L3_243(L4_244, L5_245, L6_246)
  L4_244 = GetTable
  L5_245 = A0_240
  L6_246 = A1_241.Src2VarTable
  L7_247 = false
  L4_244 = L4_244(L5_245, L6_246, L7_247)
  L5_245 = true
  while L5_245 do
    L6_246 = false
    L7_247 = nil
    if L3_243 ~= nil and A1_241.Src1Var ~= nil then
      L7_247 = L3_243[A1_241.Src1Var]
    else
      L7_247 = A1_241.Value1
    end
    if L4_244 ~= nil and A1_241.Src2Var ~= nil then
      L6_246 = A1_241.CompareOp(L7_247, L4_244[A1_241.Src2Var])
    else
      L6_246 = A1_241.CompareOp(L7_247, A1_241.Value2)
    end
    if L6_246 then
      ExecuteBuildingBlocks(A2_242, A0_240)
    else
      L5_245 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_248, A1_249)
  return A0_248 * A1_249
end
MO_MULTIPLY = L0_0
function L0_0(A0_250, A1_251)
  return A0_250 + A1_251
end
MO_ADD = L0_0
function L0_0(A0_252, A1_253)
  return A0_252 - A1_253
end
MO_SUBTRACT = L0_0
function L0_0(A0_254, A1_255)
  return A0_254 / A1_255
end
MO_DIVIDE = L0_0
function L0_0(A0_256, A1_257)
  if A0_256 < A1_257 then
    return A0_256
  else
    return A1_257
  end
end
MO_MIN = L0_0
function L0_0(A0_258, A1_259)
  if A1_259 < A0_258 then
    return A0_258
  else
    return A1_259
  end
end
MO_MAX = L0_0
function L0_0(A0_260, A1_261)
  return A0_260 % A1_261
end
MO_MODULO = L0_0
function L0_0(A0_262)
  return math.floor(A0_262 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_263)
  return math.ceil(A0_263)
end
MO_ROUNDUP = L0_0
function L0_0(A0_264)
  return math.floor(A0_264)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_265)
  return math.sin(math.rad(A0_265))
end
MO_SIN = L0_0
function L0_0(A0_266)
  return math.cos(math.rad(A0_266))
end
MO_COSINE = L0_0
function L0_0(A0_267)
  return math.tan(math.rad(A0_267))
end
MO_TANGENT = L0_0
function L0_0(A0_268)
  return math.deg(math.asin(A0_268))
end
MO_ASIN = L0_0
function L0_0(A0_269)
  return math.deg(math.acos(A0_269))
end
MO_ACOS = L0_0
function L0_0(A0_270)
  return math.deg(math.atan(A0_270))
end
MO_ATAN = L0_0
function L0_0(A0_271, A1_272)
  return math.pow(A0_271, A1_272)
end
MO_POW = L0_0
function L0_0(A0_273)
  return math.sqrt(A0_273)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_274, A1_275)
  local L2_276
  L2_276 = A0_274 and A1_275
  return L2_276
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_277, A1_278)
  local L2_279
  L2_279 = A0_277 or A1_278
  return L2_279
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_280)
  local L1_281
  L1_281 = not A0_280
  return L1_281
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_282)
  return math.abs(A0_282)
end
MO_ABS = L0_0
function L0_0(A0_283, A1_284)
  return math.random(A0_283, A1_284)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_285, A1_286)
  local L2_287, L3_288, L4_289, L5_290
  L2_287 = GetMathNumber
  L3_288 = A0_285
  L4_289 = A1_286.Src1VarTable
  L5_290 = A1_286.Src1Var
  L2_287 = L2_287(L3_288, L4_289, L5_290, A1_286.Src1Value)
  L3_288 = GetMathNumber
  L4_289 = A0_285
  L5_290 = A1_286.Src2VarTable
  L3_288 = L3_288(L4_289, L5_290, A1_286.Src2Var, A1_286.Src2Value)
  L4_289 = GetTable
  L5_290 = A0_285
  L4_289 = L4_289(L5_290, A1_286.DestVarTable)
  L5_290 = A1_286.MathOp
  L5_290 = L5_290(L2_287, L3_288)
  SetVarInTable(A0_285, A1_286, L5_290)
end
BBMath = L0_0
function L0_0(A0_291, A1_292, A2_293, A3_294)
  if A2_293 ~= nil and GetTable(A0_291, A1_292)[A2_293] ~= nil then
    return GetTable(A0_291, A1_292)[A2_293]
  end
  return A3_294
end
GetMathNumber = L0_0
function L0_0(A0_295, A1_296)
  if type(A1_296) == "number" then
    return A1_296
  elseif type(A1_296) == "function" then
    return A1_296(A0_295)
  elseif type(A1_296) == "string" then
    return A0_295[A1_296]
  end
end
GetNumber = L0_0
function L0_0(A0_297, A1_298)
  return VectorAdd(A0_297, A1_298)
end
VEC_ADD = L0_0
function L0_0(A0_299, A1_300)
  return VectorSubtract(A0_299, A1_300)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_301, A1_302)
  return VectorScalarMultiply(A0_301, A1_302)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_303, A1_304)
  return VectorScalarDivide(A0_303, A1_304)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_305, A1_306)
  return VectorRotateY(A0_305, A1_306)
end
VEC_ROTATE = L0_0
function L0_0(A0_307, A1_308)
  BBMath(A0_307, A1_308)
end
BBVectorMath = L0_0
function L0_0(A0_309, A1_310)
  local L2_311, L3_312, L4_313, L5_314
  L2_311 = A0_309.InstanceVars
  L3_312 = L2_311.InterpDelta
  if L3_312 == nil then
    L3_312 = A1_310.Amount
    L4_313 = A1_310.AmountVar
    if L4_313 ~= nil then
      L4_313 = GetTable
      L5_314 = A0_309
      L4_313 = L4_313(L5_314, A1_310.AmountVarTable)
      L5_314 = A1_310.AmountVar
      L3_312 = L4_313[L5_314]
    end
    L4_313 = GetPosition
    L5_314 = A1_310.TargetVar
    L5_314 = A0_309[L5_314]
    L4_313 = L4_313(L5_314)
    L2_311.KnockBackStart = L4_313
    L4_313 = GetNormalizedPositionDelta
    L5_314 = A1_310.TargetVar
    L5_314 = A0_309[L5_314]
    L4_313 = L4_313(L5_314, A0_309[A1_310.AttackerVar], true)
    L5_314 = {}
    L5_314.x = L4_313.x * L3_312
    L5_314.y = 0
    L5_314.z = L4_313.z * L3_312
    L2_311.InterpDelta = L5_314
    L5_314 = GetTime
    L5_314 = L5_314()
    L2_311.StartTime = L5_314
    L5_314 = A1_310.KnockBackDuration
    L2_311.KnockBackDuration = L5_314
  end
  L3_312 = A1_310.TargetVar
  L3_312 = A0_309[L3_312]
  L4_313 = GetTime
  L4_313 = L4_313()
  L5_314 = L2_311.StartTime
  L4_313 = L4_313 - L5_314
  L5_314 = L2_311.KnockBackDuration
  L4_313 = L4_313 / L5_314
  L5_314 = {}
  L5_314.x = L2_311.KnockBackStart.x + L2_311.InterpDelta.x * L4_313
  L5_314.y = L2_311.KnockBackStart.y
  L5_314.z = L2_311.KnockBackStart.z + L2_311.InterpDelta.z * L4_313
  SetPosition(L3_312, L5_314)
end
BBKnockback = L0_0
function L0_0(A0_315, A1_316)
  local L2_317, L3_318
  L2_317 = GetParam
  L3_318 = "Left"
  L2_317 = L2_317(L3_318, A0_315, A1_316)
  L3_318 = GetParam
  L3_318 = L3_318("Right", A0_315, A1_316)
  GetTable(A0_315, A1_316.DestVarTable, true)[A1_316.DestVar] = tostring(L2_317) .. tostring(L3_318)
end
BBAppendString = L0_0
function L0_0(A0_319, A1_320)
  local L2_321
  L2_321 = 0
  if A1_320.Delta ~= nil then
    L2_321 = L2_321 + A1_320.Delta
  end
  if A1_320.DeltaByLevel ~= nil and A0_319.Level ~= nil then
    L2_321 = L2_321 + A1_320.DeltaByLevel[A0_319.Level]
  end
  if A1_320.DeltaVar ~= nil then
    L2_321 = L2_321 + GetTable(A0_319, A1_320.DeltaVarTable, true)[A1_320.DeltaVar]
  end
  if A1_320.TargetVar ~= nil then
    A1_320.Stat(L2_321, A0_319[A1_320.TargetVar])
  else
    A1_320.Stat(L2_321)
  end
end
BBIncStat = L0_0
function L0_0(A0_322, A1_323)
  local L2_324
  L2_324 = 0
  if A1_323.Delta ~= nil then
    L2_324 = L2_324 + A1_323.Delta
  end
  if A1_323.DeltaByLevel ~= nil and A0_322.Level ~= nil then
    L2_324 = L2_324 + A1_323.DeltaByLevel[A0_322.Level]
  end
  if A1_323.DeltaVar ~= nil then
    L2_324 = L2_324 + GetTable(A0_322, A1_323.DeltaVarTable, true)[A1_323.DeltaVar]
  end
  if A1_323.TargetVar ~= nil then
    A1_323.Stat(L2_324, A0_322[A1_323.TargetVar])
  else
    A1_323.Stat(L2_324)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_325, A1_326)
  local L2_327, L3_328
  L2_327 = A1_326.TargetVar
  L3_328 = 0
  if A1_326.LaneVar ~= nil then
    L3_328 = L3_328 + GetTable(A0_325, A1_326.LaneVarTable, true)[A1_326.LaneVar]
  end
  if A1_326.Lane ~= nil then
    L3_328 = L3_328 + A1_326.Lane
  end
  SetMinionLane(A0_325[L2_327], L3_328)
end
BBSetMinionLane = L0_0
function L0_0(A0_329, A1_330)
  if A1_330.AttackVar ~= nil then
  end
  if A1_330.Attack ~= nil then
  end
  if A1_330.TotalCoefficientVar ~= nil then
  end
  if A1_330.TotalCoefficient ~= nil then
  end
  if A1_330.TargetVar ~= nil then
    GetTable(A0_329, A1_330.DestVarTable, false)[A1_330.DestVar] = (0 + GetTable(A0_329, A1_330.AttackVarTable, true)[A1_330.AttackVar] + A1_330.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_329[A1_330.TargetVar])) + GetFlatCritDamageMod(A0_329[A1_330.TargetVar])) * (0 + GetTable(A0_329, A1_330.TotalCoefficientVarTable, true)[A1_330.TotalCoefficientVar] + A1_330.TotalCoefficient)
  else
    GetTable(A0_329, A1_330.DestVarTable, false)[A1_330.DestVar] = 2 * A1_330.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_331, A1_332)
  local L2_333, L3_334, L4_335, L5_336, L6_337, L7_338
  L2_333 = GetTable
  L3_334 = A0_331
  L4_335 = A1_332.DestVarTable
  L5_336 = false
  L2_333 = L2_333(L3_334, L4_335, L5_336)
  L3_334 = GetTable
  L4_335 = A0_331
  L5_336 = A1_332.AmountVarTable
  L6_337 = true
  L3_334 = L3_334(L4_335, L5_336, L6_337)
  L4_335 = GetTable
  L5_336 = A0_331
  L6_337 = A0_331.NextBuffVars
  L7_338 = false
  L4_335 = L4_335(L5_336, L6_337, L7_338)
  L5_336 = A1_332.AmountVar
  L5_336 = L3_334[L5_336]
  L6_337 = A1_332.Amount
  L5_336 = L5_336 + L6_337
  L4_335.InitializeShield_Amount = L5_336
  L5_336 = A1_332.AmountVar
  if L5_336 ~= nil then
    L5_336 = A1_332.HealShieldMod
    if L5_336 ~= nil and L5_336 == true then
      L6_337 = A1_332.AttackerVar
      L7_338 = 0
      if L6_337 ~= nil then
        L7_338 = GetPercentHealingAmountMod(A0_331[L6_337])
      end
      L4_335.InitializeShield_Amount, L3_334[A1_332.AmountVar] = (A1_332.Amount + L3_334[A1_332.AmountVar]) * (1 + L7_338), (A1_332.Amount + L3_334[A1_332.AmountVar]) * (1 + L7_338)
    end
  end
  L5_336 = SpellBuffAddNoRenew
  L6_337 = A1_332.AttackerVar
  L6_337 = A0_331[L6_337]
  L7_338 = A1_332.UnitVar
  L7_338 = A0_331[L7_338]
  L5_336(L6_337, L7_338, "InitializeShieldMarker", 0, 1, 25000, L4_335)
  L5_336 = BBIncreaseShield
  L6_337 = A0_331
  L7_338 = A1_332
  L5_336(L6_337, L7_338)
end
BBInitializeShield = L0_0
function L0_0(A0_339, A1_340)
  if A1_340.CDVar ~= nil then
  end
  if A1_340.CD ~= nil then
  end
  if A1_340.TargetVar ~= nil then
    GetTable(A0_339, A1_340.DestVarTable, false)[A1_340.DestVar] = (0 + GetTable(A0_339, A1_340.CDVarTable, true)[A1_340.CDVar] + A1_340.CD) * (1 + GetPercentCooldownMod(A0_339[A1_340.TargetVar]))
  else
    GetTable(A0_339, A1_340.DestVarTable, false)[A1_340.DestVar] = A1_340.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_341, A1_342)
  local L2_343, L3_344
  L3_344 = A1_342.TargetVar
  if L3_344 ~= nil then
    L2_343 = A1_342.Stat(A0_341[L3_344])
  else
    L2_343 = A1_342.Stat()
  end
  SetVarInTable(A0_341, A1_342, L2_343)
end
BBGetStat = L0_0
function L0_0(A0_345, A1_346)
  if A1_346.TargetVar ~= nil then
    GetTable(A0_345, A1_346.DestVarTable, false)[A1_346.DestVar] = GetLevel(A0_345[A1_346.TargetVar])
  else
    GetTable(A0_345, A1_346.DestVarTable, false)[A1_346.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_347, A1_348)
  if A1_348.TargetVar ~= nil then
    GetTable(A0_347, A1_348.DestVarTable, false)[A1_348.DestVar] = GetUnitSignificance(A0_347[A1_348.TargetVar])
  else
    GetTable(A0_347, A1_348.DestVarTable, false)[A1_348.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_349, A1_350)
  if A1_350.TargetVar ~= nil then
    GetTable(A0_349, A1_350.DestVarTable, false)[A1_350.DestVar] = GetArmor(A0_349[A1_350.TargetVar])
  else
    GetTable(A0_349, A1_350.DestVarTable, false)[A1_350.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_351, A1_352)
  if A1_352.TargetVar ~= nil then
    GetTable(A0_351, A1_352.DestVarTable, false)[A1_352.DestVar] = GetSpellBlock(A0_351[A1_352.TargetVar])
  else
    GetTable(A0_351, A1_352.DestVarTable, false)[A1_352.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_353, A1_354)
  local L2_355, L3_356
  L3_356 = A1_354.TargetVar
  if L3_356 ~= nil then
    L2_355 = GetTeamID(A0_353[L3_356])
  else
    L2_355 = GetTeamID()
  end
  SetVarInTable(A0_353, A1_354, L2_355)
end
BBGetTeamID = L0_0
function L0_0(A0_357, A1_358)
  local L2_359, L3_360, L4_361
  L2_359 = GetTable
  L3_360 = A0_357
  L4_361 = A1_358.DestVarTable
  L2_359 = L2_359(L3_360, L4_361, false)
  L3_360 = A1_358.TargetVar
  L4_361 = nil
  if L3_360 ~= nil then
    L4_361 = GetTeamID(A0_357[L3_360])
  else
    L4_361 = GetTeamID()
  end
  if L4_361 == TEAM_ORDER then
    L2_359[A1_358.DestVar] = TEAM_CHAOS
  elseif L4_361 == TEAM_CHAOS then
    L2_359[A1_358.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_362, A1_363)
  if A1_363.TargetVar ~= nil then
    GetTable(A0_362, A1_363.DestVarTable, false)[A1_363.DestVar] = GetUnitSkinName(A0_362[A1_363.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_364, A1_365)
  local L2_366, L3_367, L4_368
  L2_366 = GetTable
  L3_367 = A0_364
  L4_368 = A1_365.DestVarTable
  L2_366 = L2_366(L3_367, L4_368, false)
  L3_367 = A0_364.Owner
  L4_368 = nil
  if A1_365.TargetVar ~= nil then
    L4_368 = GetTotalAttackDamage(A0_364[A1_365.TargetVar])
  else
    L4_368 = GetTotalAttackDamage()
  end
  SetVarInTable(A0_364, A1_365, L4_368)
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_369, A1_370)
  GetTable(A0_369, A1_370.DestVarTable, true)[A1_370.DestVar] = A1_370.Status(A0_369[A1_370.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_371, A1_372)
  local L2_373
  L2_373 = A1_372.TargetVar
  L2_373 = A0_371[L2_373]
  ClearAttackTarget(L2_373)
end
BBClearAttackTarget = L0_0
function L0_0(A0_374, A1_375)
  local L2_376, L3_377
  L2_376 = GetTable
  L3_377 = A0_374
  L2_376 = L2_376(L3_377, A1_375.DestVarTable, true)
  L3_377 = A1_375.Info
  L3_377 = L3_377(A0_374[A1_375.TargetVar])
  SetVarInTable(A0_374, A1_375, L3_377)
end
BBGetCastInfo = L0_0
function L0_0(A0_378, A1_379, A2_380)
  local L3_381, L4_382, L5_383, L6_384
  L3_381 = GetTable
  L4_382 = A0_378
  L5_383 = A1_379.TrackTimeVarTable
  L6_384 = false
  L3_381 = L3_381(L4_382, L5_383, L6_384)
  L4_382 = GetTime
  L4_382 = L4_382()
  L5_383 = A1_379.ExecuteImmediately
  L6_384 = GetParam
  L6_384 = L6_384("TimeBetweenExecutions", A0_378, A1_379)
  if A1_379.TickTimeVar ~= nil and GetTable(A0_378, A1_379.TickTimeVarTable, false)[A1_379.TickTimeVar] ~= nil then
    L6_384 = GetTable(A0_378, A1_379.TickTimeVarTable, false)[A1_379.TickTimeVar]
  end
  if L3_381[A1_379.TrackTimeVar] == nil then
    L3_381[A1_379.TrackTimeVar] = L4_382
    if L5_383 == true then
      ExecuteBuildingBlocks(A2_380, A0_378)
    end
  end
  if L4_382 >= L3_381[A1_379.TrackTimeVar] + L6_384 then
    L3_381[A1_379.TrackTimeVar] = L3_381[A1_379.TrackTimeVar] + L6_384
    ExecuteBuildingBlocks(A2_380, A0_378)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_385, A1_386, A2_387)
  GetTable(A0_385, A1_386.TrackTimeVarTable, false)[A1_386.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_388, A1_389)
  local L2_390
  L2_390 = A1_389.SrcValue
  if A1_389.SrcVar ~= nil then
    L2_390 = GetTable(A0_388, A1_389.SrcVarTable, true)[A1_389.SrcVar]
  end
  A1_389.Status(A0_388[A1_389.TargetVar], L2_390)
end
BBSetStatus = L0_0
function L0_0(A0_391, A1_392)
  local L2_393
  L2_393 = A1_392.ToAlert
  if GetTable(A0_391, A1_392.SrcVarTable, false) ~= nil and A1_392.SrcVar ~= nil then
    L2_393 = L2_393 .. GetTable(A0_391, A1_392.SrcVarTable, false)[A1_392.SrcVar]
  end
  _ALERT(L2_393)
end
BBAlert = L0_0
function L0_0(A0_394, A1_395)
  local L2_396, L3_397, L4_398, L5_399, L6_400, L7_401
  L2_396 = GetParam
  L3_397 = "Message"
  L4_398 = A0_394
  L5_399 = A1_395
  L2_396 = L2_396(L3_397, L4_398, L5_399)
  if L2_396 == nil then
    L3_397 = ReportError
    L4_398 = "Could not resolve Message param"
    L3_397(L4_398)
    return
  end
  L3_397 = true
  L4_398 = GetParam
  L5_399 = "OnUnit"
  L6_400 = A0_394
  L7_401 = A1_395
  L4_398 = L4_398(L5_399, L6_400, L7_401)
  if L4_398 == nil then
    L3_397 = false
    L5_399 = GetParam
    L6_400 = "OnUnitByFlag"
    L7_401 = A0_394
    L5_399 = L5_399(L6_400, L7_401, A1_395)
    L4_398 = L5_399
  end
  if L4_398 == nil then
    L5_399 = ReportError
    L6_400 = "Could not resolve OnUnit param"
    L5_399(L6_400)
    return
  end
  L5_399 = true
  L6_400 = GetParam
  L7_401 = "ChampionToSayTo"
  L6_400 = L6_400(L7_401, A0_394, A1_395)
  if L6_400 == nil then
    L5_399 = false
    L7_401 = GetParam
    L7_401 = L7_401("ChampionToSayToByFlag", A0_394, A1_395)
    L6_400 = L7_401
  end
  if L6_400 == nil then
    L7_401 = ReportError
    L7_401("Could not resolve ChampionToSayTo param")
    return
  end
  L7_401 = GetParam
  L7_401 = L7_401("ShowToSpectator", A0_394, A1_395)
  if L7_401 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  SayWithFloatingTextOnUnitToChampion(tostring(L2_396), A1_395.TextType, L4_398, L3_397, L6_400, L5_399, L7_401)
end
BBSayWithFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_402, A1_403)
  local L2_404, L3_405, L4_406
  L2_404 = A1_403.ToSay
  L3_405 = GetTable
  L4_406 = A0_402
  L3_405 = L3_405(L4_406, A1_403.SrcVarTable, false)
  if L3_405 ~= nil then
    L4_406 = A1_403.SrcVar
    if L4_406 ~= nil then
      L4_406 = L2_404
      L2_404 = L4_406 .. tostring(L3_405[A1_403.SrcVar])
    end
  end
  L4_406 = nil
  if A1_403.OwnerVar ~= nil then
    L4_406 = A0_402[A1_403.OwnerVar]
  else
    L4_406 = A0_402.Owner
  end
  if A1_403.TextType == nil then
    A1_403.TextType = 0
  end
  Say(L4_406, L2_404, A1_403.TextType)
end
BBSay = L0_0
function L0_0(A0_407, A1_408)
  local L2_409, L3_410, L4_411
  L2_409 = A1_408.ToSay
  L3_410 = GetTable
  L4_411 = A0_407
  L3_410 = L3_410(L4_411, A1_408.SrcVarTable, false)
  if L3_410 ~= nil then
    L4_411 = A1_408.SrcVar
    if L4_411 ~= nil then
      L4_411 = L2_409
      L2_409 = L4_411 .. tostring(L3_410[A1_408.SrcVar])
    end
  end
  L4_411 = nil
  if A1_408.OwnerVar ~= nil then
    L4_411 = A0_407[A1_408.OwnerVar]
  else
    L4_411 = A0_407.Owner
  end
  if A1_408.TextType == nil then
    A1_408.TextType = 0
  end
  Say(L4_411, L2_409, A1_408.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_412, A1_413)
  GetTable(A0_412, A1_413.DestVarTable, true)[A1_413.DestVar] = BBLuaGetGold(A0_412, A1_413)
end
BBGetGold = L0_0
function L0_0(A0_414, A1_415)
  GetTable(A0_414, A1_415.DestVarTable, true)[A1_415.DestVar] = BBLuaGetTotalGold(A0_414, A1_415)
end
BBGetTotalGold = L0_0
function L0_0(A0_416, A1_417)
  SpellBuffAdd(A0_416[A1_417.OwnerVar], A0_416[A1_417.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_416.NextBuffVars)
  BBTeleportToPositionHelper(A0_416, A1_417)
end
BBTeleportToPosition = L0_0
function L0_0(A0_418, A1_419)
  if A1_419.XVar ~= nil and GetTable(A0_418, A1_419.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_418, A1_419.XVarTable, true)[A1_419.XVar]
  else
    Xloc = A1_419.X
  end
  if A1_419.YVar ~= nil and GetTable(A0_418, A1_419.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_418, A1_419.YVarTable, true)[A1_419.YVar]
  else
    Yloc = A1_419.Y
  end
  if A1_419.ZVar ~= nil and GetTable(A0_418, A1_419.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_418, A1_419.ZVarTable, true)[A1_419.ZVar]
  else
    Zloc = A1_419.Z
  end
  A1_419.OwnerVar, A0_418.position = A1_419.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_419.CastPositionName = "position"
  BBTeleportToPosition(A0_418, A1_419)
end
BBTeleportToPoint = L0_0
function L0_0(A0_420, A1_421)
  DefUpdateAura(GetTable(A0_420, A1_421.CenterTable, false)[A1_421.CenterVar], A1_421.Range, A1_421.UnitScan, A1_421.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_422, A1_423)
  ReincarnateNonDeadHero(GetTable(A0_422, A1_423.TargetTable, false)[A1_423.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_424, A1_425)
  GetTable(A0_424, A1_425.DestVarTable, true)[A1_425.DestVar] = A1_425.Function(A0_424[A1_425.OwnerVar], A1_425.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_426, A1_427)
  local L2_428, L3_429, L4_430, L5_431
  L2_428 = A1_427.WhomToOrderVar
  L2_428 = A0_426[L2_428]
  L3_429 = A1_427.TargetOfOrderVar
  L3_429 = A0_426[L3_429]
  L4_430 = GetTable
  L5_431 = A0_426
  L4_430 = L4_430(L5_431, A1_427.SrcVarTable, false)
  L5_431 = nil
  if A1_427.SrcVar ~= nil and L4_430 ~= nil then
    L5_431 = L4_430[A1_427.SrcVar]
  else
    L5_431 = GetPosition(L3_429)
  end
  if L3_429 == nil then
    L3_429 = L2_428
  end
  IssueOrder(L2_428, A1_427.Order, L5_431, L3_429)
end
BBIssueOrder = L0_0
function L0_0(A0_432, A1_433)
  local L2_434
  L2_434 = GetParam
  L2_434 = L2_434("NewRange", A0_432, A1_433)
  SetSpellCastRange(L2_434)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_435, A1_436)
  GetTable(A0_435, A1_436.DestVarTable, true)[A1_436.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_437, A1_438)
  local L2_439, L3_440
  L2_439 = A1_438.ObjectVar1
  L2_439 = A0_437[L2_439]
  L3_440 = A1_438.ObjectVar2
  L3_440 = A0_437[L3_440]
  GetTable(A0_437, A1_438.DestVarTable, true)[A1_438.DestVar] = DistanceBetweenObjectBounds(L2_439, L3_440)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_441, A1_442)
  local L2_443, L3_444, L4_445
  L2_443 = A1_442.ObjectVar
  L2_443 = A0_441[L2_443]
  L3_444 = GetTable
  L4_445 = A0_441
  L3_444 = L3_444(L4_445, A1_442.PointVarTable, true)
  L4_445 = A1_442.PointVar
  L4_445 = L3_444[L4_445]
  GetTable(A0_441, A1_442.DestVarTable, true)[A1_442.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_443, L4_445)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_446, A1_447)
  local L2_448, L3_449
  L2_448 = GetParam
  L3_449 = "Point1"
  L2_448 = L2_448(L3_449, A0_446, A1_447)
  L3_449 = GetParam
  L3_449 = L3_449("Point2", A0_446, A1_447)
  GetTable(A0_446, A1_447.DestVarTable, true)[A1_447.DestVar] = DistanceBetweenPoints(L2_448, L3_449)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_450, A1_451, A2_452)
  local L3_453, L4_454, L5_455, L6_456, L7_457, L8_458
  L5_455 = 0
  L6_456 = nil
  L7_457 = A1_451.ObjectDistanceType
  L8_458 = A1_451.ObjectVar1
  L3_453 = A0_450[L8_458]
  L8_458 = A1_451.ObjectVar2
  L4_454 = A0_450[L8_458]
  if nil == L4_454 then
    L8_458 = A1_451.Point2Var
    if nil ~= L8_458 then
      L8_458 = GetTable
      L8_458 = L8_458(A0_450, A1_451.Point2VarTable, true)
      L4_454 = L8_458[A1_451.Point2Var]
      L5_455 = L5_455 + 1
    end
  end
  if nil == L3_453 then
    L8_458 = A1_451.Point1Var
    if nil ~= L8_458 then
      L8_458 = GetTable
      L8_458 = L8_458(A0_450, A1_451.Point1VarTable, true)
      L3_453 = L8_458[A1_451.Point1Var]
      L5_455 = L5_455 + 1
      if 1 == L5_455 then
        L3_453, L4_454 = L4_454, L3_453
      end
    end
  end
  if nil ~= L7_457 then
    if 0 == L5_455 then
      L8_458 = OBJECT_CENTER
      if L8_458 == L7_457 then
        L6_456 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_458 = OBJECT_BOUNDARY
        if L8_458 == L7_457 then
          L6_456 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_458 = A1_451.OwnerVar
          L8_458 = A0_450[L8_458]
          Say(L8_458, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_455 then
      L8_458 = OBJECT_CENTER
      if L8_458 == L7_457 then
        L6_456 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_458 = OBJECT_BOUNDARY
        if L8_458 == L7_457 then
          L6_456 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_458 = A1_451.OwnerVar
          L8_458 = A0_450[L8_458]
          Say(L8_458, "invalid object distance type", 0)
        end
      end
    else
      L6_456 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_458 = A1_451.Distance
  if A1_451.DistanceVar ~= nil and GetTable(A0_450, A1_451.DistanceVarTable, true) ~= nil then
    L8_458 = L8_458 + GetTable(A0_450, A1_451.DistanceVarTable, true)[A1_451.DistanceVar]
  end
  if L3_453 ~= nil and L4_454 ~= nil and L6_456 ~= nil and L8_458 ~= nil then
    if not L6_456(L3_453, L4_454, L8_458) then
      ExecuteBuildingBlocks(A2_452, A0_450)
      A0_450.LastIfSucceeded = true
    else
      A0_450.LastIfSucceeded = false
    end
  else
    A0_450.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_459, A1_460)
  local L2_461, L3_462
  L2_461 = A1_460.TargetVar
  L2_461 = A0_459[L2_461]
  L3_462 = A1_460.CasterVar
  L3_462 = A0_459[L3_462]
  GetTable(A0_459, A1_460.DestVarTable, true)[A1_460.DestVar] = SpellBuffCount(L2_461, A1_460.BuffName, L3_462)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_463, A1_464)
  local L2_465
  L2_465 = A1_464.TargetVar
  L2_465 = A0_463[L2_465]
  GetTable(A0_463, A1_464.DestVarTable, true)[A1_464.DestVar] = SpellBuffCount(L2_465, A1_464.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_466, A1_467)
  local L2_468, L3_469
  L2_468 = GetTable
  L3_469 = A0_466
  L2_468 = L2_468(L3_469, A1_467.ScaleVarTable, false)
  L3_469 = nil
  if A1_467.OwnerVar ~= nil then
    L3_469 = A0_466[A1_467.OwnerVar]
  else
    L3_469 = A0_466.Owner
  end
  if A1_467.ScaleVar ~= nil and A1_467.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_468[A1_467.ScaleVar], L3_469)
  else
    SetScaleSkinCoef(A1_467.Scale, L3_469)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_470, A1_471)
  SpellBuffAdd(A0_470[A1_471.TargetVar], A0_470[A1_471.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_470.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_472, A1_473, A2_474)
  local L3_475, L4_476
  L3_475 = A1_473.TargetVar
  L3_475 = A0_472[L3_475]
  L4_476 = A1_473.NumStacks
  if GetParam("NumStacks", A0_472, A1_473) == 0 then
    L4_476 = SpellBuffCount(L3_475, A1_473.BuffName, caster)
  else
    L4_476 = GetParam("NumStacks", A0_472, A1_473)
  end
  while L4_476 > 0 do
    SpellBuffRemove(L3_475, A1_473.BuffName, A0_472[A1_473.AttackerVar])
    L4_476 = L4_476 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_477, A1_478, A2_479)
  if A0_477.EmoteId == A1_478.EmoteId then
    ExecuteBuildingBlocks(A2_479, A0_477)
    A0_477.LastIfSucceeded = true
  else
    A0_477.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_480, A1_481, A2_482)
  if A0_480.EmoteId ~= A1_481.EmoteId then
    ExecuteBuildingBlocks(A2_482, A0_480)
    A0_480.LastIfSucceeded = true
  else
    A0_480.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_483, A1_484)
  local L2_485, L3_486, L4_487, L5_488
  L2_485 = GetTable
  L3_486 = A0_483
  L4_487 = A1_484.String1VarTable
  L5_488 = false
  L2_485 = L2_485(L3_486, L4_487, L5_488)
  L3_486 = A1_484.String1Var
  L3_486 = L2_485[L3_486]
  L4_487 = GetTable
  L5_488 = A0_483
  L4_487 = L4_487(L5_488, A1_484.String2VarTable, false)
  L5_488 = A1_484.String2Var
  L5_488 = L4_487[L5_488]
  GetTable(A0_483, A1_484.ResultVarTable, false)[A1_484.ResultVar] = L3_486 .. L5_488
end
BBConcatenateStrings = L0_0
function L0_0(A0_489, A1_490)
  BBGetMinionKills(A0_489, A1_490)
  A0_489.MinionKillSource = GetParam("MinionKillTarget")
  A0_489.MinionKills = A0_489.MinionsKilled + GetParam("MinionKills", A0_489, A1_490)
  BBSetMinionKills(A0_489, A1_490)
end
BBIncreaseMinionKills = L0_0
