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
  local L2_294, L3_295, L4_296, L5_297, L6_298, L7_299
  L2_294 = GetTable
  L3_295 = A0_292
  L4_296 = A1_293.DestVarTable
  L5_297 = false
  L2_294 = L2_294(L3_295, L4_296, L5_297)
  L3_295 = GetTable
  L4_296 = A0_292
  L5_297 = A1_293.AmountVarTable
  L6_298 = true
  L3_295 = L3_295(L4_296, L5_297, L6_298)
  L4_296 = GetTable
  L5_297 = A0_292
  L6_298 = A0_292.NextBuffVars
  L7_299 = false
  L4_296 = L4_296(L5_297, L6_298, L7_299)
  L5_297 = A1_293.AmountVar
  L5_297 = L3_295[L5_297]
  L6_298 = A1_293.Amount
  L5_297 = L5_297 + L6_298
  L4_296.InitializeShield_Amount = L5_297
  L5_297 = A1_293.AmountVar
  if L5_297 ~= nil then
    L5_297 = A1_293.HealShieldMod
    if L5_297 ~= nil and L5_297 == true then
      L6_298 = A1_293.AttackerVar
      L7_299 = 0
      if L6_298 ~= nil then
        L7_299 = GetPercentHealingAmountMod(A0_292[L6_298])
      end
      L4_296.InitializeShield_Amount, L3_295[A1_293.AmountVar] = (A1_293.Amount + L3_295[A1_293.AmountVar]) * (1 + L7_299), (A1_293.Amount + L3_295[A1_293.AmountVar]) * (1 + L7_299)
    end
  end
  L5_297 = SpellBuffAddNoRenew
  L6_298 = A1_293.AttackerVar
  L6_298 = A0_292[L6_298]
  L7_299 = A1_293.UnitVar
  L7_299 = A0_292[L7_299]
  L5_297(L6_298, L7_299, "InitializeShieldMarker", 0, 1, 25000, L4_296)
  L5_297 = BBIncreaseShield
  L6_298 = A0_292
  L7_299 = A1_293
  L5_297(L6_298, L7_299)
end
BBInitializeShield = L0_0
function L0_0(A0_300, A1_301)
  if A1_301.CDVar ~= nil then
  end
  if A1_301.CD ~= nil then
  end
  if A1_301.TargetVar ~= nil then
    GetTable(A0_300, A1_301.DestVarTable, false)[A1_301.DestVar] = (0 + GetTable(A0_300, A1_301.CDVarTable, true)[A1_301.CDVar] + A1_301.CD) * (1 + GetPercentCooldownMod(A0_300[A1_301.TargetVar]))
  else
    GetTable(A0_300, A1_301.DestVarTable, false)[A1_301.DestVar] = A1_301.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_302, A1_303)
  if A1_303.TargetVar ~= nil then
    GetTable(A0_302, A1_303.DestVarTable, false)[A1_303.DestVar] = A1_303.Stat(A0_302[A1_303.TargetVar])
  else
    GetTable(A0_302, A1_303.DestVarTable, false)[A1_303.DestVar] = A1_303.Stat()
  end
end
BBGetStat = L0_0
function L0_0(A0_304, A1_305)
  if A1_305.TargetVar ~= nil then
    GetTable(A0_304, A1_305.DestVarTable, false)[A1_305.DestVar] = GetLevel(A0_304[A1_305.TargetVar])
  else
    GetTable(A0_304, A1_305.DestVarTable, false)[A1_305.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_306, A1_307)
  if A1_307.TargetVar ~= nil then
    GetTable(A0_306, A1_307.DestVarTable, false)[A1_307.DestVar] = GetUnitSignificance(A0_306[A1_307.TargetVar])
  else
    GetTable(A0_306, A1_307.DestVarTable, false)[A1_307.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_308, A1_309)
  if A1_309.TargetVar ~= nil then
    GetTable(A0_308, A1_309.DestVarTable, false)[A1_309.DestVar] = GetArmor(A0_308[A1_309.TargetVar])
  else
    GetTable(A0_308, A1_309.DestVarTable, false)[A1_309.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_310, A1_311)
  if A1_311.TargetVar ~= nil then
    GetTable(A0_310, A1_311.DestVarTable, false)[A1_311.DestVar] = GetSpellBlock(A0_310[A1_311.TargetVar])
  else
    GetTable(A0_310, A1_311.DestVarTable, false)[A1_311.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_312, A1_313)
  if A1_313.TargetVar ~= nil then
    GetTable(A0_312, A1_313.DestVarTable, false)[A1_313.DestVar] = GetTeamID(A0_312[A1_313.TargetVar])
  else
    GetTable(A0_312, A1_313.DestVarTable, false)[A1_313.DestVar] = GetTeamID()
  end
end
BBGetTeamID = L0_0
function L0_0(A0_314, A1_315)
  local L2_316, L3_317, L4_318
  L2_316 = GetTable
  L3_317 = A0_314
  L4_318 = A1_315.DestVarTable
  L2_316 = L2_316(L3_317, L4_318, false)
  L3_317 = A1_315.TargetVar
  L4_318 = nil
  if L3_317 ~= nil then
    L4_318 = GetTeamID(A0_314[L3_317])
  else
    L4_318 = GetTeamID()
  end
  if L4_318 == TEAM_ORDER then
    L2_316[A1_315.DestVar] = TEAM_CHAOS
  elseif L4_318 == TEAM_CHAOS then
    L2_316[A1_315.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_319, A1_320)
  if A1_320.TargetVar ~= nil then
    GetTable(A0_319, A1_320.DestVarTable, false)[A1_320.DestVar] = GetUnitSkinName(A0_319[A1_320.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_321, A1_322)
  if A1_322.TargetVar ~= nil then
    GetTable(A0_321, A1_322.DestVarTable, false)[A1_322.DestVar] = GetTotalAttackDamage(A0_321[A1_322.TargetVar])
  else
    GetTable(A0_321, A1_322.DestVarTable, false)[A1_322.DestVar] = GetTotalAttackDamage()
  end
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_323, A1_324)
  GetTable(A0_323, A1_324.DestVarTable, true)[A1_324.DestVar] = A1_324.Status(A0_323[A1_324.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_325, A1_326)
  local L2_327
  L2_327 = A1_326.TargetVar
  L2_327 = A0_325[L2_327]
  ClearAttackTarget(L2_327)
end
BBClearAttackTarget = L0_0
function L0_0(A0_328, A1_329)
  GetTable(A0_328, A1_329.DestVarTable, true)[A1_329.DestVar] = A1_329.Info(A0_328[A1_329.TargetVar])
end
BBGetCastInfo = L0_0
function L0_0(A0_330, A1_331, A2_332)
  local L3_333, L4_334, L5_335, L6_336
  L3_333 = GetTable
  L4_334 = A0_330
  L5_335 = A1_331.TrackTimeVarTable
  L6_336 = false
  L3_333 = L3_333(L4_334, L5_335, L6_336)
  L4_334 = GetTime
  L4_334 = L4_334()
  L5_335 = A1_331.ExecuteImmediately
  L6_336 = GetParam
  L6_336 = L6_336("TimeBetweenExecutions", A0_330, A1_331)
  if A1_331.TickTimeVar ~= nil and GetTable(A0_330, A1_331.TickTimeVarTable, false)[A1_331.TickTimeVar] ~= nil then
    L6_336 = GetTable(A0_330, A1_331.TickTimeVarTable, false)[A1_331.TickTimeVar]
  end
  if L3_333[A1_331.TrackTimeVar] == nil then
    L3_333[A1_331.TrackTimeVar] = L4_334
    if L5_335 == true then
      ExecuteBuildingBlocks(A2_332, A0_330)
    end
  end
  if L4_334 >= L3_333[A1_331.TrackTimeVar] + L6_336 then
    L3_333[A1_331.TrackTimeVar] = L3_333[A1_331.TrackTimeVar] + L6_336
    ExecuteBuildingBlocks(A2_332, A0_330)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_337, A1_338, A2_339)
  GetTable(A0_337, A1_338.TrackTimeVarTable, false)[A1_338.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_340, A1_341)
  local L2_342
  L2_342 = A1_341.SrcValue
  if A1_341.SrcVar ~= nil then
    L2_342 = GetTable(A0_340, A1_341.SrcVarTable, true)[A1_341.SrcVar]
  end
  A1_341.Status(A0_340[A1_341.TargetVar], L2_342)
end
BBSetStatus = L0_0
function L0_0(A0_343, A1_344)
  local L2_345
  L2_345 = A1_344.ToAlert
  if GetTable(A0_343, A1_344.SrcVarTable, false) ~= nil and A1_344.SrcVar ~= nil then
    L2_345 = L2_345 .. GetTable(A0_343, A1_344.SrcVarTable, false)[A1_344.SrcVar]
  end
  _ALERT(L2_345)
end
BBAlert = L0_0
function L0_0(A0_346, A1_347)
  local L2_348, L3_349, L4_350, L5_351, L6_352, L7_353
  L2_348 = GetParam
  L3_349 = "Message"
  L4_350 = A0_346
  L5_351 = A1_347
  L2_348 = L2_348(L3_349, L4_350, L5_351)
  if L2_348 == nil then
    L3_349 = ReportError
    L4_350 = "Could not resolve Message param"
    L3_349(L4_350)
    return
  end
  L3_349 = true
  L4_350 = GetParam
  L5_351 = "OnUnit"
  L6_352 = A0_346
  L7_353 = A1_347
  L4_350 = L4_350(L5_351, L6_352, L7_353)
  if L4_350 == nil then
    L3_349 = false
    L5_351 = GetParam
    L6_352 = "OnUnitByFlag"
    L7_353 = A0_346
    L5_351 = L5_351(L6_352, L7_353, A1_347)
    L4_350 = L5_351
  end
  if L4_350 == nil then
    L5_351 = ReportError
    L6_352 = "Could not resolve OnUnit param"
    L5_351(L6_352)
    return
  end
  L5_351 = true
  L6_352 = GetParam
  L7_353 = "ChampionToSayTo"
  L6_352 = L6_352(L7_353, A0_346, A1_347)
  if L6_352 == nil then
    L5_351 = false
    L7_353 = GetParam
    L7_353 = L7_353("ChampionToSayToByFlag", A0_346, A1_347)
    L6_352 = L7_353
  end
  if L6_352 == nil then
    L7_353 = ReportError
    L7_353("Could not resolve ChampionToSayTo param")
    return
  end
  L7_353 = GetParam
  L7_353 = L7_353("ShowToSpectator", A0_346, A1_347)
  if L7_353 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  SayWithFloatingTextOnUnitToChampion(tostring(L2_348), A1_347.TextType, L4_350, L3_349, L6_352, L5_351, L7_353)
end
BBSayWithFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_354, A1_355)
  local L2_356, L3_357, L4_358
  L2_356 = A1_355.ToSay
  L3_357 = GetTable
  L4_358 = A0_354
  L3_357 = L3_357(L4_358, A1_355.SrcVarTable, false)
  if L3_357 ~= nil then
    L4_358 = A1_355.SrcVar
    if L4_358 ~= nil then
      L4_358 = L2_356
      L2_356 = L4_358 .. tostring(L3_357[A1_355.SrcVar])
    end
  end
  L4_358 = nil
  if A1_355.OwnerVar ~= nil then
    L4_358 = A0_354[A1_355.OwnerVar]
  else
    L4_358 = A0_354.Owner
  end
  if A1_355.TextType == nil then
    A1_355.TextType = 0
  end
  Say(L4_358, L2_356, A1_355.TextType)
end
BBSay = L0_0
function L0_0(A0_359, A1_360)
  local L2_361, L3_362, L4_363
  L2_361 = A1_360.ToSay
  L3_362 = GetTable
  L4_363 = A0_359
  L3_362 = L3_362(L4_363, A1_360.SrcVarTable, false)
  if L3_362 ~= nil then
    L4_363 = A1_360.SrcVar
    if L4_363 ~= nil then
      L4_363 = L2_361
      L2_361 = L4_363 .. tostring(L3_362[A1_360.SrcVar])
    end
  end
  L4_363 = nil
  if A1_360.OwnerVar ~= nil then
    L4_363 = A0_359[A1_360.OwnerVar]
  else
    L4_363 = A0_359.Owner
  end
  if A1_360.TextType == nil then
    A1_360.TextType = 0
  end
  Say(L4_363, L2_361, A1_360.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_364, A1_365)
  GetTable(A0_364, A1_365.DestVarTable, true)[A1_365.DestVar] = BBLuaGetGold(A0_364, A1_365)
end
BBGetGold = L0_0
function L0_0(A0_366, A1_367)
  GetTable(A0_366, A1_367.DestVarTable, true)[A1_367.DestVar] = BBLuaGetTotalGold(A0_366, A1_367)
end
BBGetTotalGold = L0_0
function L0_0(A0_368, A1_369)
  SpellBuffAdd(A0_368[A1_369.OwnerVar], A0_368[A1_369.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_368.NextBuffVars)
  BBTeleportToPositionHelper(A0_368, A1_369)
end
BBTeleportToPosition = L0_0
function L0_0(A0_370, A1_371)
  if A1_371.XVar ~= nil and GetTable(A0_370, A1_371.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_370, A1_371.XVarTable, true)[A1_371.XVar]
  else
    Xloc = A1_371.X
  end
  if A1_371.YVar ~= nil and GetTable(A0_370, A1_371.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_370, A1_371.YVarTable, true)[A1_371.YVar]
  else
    Yloc = A1_371.Y
  end
  if A1_371.ZVar ~= nil and GetTable(A0_370, A1_371.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_370, A1_371.ZVarTable, true)[A1_371.ZVar]
  else
    Zloc = A1_371.Z
  end
  A1_371.OwnerVar, A0_370.position = A1_371.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_371.CastPositionName = "position"
  BBTeleportToPosition(A0_370, A1_371)
end
BBTeleportToPoint = L0_0
function L0_0(A0_372, A1_373)
  DefUpdateAura(GetTable(A0_372, A1_373.CenterTable, false)[A1_373.CenterVar], A1_373.Range, A1_373.UnitScan, A1_373.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_374, A1_375)
  ReincarnateNonDeadHero(GetTable(A0_374, A1_375.TargetTable, false)[A1_375.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_376, A1_377)
  GetTable(A0_376, A1_377.DestVarTable, true)[A1_377.DestVar] = A1_377.Function(A0_376[A1_377.OwnerVar], A1_377.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_378, A1_379)
  local L2_380, L3_381, L4_382, L5_383
  L2_380 = A1_379.WhomToOrderVar
  L2_380 = A0_378[L2_380]
  L3_381 = A1_379.TargetOfOrderVar
  L3_381 = A0_378[L3_381]
  L4_382 = GetTable
  L5_383 = A0_378
  L4_382 = L4_382(L5_383, A1_379.SrcVarTable, false)
  L5_383 = nil
  if A1_379.SrcVar ~= nil and L4_382 ~= nil then
    L5_383 = L4_382[A1_379.SrcVar]
  else
    L5_383 = GetPosition(L3_381)
  end
  if L3_381 == nil then
    L3_381 = L2_380
  end
  IssueOrder(L2_380, A1_379.Order, L5_383, L3_381)
end
BBIssueOrder = L0_0
function L0_0(A0_384, A1_385)
  local L2_386
  L2_386 = GetParam
  L2_386 = L2_386("NewRange", A0_384, A1_385)
  SetSpellCastRange(L2_386)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_387, A1_388)
  GetTable(A0_387, A1_388.DestVarTable, true)[A1_388.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_389, A1_390)
  local L2_391, L3_392
  L2_391 = A1_390.ObjectVar1
  L2_391 = A0_389[L2_391]
  L3_392 = A1_390.ObjectVar2
  L3_392 = A0_389[L3_392]
  GetTable(A0_389, A1_390.DestVarTable, true)[A1_390.DestVar] = DistanceBetweenObjectBounds(L2_391, L3_392)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_393, A1_394)
  local L2_395, L3_396, L4_397
  L2_395 = A1_394.ObjectVar
  L2_395 = A0_393[L2_395]
  L3_396 = GetTable
  L4_397 = A0_393
  L3_396 = L3_396(L4_397, A1_394.PointVarTable, true)
  L4_397 = A1_394.PointVar
  L4_397 = L3_396[L4_397]
  GetTable(A0_393, A1_394.DestVarTable, true)[A1_394.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_395, L4_397)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_398, A1_399)
  local L2_400, L3_401
  L2_400 = GetParam
  L3_401 = "Point1"
  L2_400 = L2_400(L3_401, A0_398, A1_399)
  L3_401 = GetParam
  L3_401 = L3_401("Point2", A0_398, A1_399)
  GetTable(A0_398, A1_399.DestVarTable, true)[A1_399.DestVar] = DistanceBetweenPoints(L2_400, L3_401)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_402, A1_403, A2_404)
  local L3_405, L4_406, L5_407, L6_408, L7_409, L8_410
  L5_407 = 0
  L6_408 = nil
  L7_409 = A1_403.ObjectDistanceType
  L8_410 = A1_403.ObjectVar1
  L3_405 = A0_402[L8_410]
  L8_410 = A1_403.ObjectVar2
  L4_406 = A0_402[L8_410]
  if nil == L4_406 then
    L8_410 = A1_403.Point2Var
    if nil ~= L8_410 then
      L8_410 = GetTable
      L8_410 = L8_410(A0_402, A1_403.Point2VarTable, true)
      L4_406 = L8_410[A1_403.Point2Var]
      L5_407 = L5_407 + 1
    end
  end
  if nil == L3_405 then
    L8_410 = A1_403.Point1Var
    if nil ~= L8_410 then
      L8_410 = GetTable
      L8_410 = L8_410(A0_402, A1_403.Point1VarTable, true)
      L3_405 = L8_410[A1_403.Point1Var]
      L5_407 = L5_407 + 1
      if 1 == L5_407 then
        L3_405, L4_406 = L4_406, L3_405
      end
    end
  end
  if nil ~= L7_409 then
    if 0 == L5_407 then
      L8_410 = OBJECT_CENTER
      if L8_410 == L7_409 then
        L6_408 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_410 = OBJECT_BOUNDARY
        if L8_410 == L7_409 then
          L6_408 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_410 = A1_403.OwnerVar
          L8_410 = A0_402[L8_410]
          Say(L8_410, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_407 then
      L8_410 = OBJECT_CENTER
      if L8_410 == L7_409 then
        L6_408 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_410 = OBJECT_BOUNDARY
        if L8_410 == L7_409 then
          L6_408 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_410 = A1_403.OwnerVar
          L8_410 = A0_402[L8_410]
          Say(L8_410, "invalid object distance type", 0)
        end
      end
    else
      L6_408 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_410 = A1_403.Distance
  if A1_403.DistanceVar ~= nil and GetTable(A0_402, A1_403.DistanceVarTable, true) ~= nil then
    L8_410 = L8_410 + GetTable(A0_402, A1_403.DistanceVarTable, true)[A1_403.DistanceVar]
  end
  if L3_405 ~= nil and L4_406 ~= nil and L6_408 ~= nil and L8_410 ~= nil then
    if not L6_408(L3_405, L4_406, L8_410) then
      ExecuteBuildingBlocks(A2_404, A0_402)
      A0_402.LastIfSucceeded = true
    else
      A0_402.LastIfSucceeded = false
    end
  else
    A0_402.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_411, A1_412)
  local L2_413, L3_414
  L2_413 = A1_412.TargetVar
  L2_413 = A0_411[L2_413]
  L3_414 = A1_412.CasterVar
  L3_414 = A0_411[L3_414]
  GetTable(A0_411, A1_412.DestVarTable, true)[A1_412.DestVar] = SpellBuffCount(L2_413, A1_412.BuffName, L3_414)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_415, A1_416)
  local L2_417
  L2_417 = A1_416.TargetVar
  L2_417 = A0_415[L2_417]
  GetTable(A0_415, A1_416.DestVarTable, true)[A1_416.DestVar] = SpellBuffCount(L2_417, A1_416.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_418, A1_419)
  local L2_420, L3_421
  L2_420 = GetTable
  L3_421 = A0_418
  L2_420 = L2_420(L3_421, A1_419.ScaleVarTable, false)
  L3_421 = nil
  if A1_419.OwnerVar ~= nil then
    L3_421 = A0_418[A1_419.OwnerVar]
  else
    L3_421 = A0_418.Owner
  end
  if A1_419.ScaleVar ~= nil and A1_419.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_420[A1_419.ScaleVar], L3_421)
  else
    SetScaleSkinCoef(A1_419.Scale, L3_421)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_422, A1_423)
  SpellBuffAdd(A0_422[A1_423.TargetVar], A0_422[A1_423.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_422.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_424, A1_425, A2_426)
  local L3_427, L4_428
  L3_427 = A1_425.TargetVar
  L3_427 = A0_424[L3_427]
  L4_428 = A1_425.NumStacks
  if GetParam("NumStacks", A0_424, A1_425) == 0 then
    L4_428 = SpellBuffCount(L3_427, A1_425.BuffName, caster)
  else
    L4_428 = GetParam("NumStacks", A0_424, A1_425)
  end
  while L4_428 > 0 do
    SpellBuffRemove(L3_427, A1_425.BuffName, A0_424[A1_425.AttackerVar])
    L4_428 = L4_428 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_429, A1_430, A2_431)
  if A0_429.EmoteId == A1_430.EmoteId then
    ExecuteBuildingBlocks(A2_431, A0_429)
    A0_429.LastIfSucceeded = true
  else
    A0_429.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_432, A1_433, A2_434)
  if A0_432.EmoteId ~= A1_433.EmoteId then
    ExecuteBuildingBlocks(A2_434, A0_432)
    A0_432.LastIfSucceeded = true
  else
    A0_432.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_435, A1_436)
  local L2_437, L3_438, L4_439, L5_440
  L2_437 = GetTable
  L3_438 = A0_435
  L4_439 = A1_436.String1VarTable
  L5_440 = false
  L2_437 = L2_437(L3_438, L4_439, L5_440)
  L3_438 = A1_436.String1Var
  L3_438 = L2_437[L3_438]
  L4_439 = GetTable
  L5_440 = A0_435
  L4_439 = L4_439(L5_440, A1_436.String2VarTable, false)
  L5_440 = A1_436.String2Var
  L5_440 = L4_439[L5_440]
  GetTable(A0_435, A1_436.ResultVarTable, false)[A1_436.ResultVar] = L3_438 .. L5_440
end
BBConcatenateStrings = L0_0
function L0_0(A0_441, A1_442)
  BBGetMinionKills(A0_441, A1_442)
  A0_441.MinionKillSource = GetParam("MinionKillTarget")
  A0_441.MinionKills = A0_441.MinionsKilled + GetParam("MinionKills", A0_441, A1_442)
  BBSetMinionKills(A0_441, A1_442)
end
BBIncreaseMinionKills = L0_0
