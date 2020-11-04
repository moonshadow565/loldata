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
  if A1_280.TargetVar ~= nil then
    GetTable(A0_279, A1_280.DestVarTable, false)[A1_280.DestVar] = A1_280.Stat(A0_279[A1_280.TargetVar])
  else
    GetTable(A0_279, A1_280.DestVarTable, false)[A1_280.DestVar] = A1_280.Stat()
  end
end
BBGetStat = L0_0
function L0_0(A0_281, A1_282)
  if A1_282.TargetVar ~= nil then
    GetTable(A0_281, A1_282.DestVarTable, false)[A1_282.DestVar] = GetLevel(A0_281[A1_282.TargetVar])
  else
    GetTable(A0_281, A1_282.DestVarTable, false)[A1_282.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_283, A1_284)
  if A1_284.TargetVar ~= nil then
    GetTable(A0_283, A1_284.DestVarTable, false)[A1_284.DestVar] = GetUnitSignificance(A0_283[A1_284.TargetVar])
  else
    GetTable(A0_283, A1_284.DestVarTable, false)[A1_284.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_285, A1_286)
  if A1_286.TargetVar ~= nil then
    GetTable(A0_285, A1_286.DestVarTable, false)[A1_286.DestVar] = GetArmor(A0_285[A1_286.TargetVar])
  else
    GetTable(A0_285, A1_286.DestVarTable, false)[A1_286.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_287, A1_288)
  if A1_288.TargetVar ~= nil then
    GetTable(A0_287, A1_288.DestVarTable, false)[A1_288.DestVar] = GetSpellBlock(A0_287[A1_288.TargetVar])
  else
    GetTable(A0_287, A1_288.DestVarTable, false)[A1_288.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_289, A1_290)
  if A1_290.TargetVar ~= nil then
    GetTable(A0_289, A1_290.DestVarTable, false)[A1_290.DestVar] = GetTeamID(A0_289[A1_290.TargetVar])
  else
    GetTable(A0_289, A1_290.DestVarTable, false)[A1_290.DestVar] = GetTeamID()
  end
end
BBGetTeamID = L0_0
function L0_0(A0_291, A1_292)
  local L2_293, L3_294, L4_295
  L2_293 = GetTable
  L3_294 = A0_291
  L4_295 = A1_292.DestVarTable
  L2_293 = L2_293(L3_294, L4_295, false)
  L3_294 = A1_292.TargetVar
  L4_295 = nil
  if L3_294 ~= nil then
    L4_295 = GetTeamID(A0_291[L3_294])
  else
    L4_295 = GetTeamID()
  end
  if L4_295 == TEAM_ORDER then
    L2_293[A1_292.DestVar] = TEAM_CHAOS
  elseif L4_295 == TEAM_CHAOS then
    L2_293[A1_292.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_296, A1_297)
  if A1_297.TargetVar ~= nil then
    GetTable(A0_296, A1_297.DestVarTable, false)[A1_297.DestVar] = GetUnitSkinName(A0_296[A1_297.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_298, A1_299)
  if A1_299.TargetVar ~= nil then
    GetTable(A0_298, A1_299.DestVarTable, false)[A1_299.DestVar] = GetTotalAttackDamage(A0_298[A1_299.TargetVar])
  else
    GetTable(A0_298, A1_299.DestVarTable, false)[A1_299.DestVar] = GetTotalAttackDamage()
  end
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_300, A1_301)
  GetTable(A0_300, A1_301.DestVarTable, true)[A1_301.DestVar] = A1_301.Status(A0_300[A1_301.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_302, A1_303)
  local L2_304
  L2_304 = A1_303.TargetVar
  L2_304 = A0_302[L2_304]
  ClearAttackTarget(L2_304)
end
BBClearAttackTarget = L0_0
function L0_0(A0_305, A1_306)
  GetTable(A0_305, A1_306.DestVarTable, true)[A1_306.DestVar] = A1_306.Info(A0_305[A1_306.TargetVar])
end
BBGetCastInfo = L0_0
function L0_0(A0_307, A1_308, A2_309)
  local L3_310, L4_311, L5_312, L6_313
  L3_310 = GetTable
  L4_311 = A0_307
  L5_312 = A1_308.TrackTimeVarTable
  L6_313 = false
  L3_310 = L3_310(L4_311, L5_312, L6_313)
  L4_311 = GetTime
  L4_311 = L4_311()
  L5_312 = A1_308.ExecuteImmediately
  L6_313 = A1_308.TimeBetweenExecutions
  if A1_308.TickTimeVar ~= nil and GetTable(A0_307, A1_308.TickTimeVarTable, false)[A1_308.TickTimeVar] ~= nil then
    L6_313 = GetTable(A0_307, A1_308.TickTimeVarTable, false)[A1_308.TickTimeVar]
  end
  if L3_310[A1_308.TrackTimeVar] == nil then
    L3_310[A1_308.TrackTimeVar] = L4_311
    if L5_312 == true then
      ExecuteBuildingBlocks(A2_309, A0_307)
    end
  end
  if L4_311 >= L3_310[A1_308.TrackTimeVar] + L6_313 then
    L3_310[A1_308.TrackTimeVar] = L3_310[A1_308.TrackTimeVar] + L6_313
    ExecuteBuildingBlocks(A2_309, A0_307)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_314, A1_315, A2_316)
  GetTable(A0_314, A1_315.TrackTimeVarTable, false)[A1_315.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_317, A1_318)
  local L2_319
  L2_319 = A1_318.SrcValue
  if A1_318.SrcVar ~= nil then
    L2_319 = GetTable(A0_317, A1_318.SrcVarTable, true)[A1_318.SrcVar]
  end
  A1_318.Status(A0_317[A1_318.TargetVar], L2_319)
end
BBSetStatus = L0_0
function L0_0(A0_320, A1_321)
  local L2_322
  L2_322 = A1_321.ToAlert
  if GetTable(A0_320, A1_321.SrcVarTable, false) ~= nil and A1_321.SrcVar ~= nil then
    L2_322 = L2_322 .. GetTable(A0_320, A1_321.SrcVarTable, false)[A1_321.SrcVar]
  end
  _ALERT(L2_322)
end
BBAlert = L0_0
function L0_0(A0_323, A1_324)
  local L2_325, L3_326, L4_327
  L2_325 = A1_324.ToSay
  L3_326 = GetTable
  L4_327 = A0_323
  L3_326 = L3_326(L4_327, A1_324.SrcVarTable, false)
  if L3_326 ~= nil then
    L4_327 = A1_324.SrcVar
    if L4_327 ~= nil then
      L4_327 = L2_325
      L2_325 = L4_327 .. tostring(L3_326[A1_324.SrcVar])
    end
  end
  L4_327 = nil
  if A1_324.OwnerVar ~= nil then
    L4_327 = A0_323[A1_324.OwnerVar]
  else
    L4_327 = A0_323.Owner
  end
  if A1_324.TextType == nil then
    A1_324.TextType = 0
  end
  Say(L4_327, L2_325, A1_324.TextType)
end
BBSay = L0_0
function L0_0(A0_328, A1_329)
  local L2_330, L3_331, L4_332
  L2_330 = A1_329.ToSay
  L3_331 = GetTable
  L4_332 = A0_328
  L3_331 = L3_331(L4_332, A1_329.SrcVarTable, false)
  if L3_331 ~= nil then
    L4_332 = A1_329.SrcVar
    if L4_332 ~= nil then
      L4_332 = L2_330
      L2_330 = L4_332 .. tostring(L3_331[A1_329.SrcVar])
    end
  end
  L4_332 = nil
  if A1_329.OwnerVar ~= nil then
    L4_332 = A0_328[A1_329.OwnerVar]
  else
    L4_332 = A0_328.Owner
  end
  if A1_329.TextType == nil then
    A1_329.TextType = 0
  end
  Say(L4_332, L2_330, A1_329.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_333, A1_334)
  GetTable(A0_333, A1_334.DestVarTable, true)[A1_334.DestVar] = BBLuaGetGold(A0_333, A1_334)
end
BBGetGold = L0_0
function L0_0(A0_335, A1_336)
  GetTable(A0_335, A1_336.DestVarTable, true)[A1_336.DestVar] = BBLuaGetTotalGold(A0_335, A1_336)
end
BBGetTotalGold = L0_0
function L0_0(A0_337, A1_338)
  SpellBuffAdd(A0_337[A1_338.OwnerVar], A0_337[A1_338.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_337.NextBuffVars)
  BBTeleportToPositionHelper(A0_337, A1_338)
end
BBTeleportToPosition = L0_0
function L0_0(A0_339, A1_340)
  if A1_340.XVar ~= nil and GetTable(A0_339, A1_340.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_339, A1_340.XVarTable, true)[A1_340.XVar]
  else
    Xloc = A1_340.X
  end
  if A1_340.YVar ~= nil and GetTable(A0_339, A1_340.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_339, A1_340.YVarTable, true)[A1_340.YVar]
  else
    Yloc = A1_340.Y
  end
  if A1_340.ZVar ~= nil and GetTable(A0_339, A1_340.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_339, A1_340.ZVarTable, true)[A1_340.ZVar]
  else
    Zloc = A1_340.Z
  end
  A1_340.OwnerVar, A0_339.position = A1_340.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_340.CastPositionName = "position"
  BBTeleportToPosition(A0_339, A1_340)
end
BBTeleportToPoint = L0_0
function L0_0(A0_341, A1_342)
  DefUpdateAura(GetTable(A0_341, A1_342.CenterTable, false)[A1_342.CenterVar], A1_342.Range, A1_342.UnitScan, A1_342.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_343, A1_344)
  ReincarnateNonDeadHero(GetTable(A0_343, A1_344.TargetTable, false)[A1_344.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_345, A1_346)
  GetTable(A0_345, A1_346.DestVarTable, true)[A1_346.DestVar] = A1_346.Function(A0_345[A1_346.OwnerVar], A1_346.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_347, A1_348)
  local L2_349, L3_350, L4_351, L5_352
  L2_349 = A1_348.WhomToOrderVar
  L2_349 = A0_347[L2_349]
  L3_350 = A1_348.TargetOfOrderVar
  L3_350 = A0_347[L3_350]
  L4_351 = GetTable
  L5_352 = A0_347
  L4_351 = L4_351(L5_352, A1_348.SrcVarTable, false)
  L5_352 = nil
  if A1_348.SrcVar ~= nil and L4_351 ~= nil then
    L5_352 = L4_351[A1_348.SrcVar]
  else
    L5_352 = GetPosition(L3_350)
  end
  if L3_350 == nil then
    L3_350 = L2_349
  end
  IssueOrder(L2_349, A1_348.Order, L5_352, L3_350)
end
BBIssueOrder = L0_0
function L0_0(A0_353, A1_354)
  local L2_355
  L2_355 = GetParam
  L2_355 = L2_355("NewRange", A0_353, A1_354)
  SetSpellCastRange(L2_355)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_356, A1_357)
  GetTable(A0_356, A1_357.DestVarTable, true)[A1_357.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_358, A1_359)
  local L2_360, L3_361
  L2_360 = A1_359.ObjectVar1
  L2_360 = A0_358[L2_360]
  L3_361 = A1_359.ObjectVar2
  L3_361 = A0_358[L3_361]
  GetTable(A0_358, A1_359.DestVarTable, true)[A1_359.DestVar] = DistanceBetweenObjectBounds(L2_360, L3_361)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_362, A1_363)
  local L2_364, L3_365, L4_366
  L2_364 = A1_363.ObjectVar
  L2_364 = A0_362[L2_364]
  L3_365 = GetTable
  L4_366 = A0_362
  L3_365 = L3_365(L4_366, A1_363.PointVarTable, true)
  L4_366 = A1_363.PointVar
  L4_366 = L3_365[L4_366]
  GetTable(A0_362, A1_363.DestVarTable, true)[A1_363.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_364, L4_366)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_367, A1_368)
  local L2_369, L3_370
  L2_369 = GetParam
  L3_370 = "Point1"
  L2_369 = L2_369(L3_370, A0_367, A1_368)
  L3_370 = GetParam
  L3_370 = L3_370("Point2", A0_367, A1_368)
  GetTable(A0_367, A1_368.DestVarTable, true)[A1_368.DestVar] = DistanceBetweenPoints(L2_369, L3_370)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_371, A1_372, A2_373)
  local L3_374, L4_375, L5_376, L6_377, L7_378, L8_379
  L5_376 = 0
  L6_377 = nil
  L7_378 = A1_372.ObjectDistanceType
  L8_379 = A1_372.ObjectVar1
  L3_374 = A0_371[L8_379]
  L8_379 = A1_372.ObjectVar2
  L4_375 = A0_371[L8_379]
  if nil == L4_375 then
    L8_379 = A1_372.Point2Var
    if nil ~= L8_379 then
      L8_379 = GetTable
      L8_379 = L8_379(A0_371, A1_372.Point2VarTable, true)
      L4_375 = L8_379[A1_372.Point2Var]
      L5_376 = L5_376 + 1
    end
  end
  if nil == L3_374 then
    L8_379 = A1_372.Point1Var
    if nil ~= L8_379 then
      L8_379 = GetTable
      L8_379 = L8_379(A0_371, A1_372.Point1VarTable, true)
      L3_374 = L8_379[A1_372.Point1Var]
      L5_376 = L5_376 + 1
      if 1 == L5_376 then
        L3_374, L4_375 = L4_375, L3_374
      end
    end
  end
  if nil ~= L7_378 then
    if 0 == L5_376 then
      L8_379 = OBJECT_CENTER
      if L8_379 == L7_378 then
        L6_377 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_379 = OBJECT_BOUNDARY
        if L8_379 == L7_378 then
          L6_377 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_379 = A1_372.OwnerVar
          L8_379 = A0_371[L8_379]
          Say(L8_379, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_376 then
      L8_379 = OBJECT_CENTER
      if L8_379 == L7_378 then
        L6_377 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_379 = OBJECT_BOUNDARY
        if L8_379 == L7_378 then
          L6_377 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_379 = A1_372.OwnerVar
          L8_379 = A0_371[L8_379]
          Say(L8_379, "invalid object distance type", 0)
        end
      end
    else
      L6_377 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_379 = A1_372.Distance
  if A1_372.DistanceVar ~= nil and GetTable(A0_371, A1_372.DistanceVarTable, true) ~= nil then
    L8_379 = L8_379 + GetTable(A0_371, A1_372.DistanceVarTable, true)[A1_372.DistanceVar]
  end
  if L3_374 ~= nil and L4_375 ~= nil and L6_377 ~= nil and L8_379 ~= nil then
    if not L6_377(L3_374, L4_375, L8_379) then
      ExecuteBuildingBlocks(A2_373, A0_371)
      A0_371.LastIfSucceeded = true
    else
      A0_371.LastIfSucceeded = false
    end
  else
    A0_371.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_380, A1_381)
  local L2_382, L3_383
  L2_382 = A1_381.TargetVar
  L2_382 = A0_380[L2_382]
  L3_383 = A1_381.CasterVar
  L3_383 = A0_380[L3_383]
  GetTable(A0_380, A1_381.DestVarTable, true)[A1_381.DestVar] = SpellBuffCount(L2_382, A1_381.BuffName, L3_383)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_384, A1_385)
  local L2_386
  L2_386 = A1_385.TargetVar
  L2_386 = A0_384[L2_386]
  GetTable(A0_384, A1_385.DestVarTable, true)[A1_385.DestVar] = SpellBuffCount(L2_386, A1_385.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_387, A1_388)
  local L2_389, L3_390
  L2_389 = GetTable
  L3_390 = A0_387
  L2_389 = L2_389(L3_390, A1_388.ScaleVarTable, false)
  L3_390 = nil
  if A1_388.OwnerVar ~= nil then
    L3_390 = A0_387[A1_388.OwnerVar]
  else
    L3_390 = A0_387.Owner
  end
  if A1_388.ScaleVar ~= nil and A1_388.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_389[A1_388.ScaleVar], L3_390)
  else
    SetScaleSkinCoef(A1_388.Scale, L3_390)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_391, A1_392)
  SpellBuffAdd(A0_391[A1_392.TargetVar], A0_391[A1_392.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_391.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_393, A1_394, A2_395)
  local L3_396, L4_397
  L3_396 = A1_394.TargetVar
  L3_396 = A0_393[L3_396]
  L4_397 = A1_394.NumStacks
  if GetParam("NumStacks", A0_393, A1_394) == 0 then
    L4_397 = SpellBuffCount(L3_396, A1_394.BuffName, caster)
  else
    L4_397 = GetParam("NumStacks", A0_393, A1_394)
  end
  while L4_397 > 0 do
    SpellBuffRemove(L3_396, A1_394.BuffName, A0_393[A1_394.AttackerVar])
    L4_397 = L4_397 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_398, A1_399, A2_400)
  if A0_398.EmoteId == A1_399.EmoteId then
    ExecuteBuildingBlocks(A2_400, A0_398)
    A0_398.LastIfSucceeded = true
  else
    A0_398.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_401, A1_402, A2_403)
  if A0_401.EmoteId ~= A1_402.EmoteId then
    ExecuteBuildingBlocks(A2_403, A0_401)
    A0_401.LastIfSucceeded = true
  else
    A0_401.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_404, A1_405)
  local L2_406, L3_407, L4_408, L5_409
  L2_406 = GetTable
  L3_407 = A0_404
  L4_408 = A1_405.String1VarTable
  L5_409 = false
  L2_406 = L2_406(L3_407, L4_408, L5_409)
  L3_407 = A1_405.String1Var
  L3_407 = L2_406[L3_407]
  L4_408 = GetTable
  L5_409 = A0_404
  L4_408 = L4_408(L5_409, A1_405.String2VarTable, false)
  L5_409 = A1_405.String2Var
  L5_409 = L4_408[L5_409]
  GetTable(A0_404, A1_405.ResultVarTable, false)[A1_405.ResultVar] = L3_407 .. L5_409
end
BBConcatenateStrings = L0_0
