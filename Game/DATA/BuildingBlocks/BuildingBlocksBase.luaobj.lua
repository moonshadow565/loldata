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
function L0_0(A0_196, A1_197, A2_198)
  if BBIsMissileConsideredAsAutoAttack(A0_196, A1_197) then
    ExecuteBuildingBlocks(A2_198, A0_196)
    A0_196.LastIfSucceeded = true
  else
    A0_196.LastIfSucceeded = false
  end
end
BBIfMissileConsideredAsAutoAttack = L0_0
function L0_0(A0_199, A1_200)
  A0_199.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_201, A1_202, A2_203)
  local L3_204, L4_205
  if A1_202.OwnerVar ~= nil then
    L3_204 = A0_201[A1_202.OwnerVar]
  else
    L3_204 = A0_201.Owner
  end
  if A1_202.CasterVar ~= nil then
    L4_205 = A0_201[A1_202.CasterVar]
  else
    L4_205 = A0_201.Caster
  end
  if SpellBuffCount(L3_204, A1_202.BuffName, L4_205) <= 0 then
    ExecuteBuildingBlocks(A2_203, A0_201)
    A0_201.LastIfSucceeded = true
  else
    A0_201.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_206, A1_207, A2_208)
  local L3_209, L4_210
  if A1_207.OwnerVar ~= nil then
    L3_209 = A0_206[A1_207.OwnerVar]
  else
    L3_209 = A0_206.Owner
  end
  if HasPARType(L3_209, A1_207.PARType) then
    ExecuteBuildingBlocks(A2_208, A0_206)
    A0_206.LastIfSucceeded = true
  else
    A0_206.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_211, A1_212, A2_213)
  local L3_214, L4_215
  if A1_212.OwnerVar ~= nil then
    L3_214 = A0_211[A1_212.OwnerVar]
  else
    L3_214 = A0_211.Owner
  end
  if not HasPARType(L3_214, A1_212.PARType) then
    ExecuteBuildingBlocks(A2_213, A0_211)
    A0_211.LastIfSucceeded = true
  else
    A0_211.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_216, A1_217, A2_218)
  local L3_219, L4_220, L5_221, L6_222, L7_223
  L3_219 = GetTable
  L4_220 = A0_216
  L5_221 = A1_217.Src1VarTable
  L6_222 = false
  L3_219 = L3_219(L4_220, L5_221, L6_222)
  L4_220 = GetTable
  L5_221 = A0_216
  L6_222 = A1_217.Src2VarTable
  L7_223 = false
  L4_220 = L4_220(L5_221, L6_222, L7_223)
  L5_221 = true
  while L5_221 do
    L6_222 = false
    L7_223 = nil
    if L3_219 ~= nil and A1_217.Src1Var ~= nil then
      L7_223 = L3_219[A1_217.Src1Var]
    else
      L7_223 = A1_217.Value1
    end
    if L4_220 ~= nil and A1_217.Src2Var ~= nil then
      L6_222 = A1_217.CompareOp(L7_223, L4_220[A1_217.Src2Var])
    else
      L6_222 = A1_217.CompareOp(L7_223, A1_217.Value2)
    end
    if L6_222 then
      ExecuteBuildingBlocks(A2_218, A0_216)
    else
      L5_221 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_224, A1_225)
  return A0_224 * A1_225
end
MO_MULTIPLY = L0_0
function L0_0(A0_226, A1_227)
  return A0_226 + A1_227
end
MO_ADD = L0_0
function L0_0(A0_228, A1_229)
  return A0_228 - A1_229
end
MO_SUBTRACT = L0_0
function L0_0(A0_230, A1_231)
  return A0_230 / A1_231
end
MO_DIVIDE = L0_0
function L0_0(A0_232, A1_233)
  if A0_232 < A1_233 then
    return A0_232
  else
    return A1_233
  end
end
MO_MIN = L0_0
function L0_0(A0_234, A1_235)
  if A1_235 < A0_234 then
    return A0_234
  else
    return A1_235
  end
end
MO_MAX = L0_0
function L0_0(A0_236, A1_237)
  return A0_236 % A1_237
end
MO_MODULO = L0_0
function L0_0(A0_238)
  return math.floor(A0_238 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_239)
  return math.ceil(A0_239)
end
MO_ROUNDUP = L0_0
function L0_0(A0_240)
  return math.floor(A0_240)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_241)
  return math.sin(math.rad(A0_241))
end
MO_SIN = L0_0
function L0_0(A0_242)
  return math.cos(math.rad(A0_242))
end
MO_COSINE = L0_0
function L0_0(A0_243)
  return math.tan(math.rad(A0_243))
end
MO_TANGENT = L0_0
function L0_0(A0_244)
  return math.deg(math.asin(A0_244))
end
MO_ASIN = L0_0
function L0_0(A0_245)
  return math.deg(math.acos(A0_245))
end
MO_ACOS = L0_0
function L0_0(A0_246)
  return math.deg(math.atan(A0_246))
end
MO_ATAN = L0_0
function L0_0(A0_247, A1_248)
  return math.pow(A0_247, A1_248)
end
MO_POW = L0_0
function L0_0(A0_249)
  return math.sqrt(A0_249)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_250, A1_251)
  local L2_252
  L2_252 = A0_250 and A1_251
  return L2_252
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_253, A1_254)
  local L2_255
  L2_255 = A0_253 or A1_254
  return L2_255
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_256)
  local L1_257
  L1_257 = not A0_256
  return L1_257
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_258)
  return math.abs(A0_258)
end
MO_ABS = L0_0
function L0_0(A0_259, A1_260)
  return math.random(A0_259, A1_260)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_261, A1_262)
  local L2_263, L3_264, L4_265, L5_266
  L2_263 = GetMathNumber
  L3_264 = A0_261
  L4_265 = A1_262.Src1VarTable
  L5_266 = A1_262.Src1Var
  L2_263 = L2_263(L3_264, L4_265, L5_266, A1_262.Src1Value)
  L3_264 = GetMathNumber
  L4_265 = A0_261
  L5_266 = A1_262.Src2VarTable
  L3_264 = L3_264(L4_265, L5_266, A1_262.Src2Var, A1_262.Src2Value)
  L4_265 = GetTable
  L5_266 = A0_261
  L4_265 = L4_265(L5_266, A1_262.DestVarTable)
  L5_266 = A1_262.MathOp
  L5_266 = L5_266(L2_263, L3_264)
  SetVarInTable(A0_261, A1_262, L5_266)
end
BBMath = L0_0
function L0_0(A0_267, A1_268, A2_269, A3_270)
  if A2_269 ~= nil and GetTable(A0_267, A1_268)[A2_269] ~= nil then
    return GetTable(A0_267, A1_268)[A2_269]
  end
  return A3_270
end
GetMathNumber = L0_0
function L0_0(A0_271, A1_272)
  if type(A1_272) == "number" then
    return A1_272
  elseif type(A1_272) == "function" then
    return A1_272(A0_271)
  elseif type(A1_272) == "string" then
    return A0_271[A1_272]
  end
end
GetNumber = L0_0
function L0_0(A0_273, A1_274)
  return VectorAdd(A0_273, A1_274)
end
VEC_ADD = L0_0
function L0_0(A0_275, A1_276)
  return VectorSubtract(A0_275, A1_276)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_277, A1_278)
  return VectorScalarMultiply(A0_277, A1_278)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_279, A1_280)
  return VectorScalarDivide(A0_279, A1_280)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_281, A1_282)
  return VectorRotateY(A0_281, A1_282)
end
VEC_ROTATE = L0_0
function L0_0(A0_283, A1_284)
  BBMath(A0_283, A1_284)
end
BBVectorMath = L0_0
function L0_0(A0_285, A1_286)
  local L2_287, L3_288, L4_289, L5_290
  L2_287 = A0_285.InstanceVars
  L3_288 = L2_287.InterpDelta
  if L3_288 == nil then
    L3_288 = A1_286.Amount
    L4_289 = A1_286.AmountVar
    if L4_289 ~= nil then
      L4_289 = GetTable
      L5_290 = A0_285
      L4_289 = L4_289(L5_290, A1_286.AmountVarTable)
      L5_290 = A1_286.AmountVar
      L3_288 = L4_289[L5_290]
    end
    L4_289 = GetPosition
    L5_290 = A1_286.TargetVar
    L5_290 = A0_285[L5_290]
    L4_289 = L4_289(L5_290)
    L2_287.KnockBackStart = L4_289
    L4_289 = GetNormalizedPositionDelta
    L5_290 = A1_286.TargetVar
    L5_290 = A0_285[L5_290]
    L4_289 = L4_289(L5_290, A0_285[A1_286.AttackerVar], true)
    L5_290 = {}
    L5_290.x = L4_289.x * L3_288
    L5_290.y = 0
    L5_290.z = L4_289.z * L3_288
    L2_287.InterpDelta = L5_290
    L5_290 = GetTime
    L5_290 = L5_290()
    L2_287.StartTime = L5_290
    L5_290 = A1_286.KnockBackDuration
    L2_287.KnockBackDuration = L5_290
  end
  L3_288 = A1_286.TargetVar
  L3_288 = A0_285[L3_288]
  L4_289 = GetTime
  L4_289 = L4_289()
  L5_290 = L2_287.StartTime
  L4_289 = L4_289 - L5_290
  L5_290 = L2_287.KnockBackDuration
  L4_289 = L4_289 / L5_290
  L5_290 = {}
  L5_290.x = L2_287.KnockBackStart.x + L2_287.InterpDelta.x * L4_289
  L5_290.y = L2_287.KnockBackStart.y
  L5_290.z = L2_287.KnockBackStart.z + L2_287.InterpDelta.z * L4_289
  SetPosition(L3_288, L5_290)
end
BBKnockback = L0_0
function L0_0(A0_291, A1_292)
  local L2_293, L3_294
  L2_293 = GetParam
  L3_294 = "Left"
  L2_293 = L2_293(L3_294, A0_291, A1_292)
  L3_294 = GetParam
  L3_294 = L3_294("Right", A0_291, A1_292)
  GetTable(A0_291, A1_292.DestVarTable, true)[A1_292.DestVar] = tostring(L2_293) .. tostring(L3_294)
end
BBAppendString = L0_0
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
BBIncStat = L0_0
function L0_0(A0_298, A1_299)
  local L2_300
  L2_300 = 0
  if A1_299.Delta ~= nil then
    L2_300 = L2_300 + A1_299.Delta
  end
  if A1_299.DeltaByLevel ~= nil and A0_298.Level ~= nil then
    L2_300 = L2_300 + A1_299.DeltaByLevel[A0_298.Level]
  end
  if A1_299.DeltaVar ~= nil then
    L2_300 = L2_300 + GetTable(A0_298, A1_299.DeltaVarTable, true)[A1_299.DeltaVar]
  end
  if A1_299.TargetVar ~= nil then
    A1_299.Stat(L2_300, A0_298[A1_299.TargetVar])
  else
    A1_299.Stat(L2_300)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_301, A1_302)
  if A1_302.AttackVar ~= nil then
  end
  if A1_302.Attack ~= nil then
  end
  if A1_302.TotalCoefficientVar ~= nil then
  end
  if A1_302.TotalCoefficient ~= nil then
  end
  if A1_302.TargetVar ~= nil then
    GetTable(A0_301, A1_302.DestVarTable, false)[A1_302.DestVar] = (0 + GetTable(A0_301, A1_302.AttackVarTable, true)[A1_302.AttackVar] + A1_302.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_301[A1_302.TargetVar])) + GetFlatCritDamageMod(A0_301[A1_302.TargetVar])) * (0 + GetTable(A0_301, A1_302.TotalCoefficientVarTable, true)[A1_302.TotalCoefficientVar] + A1_302.TotalCoefficient)
  else
    GetTable(A0_301, A1_302.DestVarTable, false)[A1_302.DestVar] = 2 * A1_302.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_303, A1_304)
  local L2_305, L3_306, L4_307, L5_308, L6_309, L7_310
  L2_305 = GetTable
  L3_306 = A0_303
  L4_307 = A1_304.DestVarTable
  L5_308 = false
  L2_305 = L2_305(L3_306, L4_307, L5_308)
  L3_306 = GetTable
  L4_307 = A0_303
  L5_308 = A1_304.AmountVarTable
  L6_309 = true
  L3_306 = L3_306(L4_307, L5_308, L6_309)
  L4_307 = GetTable
  L5_308 = A0_303
  L6_309 = A0_303.NextBuffVars
  L7_310 = false
  L4_307 = L4_307(L5_308, L6_309, L7_310)
  L5_308 = A1_304.AmountVar
  L5_308 = L3_306[L5_308]
  L6_309 = A1_304.Amount
  L5_308 = L5_308 + L6_309
  L4_307.InitializeShield_Amount = L5_308
  L5_308 = A1_304.AmountVar
  if L5_308 ~= nil then
    L5_308 = A1_304.HealShieldMod
    if L5_308 ~= nil and L5_308 == true then
      L6_309 = A1_304.AttackerVar
      L7_310 = 0
      if L6_309 ~= nil then
        L7_310 = GetPercentHealingAmountMod(A0_303[L6_309])
      end
      L4_307.InitializeShield_Amount, L3_306[A1_304.AmountVar] = (A1_304.Amount + L3_306[A1_304.AmountVar]) * (1 + L7_310), (A1_304.Amount + L3_306[A1_304.AmountVar]) * (1 + L7_310)
    end
  end
  L5_308 = SpellBuffAddNoRenew
  L6_309 = A1_304.AttackerVar
  L6_309 = A0_303[L6_309]
  L7_310 = A1_304.UnitVar
  L7_310 = A0_303[L7_310]
  L5_308(L6_309, L7_310, "InitializeShieldMarker", 0, 1, 25000, L4_307)
  L5_308 = BBIncreaseShield
  L6_309 = A0_303
  L7_310 = A1_304
  L5_308(L6_309, L7_310)
end
BBInitializeShield = L0_0
function L0_0(A0_311, A1_312)
  if A1_312.CDVar ~= nil then
  end
  if A1_312.CD ~= nil then
  end
  if A1_312.TargetVar ~= nil then
    GetTable(A0_311, A1_312.DestVarTable, false)[A1_312.DestVar] = (0 + GetTable(A0_311, A1_312.CDVarTable, true)[A1_312.CDVar] + A1_312.CD) * (1 + GetPercentCooldownMod(A0_311[A1_312.TargetVar]))
  else
    GetTable(A0_311, A1_312.DestVarTable, false)[A1_312.DestVar] = A1_312.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_313, A1_314)
  local L2_315, L3_316
  L3_316 = A1_314.TargetVar
  if L3_316 ~= nil then
    L2_315 = A1_314.Stat(A0_313[L3_316])
  else
    L2_315 = A1_314.Stat()
  end
  SetVarInTable(A0_313, A1_314, L2_315)
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
  local L2_327, L3_328
  L3_328 = A1_326.TargetVar
  if L3_328 ~= nil then
    L2_327 = GetTeamID(A0_325[L3_328])
  else
    L2_327 = GetTeamID()
  end
  SetVarInTable(A0_325, A1_326, L2_327)
end
BBGetTeamID = L0_0
function L0_0(A0_329, A1_330)
  local L2_331, L3_332, L4_333
  L2_331 = GetTable
  L3_332 = A0_329
  L4_333 = A1_330.DestVarTable
  L2_331 = L2_331(L3_332, L4_333, false)
  L3_332 = A1_330.TargetVar
  L4_333 = nil
  if L3_332 ~= nil then
    L4_333 = GetTeamID(A0_329[L3_332])
  else
    L4_333 = GetTeamID()
  end
  if L4_333 == TEAM_ORDER then
    L2_331[A1_330.DestVar] = TEAM_CHAOS
  elseif L4_333 == TEAM_CHAOS then
    L2_331[A1_330.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_334, A1_335)
  if A1_335.TargetVar ~= nil then
    GetTable(A0_334, A1_335.DestVarTable, false)[A1_335.DestVar] = GetUnitSkinName(A0_334[A1_335.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_336, A1_337)
  local L2_338, L3_339, L4_340
  L2_338 = GetTable
  L3_339 = A0_336
  L4_340 = A1_337.DestVarTable
  L2_338 = L2_338(L3_339, L4_340, false)
  L3_339 = A0_336.Owner
  L4_340 = nil
  if A1_337.TargetVar ~= nil then
    L4_340 = GetTotalAttackDamage(A0_336[A1_337.TargetVar])
  else
    L4_340 = GetTotalAttackDamage()
  end
  SetVarInTable(A0_336, A1_337, L4_340)
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_341, A1_342)
  GetTable(A0_341, A1_342.DestVarTable, true)[A1_342.DestVar] = A1_342.Status(A0_341[A1_342.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_343, A1_344)
  local L2_345
  L2_345 = A1_344.TargetVar
  L2_345 = A0_343[L2_345]
  ClearAttackTarget(L2_345)
end
BBClearAttackTarget = L0_0
function L0_0(A0_346, A1_347)
  local L2_348, L3_349
  L2_348 = GetTable
  L3_349 = A0_346
  L2_348 = L2_348(L3_349, A1_347.DestVarTable, true)
  L3_349 = A1_347.Info
  L3_349 = L3_349(A0_346[A1_347.TargetVar])
  SetVarInTable(A0_346, A1_347, L3_349)
end
BBGetCastInfo = L0_0
function L0_0(A0_350, A1_351, A2_352)
  local L3_353, L4_354, L5_355, L6_356
  L3_353 = GetTable
  L4_354 = A0_350
  L5_355 = A1_351.TrackTimeVarTable
  L6_356 = false
  L3_353 = L3_353(L4_354, L5_355, L6_356)
  L4_354 = GetTime
  L4_354 = L4_354()
  L5_355 = A1_351.ExecuteImmediately
  L6_356 = GetParam
  L6_356 = L6_356("TimeBetweenExecutions", A0_350, A1_351)
  if A1_351.TickTimeVar ~= nil and GetTable(A0_350, A1_351.TickTimeVarTable, false)[A1_351.TickTimeVar] ~= nil then
    L6_356 = GetTable(A0_350, A1_351.TickTimeVarTable, false)[A1_351.TickTimeVar]
  end
  if L3_353[A1_351.TrackTimeVar] == nil then
    L3_353[A1_351.TrackTimeVar] = L4_354
    if L5_355 == true then
      ExecuteBuildingBlocks(A2_352, A0_350)
    end
  end
  if L4_354 >= L3_353[A1_351.TrackTimeVar] + L6_356 then
    L3_353[A1_351.TrackTimeVar] = L3_353[A1_351.TrackTimeVar] + L6_356
    ExecuteBuildingBlocks(A2_352, A0_350)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_357, A1_358, A2_359)
  GetTable(A0_357, A1_358.TrackTimeVarTable, false)[A1_358.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_360, A1_361)
  local L2_362
  L2_362 = A1_361.SrcValue
  if A1_361.SrcVar ~= nil then
    L2_362 = GetTable(A0_360, A1_361.SrcVarTable, true)[A1_361.SrcVar]
  end
  A1_361.Status(A0_360[A1_361.TargetVar], L2_362)
end
BBSetStatus = L0_0
function L0_0(A0_363, A1_364)
  local L2_365
  L2_365 = A1_364.ToAlert
  if GetTable(A0_363, A1_364.SrcVarTable, false) ~= nil and A1_364.SrcVar ~= nil then
    L2_365 = L2_365 .. GetTable(A0_363, A1_364.SrcVarTable, false)[A1_364.SrcVar]
  end
  _ALERT(L2_365)
end
BBAlert = L0_0
function L0_0(A0_366, A1_367)
  local L2_368, L3_369, L4_370, L5_371, L6_372, L7_373
  L2_368 = GetParam
  L3_369 = "Message"
  L4_370 = A0_366
  L5_371 = A1_367
  L2_368 = L2_368(L3_369, L4_370, L5_371)
  if L2_368 == nil then
    L3_369 = ReportError
    L4_370 = "Could not resolve Message param"
    L3_369(L4_370)
    return
  end
  L3_369 = true
  L4_370 = GetParam
  L5_371 = "OnUnit"
  L6_372 = A0_366
  L7_373 = A1_367
  L4_370 = L4_370(L5_371, L6_372, L7_373)
  if L4_370 == nil then
    L3_369 = false
    L5_371 = GetParam
    L6_372 = "OnUnitByFlag"
    L7_373 = A0_366
    L5_371 = L5_371(L6_372, L7_373, A1_367)
    L4_370 = L5_371
  end
  if L4_370 == nil then
    L5_371 = ReportError
    L6_372 = "Could not resolve OnUnit param"
    L5_371(L6_372)
    return
  end
  L5_371 = true
  L6_372 = GetParam
  L7_373 = "ChampionToSayTo"
  L6_372 = L6_372(L7_373, A0_366, A1_367)
  if L6_372 == nil then
    L5_371 = false
    L7_373 = GetParam
    L7_373 = L7_373("ChampionToSayToByFlag", A0_366, A1_367)
    L6_372 = L7_373
  end
  if L6_372 == nil then
    L7_373 = ReportError
    L7_373("Could not resolve ChampionToSayTo param")
    return
  end
  L7_373 = GetParam
  L7_373 = L7_373("ShowToSpectator", A0_366, A1_367)
  if L7_373 == nil then
    ReportError("Could not resolve ShowToSpectator param")
    return
  end
  SayWithFloatingTextOnUnitToChampion(tostring(L2_368), A1_367.TextType, L4_370, L3_369, L6_372, L5_371, L7_373)
end
BBSayWithFloatingTextOnUnitToChampion = L0_0
function L0_0(A0_374, A1_375)
  local L2_376, L3_377, L4_378
  L2_376 = A1_375.ToSay
  L3_377 = GetTable
  L4_378 = A0_374
  L3_377 = L3_377(L4_378, A1_375.SrcVarTable, false)
  if L3_377 ~= nil then
    L4_378 = A1_375.SrcVar
    if L4_378 ~= nil then
      L4_378 = L2_376
      L2_376 = L4_378 .. tostring(L3_377[A1_375.SrcVar])
    end
  end
  L4_378 = nil
  if A1_375.OwnerVar ~= nil then
    L4_378 = A0_374[A1_375.OwnerVar]
  else
    L4_378 = A0_374.Owner
  end
  if A1_375.TextType == nil then
    A1_375.TextType = 0
  end
  Say(L4_378, L2_376, A1_375.TextType)
end
BBSay = L0_0
function L0_0(A0_379, A1_380)
  local L2_381, L3_382, L4_383
  L2_381 = A1_380.ToSay
  L3_382 = GetTable
  L4_383 = A0_379
  L3_382 = L3_382(L4_383, A1_380.SrcVarTable, false)
  if L3_382 ~= nil then
    L4_383 = A1_380.SrcVar
    if L4_383 ~= nil then
      L4_383 = L2_381
      L2_381 = L4_383 .. tostring(L3_382[A1_380.SrcVar])
    end
  end
  L4_383 = nil
  if A1_380.OwnerVar ~= nil then
    L4_383 = A0_379[A1_380.OwnerVar]
  else
    L4_383 = A0_379.Owner
  end
  if A1_380.TextType == nil then
    A1_380.TextType = 0
  end
  Say(L4_383, L2_381, A1_380.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_384, A1_385)
  GetTable(A0_384, A1_385.DestVarTable, true)[A1_385.DestVar] = BBLuaGetGold(A0_384, A1_385)
end
BBGetGold = L0_0
function L0_0(A0_386, A1_387)
  GetTable(A0_386, A1_387.DestVarTable, true)[A1_387.DestVar] = BBLuaGetTotalGold(A0_386, A1_387)
end
BBGetTotalGold = L0_0
function L0_0(A0_388, A1_389)
  SpellBuffAdd(A0_388[A1_389.OwnerVar], A0_388[A1_389.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_388.NextBuffVars)
  BBTeleportToPositionHelper(A0_388, A1_389)
end
BBTeleportToPosition = L0_0
function L0_0(A0_390, A1_391)
  if A1_391.XVar ~= nil and GetTable(A0_390, A1_391.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_390, A1_391.XVarTable, true)[A1_391.XVar]
  else
    Xloc = A1_391.X
  end
  if A1_391.YVar ~= nil and GetTable(A0_390, A1_391.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_390, A1_391.YVarTable, true)[A1_391.YVar]
  else
    Yloc = A1_391.Y
  end
  if A1_391.ZVar ~= nil and GetTable(A0_390, A1_391.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_390, A1_391.ZVarTable, true)[A1_391.ZVar]
  else
    Zloc = A1_391.Z
  end
  A1_391.OwnerVar, A0_390.position = A1_391.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_391.CastPositionName = "position"
  BBTeleportToPosition(A0_390, A1_391)
end
BBTeleportToPoint = L0_0
function L0_0(A0_392, A1_393)
  DefUpdateAura(GetTable(A0_392, A1_393.CenterTable, false)[A1_393.CenterVar], A1_393.Range, A1_393.UnitScan, A1_393.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_394, A1_395)
  ReincarnateNonDeadHero(GetTable(A0_394, A1_395.TargetTable, false)[A1_395.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_396, A1_397)
  GetTable(A0_396, A1_397.DestVarTable, true)[A1_397.DestVar] = A1_397.Function(A0_396[A1_397.OwnerVar], A1_397.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_398, A1_399)
  local L2_400, L3_401, L4_402, L5_403
  L2_400 = A1_399.WhomToOrderVar
  L2_400 = A0_398[L2_400]
  L3_401 = A1_399.TargetOfOrderVar
  L3_401 = A0_398[L3_401]
  L4_402 = GetTable
  L5_403 = A0_398
  L4_402 = L4_402(L5_403, A1_399.SrcVarTable, false)
  L5_403 = nil
  if A1_399.SrcVar ~= nil and L4_402 ~= nil then
    L5_403 = L4_402[A1_399.SrcVar]
  else
    L5_403 = GetPosition(L3_401)
  end
  if L3_401 == nil then
    L3_401 = L2_400
  end
  IssueOrder(L2_400, A1_399.Order, L5_403, L3_401)
end
BBIssueOrder = L0_0
function L0_0(A0_404, A1_405)
  local L2_406
  L2_406 = GetParam
  L2_406 = L2_406("NewRange", A0_404, A1_405)
  SetSpellCastRange(L2_406)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_407, A1_408)
  GetTable(A0_407, A1_408.DestVarTable, true)[A1_408.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_409, A1_410)
  local L2_411, L3_412
  L2_411 = A1_410.ObjectVar1
  L2_411 = A0_409[L2_411]
  L3_412 = A1_410.ObjectVar2
  L3_412 = A0_409[L3_412]
  GetTable(A0_409, A1_410.DestVarTable, true)[A1_410.DestVar] = DistanceBetweenObjectBounds(L2_411, L3_412)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_413, A1_414)
  local L2_415, L3_416, L4_417
  L2_415 = A1_414.ObjectVar
  L2_415 = A0_413[L2_415]
  L3_416 = GetTable
  L4_417 = A0_413
  L3_416 = L3_416(L4_417, A1_414.PointVarTable, true)
  L4_417 = A1_414.PointVar
  L4_417 = L3_416[L4_417]
  GetTable(A0_413, A1_414.DestVarTable, true)[A1_414.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_415, L4_417)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_418, A1_419)
  local L2_420, L3_421
  L2_420 = GetParam
  L3_421 = "Point1"
  L2_420 = L2_420(L3_421, A0_418, A1_419)
  L3_421 = GetParam
  L3_421 = L3_421("Point2", A0_418, A1_419)
  GetTable(A0_418, A1_419.DestVarTable, true)[A1_419.DestVar] = DistanceBetweenPoints(L2_420, L3_421)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_422, A1_423, A2_424)
  local L3_425, L4_426, L5_427, L6_428, L7_429, L8_430
  L5_427 = 0
  L6_428 = nil
  L7_429 = A1_423.ObjectDistanceType
  L8_430 = A1_423.ObjectVar1
  L3_425 = A0_422[L8_430]
  L8_430 = A1_423.ObjectVar2
  L4_426 = A0_422[L8_430]
  if nil == L4_426 then
    L8_430 = A1_423.Point2Var
    if nil ~= L8_430 then
      L8_430 = GetTable
      L8_430 = L8_430(A0_422, A1_423.Point2VarTable, true)
      L4_426 = L8_430[A1_423.Point2Var]
      L5_427 = L5_427 + 1
    end
  end
  if nil == L3_425 then
    L8_430 = A1_423.Point1Var
    if nil ~= L8_430 then
      L8_430 = GetTable
      L8_430 = L8_430(A0_422, A1_423.Point1VarTable, true)
      L3_425 = L8_430[A1_423.Point1Var]
      L5_427 = L5_427 + 1
      if 1 == L5_427 then
        L3_425, L4_426 = L4_426, L3_425
      end
    end
  end
  if nil ~= L7_429 then
    if 0 == L5_427 then
      L8_430 = OBJECT_CENTER
      if L8_430 == L7_429 then
        L6_428 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_430 = OBJECT_BOUNDARY
        if L8_430 == L7_429 then
          L6_428 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_430 = A1_423.OwnerVar
          L8_430 = A0_422[L8_430]
          Say(L8_430, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_427 then
      L8_430 = OBJECT_CENTER
      if L8_430 == L7_429 then
        L6_428 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_430 = OBJECT_BOUNDARY
        if L8_430 == L7_429 then
          L6_428 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_430 = A1_423.OwnerVar
          L8_430 = A0_422[L8_430]
          Say(L8_430, "invalid object distance type", 0)
        end
      end
    else
      L6_428 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_430 = A1_423.Distance
  if A1_423.DistanceVar ~= nil and GetTable(A0_422, A1_423.DistanceVarTable, true) ~= nil then
    L8_430 = L8_430 + GetTable(A0_422, A1_423.DistanceVarTable, true)[A1_423.DistanceVar]
  end
  if L3_425 ~= nil and L4_426 ~= nil and L6_428 ~= nil and L8_430 ~= nil then
    if not L6_428(L3_425, L4_426, L8_430) then
      ExecuteBuildingBlocks(A2_424, A0_422)
      A0_422.LastIfSucceeded = true
    else
      A0_422.LastIfSucceeded = false
    end
  else
    A0_422.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_431, A1_432)
  local L2_433, L3_434
  L2_433 = A1_432.TargetVar
  L2_433 = A0_431[L2_433]
  L3_434 = A1_432.CasterVar
  L3_434 = A0_431[L3_434]
  GetTable(A0_431, A1_432.DestVarTable, true)[A1_432.DestVar] = SpellBuffCount(L2_433, A1_432.BuffName, L3_434)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_435, A1_436)
  local L2_437
  L2_437 = A1_436.TargetVar
  L2_437 = A0_435[L2_437]
  GetTable(A0_435, A1_436.DestVarTable, true)[A1_436.DestVar] = SpellBuffCount(L2_437, A1_436.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_438, A1_439)
  local L2_440, L3_441
  L2_440 = GetTable
  L3_441 = A0_438
  L2_440 = L2_440(L3_441, A1_439.ScaleVarTable, false)
  L3_441 = nil
  if A1_439.OwnerVar ~= nil then
    L3_441 = A0_438[A1_439.OwnerVar]
  else
    L3_441 = A0_438.Owner
  end
  if A1_439.ScaleVar ~= nil and A1_439.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_440[A1_439.ScaleVar], L3_441)
  else
    SetScaleSkinCoef(A1_439.Scale, L3_441)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_442, A1_443)
  SpellBuffAdd(A0_442[A1_443.TargetVar], A0_442[A1_443.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_442.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_444, A1_445, A2_446)
  local L3_447, L4_448
  L3_447 = A1_445.TargetVar
  L3_447 = A0_444[L3_447]
  L4_448 = A1_445.NumStacks
  if GetParam("NumStacks", A0_444, A1_445) == 0 then
    L4_448 = SpellBuffCount(L3_447, A1_445.BuffName, caster)
  else
    L4_448 = GetParam("NumStacks", A0_444, A1_445)
  end
  while L4_448 > 0 do
    SpellBuffRemove(L3_447, A1_445.BuffName, A0_444[A1_445.AttackerVar])
    L4_448 = L4_448 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_449, A1_450, A2_451)
  if A0_449.EmoteId == A1_450.EmoteId then
    ExecuteBuildingBlocks(A2_451, A0_449)
    A0_449.LastIfSucceeded = true
  else
    A0_449.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_452, A1_453, A2_454)
  if A0_452.EmoteId ~= A1_453.EmoteId then
    ExecuteBuildingBlocks(A2_454, A0_452)
    A0_452.LastIfSucceeded = true
  else
    A0_452.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_455, A1_456)
  local L2_457, L3_458, L4_459, L5_460
  L2_457 = GetTable
  L3_458 = A0_455
  L4_459 = A1_456.String1VarTable
  L5_460 = false
  L2_457 = L2_457(L3_458, L4_459, L5_460)
  L3_458 = A1_456.String1Var
  L3_458 = L2_457[L3_458]
  L4_459 = GetTable
  L5_460 = A0_455
  L4_459 = L4_459(L5_460, A1_456.String2VarTable, false)
  L5_460 = A1_456.String2Var
  L5_460 = L4_459[L5_460]
  GetTable(A0_455, A1_456.ResultVarTable, false)[A1_456.ResultVar] = L3_458 .. L5_460
end
BBConcatenateStrings = L0_0
function L0_0(A0_461, A1_462)
  BBGetMinionKills(A0_461, A1_462)
  A0_461.MinionKillSource = GetParam("MinionKillTarget")
  A0_461.MinionKills = A0_461.MinionsKilled + GetParam("MinionKills", A0_461, A1_462)
  BBSetMinionKills(A0_461, A1_462)
end
BBIncreaseMinionKills = L0_0
