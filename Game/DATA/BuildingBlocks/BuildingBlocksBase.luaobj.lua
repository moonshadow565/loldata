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
function L0_0(A0_84, A1_85, A2_86)
  for _FORV_9_, _FORV_10_ in pairs(GetTable(A0_84, A1_85.TableVarTable, false)[A1_85.TableVar]) do
  end
  GetTable(A0_84, A1_85.SizeVarTable, false)[A1_85.SizeVar] = 0 + 1
end
BBGetSizeOfCustomTable = L0_0
function L0_0(A0_87, A1_88)
  local L2_89, L3_90
  L2_89 = GetTable
  L3_90 = A0_87
  L2_89 = L2_89(L3_90, A1_88.DestVarTable, true)
  L3_90 = nil
  if A1_88.SpellSlotVar ~= nil and GetTable(A0_87, A1_88.SpellSlotVarTable, false) ~= nil then
    L3_90 = GetTable(A0_87, A1_88.SpellSlotVarTable, false)[A1_88.SpellSlotVar]
  else
    L3_90 = A1_88.SpellSlotValue
  end
  L2_89[A1_88.DestVar] = A1_88.Function(A0_87[A1_88.OwnerVar], L3_90, A1_88.SpellbookType, A1_88.SlotType)
end
BBGetSlotSpellInfo = L0_0
function L0_0(A0_91, A1_92)
  local L2_93, L3_94, L4_95
  L2_93 = GetTable
  L3_94 = A0_91
  L4_95 = A1_92.SrcVarTable
  L2_93 = L2_93(L3_94, L4_95, false)
  L3_94 = nil
  L4_95 = A1_92.SrcVar
  if L4_95 ~= nil and L2_93 ~= nil then
    L4_95 = A1_92.SrcVar
    L3_94 = L2_93[L4_95]
  else
    L3_94 = A1_92.SrcValue
  end
  L4_95 = nil
  if A1_92.SpellSlotVar ~= nil and GetTable(A0_91, A1_92.SpellSlotVarTable, false) ~= nil then
    L4_95 = GetTable(A0_91, A1_92.SpellSlotVarTable, false)[A1_92.SpellSlotVar]
  else
    L4_95 = A1_92.SpellSlotValue
  end
  SetSlotSpellCooldownTime(A0_91[A1_92.OwnerVar], L4_95, A1_92.SpellbookType, A1_92.SlotType, L3_94)
end
BBSetSlotSpellCooldownTime = L0_0
function L0_0(A0_96, A1_97)
  if A0_96.Level ~= nil and A1_97.SrcValueByLevel ~= nil then
    A0_96.ReturnValue = A1_97.SrcValueByLevel[A0_96.Level]
  elseif A1_97.SrcVar ~= nil and GetTable(A0_96, A1_97.SrcVarTable, false) ~= nil then
    A0_96.ReturnValue = GetTable(A0_96, A1_97.SrcVarTable, false)[A1_97.SrcVar]
  else
    A0_96.ReturnValue = A1_97.SrcValue
  end
end
BBSetReturnValue = L0_0
function L0_0(A0_98, A1_99)
  if type(A0_98) == "string" and type(A1_99) == "string" then
    A0_98 = string.lower(A0_98)
    A1_99 = string.lower(A1_99)
  end
  return A0_98 == A1_99
end
CO_EQUAL = L0_0
function L0_0(A0_100, A1_101)
  if type(A0_100) == "string" and type(A1_101) == "string" then
    A0_100 = string.lower(A0_100)
    A1_101 = string.lower(A1_101)
  end
  return A0_100 ~= A1_101
end
CO_NOT_EQUAL = L0_0
function L0_0(A0_102, A1_103)
  local L2_104
  L2_104 = A0_102 < A1_103
  return L2_104
end
CO_LESS_THAN = L0_0
function L0_0(A0_105, A1_106)
  local L2_107
  L2_107 = A1_106 < A0_105
  return L2_107
end
CO_GREATER_THAN = L0_0
function L0_0(A0_108, A1_109)
  local L2_110
  L2_110 = A0_108 <= A1_109
  return L2_110
end
CO_LESS_THAN_OR_EQUAL = L0_0
function L0_0(A0_111, A1_112)
  local L2_113
  L2_113 = A1_112 <= A0_111
  return L2_113
end
CO_GREATER_THAN_OR_EQUAL = L0_0
function L0_0(A0_114, A1_115)
  return GetTeamID(A0_114) == GetTeamID(A1_115)
end
CO_SAME_TEAM = L0_0
function L0_0(A0_116, A1_117)
  return GetTeamID(A0_116) ~= GetTeamID(A1_117)
end
CO_DIFFERENT_TEAM = L0_0
function L0_0(A0_118, A1_119)
  return GetSourceType() == A1_119 or GetSourceType() == A0_118
end
CO_DAMAGE_SOURCETYPE_IS = L0_0
function L0_0(A0_120, A1_121)
  return GetSourceType() ~= A1_121 and GetSourceType() ~= A0_120
end
CO_DAMAGE_SOURCETYPE_IS_NOT = L0_0
function L0_0(A0_122)
  return IsObjectAI(A0_122)
end
CO_IS_TYPE_AI = L0_0
function L0_0(A0_123)
  return IsObjectAI(A0_123) ~= true
end
CO_IS_NOT_AI = L0_0
function L0_0(A0_124)
  return IsObjectHero(A0_124)
end
CO_IS_TYPE_HERO = L0_0
function L0_0(A0_125)
  return IsObjectHero(A0_125) ~= true
end
CO_IS_NOT_HERO = L0_0
function L0_0(A0_126)
  return IsClone(A0_126)
end
CO_IS_CLONE = L0_0
function L0_0(A0_127)
  return IsClone(A0_127) ~= true
end
CO_IS_NOT_CLONE = L0_0
function L0_0(A0_128)
  return IsMelee(A0_128)
end
CO_IS_MELEE = L0_0
function L0_0(A0_129)
  return IsMelee(A0_129) ~= true
end
CO_IS_RANGED = L0_0
function L0_0(A0_130)
  return A0_130 > math.random()
end
CO_RANDOM_CHANCE_LESS_THAN = L0_0
function L0_0(A0_131)
  return IsTurretAI(A0_131)
end
CO_IS_TYPE_TURRET = L0_0
function L0_0(A0_132)
  return IsTurretAI(A0_132) ~= true
end
CO_IS_NOT_TURRET = L0_0
function L0_0(A0_133)
  return IsDead(A0_133)
end
CO_IS_DEAD = L0_0
function L0_0(A0_134)
  return IsDead(A0_134) ~= true
end
CO_IS_NOT_DEAD = L0_0
function L0_0(A0_135)
  return IsDeadOrZombie(A0_135)
end
CO_IS_DEAD_OR_ZOMBIE = L0_0
function L0_0(A0_136, A1_137)
  return BBIsTargetInFrontOfMe(A0_136, A1_137)
end
CO_IS_TARGET_IN_FRONT_OF_ME = L0_0
function L0_0(A0_138, A1_139)
  return BBIsTargetBehindMe(A0_138, A1_139)
end
CO_IS_TARGET_BEHIND_ME = L0_0
function L0_0(A0_140)
  return IsWard(A0_140)
end
CO_IS_WARD = L0_0
function L0_0(A0_141)
  return IsStructure(A0_141)
end
CO_IS_STRUCTURE = L0_0
function L0_0(A0_142)
  return IsStructure(A0_142) ~= true
end
CO_IS_NOT_STRUCTURE = L0_0
function L0_0(A0_143, A1_144, A2_145)
  local L3_146, L4_147, L5_148, L6_149
  L3_146 = GetTable
  L4_147 = A0_143
  L5_148 = A1_144.Src1VarTable
  L6_149 = false
  L3_146 = L3_146(L4_147, L5_148, L6_149)
  L4_147 = GetTable
  L5_148 = A0_143
  L6_149 = A1_144.Src2VarTable
  L4_147 = L4_147(L5_148, L6_149, false)
  L5_148 = false
  L6_149 = nil
  if L3_146 ~= nil and A1_144.Src1Var ~= nil then
    L6_149 = L3_146[A1_144.Src1Var]
  else
    L6_149 = A1_144.Value1
  end
  if L4_147 ~= nil and A1_144.Src2Var ~= nil then
    L5_148 = A1_144.CompareOp(L6_149, L4_147[A1_144.Src2Var])
  else
    L5_148 = A1_144.CompareOp(L6_149, A1_144.Value2)
  end
  if L5_148 then
    ExecuteBuildingBlocks(A2_145, A0_143)
    A0_143.LastIfSucceeded = true
  else
    A0_143.LastIfSucceeded = false
  end
end
BBIf = L0_0
function L0_0(A0_150, A1_151, A2_152)
  if A0_150.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_152, A0_150)
    A0_150.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_153, A1_154, A2_155)
  local L3_156, L4_157, L5_158, L6_159
  L3_156 = A0_153.LastIfSucceeded
  if L3_156 == false then
    L3_156 = GetTable
    L4_157 = A0_153
    L5_158 = A1_154.Src1VarTable
    L6_159 = false
    L3_156 = L3_156(L4_157, L5_158, L6_159)
    L4_157 = GetTable
    L5_158 = A0_153
    L6_159 = A1_154.Src2VarTable
    L4_157 = L4_157(L5_158, L6_159, false)
    L5_158 = false
    L6_159 = nil
    if L3_156 ~= nil and A1_154.Src1Var ~= nil then
      L6_159 = L3_156[A1_154.Src1Var]
    else
      L6_159 = A1_154.Value1
    end
    if L4_157 ~= nil and A1_154.Src2Var ~= nil then
      L5_158 = A1_154.CompareOp(L6_159, L4_157[A1_154.Src2Var])
    else
      L5_158 = A1_154.CompareOp(L6_159, A1_154.Value2)
    end
    if L5_158 then
      ExecuteBuildingBlocks(A2_155, A0_153)
      A0_153.LastIfSucceeded = true
    else
      A0_153.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_160, A1_161, A2_162)
  local L3_163
  if A1_161.TargetVar ~= nil then
    L3_163 = A0_160[A1_161.TargetVar]
  else
    L3_163 = A0_160.Target
  end
  if HasBuffOfType(L3_163, A1_161.BuffType) then
    ExecuteBuildingBlocks(A2_162, A0_160)
    A0_160.LastIfSucceeded = true
  else
    A0_160.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_164, A1_165, A2_166)
  local L3_167, L4_168
  if A1_165.OwnerVar ~= nil then
    L3_167 = A0_164[A1_165.OwnerVar]
  else
    L3_167 = A0_164.Owner
  end
  if A1_165.AttackerVar ~= nil then
    L4_168 = A0_164[A1_165.AttackerVar]
  else
    L4_168 = A0_164.Attacker
  end
  if SpellBuffCount(L3_167, A1_165.BuffName, L4_168) > 0 then
    ExecuteBuildingBlocks(A2_166, A0_164)
    A0_164.LastIfSucceeded = true
  else
    A0_164.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_169, A1_170, A2_171)
  if BBIsMissileAutoAttack(A0_169, A1_170) then
    ExecuteBuildingBlocks(A2_171, A0_169)
    A0_169.LastIfSucceeded = true
  else
    A0_169.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_172, A1_173)
  A0_172.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_174, A1_175, A2_176)
  local L3_177, L4_178
  if A1_175.OwnerVar ~= nil then
    L3_177 = A0_174[A1_175.OwnerVar]
  else
    L3_177 = A0_174.Owner
  end
  if A1_175.CasterVar ~= nil then
    L4_178 = A0_174[A1_175.CasterVar]
  else
    L4_178 = A0_174.Caster
  end
  if SpellBuffCount(L3_177, A1_175.BuffName, L4_178) <= 0 then
    ExecuteBuildingBlocks(A2_176, A0_174)
    A0_174.LastIfSucceeded = true
  else
    A0_174.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_179, A1_180, A2_181)
  local L3_182, L4_183
  if A1_180.OwnerVar ~= nil then
    L3_182 = A0_179[A1_180.OwnerVar]
  else
    L3_182 = A0_179.Owner
  end
  if HasPARType(L3_182, A1_180.PARType) then
    ExecuteBuildingBlocks(A2_181, A0_179)
    A0_179.LastIfSucceeded = true
  else
    A0_179.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_184, A1_185, A2_186)
  local L3_187, L4_188
  if A1_185.OwnerVar ~= nil then
    L3_187 = A0_184[A1_185.OwnerVar]
  else
    L3_187 = A0_184.Owner
  end
  if not HasPARType(L3_187, A1_185.PARType) then
    ExecuteBuildingBlocks(A2_186, A0_184)
    A0_184.LastIfSucceeded = true
  else
    A0_184.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_189, A1_190, A2_191)
  local L3_192, L4_193, L5_194, L6_195, L7_196
  L3_192 = GetTable
  L4_193 = A0_189
  L5_194 = A1_190.Src1VarTable
  L6_195 = false
  L3_192 = L3_192(L4_193, L5_194, L6_195)
  L4_193 = GetTable
  L5_194 = A0_189
  L6_195 = A1_190.Src2VarTable
  L7_196 = false
  L4_193 = L4_193(L5_194, L6_195, L7_196)
  L5_194 = true
  while L5_194 do
    L6_195 = false
    L7_196 = nil
    if L3_192 ~= nil and A1_190.Src1Var ~= nil then
      L7_196 = L3_192[A1_190.Src1Var]
    else
      L7_196 = A1_190.Value1
    end
    if L4_193 ~= nil and A1_190.Src2Var ~= nil then
      L6_195 = A1_190.CompareOp(L7_196, L4_193[A1_190.Src2Var])
    else
      L6_195 = A1_190.CompareOp(L7_196, A1_190.Value2)
    end
    if L6_195 then
      ExecuteBuildingBlocks(A2_191, A0_189)
    else
      L5_194 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_197, A1_198)
  return A0_197 * A1_198
end
MO_MULTIPLY = L0_0
function L0_0(A0_199, A1_200)
  return A0_199 + A1_200
end
MO_ADD = L0_0
function L0_0(A0_201, A1_202)
  return A0_201 - A1_202
end
MO_SUBTRACT = L0_0
function L0_0(A0_203, A1_204)
  return A0_203 / A1_204
end
MO_DIVIDE = L0_0
function L0_0(A0_205, A1_206)
  if A0_205 < A1_206 then
    return A0_205
  else
    return A1_206
  end
end
MO_MIN = L0_0
function L0_0(A0_207, A1_208)
  if A1_208 < A0_207 then
    return A0_207
  else
    return A1_208
  end
end
MO_MAX = L0_0
function L0_0(A0_209, A1_210)
  return A0_209 % A1_210
end
MO_MODULO = L0_0
function L0_0(A0_211)
  return math.floor(A0_211 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_212)
  return math.ceil(A0_212)
end
MO_ROUNDUP = L0_0
function L0_0(A0_213)
  return math.floor(A0_213)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_214)
  return math.sin(math.rad(A0_214))
end
MO_SIN = L0_0
function L0_0(A0_215)
  return math.cos(math.rad(A0_215))
end
MO_COSINE = L0_0
function L0_0(A0_216)
  return math.tan(math.rad(A0_216))
end
MO_TANGENT = L0_0
function L0_0(A0_217)
  return math.deg(math.asin(A0_217))
end
MO_ASIN = L0_0
function L0_0(A0_218)
  return math.deg(math.acos(A0_218))
end
MO_ACOS = L0_0
function L0_0(A0_219)
  return math.deg(math.atan(A0_219))
end
MO_ATAN = L0_0
function L0_0(A0_220, A1_221)
  return math.pow(A0_220, A1_221)
end
MO_POW = L0_0
function L0_0(A0_222)
  return math.sqrt(A0_222)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_223, A1_224)
  local L2_225
  L2_225 = A0_223 and A1_224
  return L2_225
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_226, A1_227)
  local L2_228
  L2_228 = A0_226 or A1_227
  return L2_228
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_229)
  local L1_230
  L1_230 = not A0_229
  return L1_230
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_231)
  return math.abs(A0_231)
end
MO_ABS = L0_0
function L0_0(A0_232, A1_233)
  return math.random(A0_232, A1_233)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_234, A1_235)
  local L2_236, L3_237
  L2_236 = GetMathNumber
  L3_237 = A0_234
  L2_236 = L2_236(L3_237, A1_235.Src1VarTable, A1_235.Src1Var, A1_235.Src1Value)
  L3_237 = GetMathNumber
  L3_237 = L3_237(A0_234, A1_235.Src2VarTable, A1_235.Src2Var, A1_235.Src2Value)
  GetTable(A0_234, A1_235.DestVarTable)[A1_235.DestVar] = A1_235.MathOp(L2_236, L3_237)
end
BBMath = L0_0
function L0_0(A0_238, A1_239, A2_240, A3_241)
  if A2_240 ~= nil and GetTable(A0_238, A1_239)[A2_240] ~= nil then
    return GetTable(A0_238, A1_239)[A2_240]
  end
  return A3_241
end
GetMathNumber = L0_0
function L0_0(A0_242, A1_243)
  if type(A1_243) == "number" then
    return A1_243
  elseif type(A1_243) == "function" then
    return A1_243(A0_242)
  elseif type(A1_243) == "string" then
    return A0_242[A1_243]
  end
end
GetNumber = L0_0
function L0_0(A0_244, A1_245)
  return VectorAdd(A0_244, A1_245)
end
VEC_ADD = L0_0
function L0_0(A0_246, A1_247)
  return VectorSubtract(A0_246, A1_247)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_248, A1_249)
  return VectorScalarMultiply(A0_248, A1_249)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_250, A1_251)
  return VectorScalarDivide(A0_250, A1_251)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_252, A1_253)
  return VectorRotateY(A0_252, A1_253)
end
VEC_ROTATE = L0_0
function L0_0(A0_254, A1_255)
  BBMath(A0_254, A1_255)
end
BBVectorMath = L0_0
function L0_0(A0_256, A1_257)
  local L2_258, L3_259, L4_260, L5_261
  L2_258 = A0_256.InstanceVars
  L3_259 = L2_258.InterpDelta
  if L3_259 == nil then
    L3_259 = A1_257.Amount
    L4_260 = A1_257.AmountVar
    if L4_260 ~= nil then
      L4_260 = GetTable
      L5_261 = A0_256
      L4_260 = L4_260(L5_261, A1_257.AmountVarTable)
      L5_261 = A1_257.AmountVar
      L3_259 = L4_260[L5_261]
    end
    L4_260 = GetPosition
    L5_261 = A1_257.TargetVar
    L5_261 = A0_256[L5_261]
    L4_260 = L4_260(L5_261)
    L2_258.KnockBackStart = L4_260
    L4_260 = GetNormalizedPositionDelta
    L5_261 = A1_257.TargetVar
    L5_261 = A0_256[L5_261]
    L4_260 = L4_260(L5_261, A0_256[A1_257.AttackerVar], true)
    L5_261 = {}
    L5_261.x = L4_260.x * L3_259
    L5_261.y = 0
    L5_261.z = L4_260.z * L3_259
    L2_258.InterpDelta = L5_261
    L5_261 = GetTime
    L5_261 = L5_261()
    L2_258.StartTime = L5_261
    L5_261 = A1_257.KnockBackDuration
    L2_258.KnockBackDuration = L5_261
  end
  L3_259 = A1_257.TargetVar
  L3_259 = A0_256[L3_259]
  L4_260 = GetTime
  L4_260 = L4_260()
  L5_261 = L2_258.StartTime
  L4_260 = L4_260 - L5_261
  L5_261 = L2_258.KnockBackDuration
  L4_260 = L4_260 / L5_261
  L5_261 = {}
  L5_261.x = L2_258.KnockBackStart.x + L2_258.InterpDelta.x * L4_260
  L5_261.y = L2_258.KnockBackStart.y
  L5_261.z = L2_258.KnockBackStart.z + L2_258.InterpDelta.z * L4_260
  SetPosition(L3_259, L5_261)
end
BBKnockback = L0_0
function L0_0(A0_262, A1_263)
  local L2_264, L3_265
  L2_264 = GetParam
  L3_265 = "Left"
  L2_264 = L2_264(L3_265, A0_262, A1_263)
  L3_265 = GetParam
  L3_265 = L3_265("Right", A0_262, A1_263)
  GetTable(A0_262, A1_263.DestVarTable, true)[A1_263.DestVar] = tostring(L2_264) .. tostring(L3_265)
end
BBAppendString = L0_0
function L0_0(A0_266, A1_267)
  local L2_268
  L2_268 = 0
  if A1_267.Delta ~= nil then
    L2_268 = L2_268 + A1_267.Delta
  end
  if A1_267.DeltaByLevel ~= nil and A0_266.Level ~= nil then
    L2_268 = L2_268 + A1_267.DeltaByLevel[A0_266.Level]
  end
  if A1_267.DeltaVar ~= nil then
    L2_268 = L2_268 + GetTable(A0_266, A1_267.DeltaVarTable, true)[A1_267.DeltaVar]
  end
  if A1_267.TargetVar ~= nil then
    A1_267.Stat(L2_268, A0_266[A1_267.TargetVar])
  else
    A1_267.Stat(L2_268)
  end
end
BBIncStat = L0_0
function L0_0(A0_269, A1_270)
  local L2_271
  L2_271 = 0
  if A1_270.Delta ~= nil then
    L2_271 = L2_271 + A1_270.Delta
  end
  if A1_270.DeltaByLevel ~= nil and A0_269.Level ~= nil then
    L2_271 = L2_271 + A1_270.DeltaByLevel[A0_269.Level]
  end
  if A1_270.DeltaVar ~= nil then
    L2_271 = L2_271 + GetTable(A0_269, A1_270.DeltaVarTable, true)[A1_270.DeltaVar]
  end
  if A1_270.TargetVar ~= nil then
    A1_270.Stat(L2_271, A0_269[A1_270.TargetVar])
  else
    A1_270.Stat(L2_271)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_272, A1_273)
  if A1_273.TargetVar ~= nil then
    GetTable(A0_272, A1_273.DestVarTable, false)[A1_273.DestVar] = A1_273.Stat(A0_272[A1_273.TargetVar])
  else
    GetTable(A0_272, A1_273.DestVarTable, false)[A1_273.DestVar] = A1_273.Stat()
  end
end
BBGetStat = L0_0
function L0_0(A0_274, A1_275)
  if A1_275.TargetVar ~= nil then
    GetTable(A0_274, A1_275.DestVarTable, false)[A1_275.DestVar] = GetLevel(A0_274[A1_275.TargetVar])
  else
    GetTable(A0_274, A1_275.DestVarTable, false)[A1_275.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_276, A1_277)
  if A1_277.TargetVar ~= nil then
    GetTable(A0_276, A1_277.DestVarTable, false)[A1_277.DestVar] = GetUnitSignificance(A0_276[A1_277.TargetVar])
  else
    GetTable(A0_276, A1_277.DestVarTable, false)[A1_277.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_278, A1_279)
  if A1_279.TargetVar ~= nil then
    GetTable(A0_278, A1_279.DestVarTable, false)[A1_279.DestVar] = GetArmor(A0_278[A1_279.TargetVar])
  else
    GetTable(A0_278, A1_279.DestVarTable, false)[A1_279.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_280, A1_281)
  if A1_281.TargetVar ~= nil then
    GetTable(A0_280, A1_281.DestVarTable, false)[A1_281.DestVar] = GetSpellBlock(A0_280[A1_281.TargetVar])
  else
    GetTable(A0_280, A1_281.DestVarTable, false)[A1_281.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_282, A1_283)
  if A1_283.TargetVar ~= nil then
    GetTable(A0_282, A1_283.DestVarTable, false)[A1_283.DestVar] = GetTeamID(A0_282[A1_283.TargetVar])
  else
    GetTable(A0_282, A1_283.DestVarTable, false)[A1_283.DestVar] = GetTeamID()
  end
end
BBGetTeamID = L0_0
function L0_0(A0_284, A1_285)
  local L2_286, L3_287, L4_288
  L2_286 = GetTable
  L3_287 = A0_284
  L4_288 = A1_285.DestVarTable
  L2_286 = L2_286(L3_287, L4_288, false)
  L3_287 = A1_285.TargetVar
  L4_288 = nil
  if L3_287 ~= nil then
    L4_288 = GetTeamID(A0_284[L3_287])
  else
    L4_288 = GetTeamID()
  end
  if L4_288 == TEAM_ORDER then
    L2_286[A1_285.DestVar] = TEAM_CHAOS
  elseif L4_288 == TEAM_CHAOS then
    L2_286[A1_285.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_289, A1_290)
  if A1_290.TargetVar ~= nil then
    GetTable(A0_289, A1_290.DestVarTable, false)[A1_290.DestVar] = GetUnitSkinName(A0_289[A1_290.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_291, A1_292)
  if A1_292.TargetVar ~= nil then
    GetTable(A0_291, A1_292.DestVarTable, false)[A1_292.DestVar] = GetTotalAttackDamage(A0_291[A1_292.TargetVar])
  else
    GetTable(A0_291, A1_292.DestVarTable, false)[A1_292.DestVar] = GetTotalAttackDamage()
  end
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_293, A1_294)
  GetTable(A0_293, A1_294.DestVarTable, true)[A1_294.DestVar] = A1_294.Status(A0_293[A1_294.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_295, A1_296)
  local L2_297
  L2_297 = A1_296.TargetVar
  L2_297 = A0_295[L2_297]
  ClearAttackTarget(L2_297)
end
BBClearAttackTarget = L0_0
function L0_0(A0_298, A1_299)
  GetTable(A0_298, A1_299.DestVarTable, true)[A1_299.DestVar] = A1_299.Info(A0_298[A1_299.TargetVar])
end
BBGetCastInfo = L0_0
function L0_0(A0_300, A1_301, A2_302)
  local L3_303, L4_304, L5_305, L6_306
  L3_303 = GetTable
  L4_304 = A0_300
  L5_305 = A1_301.TrackTimeVarTable
  L6_306 = false
  L3_303 = L3_303(L4_304, L5_305, L6_306)
  L4_304 = GetTime
  L4_304 = L4_304()
  L5_305 = A1_301.ExecuteImmediately
  L6_306 = A1_301.TimeBetweenExecutions
  if A1_301.TickTimeVar ~= nil and GetTable(A0_300, A1_301.TickTimeVarTable, false)[A1_301.TickTimeVar] ~= nil then
    L6_306 = GetTable(A0_300, A1_301.TickTimeVarTable, false)[A1_301.TickTimeVar]
  end
  if L3_303[A1_301.TrackTimeVar] == nil then
    L3_303[A1_301.TrackTimeVar] = L4_304
    if L5_305 == true then
      ExecuteBuildingBlocks(A2_302, A0_300)
    end
  end
  if L4_304 >= L3_303[A1_301.TrackTimeVar] + L6_306 then
    L3_303[A1_301.TrackTimeVar] = L3_303[A1_301.TrackTimeVar] + L6_306
    ExecuteBuildingBlocks(A2_302, A0_300)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_307, A1_308, A2_309)
  GetTable(A0_307, A1_308.TrackTimeVarTable, false)[A1_308.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_310, A1_311)
  local L2_312
  L2_312 = A1_311.SrcValue
  if A1_311.SrcVar ~= nil then
    L2_312 = GetTable(A0_310, A1_311.SrcVarTable, true)[A1_311.SrcVar]
  end
  A1_311.Status(A0_310[A1_311.TargetVar], L2_312)
end
BBSetStatus = L0_0
function L0_0(A0_313, A1_314)
  local L2_315
  L2_315 = A1_314.ToAlert
  if GetTable(A0_313, A1_314.SrcVarTable, false) ~= nil and A1_314.SrcVar ~= nil then
    L2_315 = L2_315 .. GetTable(A0_313, A1_314.SrcVarTable, false)[A1_314.SrcVar]
  end
  _ALERT(L2_315)
end
BBAlert = L0_0
function L0_0(A0_316, A1_317)
  local L2_318, L3_319, L4_320
  L2_318 = A1_317.ToSay
  L3_319 = GetTable
  L4_320 = A0_316
  L3_319 = L3_319(L4_320, A1_317.SrcVarTable, false)
  if L3_319 ~= nil then
    L4_320 = A1_317.SrcVar
    if L4_320 ~= nil then
      L4_320 = L2_318
      L2_318 = L4_320 .. tostring(L3_319[A1_317.SrcVar])
    end
  end
  L4_320 = nil
  if A1_317.OwnerVar ~= nil then
    L4_320 = A0_316[A1_317.OwnerVar]
  else
    L4_320 = A0_316.Owner
  end
  if A1_317.TextType == nil then
    A1_317.TextType = 0
  end
  Say(L4_320, L2_318, A1_317.TextType)
end
BBSay = L0_0
function L0_0(A0_321, A1_322)
  local L2_323, L3_324, L4_325
  L2_323 = A1_322.ToSay
  L3_324 = GetTable
  L4_325 = A0_321
  L3_324 = L3_324(L4_325, A1_322.SrcVarTable, false)
  if L3_324 ~= nil then
    L4_325 = A1_322.SrcVar
    if L4_325 ~= nil then
      L4_325 = L2_323
      L2_323 = L4_325 .. tostring(L3_324[A1_322.SrcVar])
    end
  end
  L4_325 = nil
  if A1_322.OwnerVar ~= nil then
    L4_325 = A0_321[A1_322.OwnerVar]
  else
    L4_325 = A0_321.Owner
  end
  if A1_322.TextType == nil then
    A1_322.TextType = 0
  end
  Say(L4_325, L2_323, A1_322.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_326, A1_327)
  GetTable(A0_326, A1_327.DestVarTable, true)[A1_327.DestVar] = BBLuaGetGold(A0_326, A1_327)
end
BBGetGold = L0_0
function L0_0(A0_328, A1_329)
  SpellBuffAdd(A0_328[A1_329.OwnerVar], A0_328[A1_329.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_328.NextBuffVars)
  BBTeleportToPositionHelper(A0_328, A1_329)
end
BBTeleportToPosition = L0_0
function L0_0(A0_330, A1_331)
  if A1_331.XVar ~= nil and GetTable(A0_330, A1_331.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_330, A1_331.XVarTable, true)[A1_331.XVar]
  else
    Xloc = A1_331.X
  end
  if A1_331.YVar ~= nil and GetTable(A0_330, A1_331.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_330, A1_331.YVarTable, true)[A1_331.YVar]
  else
    Yloc = A1_331.Y
  end
  if A1_331.ZVar ~= nil and GetTable(A0_330, A1_331.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_330, A1_331.ZVarTable, true)[A1_331.ZVar]
  else
    Zloc = A1_331.Z
  end
  A1_331.OwnerVar, A0_330.position = A1_331.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_331.CastPositionName = "position"
  BBTeleportToPosition(A0_330, A1_331)
end
BBTeleportToPoint = L0_0
function L0_0(A0_332, A1_333)
  DefUpdateAura(GetTable(A0_332, A1_333.CenterTable, false)[A1_333.CenterVar], A1_333.Range, A1_333.UnitScan, A1_333.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_334, A1_335)
  ReincarnateNonDeadHero(GetTable(A0_334, A1_335.TargetTable, false)[A1_335.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_336, A1_337)
  GetTable(A0_336, A1_337.DestVarTable, true)[A1_337.DestVar] = A1_337.Function(A0_336[A1_337.OwnerVar], A1_337.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_338, A1_339)
  local L2_340, L3_341, L4_342, L5_343
  L2_340 = A1_339.WhomToOrderVar
  L2_340 = A0_338[L2_340]
  L3_341 = A1_339.TargetOfOrderVar
  L3_341 = A0_338[L3_341]
  L4_342 = GetTable
  L5_343 = A0_338
  L4_342 = L4_342(L5_343, A1_339.SrcVarTable, false)
  L5_343 = nil
  if A1_339.SrcVar ~= nil and L4_342 ~= nil then
    L5_343 = L4_342[A1_339.SrcVar]
  else
    L5_343 = GetPosition(L3_341)
  end
  if L3_341 == nil then
    L3_341 = L2_340
  end
  IssueOrder(L2_340, A1_339.Order, L5_343, L3_341)
end
BBIssueOrder = L0_0
function L0_0(A0_344, A1_345)
  local L2_346
  L2_346 = GetParam
  L2_346 = L2_346("NewRange", A0_344, A1_345)
  SetSpellCastRange(L2_346)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_347, A1_348)
  GetTable(A0_347, A1_348.DestVarTable, true)[A1_348.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_349, A1_350)
  local L2_351, L3_352
  L2_351 = A1_350.ObjectVar1
  L2_351 = A0_349[L2_351]
  L3_352 = A1_350.ObjectVar2
  L3_352 = A0_349[L3_352]
  GetTable(A0_349, A1_350.DestVarTable, true)[A1_350.DestVar] = DistanceBetweenObjectBounds(L2_351, L3_352)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_353, A1_354)
  local L2_355, L3_356, L4_357
  L2_355 = A1_354.ObjectVar
  L2_355 = A0_353[L2_355]
  L3_356 = GetTable
  L4_357 = A0_353
  L3_356 = L3_356(L4_357, A1_354.PointVarTable, true)
  L4_357 = A1_354.PointVar
  L4_357 = L3_356[L4_357]
  GetTable(A0_353, A1_354.DestVarTable, true)[A1_354.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_355, L4_357)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_358, A1_359)
  local L2_360, L3_361
  L2_360 = GetParam
  L3_361 = "Point1"
  L2_360 = L2_360(L3_361, A0_358, A1_359)
  L3_361 = GetParam
  L3_361 = L3_361("Point2", A0_358, A1_359)
  GetTable(A0_358, A1_359.DestVarTable, true)[A1_359.DestVar] = DistanceBetweenPoints(L2_360, L3_361)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_362, A1_363, A2_364)
  local L3_365, L4_366, L5_367, L6_368, L7_369, L8_370
  L5_367 = 0
  L6_368 = nil
  L7_369 = A1_363.ObjectDistanceType
  L8_370 = A1_363.ObjectVar1
  L3_365 = A0_362[L8_370]
  L8_370 = A1_363.ObjectVar2
  L4_366 = A0_362[L8_370]
  if nil == L4_366 then
    L8_370 = A1_363.Point2Var
    if nil ~= L8_370 then
      L8_370 = GetTable
      L8_370 = L8_370(A0_362, A1_363.Point2VarTable, true)
      L4_366 = L8_370[A1_363.Point2Var]
      L5_367 = L5_367 + 1
    end
  end
  if nil == L3_365 then
    L8_370 = A1_363.Point1Var
    if nil ~= L8_370 then
      L8_370 = GetTable
      L8_370 = L8_370(A0_362, A1_363.Point1VarTable, true)
      L3_365 = L8_370[A1_363.Point1Var]
      L5_367 = L5_367 + 1
      if 1 == L5_367 then
        L3_365, L4_366 = L4_366, L3_365
      end
    end
  end
  if nil ~= L7_369 then
    if 0 == L5_367 then
      L8_370 = OBJECT_CENTER
      if L8_370 == L7_369 then
        L6_368 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_370 = OBJECT_BOUNDARY
        if L8_370 == L7_369 then
          L6_368 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_370 = A1_363.OwnerVar
          L8_370 = A0_362[L8_370]
          Say(L8_370, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_367 then
      L8_370 = OBJECT_CENTER
      if L8_370 == L7_369 then
        L6_368 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_370 = OBJECT_BOUNDARY
        if L8_370 == L7_369 then
          L6_368 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_370 = A1_363.OwnerVar
          L8_370 = A0_362[L8_370]
          Say(L8_370, "invalid object distance type", 0)
        end
      end
    else
      L6_368 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_370 = A1_363.Distance
  if A1_363.DistanceVar ~= nil and GetTable(A0_362, A1_363.DistanceVarTable, true) ~= nil then
    L8_370 = L8_370 + GetTable(A0_362, A1_363.DistanceVarTable, true)[A1_363.DistanceVar]
  end
  if L3_365 ~= nil and L4_366 ~= nil and L6_368 ~= nil and L8_370 ~= nil then
    if not L6_368(L3_365, L4_366, L8_370) then
      ExecuteBuildingBlocks(A2_364, A0_362)
      A0_362.LastIfSucceeded = true
    else
      A0_362.LastIfSucceeded = false
    end
  else
    A0_362.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_371, A1_372)
  local L2_373, L3_374
  L2_373 = A1_372.TargetVar
  L2_373 = A0_371[L2_373]
  L3_374 = A1_372.CasterVar
  L3_374 = A0_371[L3_374]
  GetTable(A0_371, A1_372.DestVarTable, true)[A1_372.DestVar] = SpellBuffCount(L2_373, A1_372.BuffName, L3_374)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_375, A1_376)
  local L2_377
  L2_377 = A1_376.TargetVar
  L2_377 = A0_375[L2_377]
  GetTable(A0_375, A1_376.DestVarTable, true)[A1_376.DestVar] = SpellBuffCount(L2_377, A1_376.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_378, A1_379)
  local L2_380, L3_381
  L2_380 = GetTable
  L3_381 = A0_378
  L2_380 = L2_380(L3_381, A1_379.ScaleVarTable, false)
  L3_381 = nil
  if A1_379.OwnerVar ~= nil then
    L3_381 = A0_378[A1_379.OwnerVar]
  else
    L3_381 = A0_378.Owner
  end
  if A1_379.ScaleVar ~= nil and A1_379.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_380[A1_379.ScaleVar], L3_381)
  else
    SetScaleSkinCoef(A1_379.Scale, L3_381)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_382, A1_383)
  SpellBuffAdd(A0_382[A1_383.TargetVar], A0_382[A1_383.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_382.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_384, A1_385, A2_386)
  local L3_387, L4_388
  L3_387 = A1_385.TargetVar
  L3_387 = A0_384[L3_387]
  L4_388 = A1_385.NumStacks
  if GetParam("NumStacks", A0_384, A1_385) == 0 then
    L4_388 = SpellBuffCount(L3_387, A1_385.BuffName, caster)
  else
    L4_388 = GetParam("NumStacks", A0_384, A1_385)
  end
  while L4_388 > 0 do
    SpellBuffRemove(L3_387, A1_385.BuffName, A0_384[A1_385.AttackerVar])
    L4_388 = L4_388 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_389, A1_390, A2_391)
  if A0_389.EmoteId == A1_390.EmoteId then
    ExecuteBuildingBlocks(A2_391, A0_389)
    A0_389.LastIfSucceeded = true
  else
    A0_389.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_392, A1_393, A2_394)
  if A0_392.EmoteId ~= A1_393.EmoteId then
    ExecuteBuildingBlocks(A2_394, A0_392)
    A0_392.LastIfSucceeded = true
  else
    A0_392.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
