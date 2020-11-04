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
  L6_35 = L6_35 .. L2_31
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
function L0_0(A0_54, A1_55, A2_56)
  local L3_57
  if A1_55 ~= nil then
    L3_57 = A0_54[A1_55]
    if L3_57 == nil and A2_56 then
      A0_54[A1_55] = {}
      return A0_54[A1_55]
    end
  end
  if L3_57 == nil then
    L3_57 = A0_54
  end
  return L3_57
end
GetTable = L0_0
function L0_0(A0_58, A1_59, A2_60)
  if A2_60[A0_58 .. "Var"] ~= nil and GetTable(A1_59, A2_60[A0_58 .. "VarTable"], false) ~= nil then
    return GetTable(A1_59, A2_60[A0_58 .. "VarTable"], false)[A2_60[A0_58 .. "Var"]]
  else
    return A2_60[A0_58]
  end
end
GetParam = L0_0
function L0_0(A0_61, A1_62)
  GetTable(A0_61, A1_62.DestVarTable, true)[A1_62.DestVar] = {}
end
BBCreateCustomTable = L0_0
function L0_0(A0_63, A1_64)
  GetTable(A0_63, A1_64.TableNameVarTable, false)[A1_64.TableNameVar] = nil
end
BBDestroyCustomTable = L0_0
function L0_0(A0_65, A1_66)
  if type(GetTable(A0_65, A1_66.DestTableVarTable, false)[A1_66.DestTableVar]) == "nil" then
    GetTable(A0_65, A1_66.DestTableVarTable, false)[A1_66.DestTableVar] = {}
  end
  if type(GetTable(A0_65, A1_66.DestTableVarTable, false)[A1_66.DestTableVar]) == "table" then
    GetTable(A0_65, A1_66.DestTableVarTable, false)[A1_66.DestTableVar][GetParam("Key", A0_65, A1_66)] = GetParam("Value", A0_65, A1_66)
  end
end
BBSetKeyValueInCustomTable = L0_0
function L0_0(A0_67, A1_68)
  if type(GetTable(A0_67, A1_68.SrcTableVarTable, false)[A1_68.SrcTableVar]) == "table" then
    GetTable(A0_67, A1_68.DestVarTable, true)[A1_68.DestVar] = GetTable(A0_67, A1_68.SrcTableVarTable, false)[A1_68.SrcTableVar][GetParam("SrcKey", A0_67, A1_68)]
  end
end
BBGetKeyValueInCustomTable = L0_0
function L0_0(A0_69, A1_70)
  local L2_71, L3_72, L4_73
  L2_71 = GetTable
  L3_72 = A0_69
  L4_73 = A1_70.DestTableVarTable
  L2_71 = L2_71(L3_72, L4_73, false)
  L3_72 = GetParam
  L4_73 = "DestIndex"
  L3_72 = L3_72(L4_73, A0_69, A1_70)
  L4_73 = GetParam
  L4_73 = L4_73("Value", A0_69, A1_70)
  if type(L2_71[A1_70.DestTableVar]) == "nil" then
    L2_71[A1_70.DestTableVar] = {}
  end
  if type(L2_71[A1_70.DestTableVar]) == "table" then
    if L3_72 then
      table.insert(L2_71[A1_70.DestTableVar], L3_72, L4_73)
      if A1_70.OutIndexVar then
        GetTable(A0_69, A1_70.OutIndexVarTable, true)[A1_70.OutIndexVar] = L3_72
      end
    else
      table.insert(L2_71[A1_70.DestTableVar], L4_73)
      if A1_70.OutIndexVar then
        GetTable(A0_69, A1_70.OutIndexVarTable, true)[A1_70.OutIndexVar] = table.getn(L2_71[A1_70.DestTableVar])
      end
    end
  end
end
BBInsertIntoInCustomTable = L0_0
function L0_0(A0_74, A1_75)
  local L2_76, L3_77
  L2_76 = GetTable
  L3_77 = A0_74
  L2_76 = L2_76(L3_77, A1_75.TableVarTable, false)
  L3_77 = GetParam
  L3_77 = L3_77("Index", A0_74, A1_75)
  if type(L2_76[A1_75.TableVar]) == "nil" then
    ClientPrint("Table specified does not exist: " .. tostring(A1_75.TableVarTable) .. "." .. tostring(A1_75.TableVar))
    return
  end
  if type(L2_76[A1_75.TableVar]) == "table" then
    if L3_77 then
      table.remove(L2_76[A1_75.TableVar], L3_77, valueData)
    else
      ClientPrint("Specified index was nil: " .. tostring(A1_75.IndexVarTable) .. "." .. tostring(A1_75.IndexVar))
    end
  end
end
BBRemoveFromCustomTable = L0_0
function L0_0(A0_78, A1_79, A2_80)
  local L3_81, L4_82, L5_83, L6_84, L7_85, L8_86
  L3_81 = GetTable
  L3_81 = L3_81(L4_82, L5_83, L6_84)
  if L4_82 == "table" then
    if L4_82 then
      for L8_86, _FORV_9_ in L5_83(L6_84) do
        table.insert(L4_82, L8_86)
      end
      L5_83(L6_84)
      for L8_86, _FORV_9_ in L5_83(L6_84) do
        GetTable(A0_78, A1_79.DestKeyVarTable, true)[A1_79.DestKeyVar] = _FORV_9_
        GetTable(A0_78, A1_79.DestValueVarTable, true)[A1_79.DestValueVar] = L3_81[A1_79.TableVar][_FORV_9_]
        ExecuteBuildingBlocks(A2_80, A0_78)
      end
    else
      for L7_85, L8_86 in L4_82(L5_83) do
        GetTable(A0_78, A1_79.DestKeyVarTable, true)[A1_79.DestKeyVar] = L7_85
        GetTable(A0_78, A1_79.DestValueVarTable, true)[A1_79.DestValueVar] = L8_86
        ExecuteBuildingBlocks(A2_80, A0_78)
      end
    end
  end
end
BBForEachInCustomTable = L0_0
function L0_0(A0_87, A1_88)
  local L2_89, L3_90, L4_91, L5_92, L6_93
  L2_89 = GetTable
  L3_90 = A0_87
  L4_91 = A1_88.SrcTableVarTable
  L5_92 = false
  L2_89 = L2_89(L3_90, L4_91, L5_92)
  L3_90 = GetParam
  L4_91 = "Value"
  L5_92 = A0_87
  L6_93 = A1_88
  L3_90 = L3_90(L4_91, L5_92, L6_93)
  L4_91 = GetTable
  L5_92 = A0_87
  L6_93 = A1_88.MatchingKeyVarTable
  L4_91 = L4_91(L5_92, L6_93, false)
  L5_92 = GetTable
  L6_93 = A0_87
  L5_92 = L5_92(L6_93, A1_88.WasFoundVarTable, false)
  L6_93 = A1_88.WasFoundVar
  L5_92[L6_93] = false
  L6_93 = type
  L6_93 = L6_93(L2_89[A1_88.SrcTableVar])
  if L6_93 == "table" then
    L6_93 = GetTable
    L6_93 = L6_93(A0_87, A1_88.DestVarTable, true)
    for _FORV_10_, _FORV_11_ in pairs(L6_93) do
      if _FORV_11_ == L3_90 then
        L5_92[A1_88.WasFoundVar] = true
        L4_91[A1_88.MatchingKeyVar] = _FORV_10_
      end
    end
  end
end
BBCustomTableContainsValue = L0_0
function L0_0(A0_94, A1_95, A2_96)
  for _FORV_9_, _FORV_10_ in pairs(GetTable(A0_94, A1_95.TableVarTable, false)[A1_95.TableVar]) do
  end
  GetTable(A0_94, A1_95.SizeVarTable, false)[A1_95.SizeVar] = 0 + 1
end
BBGetSizeOfCustomTable = L0_0
function L0_0(A0_97, A1_98)
  local L2_99, L3_100
  L2_99 = GetTable
  L3_100 = A0_97
  L2_99 = L2_99(L3_100, A1_98.DestVarTable, true)
  L3_100 = nil
  if A1_98.SpellSlotVar ~= nil and GetTable(A0_97, A1_98.SpellSlotVarTable, false) ~= nil then
    L3_100 = GetTable(A0_97, A1_98.SpellSlotVarTable, false)[A1_98.SpellSlotVar]
  else
    L3_100 = A1_98.SpellSlotValue
  end
  L2_99[A1_98.DestVar] = A1_98.Function(A0_97[A1_98.OwnerVar], L3_100, A1_98.SpellbookType, A1_98.SlotType)
end
BBGetSlotSpellInfo = L0_0
function L0_0(A0_101, A1_102)
  local L2_103, L3_104, L4_105
  L2_103 = GetTable
  L3_104 = A0_101
  L4_105 = A1_102.SrcVarTable
  L2_103 = L2_103(L3_104, L4_105, false)
  L3_104 = nil
  L4_105 = A1_102.SrcVar
  if L4_105 ~= nil and L2_103 ~= nil then
    L4_105 = A1_102.SrcVar
    L3_104 = L2_103[L4_105]
  else
    L3_104 = A1_102.SrcValue
  end
  L4_105 = nil
  if A1_102.SpellSlotVar ~= nil and GetTable(A0_101, A1_102.SpellSlotVarTable, false) ~= nil then
    L4_105 = GetTable(A0_101, A1_102.SpellSlotVarTable, false)[A1_102.SpellSlotVar]
  else
    L4_105 = A1_102.SpellSlotValue
  end
  SetSlotSpellCooldownTime(A0_101[A1_102.OwnerVar], L4_105, A1_102.SpellbookType, A1_102.SlotType, L3_104)
end
BBSetSlotSpellCooldownTime = L0_0
function L0_0(A0_106, A1_107)
  if A0_106.Level ~= nil and A1_107.SrcValueByLevel ~= nil then
    A0_106.ReturnValue = A1_107.SrcValueByLevel[A0_106.Level]
  elseif A1_107.SrcVar ~= nil and GetTable(A0_106, A1_107.SrcVarTable, false) ~= nil then
    A0_106.ReturnValue = GetTable(A0_106, A1_107.SrcVarTable, false)[A1_107.SrcVar]
  else
    A0_106.ReturnValue = A1_107.SrcValue
  end
end
BBSetReturnValue = L0_0
function L0_0(A0_108, A1_109)
  if type(A0_108) == "string" and type(A1_109) == "string" then
    A0_108 = string.lower(A0_108)
    A1_109 = string.lower(A1_109)
  end
  return A0_108 == A1_109
end
CO_EQUAL = L0_0
function L0_0(A0_110, A1_111)
  if type(A0_110) == "string" and type(A1_111) == "string" then
    A0_110 = string.lower(A0_110)
    A1_111 = string.lower(A1_111)
  end
  return A0_110 ~= A1_111
end
CO_NOT_EQUAL = L0_0
function L0_0(A0_112, A1_113)
  local L2_114
  L2_114 = A0_112 < A1_113
  return L2_114
end
CO_LESS_THAN = L0_0
function L0_0(A0_115, A1_116)
  local L2_117
  L2_117 = A1_116 < A0_115
  return L2_117
end
CO_GREATER_THAN = L0_0
function L0_0(A0_118, A1_119)
  local L2_120
  L2_120 = A0_118 <= A1_119
  return L2_120
end
CO_LESS_THAN_OR_EQUAL = L0_0
function L0_0(A0_121, A1_122)
  local L2_123
  L2_123 = A1_122 <= A0_121
  return L2_123
end
CO_GREATER_THAN_OR_EQUAL = L0_0
function L0_0(A0_124, A1_125)
  return GetTeamID(A0_124) == GetTeamID(A1_125)
end
CO_SAME_TEAM = L0_0
function L0_0(A0_126, A1_127)
  return GetTeamID(A0_126) ~= GetTeamID(A1_127)
end
CO_DIFFERENT_TEAM = L0_0
function L0_0(A0_128, A1_129)
  return GetSourceType() == A1_129 or GetSourceType() == A0_128
end
CO_DAMAGE_SOURCETYPE_IS = L0_0
function L0_0(A0_130, A1_131)
  return GetSourceType() ~= A1_131 and GetSourceType() ~= A0_130
end
CO_DAMAGE_SOURCETYPE_IS_NOT = L0_0
function L0_0(A0_132)
  return IsObjectAI(A0_132)
end
CO_IS_TYPE_AI = L0_0
function L0_0(A0_133)
  return IsObjectAI(A0_133) ~= true
end
CO_IS_NOT_AI = L0_0
function L0_0(A0_134)
  return IsObjectHero(A0_134)
end
CO_IS_TYPE_HERO = L0_0
function L0_0(A0_135)
  return IsObjectHero(A0_135) ~= true
end
CO_IS_NOT_HERO = L0_0
function L0_0(A0_136)
  return IsClone(A0_136)
end
CO_IS_CLONE = L0_0
function L0_0(A0_137)
  return IsClone(A0_137) ~= true
end
CO_IS_NOT_CLONE = L0_0
function L0_0(A0_138)
  return IsMelee(A0_138)
end
CO_IS_MELEE = L0_0
function L0_0(A0_139)
  return IsMelee(A0_139) ~= true
end
CO_IS_RANGED = L0_0
function L0_0(A0_140)
  return A0_140 > math.random()
end
CO_RANDOM_CHANCE_LESS_THAN = L0_0
function L0_0(A0_141)
  return IsTurretAI(A0_141)
end
CO_IS_TYPE_TURRET = L0_0
function L0_0(A0_142)
  return IsTurretAI(A0_142) ~= true
end
CO_IS_NOT_TURRET = L0_0
function L0_0(A0_143)
  return IsDampener(A0_143)
end
CO_IS_TYPE_INHIBITOR = L0_0
function L0_0(A0_144)
  return IsDampener(A0_144) ~= true
end
CO_IS_NOT_INHIBITOR = L0_0
function L0_0(A0_145)
  return IsHQ(A0_145)
end
CO_IS_TYPE_NEXUS = L0_0
function L0_0(A0_146)
  return IsHQ(A0_146) ~= true
end
CO_IS_NOT_NEXUS = L0_0
function L0_0(A0_147)
  return IsDead(A0_147)
end
CO_IS_DEAD = L0_0
function L0_0(A0_148)
  return IsDead(A0_148) ~= true
end
CO_IS_NOT_DEAD = L0_0
function L0_0(A0_149)
  return IsDeadOrZombie(A0_149)
end
CO_IS_DEAD_OR_ZOMBIE = L0_0
function L0_0(A0_150, A1_151)
  return BBIsTargetInFrontOfMe(A0_150, A1_151)
end
CO_IS_TARGET_IN_FRONT_OF_ME = L0_0
function L0_0(A0_152, A1_153)
  return BBIsTargetBehindMe(A0_152, A1_153)
end
CO_IS_TARGET_BEHIND_ME = L0_0
function L0_0(A0_154)
  return IsWard(A0_154)
end
CO_IS_WARD = L0_0
function L0_0(A0_155)
  return IsStructure(A0_155)
end
CO_IS_STRUCTURE = L0_0
function L0_0(A0_156)
  return IsStructure(A0_156) ~= true
end
CO_IS_NOT_STRUCTURE = L0_0
function L0_0(A0_157)
  local L1_158
  L1_158 = A0_157 ~= nil
  return L1_158
end
CO_IS_NOT_NIL = L0_0
function L0_0(A0_159, A1_160, A2_161)
  GetTable(A0_159, A1_160.MacroVarTable, true)[A1_160.MacroVar] = A2_161
end
BBCreateMacro = L0_0
function L0_0(A0_162, A1_163)
  local L2_164
  L2_164 = GetParam
  L2_164 = L2_164("Macro", A0_162, A1_163)
  if L2_164 ~= nil and type(L2_164) == "table" then
    ExecuteBuildingBlocks(L2_164, A0_162)
  else
    ClientPrint("Designer Error: Macro variable is not initialized inside of event. Macro Variable was: " .. tostring(A1_163.MacroVar) .. " and current block data is: " .. gCurrentBuildingBlockString .. ". This error probably occurred due to variable not being initialized yet, being misnamed or two events being called out of sequence. It is highly recommended that script macros either be initialized OnBuffActivate, OnCharActivate or in the same event. Pro Devs may violate this rule at the risk of being forced to read this error message again.")
  end
end
BBRunMacro = L0_0
function L0_0(A0_165, A1_166, A2_167)
  local L3_168, L4_169, L5_170, L6_171
  L3_168 = GetTable
  L4_169 = A0_165
  L5_170 = A1_166.Src1VarTable
  L6_171 = false
  L3_168 = L3_168(L4_169, L5_170, L6_171)
  L4_169 = GetTable
  L5_170 = A0_165
  L6_171 = A1_166.Src2VarTable
  L4_169 = L4_169(L5_170, L6_171, false)
  L5_170 = false
  L6_171 = nil
  if L3_168 ~= nil and A1_166.Src1Var ~= nil then
    L6_171 = L3_168[A1_166.Src1Var]
  else
    L6_171 = A1_166.Value1
  end
  if L4_169 ~= nil and A1_166.Src2Var ~= nil then
    L5_170 = A1_166.CompareOp(L6_171, L4_169[A1_166.Src2Var])
  else
    L5_170 = A1_166.CompareOp(L6_171, A1_166.Value2)
  end
  if L5_170 then
    ExecuteBuildingBlocks(A2_167, A0_165)
    A0_165.LastIfSucceeded = true
  else
    A0_165.LastIfSucceeded = false
  end
end
BBIf = L0_0
function L0_0(A0_172, A1_173, A2_174)
  if A0_172.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_174, A0_172)
    A0_172.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_175, A1_176, A2_177)
  local L3_178, L4_179, L5_180, L6_181
  L3_178 = A0_175.LastIfSucceeded
  if L3_178 == false then
    L3_178 = GetTable
    L4_179 = A0_175
    L5_180 = A1_176.Src1VarTable
    L6_181 = false
    L3_178 = L3_178(L4_179, L5_180, L6_181)
    L4_179 = GetTable
    L5_180 = A0_175
    L6_181 = A1_176.Src2VarTable
    L4_179 = L4_179(L5_180, L6_181, false)
    L5_180 = false
    L6_181 = nil
    if L3_178 ~= nil and A1_176.Src1Var ~= nil then
      L6_181 = L3_178[A1_176.Src1Var]
    else
      L6_181 = A1_176.Value1
    end
    if L4_179 ~= nil and A1_176.Src2Var ~= nil then
      L5_180 = A1_176.CompareOp(L6_181, L4_179[A1_176.Src2Var])
    else
      L5_180 = A1_176.CompareOp(L6_181, A1_176.Value2)
    end
    if L5_180 then
      ExecuteBuildingBlocks(A2_177, A0_175)
      A0_175.LastIfSucceeded = true
    else
      A0_175.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_182, A1_183, A2_184)
  local L3_185
  if A1_183.TargetVar ~= nil then
    L3_185 = A0_182[A1_183.TargetVar]
  else
    L3_185 = A0_182.Target
  end
  if HasBuffOfType(L3_185, A1_183.BuffType) then
    ExecuteBuildingBlocks(A2_184, A0_182)
    A0_182.LastIfSucceeded = true
  else
    A0_182.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_186, A1_187, A2_188)
  local L3_189, L4_190
  if A1_187.OwnerVar ~= nil then
    L3_189 = A0_186[A1_187.OwnerVar]
  else
    L3_189 = A0_186.Owner
  end
  if A1_187.AttackerVar ~= nil then
    L4_190 = A0_186[A1_187.AttackerVar]
  else
    L4_190 = A0_186.Attacker
  end
  if SpellBuffCount(L3_189, A1_187.BuffName, L4_190) > 0 then
    ExecuteBuildingBlocks(A2_188, A0_186)
    A0_186.LastIfSucceeded = true
  else
    A0_186.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_191, A1_192, A2_193)
  if BBIsMissileAutoAttack(A0_191, A1_192) then
    ExecuteBuildingBlocks(A2_193, A0_191)
    A0_191.LastIfSucceeded = true
  else
    A0_191.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_194, A1_195)
  A0_194.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_196, A1_197, A2_198)
  local L3_199, L4_200
  if A1_197.OwnerVar ~= nil then
    L3_199 = A0_196[A1_197.OwnerVar]
  else
    L3_199 = A0_196.Owner
  end
  if A1_197.CasterVar ~= nil then
    L4_200 = A0_196[A1_197.CasterVar]
  else
    L4_200 = A0_196.Caster
  end
  if SpellBuffCount(L3_199, A1_197.BuffName, L4_200) <= 0 then
    ExecuteBuildingBlocks(A2_198, A0_196)
    A0_196.LastIfSucceeded = true
  else
    A0_196.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_201, A1_202, A2_203)
  local L3_204, L4_205
  if A1_202.OwnerVar ~= nil then
    L3_204 = A0_201[A1_202.OwnerVar]
  else
    L3_204 = A0_201.Owner
  end
  if HasPARType(L3_204, A1_202.PARType) then
    ExecuteBuildingBlocks(A2_203, A0_201)
    A0_201.LastIfSucceeded = true
  else
    A0_201.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_206, A1_207, A2_208)
  local L3_209, L4_210
  if A1_207.OwnerVar ~= nil then
    L3_209 = A0_206[A1_207.OwnerVar]
  else
    L3_209 = A0_206.Owner
  end
  if not HasPARType(L3_209, A1_207.PARType) then
    ExecuteBuildingBlocks(A2_208, A0_206)
    A0_206.LastIfSucceeded = true
  else
    A0_206.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_211, A1_212, A2_213)
  local L3_214, L4_215, L5_216, L6_217, L7_218
  L3_214 = GetTable
  L4_215 = A0_211
  L5_216 = A1_212.Src1VarTable
  L6_217 = false
  L3_214 = L3_214(L4_215, L5_216, L6_217)
  L4_215 = GetTable
  L5_216 = A0_211
  L6_217 = A1_212.Src2VarTable
  L7_218 = false
  L4_215 = L4_215(L5_216, L6_217, L7_218)
  L5_216 = true
  while L5_216 do
    L6_217 = false
    L7_218 = nil
    if L3_214 ~= nil and A1_212.Src1Var ~= nil then
      L7_218 = L3_214[A1_212.Src1Var]
    else
      L7_218 = A1_212.Value1
    end
    if L4_215 ~= nil and A1_212.Src2Var ~= nil then
      L6_217 = A1_212.CompareOp(L7_218, L4_215[A1_212.Src2Var])
    else
      L6_217 = A1_212.CompareOp(L7_218, A1_212.Value2)
    end
    if L6_217 then
      ExecuteBuildingBlocks(A2_213, A0_211)
    else
      L5_216 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_219, A1_220)
  return A0_219 * A1_220
end
MO_MULTIPLY = L0_0
function L0_0(A0_221, A1_222)
  return A0_221 + A1_222
end
MO_ADD = L0_0
function L0_0(A0_223, A1_224)
  return A0_223 - A1_224
end
MO_SUBTRACT = L0_0
function L0_0(A0_225, A1_226)
  return A0_225 / A1_226
end
MO_DIVIDE = L0_0
function L0_0(A0_227, A1_228)
  if A0_227 < A1_228 then
    return A0_227
  else
    return A1_228
  end
end
MO_MIN = L0_0
function L0_0(A0_229, A1_230)
  if A1_230 < A0_229 then
    return A0_229
  else
    return A1_230
  end
end
MO_MAX = L0_0
function L0_0(A0_231, A1_232)
  return A0_231 % A1_232
end
MO_MODULO = L0_0
function L0_0(A0_233)
  return math.floor(A0_233 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_234)
  return math.ceil(A0_234)
end
MO_ROUNDUP = L0_0
function L0_0(A0_235)
  return math.floor(A0_235)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_236)
  return math.sin(math.rad(A0_236))
end
MO_SIN = L0_0
function L0_0(A0_237)
  return math.cos(math.rad(A0_237))
end
MO_COSINE = L0_0
function L0_0(A0_238)
  return math.tan(math.rad(A0_238))
end
MO_TANGENT = L0_0
function L0_0(A0_239)
  return math.deg(math.asin(A0_239))
end
MO_ASIN = L0_0
function L0_0(A0_240)
  return math.deg(math.acos(A0_240))
end
MO_ACOS = L0_0
function L0_0(A0_241)
  return math.deg(math.atan(A0_241))
end
MO_ATAN = L0_0
function L0_0(A0_242, A1_243)
  return math.pow(A0_242, A1_243)
end
MO_POW = L0_0
function L0_0(A0_244)
  return math.sqrt(A0_244)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_245, A1_246)
  local L2_247
  L2_247 = A0_245 and A1_246
  return L2_247
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_248, A1_249)
  local L2_250
  L2_250 = A0_248 or A1_249
  return L2_250
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_251)
  local L1_252
  L1_252 = not A0_251
  return L1_252
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_253)
  return math.abs(A0_253)
end
MO_ABS = L0_0
function L0_0(A0_254, A1_255)
  return math.random(A0_254, A1_255)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_256, A1_257)
  local L2_258, L3_259
  L2_258 = GetMathNumber
  L3_259 = A0_256
  L2_258 = L2_258(L3_259, A1_257.Src1VarTable, A1_257.Src1Var, A1_257.Src1Value)
  L3_259 = GetMathNumber
  L3_259 = L3_259(A0_256, A1_257.Src2VarTable, A1_257.Src2Var, A1_257.Src2Value)
  GetTable(A0_256, A1_257.DestVarTable)[A1_257.DestVar] = A1_257.MathOp(L2_258, L3_259)
end
BBMath = L0_0
function L0_0(A0_260, A1_261, A2_262, A3_263)
  if A2_262 ~= nil and GetTable(A0_260, A1_261)[A2_262] ~= nil then
    return GetTable(A0_260, A1_261)[A2_262]
  end
  return A3_263
end
GetMathNumber = L0_0
function L0_0(A0_264, A1_265)
  if type(A1_265) == "number" then
    return A1_265
  elseif type(A1_265) == "function" then
    return A1_265(A0_264)
  elseif type(A1_265) == "string" then
    return A0_264[A1_265]
  end
end
GetNumber = L0_0
function L0_0(A0_266, A1_267)
  return VectorAdd(A0_266, A1_267)
end
VEC_ADD = L0_0
function L0_0(A0_268, A1_269)
  return VectorSubtract(A0_268, A1_269)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_270, A1_271)
  return VectorScalarMultiply(A0_270, A1_271)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_272, A1_273)
  return VectorScalarDivide(A0_272, A1_273)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_274, A1_275)
  return VectorRotateY(A0_274, A1_275)
end
VEC_ROTATE = L0_0
function L0_0(A0_276, A1_277)
  BBMath(A0_276, A1_277)
end
BBVectorMath = L0_0
function L0_0(A0_278, A1_279)
  local L2_280, L3_281, L4_282, L5_283
  L2_280 = A0_278.InstanceVars
  L3_281 = L2_280.InterpDelta
  if L3_281 == nil then
    L3_281 = A1_279.Amount
    L4_282 = A1_279.AmountVar
    if L4_282 ~= nil then
      L4_282 = GetTable
      L5_283 = A0_278
      L4_282 = L4_282(L5_283, A1_279.AmountVarTable)
      L5_283 = A1_279.AmountVar
      L3_281 = L4_282[L5_283]
    end
    L4_282 = GetPosition
    L5_283 = A1_279.TargetVar
    L5_283 = A0_278[L5_283]
    L4_282 = L4_282(L5_283)
    L2_280.KnockBackStart = L4_282
    L4_282 = GetNormalizedPositionDelta
    L5_283 = A1_279.TargetVar
    L5_283 = A0_278[L5_283]
    L4_282 = L4_282(L5_283, A0_278[A1_279.AttackerVar], true)
    L5_283 = {}
    L5_283.x = L4_282.x * L3_281
    L5_283.y = 0
    L5_283.z = L4_282.z * L3_281
    L2_280.InterpDelta = L5_283
    L5_283 = GetTime
    L5_283 = L5_283()
    L2_280.StartTime = L5_283
    L5_283 = A1_279.KnockBackDuration
    L2_280.KnockBackDuration = L5_283
  end
  L3_281 = A1_279.TargetVar
  L3_281 = A0_278[L3_281]
  L4_282 = GetTime
  L4_282 = L4_282()
  L5_283 = L2_280.StartTime
  L4_282 = L4_282 - L5_283
  L5_283 = L2_280.KnockBackDuration
  L4_282 = L4_282 / L5_283
  L5_283 = {}
  L5_283.x = L2_280.KnockBackStart.x + L2_280.InterpDelta.x * L4_282
  L5_283.y = L2_280.KnockBackStart.y
  L5_283.z = L2_280.KnockBackStart.z + L2_280.InterpDelta.z * L4_282
  SetPosition(L3_281, L5_283)
end
BBKnockback = L0_0
function L0_0(A0_284, A1_285)
  local L2_286, L3_287
  L2_286 = GetParam
  L3_287 = "Left"
  L2_286 = L2_286(L3_287, A0_284, A1_285)
  L3_287 = GetParam
  L3_287 = L3_287("Right", A0_284, A1_285)
  GetTable(A0_284, A1_285.DestVarTable, true)[A1_285.DestVar] = tostring(L2_286) .. tostring(L3_287)
end
BBAppendString = L0_0
function L0_0(A0_288, A1_289)
  local L2_290
  L2_290 = 0
  if A1_289.Delta ~= nil then
    L2_290 = L2_290 + A1_289.Delta
  end
  if A1_289.DeltaByLevel ~= nil and A0_288.Level ~= nil then
    L2_290 = L2_290 + A1_289.DeltaByLevel[A0_288.Level]
  end
  if A1_289.DeltaVar ~= nil then
    L2_290 = L2_290 + GetTable(A0_288, A1_289.DeltaVarTable, true)[A1_289.DeltaVar]
  end
  if A1_289.TargetVar ~= nil then
    A1_289.Stat(L2_290, A0_288[A1_289.TargetVar])
  else
    A1_289.Stat(L2_290)
  end
end
BBIncStat = L0_0
function L0_0(A0_291, A1_292)
  local L2_293
  L2_293 = 0
  if A1_292.Delta ~= nil then
    L2_293 = L2_293 + A1_292.Delta
  end
  if A1_292.DeltaByLevel ~= nil and A0_291.Level ~= nil then
    L2_293 = L2_293 + A1_292.DeltaByLevel[A0_291.Level]
  end
  if A1_292.DeltaVar ~= nil then
    L2_293 = L2_293 + GetTable(A0_291, A1_292.DeltaVarTable, true)[A1_292.DeltaVar]
  end
  if A1_292.TargetVar ~= nil then
    A1_292.Stat(L2_293, A0_291[A1_292.TargetVar])
  else
    A1_292.Stat(L2_293)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_294, A1_295)
  if A1_295.AttackVar ~= nil then
  end
  if A1_295.Attack ~= nil then
  end
  if A1_295.TotalCoefficientVar ~= nil then
  end
  if A1_295.TotalCoefficient ~= nil then
  end
  if A1_295.TargetVar ~= nil then
    GetTable(A0_294, A1_295.DestVarTable, false)[A1_295.DestVar] = (0 + GetTable(A0_294, A1_295.AttackVarTable, true)[A1_295.AttackVar] + A1_295.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_294[A1_295.TargetVar])) + GetFlatCritDamageMod(A0_294[A1_295.TargetVar])) * (0 + GetTable(A0_294, A1_295.TotalCoefficientVarTable, true)[A1_295.TotalCoefficientVar] + A1_295.TotalCoefficient)
  else
    GetTable(A0_294, A1_295.DestVarTable, false)[A1_295.DestVar] = 2 * A1_295.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_296, A1_297)
  local L2_298, L3_299, L4_300, L5_301, L6_302, L7_303
  L2_298 = GetTable
  L3_299 = A0_296
  L4_300 = A1_297.DestVarTable
  L5_301 = false
  L2_298 = L2_298(L3_299, L4_300, L5_301)
  L3_299 = GetTable
  L4_300 = A0_296
  L5_301 = A1_297.AmountVarTable
  L6_302 = true
  L3_299 = L3_299(L4_300, L5_301, L6_302)
  L4_300 = GetTable
  L5_301 = A0_296
  L6_302 = A0_296.NextBuffVars
  L7_303 = false
  L4_300 = L4_300(L5_301, L6_302, L7_303)
  L5_301 = A1_297.AmountVar
  L5_301 = L3_299[L5_301]
  L6_302 = A1_297.Amount
  L5_301 = L5_301 + L6_302
  L4_300.InitializeShield_Amount = L5_301
  L5_301 = A1_297.AmountVar
  if L5_301 ~= nil then
    L5_301 = A1_297.HealShieldMod
    if L5_301 ~= nil and L5_301 == true then
      L6_302 = A1_297.AttackerVar
      L7_303 = 0
      if L6_302 ~= nil then
        L7_303 = GetPercentHealingAmountMod(A0_296[L6_302])
      end
      L4_300.InitializeShield_Amount, L3_299[A1_297.AmountVar] = (A1_297.Amount + L3_299[A1_297.AmountVar]) * (1 + L7_303), (A1_297.Amount + L3_299[A1_297.AmountVar]) * (1 + L7_303)
    end
  end
  L5_301 = SpellBuffAddNoRenew
  L6_302 = A1_297.AttackerVar
  L6_302 = A0_296[L6_302]
  L7_303 = A1_297.UnitVar
  L7_303 = A0_296[L7_303]
  L5_301(L6_302, L7_303, "InitializeShieldMarker", 0, 1, 25000, L4_300)
  L5_301 = BBIncreaseShield
  L6_302 = A0_296
  L7_303 = A1_297
  L5_301(L6_302, L7_303)
end
BBInitializeShield = L0_0
function L0_0(A0_304, A1_305)
  if A1_305.CDVar ~= nil then
  end
  if A1_305.CD ~= nil then
  end
  if A1_305.TargetVar ~= nil then
    GetTable(A0_304, A1_305.DestVarTable, false)[A1_305.DestVar] = (0 + GetTable(A0_304, A1_305.CDVarTable, true)[A1_305.CDVar] + A1_305.CD) * (1 + GetPercentCooldownMod(A0_304[A1_305.TargetVar]))
  else
    GetTable(A0_304, A1_305.DestVarTable, false)[A1_305.DestVar] = A1_305.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_306, A1_307)
  if A1_307.TargetVar ~= nil then
    GetTable(A0_306, A1_307.DestVarTable, false)[A1_307.DestVar] = A1_307.Stat(A0_306[A1_307.TargetVar])
  else
    GetTable(A0_306, A1_307.DestVarTable, false)[A1_307.DestVar] = A1_307.Stat()
  end
end
BBGetStat = L0_0
function L0_0(A0_308, A1_309)
  if A1_309.TargetVar ~= nil then
    GetTable(A0_308, A1_309.DestVarTable, false)[A1_309.DestVar] = GetLevel(A0_308[A1_309.TargetVar])
  else
    GetTable(A0_308, A1_309.DestVarTable, false)[A1_309.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_310, A1_311)
  if A1_311.TargetVar ~= nil then
    GetTable(A0_310, A1_311.DestVarTable, false)[A1_311.DestVar] = GetUnitSignificance(A0_310[A1_311.TargetVar])
  else
    GetTable(A0_310, A1_311.DestVarTable, false)[A1_311.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_312, A1_313)
  if A1_313.TargetVar ~= nil then
    GetTable(A0_312, A1_313.DestVarTable, false)[A1_313.DestVar] = GetArmor(A0_312[A1_313.TargetVar])
  else
    GetTable(A0_312, A1_313.DestVarTable, false)[A1_313.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_314, A1_315)
  if A1_315.TargetVar ~= nil then
    GetTable(A0_314, A1_315.DestVarTable, false)[A1_315.DestVar] = GetSpellBlock(A0_314[A1_315.TargetVar])
  else
    GetTable(A0_314, A1_315.DestVarTable, false)[A1_315.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_316, A1_317)
  if A1_317.TargetVar ~= nil then
    GetTable(A0_316, A1_317.DestVarTable, false)[A1_317.DestVar] = GetTeamID(A0_316[A1_317.TargetVar])
  else
    GetTable(A0_316, A1_317.DestVarTable, false)[A1_317.DestVar] = GetTeamID()
  end
end
BBGetTeamID = L0_0
function L0_0(A0_318, A1_319)
  local L2_320, L3_321, L4_322
  L2_320 = GetTable
  L3_321 = A0_318
  L4_322 = A1_319.DestVarTable
  L2_320 = L2_320(L3_321, L4_322, false)
  L3_321 = A1_319.TargetVar
  L4_322 = nil
  if L3_321 ~= nil then
    L4_322 = GetTeamID(A0_318[L3_321])
  else
    L4_322 = GetTeamID()
  end
  if L4_322 == TEAM_ORDER then
    L2_320[A1_319.DestVar] = TEAM_CHAOS
  elseif L4_322 == TEAM_CHAOS then
    L2_320[A1_319.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_323, A1_324)
  if A1_324.TargetVar ~= nil then
    GetTable(A0_323, A1_324.DestVarTable, false)[A1_324.DestVar] = GetUnitSkinName(A0_323[A1_324.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_325, A1_326)
  if A1_326.TargetVar ~= nil then
    GetTable(A0_325, A1_326.DestVarTable, false)[A1_326.DestVar] = GetTotalAttackDamage(A0_325[A1_326.TargetVar])
  else
    GetTable(A0_325, A1_326.DestVarTable, false)[A1_326.DestVar] = GetTotalAttackDamage()
  end
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_327, A1_328)
  GetTable(A0_327, A1_328.DestVarTable, true)[A1_328.DestVar] = A1_328.Status(A0_327[A1_328.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_329, A1_330)
  local L2_331
  L2_331 = A1_330.TargetVar
  L2_331 = A0_329[L2_331]
  ClearAttackTarget(L2_331)
end
BBClearAttackTarget = L0_0
function L0_0(A0_332, A1_333)
  GetTable(A0_332, A1_333.DestVarTable, true)[A1_333.DestVar] = A1_333.Info(A0_332[A1_333.TargetVar])
end
BBGetCastInfo = L0_0
function L0_0(A0_334, A1_335, A2_336)
  local L3_337, L4_338, L5_339, L6_340
  L3_337 = GetTable
  L4_338 = A0_334
  L5_339 = A1_335.TrackTimeVarTable
  L6_340 = false
  L3_337 = L3_337(L4_338, L5_339, L6_340)
  L4_338 = GetTime
  L4_338 = L4_338()
  L5_339 = A1_335.ExecuteImmediately
  L6_340 = GetParam
  L6_340 = L6_340("TimeBetweenExecutions", A0_334, A1_335)
  if A1_335.TickTimeVar ~= nil and GetTable(A0_334, A1_335.TickTimeVarTable, false)[A1_335.TickTimeVar] ~= nil then
    L6_340 = GetTable(A0_334, A1_335.TickTimeVarTable, false)[A1_335.TickTimeVar]
  end
  if L3_337[A1_335.TrackTimeVar] == nil then
    L3_337[A1_335.TrackTimeVar] = L4_338
    if L5_339 == true then
      ExecuteBuildingBlocks(A2_336, A0_334)
    end
  end
  if L4_338 >= L3_337[A1_335.TrackTimeVar] + L6_340 then
    L3_337[A1_335.TrackTimeVar] = L3_337[A1_335.TrackTimeVar] + L6_340
    ExecuteBuildingBlocks(A2_336, A0_334)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_341, A1_342, A2_343)
  GetTable(A0_341, A1_342.TrackTimeVarTable, false)[A1_342.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_344, A1_345)
  local L2_346
  L2_346 = A1_345.SrcValue
  if A1_345.SrcVar ~= nil then
    L2_346 = GetTable(A0_344, A1_345.SrcVarTable, true)[A1_345.SrcVar]
  end
  A1_345.Status(A0_344[A1_345.TargetVar], L2_346)
end
BBSetStatus = L0_0
function L0_0(A0_347, A1_348)
  local L2_349
  L2_349 = A1_348.ToAlert
  if GetTable(A0_347, A1_348.SrcVarTable, false) ~= nil and A1_348.SrcVar ~= nil then
    L2_349 = L2_349 .. GetTable(A0_347, A1_348.SrcVarTable, false)[A1_348.SrcVar]
  end
  _ALERT(L2_349)
end
BBAlert = L0_0
function L0_0(A0_350, A1_351)
  local L2_352, L3_353, L4_354, L5_355, L6_356, L7_357
  L2_352 = GetParam
  L3_353 = "Message"
  L4_354 = A0_350
  L5_355 = A1_351
  L2_352 = L2_352(L3_353, L4_354, L5_355)
  if L2_352 == nil then
    L3_353 = ReportError
    L4_354 = "Could not resolve Message param"
    L3_353(L4_354)
    return
  end
  L3_353 = true
  L4_354 = GetParam
  L5_355 = "OnUnit"
  L6_356 = A0_350
  L7_357 = A1_351
  L4_354 = L4_354(L5_355, L6_356, L7_357)
  if L4_354 == nil then
    L3_353 = false
    L5_355 = GetParam
    L6_356 = "OnUnitByFlag"
    L7_357 = A0_350
    L5_355 = L5_355(L6_356, L7_357, A1_351)
    L4_354 = L5_355
  end
  if L4_354 == nil then
    L5_355 = ReportError
    L6_356 = "Could not resolve OnUnit param"
    L5_355(L6_356)
    return
  end
  L5_355 = true
  L6_356 = GetParam
  L7_357 = "ChampionToSayTo"
  L6_356 = L6_356(L7_357, A0_350, A1_351)
  if L6_356 == nil then
    L5_355 = false
    L7_357 = GetParam
    L7_357 = L7_357("ChampionToSayToByFlag", A0_350, A1_351)
    L6_356 = L7_357
  end
  if L6_356 == nil then
    L7_357 = ReportError
    L7_357("Could not resolve ChampionToSayTo param")
    return
  end
  L7_357 = GetParam
  L7_357 = L7_357("ShowToSpectator", A0_350, A1_351)
  if L7_357 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  SayWithFloatingTextOnUnitToChampion(tostring(L2_352), A1_351.TextType, L4_354, L3_353, L6_356, L5_355, L7_357)
end
BBSayWithFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_358, A1_359)
  local L2_360, L3_361, L4_362
  L2_360 = A1_359.ToSay
  L3_361 = GetTable
  L4_362 = A0_358
  L3_361 = L3_361(L4_362, A1_359.SrcVarTable, false)
  if L3_361 ~= nil then
    L4_362 = A1_359.SrcVar
    if L4_362 ~= nil then
      L4_362 = L2_360
      L2_360 = L4_362 .. tostring(L3_361[A1_359.SrcVar])
    end
  end
  L4_362 = nil
  if A1_359.OwnerVar ~= nil then
    L4_362 = A0_358[A1_359.OwnerVar]
  else
    L4_362 = A0_358.Owner
  end
  if A1_359.TextType == nil then
    A1_359.TextType = 0
  end
  Say(L4_362, L2_360, A1_359.TextType)
end
BBSay = L0_0
function L0_0(A0_363, A1_364)
  local L2_365, L3_366, L4_367
  L2_365 = A1_364.ToSay
  L3_366 = GetTable
  L4_367 = A0_363
  L3_366 = L3_366(L4_367, A1_364.SrcVarTable, false)
  if L3_366 ~= nil then
    L4_367 = A1_364.SrcVar
    if L4_367 ~= nil then
      L4_367 = L2_365
      L2_365 = L4_367 .. tostring(L3_366[A1_364.SrcVar])
    end
  end
  L4_367 = nil
  if A1_364.OwnerVar ~= nil then
    L4_367 = A0_363[A1_364.OwnerVar]
  else
    L4_367 = A0_363.Owner
  end
  if A1_364.TextType == nil then
    A1_364.TextType = 0
  end
  Say(L4_367, L2_365, A1_364.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_368, A1_369)
  GetTable(A0_368, A1_369.DestVarTable, true)[A1_369.DestVar] = BBLuaGetGold(A0_368, A1_369)
end
BBGetGold = L0_0
function L0_0(A0_370, A1_371)
  GetTable(A0_370, A1_371.DestVarTable, true)[A1_371.DestVar] = BBLuaGetTotalGold(A0_370, A1_371)
end
BBGetTotalGold = L0_0
function L0_0(A0_372, A1_373)
  SpellBuffAdd(A0_372[A1_373.OwnerVar], A0_372[A1_373.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_372.NextBuffVars)
  BBTeleportToPositionHelper(A0_372, A1_373)
end
BBTeleportToPosition = L0_0
function L0_0(A0_374, A1_375)
  if A1_375.XVar ~= nil and GetTable(A0_374, A1_375.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_374, A1_375.XVarTable, true)[A1_375.XVar]
  else
    Xloc = A1_375.X
  end
  if A1_375.YVar ~= nil and GetTable(A0_374, A1_375.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_374, A1_375.YVarTable, true)[A1_375.YVar]
  else
    Yloc = A1_375.Y
  end
  if A1_375.ZVar ~= nil and GetTable(A0_374, A1_375.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_374, A1_375.ZVarTable, true)[A1_375.ZVar]
  else
    Zloc = A1_375.Z
  end
  A1_375.OwnerVar, A0_374.position = A1_375.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_375.CastPositionName = "position"
  BBTeleportToPosition(A0_374, A1_375)
end
BBTeleportToPoint = L0_0
function L0_0(A0_376, A1_377)
  DefUpdateAura(GetTable(A0_376, A1_377.CenterTable, false)[A1_377.CenterVar], A1_377.Range, A1_377.UnitScan, A1_377.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_378, A1_379)
  ReincarnateNonDeadHero(GetTable(A0_378, A1_379.TargetTable, false)[A1_379.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_380, A1_381)
  GetTable(A0_380, A1_381.DestVarTable, true)[A1_381.DestVar] = A1_381.Function(A0_380[A1_381.OwnerVar], A1_381.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_382, A1_383)
  local L2_384, L3_385, L4_386, L5_387
  L2_384 = A1_383.WhomToOrderVar
  L2_384 = A0_382[L2_384]
  L3_385 = A1_383.TargetOfOrderVar
  L3_385 = A0_382[L3_385]
  L4_386 = GetTable
  L5_387 = A0_382
  L4_386 = L4_386(L5_387, A1_383.SrcVarTable, false)
  L5_387 = nil
  if A1_383.SrcVar ~= nil and L4_386 ~= nil then
    L5_387 = L4_386[A1_383.SrcVar]
  else
    L5_387 = GetPosition(L3_385)
  end
  if L3_385 == nil then
    L3_385 = L2_384
  end
  IssueOrder(L2_384, A1_383.Order, L5_387, L3_385)
end
BBIssueOrder = L0_0
function L0_0(A0_388, A1_389)
  local L2_390
  L2_390 = GetParam
  L2_390 = L2_390("NewRange", A0_388, A1_389)
  SetSpellCastRange(L2_390)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_391, A1_392)
  GetTable(A0_391, A1_392.DestVarTable, true)[A1_392.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_393, A1_394)
  local L2_395, L3_396
  L2_395 = A1_394.ObjectVar1
  L2_395 = A0_393[L2_395]
  L3_396 = A1_394.ObjectVar2
  L3_396 = A0_393[L3_396]
  GetTable(A0_393, A1_394.DestVarTable, true)[A1_394.DestVar] = DistanceBetweenObjectBounds(L2_395, L3_396)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_397, A1_398)
  local L2_399, L3_400, L4_401
  L2_399 = A1_398.ObjectVar
  L2_399 = A0_397[L2_399]
  L3_400 = GetTable
  L4_401 = A0_397
  L3_400 = L3_400(L4_401, A1_398.PointVarTable, true)
  L4_401 = A1_398.PointVar
  L4_401 = L3_400[L4_401]
  GetTable(A0_397, A1_398.DestVarTable, true)[A1_398.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_399, L4_401)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_402, A1_403)
  local L2_404, L3_405
  L2_404 = GetParam
  L3_405 = "Point1"
  L2_404 = L2_404(L3_405, A0_402, A1_403)
  L3_405 = GetParam
  L3_405 = L3_405("Point2", A0_402, A1_403)
  GetTable(A0_402, A1_403.DestVarTable, true)[A1_403.DestVar] = DistanceBetweenPoints(L2_404, L3_405)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_406, A1_407, A2_408)
  local L3_409, L4_410, L5_411, L6_412, L7_413, L8_414
  L5_411 = 0
  L6_412 = nil
  L7_413 = A1_407.ObjectDistanceType
  L8_414 = A1_407.ObjectVar1
  L3_409 = A0_406[L8_414]
  L8_414 = A1_407.ObjectVar2
  L4_410 = A0_406[L8_414]
  if nil == L4_410 then
    L8_414 = A1_407.Point2Var
    if nil ~= L8_414 then
      L8_414 = GetTable
      L8_414 = L8_414(A0_406, A1_407.Point2VarTable, true)
      L4_410 = L8_414[A1_407.Point2Var]
      L5_411 = L5_411 + 1
    end
  end
  if nil == L3_409 then
    L8_414 = A1_407.Point1Var
    if nil ~= L8_414 then
      L8_414 = GetTable
      L8_414 = L8_414(A0_406, A1_407.Point1VarTable, true)
      L3_409 = L8_414[A1_407.Point1Var]
      L5_411 = L5_411 + 1
      if 1 == L5_411 then
        L3_409, L4_410 = L4_410, L3_409
      end
    end
  end
  if nil ~= L7_413 then
    if 0 == L5_411 then
      L8_414 = OBJECT_CENTER
      if L8_414 == L7_413 then
        L6_412 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_414 = OBJECT_BOUNDARY
        if L8_414 == L7_413 then
          L6_412 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_414 = A1_407.OwnerVar
          L8_414 = A0_406[L8_414]
          Say(L8_414, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_411 then
      L8_414 = OBJECT_CENTER
      if L8_414 == L7_413 then
        L6_412 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_414 = OBJECT_BOUNDARY
        if L8_414 == L7_413 then
          L6_412 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_414 = A1_407.OwnerVar
          L8_414 = A0_406[L8_414]
          Say(L8_414, "invalid object distance type", 0)
        end
      end
    else
      L6_412 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_414 = A1_407.Distance
  if A1_407.DistanceVar ~= nil and GetTable(A0_406, A1_407.DistanceVarTable, true) ~= nil then
    L8_414 = L8_414 + GetTable(A0_406, A1_407.DistanceVarTable, true)[A1_407.DistanceVar]
  end
  if L3_409 ~= nil and L4_410 ~= nil and L6_412 ~= nil and L8_414 ~= nil then
    if not L6_412(L3_409, L4_410, L8_414) then
      ExecuteBuildingBlocks(A2_408, A0_406)
      A0_406.LastIfSucceeded = true
    else
      A0_406.LastIfSucceeded = false
    end
  else
    A0_406.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_415, A1_416)
  local L2_417, L3_418
  L2_417 = A1_416.TargetVar
  L2_417 = A0_415[L2_417]
  L3_418 = A1_416.CasterVar
  L3_418 = A0_415[L3_418]
  GetTable(A0_415, A1_416.DestVarTable, true)[A1_416.DestVar] = SpellBuffCount(L2_417, A1_416.BuffName, L3_418)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_419, A1_420)
  local L2_421
  L2_421 = A1_420.TargetVar
  L2_421 = A0_419[L2_421]
  GetTable(A0_419, A1_420.DestVarTable, true)[A1_420.DestVar] = SpellBuffCount(L2_421, A1_420.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_422, A1_423)
  local L2_424, L3_425
  L2_424 = GetTable
  L3_425 = A0_422
  L2_424 = L2_424(L3_425, A1_423.ScaleVarTable, false)
  L3_425 = nil
  if A1_423.OwnerVar ~= nil then
    L3_425 = A0_422[A1_423.OwnerVar]
  else
    L3_425 = A0_422.Owner
  end
  if A1_423.ScaleVar ~= nil and A1_423.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_424[A1_423.ScaleVar], L3_425)
  else
    SetScaleSkinCoef(A1_423.Scale, L3_425)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_426, A1_427)
  SpellBuffAdd(A0_426[A1_427.TargetVar], A0_426[A1_427.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_426.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_428, A1_429, A2_430)
  local L3_431, L4_432
  L3_431 = A1_429.TargetVar
  L3_431 = A0_428[L3_431]
  L4_432 = A1_429.NumStacks
  if GetParam("NumStacks", A0_428, A1_429) == 0 then
    L4_432 = SpellBuffCount(L3_431, A1_429.BuffName, caster)
  else
    L4_432 = GetParam("NumStacks", A0_428, A1_429)
  end
  while L4_432 > 0 do
    SpellBuffRemove(L3_431, A1_429.BuffName, A0_428[A1_429.AttackerVar])
    L4_432 = L4_432 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_433, A1_434, A2_435)
  if A0_433.EmoteId == A1_434.EmoteId then
    ExecuteBuildingBlocks(A2_435, A0_433)
    A0_433.LastIfSucceeded = true
  else
    A0_433.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_436, A1_437, A2_438)
  if A0_436.EmoteId ~= A1_437.EmoteId then
    ExecuteBuildingBlocks(A2_438, A0_436)
    A0_436.LastIfSucceeded = true
  else
    A0_436.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_439, A1_440)
  local L2_441, L3_442, L4_443, L5_444
  L2_441 = GetTable
  L3_442 = A0_439
  L4_443 = A1_440.String1VarTable
  L5_444 = false
  L2_441 = L2_441(L3_442, L4_443, L5_444)
  L3_442 = A1_440.String1Var
  L3_442 = L2_441[L3_442]
  L4_443 = GetTable
  L5_444 = A0_439
  L4_443 = L4_443(L5_444, A1_440.String2VarTable, false)
  L5_444 = A1_440.String2Var
  L5_444 = L4_443[L5_444]
  GetTable(A0_439, A1_440.ResultVarTable, false)[A1_440.ResultVar] = L3_442 .. L5_444
end
BBConcatenateStrings = L0_0
function L0_0(A0_445, A1_446)
  BBGetMinionKills(A0_445, A1_446)
  A0_445.MinionKillSource = GetParam("MinionKillTarget")
  A0_445.MinionKills = A0_445.MinionsKilled + GetParam("MinionKills", A0_445, A1_446)
  BBSetMinionKills(A0_445, A1_446)
end
BBIncreaseMinionKills = L0_0
