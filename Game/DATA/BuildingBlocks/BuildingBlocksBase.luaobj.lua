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
function L0_0()
  local L0_15, L1_16
end
BBRequireVar = L0_0
function L0_0()
  local L0_17, L1_18
end
BBCom = L0_0
function L0_0(A0_19, A1_20, A2_21)
  if A1_20.IsConditionTrue(A0_19) then
    ExecuteBuildingBlocks(A2_21, A0_19)
  end
end
BBConditionallyExecute = L0_0
function L0_0(A0_22, A1_23)
  local L2_24, L3_25
  L2_24 = GetTable
  L3_25 = A0_22
  L2_24 = L2_24(L3_25, A1_23.SrcVarTable, false)
  L3_25 = A1_23.ToSay
  L3_25 = L3_25 or ""
  ClientPrint(tostring(L3_25) .. ": " .. type(L2_24[A1_23.SrcVar]))
end
BBPrintTypeToChat = L0_0
function L0_0(A0_26, A1_27)
  local L2_28, L3_29, L4_30, L5_31, L6_32
  L2_28 = A1_27.ToSay
  L2_28 = L2_28 or ""
  L3_29 = A1_27.Color
  L3_29 = L3_29 or "FFFFFF"
  L4_30 = GetTable
  L5_31 = A0_26
  L6_32 = A1_27.SrcVarTable
  L4_30 = L4_30(L5_31, L6_32, false)
  L5_31 = A1_27.SrcVar
  L5_31 = L4_30[L5_31]
  L6_32 = "<font color=\""
  L6_32 = L6_32 .. L3_29 .. "\">"
  L6_32 = L6_32 .. L2_28
  if type(L5_31) ~= "table" and type(L5_31) ~= "nil" then
    L6_32 = L6_32 .. " " .. tostring(L5_31)
  end
  L6_32 = L6_32 .. "</font>"
  ClientPrint(L6_32)
  if type(L5_31) == "table" then
    PrintTableToChat(L5_31)
  end
end
BBPrintToChat = L0_0
function L0_0(A0_33, A1_34)
  local L2_35, L3_36
  L2_35 = GetTable
  L3_36 = A0_33
  L2_35 = L2_35(L3_36, A1_34.TableName, true)
  L3_36 = A1_34.TableName
  L3_36 = L3_36 or "PassThroughParams"
  ClientPrint(L3_36)
  PrintTableToChat(L2_35)
end
BBPrintTableToChat = L0_0
function L0_0(A0_37, A1_38)
  local L2_39, L3_40, L4_41, L5_42, L6_43, L7_44, L8_45, L9_46, L10_47, L11_48, L12_49, L13_50
  A1_38 = A1_38 or 0
  if A1_38 > 10 then
    return
  end
  L2_39 = nil
  L3_40 = "|"
  for L7_44 = 1, A1_38 do
    L9_46 = "----"
    L3_40 = L8_45 .. L9_46
  end
  L6_43(L7_44)
  for L9_46, L10_47 in L6_43(L7_44) do
    L11_48 = nil
    L12_49 = tostring
    L13_50 = L9_46
    L12_49 = L12_49(L13_50)
    if L12_49 == "PassThroughParams" then
      L11_48 = "{{ PassThroughParams }}"
    else
      L13_50 = type
      L13_50 = L13_50(L10_47)
      if L13_50 == "table" then
        L11_48 = "Table"
      else
        L13_50 = tostring
        L13_50 = L13_50(L10_47)
        L11_48 = L13_50
      end
    end
    L13_50 = L3_40
    L13_50 = L13_50 .. L12_49 .. ": " .. L11_48
    ClientPrint(L13_50)
    if type(L10_47) == "table" then
      PrintTableToChat(L10_47, A1_38 + 1)
    end
  end
  L6_43(L7_44)
end
PrintTableToChat = L0_0
function L0_0(A0_51, A1_52, A2_53)
  local L3_54
  if A1_52 ~= nil then
    L3_54 = A0_51[A1_52]
    if L3_54 == nil and A2_53 then
      A0_51[A1_52] = {}
      return A0_51[A1_52]
    end
  end
  if L3_54 == nil then
    L3_54 = A0_51
  end
  return L3_54
end
GetTable = L0_0
function L0_0(A0_55, A1_56, A2_57)
  if A2_57[A0_55 .. "Var"] ~= nil and GetTable(A1_56, A2_57[A0_55 .. "VarTable"], false) ~= nil then
    return GetTable(A1_56, A2_57[A0_55 .. "VarTable"], false)[A2_57[A0_55 .. "Var"]]
  else
    return A2_57[A0_55]
  end
end
GetParam = L0_0
function L0_0(A0_58, A1_59)
  GetTable(A0_58, A1_59.DestVarTable, true)[A1_59.DestVar] = {}
end
BBCreateCustomTable = L0_0
function L0_0(A0_60, A1_61)
  GetTable(A0_60, A1_61.TableNameVarTable, false)[A1_61.TableNameVar] = nil
end
BBDestroyCustomTable = L0_0
function L0_0(A0_62, A1_63)
  if type(GetTable(A0_62, A1_63.DestTableVarTable, false)[A1_63.DestTableVar]) == "nil" then
    GetTable(A0_62, A1_63.DestTableVarTable, false)[A1_63.DestTableVar] = {}
  end
  if type(GetTable(A0_62, A1_63.DestTableVarTable, false)[A1_63.DestTableVar]) == "table" then
    GetTable(A0_62, A1_63.DestTableVarTable, false)[A1_63.DestTableVar][GetParam("Key", A0_62, A1_63)] = GetParam("Value", A0_62, A1_63)
  end
end
BBSetKeyValueInCustomTable = L0_0
function L0_0(A0_64, A1_65)
  if type(GetTable(A0_64, A1_65.SrcTableVarTable, false)[A1_65.SrcTableVar]) == "table" then
    GetTable(A0_64, A1_65.DestVarTable, true)[A1_65.DestVar] = GetTable(A0_64, A1_65.SrcTableVarTable, false)[A1_65.SrcTableVar][GetParam("SrcKey", A0_64, A1_65)]
  end
end
BBGetKeyValueInCustomTable = L0_0
function L0_0(A0_66, A1_67)
  local L2_68, L3_69, L4_70
  L2_68 = GetTable
  L3_69 = A0_66
  L4_70 = A1_67.DestTableVarTable
  L2_68 = L2_68(L3_69, L4_70, false)
  L3_69 = GetParam
  L4_70 = "DestIndex"
  L3_69 = L3_69(L4_70, A0_66, A1_67)
  L4_70 = GetParam
  L4_70 = L4_70("Value", A0_66, A1_67)
  if type(L2_68[A1_67.DestTableVar]) == "nil" then
    L2_68[A1_67.DestTableVar] = {}
  end
  if type(L2_68[A1_67.DestTableVar]) == "table" then
    if L3_69 then
      table.insert(L2_68[A1_67.DestTableVar], L3_69, L4_70)
      if A1_67.OutIndexVar then
        GetTable(A0_66, A1_67.OutIndexVarTable, true)[A1_67.OutIndexVar] = L3_69
      end
    else
      table.insert(L2_68[A1_67.DestTableVar], L4_70)
      if A1_67.OutIndexVar then
        GetTable(A0_66, A1_67.OutIndexVarTable, true)[A1_67.OutIndexVar] = table.getn(L2_68[A1_67.DestTableVar])
      end
    end
  end
end
BBInsertIntoInCustomTable = L0_0
function L0_0(A0_71, A1_72)
  local L2_73, L3_74
  L2_73 = GetTable
  L3_74 = A0_71
  L2_73 = L2_73(L3_74, A1_72.TableVarTable, false)
  L3_74 = GetParam
  L3_74 = L3_74("Index", A0_71, A1_72)
  if type(L2_73[A1_72.TableVar]) == "nil" then
    ClientPrint("Table specified does not exist: " .. tostring(A1_72.TableVarTable) .. "." .. tostring(A1_72.TableVar))
    return
  end
  if type(L2_73[A1_72.TableVar]) == "table" then
    if L3_74 then
      table.remove(L2_73[A1_72.TableVar], L3_74, valueData)
    else
      ClientPrint("Specified index was nil: " .. tostring(A1_72.IndexVarTable) .. "." .. tostring(A1_72.IndexVar))
    end
  end
end
BBRemoveFromCustomTable = L0_0
function L0_0(A0_75, A1_76, A2_77)
  local L3_78, L4_79, L5_80, L6_81, L7_82, L8_83
  L3_78 = GetTable
  L3_78 = L3_78(L4_79, L5_80, L6_81)
  if L4_79 == "table" then
    if L4_79 then
      for L8_83, _FORV_9_ in L5_80(L6_81) do
        table.insert(L4_79, L8_83)
      end
      L5_80(L6_81)
      for L8_83, _FORV_9_ in L5_80(L6_81) do
        GetTable(A0_75, A1_76.DestKeyVarTable, true)[A1_76.DestKeyVar] = _FORV_9_
        GetTable(A0_75, A1_76.DestValueVarTable, true)[A1_76.DestValueVar] = L3_78[A1_76.TableVar][_FORV_9_]
        ExecuteBuildingBlocks(A2_77, A0_75)
      end
    else
      for L7_82, L8_83 in L4_79(L5_80) do
        GetTable(A0_75, A1_76.DestKeyVarTable, true)[A1_76.DestKeyVar] = L7_82
        GetTable(A0_75, A1_76.DestValueVarTable, true)[A1_76.DestValueVar] = L8_83
        ExecuteBuildingBlocks(A2_77, A0_75)
      end
    end
  end
end
BBForEachInCustomTable = L0_0
function L0_0(A0_84, A1_85)
  local L2_86, L3_87, L4_88, L5_89, L6_90
  L2_86 = GetTable
  L3_87 = A0_84
  L4_88 = A1_85.SrcTableVarTable
  L5_89 = false
  L2_86 = L2_86(L3_87, L4_88, L5_89)
  L3_87 = GetParam
  L4_88 = "Value"
  L5_89 = A0_84
  L6_90 = A1_85
  L3_87 = L3_87(L4_88, L5_89, L6_90)
  L4_88 = GetTable
  L5_89 = A0_84
  L6_90 = A1_85.MatchingKeyVarTable
  L4_88 = L4_88(L5_89, L6_90, false)
  L5_89 = GetTable
  L6_90 = A0_84
  L5_89 = L5_89(L6_90, A1_85.WasFoundVarTable, false)
  L6_90 = A1_85.WasFoundVar
  L5_89[L6_90] = false
  L6_90 = type
  L6_90 = L6_90(L2_86[A1_85.SrcTableVar])
  if L6_90 == "table" then
    L6_90 = GetTable
    L6_90 = L6_90(A0_84, A1_85.DestVarTable, true)
    for _FORV_10_, _FORV_11_ in pairs(L6_90) do
      if _FORV_11_ == L3_87 then
        L5_89[A1_85.WasFoundVar] = true
        L4_88[A1_85.MatchingKeyVar] = _FORV_10_
      end
    end
  end
end
BBCustomTableContainsValue = L0_0
function L0_0(A0_91, A1_92, A2_93)
  for _FORV_9_, _FORV_10_ in pairs(GetTable(A0_91, A1_92.TableVarTable, false)[A1_92.TableVar]) do
  end
  GetTable(A0_91, A1_92.SizeVarTable, false)[A1_92.SizeVar] = 0 + 1
end
BBGetSizeOfCustomTable = L0_0
function L0_0(A0_94, A1_95)
  local L2_96, L3_97
  L2_96 = GetTable
  L3_97 = A0_94
  L2_96 = L2_96(L3_97, A1_95.DestVarTable, true)
  L3_97 = nil
  if A1_95.SpellSlotVar ~= nil and GetTable(A0_94, A1_95.SpellSlotVarTable, false) ~= nil then
    L3_97 = GetTable(A0_94, A1_95.SpellSlotVarTable, false)[A1_95.SpellSlotVar]
  else
    L3_97 = A1_95.SpellSlotValue
  end
  L2_96[A1_95.DestVar] = A1_95.Function(A0_94[A1_95.OwnerVar], L3_97, A1_95.SpellbookType, A1_95.SlotType)
end
BBGetSlotSpellInfo = L0_0
function L0_0(A0_98, A1_99)
  local L2_100, L3_101, L4_102
  L2_100 = GetTable
  L3_101 = A0_98
  L4_102 = A1_99.SrcVarTable
  L2_100 = L2_100(L3_101, L4_102, false)
  L3_101 = nil
  L4_102 = A1_99.SrcVar
  if L4_102 ~= nil and L2_100 ~= nil then
    L4_102 = A1_99.SrcVar
    L3_101 = L2_100[L4_102]
  else
    L3_101 = A1_99.SrcValue
  end
  L4_102 = nil
  if A1_99.SpellSlotVar ~= nil and GetTable(A0_98, A1_99.SpellSlotVarTable, false) ~= nil then
    L4_102 = GetTable(A0_98, A1_99.SpellSlotVarTable, false)[A1_99.SpellSlotVar]
  else
    L4_102 = A1_99.SpellSlotValue
  end
  SetSlotSpellCooldownTime(A0_98[A1_99.OwnerVar], L4_102, A1_99.SpellbookType, A1_99.SlotType, L3_101)
end
BBSetSlotSpellCooldownTime = L0_0
function L0_0(A0_103, A1_104)
  if A0_103.Level ~= nil and A1_104.SrcValueByLevel ~= nil then
    A0_103.ReturnValue = A1_104.SrcValueByLevel[A0_103.Level]
  elseif A1_104.SrcVar ~= nil and GetTable(A0_103, A1_104.SrcVarTable, false) ~= nil then
    A0_103.ReturnValue = GetTable(A0_103, A1_104.SrcVarTable, false)[A1_104.SrcVar]
  else
    A0_103.ReturnValue = A1_104.SrcValue
  end
end
BBSetReturnValue = L0_0
function L0_0(A0_105, A1_106)
  if type(A0_105) == "string" and type(A1_106) == "string" then
    A0_105 = string.lower(A0_105)
    A1_106 = string.lower(A1_106)
  end
  return A0_105 == A1_106
end
CO_EQUAL = L0_0
function L0_0(A0_107, A1_108)
  if type(A0_107) == "string" and type(A1_108) == "string" then
    A0_107 = string.lower(A0_107)
    A1_108 = string.lower(A1_108)
  end
  return A0_107 ~= A1_108
end
CO_NOT_EQUAL = L0_0
function L0_0(A0_109, A1_110)
  local L2_111
  L2_111 = A0_109 < A1_110
  return L2_111
end
CO_LESS_THAN = L0_0
function L0_0(A0_112, A1_113)
  local L2_114
  L2_114 = A1_113 < A0_112
  return L2_114
end
CO_GREATER_THAN = L0_0
function L0_0(A0_115, A1_116)
  local L2_117
  L2_117 = A0_115 <= A1_116
  return L2_117
end
CO_LESS_THAN_OR_EQUAL = L0_0
function L0_0(A0_118, A1_119)
  local L2_120
  L2_120 = A1_119 <= A0_118
  return L2_120
end
CO_GREATER_THAN_OR_EQUAL = L0_0
function L0_0(A0_121, A1_122)
  return GetTeamID(A0_121) == GetTeamID(A1_122)
end
CO_SAME_TEAM = L0_0
function L0_0(A0_123, A1_124)
  return GetTeamID(A0_123) ~= GetTeamID(A1_124)
end
CO_DIFFERENT_TEAM = L0_0
function L0_0(A0_125, A1_126)
  return GetSourceType() == A1_126 or GetSourceType() == A0_125
end
CO_DAMAGE_SOURCETYPE_IS = L0_0
function L0_0(A0_127, A1_128)
  return GetSourceType() ~= A1_128 and GetSourceType() ~= A0_127
end
CO_DAMAGE_SOURCETYPE_IS_NOT = L0_0
function L0_0(A0_129)
  return IsObjectAI(A0_129)
end
CO_IS_TYPE_AI = L0_0
function L0_0(A0_130)
  return IsObjectAI(A0_130) ~= true
end
CO_IS_NOT_AI = L0_0
function L0_0(A0_131)
  return IsObjectHero(A0_131)
end
CO_IS_TYPE_HERO = L0_0
function L0_0(A0_132)
  return IsObjectHero(A0_132) ~= true
end
CO_IS_NOT_HERO = L0_0
function L0_0(A0_133)
  return IsClone(A0_133)
end
CO_IS_CLONE = L0_0
function L0_0(A0_134)
  return IsClone(A0_134) ~= true
end
CO_IS_NOT_CLONE = L0_0
function L0_0(A0_135)
  return IsMelee(A0_135)
end
CO_IS_MELEE = L0_0
function L0_0(A0_136)
  return IsMelee(A0_136) ~= true
end
CO_IS_RANGED = L0_0
function L0_0(A0_137)
  return A0_137 > math.random()
end
CO_RANDOM_CHANCE_LESS_THAN = L0_0
function L0_0(A0_138)
  return IsTurretAI(A0_138)
end
CO_IS_TYPE_TURRET = L0_0
function L0_0(A0_139)
  return IsTurretAI(A0_139) ~= true
end
CO_IS_NOT_TURRET = L0_0
function L0_0(A0_140)
  return IsDead(A0_140)
end
CO_IS_DEAD = L0_0
function L0_0(A0_141)
  return IsDead(A0_141) ~= true
end
CO_IS_NOT_DEAD = L0_0
function L0_0(A0_142)
  return IsDeadOrZombie(A0_142)
end
CO_IS_DEAD_OR_ZOMBIE = L0_0
function L0_0(A0_143, A1_144)
  return BBIsTargetInFrontOfMe(A0_143, A1_144)
end
CO_IS_TARGET_IN_FRONT_OF_ME = L0_0
function L0_0(A0_145, A1_146)
  return BBIsTargetBehindMe(A0_145, A1_146)
end
CO_IS_TARGET_BEHIND_ME = L0_0
function L0_0(A0_147)
  return IsWard(A0_147)
end
CO_IS_WARD = L0_0
function L0_0(A0_148)
  return IsStructure(A0_148)
end
CO_IS_STRUCTURE = L0_0
function L0_0(A0_149)
  return IsStructure(A0_149) ~= true
end
CO_IS_NOT_STRUCTURE = L0_0
function L0_0(A0_150, A1_151, A2_152)
  local L3_153, L4_154, L5_155, L6_156
  L3_153 = GetTable
  L4_154 = A0_150
  L5_155 = A1_151.Src1VarTable
  L6_156 = false
  L3_153 = L3_153(L4_154, L5_155, L6_156)
  L4_154 = GetTable
  L5_155 = A0_150
  L6_156 = A1_151.Src2VarTable
  L4_154 = L4_154(L5_155, L6_156, false)
  L5_155 = false
  L6_156 = nil
  if L3_153 ~= nil and A1_151.Src1Var ~= nil then
    L6_156 = L3_153[A1_151.Src1Var]
  else
    L6_156 = A1_151.Value1
  end
  if L4_154 ~= nil and A1_151.Src2Var ~= nil then
    L5_155 = A1_151.CompareOp(L6_156, L4_154[A1_151.Src2Var])
  else
    L5_155 = A1_151.CompareOp(L6_156, A1_151.Value2)
  end
  if L5_155 then
    ExecuteBuildingBlocks(A2_152, A0_150)
    A0_150.LastIfSucceeded = true
  else
    A0_150.LastIfSucceeded = false
  end
end
BBIf = L0_0
function L0_0(A0_157, A1_158, A2_159)
  if A0_157.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_159, A0_157)
    A0_157.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_160, A1_161, A2_162)
  local L3_163, L4_164, L5_165, L6_166
  L3_163 = A0_160.LastIfSucceeded
  if L3_163 == false then
    L3_163 = GetTable
    L4_164 = A0_160
    L5_165 = A1_161.Src1VarTable
    L6_166 = false
    L3_163 = L3_163(L4_164, L5_165, L6_166)
    L4_164 = GetTable
    L5_165 = A0_160
    L6_166 = A1_161.Src2VarTable
    L4_164 = L4_164(L5_165, L6_166, false)
    L5_165 = false
    L6_166 = nil
    if L3_163 ~= nil and A1_161.Src1Var ~= nil then
      L6_166 = L3_163[A1_161.Src1Var]
    else
      L6_166 = A1_161.Value1
    end
    if L4_164 ~= nil and A1_161.Src2Var ~= nil then
      L5_165 = A1_161.CompareOp(L6_166, L4_164[A1_161.Src2Var])
    else
      L5_165 = A1_161.CompareOp(L6_166, A1_161.Value2)
    end
    if L5_165 then
      ExecuteBuildingBlocks(A2_162, A0_160)
      A0_160.LastIfSucceeded = true
    else
      A0_160.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_167, A1_168, A2_169)
  local L3_170
  if A1_168.TargetVar ~= nil then
    L3_170 = A0_167[A1_168.TargetVar]
  else
    L3_170 = A0_167.Target
  end
  if HasBuffOfType(L3_170, A1_168.BuffType) then
    ExecuteBuildingBlocks(A2_169, A0_167)
    A0_167.LastIfSucceeded = true
  else
    A0_167.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_171, A1_172, A2_173)
  local L3_174, L4_175
  if A1_172.OwnerVar ~= nil then
    L3_174 = A0_171[A1_172.OwnerVar]
  else
    L3_174 = A0_171.Owner
  end
  if A1_172.AttackerVar ~= nil then
    L4_175 = A0_171[A1_172.AttackerVar]
  else
    L4_175 = A0_171.Attacker
  end
  if SpellBuffCount(L3_174, A1_172.BuffName, L4_175) > 0 then
    ExecuteBuildingBlocks(A2_173, A0_171)
    A0_171.LastIfSucceeded = true
  else
    A0_171.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_176, A1_177, A2_178)
  if BBIsMissileAutoAttack(A0_176, A1_177) then
    ExecuteBuildingBlocks(A2_178, A0_176)
    A0_176.LastIfSucceeded = true
  else
    A0_176.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_179, A1_180)
  A0_179.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_181, A1_182, A2_183)
  local L3_184, L4_185
  if A1_182.OwnerVar ~= nil then
    L3_184 = A0_181[A1_182.OwnerVar]
  else
    L3_184 = A0_181.Owner
  end
  if A1_182.CasterVar ~= nil then
    L4_185 = A0_181[A1_182.CasterVar]
  else
    L4_185 = A0_181.Caster
  end
  if SpellBuffCount(L3_184, A1_182.BuffName, L4_185) <= 0 then
    ExecuteBuildingBlocks(A2_183, A0_181)
    A0_181.LastIfSucceeded = true
  else
    A0_181.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_186, A1_187, A2_188)
  local L3_189, L4_190
  if A1_187.OwnerVar ~= nil then
    L3_189 = A0_186[A1_187.OwnerVar]
  else
    L3_189 = A0_186.Owner
  end
  if HasPARType(L3_189, A1_187.PARType) then
    ExecuteBuildingBlocks(A2_188, A0_186)
    A0_186.LastIfSucceeded = true
  else
    A0_186.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_191, A1_192, A2_193)
  local L3_194, L4_195
  if A1_192.OwnerVar ~= nil then
    L3_194 = A0_191[A1_192.OwnerVar]
  else
    L3_194 = A0_191.Owner
  end
  if not HasPARType(L3_194, A1_192.PARType) then
    ExecuteBuildingBlocks(A2_193, A0_191)
    A0_191.LastIfSucceeded = true
  else
    A0_191.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_196, A1_197, A2_198)
  local L3_199, L4_200, L5_201, L6_202, L7_203
  L3_199 = GetTable
  L4_200 = A0_196
  L5_201 = A1_197.Src1VarTable
  L6_202 = false
  L3_199 = L3_199(L4_200, L5_201, L6_202)
  L4_200 = GetTable
  L5_201 = A0_196
  L6_202 = A1_197.Src2VarTable
  L7_203 = false
  L4_200 = L4_200(L5_201, L6_202, L7_203)
  L5_201 = true
  while L5_201 do
    L6_202 = false
    L7_203 = nil
    if L3_199 ~= nil and A1_197.Src1Var ~= nil then
      L7_203 = L3_199[A1_197.Src1Var]
    else
      L7_203 = A1_197.Value1
    end
    if L4_200 ~= nil and A1_197.Src2Var ~= nil then
      L6_202 = A1_197.CompareOp(L7_203, L4_200[A1_197.Src2Var])
    else
      L6_202 = A1_197.CompareOp(L7_203, A1_197.Value2)
    end
    if L6_202 then
      ExecuteBuildingBlocks(A2_198, A0_196)
    else
      L5_201 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_204, A1_205)
  return A0_204 * A1_205
end
MO_MULTIPLY = L0_0
function L0_0(A0_206, A1_207)
  return A0_206 + A1_207
end
MO_ADD = L0_0
function L0_0(A0_208, A1_209)
  return A0_208 - A1_209
end
MO_SUBTRACT = L0_0
function L0_0(A0_210, A1_211)
  return A0_210 / A1_211
end
MO_DIVIDE = L0_0
function L0_0(A0_212, A1_213)
  if A0_212 < A1_213 then
    return A0_212
  else
    return A1_213
  end
end
MO_MIN = L0_0
function L0_0(A0_214, A1_215)
  if A1_215 < A0_214 then
    return A0_214
  else
    return A1_215
  end
end
MO_MAX = L0_0
function L0_0(A0_216, A1_217)
  return A0_216 % A1_217
end
MO_MODULO = L0_0
function L0_0(A0_218)
  return math.floor(A0_218 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_219)
  return math.ceil(A0_219)
end
MO_ROUNDUP = L0_0
function L0_0(A0_220)
  return math.floor(A0_220)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_221)
  return math.sin(math.rad(A0_221))
end
MO_SIN = L0_0
function L0_0(A0_222)
  return math.cos(math.rad(A0_222))
end
MO_COSINE = L0_0
function L0_0(A0_223)
  return math.tan(math.rad(A0_223))
end
MO_TANGENT = L0_0
function L0_0(A0_224)
  return math.deg(math.asin(A0_224))
end
MO_ASIN = L0_0
function L0_0(A0_225)
  return math.deg(math.acos(A0_225))
end
MO_ACOS = L0_0
function L0_0(A0_226)
  return math.deg(math.atan(A0_226))
end
MO_ATAN = L0_0
function L0_0(A0_227, A1_228)
  return math.pow(A0_227, A1_228)
end
MO_POW = L0_0
function L0_0(A0_229)
  return math.sqrt(A0_229)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_230, A1_231)
  local L2_232
  L2_232 = A0_230 and A1_231
  return L2_232
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_233, A1_234)
  local L2_235
  L2_235 = A0_233 or A1_234
  return L2_235
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_236)
  local L1_237
  L1_237 = not A0_236
  return L1_237
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_238)
  return math.abs(A0_238)
end
MO_ABS = L0_0
function L0_0(A0_239, A1_240)
  return math.random(A0_239, A1_240)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_241, A1_242)
  local L2_243, L3_244
  L2_243 = GetMathNumber
  L3_244 = A0_241
  L2_243 = L2_243(L3_244, A1_242.Src1VarTable, A1_242.Src1Var, A1_242.Src1Value)
  L3_244 = GetMathNumber
  L3_244 = L3_244(A0_241, A1_242.Src2VarTable, A1_242.Src2Var, A1_242.Src2Value)
  GetTable(A0_241, A1_242.DestVarTable)[A1_242.DestVar] = A1_242.MathOp(L2_243, L3_244)
end
BBMath = L0_0
function L0_0(A0_245, A1_246, A2_247, A3_248)
  if A2_247 ~= nil and GetTable(A0_245, A1_246)[A2_247] ~= nil then
    return GetTable(A0_245, A1_246)[A2_247]
  end
  return A3_248
end
GetMathNumber = L0_0
function L0_0(A0_249, A1_250)
  if type(A1_250) == "number" then
    return A1_250
  elseif type(A1_250) == "function" then
    return A1_250(A0_249)
  elseif type(A1_250) == "string" then
    return A0_249[A1_250]
  end
end
GetNumber = L0_0
function L0_0(A0_251, A1_252)
  return VectorAdd(A0_251, A1_252)
end
VEC_ADD = L0_0
function L0_0(A0_253, A1_254)
  return VectorSubtract(A0_253, A1_254)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_255, A1_256)
  return VectorScalarMultiply(A0_255, A1_256)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_257, A1_258)
  return VectorScalarDivide(A0_257, A1_258)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_259, A1_260)
  return VectorRotateY(A0_259, A1_260)
end
VEC_ROTATE = L0_0
function L0_0(A0_261, A1_262)
  BBMath(A0_261, A1_262)
end
BBVectorMath = L0_0
function L0_0(A0_263, A1_264)
  local L2_265, L3_266, L4_267, L5_268
  L2_265 = A0_263.InstanceVars
  L3_266 = L2_265.InterpDelta
  if L3_266 == nil then
    L3_266 = A1_264.Amount
    L4_267 = A1_264.AmountVar
    if L4_267 ~= nil then
      L4_267 = GetTable
      L5_268 = A0_263
      L4_267 = L4_267(L5_268, A1_264.AmountVarTable)
      L5_268 = A1_264.AmountVar
      L3_266 = L4_267[L5_268]
    end
    L4_267 = GetPosition
    L5_268 = A1_264.TargetVar
    L5_268 = A0_263[L5_268]
    L4_267 = L4_267(L5_268)
    L2_265.KnockBackStart = L4_267
    L4_267 = GetNormalizedPositionDelta
    L5_268 = A1_264.TargetVar
    L5_268 = A0_263[L5_268]
    L4_267 = L4_267(L5_268, A0_263[A1_264.AttackerVar], true)
    L5_268 = {}
    L5_268.x = L4_267.x * L3_266
    L5_268.y = 0
    L5_268.z = L4_267.z * L3_266
    L2_265.InterpDelta = L5_268
    L5_268 = GetTime
    L5_268 = L5_268()
    L2_265.StartTime = L5_268
    L5_268 = A1_264.KnockBackDuration
    L2_265.KnockBackDuration = L5_268
  end
  L3_266 = A1_264.TargetVar
  L3_266 = A0_263[L3_266]
  L4_267 = GetTime
  L4_267 = L4_267()
  L5_268 = L2_265.StartTime
  L4_267 = L4_267 - L5_268
  L5_268 = L2_265.KnockBackDuration
  L4_267 = L4_267 / L5_268
  L5_268 = {}
  L5_268.x = L2_265.KnockBackStart.x + L2_265.InterpDelta.x * L4_267
  L5_268.y = L2_265.KnockBackStart.y
  L5_268.z = L2_265.KnockBackStart.z + L2_265.InterpDelta.z * L4_267
  SetPosition(L3_266, L5_268)
end
BBKnockback = L0_0
function L0_0(A0_269, A1_270)
  local L2_271, L3_272
  L2_271 = GetParam
  L3_272 = "Left"
  L2_271 = L2_271(L3_272, A0_269, A1_270)
  L3_272 = GetParam
  L3_272 = L3_272("Right", A0_269, A1_270)
  GetTable(A0_269, A1_270.DestVarTable, true)[A1_270.DestVar] = tostring(L2_271) .. tostring(L3_272)
end
BBAppendString = L0_0
function L0_0(A0_273, A1_274)
  local L2_275
  L2_275 = 0
  if A1_274.Delta ~= nil then
    L2_275 = L2_275 + A1_274.Delta
  end
  if A1_274.DeltaByLevel ~= nil and A0_273.Level ~= nil then
    L2_275 = L2_275 + A1_274.DeltaByLevel[A0_273.Level]
  end
  if A1_274.DeltaVar ~= nil then
    L2_275 = L2_275 + GetTable(A0_273, A1_274.DeltaVarTable, true)[A1_274.DeltaVar]
  end
  if A1_274.TargetVar ~= nil then
    A1_274.Stat(L2_275, A0_273[A1_274.TargetVar])
  else
    A1_274.Stat(L2_275)
  end
end
BBIncStat = L0_0
function L0_0(A0_276, A1_277)
  local L2_278
  L2_278 = 0
  if A1_277.Delta ~= nil then
    L2_278 = L2_278 + A1_277.Delta
  end
  if A1_277.DeltaByLevel ~= nil and A0_276.Level ~= nil then
    L2_278 = L2_278 + A1_277.DeltaByLevel[A0_276.Level]
  end
  if A1_277.DeltaVar ~= nil then
    L2_278 = L2_278 + GetTable(A0_276, A1_277.DeltaVarTable, true)[A1_277.DeltaVar]
  end
  if A1_277.TargetVar ~= nil then
    A1_277.Stat(L2_278, A0_276[A1_277.TargetVar])
  else
    A1_277.Stat(L2_278)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_279, A1_280)
  if A1_280.AttackVar ~= nil then
  end
  if A1_280.Attack ~= nil then
  end
  if A1_280.TotalCoefficientVar ~= nil then
  end
  if A1_280.TotalCoefficient ~= nil then
  end
  if A1_280.TargetVar ~= nil then
    GetTable(A0_279, A1_280.DestVarTable, false)[A1_280.DestVar] = (0 + GetTable(A0_279, A1_280.AttackVarTable, true)[A1_280.AttackVar] + A1_280.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_279[A1_280.TargetVar])) + GetFlatCritDamageMod(A0_279[A1_280.TargetVar])) * (0 + GetTable(A0_279, A1_280.TotalCoefficientVarTable, true)[A1_280.TotalCoefficientVar] + A1_280.TotalCoefficient)
  else
    GetTable(A0_279, A1_280.DestVarTable, false)[A1_280.DestVar] = 2 * A1_280.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_281, A1_282)
  if A1_282.CDVar ~= nil then
  end
  if A1_282.CD ~= nil then
  end
  if A1_282.TargetVar ~= nil then
    GetTable(A0_281, A1_282.DestVarTable, false)[A1_282.DestVar] = (0 + GetTable(A0_281, A1_282.CDVarTable, true)[A1_282.CDVar] + A1_282.CD) * (1 + GetPercentCooldownMod(A0_281[A1_282.TargetVar]))
  else
    GetTable(A0_281, A1_282.DestVarTable, false)[A1_282.DestVar] = A1_282.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_283, A1_284)
  if A1_284.TargetVar ~= nil then
    GetTable(A0_283, A1_284.DestVarTable, false)[A1_284.DestVar] = A1_284.Stat(A0_283[A1_284.TargetVar])
  else
    GetTable(A0_283, A1_284.DestVarTable, false)[A1_284.DestVar] = A1_284.Stat()
  end
end
BBGetStat = L0_0
function L0_0(A0_285, A1_286)
  if A1_286.TargetVar ~= nil then
    GetTable(A0_285, A1_286.DestVarTable, false)[A1_286.DestVar] = GetLevel(A0_285[A1_286.TargetVar])
  else
    GetTable(A0_285, A1_286.DestVarTable, false)[A1_286.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_287, A1_288)
  if A1_288.TargetVar ~= nil then
    GetTable(A0_287, A1_288.DestVarTable, false)[A1_288.DestVar] = GetUnitSignificance(A0_287[A1_288.TargetVar])
  else
    GetTable(A0_287, A1_288.DestVarTable, false)[A1_288.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_289, A1_290)
  if A1_290.TargetVar ~= nil then
    GetTable(A0_289, A1_290.DestVarTable, false)[A1_290.DestVar] = GetArmor(A0_289[A1_290.TargetVar])
  else
    GetTable(A0_289, A1_290.DestVarTable, false)[A1_290.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_291, A1_292)
  if A1_292.TargetVar ~= nil then
    GetTable(A0_291, A1_292.DestVarTable, false)[A1_292.DestVar] = GetSpellBlock(A0_291[A1_292.TargetVar])
  else
    GetTable(A0_291, A1_292.DestVarTable, false)[A1_292.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_293, A1_294)
  if A1_294.TargetVar ~= nil then
    GetTable(A0_293, A1_294.DestVarTable, false)[A1_294.DestVar] = GetTeamID(A0_293[A1_294.TargetVar])
  else
    GetTable(A0_293, A1_294.DestVarTable, false)[A1_294.DestVar] = GetTeamID()
  end
end
BBGetTeamID = L0_0
function L0_0(A0_295, A1_296)
  local L2_297, L3_298, L4_299
  L2_297 = GetTable
  L3_298 = A0_295
  L4_299 = A1_296.DestVarTable
  L2_297 = L2_297(L3_298, L4_299, false)
  L3_298 = A1_296.TargetVar
  L4_299 = nil
  if L3_298 ~= nil then
    L4_299 = GetTeamID(A0_295[L3_298])
  else
    L4_299 = GetTeamID()
  end
  if L4_299 == TEAM_ORDER then
    L2_297[A1_296.DestVar] = TEAM_CHAOS
  elseif L4_299 == TEAM_CHAOS then
    L2_297[A1_296.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_300, A1_301)
  if A1_301.TargetVar ~= nil then
    GetTable(A0_300, A1_301.DestVarTable, false)[A1_301.DestVar] = GetUnitSkinName(A0_300[A1_301.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_302, A1_303)
  if A1_303.TargetVar ~= nil then
    GetTable(A0_302, A1_303.DestVarTable, false)[A1_303.DestVar] = GetTotalAttackDamage(A0_302[A1_303.TargetVar])
  else
    GetTable(A0_302, A1_303.DestVarTable, false)[A1_303.DestVar] = GetTotalAttackDamage()
  end
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_304, A1_305)
  GetTable(A0_304, A1_305.DestVarTable, true)[A1_305.DestVar] = A1_305.Status(A0_304[A1_305.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_306, A1_307)
  local L2_308
  L2_308 = A1_307.TargetVar
  L2_308 = A0_306[L2_308]
  ClearAttackTarget(L2_308)
end
BBClearAttackTarget = L0_0
function L0_0(A0_309, A1_310)
  GetTable(A0_309, A1_310.DestVarTable, true)[A1_310.DestVar] = A1_310.Info(A0_309[A1_310.TargetVar])
end
BBGetCastInfo = L0_0
function L0_0(A0_311, A1_312, A2_313)
  local L3_314, L4_315, L5_316, L6_317
  L3_314 = GetTable
  L4_315 = A0_311
  L5_316 = A1_312.TrackTimeVarTable
  L6_317 = false
  L3_314 = L3_314(L4_315, L5_316, L6_317)
  L4_315 = GetTime
  L4_315 = L4_315()
  L5_316 = A1_312.ExecuteImmediately
  L6_317 = A1_312.TimeBetweenExecutions
  if A1_312.TickTimeVar ~= nil and GetTable(A0_311, A1_312.TickTimeVarTable, false)[A1_312.TickTimeVar] ~= nil then
    L6_317 = GetTable(A0_311, A1_312.TickTimeVarTable, false)[A1_312.TickTimeVar]
  end
  if L3_314[A1_312.TrackTimeVar] == nil then
    L3_314[A1_312.TrackTimeVar] = L4_315
    if L5_316 == true then
      ExecuteBuildingBlocks(A2_313, A0_311)
    end
  end
  if L4_315 >= L3_314[A1_312.TrackTimeVar] + L6_317 then
    L3_314[A1_312.TrackTimeVar] = L3_314[A1_312.TrackTimeVar] + L6_317
    ExecuteBuildingBlocks(A2_313, A0_311)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_318, A1_319, A2_320)
  GetTable(A0_318, A1_319.TrackTimeVarTable, false)[A1_319.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_321, A1_322)
  local L2_323
  L2_323 = A1_322.SrcValue
  if A1_322.SrcVar ~= nil then
    L2_323 = GetTable(A0_321, A1_322.SrcVarTable, true)[A1_322.SrcVar]
  end
  A1_322.Status(A0_321[A1_322.TargetVar], L2_323)
end
BBSetStatus = L0_0
function L0_0(A0_324, A1_325)
  local L2_326
  L2_326 = A1_325.ToAlert
  if GetTable(A0_324, A1_325.SrcVarTable, false) ~= nil and A1_325.SrcVar ~= nil then
    L2_326 = L2_326 .. GetTable(A0_324, A1_325.SrcVarTable, false)[A1_325.SrcVar]
  end
  _ALERT(L2_326)
end
BBAlert = L0_0
function L0_0(A0_327, A1_328)
  local L2_329, L3_330, L4_331
  L2_329 = A1_328.ToSay
  L3_330 = GetTable
  L4_331 = A0_327
  L3_330 = L3_330(L4_331, A1_328.SrcVarTable, false)
  if L3_330 ~= nil then
    L4_331 = A1_328.SrcVar
    if L4_331 ~= nil then
      L4_331 = L2_329
      L2_329 = L4_331 .. tostring(L3_330[A1_328.SrcVar])
    end
  end
  L4_331 = nil
  if A1_328.OwnerVar ~= nil then
    L4_331 = A0_327[A1_328.OwnerVar]
  else
    L4_331 = A0_327.Owner
  end
  if A1_328.TextType == nil then
    A1_328.TextType = 0
  end
  Say(L4_331, L2_329, A1_328.TextType)
end
BBSay = L0_0
function L0_0(A0_332, A1_333)
  local L2_334, L3_335, L4_336
  L2_334 = A1_333.ToSay
  L3_335 = GetTable
  L4_336 = A0_332
  L3_335 = L3_335(L4_336, A1_333.SrcVarTable, false)
  if L3_335 ~= nil then
    L4_336 = A1_333.SrcVar
    if L4_336 ~= nil then
      L4_336 = L2_334
      L2_334 = L4_336 .. tostring(L3_335[A1_333.SrcVar])
    end
  end
  L4_336 = nil
  if A1_333.OwnerVar ~= nil then
    L4_336 = A0_332[A1_333.OwnerVar]
  else
    L4_336 = A0_332.Owner
  end
  if A1_333.TextType == nil then
    A1_333.TextType = 0
  end
  Say(L4_336, L2_334, A1_333.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_337, A1_338)
  GetTable(A0_337, A1_338.DestVarTable, true)[A1_338.DestVar] = BBLuaGetGold(A0_337, A1_338)
end
BBGetGold = L0_0
function L0_0(A0_339, A1_340)
  GetTable(A0_339, A1_340.DestVarTable, true)[A1_340.DestVar] = BBLuaGetTotalGold(A0_339, A1_340)
end
BBGetTotalGold = L0_0
function L0_0(A0_341, A1_342)
  SpellBuffAdd(A0_341[A1_342.OwnerVar], A0_341[A1_342.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_341.NextBuffVars)
  BBTeleportToPositionHelper(A0_341, A1_342)
end
BBTeleportToPosition = L0_0
function L0_0(A0_343, A1_344)
  if A1_344.XVar ~= nil and GetTable(A0_343, A1_344.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_343, A1_344.XVarTable, true)[A1_344.XVar]
  else
    Xloc = A1_344.X
  end
  if A1_344.YVar ~= nil and GetTable(A0_343, A1_344.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_343, A1_344.YVarTable, true)[A1_344.YVar]
  else
    Yloc = A1_344.Y
  end
  if A1_344.ZVar ~= nil and GetTable(A0_343, A1_344.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_343, A1_344.ZVarTable, true)[A1_344.ZVar]
  else
    Zloc = A1_344.Z
  end
  A1_344.OwnerVar, A0_343.position = A1_344.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_344.CastPositionName = "position"
  BBTeleportToPosition(A0_343, A1_344)
end
BBTeleportToPoint = L0_0
function L0_0(A0_345, A1_346)
  DefUpdateAura(GetTable(A0_345, A1_346.CenterTable, false)[A1_346.CenterVar], A1_346.Range, A1_346.UnitScan, A1_346.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_347, A1_348)
  ReincarnateNonDeadHero(GetTable(A0_347, A1_348.TargetTable, false)[A1_348.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_349, A1_350)
  GetTable(A0_349, A1_350.DestVarTable, true)[A1_350.DestVar] = A1_350.Function(A0_349[A1_350.OwnerVar], A1_350.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_351, A1_352)
  local L2_353, L3_354, L4_355, L5_356
  L2_353 = A1_352.WhomToOrderVar
  L2_353 = A0_351[L2_353]
  L3_354 = A1_352.TargetOfOrderVar
  L3_354 = A0_351[L3_354]
  L4_355 = GetTable
  L5_356 = A0_351
  L4_355 = L4_355(L5_356, A1_352.SrcVarTable, false)
  L5_356 = nil
  if A1_352.SrcVar ~= nil and L4_355 ~= nil then
    L5_356 = L4_355[A1_352.SrcVar]
  else
    L5_356 = GetPosition(L3_354)
  end
  if L3_354 == nil then
    L3_354 = L2_353
  end
  IssueOrder(L2_353, A1_352.Order, L5_356, L3_354)
end
BBIssueOrder = L0_0
function L0_0(A0_357, A1_358)
  local L2_359
  L2_359 = GetParam
  L2_359 = L2_359("NewRange", A0_357, A1_358)
  SetSpellCastRange(L2_359)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_360, A1_361)
  GetTable(A0_360, A1_361.DestVarTable, true)[A1_361.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_362, A1_363)
  local L2_364, L3_365
  L2_364 = A1_363.ObjectVar1
  L2_364 = A0_362[L2_364]
  L3_365 = A1_363.ObjectVar2
  L3_365 = A0_362[L3_365]
  GetTable(A0_362, A1_363.DestVarTable, true)[A1_363.DestVar] = DistanceBetweenObjectBounds(L2_364, L3_365)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_366, A1_367)
  local L2_368, L3_369, L4_370
  L2_368 = A1_367.ObjectVar
  L2_368 = A0_366[L2_368]
  L3_369 = GetTable
  L4_370 = A0_366
  L3_369 = L3_369(L4_370, A1_367.PointVarTable, true)
  L4_370 = A1_367.PointVar
  L4_370 = L3_369[L4_370]
  GetTable(A0_366, A1_367.DestVarTable, true)[A1_367.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_368, L4_370)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_371, A1_372)
  local L2_373, L3_374
  L2_373 = GetParam
  L3_374 = "Point1"
  L2_373 = L2_373(L3_374, A0_371, A1_372)
  L3_374 = GetParam
  L3_374 = L3_374("Point2", A0_371, A1_372)
  GetTable(A0_371, A1_372.DestVarTable, true)[A1_372.DestVar] = DistanceBetweenPoints(L2_373, L3_374)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_375, A1_376, A2_377)
  local L3_378, L4_379, L5_380, L6_381, L7_382, L8_383
  L5_380 = 0
  L6_381 = nil
  L7_382 = A1_376.ObjectDistanceType
  L8_383 = A1_376.ObjectVar1
  L3_378 = A0_375[L8_383]
  L8_383 = A1_376.ObjectVar2
  L4_379 = A0_375[L8_383]
  if nil == L4_379 then
    L8_383 = A1_376.Point2Var
    if nil ~= L8_383 then
      L8_383 = GetTable
      L8_383 = L8_383(A0_375, A1_376.Point2VarTable, true)
      L4_379 = L8_383[A1_376.Point2Var]
      L5_380 = L5_380 + 1
    end
  end
  if nil == L3_378 then
    L8_383 = A1_376.Point1Var
    if nil ~= L8_383 then
      L8_383 = GetTable
      L8_383 = L8_383(A0_375, A1_376.Point1VarTable, true)
      L3_378 = L8_383[A1_376.Point1Var]
      L5_380 = L5_380 + 1
      if 1 == L5_380 then
        L3_378, L4_379 = L4_379, L3_378
      end
    end
  end
  if nil ~= L7_382 then
    if 0 == L5_380 then
      L8_383 = OBJECT_CENTER
      if L8_383 == L7_382 then
        L6_381 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_383 = OBJECT_BOUNDARY
        if L8_383 == L7_382 then
          L6_381 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_383 = A1_376.OwnerVar
          L8_383 = A0_375[L8_383]
          Say(L8_383, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_380 then
      L8_383 = OBJECT_CENTER
      if L8_383 == L7_382 then
        L6_381 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_383 = OBJECT_BOUNDARY
        if L8_383 == L7_382 then
          L6_381 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_383 = A1_376.OwnerVar
          L8_383 = A0_375[L8_383]
          Say(L8_383, "invalid object distance type", 0)
        end
      end
    else
      L6_381 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_383 = A1_376.Distance
  if A1_376.DistanceVar ~= nil and GetTable(A0_375, A1_376.DistanceVarTable, true) ~= nil then
    L8_383 = L8_383 + GetTable(A0_375, A1_376.DistanceVarTable, true)[A1_376.DistanceVar]
  end
  if L3_378 ~= nil and L4_379 ~= nil and L6_381 ~= nil and L8_383 ~= nil then
    if not L6_381(L3_378, L4_379, L8_383) then
      ExecuteBuildingBlocks(A2_377, A0_375)
      A0_375.LastIfSucceeded = true
    else
      A0_375.LastIfSucceeded = false
    end
  else
    A0_375.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_384, A1_385)
  local L2_386, L3_387
  L2_386 = A1_385.TargetVar
  L2_386 = A0_384[L2_386]
  L3_387 = A1_385.CasterVar
  L3_387 = A0_384[L3_387]
  GetTable(A0_384, A1_385.DestVarTable, true)[A1_385.DestVar] = SpellBuffCount(L2_386, A1_385.BuffName, L3_387)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_388, A1_389)
  local L2_390
  L2_390 = A1_389.TargetVar
  L2_390 = A0_388[L2_390]
  GetTable(A0_388, A1_389.DestVarTable, true)[A1_389.DestVar] = SpellBuffCount(L2_390, A1_389.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_391, A1_392)
  local L2_393, L3_394
  L2_393 = GetTable
  L3_394 = A0_391
  L2_393 = L2_393(L3_394, A1_392.ScaleVarTable, false)
  L3_394 = nil
  if A1_392.OwnerVar ~= nil then
    L3_394 = A0_391[A1_392.OwnerVar]
  else
    L3_394 = A0_391.Owner
  end
  if A1_392.ScaleVar ~= nil and A1_392.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_393[A1_392.ScaleVar], L3_394)
  else
    SetScaleSkinCoef(A1_392.Scale, L3_394)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_395, A1_396)
  SpellBuffAdd(A0_395[A1_396.TargetVar], A0_395[A1_396.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_395.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_397, A1_398, A2_399)
  local L3_400, L4_401
  L3_400 = A1_398.TargetVar
  L3_400 = A0_397[L3_400]
  L4_401 = A1_398.NumStacks
  if GetParam("NumStacks", A0_397, A1_398) == 0 then
    L4_401 = SpellBuffCount(L3_400, A1_398.BuffName, caster)
  else
    L4_401 = GetParam("NumStacks", A0_397, A1_398)
  end
  while L4_401 > 0 do
    SpellBuffRemove(L3_400, A1_398.BuffName, A0_397[A1_398.AttackerVar])
    L4_401 = L4_401 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_402, A1_403, A2_404)
  if A0_402.EmoteId == A1_403.EmoteId then
    ExecuteBuildingBlocks(A2_404, A0_402)
    A0_402.LastIfSucceeded = true
  else
    A0_402.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_405, A1_406, A2_407)
  if A0_405.EmoteId ~= A1_406.EmoteId then
    ExecuteBuildingBlocks(A2_407, A0_405)
    A0_405.LastIfSucceeded = true
  else
    A0_405.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_408, A1_409)
  local L2_410, L3_411, L4_412, L5_413
  L2_410 = GetTable
  L3_411 = A0_408
  L4_412 = A1_409.String1VarTable
  L5_413 = false
  L2_410 = L2_410(L3_411, L4_412, L5_413)
  L3_411 = A1_409.String1Var
  L3_411 = L2_410[L3_411]
  L4_412 = GetTable
  L5_413 = A0_408
  L4_412 = L4_412(L5_413, A1_409.String2VarTable, false)
  L5_413 = A1_409.String2Var
  L5_413 = L4_412[L5_413]
  GetTable(A0_408, A1_409.ResultVarTable, false)[A1_409.ResultVar] = L3_411 .. L5_413
end
BBConcatenateStrings = L0_0
