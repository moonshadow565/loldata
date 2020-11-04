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
  if GetParam("Required", A0_15, A1_16) == nil then
    ClientPrint("Missing Required Variable: " .. A1_16.RequiredVar .. " Current block data is: " .. gCurrentBuildingBlockString)
  end
end
BBRequireVar = L0_0
function L0_0(A0_17, A1_18, A2_19)
  ExecuteBuildingBlocks(A2_19, A0_17)
end
BBCom = L0_0
function L0_0(A0_20, A1_21, A2_22)
  if A1_21.IsConditionTrue(A0_20) then
    ExecuteBuildingBlocks(A2_22, A0_20)
  end
end
BBConditionallyExecute = L0_0
function L0_0(A0_23, A1_24)
  local L2_25, L3_26
  L2_25 = GetTable
  L3_26 = A0_23
  L2_25 = L2_25(L3_26, A1_24.SrcVarTable, false)
  L3_26 = A1_24.ToSay
  L3_26 = L3_26 or ""
  ClientPrint(tostring(L3_26) .. ": " .. type(L2_25[A1_24.SrcVar]))
end
BBPrintTypeToChat = L0_0
function L0_0(A0_27, A1_28)
  local L2_29, L3_30, L4_31, L5_32, L6_33
  L2_29 = A1_28.ToSay
  L2_29 = L2_29 or ""
  L3_30 = A1_28.Color
  L3_30 = L3_30 or "FFFFFF"
  L4_31 = GetTable
  L5_32 = A0_27
  L6_33 = A1_28.SrcVarTable
  L4_31 = L4_31(L5_32, L6_33, false)
  L5_32 = A1_28.SrcVar
  L5_32 = L4_31[L5_32]
  L6_33 = "<font color=\""
  L6_33 = L6_33 .. L3_30 .. "\">"
  L6_33 = L6_33 .. L2_29
  if type(L5_32) ~= "table" and type(L5_32) ~= "nil" then
    L6_33 = L6_33 .. " " .. tostring(L5_32)
  end
  L6_33 = L6_33 .. "</font>"
  ClientPrint(L6_33)
  if type(L5_32) == "table" then
    PrintTableToChat(L5_32)
  end
end
BBPrintToChat = L0_0
function L0_0(A0_34, A1_35)
  local L2_36, L3_37
  L2_36 = GetTable
  L3_37 = A0_34
  L2_36 = L2_36(L3_37, A1_35.TableName, true)
  L3_37 = A1_35.TableName
  L3_37 = L3_37 or "PassThroughParams"
  ClientPrint(L3_37)
  PrintTableToChat(L2_36)
end
BBPrintTableToChat = L0_0
function L0_0(A0_38, A1_39)
  local L2_40, L3_41, L4_42, L5_43, L6_44, L7_45, L8_46, L9_47, L10_48, L11_49, L12_50, L13_51
  A1_39 = A1_39 or 0
  if A1_39 > 10 then
    return
  end
  L2_40 = nil
  L3_41 = "|"
  for L7_45 = 1, A1_39 do
    L9_47 = "----"
    L3_41 = L8_46 .. L9_47
  end
  L6_44(L7_45)
  for L9_47, L10_48 in L6_44(L7_45) do
    L11_49 = nil
    L12_50 = tostring
    L13_51 = L9_47
    L12_50 = L12_50(L13_51)
    if L12_50 == "PassThroughParams" then
      L11_49 = "{{ PassThroughParams }}"
    else
      L13_51 = type
      L13_51 = L13_51(L10_48)
      if L13_51 == "table" then
        L11_49 = "Table"
      else
        L13_51 = tostring
        L13_51 = L13_51(L10_48)
        L11_49 = L13_51
      end
    end
    L13_51 = L3_41
    L13_51 = L13_51 .. L12_50 .. ": " .. L11_49
    ClientPrint(L13_51)
    if type(L10_48) == "table" then
      PrintTableToChat(L10_48, A1_39 + 1)
    end
  end
  L6_44(L7_45)
end
PrintTableToChat = L0_0
function L0_0(A0_52, A1_53, A2_54)
  local L3_55
  if A1_53 ~= nil then
    L3_55 = A0_52[A1_53]
    if L3_55 == nil and A2_54 then
      A0_52[A1_53] = {}
      return A0_52[A1_53]
    end
  end
  if L3_55 == nil then
    L3_55 = A0_52
  end
  return L3_55
end
GetTable = L0_0
function L0_0(A0_56, A1_57, A2_58)
  if A2_58[A0_56 .. "Var"] ~= nil and GetTable(A1_57, A2_58[A0_56 .. "VarTable"], false) ~= nil then
    return GetTable(A1_57, A2_58[A0_56 .. "VarTable"], false)[A2_58[A0_56 .. "Var"]]
  else
    return A2_58[A0_56]
  end
end
GetParam = L0_0
function L0_0(A0_59, A1_60)
  GetTable(A0_59, A1_60.DestVarTable, true)[A1_60.DestVar] = {}
end
BBCreateCustomTable = L0_0
function L0_0(A0_61, A1_62)
  GetTable(A0_61, A1_62.TableNameVarTable, false)[A1_62.TableNameVar] = nil
end
BBDestroyCustomTable = L0_0
function L0_0(A0_63, A1_64)
  if type(GetTable(A0_63, A1_64.DestTableVarTable, false)[A1_64.DestTableVar]) == "nil" then
    GetTable(A0_63, A1_64.DestTableVarTable, false)[A1_64.DestTableVar] = {}
  end
  if type(GetTable(A0_63, A1_64.DestTableVarTable, false)[A1_64.DestTableVar]) == "table" then
    GetTable(A0_63, A1_64.DestTableVarTable, false)[A1_64.DestTableVar][GetParam("Key", A0_63, A1_64)] = GetParam("Value", A0_63, A1_64)
  end
end
BBSetKeyValueInCustomTable = L0_0
function L0_0(A0_65, A1_66)
  if type(GetTable(A0_65, A1_66.SrcTableVarTable, false)[A1_66.SrcTableVar]) == "table" then
    GetTable(A0_65, A1_66.DestVarTable, true)[A1_66.DestVar] = GetTable(A0_65, A1_66.SrcTableVarTable, false)[A1_66.SrcTableVar][GetParam("SrcKey", A0_65, A1_66)]
  end
end
BBGetKeyValueInCustomTable = L0_0
function L0_0(A0_67, A1_68)
  local L2_69, L3_70, L4_71
  L2_69 = GetTable
  L3_70 = A0_67
  L4_71 = A1_68.DestTableVarTable
  L2_69 = L2_69(L3_70, L4_71, false)
  L3_70 = GetParam
  L4_71 = "DestIndex"
  L3_70 = L3_70(L4_71, A0_67, A1_68)
  L4_71 = GetParam
  L4_71 = L4_71("Value", A0_67, A1_68)
  if type(L2_69[A1_68.DestTableVar]) == "nil" then
    L2_69[A1_68.DestTableVar] = {}
  end
  if type(L2_69[A1_68.DestTableVar]) == "table" then
    if L3_70 then
      table.insert(L2_69[A1_68.DestTableVar], L3_70, L4_71)
      if A1_68.OutIndexVar then
        GetTable(A0_67, A1_68.OutIndexVarTable, true)[A1_68.OutIndexVar] = L3_70
      end
    else
      table.insert(L2_69[A1_68.DestTableVar], L4_71)
      if A1_68.OutIndexVar then
        GetTable(A0_67, A1_68.OutIndexVarTable, true)[A1_68.OutIndexVar] = table.getn(L2_69[A1_68.DestTableVar])
      end
    end
  end
end
BBInsertIntoInCustomTable = L0_0
function L0_0(A0_72, A1_73)
  local L2_74, L3_75
  L2_74 = GetTable
  L3_75 = A0_72
  L2_74 = L2_74(L3_75, A1_73.TableVarTable, false)
  L3_75 = GetParam
  L3_75 = L3_75("Index", A0_72, A1_73)
  if type(L2_74[A1_73.TableVar]) == "nil" then
    ClientPrint("Table specified does not exist: " .. tostring(A1_73.TableVarTable) .. "." .. tostring(A1_73.TableVar))
    return
  end
  if type(L2_74[A1_73.TableVar]) == "table" then
    if L3_75 then
      table.remove(L2_74[A1_73.TableVar], L3_75, valueData)
    else
      ClientPrint("Specified index was nil: " .. tostring(A1_73.IndexVarTable) .. "." .. tostring(A1_73.IndexVar))
    end
  end
end
BBRemoveFromCustomTable = L0_0
function L0_0(A0_76, A1_77, A2_78)
  local L3_79, L4_80, L5_81, L6_82, L7_83, L8_84
  L3_79 = GetTable
  L3_79 = L3_79(L4_80, L5_81, L6_82)
  if L4_80 == "table" then
    if L4_80 then
      for L8_84, _FORV_9_ in L5_81(L6_82) do
        table.insert(L4_80, L8_84)
      end
      L5_81(L6_82)
      for L8_84, _FORV_9_ in L5_81(L6_82) do
        GetTable(A0_76, A1_77.DestKeyVarTable, true)[A1_77.DestKeyVar] = _FORV_9_
        GetTable(A0_76, A1_77.DestValueVarTable, true)[A1_77.DestValueVar] = L3_79[A1_77.TableVar][_FORV_9_]
        ExecuteBuildingBlocks(A2_78, A0_76)
      end
    else
      for L7_83, L8_84 in L4_80(L5_81) do
        GetTable(A0_76, A1_77.DestKeyVarTable, true)[A1_77.DestKeyVar] = L7_83
        GetTable(A0_76, A1_77.DestValueVarTable, true)[A1_77.DestValueVar] = L8_84
        ExecuteBuildingBlocks(A2_78, A0_76)
      end
    end
  end
end
BBForEachInCustomTable = L0_0
function L0_0(A0_85, A1_86)
  local L2_87, L3_88, L4_89, L5_90, L6_91
  L2_87 = GetTable
  L3_88 = A0_85
  L4_89 = A1_86.SrcTableVarTable
  L5_90 = false
  L2_87 = L2_87(L3_88, L4_89, L5_90)
  L3_88 = GetParam
  L4_89 = "Value"
  L5_90 = A0_85
  L6_91 = A1_86
  L3_88 = L3_88(L4_89, L5_90, L6_91)
  L4_89 = GetTable
  L5_90 = A0_85
  L6_91 = A1_86.MatchingKeyVarTable
  L4_89 = L4_89(L5_90, L6_91, false)
  L5_90 = GetTable
  L6_91 = A0_85
  L5_90 = L5_90(L6_91, A1_86.WasFoundVarTable, false)
  L6_91 = A1_86.WasFoundVar
  L5_90[L6_91] = false
  L6_91 = type
  L6_91 = L6_91(L2_87[A1_86.SrcTableVar])
  if L6_91 == "table" then
    L6_91 = GetTable
    L6_91 = L6_91(A0_85, A1_86.DestVarTable, true)
    for _FORV_10_, _FORV_11_ in pairs(L6_91) do
      if _FORV_11_ == L3_88 then
        L5_90[A1_86.WasFoundVar] = true
        L4_89[A1_86.MatchingKeyVar] = _FORV_10_
      end
    end
  end
end
BBCustomTableContainsValue = L0_0
function L0_0(A0_92, A1_93, A2_94)
  for _FORV_9_, _FORV_10_ in pairs(GetTable(A0_92, A1_93.TableVarTable, false)[A1_93.TableVar]) do
  end
  GetTable(A0_92, A1_93.SizeVarTable, false)[A1_93.SizeVar] = 0 + 1
end
BBGetSizeOfCustomTable = L0_0
function L0_0(A0_95, A1_96)
  local L2_97, L3_98
  L2_97 = GetTable
  L3_98 = A0_95
  L2_97 = L2_97(L3_98, A1_96.DestVarTable, true)
  L3_98 = nil
  if A1_96.SpellSlotVar ~= nil and GetTable(A0_95, A1_96.SpellSlotVarTable, false) ~= nil then
    L3_98 = GetTable(A0_95, A1_96.SpellSlotVarTable, false)[A1_96.SpellSlotVar]
  else
    L3_98 = A1_96.SpellSlotValue
  end
  L2_97[A1_96.DestVar] = A1_96.Function(A0_95[A1_96.OwnerVar], L3_98, A1_96.SpellbookType, A1_96.SlotType)
end
BBGetSlotSpellInfo = L0_0
function L0_0(A0_99, A1_100)
  local L2_101, L3_102, L4_103
  L2_101 = GetTable
  L3_102 = A0_99
  L4_103 = A1_100.SrcVarTable
  L2_101 = L2_101(L3_102, L4_103, false)
  L3_102 = nil
  L4_103 = A1_100.SrcVar
  if L4_103 ~= nil and L2_101 ~= nil then
    L4_103 = A1_100.SrcVar
    L3_102 = L2_101[L4_103]
  else
    L3_102 = A1_100.SrcValue
  end
  L4_103 = nil
  if A1_100.SpellSlotVar ~= nil and GetTable(A0_99, A1_100.SpellSlotVarTable, false) ~= nil then
    L4_103 = GetTable(A0_99, A1_100.SpellSlotVarTable, false)[A1_100.SpellSlotVar]
  else
    L4_103 = A1_100.SpellSlotValue
  end
  SetSlotSpellCooldownTime(A0_99[A1_100.OwnerVar], L4_103, A1_100.SpellbookType, A1_100.SlotType, L3_102)
end
BBSetSlotSpellCooldownTime = L0_0
function L0_0(A0_104, A1_105)
  if A0_104.Level ~= nil and A1_105.SrcValueByLevel ~= nil then
    A0_104.ReturnValue = A1_105.SrcValueByLevel[A0_104.Level]
  elseif A1_105.SrcVar ~= nil and GetTable(A0_104, A1_105.SrcVarTable, false) ~= nil then
    A0_104.ReturnValue = GetTable(A0_104, A1_105.SrcVarTable, false)[A1_105.SrcVar]
  else
    A0_104.ReturnValue = A1_105.SrcValue
  end
end
BBSetReturnValue = L0_0
function L0_0(A0_106, A1_107)
  if type(A0_106) == "string" and type(A1_107) == "string" then
    A0_106 = string.lower(A0_106)
    A1_107 = string.lower(A1_107)
  end
  return A0_106 == A1_107
end
CO_EQUAL = L0_0
function L0_0(A0_108, A1_109)
  if type(A0_108) == "string" and type(A1_109) == "string" then
    A0_108 = string.lower(A0_108)
    A1_109 = string.lower(A1_109)
  end
  return A0_108 ~= A1_109
end
CO_NOT_EQUAL = L0_0
function L0_0(A0_110, A1_111)
  local L2_112
  L2_112 = A0_110 < A1_111
  return L2_112
end
CO_LESS_THAN = L0_0
function L0_0(A0_113, A1_114)
  local L2_115
  L2_115 = A1_114 < A0_113
  return L2_115
end
CO_GREATER_THAN = L0_0
function L0_0(A0_116, A1_117)
  local L2_118
  L2_118 = A0_116 <= A1_117
  return L2_118
end
CO_LESS_THAN_OR_EQUAL = L0_0
function L0_0(A0_119, A1_120)
  local L2_121
  L2_121 = A1_120 <= A0_119
  return L2_121
end
CO_GREATER_THAN_OR_EQUAL = L0_0
function L0_0(A0_122, A1_123)
  return GetTeamID(A0_122) == GetTeamID(A1_123)
end
CO_SAME_TEAM = L0_0
function L0_0(A0_124, A1_125)
  return GetTeamID(A0_124) ~= GetTeamID(A1_125)
end
CO_DIFFERENT_TEAM = L0_0
function L0_0(A0_126, A1_127)
  return GetSourceType() == A1_127 or GetSourceType() == A0_126
end
CO_DAMAGE_SOURCETYPE_IS = L0_0
function L0_0(A0_128, A1_129)
  return GetSourceType() ~= A1_129 and GetSourceType() ~= A0_128
end
CO_DAMAGE_SOURCETYPE_IS_NOT = L0_0
function L0_0(A0_130)
  return IsObjectAI(A0_130)
end
CO_IS_TYPE_AI = L0_0
function L0_0(A0_131)
  return IsObjectAI(A0_131) ~= true
end
CO_IS_NOT_AI = L0_0
function L0_0(A0_132)
  return IsObjectHero(A0_132)
end
CO_IS_TYPE_HERO = L0_0
function L0_0(A0_133)
  return IsObjectHero(A0_133) ~= true
end
CO_IS_NOT_HERO = L0_0
function L0_0(A0_134)
  return IsClone(A0_134)
end
CO_IS_CLONE = L0_0
function L0_0(A0_135)
  return IsClone(A0_135) ~= true
end
CO_IS_NOT_CLONE = L0_0
function L0_0(A0_136)
  return IsMelee(A0_136)
end
CO_IS_MELEE = L0_0
function L0_0(A0_137)
  return IsMelee(A0_137) ~= true
end
CO_IS_RANGED = L0_0
function L0_0(A0_138)
  return A0_138 > math.random()
end
CO_RANDOM_CHANCE_LESS_THAN = L0_0
function L0_0(A0_139)
  return IsTurretAI(A0_139)
end
CO_IS_TYPE_TURRET = L0_0
function L0_0(A0_140)
  return IsTurretAI(A0_140) ~= true
end
CO_IS_NOT_TURRET = L0_0
function L0_0(A0_141)
  return IsDead(A0_141)
end
CO_IS_DEAD = L0_0
function L0_0(A0_142)
  return IsDead(A0_142) ~= true
end
CO_IS_NOT_DEAD = L0_0
function L0_0(A0_143)
  return IsDeadOrZombie(A0_143)
end
CO_IS_DEAD_OR_ZOMBIE = L0_0
function L0_0(A0_144, A1_145)
  return BBIsTargetInFrontOfMe(A0_144, A1_145)
end
CO_IS_TARGET_IN_FRONT_OF_ME = L0_0
function L0_0(A0_146, A1_147)
  return BBIsTargetBehindMe(A0_146, A1_147)
end
CO_IS_TARGET_BEHIND_ME = L0_0
function L0_0(A0_148)
  return IsWard(A0_148)
end
CO_IS_WARD = L0_0
function L0_0(A0_149)
  return IsStructure(A0_149)
end
CO_IS_STRUCTURE = L0_0
function L0_0(A0_150)
  return IsStructure(A0_150) ~= true
end
CO_IS_NOT_STRUCTURE = L0_0
function L0_0(A0_151)
  local L1_152
  L1_152 = A0_151 ~= nil
  return L1_152
end
CO_IS_NOT_NIL = L0_0
function L0_0(A0_153, A1_154, A2_155)
  GetTable(A0_153, A1_154.MacroVarTable, true)[A1_154.MacroVar] = A2_155
end
BBCreateMacro = L0_0
function L0_0(A0_156, A1_157)
  local L2_158
  L2_158 = GetParam
  L2_158 = L2_158("Macro", A0_156, A1_157)
  if L2_158 ~= nil and type(L2_158) == "table" then
    ExecuteBuildingBlocks(L2_158, A0_156)
  else
    ClientPrint("Designer Error: Macro variable is not initialized inside of event. Macro Variable was: " .. tostring(A1_157.MacroVar) .. " and current block data is: " .. gCurrentBuildingBlockString .. ". This error probably occurred due to variable not being initialized yet, being misnamed or two events being called out of sequence. It is highly recommended that script macros either be initialized OnBuffActivate, OnCharActivate or in the same event. Pro Devs may violate this rule at the risk of being forced to read this error message again.")
  end
end
BBRunMacro = L0_0
function L0_0(A0_159, A1_160, A2_161)
  local L3_162, L4_163, L5_164, L6_165
  L3_162 = GetTable
  L4_163 = A0_159
  L5_164 = A1_160.Src1VarTable
  L6_165 = false
  L3_162 = L3_162(L4_163, L5_164, L6_165)
  L4_163 = GetTable
  L5_164 = A0_159
  L6_165 = A1_160.Src2VarTable
  L4_163 = L4_163(L5_164, L6_165, false)
  L5_164 = false
  L6_165 = nil
  if L3_162 ~= nil and A1_160.Src1Var ~= nil then
    L6_165 = L3_162[A1_160.Src1Var]
  else
    L6_165 = A1_160.Value1
  end
  if L4_163 ~= nil and A1_160.Src2Var ~= nil then
    L5_164 = A1_160.CompareOp(L6_165, L4_163[A1_160.Src2Var])
  else
    L5_164 = A1_160.CompareOp(L6_165, A1_160.Value2)
  end
  if L5_164 then
    ExecuteBuildingBlocks(A2_161, A0_159)
    A0_159.LastIfSucceeded = true
  else
    A0_159.LastIfSucceeded = false
  end
end
BBIf = L0_0
function L0_0(A0_166, A1_167, A2_168)
  if A0_166.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_168, A0_166)
    A0_166.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_169, A1_170, A2_171)
  local L3_172, L4_173, L5_174, L6_175
  L3_172 = A0_169.LastIfSucceeded
  if L3_172 == false then
    L3_172 = GetTable
    L4_173 = A0_169
    L5_174 = A1_170.Src1VarTable
    L6_175 = false
    L3_172 = L3_172(L4_173, L5_174, L6_175)
    L4_173 = GetTable
    L5_174 = A0_169
    L6_175 = A1_170.Src2VarTable
    L4_173 = L4_173(L5_174, L6_175, false)
    L5_174 = false
    L6_175 = nil
    if L3_172 ~= nil and A1_170.Src1Var ~= nil then
      L6_175 = L3_172[A1_170.Src1Var]
    else
      L6_175 = A1_170.Value1
    end
    if L4_173 ~= nil and A1_170.Src2Var ~= nil then
      L5_174 = A1_170.CompareOp(L6_175, L4_173[A1_170.Src2Var])
    else
      L5_174 = A1_170.CompareOp(L6_175, A1_170.Value2)
    end
    if L5_174 then
      ExecuteBuildingBlocks(A2_171, A0_169)
      A0_169.LastIfSucceeded = true
    else
      A0_169.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_176, A1_177, A2_178)
  local L3_179
  if A1_177.TargetVar ~= nil then
    L3_179 = A0_176[A1_177.TargetVar]
  else
    L3_179 = A0_176.Target
  end
  if HasBuffOfType(L3_179, A1_177.BuffType) then
    ExecuteBuildingBlocks(A2_178, A0_176)
    A0_176.LastIfSucceeded = true
  else
    A0_176.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_180, A1_181, A2_182)
  local L3_183, L4_184
  if A1_181.OwnerVar ~= nil then
    L3_183 = A0_180[A1_181.OwnerVar]
  else
    L3_183 = A0_180.Owner
  end
  if A1_181.AttackerVar ~= nil then
    L4_184 = A0_180[A1_181.AttackerVar]
  else
    L4_184 = A0_180.Attacker
  end
  if SpellBuffCount(L3_183, A1_181.BuffName, L4_184) > 0 then
    ExecuteBuildingBlocks(A2_182, A0_180)
    A0_180.LastIfSucceeded = true
  else
    A0_180.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_185, A1_186, A2_187)
  if BBIsMissileAutoAttack(A0_185, A1_186) then
    ExecuteBuildingBlocks(A2_187, A0_185)
    A0_185.LastIfSucceeded = true
  else
    A0_185.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_188, A1_189)
  A0_188.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_190, A1_191, A2_192)
  local L3_193, L4_194
  if A1_191.OwnerVar ~= nil then
    L3_193 = A0_190[A1_191.OwnerVar]
  else
    L3_193 = A0_190.Owner
  end
  if A1_191.CasterVar ~= nil then
    L4_194 = A0_190[A1_191.CasterVar]
  else
    L4_194 = A0_190.Caster
  end
  if SpellBuffCount(L3_193, A1_191.BuffName, L4_194) <= 0 then
    ExecuteBuildingBlocks(A2_192, A0_190)
    A0_190.LastIfSucceeded = true
  else
    A0_190.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_195, A1_196, A2_197)
  local L3_198, L4_199
  if A1_196.OwnerVar ~= nil then
    L3_198 = A0_195[A1_196.OwnerVar]
  else
    L3_198 = A0_195.Owner
  end
  if HasPARType(L3_198, A1_196.PARType) then
    ExecuteBuildingBlocks(A2_197, A0_195)
    A0_195.LastIfSucceeded = true
  else
    A0_195.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_200, A1_201, A2_202)
  local L3_203, L4_204
  if A1_201.OwnerVar ~= nil then
    L3_203 = A0_200[A1_201.OwnerVar]
  else
    L3_203 = A0_200.Owner
  end
  if not HasPARType(L3_203, A1_201.PARType) then
    ExecuteBuildingBlocks(A2_202, A0_200)
    A0_200.LastIfSucceeded = true
  else
    A0_200.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_205, A1_206, A2_207)
  local L3_208, L4_209, L5_210, L6_211, L7_212
  L3_208 = GetTable
  L4_209 = A0_205
  L5_210 = A1_206.Src1VarTable
  L6_211 = false
  L3_208 = L3_208(L4_209, L5_210, L6_211)
  L4_209 = GetTable
  L5_210 = A0_205
  L6_211 = A1_206.Src2VarTable
  L7_212 = false
  L4_209 = L4_209(L5_210, L6_211, L7_212)
  L5_210 = true
  while L5_210 do
    L6_211 = false
    L7_212 = nil
    if L3_208 ~= nil and A1_206.Src1Var ~= nil then
      L7_212 = L3_208[A1_206.Src1Var]
    else
      L7_212 = A1_206.Value1
    end
    if L4_209 ~= nil and A1_206.Src2Var ~= nil then
      L6_211 = A1_206.CompareOp(L7_212, L4_209[A1_206.Src2Var])
    else
      L6_211 = A1_206.CompareOp(L7_212, A1_206.Value2)
    end
    if L6_211 then
      ExecuteBuildingBlocks(A2_207, A0_205)
    else
      L5_210 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_213, A1_214)
  return A0_213 * A1_214
end
MO_MULTIPLY = L0_0
function L0_0(A0_215, A1_216)
  return A0_215 + A1_216
end
MO_ADD = L0_0
function L0_0(A0_217, A1_218)
  return A0_217 - A1_218
end
MO_SUBTRACT = L0_0
function L0_0(A0_219, A1_220)
  return A0_219 / A1_220
end
MO_DIVIDE = L0_0
function L0_0(A0_221, A1_222)
  if A0_221 < A1_222 then
    return A0_221
  else
    return A1_222
  end
end
MO_MIN = L0_0
function L0_0(A0_223, A1_224)
  if A1_224 < A0_223 then
    return A0_223
  else
    return A1_224
  end
end
MO_MAX = L0_0
function L0_0(A0_225, A1_226)
  return A0_225 % A1_226
end
MO_MODULO = L0_0
function L0_0(A0_227)
  return math.floor(A0_227 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_228)
  return math.ceil(A0_228)
end
MO_ROUNDUP = L0_0
function L0_0(A0_229)
  return math.floor(A0_229)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_230)
  return math.sin(math.rad(A0_230))
end
MO_SIN = L0_0
function L0_0(A0_231)
  return math.cos(math.rad(A0_231))
end
MO_COSINE = L0_0
function L0_0(A0_232)
  return math.tan(math.rad(A0_232))
end
MO_TANGENT = L0_0
function L0_0(A0_233)
  return math.deg(math.asin(A0_233))
end
MO_ASIN = L0_0
function L0_0(A0_234)
  return math.deg(math.acos(A0_234))
end
MO_ACOS = L0_0
function L0_0(A0_235)
  return math.deg(math.atan(A0_235))
end
MO_ATAN = L0_0
function L0_0(A0_236, A1_237)
  return math.pow(A0_236, A1_237)
end
MO_POW = L0_0
function L0_0(A0_238)
  return math.sqrt(A0_238)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_239, A1_240)
  local L2_241
  L2_241 = A0_239 and A1_240
  return L2_241
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_242, A1_243)
  local L2_244
  L2_244 = A0_242 or A1_243
  return L2_244
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_245)
  local L1_246
  L1_246 = not A0_245
  return L1_246
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_247)
  return math.abs(A0_247)
end
MO_ABS = L0_0
function L0_0(A0_248, A1_249)
  return math.random(A0_248, A1_249)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_250, A1_251)
  local L2_252, L3_253
  L2_252 = GetMathNumber
  L3_253 = A0_250
  L2_252 = L2_252(L3_253, A1_251.Src1VarTable, A1_251.Src1Var, A1_251.Src1Value)
  L3_253 = GetMathNumber
  L3_253 = L3_253(A0_250, A1_251.Src2VarTable, A1_251.Src2Var, A1_251.Src2Value)
  GetTable(A0_250, A1_251.DestVarTable)[A1_251.DestVar] = A1_251.MathOp(L2_252, L3_253)
end
BBMath = L0_0
function L0_0(A0_254, A1_255, A2_256, A3_257)
  if A2_256 ~= nil and GetTable(A0_254, A1_255)[A2_256] ~= nil then
    return GetTable(A0_254, A1_255)[A2_256]
  end
  return A3_257
end
GetMathNumber = L0_0
function L0_0(A0_258, A1_259)
  if type(A1_259) == "number" then
    return A1_259
  elseif type(A1_259) == "function" then
    return A1_259(A0_258)
  elseif type(A1_259) == "string" then
    return A0_258[A1_259]
  end
end
GetNumber = L0_0
function L0_0(A0_260, A1_261)
  return VectorAdd(A0_260, A1_261)
end
VEC_ADD = L0_0
function L0_0(A0_262, A1_263)
  return VectorSubtract(A0_262, A1_263)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_264, A1_265)
  return VectorScalarMultiply(A0_264, A1_265)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_266, A1_267)
  return VectorScalarDivide(A0_266, A1_267)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_268, A1_269)
  return VectorRotateY(A0_268, A1_269)
end
VEC_ROTATE = L0_0
function L0_0(A0_270, A1_271)
  BBMath(A0_270, A1_271)
end
BBVectorMath = L0_0
function L0_0(A0_272, A1_273)
  local L2_274, L3_275, L4_276, L5_277
  L2_274 = A0_272.InstanceVars
  L3_275 = L2_274.InterpDelta
  if L3_275 == nil then
    L3_275 = A1_273.Amount
    L4_276 = A1_273.AmountVar
    if L4_276 ~= nil then
      L4_276 = GetTable
      L5_277 = A0_272
      L4_276 = L4_276(L5_277, A1_273.AmountVarTable)
      L5_277 = A1_273.AmountVar
      L3_275 = L4_276[L5_277]
    end
    L4_276 = GetPosition
    L5_277 = A1_273.TargetVar
    L5_277 = A0_272[L5_277]
    L4_276 = L4_276(L5_277)
    L2_274.KnockBackStart = L4_276
    L4_276 = GetNormalizedPositionDelta
    L5_277 = A1_273.TargetVar
    L5_277 = A0_272[L5_277]
    L4_276 = L4_276(L5_277, A0_272[A1_273.AttackerVar], true)
    L5_277 = {}
    L5_277.x = L4_276.x * L3_275
    L5_277.y = 0
    L5_277.z = L4_276.z * L3_275
    L2_274.InterpDelta = L5_277
    L5_277 = GetTime
    L5_277 = L5_277()
    L2_274.StartTime = L5_277
    L5_277 = A1_273.KnockBackDuration
    L2_274.KnockBackDuration = L5_277
  end
  L3_275 = A1_273.TargetVar
  L3_275 = A0_272[L3_275]
  L4_276 = GetTime
  L4_276 = L4_276()
  L5_277 = L2_274.StartTime
  L4_276 = L4_276 - L5_277
  L5_277 = L2_274.KnockBackDuration
  L4_276 = L4_276 / L5_277
  L5_277 = {}
  L5_277.x = L2_274.KnockBackStart.x + L2_274.InterpDelta.x * L4_276
  L5_277.y = L2_274.KnockBackStart.y
  L5_277.z = L2_274.KnockBackStart.z + L2_274.InterpDelta.z * L4_276
  SetPosition(L3_275, L5_277)
end
BBKnockback = L0_0
function L0_0(A0_278, A1_279)
  local L2_280, L3_281
  L2_280 = GetParam
  L3_281 = "Left"
  L2_280 = L2_280(L3_281, A0_278, A1_279)
  L3_281 = GetParam
  L3_281 = L3_281("Right", A0_278, A1_279)
  GetTable(A0_278, A1_279.DestVarTable, true)[A1_279.DestVar] = tostring(L2_280) .. tostring(L3_281)
end
BBAppendString = L0_0
function L0_0(A0_282, A1_283)
  local L2_284
  L2_284 = 0
  if A1_283.Delta ~= nil then
    L2_284 = L2_284 + A1_283.Delta
  end
  if A1_283.DeltaByLevel ~= nil and A0_282.Level ~= nil then
    L2_284 = L2_284 + A1_283.DeltaByLevel[A0_282.Level]
  end
  if A1_283.DeltaVar ~= nil then
    L2_284 = L2_284 + GetTable(A0_282, A1_283.DeltaVarTable, true)[A1_283.DeltaVar]
  end
  if A1_283.TargetVar ~= nil then
    A1_283.Stat(L2_284, A0_282[A1_283.TargetVar])
  else
    A1_283.Stat(L2_284)
  end
end
BBIncStat = L0_0
function L0_0(A0_285, A1_286)
  local L2_287
  L2_287 = 0
  if A1_286.Delta ~= nil then
    L2_287 = L2_287 + A1_286.Delta
  end
  if A1_286.DeltaByLevel ~= nil and A0_285.Level ~= nil then
    L2_287 = L2_287 + A1_286.DeltaByLevel[A0_285.Level]
  end
  if A1_286.DeltaVar ~= nil then
    L2_287 = L2_287 + GetTable(A0_285, A1_286.DeltaVarTable, true)[A1_286.DeltaVar]
  end
  if A1_286.TargetVar ~= nil then
    A1_286.Stat(L2_287, A0_285[A1_286.TargetVar])
  else
    A1_286.Stat(L2_287)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_288, A1_289)
  if A1_289.AttackVar ~= nil then
  end
  if A1_289.Attack ~= nil then
  end
  if A1_289.TotalCoefficientVar ~= nil then
  end
  if A1_289.TotalCoefficient ~= nil then
  end
  if A1_289.TargetVar ~= nil then
    GetTable(A0_288, A1_289.DestVarTable, false)[A1_289.DestVar] = (0 + GetTable(A0_288, A1_289.AttackVarTable, true)[A1_289.AttackVar] + A1_289.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_288[A1_289.TargetVar])) + GetFlatCritDamageMod(A0_288[A1_289.TargetVar])) * (0 + GetTable(A0_288, A1_289.TotalCoefficientVarTable, true)[A1_289.TotalCoefficientVar] + A1_289.TotalCoefficient)
  else
    GetTable(A0_288, A1_289.DestVarTable, false)[A1_289.DestVar] = 2 * A1_289.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_290, A1_291)
  if A1_291.CDVar ~= nil then
  end
  if A1_291.CD ~= nil then
  end
  if A1_291.TargetVar ~= nil then
    GetTable(A0_290, A1_291.DestVarTable, false)[A1_291.DestVar] = (0 + GetTable(A0_290, A1_291.CDVarTable, true)[A1_291.CDVar] + A1_291.CD) * (1 + GetPercentCooldownMod(A0_290[A1_291.TargetVar]))
  else
    GetTable(A0_290, A1_291.DestVarTable, false)[A1_291.DestVar] = A1_291.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_292, A1_293)
  if A1_293.TargetVar ~= nil then
    GetTable(A0_292, A1_293.DestVarTable, false)[A1_293.DestVar] = A1_293.Stat(A0_292[A1_293.TargetVar])
  else
    GetTable(A0_292, A1_293.DestVarTable, false)[A1_293.DestVar] = A1_293.Stat()
  end
end
BBGetStat = L0_0
function L0_0(A0_294, A1_295)
  if A1_295.TargetVar ~= nil then
    GetTable(A0_294, A1_295.DestVarTable, false)[A1_295.DestVar] = GetLevel(A0_294[A1_295.TargetVar])
  else
    GetTable(A0_294, A1_295.DestVarTable, false)[A1_295.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_296, A1_297)
  if A1_297.TargetVar ~= nil then
    GetTable(A0_296, A1_297.DestVarTable, false)[A1_297.DestVar] = GetUnitSignificance(A0_296[A1_297.TargetVar])
  else
    GetTable(A0_296, A1_297.DestVarTable, false)[A1_297.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_298, A1_299)
  if A1_299.TargetVar ~= nil then
    GetTable(A0_298, A1_299.DestVarTable, false)[A1_299.DestVar] = GetArmor(A0_298[A1_299.TargetVar])
  else
    GetTable(A0_298, A1_299.DestVarTable, false)[A1_299.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_300, A1_301)
  if A1_301.TargetVar ~= nil then
    GetTable(A0_300, A1_301.DestVarTable, false)[A1_301.DestVar] = GetSpellBlock(A0_300[A1_301.TargetVar])
  else
    GetTable(A0_300, A1_301.DestVarTable, false)[A1_301.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_302, A1_303)
  if A1_303.TargetVar ~= nil then
    GetTable(A0_302, A1_303.DestVarTable, false)[A1_303.DestVar] = GetTeamID(A0_302[A1_303.TargetVar])
  else
    GetTable(A0_302, A1_303.DestVarTable, false)[A1_303.DestVar] = GetTeamID()
  end
end
BBGetTeamID = L0_0
function L0_0(A0_304, A1_305)
  local L2_306, L3_307, L4_308
  L2_306 = GetTable
  L3_307 = A0_304
  L4_308 = A1_305.DestVarTable
  L2_306 = L2_306(L3_307, L4_308, false)
  L3_307 = A1_305.TargetVar
  L4_308 = nil
  if L3_307 ~= nil then
    L4_308 = GetTeamID(A0_304[L3_307])
  else
    L4_308 = GetTeamID()
  end
  if L4_308 == TEAM_ORDER then
    L2_306[A1_305.DestVar] = TEAM_CHAOS
  elseif L4_308 == TEAM_CHAOS then
    L2_306[A1_305.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_309, A1_310)
  if A1_310.TargetVar ~= nil then
    GetTable(A0_309, A1_310.DestVarTable, false)[A1_310.DestVar] = GetUnitSkinName(A0_309[A1_310.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_311, A1_312)
  if A1_312.TargetVar ~= nil then
    GetTable(A0_311, A1_312.DestVarTable, false)[A1_312.DestVar] = GetTotalAttackDamage(A0_311[A1_312.TargetVar])
  else
    GetTable(A0_311, A1_312.DestVarTable, false)[A1_312.DestVar] = GetTotalAttackDamage()
  end
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_313, A1_314)
  GetTable(A0_313, A1_314.DestVarTable, true)[A1_314.DestVar] = A1_314.Status(A0_313[A1_314.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_315, A1_316)
  local L2_317
  L2_317 = A1_316.TargetVar
  L2_317 = A0_315[L2_317]
  ClearAttackTarget(L2_317)
end
BBClearAttackTarget = L0_0
function L0_0(A0_318, A1_319)
  GetTable(A0_318, A1_319.DestVarTable, true)[A1_319.DestVar] = A1_319.Info(A0_318[A1_319.TargetVar])
end
BBGetCastInfo = L0_0
function L0_0(A0_320, A1_321, A2_322)
  local L3_323, L4_324, L5_325, L6_326
  L3_323 = GetTable
  L4_324 = A0_320
  L5_325 = A1_321.TrackTimeVarTable
  L6_326 = false
  L3_323 = L3_323(L4_324, L5_325, L6_326)
  L4_324 = GetTime
  L4_324 = L4_324()
  L5_325 = A1_321.ExecuteImmediately
  L6_326 = GetParam
  L6_326 = L6_326("TimeBetweenExecutions", A0_320, A1_321)
  if A1_321.TickTimeVar ~= nil and GetTable(A0_320, A1_321.TickTimeVarTable, false)[A1_321.TickTimeVar] ~= nil then
    L6_326 = GetTable(A0_320, A1_321.TickTimeVarTable, false)[A1_321.TickTimeVar]
  end
  if L3_323[A1_321.TrackTimeVar] == nil then
    L3_323[A1_321.TrackTimeVar] = L4_324
    if L5_325 == true then
      ExecuteBuildingBlocks(A2_322, A0_320)
    end
  end
  if L4_324 >= L3_323[A1_321.TrackTimeVar] + L6_326 then
    L3_323[A1_321.TrackTimeVar] = L3_323[A1_321.TrackTimeVar] + L6_326
    ExecuteBuildingBlocks(A2_322, A0_320)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_327, A1_328, A2_329)
  GetTable(A0_327, A1_328.TrackTimeVarTable, false)[A1_328.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_330, A1_331)
  local L2_332
  L2_332 = A1_331.SrcValue
  if A1_331.SrcVar ~= nil then
    L2_332 = GetTable(A0_330, A1_331.SrcVarTable, true)[A1_331.SrcVar]
  end
  A1_331.Status(A0_330[A1_331.TargetVar], L2_332)
end
BBSetStatus = L0_0
function L0_0(A0_333, A1_334)
  local L2_335
  L2_335 = A1_334.ToAlert
  if GetTable(A0_333, A1_334.SrcVarTable, false) ~= nil and A1_334.SrcVar ~= nil then
    L2_335 = L2_335 .. GetTable(A0_333, A1_334.SrcVarTable, false)[A1_334.SrcVar]
  end
  _ALERT(L2_335)
end
BBAlert = L0_0
function L0_0(A0_336, A1_337)
  local L2_338, L3_339, L4_340
  L2_338 = A1_337.ToSay
  L3_339 = GetTable
  L4_340 = A0_336
  L3_339 = L3_339(L4_340, A1_337.SrcVarTable, false)
  if L3_339 ~= nil then
    L4_340 = A1_337.SrcVar
    if L4_340 ~= nil then
      L4_340 = L2_338
      L2_338 = L4_340 .. tostring(L3_339[A1_337.SrcVar])
    end
  end
  L4_340 = nil
  if A1_337.OwnerVar ~= nil then
    L4_340 = A0_336[A1_337.OwnerVar]
  else
    L4_340 = A0_336.Owner
  end
  if A1_337.TextType == nil then
    A1_337.TextType = 0
  end
  Say(L4_340, L2_338, A1_337.TextType)
end
BBSay = L0_0
function L0_0(A0_341, A1_342)
  local L2_343, L3_344, L4_345
  L2_343 = A1_342.ToSay
  L3_344 = GetTable
  L4_345 = A0_341
  L3_344 = L3_344(L4_345, A1_342.SrcVarTable, false)
  if L3_344 ~= nil then
    L4_345 = A1_342.SrcVar
    if L4_345 ~= nil then
      L4_345 = L2_343
      L2_343 = L4_345 .. tostring(L3_344[A1_342.SrcVar])
    end
  end
  L4_345 = nil
  if A1_342.OwnerVar ~= nil then
    L4_345 = A0_341[A1_342.OwnerVar]
  else
    L4_345 = A0_341.Owner
  end
  if A1_342.TextType == nil then
    A1_342.TextType = 0
  end
  Say(L4_345, L2_343, A1_342.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_346, A1_347)
  GetTable(A0_346, A1_347.DestVarTable, true)[A1_347.DestVar] = BBLuaGetGold(A0_346, A1_347)
end
BBGetGold = L0_0
function L0_0(A0_348, A1_349)
  GetTable(A0_348, A1_349.DestVarTable, true)[A1_349.DestVar] = BBLuaGetTotalGold(A0_348, A1_349)
end
BBGetTotalGold = L0_0
function L0_0(A0_350, A1_351)
  SpellBuffAdd(A0_350[A1_351.OwnerVar], A0_350[A1_351.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_350.NextBuffVars)
  BBTeleportToPositionHelper(A0_350, A1_351)
end
BBTeleportToPosition = L0_0
function L0_0(A0_352, A1_353)
  if A1_353.XVar ~= nil and GetTable(A0_352, A1_353.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_352, A1_353.XVarTable, true)[A1_353.XVar]
  else
    Xloc = A1_353.X
  end
  if A1_353.YVar ~= nil and GetTable(A0_352, A1_353.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_352, A1_353.YVarTable, true)[A1_353.YVar]
  else
    Yloc = A1_353.Y
  end
  if A1_353.ZVar ~= nil and GetTable(A0_352, A1_353.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_352, A1_353.ZVarTable, true)[A1_353.ZVar]
  else
    Zloc = A1_353.Z
  end
  A1_353.OwnerVar, A0_352.position = A1_353.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_353.CastPositionName = "position"
  BBTeleportToPosition(A0_352, A1_353)
end
BBTeleportToPoint = L0_0
function L0_0(A0_354, A1_355)
  DefUpdateAura(GetTable(A0_354, A1_355.CenterTable, false)[A1_355.CenterVar], A1_355.Range, A1_355.UnitScan, A1_355.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_356, A1_357)
  ReincarnateNonDeadHero(GetTable(A0_356, A1_357.TargetTable, false)[A1_357.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_358, A1_359)
  GetTable(A0_358, A1_359.DestVarTable, true)[A1_359.DestVar] = A1_359.Function(A0_358[A1_359.OwnerVar], A1_359.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_360, A1_361)
  local L2_362, L3_363, L4_364, L5_365
  L2_362 = A1_361.WhomToOrderVar
  L2_362 = A0_360[L2_362]
  L3_363 = A1_361.TargetOfOrderVar
  L3_363 = A0_360[L3_363]
  L4_364 = GetTable
  L5_365 = A0_360
  L4_364 = L4_364(L5_365, A1_361.SrcVarTable, false)
  L5_365 = nil
  if A1_361.SrcVar ~= nil and L4_364 ~= nil then
    L5_365 = L4_364[A1_361.SrcVar]
  else
    L5_365 = GetPosition(L3_363)
  end
  if L3_363 == nil then
    L3_363 = L2_362
  end
  IssueOrder(L2_362, A1_361.Order, L5_365, L3_363)
end
BBIssueOrder = L0_0
function L0_0(A0_366, A1_367)
  local L2_368
  L2_368 = GetParam
  L2_368 = L2_368("NewRange", A0_366, A1_367)
  SetSpellCastRange(L2_368)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_369, A1_370)
  GetTable(A0_369, A1_370.DestVarTable, true)[A1_370.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_371, A1_372)
  local L2_373, L3_374
  L2_373 = A1_372.ObjectVar1
  L2_373 = A0_371[L2_373]
  L3_374 = A1_372.ObjectVar2
  L3_374 = A0_371[L3_374]
  GetTable(A0_371, A1_372.DestVarTable, true)[A1_372.DestVar] = DistanceBetweenObjectBounds(L2_373, L3_374)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_375, A1_376)
  local L2_377, L3_378, L4_379
  L2_377 = A1_376.ObjectVar
  L2_377 = A0_375[L2_377]
  L3_378 = GetTable
  L4_379 = A0_375
  L3_378 = L3_378(L4_379, A1_376.PointVarTable, true)
  L4_379 = A1_376.PointVar
  L4_379 = L3_378[L4_379]
  GetTable(A0_375, A1_376.DestVarTable, true)[A1_376.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_377, L4_379)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_380, A1_381)
  local L2_382, L3_383
  L2_382 = GetParam
  L3_383 = "Point1"
  L2_382 = L2_382(L3_383, A0_380, A1_381)
  L3_383 = GetParam
  L3_383 = L3_383("Point2", A0_380, A1_381)
  GetTable(A0_380, A1_381.DestVarTable, true)[A1_381.DestVar] = DistanceBetweenPoints(L2_382, L3_383)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_384, A1_385, A2_386)
  local L3_387, L4_388, L5_389, L6_390, L7_391, L8_392
  L5_389 = 0
  L6_390 = nil
  L7_391 = A1_385.ObjectDistanceType
  L8_392 = A1_385.ObjectVar1
  L3_387 = A0_384[L8_392]
  L8_392 = A1_385.ObjectVar2
  L4_388 = A0_384[L8_392]
  if nil == L4_388 then
    L8_392 = A1_385.Point2Var
    if nil ~= L8_392 then
      L8_392 = GetTable
      L8_392 = L8_392(A0_384, A1_385.Point2VarTable, true)
      L4_388 = L8_392[A1_385.Point2Var]
      L5_389 = L5_389 + 1
    end
  end
  if nil == L3_387 then
    L8_392 = A1_385.Point1Var
    if nil ~= L8_392 then
      L8_392 = GetTable
      L8_392 = L8_392(A0_384, A1_385.Point1VarTable, true)
      L3_387 = L8_392[A1_385.Point1Var]
      L5_389 = L5_389 + 1
      if 1 == L5_389 then
        L3_387, L4_388 = L4_388, L3_387
      end
    end
  end
  if nil ~= L7_391 then
    if 0 == L5_389 then
      L8_392 = OBJECT_CENTER
      if L8_392 == L7_391 then
        L6_390 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_392 = OBJECT_BOUNDARY
        if L8_392 == L7_391 then
          L6_390 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_392 = A1_385.OwnerVar
          L8_392 = A0_384[L8_392]
          Say(L8_392, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_389 then
      L8_392 = OBJECT_CENTER
      if L8_392 == L7_391 then
        L6_390 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_392 = OBJECT_BOUNDARY
        if L8_392 == L7_391 then
          L6_390 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_392 = A1_385.OwnerVar
          L8_392 = A0_384[L8_392]
          Say(L8_392, "invalid object distance type", 0)
        end
      end
    else
      L6_390 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_392 = A1_385.Distance
  if A1_385.DistanceVar ~= nil and GetTable(A0_384, A1_385.DistanceVarTable, true) ~= nil then
    L8_392 = L8_392 + GetTable(A0_384, A1_385.DistanceVarTable, true)[A1_385.DistanceVar]
  end
  if L3_387 ~= nil and L4_388 ~= nil and L6_390 ~= nil and L8_392 ~= nil then
    if not L6_390(L3_387, L4_388, L8_392) then
      ExecuteBuildingBlocks(A2_386, A0_384)
      A0_384.LastIfSucceeded = true
    else
      A0_384.LastIfSucceeded = false
    end
  else
    A0_384.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_393, A1_394)
  local L2_395, L3_396
  L2_395 = A1_394.TargetVar
  L2_395 = A0_393[L2_395]
  L3_396 = A1_394.CasterVar
  L3_396 = A0_393[L3_396]
  GetTable(A0_393, A1_394.DestVarTable, true)[A1_394.DestVar] = SpellBuffCount(L2_395, A1_394.BuffName, L3_396)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_397, A1_398)
  local L2_399
  L2_399 = A1_398.TargetVar
  L2_399 = A0_397[L2_399]
  GetTable(A0_397, A1_398.DestVarTable, true)[A1_398.DestVar] = SpellBuffCount(L2_399, A1_398.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_400, A1_401)
  local L2_402, L3_403
  L2_402 = GetTable
  L3_403 = A0_400
  L2_402 = L2_402(L3_403, A1_401.ScaleVarTable, false)
  L3_403 = nil
  if A1_401.OwnerVar ~= nil then
    L3_403 = A0_400[A1_401.OwnerVar]
  else
    L3_403 = A0_400.Owner
  end
  if A1_401.ScaleVar ~= nil and A1_401.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_402[A1_401.ScaleVar], L3_403)
  else
    SetScaleSkinCoef(A1_401.Scale, L3_403)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_404, A1_405)
  SpellBuffAdd(A0_404[A1_405.TargetVar], A0_404[A1_405.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_404.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_406, A1_407, A2_408)
  local L3_409, L4_410
  L3_409 = A1_407.TargetVar
  L3_409 = A0_406[L3_409]
  L4_410 = A1_407.NumStacks
  if GetParam("NumStacks", A0_406, A1_407) == 0 then
    L4_410 = SpellBuffCount(L3_409, A1_407.BuffName, caster)
  else
    L4_410 = GetParam("NumStacks", A0_406, A1_407)
  end
  while L4_410 > 0 do
    SpellBuffRemove(L3_409, A1_407.BuffName, A0_406[A1_407.AttackerVar])
    L4_410 = L4_410 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_411, A1_412, A2_413)
  if A0_411.EmoteId == A1_412.EmoteId then
    ExecuteBuildingBlocks(A2_413, A0_411)
    A0_411.LastIfSucceeded = true
  else
    A0_411.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_414, A1_415, A2_416)
  if A0_414.EmoteId ~= A1_415.EmoteId then
    ExecuteBuildingBlocks(A2_416, A0_414)
    A0_414.LastIfSucceeded = true
  else
    A0_414.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_417, A1_418)
  local L2_419, L3_420, L4_421, L5_422
  L2_419 = GetTable
  L3_420 = A0_417
  L4_421 = A1_418.String1VarTable
  L5_422 = false
  L2_419 = L2_419(L3_420, L4_421, L5_422)
  L3_420 = A1_418.String1Var
  L3_420 = L2_419[L3_420]
  L4_421 = GetTable
  L5_422 = A0_417
  L4_421 = L4_421(L5_422, A1_418.String2VarTable, false)
  L5_422 = A1_418.String2Var
  L5_422 = L4_421[L5_422]
  GetTable(A0_417, A1_418.ResultVarTable, false)[A1_418.ResultVar] = L3_420 .. L5_422
end
BBConcatenateStrings = L0_0
function L0_0(A0_423, A1_424)
  BBGetMinionKills(A0_423, A1_424)
  A0_423.MinionKillSource = GetParam("MinionKillTarget")
  A0_423.MinionKills = A0_423.MinionsKilled + GetParam("MinionKills", A0_423, A1_424)
  BBSetMinionKills(A0_423, A1_424)
end
BBIncreaseMinionKills = L0_0
