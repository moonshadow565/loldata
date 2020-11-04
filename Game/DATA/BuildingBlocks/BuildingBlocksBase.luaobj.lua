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
    if GetParam("Key", A0_74, A1_75) then
      L2_76[A1_75.TableVar][GetParam("Key", A0_74, A1_75)] = nil
    elseif L3_77 then
      table.remove(L2_76[A1_75.TableVar], L3_77)
    else
      ClientPrint("Specified index/key was nil: " .. tostring(A1_75.IndexVarTable) .. "." .. tostring(A1_75.IndexVar))
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
  local L2_99, L3_100, L4_101, L5_102
  L2_99 = GetTable
  L3_100 = A0_97
  L4_101 = A1_98.DestVarTable
  L5_102 = true
  L2_99 = L2_99(L3_100, L4_101, L5_102)
  L3_100 = nil
  L4_101 = GetTable
  L5_102 = A0_97
  L4_101 = L4_101(L5_102, A1_98.SpellSlotVarTable, false)
  L5_102 = A1_98.SpellSlotVar
  if L5_102 ~= nil and L4_101 ~= nil then
    L5_102 = A1_98.SpellSlotVar
    L3_100 = L4_101[L5_102]
  else
    L3_100 = A1_98.SpellSlotValue
  end
  L5_102 = A1_98.Function
  L5_102 = L5_102(A0_97[A1_98.OwnerVar], L3_100, A1_98.SpellbookType, A1_98.SlotType)
  SetVarInTable(A0_97, A1_98, L5_102)
end
BBGetSlotSpellInfo = L0_0
function L0_0(A0_103, A1_104)
  local L2_105, L3_106, L4_107
  L2_105 = GetTable
  L3_106 = A0_103
  L4_107 = A1_104.SrcVarTable
  L2_105 = L2_105(L3_106, L4_107, false)
  L3_106 = nil
  L4_107 = A1_104.SrcVar
  if L4_107 ~= nil and L2_105 ~= nil then
    L4_107 = A1_104.SrcVar
    L3_106 = L2_105[L4_107]
  else
    L3_106 = A1_104.SrcValue
  end
  L4_107 = nil
  if A1_104.SpellSlotVar ~= nil and GetTable(A0_103, A1_104.SpellSlotVarTable, false) ~= nil then
    L4_107 = GetTable(A0_103, A1_104.SpellSlotVarTable, false)[A1_104.SpellSlotVar]
  else
    L4_107 = A1_104.SpellSlotValue
  end
  SetSlotSpellCooldownTime(A0_103[A1_104.OwnerVar], L4_107, A1_104.SpellbookType, A1_104.SlotType, L3_106)
end
BBSetSlotSpellCooldownTime = L0_0
function L0_0(A0_108, A1_109)
  if A0_108.Level ~= nil and A1_109.SrcValueByLevel ~= nil then
    A0_108.ReturnValue = A1_109.SrcValueByLevel[A0_108.Level]
  elseif A1_109.SrcVar ~= nil and GetTable(A0_108, A1_109.SrcVarTable, false) ~= nil then
    A0_108.ReturnValue = GetTable(A0_108, A1_109.SrcVarTable, false)[A1_109.SrcVar]
  else
    A0_108.ReturnValue = A1_109.SrcValue
  end
end
BBSetReturnValue = L0_0
function L0_0(A0_110, A1_111)
  if type(A0_110) == "string" and type(A1_111) == "string" then
    A0_110 = string.lower(A0_110)
    A1_111 = string.lower(A1_111)
  end
  return A0_110 == A1_111
end
CO_EQUAL = L0_0
function L0_0(A0_112, A1_113)
  if type(A0_112) == "string" and type(A1_113) == "string" then
    A0_112 = string.lower(A0_112)
    A1_113 = string.lower(A1_113)
  end
  return A0_112 ~= A1_113
end
CO_NOT_EQUAL = L0_0
function L0_0(A0_114, A1_115)
  local L2_116
  L2_116 = A0_114 < A1_115
  return L2_116
end
CO_LESS_THAN = L0_0
function L0_0(A0_117, A1_118)
  local L2_119
  L2_119 = A1_118 < A0_117
  return L2_119
end
CO_GREATER_THAN = L0_0
function L0_0(A0_120, A1_121)
  local L2_122
  L2_122 = A0_120 <= A1_121
  return L2_122
end
CO_LESS_THAN_OR_EQUAL = L0_0
function L0_0(A0_123, A1_124)
  local L2_125
  L2_125 = A1_124 <= A0_123
  return L2_125
end
CO_GREATER_THAN_OR_EQUAL = L0_0
function L0_0(A0_126, A1_127)
  return GetTeamID(A0_126) == GetTeamID(A1_127)
end
CO_SAME_TEAM = L0_0
function L0_0(A0_128, A1_129)
  return GetTeamID(A0_128) ~= GetTeamID(A1_129)
end
CO_DIFFERENT_TEAM = L0_0
function L0_0(A0_130, A1_131)
  return GetSourceType() == A1_131 or GetSourceType() == A0_130
end
CO_DAMAGE_SOURCETYPE_IS = L0_0
function L0_0(A0_132, A1_133)
  return GetSourceType() ~= A1_133 and GetSourceType() ~= A0_132
end
CO_DAMAGE_SOURCETYPE_IS_NOT = L0_0
function L0_0(A0_134)
  return IsObjectAI(A0_134)
end
CO_IS_TYPE_AI = L0_0
function L0_0(A0_135)
  return IsObjectAI(A0_135) ~= true
end
CO_IS_NOT_AI = L0_0
function L0_0(A0_136)
  return IsObjectHero(A0_136)
end
CO_IS_TYPE_HERO = L0_0
function L0_0(A0_137)
  return IsObjectHero(A0_137) ~= true
end
CO_IS_NOT_HERO = L0_0
function L0_0(A0_138)
  return IsClone(A0_138)
end
CO_IS_CLONE = L0_0
function L0_0(A0_139)
  return IsClone(A0_139) ~= true
end
CO_IS_NOT_CLONE = L0_0
function L0_0(A0_140)
  return IsMelee(A0_140)
end
CO_IS_MELEE = L0_0
function L0_0(A0_141)
  return IsMelee(A0_141) ~= true
end
CO_IS_RANGED = L0_0
function L0_0(A0_142)
  return A0_142 > math.random()
end
CO_RANDOM_CHANCE_LESS_THAN = L0_0
function L0_0(A0_143)
  return IsTurretAI(A0_143)
end
CO_IS_TYPE_TURRET = L0_0
function L0_0(A0_144)
  return IsTurretAI(A0_144) ~= true
end
CO_IS_NOT_TURRET = L0_0
function L0_0(A0_145)
  return IsDampener(A0_145)
end
CO_IS_TYPE_INHIBITOR = L0_0
function L0_0(A0_146)
  return IsDampener(A0_146) ~= true
end
CO_IS_NOT_INHIBITOR = L0_0
function L0_0(A0_147)
  return IsHQ(A0_147)
end
CO_IS_TYPE_NEXUS = L0_0
function L0_0(A0_148)
  return IsHQ(A0_148) ~= true
end
CO_IS_NOT_NEXUS = L0_0
function L0_0(A0_149)
  return IsDead(A0_149)
end
CO_IS_DEAD = L0_0
function L0_0(A0_150)
  return IsDead(A0_150) ~= true
end
CO_IS_NOT_DEAD = L0_0
function L0_0(A0_151)
  return IsDeadOrZombie(A0_151)
end
CO_IS_DEAD_OR_ZOMBIE = L0_0
function L0_0(A0_152, A1_153)
  return BBIsTargetInFrontOfMe(A0_152, A1_153)
end
CO_IS_TARGET_IN_FRONT_OF_ME = L0_0
function L0_0(A0_154, A1_155)
  return BBIsTargetBehindMe(A0_154, A1_155)
end
CO_IS_TARGET_BEHIND_ME = L0_0
function L0_0(A0_156)
  return IsWard(A0_156)
end
CO_IS_WARD = L0_0
function L0_0(A0_157)
  return IsStructure(A0_157)
end
CO_IS_STRUCTURE = L0_0
function L0_0(A0_158)
  return IsStructure(A0_158) ~= true
end
CO_IS_NOT_STRUCTURE = L0_0
function L0_0(A0_159)
  local L1_160
  L1_160 = A0_159 ~= nil
  return L1_160
end
CO_IS_NOT_NIL = L0_0
function L0_0(A0_161, A1_162, A2_163)
  GetTable(A0_161, A1_162.MacroVarTable, true)[A1_162.MacroVar] = A2_163
end
BBCreateMacro = L0_0
function L0_0(A0_164, A1_165)
  local L2_166
  L2_166 = GetParam
  L2_166 = L2_166("Macro", A0_164, A1_165)
  if L2_166 ~= nil and type(L2_166) == "table" then
    ExecuteBuildingBlocks(L2_166, A0_164)
  else
    ClientPrint("Designer Error: Macro variable is not initialized inside of event. Macro Variable was: " .. tostring(A1_165.MacroVar) .. " and current block data is: " .. gCurrentBuildingBlockString .. ". This error probably occurred due to variable not being initialized yet, being misnamed or two events being called out of sequence. It is highly recommended that script macros either be initialized OnBuffActivate, OnCharActivate or in the same event. Pro Devs may violate this rule at the risk of being forced to read this error message again.")
  end
end
BBRunMacro = L0_0
function L0_0(A0_167, A1_168, A2_169)
  local L3_170, L4_171, L5_172, L6_173
  L3_170 = GetTable
  L4_171 = A0_167
  L5_172 = A1_168.Src1VarTable
  L6_173 = false
  L3_170 = L3_170(L4_171, L5_172, L6_173)
  L4_171 = GetTable
  L5_172 = A0_167
  L6_173 = A1_168.Src2VarTable
  L4_171 = L4_171(L5_172, L6_173, false)
  L5_172 = false
  L6_173 = nil
  if L3_170 ~= nil and A1_168.Src1Var ~= nil then
    L6_173 = L3_170[A1_168.Src1Var]
  else
    L6_173 = A1_168.Value1
  end
  if L4_171 ~= nil and A1_168.Src2Var ~= nil then
    L5_172 = A1_168.CompareOp(L6_173, L4_171[A1_168.Src2Var])
  else
    L5_172 = A1_168.CompareOp(L6_173, A1_168.Value2)
  end
  if L5_172 then
    ExecuteBuildingBlocks(A2_169, A0_167)
    A0_167.LastIfSucceeded = true
  else
    A0_167.LastIfSucceeded = false
  end
end
BBIf = L0_0
function L0_0(A0_174, A1_175, A2_176)
  if A0_174.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_176, A0_174)
    A0_174.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_177, A1_178, A2_179)
  local L3_180, L4_181, L5_182, L6_183
  L3_180 = A0_177.LastIfSucceeded
  if L3_180 == false then
    L3_180 = GetTable
    L4_181 = A0_177
    L5_182 = A1_178.Src1VarTable
    L6_183 = false
    L3_180 = L3_180(L4_181, L5_182, L6_183)
    L4_181 = GetTable
    L5_182 = A0_177
    L6_183 = A1_178.Src2VarTable
    L4_181 = L4_181(L5_182, L6_183, false)
    L5_182 = false
    L6_183 = nil
    if L3_180 ~= nil and A1_178.Src1Var ~= nil then
      L6_183 = L3_180[A1_178.Src1Var]
    else
      L6_183 = A1_178.Value1
    end
    if L4_181 ~= nil and A1_178.Src2Var ~= nil then
      L5_182 = A1_178.CompareOp(L6_183, L4_181[A1_178.Src2Var])
    else
      L5_182 = A1_178.CompareOp(L6_183, A1_178.Value2)
    end
    if L5_182 then
      ExecuteBuildingBlocks(A2_179, A0_177)
      A0_177.LastIfSucceeded = true
    else
      A0_177.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_184, A1_185, A2_186)
  local L3_187
  if A1_185.TargetVar ~= nil then
    L3_187 = A0_184[A1_185.TargetVar]
  else
    L3_187 = A0_184.Target
  end
  if HasBuffOfType(L3_187, A1_185.BuffType) then
    ExecuteBuildingBlocks(A2_186, A0_184)
    A0_184.LastIfSucceeded = true
  else
    A0_184.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_188, A1_189, A2_190)
  local L3_191, L4_192
  if A1_189.OwnerVar ~= nil then
    L3_191 = A0_188[A1_189.OwnerVar]
  else
    L3_191 = A0_188.Owner
  end
  if A1_189.AttackerVar ~= nil then
    L4_192 = A0_188[A1_189.AttackerVar]
  else
    L4_192 = A0_188.Attacker
  end
  if SpellBuffCount(L3_191, A1_189.BuffName, L4_192) > 0 then
    ExecuteBuildingBlocks(A2_190, A0_188)
    A0_188.LastIfSucceeded = true
  else
    A0_188.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_193, A1_194, A2_195)
  if BBIsMissileAutoAttack(A0_193, A1_194) then
    ExecuteBuildingBlocks(A2_195, A0_193)
    A0_193.LastIfSucceeded = true
  else
    A0_193.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_196, A1_197)
  A0_196.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_198, A1_199, A2_200)
  local L3_201, L4_202
  if A1_199.OwnerVar ~= nil then
    L3_201 = A0_198[A1_199.OwnerVar]
  else
    L3_201 = A0_198.Owner
  end
  if A1_199.CasterVar ~= nil then
    L4_202 = A0_198[A1_199.CasterVar]
  else
    L4_202 = A0_198.Caster
  end
  if SpellBuffCount(L3_201, A1_199.BuffName, L4_202) <= 0 then
    ExecuteBuildingBlocks(A2_200, A0_198)
    A0_198.LastIfSucceeded = true
  else
    A0_198.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_203, A1_204, A2_205)
  local L3_206, L4_207
  if A1_204.OwnerVar ~= nil then
    L3_206 = A0_203[A1_204.OwnerVar]
  else
    L3_206 = A0_203.Owner
  end
  if HasPARType(L3_206, A1_204.PARType) then
    ExecuteBuildingBlocks(A2_205, A0_203)
    A0_203.LastIfSucceeded = true
  else
    A0_203.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_208, A1_209, A2_210)
  local L3_211, L4_212
  if A1_209.OwnerVar ~= nil then
    L3_211 = A0_208[A1_209.OwnerVar]
  else
    L3_211 = A0_208.Owner
  end
  if not HasPARType(L3_211, A1_209.PARType) then
    ExecuteBuildingBlocks(A2_210, A0_208)
    A0_208.LastIfSucceeded = true
  else
    A0_208.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_213, A1_214, A2_215)
  local L3_216, L4_217, L5_218, L6_219, L7_220
  L3_216 = GetTable
  L4_217 = A0_213
  L5_218 = A1_214.Src1VarTable
  L6_219 = false
  L3_216 = L3_216(L4_217, L5_218, L6_219)
  L4_217 = GetTable
  L5_218 = A0_213
  L6_219 = A1_214.Src2VarTable
  L7_220 = false
  L4_217 = L4_217(L5_218, L6_219, L7_220)
  L5_218 = true
  while L5_218 do
    L6_219 = false
    L7_220 = nil
    if L3_216 ~= nil and A1_214.Src1Var ~= nil then
      L7_220 = L3_216[A1_214.Src1Var]
    else
      L7_220 = A1_214.Value1
    end
    if L4_217 ~= nil and A1_214.Src2Var ~= nil then
      L6_219 = A1_214.CompareOp(L7_220, L4_217[A1_214.Src2Var])
    else
      L6_219 = A1_214.CompareOp(L7_220, A1_214.Value2)
    end
    if L6_219 then
      ExecuteBuildingBlocks(A2_215, A0_213)
    else
      L5_218 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_221, A1_222)
  return A0_221 * A1_222
end
MO_MULTIPLY = L0_0
function L0_0(A0_223, A1_224)
  return A0_223 + A1_224
end
MO_ADD = L0_0
function L0_0(A0_225, A1_226)
  return A0_225 - A1_226
end
MO_SUBTRACT = L0_0
function L0_0(A0_227, A1_228)
  return A0_227 / A1_228
end
MO_DIVIDE = L0_0
function L0_0(A0_229, A1_230)
  if A0_229 < A1_230 then
    return A0_229
  else
    return A1_230
  end
end
MO_MIN = L0_0
function L0_0(A0_231, A1_232)
  if A1_232 < A0_231 then
    return A0_231
  else
    return A1_232
  end
end
MO_MAX = L0_0
function L0_0(A0_233, A1_234)
  return A0_233 % A1_234
end
MO_MODULO = L0_0
function L0_0(A0_235)
  return math.floor(A0_235 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_236)
  return math.ceil(A0_236)
end
MO_ROUNDUP = L0_0
function L0_0(A0_237)
  return math.floor(A0_237)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_238)
  return math.sin(math.rad(A0_238))
end
MO_SIN = L0_0
function L0_0(A0_239)
  return math.cos(math.rad(A0_239))
end
MO_COSINE = L0_0
function L0_0(A0_240)
  return math.tan(math.rad(A0_240))
end
MO_TANGENT = L0_0
function L0_0(A0_241)
  return math.deg(math.asin(A0_241))
end
MO_ASIN = L0_0
function L0_0(A0_242)
  return math.deg(math.acos(A0_242))
end
MO_ACOS = L0_0
function L0_0(A0_243)
  return math.deg(math.atan(A0_243))
end
MO_ATAN = L0_0
function L0_0(A0_244, A1_245)
  return math.pow(A0_244, A1_245)
end
MO_POW = L0_0
function L0_0(A0_246)
  return math.sqrt(A0_246)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_247, A1_248)
  local L2_249
  L2_249 = A0_247 and A1_248
  return L2_249
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_250, A1_251)
  local L2_252
  L2_252 = A0_250 or A1_251
  return L2_252
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_253)
  local L1_254
  L1_254 = not A0_253
  return L1_254
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_255)
  return math.abs(A0_255)
end
MO_ABS = L0_0
function L0_0(A0_256, A1_257)
  return math.random(A0_256, A1_257)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_258, A1_259)
  local L2_260, L3_261, L4_262, L5_263
  L2_260 = GetMathNumber
  L3_261 = A0_258
  L4_262 = A1_259.Src1VarTable
  L5_263 = A1_259.Src1Var
  L2_260 = L2_260(L3_261, L4_262, L5_263, A1_259.Src1Value)
  L3_261 = GetMathNumber
  L4_262 = A0_258
  L5_263 = A1_259.Src2VarTable
  L3_261 = L3_261(L4_262, L5_263, A1_259.Src2Var, A1_259.Src2Value)
  L4_262 = GetTable
  L5_263 = A0_258
  L4_262 = L4_262(L5_263, A1_259.DestVarTable)
  L5_263 = A1_259.MathOp
  L5_263 = L5_263(L2_260, L3_261)
  SetVarInTable(A0_258, A1_259, L5_263)
end
BBMath = L0_0
function L0_0(A0_264, A1_265, A2_266, A3_267)
  if A2_266 ~= nil and GetTable(A0_264, A1_265)[A2_266] ~= nil then
    return GetTable(A0_264, A1_265)[A2_266]
  end
  return A3_267
end
GetMathNumber = L0_0
function L0_0(A0_268, A1_269)
  if type(A1_269) == "number" then
    return A1_269
  elseif type(A1_269) == "function" then
    return A1_269(A0_268)
  elseif type(A1_269) == "string" then
    return A0_268[A1_269]
  end
end
GetNumber = L0_0
function L0_0(A0_270, A1_271)
  return VectorAdd(A0_270, A1_271)
end
VEC_ADD = L0_0
function L0_0(A0_272, A1_273)
  return VectorSubtract(A0_272, A1_273)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_274, A1_275)
  return VectorScalarMultiply(A0_274, A1_275)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_276, A1_277)
  return VectorScalarDivide(A0_276, A1_277)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_278, A1_279)
  return VectorRotateY(A0_278, A1_279)
end
VEC_ROTATE = L0_0
function L0_0(A0_280, A1_281)
  BBMath(A0_280, A1_281)
end
BBVectorMath = L0_0
function L0_0(A0_282, A1_283)
  local L2_284, L3_285, L4_286, L5_287
  L2_284 = A0_282.InstanceVars
  L3_285 = L2_284.InterpDelta
  if L3_285 == nil then
    L3_285 = A1_283.Amount
    L4_286 = A1_283.AmountVar
    if L4_286 ~= nil then
      L4_286 = GetTable
      L5_287 = A0_282
      L4_286 = L4_286(L5_287, A1_283.AmountVarTable)
      L5_287 = A1_283.AmountVar
      L3_285 = L4_286[L5_287]
    end
    L4_286 = GetPosition
    L5_287 = A1_283.TargetVar
    L5_287 = A0_282[L5_287]
    L4_286 = L4_286(L5_287)
    L2_284.KnockBackStart = L4_286
    L4_286 = GetNormalizedPositionDelta
    L5_287 = A1_283.TargetVar
    L5_287 = A0_282[L5_287]
    L4_286 = L4_286(L5_287, A0_282[A1_283.AttackerVar], true)
    L5_287 = {}
    L5_287.x = L4_286.x * L3_285
    L5_287.y = 0
    L5_287.z = L4_286.z * L3_285
    L2_284.InterpDelta = L5_287
    L5_287 = GetTime
    L5_287 = L5_287()
    L2_284.StartTime = L5_287
    L5_287 = A1_283.KnockBackDuration
    L2_284.KnockBackDuration = L5_287
  end
  L3_285 = A1_283.TargetVar
  L3_285 = A0_282[L3_285]
  L4_286 = GetTime
  L4_286 = L4_286()
  L5_287 = L2_284.StartTime
  L4_286 = L4_286 - L5_287
  L5_287 = L2_284.KnockBackDuration
  L4_286 = L4_286 / L5_287
  L5_287 = {}
  L5_287.x = L2_284.KnockBackStart.x + L2_284.InterpDelta.x * L4_286
  L5_287.y = L2_284.KnockBackStart.y
  L5_287.z = L2_284.KnockBackStart.z + L2_284.InterpDelta.z * L4_286
  SetPosition(L3_285, L5_287)
end
BBKnockback = L0_0
function L0_0(A0_288, A1_289)
  local L2_290, L3_291
  L2_290 = GetParam
  L3_291 = "Left"
  L2_290 = L2_290(L3_291, A0_288, A1_289)
  L3_291 = GetParam
  L3_291 = L3_291("Right", A0_288, A1_289)
  GetTable(A0_288, A1_289.DestVarTable, true)[A1_289.DestVar] = tostring(L2_290) .. tostring(L3_291)
end
BBAppendString = L0_0
function L0_0(A0_292, A1_293)
  local L2_294
  L2_294 = 0
  if A1_293.Delta ~= nil then
    L2_294 = L2_294 + A1_293.Delta
  end
  if A1_293.DeltaByLevel ~= nil and A0_292.Level ~= nil then
    L2_294 = L2_294 + A1_293.DeltaByLevel[A0_292.Level]
  end
  if A1_293.DeltaVar ~= nil then
    L2_294 = L2_294 + GetTable(A0_292, A1_293.DeltaVarTable, true)[A1_293.DeltaVar]
  end
  if A1_293.TargetVar ~= nil then
    A1_293.Stat(L2_294, A0_292[A1_293.TargetVar])
  else
    A1_293.Stat(L2_294)
  end
end
BBIncStat = L0_0
function L0_0(A0_295, A1_296)
  local L2_297
  L2_297 = 0
  if A1_296.Delta ~= nil then
    L2_297 = L2_297 + A1_296.Delta
  end
  if A1_296.DeltaByLevel ~= nil and A0_295.Level ~= nil then
    L2_297 = L2_297 + A1_296.DeltaByLevel[A0_295.Level]
  end
  if A1_296.DeltaVar ~= nil then
    L2_297 = L2_297 + GetTable(A0_295, A1_296.DeltaVarTable, true)[A1_296.DeltaVar]
  end
  if A1_296.TargetVar ~= nil then
    A1_296.Stat(L2_297, A0_295[A1_296.TargetVar])
  else
    A1_296.Stat(L2_297)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_298, A1_299)
  if A1_299.AttackVar ~= nil then
  end
  if A1_299.Attack ~= nil then
  end
  if A1_299.TotalCoefficientVar ~= nil then
  end
  if A1_299.TotalCoefficient ~= nil then
  end
  if A1_299.TargetVar ~= nil then
    GetTable(A0_298, A1_299.DestVarTable, false)[A1_299.DestVar] = (0 + GetTable(A0_298, A1_299.AttackVarTable, true)[A1_299.AttackVar] + A1_299.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_298[A1_299.TargetVar])) + GetFlatCritDamageMod(A0_298[A1_299.TargetVar])) * (0 + GetTable(A0_298, A1_299.TotalCoefficientVarTable, true)[A1_299.TotalCoefficientVar] + A1_299.TotalCoefficient)
  else
    GetTable(A0_298, A1_299.DestVarTable, false)[A1_299.DestVar] = 2 * A1_299.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_300, A1_301)
  local L2_302, L3_303, L4_304, L5_305, L6_306, L7_307
  L2_302 = GetTable
  L3_303 = A0_300
  L4_304 = A1_301.DestVarTable
  L5_305 = false
  L2_302 = L2_302(L3_303, L4_304, L5_305)
  L3_303 = GetTable
  L4_304 = A0_300
  L5_305 = A1_301.AmountVarTable
  L6_306 = true
  L3_303 = L3_303(L4_304, L5_305, L6_306)
  L4_304 = GetTable
  L5_305 = A0_300
  L6_306 = A0_300.NextBuffVars
  L7_307 = false
  L4_304 = L4_304(L5_305, L6_306, L7_307)
  L5_305 = A1_301.AmountVar
  L5_305 = L3_303[L5_305]
  L6_306 = A1_301.Amount
  L5_305 = L5_305 + L6_306
  L4_304.InitializeShield_Amount = L5_305
  L5_305 = A1_301.AmountVar
  if L5_305 ~= nil then
    L5_305 = A1_301.HealShieldMod
    if L5_305 ~= nil and L5_305 == true then
      L6_306 = A1_301.AttackerVar
      L7_307 = 0
      if L6_306 ~= nil then
        L7_307 = GetPercentHealingAmountMod(A0_300[L6_306])
      end
      L4_304.InitializeShield_Amount, L3_303[A1_301.AmountVar] = (A1_301.Amount + L3_303[A1_301.AmountVar]) * (1 + L7_307), (A1_301.Amount + L3_303[A1_301.AmountVar]) * (1 + L7_307)
    end
  end
  L5_305 = SpellBuffAddNoRenew
  L6_306 = A1_301.AttackerVar
  L6_306 = A0_300[L6_306]
  L7_307 = A1_301.UnitVar
  L7_307 = A0_300[L7_307]
  L5_305(L6_306, L7_307, "InitializeShieldMarker", 0, 1, 25000, L4_304)
  L5_305 = BBIncreaseShield
  L6_306 = A0_300
  L7_307 = A1_301
  L5_305(L6_306, L7_307)
end
BBInitializeShield = L0_0
function L0_0(A0_308, A1_309)
  if A1_309.CDVar ~= nil then
  end
  if A1_309.CD ~= nil then
  end
  if A1_309.TargetVar ~= nil then
    GetTable(A0_308, A1_309.DestVarTable, false)[A1_309.DestVar] = (0 + GetTable(A0_308, A1_309.CDVarTable, true)[A1_309.CDVar] + A1_309.CD) * (1 + GetPercentCooldownMod(A0_308[A1_309.TargetVar]))
  else
    GetTable(A0_308, A1_309.DestVarTable, false)[A1_309.DestVar] = A1_309.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_310, A1_311)
  local L2_312, L3_313
  L3_313 = A1_311.TargetVar
  if L3_313 ~= nil then
    L2_312 = A1_311.Stat(A0_310[L3_313])
  else
    L2_312 = A1_311.Stat()
  end
  SetVarInTable(A0_310, A1_311, L2_312)
end
BBGetStat = L0_0
function L0_0(A0_314, A1_315)
  if A1_315.TargetVar ~= nil then
    GetTable(A0_314, A1_315.DestVarTable, false)[A1_315.DestVar] = GetLevel(A0_314[A1_315.TargetVar])
  else
    GetTable(A0_314, A1_315.DestVarTable, false)[A1_315.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_316, A1_317)
  if A1_317.TargetVar ~= nil then
    GetTable(A0_316, A1_317.DestVarTable, false)[A1_317.DestVar] = GetUnitSignificance(A0_316[A1_317.TargetVar])
  else
    GetTable(A0_316, A1_317.DestVarTable, false)[A1_317.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_318, A1_319)
  if A1_319.TargetVar ~= nil then
    GetTable(A0_318, A1_319.DestVarTable, false)[A1_319.DestVar] = GetArmor(A0_318[A1_319.TargetVar])
  else
    GetTable(A0_318, A1_319.DestVarTable, false)[A1_319.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_320, A1_321)
  if A1_321.TargetVar ~= nil then
    GetTable(A0_320, A1_321.DestVarTable, false)[A1_321.DestVar] = GetSpellBlock(A0_320[A1_321.TargetVar])
  else
    GetTable(A0_320, A1_321.DestVarTable, false)[A1_321.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_322, A1_323)
  local L2_324, L3_325
  L3_325 = A1_323.TargetVar
  if L3_325 ~= nil then
    L2_324 = GetTeamID(A0_322[L3_325])
  else
    L2_324 = GetTeamID()
  end
  SetVarInTable(A0_322, A1_323, L2_324)
end
BBGetTeamID = L0_0
function L0_0(A0_326, A1_327)
  local L2_328, L3_329, L4_330
  L2_328 = GetTable
  L3_329 = A0_326
  L4_330 = A1_327.DestVarTable
  L2_328 = L2_328(L3_329, L4_330, false)
  L3_329 = A1_327.TargetVar
  L4_330 = nil
  if L3_329 ~= nil then
    L4_330 = GetTeamID(A0_326[L3_329])
  else
    L4_330 = GetTeamID()
  end
  if L4_330 == TEAM_ORDER then
    L2_328[A1_327.DestVar] = TEAM_CHAOS
  elseif L4_330 == TEAM_CHAOS then
    L2_328[A1_327.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_331, A1_332)
  if A1_332.TargetVar ~= nil then
    GetTable(A0_331, A1_332.DestVarTable, false)[A1_332.DestVar] = GetUnitSkinName(A0_331[A1_332.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_333, A1_334)
  local L2_335, L3_336, L4_337
  L2_335 = GetTable
  L3_336 = A0_333
  L4_337 = A1_334.DestVarTable
  L2_335 = L2_335(L3_336, L4_337, false)
  L3_336 = A0_333.Owner
  L4_337 = nil
  if A1_334.TargetVar ~= nil then
    L4_337 = GetTotalAttackDamage(A0_333[A1_334.TargetVar])
  else
    L4_337 = GetTotalAttackDamage()
  end
  SetVarInTable(A0_333, A1_334, L4_337)
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_338, A1_339)
  GetTable(A0_338, A1_339.DestVarTable, true)[A1_339.DestVar] = A1_339.Status(A0_338[A1_339.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_340, A1_341)
  local L2_342
  L2_342 = A1_341.TargetVar
  L2_342 = A0_340[L2_342]
  ClearAttackTarget(L2_342)
end
BBClearAttackTarget = L0_0
function L0_0(A0_343, A1_344)
  local L2_345, L3_346
  L2_345 = GetTable
  L3_346 = A0_343
  L2_345 = L2_345(L3_346, A1_344.DestVarTable, true)
  L3_346 = A1_344.Info
  L3_346 = L3_346(A0_343[A1_344.TargetVar])
  SetVarInTable(A0_343, A1_344, L3_346)
end
BBGetCastInfo = L0_0
function L0_0(A0_347, A1_348, A2_349)
  local L3_350, L4_351, L5_352, L6_353
  L3_350 = GetTable
  L4_351 = A0_347
  L5_352 = A1_348.TrackTimeVarTable
  L6_353 = false
  L3_350 = L3_350(L4_351, L5_352, L6_353)
  L4_351 = GetTime
  L4_351 = L4_351()
  L5_352 = A1_348.ExecuteImmediately
  L6_353 = GetParam
  L6_353 = L6_353("TimeBetweenExecutions", A0_347, A1_348)
  if A1_348.TickTimeVar ~= nil and GetTable(A0_347, A1_348.TickTimeVarTable, false)[A1_348.TickTimeVar] ~= nil then
    L6_353 = GetTable(A0_347, A1_348.TickTimeVarTable, false)[A1_348.TickTimeVar]
  end
  if L3_350[A1_348.TrackTimeVar] == nil then
    L3_350[A1_348.TrackTimeVar] = L4_351
    if L5_352 == true then
      ExecuteBuildingBlocks(A2_349, A0_347)
    end
  end
  if L4_351 >= L3_350[A1_348.TrackTimeVar] + L6_353 then
    L3_350[A1_348.TrackTimeVar] = L3_350[A1_348.TrackTimeVar] + L6_353
    ExecuteBuildingBlocks(A2_349, A0_347)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_354, A1_355, A2_356)
  GetTable(A0_354, A1_355.TrackTimeVarTable, false)[A1_355.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_357, A1_358)
  local L2_359
  L2_359 = A1_358.SrcValue
  if A1_358.SrcVar ~= nil then
    L2_359 = GetTable(A0_357, A1_358.SrcVarTable, true)[A1_358.SrcVar]
  end
  A1_358.Status(A0_357[A1_358.TargetVar], L2_359)
end
BBSetStatus = L0_0
function L0_0(A0_360, A1_361)
  local L2_362
  L2_362 = A1_361.ToAlert
  if GetTable(A0_360, A1_361.SrcVarTable, false) ~= nil and A1_361.SrcVar ~= nil then
    L2_362 = L2_362 .. GetTable(A0_360, A1_361.SrcVarTable, false)[A1_361.SrcVar]
  end
  _ALERT(L2_362)
end
BBAlert = L0_0
function L0_0(A0_363, A1_364)
  local L2_365, L3_366, L4_367, L5_368, L6_369, L7_370
  L2_365 = GetParam
  L3_366 = "Message"
  L4_367 = A0_363
  L5_368 = A1_364
  L2_365 = L2_365(L3_366, L4_367, L5_368)
  if L2_365 == nil then
    L3_366 = ReportError
    L4_367 = "Could not resolve Message param"
    L3_366(L4_367)
    return
  end
  L3_366 = true
  L4_367 = GetParam
  L5_368 = "OnUnit"
  L6_369 = A0_363
  L7_370 = A1_364
  L4_367 = L4_367(L5_368, L6_369, L7_370)
  if L4_367 == nil then
    L3_366 = false
    L5_368 = GetParam
    L6_369 = "OnUnitByFlag"
    L7_370 = A0_363
    L5_368 = L5_368(L6_369, L7_370, A1_364)
    L4_367 = L5_368
  end
  if L4_367 == nil then
    L5_368 = ReportError
    L6_369 = "Could not resolve OnUnit param"
    L5_368(L6_369)
    return
  end
  L5_368 = true
  L6_369 = GetParam
  L7_370 = "ChampionToSayTo"
  L6_369 = L6_369(L7_370, A0_363, A1_364)
  if L6_369 == nil then
    L5_368 = false
    L7_370 = GetParam
    L7_370 = L7_370("ChampionToSayToByFlag", A0_363, A1_364)
    L6_369 = L7_370
  end
  if L6_369 == nil then
    L7_370 = ReportError
    L7_370("Could not resolve ChampionToSayTo param")
    return
  end
  L7_370 = GetParam
  L7_370 = L7_370("ShowToSpectator", A0_363, A1_364)
  if L7_370 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  SayWithFloatingTextOnUnitToChampion(tostring(L2_365), A1_364.TextType, L4_367, L3_366, L6_369, L5_368, L7_370)
end
BBSayWithFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_371, A1_372)
  local L2_373, L3_374, L4_375
  L2_373 = A1_372.ToSay
  L3_374 = GetTable
  L4_375 = A0_371
  L3_374 = L3_374(L4_375, A1_372.SrcVarTable, false)
  if L3_374 ~= nil then
    L4_375 = A1_372.SrcVar
    if L4_375 ~= nil then
      L4_375 = L2_373
      L2_373 = L4_375 .. tostring(L3_374[A1_372.SrcVar])
    end
  end
  L4_375 = nil
  if A1_372.OwnerVar ~= nil then
    L4_375 = A0_371[A1_372.OwnerVar]
  else
    L4_375 = A0_371.Owner
  end
  if A1_372.TextType == nil then
    A1_372.TextType = 0
  end
  Say(L4_375, L2_373, A1_372.TextType)
end
BBSay = L0_0
function L0_0(A0_376, A1_377)
  local L2_378, L3_379, L4_380
  L2_378 = A1_377.ToSay
  L3_379 = GetTable
  L4_380 = A0_376
  L3_379 = L3_379(L4_380, A1_377.SrcVarTable, false)
  if L3_379 ~= nil then
    L4_380 = A1_377.SrcVar
    if L4_380 ~= nil then
      L4_380 = L2_378
      L2_378 = L4_380 .. tostring(L3_379[A1_377.SrcVar])
    end
  end
  L4_380 = nil
  if A1_377.OwnerVar ~= nil then
    L4_380 = A0_376[A1_377.OwnerVar]
  else
    L4_380 = A0_376.Owner
  end
  if A1_377.TextType == nil then
    A1_377.TextType = 0
  end
  Say(L4_380, L2_378, A1_377.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_381, A1_382)
  GetTable(A0_381, A1_382.DestVarTable, true)[A1_382.DestVar] = BBLuaGetGold(A0_381, A1_382)
end
BBGetGold = L0_0
function L0_0(A0_383, A1_384)
  GetTable(A0_383, A1_384.DestVarTable, true)[A1_384.DestVar] = BBLuaGetTotalGold(A0_383, A1_384)
end
BBGetTotalGold = L0_0
function L0_0(A0_385, A1_386)
  SpellBuffAdd(A0_385[A1_386.OwnerVar], A0_385[A1_386.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_385.NextBuffVars)
  BBTeleportToPositionHelper(A0_385, A1_386)
end
BBTeleportToPosition = L0_0
function L0_0(A0_387, A1_388)
  if A1_388.XVar ~= nil and GetTable(A0_387, A1_388.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_387, A1_388.XVarTable, true)[A1_388.XVar]
  else
    Xloc = A1_388.X
  end
  if A1_388.YVar ~= nil and GetTable(A0_387, A1_388.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_387, A1_388.YVarTable, true)[A1_388.YVar]
  else
    Yloc = A1_388.Y
  end
  if A1_388.ZVar ~= nil and GetTable(A0_387, A1_388.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_387, A1_388.ZVarTable, true)[A1_388.ZVar]
  else
    Zloc = A1_388.Z
  end
  A1_388.OwnerVar, A0_387.position = A1_388.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_388.CastPositionName = "position"
  BBTeleportToPosition(A0_387, A1_388)
end
BBTeleportToPoint = L0_0
function L0_0(A0_389, A1_390)
  DefUpdateAura(GetTable(A0_389, A1_390.CenterTable, false)[A1_390.CenterVar], A1_390.Range, A1_390.UnitScan, A1_390.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_391, A1_392)
  ReincarnateNonDeadHero(GetTable(A0_391, A1_392.TargetTable, false)[A1_392.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_393, A1_394)
  GetTable(A0_393, A1_394.DestVarTable, true)[A1_394.DestVar] = A1_394.Function(A0_393[A1_394.OwnerVar], A1_394.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_395, A1_396)
  local L2_397, L3_398, L4_399, L5_400
  L2_397 = A1_396.WhomToOrderVar
  L2_397 = A0_395[L2_397]
  L3_398 = A1_396.TargetOfOrderVar
  L3_398 = A0_395[L3_398]
  L4_399 = GetTable
  L5_400 = A0_395
  L4_399 = L4_399(L5_400, A1_396.SrcVarTable, false)
  L5_400 = nil
  if A1_396.SrcVar ~= nil and L4_399 ~= nil then
    L5_400 = L4_399[A1_396.SrcVar]
  else
    L5_400 = GetPosition(L3_398)
  end
  if L3_398 == nil then
    L3_398 = L2_397
  end
  IssueOrder(L2_397, A1_396.Order, L5_400, L3_398)
end
BBIssueOrder = L0_0
function L0_0(A0_401, A1_402)
  local L2_403
  L2_403 = GetParam
  L2_403 = L2_403("NewRange", A0_401, A1_402)
  SetSpellCastRange(L2_403)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_404, A1_405)
  GetTable(A0_404, A1_405.DestVarTable, true)[A1_405.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_406, A1_407)
  local L2_408, L3_409
  L2_408 = A1_407.ObjectVar1
  L2_408 = A0_406[L2_408]
  L3_409 = A1_407.ObjectVar2
  L3_409 = A0_406[L3_409]
  GetTable(A0_406, A1_407.DestVarTable, true)[A1_407.DestVar] = DistanceBetweenObjectBounds(L2_408, L3_409)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_410, A1_411)
  local L2_412, L3_413, L4_414
  L2_412 = A1_411.ObjectVar
  L2_412 = A0_410[L2_412]
  L3_413 = GetTable
  L4_414 = A0_410
  L3_413 = L3_413(L4_414, A1_411.PointVarTable, true)
  L4_414 = A1_411.PointVar
  L4_414 = L3_413[L4_414]
  GetTable(A0_410, A1_411.DestVarTable, true)[A1_411.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_412, L4_414)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_415, A1_416)
  local L2_417, L3_418
  L2_417 = GetParam
  L3_418 = "Point1"
  L2_417 = L2_417(L3_418, A0_415, A1_416)
  L3_418 = GetParam
  L3_418 = L3_418("Point2", A0_415, A1_416)
  GetTable(A0_415, A1_416.DestVarTable, true)[A1_416.DestVar] = DistanceBetweenPoints(L2_417, L3_418)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_419, A1_420, A2_421)
  local L3_422, L4_423, L5_424, L6_425, L7_426, L8_427
  L5_424 = 0
  L6_425 = nil
  L7_426 = A1_420.ObjectDistanceType
  L8_427 = A1_420.ObjectVar1
  L3_422 = A0_419[L8_427]
  L8_427 = A1_420.ObjectVar2
  L4_423 = A0_419[L8_427]
  if nil == L4_423 then
    L8_427 = A1_420.Point2Var
    if nil ~= L8_427 then
      L8_427 = GetTable
      L8_427 = L8_427(A0_419, A1_420.Point2VarTable, true)
      L4_423 = L8_427[A1_420.Point2Var]
      L5_424 = L5_424 + 1
    end
  end
  if nil == L3_422 then
    L8_427 = A1_420.Point1Var
    if nil ~= L8_427 then
      L8_427 = GetTable
      L8_427 = L8_427(A0_419, A1_420.Point1VarTable, true)
      L3_422 = L8_427[A1_420.Point1Var]
      L5_424 = L5_424 + 1
      if 1 == L5_424 then
        L3_422, L4_423 = L4_423, L3_422
      end
    end
  end
  if nil ~= L7_426 then
    if 0 == L5_424 then
      L8_427 = OBJECT_CENTER
      if L8_427 == L7_426 then
        L6_425 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_427 = OBJECT_BOUNDARY
        if L8_427 == L7_426 then
          L6_425 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_427 = A1_420.OwnerVar
          L8_427 = A0_419[L8_427]
          Say(L8_427, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_424 then
      L8_427 = OBJECT_CENTER
      if L8_427 == L7_426 then
        L6_425 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_427 = OBJECT_BOUNDARY
        if L8_427 == L7_426 then
          L6_425 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_427 = A1_420.OwnerVar
          L8_427 = A0_419[L8_427]
          Say(L8_427, "invalid object distance type", 0)
        end
      end
    else
      L6_425 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_427 = A1_420.Distance
  if A1_420.DistanceVar ~= nil and GetTable(A0_419, A1_420.DistanceVarTable, true) ~= nil then
    L8_427 = L8_427 + GetTable(A0_419, A1_420.DistanceVarTable, true)[A1_420.DistanceVar]
  end
  if L3_422 ~= nil and L4_423 ~= nil and L6_425 ~= nil and L8_427 ~= nil then
    if not L6_425(L3_422, L4_423, L8_427) then
      ExecuteBuildingBlocks(A2_421, A0_419)
      A0_419.LastIfSucceeded = true
    else
      A0_419.LastIfSucceeded = false
    end
  else
    A0_419.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_428, A1_429)
  local L2_430, L3_431
  L2_430 = A1_429.TargetVar
  L2_430 = A0_428[L2_430]
  L3_431 = A1_429.CasterVar
  L3_431 = A0_428[L3_431]
  GetTable(A0_428, A1_429.DestVarTable, true)[A1_429.DestVar] = SpellBuffCount(L2_430, A1_429.BuffName, L3_431)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_432, A1_433)
  local L2_434
  L2_434 = A1_433.TargetVar
  L2_434 = A0_432[L2_434]
  GetTable(A0_432, A1_433.DestVarTable, true)[A1_433.DestVar] = SpellBuffCount(L2_434, A1_433.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_435, A1_436)
  local L2_437, L3_438
  L2_437 = GetTable
  L3_438 = A0_435
  L2_437 = L2_437(L3_438, A1_436.ScaleVarTable, false)
  L3_438 = nil
  if A1_436.OwnerVar ~= nil then
    L3_438 = A0_435[A1_436.OwnerVar]
  else
    L3_438 = A0_435.Owner
  end
  if A1_436.ScaleVar ~= nil and A1_436.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_437[A1_436.ScaleVar], L3_438)
  else
    SetScaleSkinCoef(A1_436.Scale, L3_438)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_439, A1_440)
  SpellBuffAdd(A0_439[A1_440.TargetVar], A0_439[A1_440.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_439.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_441, A1_442, A2_443)
  local L3_444, L4_445
  L3_444 = A1_442.TargetVar
  L3_444 = A0_441[L3_444]
  L4_445 = A1_442.NumStacks
  if GetParam("NumStacks", A0_441, A1_442) == 0 then
    L4_445 = SpellBuffCount(L3_444, A1_442.BuffName, caster)
  else
    L4_445 = GetParam("NumStacks", A0_441, A1_442)
  end
  while L4_445 > 0 do
    SpellBuffRemove(L3_444, A1_442.BuffName, A0_441[A1_442.AttackerVar])
    L4_445 = L4_445 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_446, A1_447, A2_448)
  if A0_446.EmoteId == A1_447.EmoteId then
    ExecuteBuildingBlocks(A2_448, A0_446)
    A0_446.LastIfSucceeded = true
  else
    A0_446.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_449, A1_450, A2_451)
  if A0_449.EmoteId ~= A1_450.EmoteId then
    ExecuteBuildingBlocks(A2_451, A0_449)
    A0_449.LastIfSucceeded = true
  else
    A0_449.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_452, A1_453)
  local L2_454, L3_455, L4_456, L5_457
  L2_454 = GetTable
  L3_455 = A0_452
  L4_456 = A1_453.String1VarTable
  L5_457 = false
  L2_454 = L2_454(L3_455, L4_456, L5_457)
  L3_455 = A1_453.String1Var
  L3_455 = L2_454[L3_455]
  L4_456 = GetTable
  L5_457 = A0_452
  L4_456 = L4_456(L5_457, A1_453.String2VarTable, false)
  L5_457 = A1_453.String2Var
  L5_457 = L4_456[L5_457]
  GetTable(A0_452, A1_453.ResultVarTable, false)[A1_453.ResultVar] = L3_455 .. L5_457
end
BBConcatenateStrings = L0_0
function L0_0(A0_458, A1_459)
  BBGetMinionKills(A0_458, A1_459)
  A0_458.MinionKillSource = GetParam("MinionKillTarget")
  A0_458.MinionKills = A0_458.MinionsKilled + GetParam("MinionKills", A0_458, A1_459)
  BBSetMinionKills(A0_458, A1_459)
end
BBIncreaseMinionKills = L0_0
