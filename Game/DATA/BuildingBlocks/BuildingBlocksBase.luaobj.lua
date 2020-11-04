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
  return IsDead(A0_143)
end
CO_IS_DEAD = L0_0
function L0_0(A0_144)
  return IsDead(A0_144) ~= true
end
CO_IS_NOT_DEAD = L0_0
function L0_0(A0_145)
  return IsDeadOrZombie(A0_145)
end
CO_IS_DEAD_OR_ZOMBIE = L0_0
function L0_0(A0_146, A1_147)
  return BBIsTargetInFrontOfMe(A0_146, A1_147)
end
CO_IS_TARGET_IN_FRONT_OF_ME = L0_0
function L0_0(A0_148, A1_149)
  return BBIsTargetBehindMe(A0_148, A1_149)
end
CO_IS_TARGET_BEHIND_ME = L0_0
function L0_0(A0_150)
  return IsWard(A0_150)
end
CO_IS_WARD = L0_0
function L0_0(A0_151)
  return IsStructure(A0_151)
end
CO_IS_STRUCTURE = L0_0
function L0_0(A0_152)
  return IsStructure(A0_152) ~= true
end
CO_IS_NOT_STRUCTURE = L0_0
function L0_0(A0_153)
  local L1_154
  L1_154 = A0_153 ~= nil
  return L1_154
end
CO_IS_NOT_NIL = L0_0
function L0_0(A0_155, A1_156, A2_157)
  GetTable(A0_155, A1_156.MacroVarTable, true)[A1_156.MacroVar] = A2_157
end
BBCreateMacro = L0_0
function L0_0(A0_158, A1_159)
  local L2_160
  L2_160 = GetParam
  L2_160 = L2_160("Macro", A0_158, A1_159)
  if L2_160 ~= nil and type(L2_160) == "table" then
    ExecuteBuildingBlocks(L2_160, A0_158)
  else
    ClientPrint("Designer Error: Macro variable is not initialized inside of event. Macro Variable was: " .. tostring(A1_159.MacroVar) .. " and current block data is: " .. gCurrentBuildingBlockString .. ". This error probably occurred due to variable not being initialized yet, being misnamed or two events being called out of sequence. It is highly recommended that script macros either be initialized OnBuffActivate, OnCharActivate or in the same event. Pro Devs may violate this rule at the risk of being forced to read this error message again.")
  end
end
BBRunMacro = L0_0
function L0_0(A0_161, A1_162, A2_163)
  local L3_164, L4_165, L5_166, L6_167
  L3_164 = GetTable
  L4_165 = A0_161
  L5_166 = A1_162.Src1VarTable
  L6_167 = false
  L3_164 = L3_164(L4_165, L5_166, L6_167)
  L4_165 = GetTable
  L5_166 = A0_161
  L6_167 = A1_162.Src2VarTable
  L4_165 = L4_165(L5_166, L6_167, false)
  L5_166 = false
  L6_167 = nil
  if L3_164 ~= nil and A1_162.Src1Var ~= nil then
    L6_167 = L3_164[A1_162.Src1Var]
  else
    L6_167 = A1_162.Value1
  end
  if L4_165 ~= nil and A1_162.Src2Var ~= nil then
    L5_166 = A1_162.CompareOp(L6_167, L4_165[A1_162.Src2Var])
  else
    L5_166 = A1_162.CompareOp(L6_167, A1_162.Value2)
  end
  if L5_166 then
    ExecuteBuildingBlocks(A2_163, A0_161)
    A0_161.LastIfSucceeded = true
  else
    A0_161.LastIfSucceeded = false
  end
end
BBIf = L0_0
function L0_0(A0_168, A1_169, A2_170)
  if A0_168.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_170, A0_168)
    A0_168.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_171, A1_172, A2_173)
  local L3_174, L4_175, L5_176, L6_177
  L3_174 = A0_171.LastIfSucceeded
  if L3_174 == false then
    L3_174 = GetTable
    L4_175 = A0_171
    L5_176 = A1_172.Src1VarTable
    L6_177 = false
    L3_174 = L3_174(L4_175, L5_176, L6_177)
    L4_175 = GetTable
    L5_176 = A0_171
    L6_177 = A1_172.Src2VarTable
    L4_175 = L4_175(L5_176, L6_177, false)
    L5_176 = false
    L6_177 = nil
    if L3_174 ~= nil and A1_172.Src1Var ~= nil then
      L6_177 = L3_174[A1_172.Src1Var]
    else
      L6_177 = A1_172.Value1
    end
    if L4_175 ~= nil and A1_172.Src2Var ~= nil then
      L5_176 = A1_172.CompareOp(L6_177, L4_175[A1_172.Src2Var])
    else
      L5_176 = A1_172.CompareOp(L6_177, A1_172.Value2)
    end
    if L5_176 then
      ExecuteBuildingBlocks(A2_173, A0_171)
      A0_171.LastIfSucceeded = true
    else
      A0_171.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_178, A1_179, A2_180)
  local L3_181
  if A1_179.TargetVar ~= nil then
    L3_181 = A0_178[A1_179.TargetVar]
  else
    L3_181 = A0_178.Target
  end
  if HasBuffOfType(L3_181, A1_179.BuffType) then
    ExecuteBuildingBlocks(A2_180, A0_178)
    A0_178.LastIfSucceeded = true
  else
    A0_178.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_182, A1_183, A2_184)
  local L3_185, L4_186
  if A1_183.OwnerVar ~= nil then
    L3_185 = A0_182[A1_183.OwnerVar]
  else
    L3_185 = A0_182.Owner
  end
  if A1_183.AttackerVar ~= nil then
    L4_186 = A0_182[A1_183.AttackerVar]
  else
    L4_186 = A0_182.Attacker
  end
  if SpellBuffCount(L3_185, A1_183.BuffName, L4_186) > 0 then
    ExecuteBuildingBlocks(A2_184, A0_182)
    A0_182.LastIfSucceeded = true
  else
    A0_182.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_187, A1_188, A2_189)
  if BBIsMissileAutoAttack(A0_187, A1_188) then
    ExecuteBuildingBlocks(A2_189, A0_187)
    A0_187.LastIfSucceeded = true
  else
    A0_187.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_190, A1_191)
  A0_190.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_192, A1_193, A2_194)
  local L3_195, L4_196
  if A1_193.OwnerVar ~= nil then
    L3_195 = A0_192[A1_193.OwnerVar]
  else
    L3_195 = A0_192.Owner
  end
  if A1_193.CasterVar ~= nil then
    L4_196 = A0_192[A1_193.CasterVar]
  else
    L4_196 = A0_192.Caster
  end
  if SpellBuffCount(L3_195, A1_193.BuffName, L4_196) <= 0 then
    ExecuteBuildingBlocks(A2_194, A0_192)
    A0_192.LastIfSucceeded = true
  else
    A0_192.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_197, A1_198, A2_199)
  local L3_200, L4_201
  if A1_198.OwnerVar ~= nil then
    L3_200 = A0_197[A1_198.OwnerVar]
  else
    L3_200 = A0_197.Owner
  end
  if HasPARType(L3_200, A1_198.PARType) then
    ExecuteBuildingBlocks(A2_199, A0_197)
    A0_197.LastIfSucceeded = true
  else
    A0_197.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_202, A1_203, A2_204)
  local L3_205, L4_206
  if A1_203.OwnerVar ~= nil then
    L3_205 = A0_202[A1_203.OwnerVar]
  else
    L3_205 = A0_202.Owner
  end
  if not HasPARType(L3_205, A1_203.PARType) then
    ExecuteBuildingBlocks(A2_204, A0_202)
    A0_202.LastIfSucceeded = true
  else
    A0_202.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_207, A1_208, A2_209)
  local L3_210, L4_211, L5_212, L6_213, L7_214
  L3_210 = GetTable
  L4_211 = A0_207
  L5_212 = A1_208.Src1VarTable
  L6_213 = false
  L3_210 = L3_210(L4_211, L5_212, L6_213)
  L4_211 = GetTable
  L5_212 = A0_207
  L6_213 = A1_208.Src2VarTable
  L7_214 = false
  L4_211 = L4_211(L5_212, L6_213, L7_214)
  L5_212 = true
  while L5_212 do
    L6_213 = false
    L7_214 = nil
    if L3_210 ~= nil and A1_208.Src1Var ~= nil then
      L7_214 = L3_210[A1_208.Src1Var]
    else
      L7_214 = A1_208.Value1
    end
    if L4_211 ~= nil and A1_208.Src2Var ~= nil then
      L6_213 = A1_208.CompareOp(L7_214, L4_211[A1_208.Src2Var])
    else
      L6_213 = A1_208.CompareOp(L7_214, A1_208.Value2)
    end
    if L6_213 then
      ExecuteBuildingBlocks(A2_209, A0_207)
    else
      L5_212 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_215, A1_216)
  return A0_215 * A1_216
end
MO_MULTIPLY = L0_0
function L0_0(A0_217, A1_218)
  return A0_217 + A1_218
end
MO_ADD = L0_0
function L0_0(A0_219, A1_220)
  return A0_219 - A1_220
end
MO_SUBTRACT = L0_0
function L0_0(A0_221, A1_222)
  return A0_221 / A1_222
end
MO_DIVIDE = L0_0
function L0_0(A0_223, A1_224)
  if A0_223 < A1_224 then
    return A0_223
  else
    return A1_224
  end
end
MO_MIN = L0_0
function L0_0(A0_225, A1_226)
  if A1_226 < A0_225 then
    return A0_225
  else
    return A1_226
  end
end
MO_MAX = L0_0
function L0_0(A0_227, A1_228)
  return A0_227 % A1_228
end
MO_MODULO = L0_0
function L0_0(A0_229)
  return math.floor(A0_229 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_230)
  return math.ceil(A0_230)
end
MO_ROUNDUP = L0_0
function L0_0(A0_231)
  return math.floor(A0_231)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_232)
  return math.sin(math.rad(A0_232))
end
MO_SIN = L0_0
function L0_0(A0_233)
  return math.cos(math.rad(A0_233))
end
MO_COSINE = L0_0
function L0_0(A0_234)
  return math.tan(math.rad(A0_234))
end
MO_TANGENT = L0_0
function L0_0(A0_235)
  return math.deg(math.asin(A0_235))
end
MO_ASIN = L0_0
function L0_0(A0_236)
  return math.deg(math.acos(A0_236))
end
MO_ACOS = L0_0
function L0_0(A0_237)
  return math.deg(math.atan(A0_237))
end
MO_ATAN = L0_0
function L0_0(A0_238, A1_239)
  return math.pow(A0_238, A1_239)
end
MO_POW = L0_0
function L0_0(A0_240)
  return math.sqrt(A0_240)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_241, A1_242)
  local L2_243
  L2_243 = A0_241 and A1_242
  return L2_243
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_244, A1_245)
  local L2_246
  L2_246 = A0_244 or A1_245
  return L2_246
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_247)
  local L1_248
  L1_248 = not A0_247
  return L1_248
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_249)
  return math.abs(A0_249)
end
MO_ABS = L0_0
function L0_0(A0_250, A1_251)
  return math.random(A0_250, A1_251)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_252, A1_253)
  local L2_254, L3_255
  L2_254 = GetMathNumber
  L3_255 = A0_252
  L2_254 = L2_254(L3_255, A1_253.Src1VarTable, A1_253.Src1Var, A1_253.Src1Value)
  L3_255 = GetMathNumber
  L3_255 = L3_255(A0_252, A1_253.Src2VarTable, A1_253.Src2Var, A1_253.Src2Value)
  GetTable(A0_252, A1_253.DestVarTable)[A1_253.DestVar] = A1_253.MathOp(L2_254, L3_255)
end
BBMath = L0_0
function L0_0(A0_256, A1_257, A2_258, A3_259)
  if A2_258 ~= nil and GetTable(A0_256, A1_257)[A2_258] ~= nil then
    return GetTable(A0_256, A1_257)[A2_258]
  end
  return A3_259
end
GetMathNumber = L0_0
function L0_0(A0_260, A1_261)
  if type(A1_261) == "number" then
    return A1_261
  elseif type(A1_261) == "function" then
    return A1_261(A0_260)
  elseif type(A1_261) == "string" then
    return A0_260[A1_261]
  end
end
GetNumber = L0_0
function L0_0(A0_262, A1_263)
  return VectorAdd(A0_262, A1_263)
end
VEC_ADD = L0_0
function L0_0(A0_264, A1_265)
  return VectorSubtract(A0_264, A1_265)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_266, A1_267)
  return VectorScalarMultiply(A0_266, A1_267)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_268, A1_269)
  return VectorScalarDivide(A0_268, A1_269)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_270, A1_271)
  return VectorRotateY(A0_270, A1_271)
end
VEC_ROTATE = L0_0
function L0_0(A0_272, A1_273)
  BBMath(A0_272, A1_273)
end
BBVectorMath = L0_0
function L0_0(A0_274, A1_275)
  local L2_276, L3_277, L4_278, L5_279
  L2_276 = A0_274.InstanceVars
  L3_277 = L2_276.InterpDelta
  if L3_277 == nil then
    L3_277 = A1_275.Amount
    L4_278 = A1_275.AmountVar
    if L4_278 ~= nil then
      L4_278 = GetTable
      L5_279 = A0_274
      L4_278 = L4_278(L5_279, A1_275.AmountVarTable)
      L5_279 = A1_275.AmountVar
      L3_277 = L4_278[L5_279]
    end
    L4_278 = GetPosition
    L5_279 = A1_275.TargetVar
    L5_279 = A0_274[L5_279]
    L4_278 = L4_278(L5_279)
    L2_276.KnockBackStart = L4_278
    L4_278 = GetNormalizedPositionDelta
    L5_279 = A1_275.TargetVar
    L5_279 = A0_274[L5_279]
    L4_278 = L4_278(L5_279, A0_274[A1_275.AttackerVar], true)
    L5_279 = {}
    L5_279.x = L4_278.x * L3_277
    L5_279.y = 0
    L5_279.z = L4_278.z * L3_277
    L2_276.InterpDelta = L5_279
    L5_279 = GetTime
    L5_279 = L5_279()
    L2_276.StartTime = L5_279
    L5_279 = A1_275.KnockBackDuration
    L2_276.KnockBackDuration = L5_279
  end
  L3_277 = A1_275.TargetVar
  L3_277 = A0_274[L3_277]
  L4_278 = GetTime
  L4_278 = L4_278()
  L5_279 = L2_276.StartTime
  L4_278 = L4_278 - L5_279
  L5_279 = L2_276.KnockBackDuration
  L4_278 = L4_278 / L5_279
  L5_279 = {}
  L5_279.x = L2_276.KnockBackStart.x + L2_276.InterpDelta.x * L4_278
  L5_279.y = L2_276.KnockBackStart.y
  L5_279.z = L2_276.KnockBackStart.z + L2_276.InterpDelta.z * L4_278
  SetPosition(L3_277, L5_279)
end
BBKnockback = L0_0
function L0_0(A0_280, A1_281)
  local L2_282, L3_283
  L2_282 = GetParam
  L3_283 = "Left"
  L2_282 = L2_282(L3_283, A0_280, A1_281)
  L3_283 = GetParam
  L3_283 = L3_283("Right", A0_280, A1_281)
  GetTable(A0_280, A1_281.DestVarTable, true)[A1_281.DestVar] = tostring(L2_282) .. tostring(L3_283)
end
BBAppendString = L0_0
function L0_0(A0_284, A1_285)
  local L2_286
  L2_286 = 0
  if A1_285.Delta ~= nil then
    L2_286 = L2_286 + A1_285.Delta
  end
  if A1_285.DeltaByLevel ~= nil and A0_284.Level ~= nil then
    L2_286 = L2_286 + A1_285.DeltaByLevel[A0_284.Level]
  end
  if A1_285.DeltaVar ~= nil then
    L2_286 = L2_286 + GetTable(A0_284, A1_285.DeltaVarTable, true)[A1_285.DeltaVar]
  end
  if A1_285.TargetVar ~= nil then
    A1_285.Stat(L2_286, A0_284[A1_285.TargetVar])
  else
    A1_285.Stat(L2_286)
  end
end
BBIncStat = L0_0
function L0_0(A0_287, A1_288)
  local L2_289
  L2_289 = 0
  if A1_288.Delta ~= nil then
    L2_289 = L2_289 + A1_288.Delta
  end
  if A1_288.DeltaByLevel ~= nil and A0_287.Level ~= nil then
    L2_289 = L2_289 + A1_288.DeltaByLevel[A0_287.Level]
  end
  if A1_288.DeltaVar ~= nil then
    L2_289 = L2_289 + GetTable(A0_287, A1_288.DeltaVarTable, true)[A1_288.DeltaVar]
  end
  if A1_288.TargetVar ~= nil then
    A1_288.Stat(L2_289, A0_287[A1_288.TargetVar])
  else
    A1_288.Stat(L2_289)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_290, A1_291)
  if A1_291.AttackVar ~= nil then
  end
  if A1_291.Attack ~= nil then
  end
  if A1_291.TotalCoefficientVar ~= nil then
  end
  if A1_291.TotalCoefficient ~= nil then
  end
  if A1_291.TargetVar ~= nil then
    GetTable(A0_290, A1_291.DestVarTable, false)[A1_291.DestVar] = (0 + GetTable(A0_290, A1_291.AttackVarTable, true)[A1_291.AttackVar] + A1_291.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_290[A1_291.TargetVar])) + GetFlatCritDamageMod(A0_290[A1_291.TargetVar])) * (0 + GetTable(A0_290, A1_291.TotalCoefficientVarTable, true)[A1_291.TotalCoefficientVar] + A1_291.TotalCoefficient)
  else
    GetTable(A0_290, A1_291.DestVarTable, false)[A1_291.DestVar] = 2 * A1_291.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_292, A1_293)
  local L2_294, L3_295, L4_296, L5_297, L6_298
  L2_294 = GetTable
  L3_295 = A0_292
  L4_296 = A1_293.DestVarTable
  L5_297 = false
  L2_294 = L2_294(L3_295, L4_296, L5_297)
  L3_295 = A1_293.AmountVar
  if L3_295 ~= nil then
    L3_295 = A1_293.HealShieldMod
    if L3_295 ~= nil and L3_295 == true then
      L4_296 = GetTable
      L5_297 = A0_292
      L6_298 = A1_293.AmountVarTable
      L4_296 = L4_296(L5_297, L6_298, true)
      L5_297 = A1_293.AttackerVar
      L6_298 = 0
      if L5_297 ~= nil then
        L6_298 = GetPercentHealingAmountMod(A0_292[L5_297])
      end
      L4_296[A1_293.AmountVar] = (A1_293.Amount + L4_296[A1_293.AmountVar]) * (1 + L6_298)
    end
  end
  L3_295 = BBIncreaseShield
  L4_296 = A0_292
  L5_297 = A1_293
  L3_295(L4_296, L5_297)
end
BBInitializeShield = L0_0
function L0_0(A0_299, A1_300)
  if A1_300.CDVar ~= nil then
  end
  if A1_300.CD ~= nil then
  end
  if A1_300.TargetVar ~= nil then
    GetTable(A0_299, A1_300.DestVarTable, false)[A1_300.DestVar] = (0 + GetTable(A0_299, A1_300.CDVarTable, true)[A1_300.CDVar] + A1_300.CD) * (1 + GetPercentCooldownMod(A0_299[A1_300.TargetVar]))
  else
    GetTable(A0_299, A1_300.DestVarTable, false)[A1_300.DestVar] = A1_300.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_301, A1_302)
  if A1_302.TargetVar ~= nil then
    GetTable(A0_301, A1_302.DestVarTable, false)[A1_302.DestVar] = A1_302.Stat(A0_301[A1_302.TargetVar])
  else
    GetTable(A0_301, A1_302.DestVarTable, false)[A1_302.DestVar] = A1_302.Stat()
  end
end
BBGetStat = L0_0
function L0_0(A0_303, A1_304)
  if A1_304.TargetVar ~= nil then
    GetTable(A0_303, A1_304.DestVarTable, false)[A1_304.DestVar] = GetLevel(A0_303[A1_304.TargetVar])
  else
    GetTable(A0_303, A1_304.DestVarTable, false)[A1_304.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_305, A1_306)
  if A1_306.TargetVar ~= nil then
    GetTable(A0_305, A1_306.DestVarTable, false)[A1_306.DestVar] = GetUnitSignificance(A0_305[A1_306.TargetVar])
  else
    GetTable(A0_305, A1_306.DestVarTable, false)[A1_306.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_307, A1_308)
  if A1_308.TargetVar ~= nil then
    GetTable(A0_307, A1_308.DestVarTable, false)[A1_308.DestVar] = GetArmor(A0_307[A1_308.TargetVar])
  else
    GetTable(A0_307, A1_308.DestVarTable, false)[A1_308.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_309, A1_310)
  if A1_310.TargetVar ~= nil then
    GetTable(A0_309, A1_310.DestVarTable, false)[A1_310.DestVar] = GetSpellBlock(A0_309[A1_310.TargetVar])
  else
    GetTable(A0_309, A1_310.DestVarTable, false)[A1_310.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_311, A1_312)
  if A1_312.TargetVar ~= nil then
    GetTable(A0_311, A1_312.DestVarTable, false)[A1_312.DestVar] = GetTeamID(A0_311[A1_312.TargetVar])
  else
    GetTable(A0_311, A1_312.DestVarTable, false)[A1_312.DestVar] = GetTeamID()
  end
end
BBGetTeamID = L0_0
function L0_0(A0_313, A1_314)
  local L2_315, L3_316, L4_317
  L2_315 = GetTable
  L3_316 = A0_313
  L4_317 = A1_314.DestVarTable
  L2_315 = L2_315(L3_316, L4_317, false)
  L3_316 = A1_314.TargetVar
  L4_317 = nil
  if L3_316 ~= nil then
    L4_317 = GetTeamID(A0_313[L3_316])
  else
    L4_317 = GetTeamID()
  end
  if L4_317 == TEAM_ORDER then
    L2_315[A1_314.DestVar] = TEAM_CHAOS
  elseif L4_317 == TEAM_CHAOS then
    L2_315[A1_314.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_318, A1_319)
  if A1_319.TargetVar ~= nil then
    GetTable(A0_318, A1_319.DestVarTable, false)[A1_319.DestVar] = GetUnitSkinName(A0_318[A1_319.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_320, A1_321)
  if A1_321.TargetVar ~= nil then
    GetTable(A0_320, A1_321.DestVarTable, false)[A1_321.DestVar] = GetTotalAttackDamage(A0_320[A1_321.TargetVar])
  else
    GetTable(A0_320, A1_321.DestVarTable, false)[A1_321.DestVar] = GetTotalAttackDamage()
  end
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_322, A1_323)
  GetTable(A0_322, A1_323.DestVarTable, true)[A1_323.DestVar] = A1_323.Status(A0_322[A1_323.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_324, A1_325)
  local L2_326
  L2_326 = A1_325.TargetVar
  L2_326 = A0_324[L2_326]
  ClearAttackTarget(L2_326)
end
BBClearAttackTarget = L0_0
function L0_0(A0_327, A1_328)
  GetTable(A0_327, A1_328.DestVarTable, true)[A1_328.DestVar] = A1_328.Info(A0_327[A1_328.TargetVar])
end
BBGetCastInfo = L0_0
function L0_0(A0_329, A1_330, A2_331)
  local L3_332, L4_333, L5_334, L6_335
  L3_332 = GetTable
  L4_333 = A0_329
  L5_334 = A1_330.TrackTimeVarTable
  L6_335 = false
  L3_332 = L3_332(L4_333, L5_334, L6_335)
  L4_333 = GetTime
  L4_333 = L4_333()
  L5_334 = A1_330.ExecuteImmediately
  L6_335 = GetParam
  L6_335 = L6_335("TimeBetweenExecutions", A0_329, A1_330)
  if A1_330.TickTimeVar ~= nil and GetTable(A0_329, A1_330.TickTimeVarTable, false)[A1_330.TickTimeVar] ~= nil then
    L6_335 = GetTable(A0_329, A1_330.TickTimeVarTable, false)[A1_330.TickTimeVar]
  end
  if L3_332[A1_330.TrackTimeVar] == nil then
    L3_332[A1_330.TrackTimeVar] = L4_333
    if L5_334 == true then
      ExecuteBuildingBlocks(A2_331, A0_329)
    end
  end
  if L4_333 >= L3_332[A1_330.TrackTimeVar] + L6_335 then
    L3_332[A1_330.TrackTimeVar] = L3_332[A1_330.TrackTimeVar] + L6_335
    ExecuteBuildingBlocks(A2_331, A0_329)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_336, A1_337, A2_338)
  GetTable(A0_336, A1_337.TrackTimeVarTable, false)[A1_337.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_339, A1_340)
  local L2_341
  L2_341 = A1_340.SrcValue
  if A1_340.SrcVar ~= nil then
    L2_341 = GetTable(A0_339, A1_340.SrcVarTable, true)[A1_340.SrcVar]
  end
  A1_340.Status(A0_339[A1_340.TargetVar], L2_341)
end
BBSetStatus = L0_0
function L0_0(A0_342, A1_343)
  local L2_344
  L2_344 = A1_343.ToAlert
  if GetTable(A0_342, A1_343.SrcVarTable, false) ~= nil and A1_343.SrcVar ~= nil then
    L2_344 = L2_344 .. GetTable(A0_342, A1_343.SrcVarTable, false)[A1_343.SrcVar]
  end
  _ALERT(L2_344)
end
BBAlert = L0_0
function L0_0(A0_345, A1_346)
  local L2_347, L3_348, L4_349, L5_350, L6_351, L7_352
  L2_347 = GetParam
  L3_348 = "Message"
  L4_349 = A0_345
  L5_350 = A1_346
  L2_347 = L2_347(L3_348, L4_349, L5_350)
  if L2_347 == nil then
    L3_348 = ReportError
    L4_349 = "Could not resolve Message param"
    L3_348(L4_349)
    return
  end
  L3_348 = true
  L4_349 = GetParam
  L5_350 = "OnUnit"
  L6_351 = A0_345
  L7_352 = A1_346
  L4_349 = L4_349(L5_350, L6_351, L7_352)
  if L4_349 == nil then
    L3_348 = false
    L5_350 = GetParam
    L6_351 = "OnUnitByFlag"
    L7_352 = A0_345
    L5_350 = L5_350(L6_351, L7_352, A1_346)
    L4_349 = L5_350
  end
  if L4_349 == nil then
    L5_350 = ReportError
    L6_351 = "Could not resolve OnUnit param"
    L5_350(L6_351)
    return
  end
  L5_350 = true
  L6_351 = GetParam
  L7_352 = "ChampionToSayTo"
  L6_351 = L6_351(L7_352, A0_345, A1_346)
  if L6_351 == nil then
    L5_350 = false
    L7_352 = GetParam
    L7_352 = L7_352("ChampionToSayToByFlag", A0_345, A1_346)
    L6_351 = L7_352
  end
  if L6_351 == nil then
    L7_352 = ReportError
    L7_352("Could not resolve ChampionToSayTo param")
    return
  end
  L7_352 = GetParam
  L7_352 = L7_352("ShowToSpectator", A0_345, A1_346)
  if L7_352 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  SayWithFloatingTextOnUnitToChampion(tostring(L2_347), A1_346.TextType, L4_349, L3_348, L6_351, L5_350, L7_352)
end
BBSayWithFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_353, A1_354)
  local L2_355, L3_356, L4_357
  L2_355 = A1_354.ToSay
  L3_356 = GetTable
  L4_357 = A0_353
  L3_356 = L3_356(L4_357, A1_354.SrcVarTable, false)
  if L3_356 ~= nil then
    L4_357 = A1_354.SrcVar
    if L4_357 ~= nil then
      L4_357 = L2_355
      L2_355 = L4_357 .. tostring(L3_356[A1_354.SrcVar])
    end
  end
  L4_357 = nil
  if A1_354.OwnerVar ~= nil then
    L4_357 = A0_353[A1_354.OwnerVar]
  else
    L4_357 = A0_353.Owner
  end
  if A1_354.TextType == nil then
    A1_354.TextType = 0
  end
  Say(L4_357, L2_355, A1_354.TextType)
end
BBSay = L0_0
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
BBDebugSay = L0_0
function L0_0(A0_363, A1_364)
  GetTable(A0_363, A1_364.DestVarTable, true)[A1_364.DestVar] = BBLuaGetGold(A0_363, A1_364)
end
BBGetGold = L0_0
function L0_0(A0_365, A1_366)
  GetTable(A0_365, A1_366.DestVarTable, true)[A1_366.DestVar] = BBLuaGetTotalGold(A0_365, A1_366)
end
BBGetTotalGold = L0_0
function L0_0(A0_367, A1_368)
  SpellBuffAdd(A0_367[A1_368.OwnerVar], A0_367[A1_368.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_367.NextBuffVars)
  BBTeleportToPositionHelper(A0_367, A1_368)
end
BBTeleportToPosition = L0_0
function L0_0(A0_369, A1_370)
  if A1_370.XVar ~= nil and GetTable(A0_369, A1_370.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_369, A1_370.XVarTable, true)[A1_370.XVar]
  else
    Xloc = A1_370.X
  end
  if A1_370.YVar ~= nil and GetTable(A0_369, A1_370.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_369, A1_370.YVarTable, true)[A1_370.YVar]
  else
    Yloc = A1_370.Y
  end
  if A1_370.ZVar ~= nil and GetTable(A0_369, A1_370.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_369, A1_370.ZVarTable, true)[A1_370.ZVar]
  else
    Zloc = A1_370.Z
  end
  A1_370.OwnerVar, A0_369.position = A1_370.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_370.CastPositionName = "position"
  BBTeleportToPosition(A0_369, A1_370)
end
BBTeleportToPoint = L0_0
function L0_0(A0_371, A1_372)
  DefUpdateAura(GetTable(A0_371, A1_372.CenterTable, false)[A1_372.CenterVar], A1_372.Range, A1_372.UnitScan, A1_372.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_373, A1_374)
  ReincarnateNonDeadHero(GetTable(A0_373, A1_374.TargetTable, false)[A1_374.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_375, A1_376)
  GetTable(A0_375, A1_376.DestVarTable, true)[A1_376.DestVar] = A1_376.Function(A0_375[A1_376.OwnerVar], A1_376.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_377, A1_378)
  local L2_379, L3_380, L4_381, L5_382
  L2_379 = A1_378.WhomToOrderVar
  L2_379 = A0_377[L2_379]
  L3_380 = A1_378.TargetOfOrderVar
  L3_380 = A0_377[L3_380]
  L4_381 = GetTable
  L5_382 = A0_377
  L4_381 = L4_381(L5_382, A1_378.SrcVarTable, false)
  L5_382 = nil
  if A1_378.SrcVar ~= nil and L4_381 ~= nil then
    L5_382 = L4_381[A1_378.SrcVar]
  else
    L5_382 = GetPosition(L3_380)
  end
  if L3_380 == nil then
    L3_380 = L2_379
  end
  IssueOrder(L2_379, A1_378.Order, L5_382, L3_380)
end
BBIssueOrder = L0_0
function L0_0(A0_383, A1_384)
  local L2_385
  L2_385 = GetParam
  L2_385 = L2_385("NewRange", A0_383, A1_384)
  SetSpellCastRange(L2_385)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_386, A1_387)
  GetTable(A0_386, A1_387.DestVarTable, true)[A1_387.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_388, A1_389)
  local L2_390, L3_391
  L2_390 = A1_389.ObjectVar1
  L2_390 = A0_388[L2_390]
  L3_391 = A1_389.ObjectVar2
  L3_391 = A0_388[L3_391]
  GetTable(A0_388, A1_389.DestVarTable, true)[A1_389.DestVar] = DistanceBetweenObjectBounds(L2_390, L3_391)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_392, A1_393)
  local L2_394, L3_395, L4_396
  L2_394 = A1_393.ObjectVar
  L2_394 = A0_392[L2_394]
  L3_395 = GetTable
  L4_396 = A0_392
  L3_395 = L3_395(L4_396, A1_393.PointVarTable, true)
  L4_396 = A1_393.PointVar
  L4_396 = L3_395[L4_396]
  GetTable(A0_392, A1_393.DestVarTable, true)[A1_393.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_394, L4_396)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_397, A1_398)
  local L2_399, L3_400
  L2_399 = GetParam
  L3_400 = "Point1"
  L2_399 = L2_399(L3_400, A0_397, A1_398)
  L3_400 = GetParam
  L3_400 = L3_400("Point2", A0_397, A1_398)
  GetTable(A0_397, A1_398.DestVarTable, true)[A1_398.DestVar] = DistanceBetweenPoints(L2_399, L3_400)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_401, A1_402, A2_403)
  local L3_404, L4_405, L5_406, L6_407, L7_408, L8_409
  L5_406 = 0
  L6_407 = nil
  L7_408 = A1_402.ObjectDistanceType
  L8_409 = A1_402.ObjectVar1
  L3_404 = A0_401[L8_409]
  L8_409 = A1_402.ObjectVar2
  L4_405 = A0_401[L8_409]
  if nil == L4_405 then
    L8_409 = A1_402.Point2Var
    if nil ~= L8_409 then
      L8_409 = GetTable
      L8_409 = L8_409(A0_401, A1_402.Point2VarTable, true)
      L4_405 = L8_409[A1_402.Point2Var]
      L5_406 = L5_406 + 1
    end
  end
  if nil == L3_404 then
    L8_409 = A1_402.Point1Var
    if nil ~= L8_409 then
      L8_409 = GetTable
      L8_409 = L8_409(A0_401, A1_402.Point1VarTable, true)
      L3_404 = L8_409[A1_402.Point1Var]
      L5_406 = L5_406 + 1
      if 1 == L5_406 then
        L3_404, L4_405 = L4_405, L3_404
      end
    end
  end
  if nil ~= L7_408 then
    if 0 == L5_406 then
      L8_409 = OBJECT_CENTER
      if L8_409 == L7_408 then
        L6_407 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_409 = OBJECT_BOUNDARY
        if L8_409 == L7_408 then
          L6_407 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_409 = A1_402.OwnerVar
          L8_409 = A0_401[L8_409]
          Say(L8_409, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_406 then
      L8_409 = OBJECT_CENTER
      if L8_409 == L7_408 then
        L6_407 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_409 = OBJECT_BOUNDARY
        if L8_409 == L7_408 then
          L6_407 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_409 = A1_402.OwnerVar
          L8_409 = A0_401[L8_409]
          Say(L8_409, "invalid object distance type", 0)
        end
      end
    else
      L6_407 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_409 = A1_402.Distance
  if A1_402.DistanceVar ~= nil and GetTable(A0_401, A1_402.DistanceVarTable, true) ~= nil then
    L8_409 = L8_409 + GetTable(A0_401, A1_402.DistanceVarTable, true)[A1_402.DistanceVar]
  end
  if L3_404 ~= nil and L4_405 ~= nil and L6_407 ~= nil and L8_409 ~= nil then
    if not L6_407(L3_404, L4_405, L8_409) then
      ExecuteBuildingBlocks(A2_403, A0_401)
      A0_401.LastIfSucceeded = true
    else
      A0_401.LastIfSucceeded = false
    end
  else
    A0_401.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_410, A1_411)
  local L2_412, L3_413
  L2_412 = A1_411.TargetVar
  L2_412 = A0_410[L2_412]
  L3_413 = A1_411.CasterVar
  L3_413 = A0_410[L3_413]
  GetTable(A0_410, A1_411.DestVarTable, true)[A1_411.DestVar] = SpellBuffCount(L2_412, A1_411.BuffName, L3_413)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_414, A1_415)
  local L2_416
  L2_416 = A1_415.TargetVar
  L2_416 = A0_414[L2_416]
  GetTable(A0_414, A1_415.DestVarTable, true)[A1_415.DestVar] = SpellBuffCount(L2_416, A1_415.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_417, A1_418)
  local L2_419, L3_420
  L2_419 = GetTable
  L3_420 = A0_417
  L2_419 = L2_419(L3_420, A1_418.ScaleVarTable, false)
  L3_420 = nil
  if A1_418.OwnerVar ~= nil then
    L3_420 = A0_417[A1_418.OwnerVar]
  else
    L3_420 = A0_417.Owner
  end
  if A1_418.ScaleVar ~= nil and A1_418.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_419[A1_418.ScaleVar], L3_420)
  else
    SetScaleSkinCoef(A1_418.Scale, L3_420)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_421, A1_422)
  SpellBuffAdd(A0_421[A1_422.TargetVar], A0_421[A1_422.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_421.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_423, A1_424, A2_425)
  local L3_426, L4_427
  L3_426 = A1_424.TargetVar
  L3_426 = A0_423[L3_426]
  L4_427 = A1_424.NumStacks
  if GetParam("NumStacks", A0_423, A1_424) == 0 then
    L4_427 = SpellBuffCount(L3_426, A1_424.BuffName, caster)
  else
    L4_427 = GetParam("NumStacks", A0_423, A1_424)
  end
  while L4_427 > 0 do
    SpellBuffRemove(L3_426, A1_424.BuffName, A0_423[A1_424.AttackerVar])
    L4_427 = L4_427 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_428, A1_429, A2_430)
  if A0_428.EmoteId == A1_429.EmoteId then
    ExecuteBuildingBlocks(A2_430, A0_428)
    A0_428.LastIfSucceeded = true
  else
    A0_428.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_431, A1_432, A2_433)
  if A0_431.EmoteId ~= A1_432.EmoteId then
    ExecuteBuildingBlocks(A2_433, A0_431)
    A0_431.LastIfSucceeded = true
  else
    A0_431.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_434, A1_435)
  local L2_436, L3_437, L4_438, L5_439
  L2_436 = GetTable
  L3_437 = A0_434
  L4_438 = A1_435.String1VarTable
  L5_439 = false
  L2_436 = L2_436(L3_437, L4_438, L5_439)
  L3_437 = A1_435.String1Var
  L3_437 = L2_436[L3_437]
  L4_438 = GetTable
  L5_439 = A0_434
  L4_438 = L4_438(L5_439, A1_435.String2VarTable, false)
  L5_439 = A1_435.String2Var
  L5_439 = L4_438[L5_439]
  GetTable(A0_434, A1_435.ResultVarTable, false)[A1_435.ResultVar] = L3_437 .. L5_439
end
BBConcatenateStrings = L0_0
function L0_0(A0_440, A1_441)
  BBGetMinionKills(A0_440, A1_441)
  A0_440.MinionKillSource = GetParam("MinionKillTarget")
  A0_440.MinionKills = A0_440.MinionsKilled + GetParam("MinionKills", A0_440, A1_441)
  BBSetMinionKills(A0_440, A1_441)
end
BBIncreaseMinionKills = L0_0
