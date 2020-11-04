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
function L0_0(A0_150)
  local L1_151
  L1_151 = A0_150 ~= nil
  return L1_151
end
CO_IS_NOT_NIL = L0_0
function L0_0(A0_152, A1_153, A2_154)
  local L3_155, L4_156, L5_157, L6_158
  L3_155 = GetTable
  L4_156 = A0_152
  L5_157 = A1_153.Src1VarTable
  L6_158 = false
  L3_155 = L3_155(L4_156, L5_157, L6_158)
  L4_156 = GetTable
  L5_157 = A0_152
  L6_158 = A1_153.Src2VarTable
  L4_156 = L4_156(L5_157, L6_158, false)
  L5_157 = false
  L6_158 = nil
  if L3_155 ~= nil and A1_153.Src1Var ~= nil then
    L6_158 = L3_155[A1_153.Src1Var]
  else
    L6_158 = A1_153.Value1
  end
  if L4_156 ~= nil and A1_153.Src2Var ~= nil then
    L5_157 = A1_153.CompareOp(L6_158, L4_156[A1_153.Src2Var])
  else
    L5_157 = A1_153.CompareOp(L6_158, A1_153.Value2)
  end
  if L5_157 then
    ExecuteBuildingBlocks(A2_154, A0_152)
    A0_152.LastIfSucceeded = true
  else
    A0_152.LastIfSucceeded = false
  end
end
BBIf = L0_0
function L0_0(A0_159, A1_160, A2_161)
  if A0_159.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_161, A0_159)
    A0_159.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_162, A1_163, A2_164)
  local L3_165, L4_166, L5_167, L6_168
  L3_165 = A0_162.LastIfSucceeded
  if L3_165 == false then
    L3_165 = GetTable
    L4_166 = A0_162
    L5_167 = A1_163.Src1VarTable
    L6_168 = false
    L3_165 = L3_165(L4_166, L5_167, L6_168)
    L4_166 = GetTable
    L5_167 = A0_162
    L6_168 = A1_163.Src2VarTable
    L4_166 = L4_166(L5_167, L6_168, false)
    L5_167 = false
    L6_168 = nil
    if L3_165 ~= nil and A1_163.Src1Var ~= nil then
      L6_168 = L3_165[A1_163.Src1Var]
    else
      L6_168 = A1_163.Value1
    end
    if L4_166 ~= nil and A1_163.Src2Var ~= nil then
      L5_167 = A1_163.CompareOp(L6_168, L4_166[A1_163.Src2Var])
    else
      L5_167 = A1_163.CompareOp(L6_168, A1_163.Value2)
    end
    if L5_167 then
      ExecuteBuildingBlocks(A2_164, A0_162)
      A0_162.LastIfSucceeded = true
    else
      A0_162.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_169, A1_170, A2_171)
  local L3_172
  if A1_170.TargetVar ~= nil then
    L3_172 = A0_169[A1_170.TargetVar]
  else
    L3_172 = A0_169.Target
  end
  if HasBuffOfType(L3_172, A1_170.BuffType) then
    ExecuteBuildingBlocks(A2_171, A0_169)
    A0_169.LastIfSucceeded = true
  else
    A0_169.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_173, A1_174, A2_175)
  local L3_176, L4_177
  if A1_174.OwnerVar ~= nil then
    L3_176 = A0_173[A1_174.OwnerVar]
  else
    L3_176 = A0_173.Owner
  end
  if A1_174.AttackerVar ~= nil then
    L4_177 = A0_173[A1_174.AttackerVar]
  else
    L4_177 = A0_173.Attacker
  end
  if SpellBuffCount(L3_176, A1_174.BuffName, L4_177) > 0 then
    ExecuteBuildingBlocks(A2_175, A0_173)
    A0_173.LastIfSucceeded = true
  else
    A0_173.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_178, A1_179, A2_180)
  if BBIsMissileAutoAttack(A0_178, A1_179) then
    ExecuteBuildingBlocks(A2_180, A0_178)
    A0_178.LastIfSucceeded = true
  else
    A0_178.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_181, A1_182)
  A0_181.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_183, A1_184, A2_185)
  local L3_186, L4_187
  if A1_184.OwnerVar ~= nil then
    L3_186 = A0_183[A1_184.OwnerVar]
  else
    L3_186 = A0_183.Owner
  end
  if A1_184.CasterVar ~= nil then
    L4_187 = A0_183[A1_184.CasterVar]
  else
    L4_187 = A0_183.Caster
  end
  if SpellBuffCount(L3_186, A1_184.BuffName, L4_187) <= 0 then
    ExecuteBuildingBlocks(A2_185, A0_183)
    A0_183.LastIfSucceeded = true
  else
    A0_183.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_188, A1_189, A2_190)
  local L3_191, L4_192
  if A1_189.OwnerVar ~= nil then
    L3_191 = A0_188[A1_189.OwnerVar]
  else
    L3_191 = A0_188.Owner
  end
  if HasPARType(L3_191, A1_189.PARType) then
    ExecuteBuildingBlocks(A2_190, A0_188)
    A0_188.LastIfSucceeded = true
  else
    A0_188.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_193, A1_194, A2_195)
  local L3_196, L4_197
  if A1_194.OwnerVar ~= nil then
    L3_196 = A0_193[A1_194.OwnerVar]
  else
    L3_196 = A0_193.Owner
  end
  if not HasPARType(L3_196, A1_194.PARType) then
    ExecuteBuildingBlocks(A2_195, A0_193)
    A0_193.LastIfSucceeded = true
  else
    A0_193.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_198, A1_199, A2_200)
  local L3_201, L4_202, L5_203, L6_204, L7_205
  L3_201 = GetTable
  L4_202 = A0_198
  L5_203 = A1_199.Src1VarTable
  L6_204 = false
  L3_201 = L3_201(L4_202, L5_203, L6_204)
  L4_202 = GetTable
  L5_203 = A0_198
  L6_204 = A1_199.Src2VarTable
  L7_205 = false
  L4_202 = L4_202(L5_203, L6_204, L7_205)
  L5_203 = true
  while L5_203 do
    L6_204 = false
    L7_205 = nil
    if L3_201 ~= nil and A1_199.Src1Var ~= nil then
      L7_205 = L3_201[A1_199.Src1Var]
    else
      L7_205 = A1_199.Value1
    end
    if L4_202 ~= nil and A1_199.Src2Var ~= nil then
      L6_204 = A1_199.CompareOp(L7_205, L4_202[A1_199.Src2Var])
    else
      L6_204 = A1_199.CompareOp(L7_205, A1_199.Value2)
    end
    if L6_204 then
      ExecuteBuildingBlocks(A2_200, A0_198)
    else
      L5_203 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_206, A1_207)
  return A0_206 * A1_207
end
MO_MULTIPLY = L0_0
function L0_0(A0_208, A1_209)
  return A0_208 + A1_209
end
MO_ADD = L0_0
function L0_0(A0_210, A1_211)
  return A0_210 - A1_211
end
MO_SUBTRACT = L0_0
function L0_0(A0_212, A1_213)
  return A0_212 / A1_213
end
MO_DIVIDE = L0_0
function L0_0(A0_214, A1_215)
  if A0_214 < A1_215 then
    return A0_214
  else
    return A1_215
  end
end
MO_MIN = L0_0
function L0_0(A0_216, A1_217)
  if A1_217 < A0_216 then
    return A0_216
  else
    return A1_217
  end
end
MO_MAX = L0_0
function L0_0(A0_218, A1_219)
  return A0_218 % A1_219
end
MO_MODULO = L0_0
function L0_0(A0_220)
  return math.floor(A0_220 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_221)
  return math.ceil(A0_221)
end
MO_ROUNDUP = L0_0
function L0_0(A0_222)
  return math.floor(A0_222)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_223)
  return math.sin(math.rad(A0_223))
end
MO_SIN = L0_0
function L0_0(A0_224)
  return math.cos(math.rad(A0_224))
end
MO_COSINE = L0_0
function L0_0(A0_225)
  return math.tan(math.rad(A0_225))
end
MO_TANGENT = L0_0
function L0_0(A0_226)
  return math.deg(math.asin(A0_226))
end
MO_ASIN = L0_0
function L0_0(A0_227)
  return math.deg(math.acos(A0_227))
end
MO_ACOS = L0_0
function L0_0(A0_228)
  return math.deg(math.atan(A0_228))
end
MO_ATAN = L0_0
function L0_0(A0_229, A1_230)
  return math.pow(A0_229, A1_230)
end
MO_POW = L0_0
function L0_0(A0_231)
  return math.sqrt(A0_231)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_232, A1_233)
  local L2_234
  L2_234 = A0_232 and A1_233
  return L2_234
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_235, A1_236)
  local L2_237
  L2_237 = A0_235 or A1_236
  return L2_237
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_238)
  local L1_239
  L1_239 = not A0_238
  return L1_239
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_240)
  return math.abs(A0_240)
end
MO_ABS = L0_0
function L0_0(A0_241, A1_242)
  return math.random(A0_241, A1_242)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_243, A1_244)
  local L2_245, L3_246
  L2_245 = GetMathNumber
  L3_246 = A0_243
  L2_245 = L2_245(L3_246, A1_244.Src1VarTable, A1_244.Src1Var, A1_244.Src1Value)
  L3_246 = GetMathNumber
  L3_246 = L3_246(A0_243, A1_244.Src2VarTable, A1_244.Src2Var, A1_244.Src2Value)
  GetTable(A0_243, A1_244.DestVarTable)[A1_244.DestVar] = A1_244.MathOp(L2_245, L3_246)
end
BBMath = L0_0
function L0_0(A0_247, A1_248, A2_249, A3_250)
  if A2_249 ~= nil and GetTable(A0_247, A1_248)[A2_249] ~= nil then
    return GetTable(A0_247, A1_248)[A2_249]
  end
  return A3_250
end
GetMathNumber = L0_0
function L0_0(A0_251, A1_252)
  if type(A1_252) == "number" then
    return A1_252
  elseif type(A1_252) == "function" then
    return A1_252(A0_251)
  elseif type(A1_252) == "string" then
    return A0_251[A1_252]
  end
end
GetNumber = L0_0
function L0_0(A0_253, A1_254)
  return VectorAdd(A0_253, A1_254)
end
VEC_ADD = L0_0
function L0_0(A0_255, A1_256)
  return VectorSubtract(A0_255, A1_256)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_257, A1_258)
  return VectorScalarMultiply(A0_257, A1_258)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_259, A1_260)
  return VectorScalarDivide(A0_259, A1_260)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_261, A1_262)
  return VectorRotateY(A0_261, A1_262)
end
VEC_ROTATE = L0_0
function L0_0(A0_263, A1_264)
  BBMath(A0_263, A1_264)
end
BBVectorMath = L0_0
function L0_0(A0_265, A1_266)
  local L2_267, L3_268, L4_269, L5_270
  L2_267 = A0_265.InstanceVars
  L3_268 = L2_267.InterpDelta
  if L3_268 == nil then
    L3_268 = A1_266.Amount
    L4_269 = A1_266.AmountVar
    if L4_269 ~= nil then
      L4_269 = GetTable
      L5_270 = A0_265
      L4_269 = L4_269(L5_270, A1_266.AmountVarTable)
      L5_270 = A1_266.AmountVar
      L3_268 = L4_269[L5_270]
    end
    L4_269 = GetPosition
    L5_270 = A1_266.TargetVar
    L5_270 = A0_265[L5_270]
    L4_269 = L4_269(L5_270)
    L2_267.KnockBackStart = L4_269
    L4_269 = GetNormalizedPositionDelta
    L5_270 = A1_266.TargetVar
    L5_270 = A0_265[L5_270]
    L4_269 = L4_269(L5_270, A0_265[A1_266.AttackerVar], true)
    L5_270 = {}
    L5_270.x = L4_269.x * L3_268
    L5_270.y = 0
    L5_270.z = L4_269.z * L3_268
    L2_267.InterpDelta = L5_270
    L5_270 = GetTime
    L5_270 = L5_270()
    L2_267.StartTime = L5_270
    L5_270 = A1_266.KnockBackDuration
    L2_267.KnockBackDuration = L5_270
  end
  L3_268 = A1_266.TargetVar
  L3_268 = A0_265[L3_268]
  L4_269 = GetTime
  L4_269 = L4_269()
  L5_270 = L2_267.StartTime
  L4_269 = L4_269 - L5_270
  L5_270 = L2_267.KnockBackDuration
  L4_269 = L4_269 / L5_270
  L5_270 = {}
  L5_270.x = L2_267.KnockBackStart.x + L2_267.InterpDelta.x * L4_269
  L5_270.y = L2_267.KnockBackStart.y
  L5_270.z = L2_267.KnockBackStart.z + L2_267.InterpDelta.z * L4_269
  SetPosition(L3_268, L5_270)
end
BBKnockback = L0_0
function L0_0(A0_271, A1_272)
  local L2_273, L3_274
  L2_273 = GetParam
  L3_274 = "Left"
  L2_273 = L2_273(L3_274, A0_271, A1_272)
  L3_274 = GetParam
  L3_274 = L3_274("Right", A0_271, A1_272)
  GetTable(A0_271, A1_272.DestVarTable, true)[A1_272.DestVar] = tostring(L2_273) .. tostring(L3_274)
end
BBAppendString = L0_0
function L0_0(A0_275, A1_276)
  local L2_277
  L2_277 = 0
  if A1_276.Delta ~= nil then
    L2_277 = L2_277 + A1_276.Delta
  end
  if A1_276.DeltaByLevel ~= nil and A0_275.Level ~= nil then
    L2_277 = L2_277 + A1_276.DeltaByLevel[A0_275.Level]
  end
  if A1_276.DeltaVar ~= nil then
    L2_277 = L2_277 + GetTable(A0_275, A1_276.DeltaVarTable, true)[A1_276.DeltaVar]
  end
  if A1_276.TargetVar ~= nil then
    A1_276.Stat(L2_277, A0_275[A1_276.TargetVar])
  else
    A1_276.Stat(L2_277)
  end
end
BBIncStat = L0_0
function L0_0(A0_278, A1_279)
  local L2_280
  L2_280 = 0
  if A1_279.Delta ~= nil then
    L2_280 = L2_280 + A1_279.Delta
  end
  if A1_279.DeltaByLevel ~= nil and A0_278.Level ~= nil then
    L2_280 = L2_280 + A1_279.DeltaByLevel[A0_278.Level]
  end
  if A1_279.DeltaVar ~= nil then
    L2_280 = L2_280 + GetTable(A0_278, A1_279.DeltaVarTable, true)[A1_279.DeltaVar]
  end
  if A1_279.TargetVar ~= nil then
    A1_279.Stat(L2_280, A0_278[A1_279.TargetVar])
  else
    A1_279.Stat(L2_280)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_281, A1_282)
  if A1_282.AttackVar ~= nil then
  end
  if A1_282.Attack ~= nil then
  end
  if A1_282.TotalCoefficientVar ~= nil then
  end
  if A1_282.TotalCoefficient ~= nil then
  end
  if A1_282.TargetVar ~= nil then
    GetTable(A0_281, A1_282.DestVarTable, false)[A1_282.DestVar] = (0 + GetTable(A0_281, A1_282.AttackVarTable, true)[A1_282.AttackVar] + A1_282.Attack) * (2 * (1 + GetPercentCritDamageMod(A0_281[A1_282.TargetVar])) + GetFlatCritDamageMod(A0_281[A1_282.TargetVar])) * (0 + GetTable(A0_281, A1_282.TotalCoefficientVarTable, true)[A1_282.TotalCoefficientVar] + A1_282.TotalCoefficient)
  else
    GetTable(A0_281, A1_282.DestVarTable, false)[A1_282.DestVar] = 2 * A1_282.Attack
  end
end
BBCalculateCriticalDamage = L0_0
function L0_0(A0_283, A1_284)
  if A1_284.CDVar ~= nil then
  end
  if A1_284.CD ~= nil then
  end
  if A1_284.TargetVar ~= nil then
    GetTable(A0_283, A1_284.DestVarTable, false)[A1_284.DestVar] = (0 + GetTable(A0_283, A1_284.CDVarTable, true)[A1_284.CDVar] + A1_284.CD) * (1 + GetPercentCooldownMod(A0_283[A1_284.TargetVar]))
  else
    GetTable(A0_283, A1_284.DestVarTable, false)[A1_284.DestVar] = A1_284.CD
  end
end
BBGetModifiedCooldown = L0_0
function L0_0(A0_285, A1_286)
  if A1_286.TargetVar ~= nil then
    GetTable(A0_285, A1_286.DestVarTable, false)[A1_286.DestVar] = A1_286.Stat(A0_285[A1_286.TargetVar])
  else
    GetTable(A0_285, A1_286.DestVarTable, false)[A1_286.DestVar] = A1_286.Stat()
  end
end
BBGetStat = L0_0
function L0_0(A0_287, A1_288)
  if A1_288.TargetVar ~= nil then
    GetTable(A0_287, A1_288.DestVarTable, false)[A1_288.DestVar] = GetLevel(A0_287[A1_288.TargetVar])
  else
    GetTable(A0_287, A1_288.DestVarTable, false)[A1_288.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_289, A1_290)
  if A1_290.TargetVar ~= nil then
    GetTable(A0_289, A1_290.DestVarTable, false)[A1_290.DestVar] = GetUnitSignificance(A0_289[A1_290.TargetVar])
  else
    GetTable(A0_289, A1_290.DestVarTable, false)[A1_290.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_291, A1_292)
  if A1_292.TargetVar ~= nil then
    GetTable(A0_291, A1_292.DestVarTable, false)[A1_292.DestVar] = GetArmor(A0_291[A1_292.TargetVar])
  else
    GetTable(A0_291, A1_292.DestVarTable, false)[A1_292.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_293, A1_294)
  if A1_294.TargetVar ~= nil then
    GetTable(A0_293, A1_294.DestVarTable, false)[A1_294.DestVar] = GetSpellBlock(A0_293[A1_294.TargetVar])
  else
    GetTable(A0_293, A1_294.DestVarTable, false)[A1_294.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_295, A1_296)
  if A1_296.TargetVar ~= nil then
    GetTable(A0_295, A1_296.DestVarTable, false)[A1_296.DestVar] = GetTeamID(A0_295[A1_296.TargetVar])
  else
    GetTable(A0_295, A1_296.DestVarTable, false)[A1_296.DestVar] = GetTeamID()
  end
end
BBGetTeamID = L0_0
function L0_0(A0_297, A1_298)
  local L2_299, L3_300, L4_301
  L2_299 = GetTable
  L3_300 = A0_297
  L4_301 = A1_298.DestVarTable
  L2_299 = L2_299(L3_300, L4_301, false)
  L3_300 = A1_298.TargetVar
  L4_301 = nil
  if L3_300 ~= nil then
    L4_301 = GetTeamID(A0_297[L3_300])
  else
    L4_301 = GetTeamID()
  end
  if L4_301 == TEAM_ORDER then
    L2_299[A1_298.DestVar] = TEAM_CHAOS
  elseif L4_301 == TEAM_CHAOS then
    L2_299[A1_298.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_302, A1_303)
  if A1_303.TargetVar ~= nil then
    GetTable(A0_302, A1_303.DestVarTable, false)[A1_303.DestVar] = GetUnitSkinName(A0_302[A1_303.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_304, A1_305)
  if A1_305.TargetVar ~= nil then
    GetTable(A0_304, A1_305.DestVarTable, false)[A1_305.DestVar] = GetTotalAttackDamage(A0_304[A1_305.TargetVar])
  else
    GetTable(A0_304, A1_305.DestVarTable, false)[A1_305.DestVar] = GetTotalAttackDamage()
  end
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_306, A1_307)
  GetTable(A0_306, A1_307.DestVarTable, true)[A1_307.DestVar] = A1_307.Status(A0_306[A1_307.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_308, A1_309)
  local L2_310
  L2_310 = A1_309.TargetVar
  L2_310 = A0_308[L2_310]
  ClearAttackTarget(L2_310)
end
BBClearAttackTarget = L0_0
function L0_0(A0_311, A1_312)
  GetTable(A0_311, A1_312.DestVarTable, true)[A1_312.DestVar] = A1_312.Info(A0_311[A1_312.TargetVar])
end
BBGetCastInfo = L0_0
function L0_0(A0_313, A1_314, A2_315)
  local L3_316, L4_317, L5_318, L6_319
  L3_316 = GetTable
  L4_317 = A0_313
  L5_318 = A1_314.TrackTimeVarTable
  L6_319 = false
  L3_316 = L3_316(L4_317, L5_318, L6_319)
  L4_317 = GetTime
  L4_317 = L4_317()
  L5_318 = A1_314.ExecuteImmediately
  L6_319 = A1_314.TimeBetweenExecutions
  if A1_314.TickTimeVar ~= nil and GetTable(A0_313, A1_314.TickTimeVarTable, false)[A1_314.TickTimeVar] ~= nil then
    L6_319 = GetTable(A0_313, A1_314.TickTimeVarTable, false)[A1_314.TickTimeVar]
  end
  if L3_316[A1_314.TrackTimeVar] == nil then
    L3_316[A1_314.TrackTimeVar] = L4_317
    if L5_318 == true then
      ExecuteBuildingBlocks(A2_315, A0_313)
    end
  end
  if L4_317 >= L3_316[A1_314.TrackTimeVar] + L6_319 then
    L3_316[A1_314.TrackTimeVar] = L3_316[A1_314.TrackTimeVar] + L6_319
    ExecuteBuildingBlocks(A2_315, A0_313)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_320, A1_321, A2_322)
  GetTable(A0_320, A1_321.TrackTimeVarTable, false)[A1_321.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_323, A1_324)
  local L2_325
  L2_325 = A1_324.SrcValue
  if A1_324.SrcVar ~= nil then
    L2_325 = GetTable(A0_323, A1_324.SrcVarTable, true)[A1_324.SrcVar]
  end
  A1_324.Status(A0_323[A1_324.TargetVar], L2_325)
end
BBSetStatus = L0_0
function L0_0(A0_326, A1_327)
  local L2_328
  L2_328 = A1_327.ToAlert
  if GetTable(A0_326, A1_327.SrcVarTable, false) ~= nil and A1_327.SrcVar ~= nil then
    L2_328 = L2_328 .. GetTable(A0_326, A1_327.SrcVarTable, false)[A1_327.SrcVar]
  end
  _ALERT(L2_328)
end
BBAlert = L0_0
function L0_0(A0_329, A1_330)
  local L2_331, L3_332, L4_333
  L2_331 = A1_330.ToSay
  L3_332 = GetTable
  L4_333 = A0_329
  L3_332 = L3_332(L4_333, A1_330.SrcVarTable, false)
  if L3_332 ~= nil then
    L4_333 = A1_330.SrcVar
    if L4_333 ~= nil then
      L4_333 = L2_331
      L2_331 = L4_333 .. tostring(L3_332[A1_330.SrcVar])
    end
  end
  L4_333 = nil
  if A1_330.OwnerVar ~= nil then
    L4_333 = A0_329[A1_330.OwnerVar]
  else
    L4_333 = A0_329.Owner
  end
  if A1_330.TextType == nil then
    A1_330.TextType = 0
  end
  Say(L4_333, L2_331, A1_330.TextType)
end
BBSay = L0_0
function L0_0(A0_334, A1_335)
  local L2_336, L3_337, L4_338
  L2_336 = A1_335.ToSay
  L3_337 = GetTable
  L4_338 = A0_334
  L3_337 = L3_337(L4_338, A1_335.SrcVarTable, false)
  if L3_337 ~= nil then
    L4_338 = A1_335.SrcVar
    if L4_338 ~= nil then
      L4_338 = L2_336
      L2_336 = L4_338 .. tostring(L3_337[A1_335.SrcVar])
    end
  end
  L4_338 = nil
  if A1_335.OwnerVar ~= nil then
    L4_338 = A0_334[A1_335.OwnerVar]
  else
    L4_338 = A0_334.Owner
  end
  if A1_335.TextType == nil then
    A1_335.TextType = 0
  end
  Say(L4_338, L2_336, A1_335.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_339, A1_340)
  GetTable(A0_339, A1_340.DestVarTable, true)[A1_340.DestVar] = BBLuaGetGold(A0_339, A1_340)
end
BBGetGold = L0_0
function L0_0(A0_341, A1_342)
  GetTable(A0_341, A1_342.DestVarTable, true)[A1_342.DestVar] = BBLuaGetTotalGold(A0_341, A1_342)
end
BBGetTotalGold = L0_0
function L0_0(A0_343, A1_344)
  SpellBuffAdd(A0_343[A1_344.OwnerVar], A0_343[A1_344.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_343.NextBuffVars)
  BBTeleportToPositionHelper(A0_343, A1_344)
end
BBTeleportToPosition = L0_0
function L0_0(A0_345, A1_346)
  if A1_346.XVar ~= nil and GetTable(A0_345, A1_346.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_345, A1_346.XVarTable, true)[A1_346.XVar]
  else
    Xloc = A1_346.X
  end
  if A1_346.YVar ~= nil and GetTable(A0_345, A1_346.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_345, A1_346.YVarTable, true)[A1_346.YVar]
  else
    Yloc = A1_346.Y
  end
  if A1_346.ZVar ~= nil and GetTable(A0_345, A1_346.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_345, A1_346.ZVarTable, true)[A1_346.ZVar]
  else
    Zloc = A1_346.Z
  end
  A1_346.OwnerVar, A0_345.position = A1_346.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_346.CastPositionName = "position"
  BBTeleportToPosition(A0_345, A1_346)
end
BBTeleportToPoint = L0_0
function L0_0(A0_347, A1_348)
  DefUpdateAura(GetTable(A0_347, A1_348.CenterTable, false)[A1_348.CenterVar], A1_348.Range, A1_348.UnitScan, A1_348.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_349, A1_350)
  ReincarnateNonDeadHero(GetTable(A0_349, A1_350.TargetTable, false)[A1_350.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_351, A1_352)
  GetTable(A0_351, A1_352.DestVarTable, true)[A1_352.DestVar] = A1_352.Function(A0_351[A1_352.OwnerVar], A1_352.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_353, A1_354)
  local L2_355, L3_356, L4_357, L5_358
  L2_355 = A1_354.WhomToOrderVar
  L2_355 = A0_353[L2_355]
  L3_356 = A1_354.TargetOfOrderVar
  L3_356 = A0_353[L3_356]
  L4_357 = GetTable
  L5_358 = A0_353
  L4_357 = L4_357(L5_358, A1_354.SrcVarTable, false)
  L5_358 = nil
  if A1_354.SrcVar ~= nil and L4_357 ~= nil then
    L5_358 = L4_357[A1_354.SrcVar]
  else
    L5_358 = GetPosition(L3_356)
  end
  if L3_356 == nil then
    L3_356 = L2_355
  end
  IssueOrder(L2_355, A1_354.Order, L5_358, L3_356)
end
BBIssueOrder = L0_0
function L0_0(A0_359, A1_360)
  local L2_361
  L2_361 = GetParam
  L2_361 = L2_361("NewRange", A0_359, A1_360)
  SetSpellCastRange(L2_361)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_362, A1_363)
  GetTable(A0_362, A1_363.DestVarTable, true)[A1_363.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_364, A1_365)
  local L2_366, L3_367
  L2_366 = A1_365.ObjectVar1
  L2_366 = A0_364[L2_366]
  L3_367 = A1_365.ObjectVar2
  L3_367 = A0_364[L3_367]
  GetTable(A0_364, A1_365.DestVarTable, true)[A1_365.DestVar] = DistanceBetweenObjectBounds(L2_366, L3_367)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_368, A1_369)
  local L2_370, L3_371, L4_372
  L2_370 = A1_369.ObjectVar
  L2_370 = A0_368[L2_370]
  L3_371 = GetTable
  L4_372 = A0_368
  L3_371 = L3_371(L4_372, A1_369.PointVarTable, true)
  L4_372 = A1_369.PointVar
  L4_372 = L3_371[L4_372]
  GetTable(A0_368, A1_369.DestVarTable, true)[A1_369.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_370, L4_372)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_373, A1_374)
  local L2_375, L3_376
  L2_375 = GetParam
  L3_376 = "Point1"
  L2_375 = L2_375(L3_376, A0_373, A1_374)
  L3_376 = GetParam
  L3_376 = L3_376("Point2", A0_373, A1_374)
  GetTable(A0_373, A1_374.DestVarTable, true)[A1_374.DestVar] = DistanceBetweenPoints(L2_375, L3_376)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_377, A1_378, A2_379)
  local L3_380, L4_381, L5_382, L6_383, L7_384, L8_385
  L5_382 = 0
  L6_383 = nil
  L7_384 = A1_378.ObjectDistanceType
  L8_385 = A1_378.ObjectVar1
  L3_380 = A0_377[L8_385]
  L8_385 = A1_378.ObjectVar2
  L4_381 = A0_377[L8_385]
  if nil == L4_381 then
    L8_385 = A1_378.Point2Var
    if nil ~= L8_385 then
      L8_385 = GetTable
      L8_385 = L8_385(A0_377, A1_378.Point2VarTable, true)
      L4_381 = L8_385[A1_378.Point2Var]
      L5_382 = L5_382 + 1
    end
  end
  if nil == L3_380 then
    L8_385 = A1_378.Point1Var
    if nil ~= L8_385 then
      L8_385 = GetTable
      L8_385 = L8_385(A0_377, A1_378.Point1VarTable, true)
      L3_380 = L8_385[A1_378.Point1Var]
      L5_382 = L5_382 + 1
      if 1 == L5_382 then
        L3_380, L4_381 = L4_381, L3_380
      end
    end
  end
  if nil ~= L7_384 then
    if 0 == L5_382 then
      L8_385 = OBJECT_CENTER
      if L8_385 == L7_384 then
        L6_383 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_385 = OBJECT_BOUNDARY
        if L8_385 == L7_384 then
          L6_383 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_385 = A1_378.OwnerVar
          L8_385 = A0_377[L8_385]
          Say(L8_385, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_382 then
      L8_385 = OBJECT_CENTER
      if L8_385 == L7_384 then
        L6_383 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_385 = OBJECT_BOUNDARY
        if L8_385 == L7_384 then
          L6_383 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_385 = A1_378.OwnerVar
          L8_385 = A0_377[L8_385]
          Say(L8_385, "invalid object distance type", 0)
        end
      end
    else
      L6_383 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_385 = A1_378.Distance
  if A1_378.DistanceVar ~= nil and GetTable(A0_377, A1_378.DistanceVarTable, true) ~= nil then
    L8_385 = L8_385 + GetTable(A0_377, A1_378.DistanceVarTable, true)[A1_378.DistanceVar]
  end
  if L3_380 ~= nil and L4_381 ~= nil and L6_383 ~= nil and L8_385 ~= nil then
    if not L6_383(L3_380, L4_381, L8_385) then
      ExecuteBuildingBlocks(A2_379, A0_377)
      A0_377.LastIfSucceeded = true
    else
      A0_377.LastIfSucceeded = false
    end
  else
    A0_377.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_386, A1_387)
  local L2_388, L3_389
  L2_388 = A1_387.TargetVar
  L2_388 = A0_386[L2_388]
  L3_389 = A1_387.CasterVar
  L3_389 = A0_386[L3_389]
  GetTable(A0_386, A1_387.DestVarTable, true)[A1_387.DestVar] = SpellBuffCount(L2_388, A1_387.BuffName, L3_389)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_390, A1_391)
  local L2_392
  L2_392 = A1_391.TargetVar
  L2_392 = A0_390[L2_392]
  GetTable(A0_390, A1_391.DestVarTable, true)[A1_391.DestVar] = SpellBuffCount(L2_392, A1_391.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_393, A1_394)
  local L2_395, L3_396
  L2_395 = GetTable
  L3_396 = A0_393
  L2_395 = L2_395(L3_396, A1_394.ScaleVarTable, false)
  L3_396 = nil
  if A1_394.OwnerVar ~= nil then
    L3_396 = A0_393[A1_394.OwnerVar]
  else
    L3_396 = A0_393.Owner
  end
  if A1_394.ScaleVar ~= nil and A1_394.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_395[A1_394.ScaleVar], L3_396)
  else
    SetScaleSkinCoef(A1_394.Scale, L3_396)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_397, A1_398)
  SpellBuffAdd(A0_397[A1_398.TargetVar], A0_397[A1_398.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_397.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_399, A1_400, A2_401)
  local L3_402, L4_403
  L3_402 = A1_400.TargetVar
  L3_402 = A0_399[L3_402]
  L4_403 = A1_400.NumStacks
  if GetParam("NumStacks", A0_399, A1_400) == 0 then
    L4_403 = SpellBuffCount(L3_402, A1_400.BuffName, caster)
  else
    L4_403 = GetParam("NumStacks", A0_399, A1_400)
  end
  while L4_403 > 0 do
    SpellBuffRemove(L3_402, A1_400.BuffName, A0_399[A1_400.AttackerVar])
    L4_403 = L4_403 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_404, A1_405, A2_406)
  if A0_404.EmoteId == A1_405.EmoteId then
    ExecuteBuildingBlocks(A2_406, A0_404)
    A0_404.LastIfSucceeded = true
  else
    A0_404.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_407, A1_408, A2_409)
  if A0_407.EmoteId ~= A1_408.EmoteId then
    ExecuteBuildingBlocks(A2_409, A0_407)
    A0_407.LastIfSucceeded = true
  else
    A0_407.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
function L0_0(A0_410, A1_411)
  local L2_412, L3_413, L4_414, L5_415
  L2_412 = GetTable
  L3_413 = A0_410
  L4_414 = A1_411.String1VarTable
  L5_415 = false
  L2_412 = L2_412(L3_413, L4_414, L5_415)
  L3_413 = A1_411.String1Var
  L3_413 = L2_412[L3_413]
  L4_414 = GetTable
  L5_415 = A0_410
  L4_414 = L4_414(L5_415, A1_411.String2VarTable, false)
  L5_415 = A1_411.String2Var
  L5_415 = L4_414[L5_415]
  GetTable(A0_410, A1_411.ResultVarTable, false)[A1_411.ResultVar] = L3_413 .. L5_415
end
BBConcatenateStrings = L0_0
