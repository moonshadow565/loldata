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
  local L2_260, L3_261, L4_262, L5_263, L6_264, L7_265
  L2_260 = GetTable
  L3_261 = A0_258
  L4_262 = A1_259.DestVarTable
  L5_263 = false
  L2_260 = L2_260(L3_261, L4_262, L5_263)
  L3_261 = A0_258.Owner
  L4_262 = GetMathNumber
  L5_263 = A0_258
  L6_264 = A1_259.Src1VarTable
  L7_265 = A1_259.Src1Var
  L4_262 = L4_262(L5_263, L6_264, L7_265, A1_259.Src1Value)
  L5_263 = GetMathNumber
  L6_264 = A0_258
  L7_265 = A1_259.Src2VarTable
  L5_263 = L5_263(L6_264, L7_265, A1_259.Src2Var, A1_259.Src2Value)
  L6_264 = GetTable
  L7_265 = A0_258
  L6_264 = L6_264(L7_265, A1_259.DestVarTable)
  L7_265 = A1_259.MathOp
  L7_265 = L7_265(L4_262, L5_263)
  SetVarInTable(A0_258, A1_259, L7_265)
end
BBMath = L0_0
function L0_0(A0_266, A1_267, A2_268, A3_269)
  if A2_268 ~= nil and GetTable(A0_266, A1_267)[A2_268] ~= nil then
    return GetTable(A0_266, A1_267)[A2_268]
  end
  return A3_269
end
GetMathNumber = L0_0
function L0_0(A0_270, A1_271)
  if type(A1_271) == "number" then
    return A1_271
  elseif type(A1_271) == "function" then
    return A1_271(A0_270)
  elseif type(A1_271) == "string" then
    return A0_270[A1_271]
  end
end
GetNumber = L0_0
function L0_0(A0_272, A1_273)
  return VectorAdd(A0_272, A1_273)
end
VEC_ADD = L0_0
function L0_0(A0_274, A1_275)
  return VectorSubtract(A0_274, A1_275)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_276, A1_277)
  return VectorScalarMultiply(A0_276, A1_277)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_278, A1_279)
  return VectorScalarDivide(A0_278, A1_279)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_280, A1_281)
  return VectorRotateY(A0_280, A1_281)
end
VEC_ROTATE = L0_0
function L0_0(A0_282, A1_283)
  BBMath(A0_282, A1_283)
end
BBVectorMath = L0_0
function L0_0(A0_284, A1_285)
  local L2_286, L3_287, L4_288, L5_289
  L2_286 = A0_284.InstanceVars
  L3_287 = L2_286.InterpDelta
  if L3_287 == nil then
    L3_287 = A1_285.Amount
    L4_288 = A1_285.AmountVar
    if L4_288 ~= nil then
      L4_288 = GetTable
      L5_289 = A0_284
      L4_288 = L4_288(L5_289, A1_285.AmountVarTable)
      L5_289 = A1_285.AmountVar
      L3_287 = L4_288[L5_289]
    end
    L4_288 = GetPosition
    L5_289 = A1_285.TargetVar
    L5_289 = A0_284[L5_289]
    L4_288 = L4_288(L5_289)
    L2_286.KnockBackStart = L4_288
    L4_288 = GetNormalizedPositionDelta
    L5_289 = A1_285.TargetVar
    L5_289 = A0_284[L5_289]
    L4_288 = L4_288(L5_289, A0_284[A1_285.AttackerVar], true)
    L5_289 = {}
    L5_289.x = L4_288.x * L3_287
    L5_289.y = 0
    L5_289.z = L4_288.z * L3_287
    L2_286.InterpDelta = L5_289
    L5_289 = GetTime
    L5_289 = L5_289()
    L2_286.StartTime = L5_289
    L5_289 = A1_285.KnockBackDuration
    L2_286.KnockBackDuration = L5_289
  end
  L3_287 = A1_285.TargetVar
  L3_287 = A0_284[L3_287]
  L4_288 = GetTime
  L4_288 = L4_288()
  L5_289 = L2_286.StartTime
  L4_288 = L4_288 - L5_289
  L5_289 = L2_286.KnockBackDuration
  L4_288 = L4_288 / L5_289
  L5_289 = {}
  L5_289.x = L2_286.KnockBackStart.x + L2_286.InterpDelta.x * L4_288
  L5_289.y = L2_286.KnockBackStart.y
  L5_289.z = L2_286.KnockBackStart.z + L2_286.InterpDelta.z * L4_288
  SetPosition(L3_287, L5_289)
end
BBKnockback = L0_0
function L0_0(A0_290, A1_291)
  local L2_292, L3_293
  L2_292 = GetParam
  L3_293 = "Left"
  L2_292 = L2_292(L3_293, A0_290, A1_291)
  L3_293 = GetParam
  L3_293 = L3_293("Right", A0_290, A1_291)
  GetTable(A0_290, A1_291.DestVarTable, true)[A1_291.DestVar] = tostring(L2_292) .. tostring(L3_293)
end
BBAppendString = L0_0
function L0_0(A0_294, A1_295)
  local L2_296
  L2_296 = 0
  if A1_295.Delta ~= nil then
    L2_296 = L2_296 + A1_295.Delta
  end
  if A1_295.DeltaByLevel ~= nil and A0_294.Level ~= nil then
    L2_296 = L2_296 + A1_295.DeltaByLevel[A0_294.Level]
  end
  if A1_295.DeltaVar ~= nil then
    L2_296 = L2_296 + GetTable(A0_294, A1_295.DeltaVarTable, true)[A1_295.DeltaVar]
  end
  if A1_295.TargetVar ~= nil then
    A1_295.Stat(L2_296, A0_294[A1_295.TargetVar])
  else
    A1_295.Stat(L2_296)
  end
end
BBIncStat = L0_0
function L0_0(A0_297, A1_298)
  local L2_299
  L2_299 = 0
  if A1_298.Delta ~= nil then
    L2_299 = L2_299 + A1_298.Delta
  end
  if A1_298.DeltaByLevel ~= nil and A0_297.Level ~= nil then
    L2_299 = L2_299 + A1_298.DeltaByLevel[A0_297.Level]
  end
  if A1_298.DeltaVar ~= nil then
    L2_299 = L2_299 + GetTable(A0_297, A1_298.DeltaVarTable, true)[A1_298.DeltaVar]
  end
  if A1_298.TargetVar ~= nil then
    A1_298.Stat(L2_299, A0_297[A1_298.TargetVar])
  else
    A1_298.Stat(L2_299)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_300, A1_301)
  if A1_301.AttackVar ~= nil then
  end
  if A1_301.Attack ~= nil then
  end
  if A1_301.TotalCoefficientVar ~= nil then
  end
  if A1_301.TotalCoefficient ~= nil then
  end
  if A1_301.TargetVar ~= nil then
    GetTable(A0_300, A1_301.DestVarTable, false)[A1_301.DestVar] = (0 + GetTable(A0_300, A1_301.AttackVarTable, true)[A1_301.AttackVar] + A1_301.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_300[A1_301.TargetVar])) + GetFlatCritDamageMod(A0_300[A1_301.TargetVar])) * (0 + GetTable(A0_300, A1_301.TotalCoefficientVarTable, true)[A1_301.TotalCoefficientVar] + A1_301.TotalCoefficient)
  else
    GetTable(A0_300, A1_301.DestVarTable, false)[A1_301.DestVar] = 2 * A1_301.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_302, A1_303)
  local L2_304, L3_305, L4_306, L5_307, L6_308, L7_309
  L2_304 = GetTable
  L3_305 = A0_302
  L4_306 = A1_303.DestVarTable
  L5_307 = false
  L2_304 = L2_304(L3_305, L4_306, L5_307)
  L3_305 = GetTable
  L4_306 = A0_302
  L5_307 = A1_303.AmountVarTable
  L6_308 = true
  L3_305 = L3_305(L4_306, L5_307, L6_308)
  L4_306 = GetTable
  L5_307 = A0_302
  L6_308 = A0_302.NextBuffVars
  L7_309 = false
  L4_306 = L4_306(L5_307, L6_308, L7_309)
  L5_307 = A1_303.AmountVar
  L5_307 = L3_305[L5_307]
  L6_308 = A1_303.Amount
  L5_307 = L5_307 + L6_308
  L4_306.InitializeShield_Amount = L5_307
  L5_307 = A1_303.AmountVar
  if L5_307 ~= nil then
    L5_307 = A1_303.HealShieldMod
    if L5_307 ~= nil and L5_307 == true then
      L6_308 = A1_303.AttackerVar
      L7_309 = 0
      if L6_308 ~= nil then
        L7_309 = GetPercentHealingAmountMod(A0_302[L6_308])
      end
      L4_306.InitializeShield_Amount, L3_305[A1_303.AmountVar] = (A1_303.Amount + L3_305[A1_303.AmountVar]) * (1 + L7_309), (A1_303.Amount + L3_305[A1_303.AmountVar]) * (1 + L7_309)
    end
  end
  L5_307 = SpellBuffAddNoRenew
  L6_308 = A1_303.AttackerVar
  L6_308 = A0_302[L6_308]
  L7_309 = A1_303.UnitVar
  L7_309 = A0_302[L7_309]
  L5_307(L6_308, L7_309, "InitializeShieldMarker", 0, 1, 25000, L4_306)
  L5_307 = BBIncreaseShield
  L6_308 = A0_302
  L7_309 = A1_303
  L5_307(L6_308, L7_309)
end
BBInitializeShield = L0_0
function L0_0(A0_310, A1_311)
  if A1_311.CDVar ~= nil then
  end
  if A1_311.CD ~= nil then
  end
  if A1_311.TargetVar ~= nil then
    GetTable(A0_310, A1_311.DestVarTable, false)[A1_311.DestVar] = (0 + GetTable(A0_310, A1_311.CDVarTable, true)[A1_311.CDVar] + A1_311.CD) * (1 + GetPercentCooldownMod(A0_310[A1_311.TargetVar]))
  else
    GetTable(A0_310, A1_311.DestVarTable, false)[A1_311.DestVar] = A1_311.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_312, A1_313)
  local L2_314, L3_315, L4_316
  L2_314 = GetTable
  L3_315 = A0_312
  L4_316 = A1_313.DestVarTable
  L2_314 = L2_314(L3_315, L4_316, false)
  L3_315 = A0_312.Owner
  L4_316 = nil
  if A1_313.TargetVar ~= nil then
    L4_316 = A1_313.Stat(A0_312[A1_313.TargetVar])
  else
    L4_316 = A1_313.Stat()
  end
  SetVarInTable(A0_312, A1_313, L4_316)
end
BBGetStat = L0_0
function L0_0(A0_317, A1_318)
  if A1_318.TargetVar ~= nil then
    GetTable(A0_317, A1_318.DestVarTable, false)[A1_318.DestVar] = GetLevel(A0_317[A1_318.TargetVar])
  else
    GetTable(A0_317, A1_318.DestVarTable, false)[A1_318.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_319, A1_320)
  if A1_320.TargetVar ~= nil then
    GetTable(A0_319, A1_320.DestVarTable, false)[A1_320.DestVar] = GetUnitSignificance(A0_319[A1_320.TargetVar])
  else
    GetTable(A0_319, A1_320.DestVarTable, false)[A1_320.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_321, A1_322)
  if A1_322.TargetVar ~= nil then
    GetTable(A0_321, A1_322.DestVarTable, false)[A1_322.DestVar] = GetArmor(A0_321[A1_322.TargetVar])
  else
    GetTable(A0_321, A1_322.DestVarTable, false)[A1_322.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_323, A1_324)
  if A1_324.TargetVar ~= nil then
    GetTable(A0_323, A1_324.DestVarTable, false)[A1_324.DestVar] = GetSpellBlock(A0_323[A1_324.TargetVar])
  else
    GetTable(A0_323, A1_324.DestVarTable, false)[A1_324.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_325, A1_326)
  local L2_327, L3_328, L4_329
  L2_327 = GetTable
  L3_328 = A0_325
  L4_329 = A1_326.DestVarTable
  L2_327 = L2_327(L3_328, L4_329, false)
  L3_328 = A0_325.Owner
  L4_329 = nil
  if A1_326.TargetVar ~= nil then
    L4_329 = GetTeamID(A0_325[A1_326.TargetVar])
  else
    L4_329 = GetTeamID()
  end
  SetVarInTable(A0_325, A1_326, L4_329)
end
BBGetTeamID = L0_0
function L0_0(A0_330, A1_331)
  local L2_332, L3_333, L4_334
  L2_332 = GetTable
  L3_333 = A0_330
  L4_334 = A1_331.DestVarTable
  L2_332 = L2_332(L3_333, L4_334, false)
  L3_333 = A1_331.TargetVar
  L4_334 = nil
  if L3_333 ~= nil then
    L4_334 = GetTeamID(A0_330[L3_333])
  else
    L4_334 = GetTeamID()
  end
  if L4_334 == TEAM_ORDER then
    L2_332[A1_331.DestVar] = TEAM_CHAOS
  elseif L4_334 == TEAM_CHAOS then
    L2_332[A1_331.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_335, A1_336)
  if A1_336.TargetVar ~= nil then
    GetTable(A0_335, A1_336.DestVarTable, false)[A1_336.DestVar] = GetUnitSkinName(A0_335[A1_336.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_337, A1_338)
  local L2_339, L3_340, L4_341
  L2_339 = GetTable
  L3_340 = A0_337
  L4_341 = A1_338.DestVarTable
  L2_339 = L2_339(L3_340, L4_341, false)
  L3_340 = A0_337.Owner
  L4_341 = nil
  if A1_338.TargetVar ~= nil then
    L4_341 = GetTotalAttackDamage(A0_337[A1_338.TargetVar])
  else
    L4_341 = GetTotalAttackDamage()
  end
  SetVarInTable(A0_337, A1_338, L4_341)
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_342, A1_343)
  GetTable(A0_342, A1_343.DestVarTable, true)[A1_343.DestVar] = A1_343.Status(A0_342[A1_343.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_344, A1_345)
  local L2_346
  L2_346 = A1_345.TargetVar
  L2_346 = A0_344[L2_346]
  ClearAttackTarget(L2_346)
end
BBClearAttackTarget = L0_0
function L0_0(A0_347, A1_348)
  local L2_349, L3_350
  L2_349 = GetTable
  L3_350 = A0_347
  L2_349 = L2_349(L3_350, A1_348.DestVarTable, true)
  L3_350 = A1_348.Info
  L3_350 = L3_350(A0_347[A1_348.TargetVar])
  SetVarInTable(A0_347, A1_348, L3_350)
end
BBGetCastInfo = L0_0
function L0_0(A0_351, A1_352, A2_353)
  local L3_354, L4_355, L5_356, L6_357
  L3_354 = GetTable
  L4_355 = A0_351
  L5_356 = A1_352.TrackTimeVarTable
  L6_357 = false
  L3_354 = L3_354(L4_355, L5_356, L6_357)
  L4_355 = GetTime
  L4_355 = L4_355()
  L5_356 = A1_352.ExecuteImmediately
  L6_357 = GetParam
  L6_357 = L6_357("TimeBetweenExecutions", A0_351, A1_352)
  if A1_352.TickTimeVar ~= nil and GetTable(A0_351, A1_352.TickTimeVarTable, false)[A1_352.TickTimeVar] ~= nil then
    L6_357 = GetTable(A0_351, A1_352.TickTimeVarTable, false)[A1_352.TickTimeVar]
  end
  if L3_354[A1_352.TrackTimeVar] == nil then
    L3_354[A1_352.TrackTimeVar] = L4_355
    if L5_356 == true then
      ExecuteBuildingBlocks(A2_353, A0_351)
    end
  end
  if L4_355 >= L3_354[A1_352.TrackTimeVar] + L6_357 then
    L3_354[A1_352.TrackTimeVar] = L3_354[A1_352.TrackTimeVar] + L6_357
    ExecuteBuildingBlocks(A2_353, A0_351)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_358, A1_359, A2_360)
  GetTable(A0_358, A1_359.TrackTimeVarTable, false)[A1_359.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_361, A1_362)
  local L2_363
  L2_363 = A1_362.SrcValue
  if A1_362.SrcVar ~= nil then
    L2_363 = GetTable(A0_361, A1_362.SrcVarTable, true)[A1_362.SrcVar]
  end
  A1_362.Status(A0_361[A1_362.TargetVar], L2_363)
end
BBSetStatus = L0_0
function L0_0(A0_364, A1_365)
  local L2_366
  L2_366 = A1_365.ToAlert
  if GetTable(A0_364, A1_365.SrcVarTable, false) ~= nil and A1_365.SrcVar ~= nil then
    L2_366 = L2_366 .. GetTable(A0_364, A1_365.SrcVarTable, false)[A1_365.SrcVar]
  end
  _ALERT(L2_366)
end
BBAlert = L0_0
function L0_0(A0_367, A1_368)
  local L2_369, L3_370, L4_371, L5_372, L6_373, L7_374
  L2_369 = GetParam
  L3_370 = "Message"
  L4_371 = A0_367
  L5_372 = A1_368
  L2_369 = L2_369(L3_370, L4_371, L5_372)
  if L2_369 == nil then
    L3_370 = ReportError
    L4_371 = "Could not resolve Message param"
    L3_370(L4_371)
    return
  end
  L3_370 = true
  L4_371 = GetParam
  L5_372 = "OnUnit"
  L6_373 = A0_367
  L7_374 = A1_368
  L4_371 = L4_371(L5_372, L6_373, L7_374)
  if L4_371 == nil then
    L3_370 = false
    L5_372 = GetParam
    L6_373 = "OnUnitByFlag"
    L7_374 = A0_367
    L5_372 = L5_372(L6_373, L7_374, A1_368)
    L4_371 = L5_372
  end
  if L4_371 == nil then
    L5_372 = ReportError
    L6_373 = "Could not resolve OnUnit param"
    L5_372(L6_373)
    return
  end
  L5_372 = true
  L6_373 = GetParam
  L7_374 = "ChampionToSayTo"
  L6_373 = L6_373(L7_374, A0_367, A1_368)
  if L6_373 == nil then
    L5_372 = false
    L7_374 = GetParam
    L7_374 = L7_374("ChampionToSayToByFlag", A0_367, A1_368)
    L6_373 = L7_374
  end
  if L6_373 == nil then
    L7_374 = ReportError
    L7_374("Could not resolve ChampionToSayTo param")
    return
  end
  L7_374 = GetParam
  L7_374 = L7_374("ShowToSpectator", A0_367, A1_368)
  if L7_374 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  SayWithFloatingTextOnUnitToChampion(tostring(L2_369), A1_368.TextType, L4_371, L3_370, L6_373, L5_372, L7_374)
end
BBSayWithFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_375, A1_376)
  local L2_377, L3_378, L4_379
  L2_377 = A1_376.ToSay
  L3_378 = GetTable
  L4_379 = A0_375
  L3_378 = L3_378(L4_379, A1_376.SrcVarTable, false)
  if L3_378 ~= nil then
    L4_379 = A1_376.SrcVar
    if L4_379 ~= nil then
      L4_379 = L2_377
      L2_377 = L4_379 .. tostring(L3_378[A1_376.SrcVar])
    end
  end
  L4_379 = nil
  if A1_376.OwnerVar ~= nil then
    L4_379 = A0_375[A1_376.OwnerVar]
  else
    L4_379 = A0_375.Owner
  end
  if A1_376.TextType == nil then
    A1_376.TextType = 0
  end
  Say(L4_379, L2_377, A1_376.TextType)
end
BBSay = L0_0
function L0_0(A0_380, A1_381)
  local L2_382, L3_383, L4_384
  L2_382 = A1_381.ToSay
  L3_383 = GetTable
  L4_384 = A0_380
  L3_383 = L3_383(L4_384, A1_381.SrcVarTable, false)
  if L3_383 ~= nil then
    L4_384 = A1_381.SrcVar
    if L4_384 ~= nil then
      L4_384 = L2_382
      L2_382 = L4_384 .. tostring(L3_383[A1_381.SrcVar])
    end
  end
  L4_384 = nil
  if A1_381.OwnerVar ~= nil then
    L4_384 = A0_380[A1_381.OwnerVar]
  else
    L4_384 = A0_380.Owner
  end
  if A1_381.TextType == nil then
    A1_381.TextType = 0
  end
  Say(L4_384, L2_382, A1_381.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_385, A1_386)
  GetTable(A0_385, A1_386.DestVarTable, true)[A1_386.DestVar] = BBLuaGetGold(A0_385, A1_386)
end
BBGetGold = L0_0
function L0_0(A0_387, A1_388)
  GetTable(A0_387, A1_388.DestVarTable, true)[A1_388.DestVar] = BBLuaGetTotalGold(A0_387, A1_388)
end
BBGetTotalGold = L0_0
function L0_0(A0_389, A1_390)
  SpellBuffAdd(A0_389[A1_390.OwnerVar], A0_389[A1_390.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_389.NextBuffVars)
  BBTeleportToPositionHelper(A0_389, A1_390)
end
BBTeleportToPosition = L0_0
function L0_0(A0_391, A1_392)
  if A1_392.XVar ~= nil and GetTable(A0_391, A1_392.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_391, A1_392.XVarTable, true)[A1_392.XVar]
  else
    Xloc = A1_392.X
  end
  if A1_392.YVar ~= nil and GetTable(A0_391, A1_392.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_391, A1_392.YVarTable, true)[A1_392.YVar]
  else
    Yloc = A1_392.Y
  end
  if A1_392.ZVar ~= nil and GetTable(A0_391, A1_392.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_391, A1_392.ZVarTable, true)[A1_392.ZVar]
  else
    Zloc = A1_392.Z
  end
  A1_392.OwnerVar, A0_391.position = A1_392.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_392.CastPositionName = "position"
  BBTeleportToPosition(A0_391, A1_392)
end
BBTeleportToPoint = L0_0
function L0_0(A0_393, A1_394)
  DefUpdateAura(GetTable(A0_393, A1_394.CenterTable, false)[A1_394.CenterVar], A1_394.Range, A1_394.UnitScan, A1_394.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_395, A1_396)
  ReincarnateNonDeadHero(GetTable(A0_395, A1_396.TargetTable, false)[A1_396.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_397, A1_398)
  GetTable(A0_397, A1_398.DestVarTable, true)[A1_398.DestVar] = A1_398.Function(A0_397[A1_398.OwnerVar], A1_398.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_399, A1_400)
  local L2_401, L3_402, L4_403, L5_404
  L2_401 = A1_400.WhomToOrderVar
  L2_401 = A0_399[L2_401]
  L3_402 = A1_400.TargetOfOrderVar
  L3_402 = A0_399[L3_402]
  L4_403 = GetTable
  L5_404 = A0_399
  L4_403 = L4_403(L5_404, A1_400.SrcVarTable, false)
  L5_404 = nil
  if A1_400.SrcVar ~= nil and L4_403 ~= nil then
    L5_404 = L4_403[A1_400.SrcVar]
  else
    L5_404 = GetPosition(L3_402)
  end
  if L3_402 == nil then
    L3_402 = L2_401
  end
  IssueOrder(L2_401, A1_400.Order, L5_404, L3_402)
end
BBIssueOrder = L0_0
function L0_0(A0_405, A1_406)
  local L2_407
  L2_407 = GetParam
  L2_407 = L2_407("NewRange", A0_405, A1_406)
  SetSpellCastRange(L2_407)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_408, A1_409)
  GetTable(A0_408, A1_409.DestVarTable, true)[A1_409.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_410, A1_411)
  local L2_412, L3_413
  L2_412 = A1_411.ObjectVar1
  L2_412 = A0_410[L2_412]
  L3_413 = A1_411.ObjectVar2
  L3_413 = A0_410[L3_413]
  GetTable(A0_410, A1_411.DestVarTable, true)[A1_411.DestVar] = DistanceBetweenObjectBounds(L2_412, L3_413)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_414, A1_415)
  local L2_416, L3_417, L4_418
  L2_416 = A1_415.ObjectVar
  L2_416 = A0_414[L2_416]
  L3_417 = GetTable
  L4_418 = A0_414
  L3_417 = L3_417(L4_418, A1_415.PointVarTable, true)
  L4_418 = A1_415.PointVar
  L4_418 = L3_417[L4_418]
  GetTable(A0_414, A1_415.DestVarTable, true)[A1_415.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_416, L4_418)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_419, A1_420)
  local L2_421, L3_422
  L2_421 = GetParam
  L3_422 = "Point1"
  L2_421 = L2_421(L3_422, A0_419, A1_420)
  L3_422 = GetParam
  L3_422 = L3_422("Point2", A0_419, A1_420)
  GetTable(A0_419, A1_420.DestVarTable, true)[A1_420.DestVar] = DistanceBetweenPoints(L2_421, L3_422)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_423, A1_424, A2_425)
  local L3_426, L4_427, L5_428, L6_429, L7_430, L8_431
  L5_428 = 0
  L6_429 = nil
  L7_430 = A1_424.ObjectDistanceType
  L8_431 = A1_424.ObjectVar1
  L3_426 = A0_423[L8_431]
  L8_431 = A1_424.ObjectVar2
  L4_427 = A0_423[L8_431]
  if nil == L4_427 then
    L8_431 = A1_424.Point2Var
    if nil ~= L8_431 then
      L8_431 = GetTable
      L8_431 = L8_431(A0_423, A1_424.Point2VarTable, true)
      L4_427 = L8_431[A1_424.Point2Var]
      L5_428 = L5_428 + 1
    end
  end
  if nil == L3_426 then
    L8_431 = A1_424.Point1Var
    if nil ~= L8_431 then
      L8_431 = GetTable
      L8_431 = L8_431(A0_423, A1_424.Point1VarTable, true)
      L3_426 = L8_431[A1_424.Point1Var]
      L5_428 = L5_428 + 1
      if 1 == L5_428 then
        L3_426, L4_427 = L4_427, L3_426
      end
    end
  end
  if nil ~= L7_430 then
    if 0 == L5_428 then
      L8_431 = OBJECT_CENTER
      if L8_431 == L7_430 then
        L6_429 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_431 = OBJECT_BOUNDARY
        if L8_431 == L7_430 then
          L6_429 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_431 = A1_424.OwnerVar
          L8_431 = A0_423[L8_431]
          Say(L8_431, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_428 then
      L8_431 = OBJECT_CENTER
      if L8_431 == L7_430 then
        L6_429 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_431 = OBJECT_BOUNDARY
        if L8_431 == L7_430 then
          L6_429 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_431 = A1_424.OwnerVar
          L8_431 = A0_423[L8_431]
          Say(L8_431, "invalid object distance type", 0)
        end
      end
    else
      L6_429 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_431 = A1_424.Distance
  if A1_424.DistanceVar ~= nil and GetTable(A0_423, A1_424.DistanceVarTable, true) ~= nil then
    L8_431 = L8_431 + GetTable(A0_423, A1_424.DistanceVarTable, true)[A1_424.DistanceVar]
  end
  if L3_426 ~= nil and L4_427 ~= nil and L6_429 ~= nil and L8_431 ~= nil then
    if not L6_429(L3_426, L4_427, L8_431) then
      ExecuteBuildingBlocks(A2_425, A0_423)
      A0_423.LastIfSucceeded = true
    else
      A0_423.LastIfSucceeded = false
    end
  else
    A0_423.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_432, A1_433)
  local L2_434, L3_435
  L2_434 = A1_433.TargetVar
  L2_434 = A0_432[L2_434]
  L3_435 = A1_433.CasterVar
  L3_435 = A0_432[L3_435]
  GetTable(A0_432, A1_433.DestVarTable, true)[A1_433.DestVar] = SpellBuffCount(L2_434, A1_433.BuffName, L3_435)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_436, A1_437)
  local L2_438
  L2_438 = A1_437.TargetVar
  L2_438 = A0_436[L2_438]
  GetTable(A0_436, A1_437.DestVarTable, true)[A1_437.DestVar] = SpellBuffCount(L2_438, A1_437.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_439, A1_440)
  local L2_441, L3_442
  L2_441 = GetTable
  L3_442 = A0_439
  L2_441 = L2_441(L3_442, A1_440.ScaleVarTable, false)
  L3_442 = nil
  if A1_440.OwnerVar ~= nil then
    L3_442 = A0_439[A1_440.OwnerVar]
  else
    L3_442 = A0_439.Owner
  end
  if A1_440.ScaleVar ~= nil and A1_440.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_441[A1_440.ScaleVar], L3_442)
  else
    SetScaleSkinCoef(A1_440.Scale, L3_442)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_443, A1_444)
  SpellBuffAdd(A0_443[A1_444.TargetVar], A0_443[A1_444.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_443.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_445, A1_446, A2_447)
  local L3_448, L4_449
  L3_448 = A1_446.TargetVar
  L3_448 = A0_445[L3_448]
  L4_449 = A1_446.NumStacks
  if GetParam("NumStacks", A0_445, A1_446) == 0 then
    L4_449 = SpellBuffCount(L3_448, A1_446.BuffName, caster)
  else
    L4_449 = GetParam("NumStacks", A0_445, A1_446)
  end
  while L4_449 > 0 do
    SpellBuffRemove(L3_448, A1_446.BuffName, A0_445[A1_446.AttackerVar])
    L4_449 = L4_449 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_450, A1_451, A2_452)
  if A0_450.EmoteId == A1_451.EmoteId then
    ExecuteBuildingBlocks(A2_452, A0_450)
    A0_450.LastIfSucceeded = true
  else
    A0_450.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_453, A1_454, A2_455)
  if A0_453.EmoteId ~= A1_454.EmoteId then
    ExecuteBuildingBlocks(A2_455, A0_453)
    A0_453.LastIfSucceeded = true
  else
    A0_453.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_456, A1_457)
  local L2_458, L3_459, L4_460, L5_461
  L2_458 = GetTable
  L3_459 = A0_456
  L4_460 = A1_457.String1VarTable
  L5_461 = false
  L2_458 = L2_458(L3_459, L4_460, L5_461)
  L3_459 = A1_457.String1Var
  L3_459 = L2_458[L3_459]
  L4_460 = GetTable
  L5_461 = A0_456
  L4_460 = L4_460(L5_461, A1_457.String2VarTable, false)
  L5_461 = A1_457.String2Var
  L5_461 = L4_460[L5_461]
  GetTable(A0_456, A1_457.ResultVarTable, false)[A1_457.ResultVar] = L3_459 .. L5_461
end
BBConcatenateStrings = L0_0
function L0_0(A0_462, A1_463)
  BBGetMinionKills(A0_462, A1_463)
  A0_462.MinionKillSource = GetParam("MinionKillTarget")
  A0_462.MinionKills = A0_462.MinionsKilled + GetParam("MinionKills", A0_462, A1_463)
  BBSetMinionKills(A0_462, A1_463)
end
BBIncreaseMinionKills = L0_0
