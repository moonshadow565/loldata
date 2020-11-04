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
  local L2_86, L3_87
  L2_86 = GetTable
  L3_87 = A0_84
  L2_86 = L2_86(L3_87, A1_85.DestVarTable, true)
  L3_87 = nil
  if A1_85.SpellSlotVar ~= nil and GetTable(A0_84, A1_85.SpellSlotVarTable, false) ~= nil then
    L3_87 = GetTable(A0_84, A1_85.SpellSlotVarTable, false)[A1_85.SpellSlotVar]
  else
    L3_87 = A1_85.SpellSlotValue
  end
  L2_86[A1_85.DestVar] = A1_85.Function(A0_84[A1_85.OwnerVar], L3_87, A1_85.SpellbookType, A1_85.SlotType)
end
BBGetSlotSpellInfo = L0_0
function L0_0(A0_88, A1_89)
  local L2_90, L3_91, L4_92
  L2_90 = GetTable
  L3_91 = A0_88
  L4_92 = A1_89.SrcVarTable
  L2_90 = L2_90(L3_91, L4_92, false)
  L3_91 = nil
  L4_92 = A1_89.SrcVar
  if L4_92 ~= nil and L2_90 ~= nil then
    L4_92 = A1_89.SrcVar
    L3_91 = L2_90[L4_92]
  else
    L3_91 = A1_89.SrcValue
  end
  L4_92 = nil
  if A1_89.SpellSlotVar ~= nil and GetTable(A0_88, A1_89.SpellSlotVarTable, false) ~= nil then
    L4_92 = GetTable(A0_88, A1_89.SpellSlotVarTable, false)[A1_89.SpellSlotVar]
  else
    L4_92 = A1_89.SpellSlotValue
  end
  SetSlotSpellCooldownTime(A0_88[A1_89.OwnerVar], L4_92, A1_89.SpellbookType, A1_89.SlotType, L3_91)
end
BBSetSlotSpellCooldownTime = L0_0
function L0_0(A0_93, A1_94)
  if A0_93.Level ~= nil and A1_94.SrcValueByLevel ~= nil then
    A0_93.ReturnValue = A1_94.SrcValueByLevel[A0_93.Level]
  elseif A1_94.SrcVar ~= nil and GetTable(A0_93, A1_94.SrcVarTable, false) ~= nil then
    A0_93.ReturnValue = GetTable(A0_93, A1_94.SrcVarTable, false)[A1_94.SrcVar]
  else
    A0_93.ReturnValue = A1_94.SrcValue
  end
end
BBSetReturnValue = L0_0
function L0_0(A0_95, A1_96)
  if type(A0_95) == "string" and type(A1_96) == "string" then
    A0_95 = string.lower(A0_95)
    A1_96 = string.lower(A1_96)
  end
  return A0_95 == A1_96
end
CO_EQUAL = L0_0
function L0_0(A0_97, A1_98)
  if type(A0_97) == "string" and type(A1_98) == "string" then
    A0_97 = string.lower(A0_97)
    A1_98 = string.lower(A1_98)
  end
  return A0_97 ~= A1_98
end
CO_NOT_EQUAL = L0_0
function L0_0(A0_99, A1_100)
  local L2_101
  L2_101 = A0_99 < A1_100
  return L2_101
end
CO_LESS_THAN = L0_0
function L0_0(A0_102, A1_103)
  local L2_104
  L2_104 = A1_103 < A0_102
  return L2_104
end
CO_GREATER_THAN = L0_0
function L0_0(A0_105, A1_106)
  local L2_107
  L2_107 = A0_105 <= A1_106
  return L2_107
end
CO_LESS_THAN_OR_EQUAL = L0_0
function L0_0(A0_108, A1_109)
  local L2_110
  L2_110 = A1_109 <= A0_108
  return L2_110
end
CO_GREATER_THAN_OR_EQUAL = L0_0
function L0_0(A0_111, A1_112)
  return GetTeamID(A0_111) == GetTeamID(A1_112)
end
CO_SAME_TEAM = L0_0
function L0_0(A0_113, A1_114)
  return GetTeamID(A0_113) ~= GetTeamID(A1_114)
end
CO_DIFFERENT_TEAM = L0_0
function L0_0(A0_115, A1_116)
  return GetSourceType() == A1_116 or GetSourceType() == A0_115
end
CO_DAMAGE_SOURCETYPE_IS = L0_0
function L0_0(A0_117, A1_118)
  return GetSourceType() ~= A1_118 and GetSourceType() ~= A0_117
end
CO_DAMAGE_SOURCETYPE_IS_NOT = L0_0
function L0_0(A0_119)
  return IsObjectAI(A0_119)
end
CO_IS_TYPE_AI = L0_0
function L0_0(A0_120)
  return IsObjectAI(A0_120) ~= true
end
CO_IS_NOT_AI = L0_0
function L0_0(A0_121)
  return IsObjectHero(A0_121)
end
CO_IS_TYPE_HERO = L0_0
function L0_0(A0_122)
  return IsObjectHero(A0_122) ~= true
end
CO_IS_NOT_HERO = L0_0
function L0_0(A0_123)
  return IsClone(A0_123)
end
CO_IS_CLONE = L0_0
function L0_0(A0_124)
  return IsClone(A0_124) ~= true
end
CO_IS_NOT_CLONE = L0_0
function L0_0(A0_125)
  return IsMelee(A0_125)
end
CO_IS_MELEE = L0_0
function L0_0(A0_126)
  return IsMelee(A0_126) ~= true
end
CO_IS_RANGED = L0_0
function L0_0(A0_127)
  return A0_127 > math.random()
end
CO_RANDOM_CHANCE_LESS_THAN = L0_0
function L0_0(A0_128)
  return IsTurretAI(A0_128)
end
CO_IS_TYPE_TURRET = L0_0
function L0_0(A0_129)
  return IsTurretAI(A0_129) ~= true
end
CO_IS_NOT_TURRET = L0_0
function L0_0(A0_130)
  return IsDead(A0_130)
end
CO_IS_DEAD = L0_0
function L0_0(A0_131)
  return IsDead(A0_131) ~= true
end
CO_IS_NOT_DEAD = L0_0
function L0_0(A0_132)
  return IsDeadOrZombie(A0_132)
end
CO_IS_DEAD_OR_ZOMBIE = L0_0
function L0_0(A0_133, A1_134)
  return BBIsTargetInFrontOfMe(A0_133, A1_134)
end
CO_IS_TARGET_IN_FRONT_OF_ME = L0_0
function L0_0(A0_135, A1_136)
  return BBIsTargetBehindMe(A0_135, A1_136)
end
CO_IS_TARGET_BEHIND_ME = L0_0
function L0_0(A0_137)
  return IsWard(A0_137)
end
CO_IS_WARD = L0_0
function L0_0(A0_138)
  return IsStructure(A0_138)
end
CO_IS_STRUCTURE = L0_0
function L0_0(A0_139)
  return IsStructure(A0_139) ~= true
end
CO_IS_NOT_STRUCTURE = L0_0
function L0_0(A0_140, A1_141, A2_142)
  local L3_143, L4_144, L5_145, L6_146
  L3_143 = GetTable
  L4_144 = A0_140
  L5_145 = A1_141.Src1VarTable
  L6_146 = false
  L3_143 = L3_143(L4_144, L5_145, L6_146)
  L4_144 = GetTable
  L5_145 = A0_140
  L6_146 = A1_141.Src2VarTable
  L4_144 = L4_144(L5_145, L6_146, false)
  L5_145 = false
  L6_146 = nil
  if L3_143 ~= nil and A1_141.Src1Var ~= nil then
    L6_146 = L3_143[A1_141.Src1Var]
  else
    L6_146 = A1_141.Value1
  end
  if L4_144 ~= nil and A1_141.Src2Var ~= nil then
    L5_145 = A1_141.CompareOp(L6_146, L4_144[A1_141.Src2Var])
  else
    L5_145 = A1_141.CompareOp(L6_146, A1_141.Value2)
  end
  if L5_145 then
    ExecuteBuildingBlocks(A2_142, A0_140)
    A0_140.LastIfSucceeded = true
  else
    A0_140.LastIfSucceeded = false
  end
end
BBIf = L0_0
function L0_0(A0_147, A1_148, A2_149)
  if A0_147.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_149, A0_147)
    A0_147.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_150, A1_151, A2_152)
  local L3_153, L4_154, L5_155, L6_156
  L3_153 = A0_150.LastIfSucceeded
  if L3_153 == false then
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
end
BBElseIf = L0_0
function L0_0(A0_157, A1_158, A2_159)
  local L3_160
  if A1_158.TargetVar ~= nil then
    L3_160 = A0_157[A1_158.TargetVar]
  else
    L3_160 = A0_157.Target
  end
  if HasBuffOfType(L3_160, A1_158.BuffType) then
    ExecuteBuildingBlocks(A2_159, A0_157)
    A0_157.LastIfSucceeded = true
  else
    A0_157.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_161, A1_162, A2_163)
  local L3_164, L4_165
  if A1_162.OwnerVar ~= nil then
    L3_164 = A0_161[A1_162.OwnerVar]
  else
    L3_164 = A0_161.Owner
  end
  if A1_162.AttackerVar ~= nil then
    L4_165 = A0_161[A1_162.AttackerVar]
  else
    L4_165 = A0_161.Attacker
  end
  if SpellBuffCount(L3_164, A1_162.BuffName, L4_165) > 0 then
    ExecuteBuildingBlocks(A2_163, A0_161)
    A0_161.LastIfSucceeded = true
  else
    A0_161.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_166, A1_167, A2_168)
  if BBIsMissileAutoAttack(A0_166, A1_167) then
    ExecuteBuildingBlocks(A2_168, A0_166)
    A0_166.LastIfSucceeded = true
  else
    A0_166.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_169, A1_170)
  A0_169.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_171, A1_172, A2_173)
  local L3_174, L4_175
  if A1_172.OwnerVar ~= nil then
    L3_174 = A0_171[A1_172.OwnerVar]
  else
    L3_174 = A0_171.Owner
  end
  if A1_172.CasterVar ~= nil then
    L4_175 = A0_171[A1_172.CasterVar]
  else
    L4_175 = A0_171.Caster
  end
  if SpellBuffCount(L3_174, A1_172.BuffName, L4_175) <= 0 then
    ExecuteBuildingBlocks(A2_173, A0_171)
    A0_171.LastIfSucceeded = true
  else
    A0_171.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_176, A1_177, A2_178)
  local L3_179, L4_180
  if A1_177.OwnerVar ~= nil then
    L3_179 = A0_176[A1_177.OwnerVar]
  else
    L3_179 = A0_176.Owner
  end
  if HasPARType(L3_179, A1_177.PARType) then
    ExecuteBuildingBlocks(A2_178, A0_176)
    A0_176.LastIfSucceeded = true
  else
    A0_176.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_181, A1_182, A2_183)
  local L3_184, L4_185
  if A1_182.OwnerVar ~= nil then
    L3_184 = A0_181[A1_182.OwnerVar]
  else
    L3_184 = A0_181.Owner
  end
  if not HasPARType(L3_184, A1_182.PARType) then
    ExecuteBuildingBlocks(A2_183, A0_181)
    A0_181.LastIfSucceeded = true
  else
    A0_181.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_186, A1_187, A2_188)
  local L3_189, L4_190, L5_191, L6_192, L7_193
  L3_189 = GetTable
  L4_190 = A0_186
  L5_191 = A1_187.Src1VarTable
  L6_192 = false
  L3_189 = L3_189(L4_190, L5_191, L6_192)
  L4_190 = GetTable
  L5_191 = A0_186
  L6_192 = A1_187.Src2VarTable
  L7_193 = false
  L4_190 = L4_190(L5_191, L6_192, L7_193)
  L5_191 = true
  while L5_191 do
    L6_192 = false
    L7_193 = nil
    if L3_189 ~= nil and A1_187.Src1Var ~= nil then
      L7_193 = L3_189[A1_187.Src1Var]
    else
      L7_193 = A1_187.Value1
    end
    if L4_190 ~= nil and A1_187.Src2Var ~= nil then
      L6_192 = A1_187.CompareOp(L7_193, L4_190[A1_187.Src2Var])
    else
      L6_192 = A1_187.CompareOp(L7_193, A1_187.Value2)
    end
    if L6_192 then
      ExecuteBuildingBlocks(A2_188, A0_186)
    else
      L5_191 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_194, A1_195)
  return A0_194 * A1_195
end
MO_MULTIPLY = L0_0
function L0_0(A0_196, A1_197)
  return A0_196 + A1_197
end
MO_ADD = L0_0
function L0_0(A0_198, A1_199)
  return A0_198 - A1_199
end
MO_SUBTRACT = L0_0
function L0_0(A0_200, A1_201)
  return A0_200 / A1_201
end
MO_DIVIDE = L0_0
function L0_0(A0_202, A1_203)
  if A0_202 < A1_203 then
    return A0_202
  else
    return A1_203
  end
end
MO_MIN = L0_0
function L0_0(A0_204, A1_205)
  if A1_205 < A0_204 then
    return A0_204
  else
    return A1_205
  end
end
MO_MAX = L0_0
function L0_0(A0_206, A1_207)
  return A0_206 % A1_207
end
MO_MODULO = L0_0
function L0_0(A0_208)
  return math.floor(A0_208 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_209)
  return math.ceil(A0_209)
end
MO_ROUNDUP = L0_0
function L0_0(A0_210)
  return math.floor(A0_210)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_211)
  return math.sin(math.rad(A0_211))
end
MO_SIN = L0_0
function L0_0(A0_212)
  return math.cos(math.rad(A0_212))
end
MO_COSINE = L0_0
function L0_0(A0_213)
  return math.tan(math.rad(A0_213))
end
MO_TANGENT = L0_0
function L0_0(A0_214)
  return math.deg(math.asin(A0_214))
end
MO_ASIN = L0_0
function L0_0(A0_215)
  return math.deg(math.acos(A0_215))
end
MO_ACOS = L0_0
function L0_0(A0_216)
  return math.deg(math.atan(A0_216))
end
MO_ATAN = L0_0
function L0_0(A0_217, A1_218)
  return math.pow(A0_217, A1_218)
end
MO_POW = L0_0
function L0_0(A0_219)
  return math.sqrt(A0_219)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_220, A1_221)
  local L2_222
  L2_222 = A0_220 and A1_221
  return L2_222
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_223, A1_224)
  local L2_225
  L2_225 = A0_223 or A1_224
  return L2_225
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_226)
  local L1_227
  L1_227 = not A0_226
  return L1_227
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_228)
  return math.abs(A0_228)
end
MO_ABS = L0_0
function L0_0(A0_229, A1_230)
  return math.random(A0_229, A1_230)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_231, A1_232)
  local L2_233, L3_234
  L2_233 = GetMathNumber
  L3_234 = A0_231
  L2_233 = L2_233(L3_234, A1_232.Src1VarTable, A1_232.Src1Var, A1_232.Src1Value)
  L3_234 = GetMathNumber
  L3_234 = L3_234(A0_231, A1_232.Src2VarTable, A1_232.Src2Var, A1_232.Src2Value)
  GetTable(A0_231, A1_232.DestVarTable)[A1_232.DestVar] = A1_232.MathOp(L2_233, L3_234)
end
BBMath = L0_0
function L0_0(A0_235, A1_236, A2_237, A3_238)
  if A2_237 ~= nil and GetTable(A0_235, A1_236)[A2_237] ~= nil then
    return GetTable(A0_235, A1_236)[A2_237]
  end
  return A3_238
end
GetMathNumber = L0_0
function L0_0(A0_239, A1_240)
  if type(A1_240) == "number" then
    return A1_240
  elseif type(A1_240) == "function" then
    return A1_240(A0_239)
  elseif type(A1_240) == "string" then
    return A0_239[A1_240]
  end
end
GetNumber = L0_0
function L0_0(A0_241, A1_242)
  return VectorAdd(A0_241, A1_242)
end
VEC_ADD = L0_0
function L0_0(A0_243, A1_244)
  return VectorSubtract(A0_243, A1_244)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_245, A1_246)
  return VectorScalarMultiply(A0_245, A1_246)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_247, A1_248)
  return VectorScalarDivide(A0_247, A1_248)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_249, A1_250)
  return VectorRotateY(A0_249, A1_250)
end
VEC_ROTATE = L0_0
function L0_0(A0_251, A1_252)
  BBMath(A0_251, A1_252)
end
BBVectorMath = L0_0
function L0_0(A0_253, A1_254)
  local L2_255, L3_256, L4_257, L5_258
  L2_255 = A0_253.InstanceVars
  L3_256 = L2_255.InterpDelta
  if L3_256 == nil then
    L3_256 = A1_254.Amount
    L4_257 = A1_254.AmountVar
    if L4_257 ~= nil then
      L4_257 = GetTable
      L5_258 = A0_253
      L4_257 = L4_257(L5_258, A1_254.AmountVarTable)
      L5_258 = A1_254.AmountVar
      L3_256 = L4_257[L5_258]
    end
    L4_257 = GetPosition
    L5_258 = A1_254.TargetVar
    L5_258 = A0_253[L5_258]
    L4_257 = L4_257(L5_258)
    L2_255.KnockBackStart = L4_257
    L4_257 = GetNormalizedPositionDelta
    L5_258 = A1_254.TargetVar
    L5_258 = A0_253[L5_258]
    L4_257 = L4_257(L5_258, A0_253[A1_254.AttackerVar], true)
    L5_258 = {}
    L5_258.x = L4_257.x * L3_256
    L5_258.y = 0
    L5_258.z = L4_257.z * L3_256
    L2_255.InterpDelta = L5_258
    L5_258 = GetTime
    L5_258 = L5_258()
    L2_255.StartTime = L5_258
    L5_258 = A1_254.KnockBackDuration
    L2_255.KnockBackDuration = L5_258
  end
  L3_256 = A1_254.TargetVar
  L3_256 = A0_253[L3_256]
  L4_257 = GetTime
  L4_257 = L4_257()
  L5_258 = L2_255.StartTime
  L4_257 = L4_257 - L5_258
  L5_258 = L2_255.KnockBackDuration
  L4_257 = L4_257 / L5_258
  L5_258 = {}
  L5_258.x = L2_255.KnockBackStart.x + L2_255.InterpDelta.x * L4_257
  L5_258.y = L2_255.KnockBackStart.y
  L5_258.z = L2_255.KnockBackStart.z + L2_255.InterpDelta.z * L4_257
  SetPosition(L3_256, L5_258)
end
BBKnockback = L0_0
function L0_0(A0_259, A1_260)
  local L2_261, L3_262
  L2_261 = GetParam
  L3_262 = "Left"
  L2_261 = L2_261(L3_262, A0_259, A1_260)
  L3_262 = GetParam
  L3_262 = L3_262("Right", A0_259, A1_260)
  GetTable(A0_259, A1_260.DestVarTable, true)[A1_260.DestVar] = tostring(L2_261) .. tostring(L3_262)
end
BBAppendString = L0_0
function L0_0(A0_263, A1_264)
  local L2_265
  L2_265 = 0
  if A1_264.Delta ~= nil then
    L2_265 = L2_265 + A1_264.Delta
  end
  if A1_264.DeltaByLevel ~= nil and A0_263.Level ~= nil then
    L2_265 = L2_265 + A1_264.DeltaByLevel[A0_263.Level]
  end
  if A1_264.DeltaVar ~= nil then
    L2_265 = L2_265 + GetTable(A0_263, A1_264.DeltaVarTable, true)[A1_264.DeltaVar]
  end
  if A1_264.TargetVar ~= nil then
    A1_264.Stat(L2_265, A0_263[A1_264.TargetVar])
  else
    A1_264.Stat(L2_265)
  end
end
BBIncStat = L0_0
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
BBIncPermanentStat = L0_0
function L0_0(A0_269, A1_270)
  if A1_270.TargetVar ~= nil then
    GetTable(A0_269, A1_270.DestVarTable, false)[A1_270.DestVar] = A1_270.Stat(A0_269[A1_270.TargetVar])
  else
    GetTable(A0_269, A1_270.DestVarTable, false)[A1_270.DestVar] = A1_270.Stat()
  end
end
BBGetStat = L0_0
function L0_0(A0_271, A1_272)
  if A1_272.TargetVar ~= nil then
    GetTable(A0_271, A1_272.DestVarTable, false)[A1_272.DestVar] = GetLevel(A0_271[A1_272.TargetVar])
  else
    GetTable(A0_271, A1_272.DestVarTable, false)[A1_272.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_273, A1_274)
  if A1_274.TargetVar ~= nil then
    GetTable(A0_273, A1_274.DestVarTable, false)[A1_274.DestVar] = GetUnitSignificance(A0_273[A1_274.TargetVar])
  else
    GetTable(A0_273, A1_274.DestVarTable, false)[A1_274.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_275, A1_276)
  if A1_276.TargetVar ~= nil then
    GetTable(A0_275, A1_276.DestVarTable, false)[A1_276.DestVar] = GetArmor(A0_275[A1_276.TargetVar])
  else
    GetTable(A0_275, A1_276.DestVarTable, false)[A1_276.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_277, A1_278)
  if A1_278.TargetVar ~= nil then
    GetTable(A0_277, A1_278.DestVarTable, false)[A1_278.DestVar] = GetSpellBlock(A0_277[A1_278.TargetVar])
  else
    GetTable(A0_277, A1_278.DestVarTable, false)[A1_278.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_279, A1_280)
  if A1_280.TargetVar ~= nil then
    GetTable(A0_279, A1_280.DestVarTable, false)[A1_280.DestVar] = GetTeamID(A0_279[A1_280.TargetVar])
  else
    GetTable(A0_279, A1_280.DestVarTable, false)[A1_280.DestVar] = GetTeamID()
  end
end
BBGetTeamID = L0_0
function L0_0(A0_281, A1_282)
  local L2_283, L3_284, L4_285
  L2_283 = GetTable
  L3_284 = A0_281
  L4_285 = A1_282.DestVarTable
  L2_283 = L2_283(L3_284, L4_285, false)
  L3_284 = A1_282.TargetVar
  L4_285 = nil
  if L3_284 ~= nil then
    L4_285 = GetTeamID(A0_281[L3_284])
  else
    L4_285 = GetTeamID()
  end
  if L4_285 == TEAM_ORDER then
    L2_283[A1_282.DestVar] = TEAM_CHAOS
  elseif L4_285 == TEAM_CHAOS then
    L2_283[A1_282.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_286, A1_287)
  if A1_287.TargetVar ~= nil then
    GetTable(A0_286, A1_287.DestVarTable, false)[A1_287.DestVar] = GetUnitSkinName(A0_286[A1_287.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_288, A1_289)
  if A1_289.TargetVar ~= nil then
    GetTable(A0_288, A1_289.DestVarTable, false)[A1_289.DestVar] = GetTotalAttackDamage(A0_288[A1_289.TargetVar])
  else
    GetTable(A0_288, A1_289.DestVarTable, false)[A1_289.DestVar] = GetTotalAttackDamage()
  end
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_290, A1_291)
  GetTable(A0_290, A1_291.DestVarTable, true)[A1_291.DestVar] = A1_291.Status(A0_290[A1_291.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_292, A1_293)
  local L2_294
  L2_294 = A1_293.TargetVar
  L2_294 = A0_292[L2_294]
  ClearAttackTarget(L2_294)
end
BBClearAttackTarget = L0_0
function L0_0(A0_295, A1_296)
  GetTable(A0_295, A1_296.DestVarTable, true)[A1_296.DestVar] = A1_296.Info(A0_295[A1_296.TargetVar])
end
BBGetCastInfo = L0_0
function L0_0(A0_297, A1_298, A2_299)
  local L3_300, L4_301, L5_302, L6_303
  L3_300 = GetTable
  L4_301 = A0_297
  L5_302 = A1_298.TrackTimeVarTable
  L6_303 = false
  L3_300 = L3_300(L4_301, L5_302, L6_303)
  L4_301 = GetTime
  L4_301 = L4_301()
  L5_302 = A1_298.ExecuteImmediately
  L6_303 = A1_298.TimeBetweenExecutions
  if A1_298.TickTimeVar ~= nil and GetTable(A0_297, A1_298.TickTimeVarTable, false)[A1_298.TickTimeVar] ~= nil then
    L6_303 = GetTable(A0_297, A1_298.TickTimeVarTable, false)[A1_298.TickTimeVar]
  end
  if L3_300[A1_298.TrackTimeVar] == nil then
    L3_300[A1_298.TrackTimeVar] = L4_301
    if L5_302 == true then
      ExecuteBuildingBlocks(A2_299, A0_297)
    end
  end
  if L4_301 >= L3_300[A1_298.TrackTimeVar] + L6_303 then
    L3_300[A1_298.TrackTimeVar] = L3_300[A1_298.TrackTimeVar] + L6_303
    ExecuteBuildingBlocks(A2_299, A0_297)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_304, A1_305, A2_306)
  GetTable(A0_304, A1_305.TrackTimeVarTable, false)[A1_305.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_307, A1_308)
  local L2_309
  L2_309 = A1_308.SrcValue
  if A1_308.SrcVar ~= nil then
    L2_309 = GetTable(A0_307, A1_308.SrcVarTable, true)[A1_308.SrcVar]
  end
  A1_308.Status(A0_307[A1_308.TargetVar], L2_309)
end
BBSetStatus = L0_0
function L0_0(A0_310, A1_311)
  local L2_312
  L2_312 = A1_311.ToAlert
  if GetTable(A0_310, A1_311.SrcVarTable, false) ~= nil and A1_311.SrcVar ~= nil then
    L2_312 = L2_312 .. GetTable(A0_310, A1_311.SrcVarTable, false)[A1_311.SrcVar]
  end
  _ALERT(L2_312)
end
BBAlert = L0_0
function L0_0(A0_313, A1_314)
  local L2_315, L3_316, L4_317
  L2_315 = A1_314.ToSay
  L3_316 = GetTable
  L4_317 = A0_313
  L3_316 = L3_316(L4_317, A1_314.SrcVarTable, false)
  if L3_316 ~= nil then
    L4_317 = A1_314.SrcVar
    if L4_317 ~= nil then
      L4_317 = L2_315
      L2_315 = L4_317 .. tostring(L3_316[A1_314.SrcVar])
    end
  end
  L4_317 = nil
  if A1_314.OwnerVar ~= nil then
    L4_317 = A0_313[A1_314.OwnerVar]
  else
    L4_317 = A0_313.Owner
  end
  if A1_314.TextType == nil then
    A1_314.TextType = 0
  end
  Say(L4_317, L2_315, A1_314.TextType)
end
BBSay = L0_0
function L0_0(A0_318, A1_319)
  local L2_320, L3_321, L4_322
  L2_320 = A1_319.ToSay
  L3_321 = GetTable
  L4_322 = A0_318
  L3_321 = L3_321(L4_322, A1_319.SrcVarTable, false)
  if L3_321 ~= nil then
    L4_322 = A1_319.SrcVar
    if L4_322 ~= nil then
      L4_322 = L2_320
      L2_320 = L4_322 .. tostring(L3_321[A1_319.SrcVar])
    end
  end
  L4_322 = nil
  if A1_319.OwnerVar ~= nil then
    L4_322 = A0_318[A1_319.OwnerVar]
  else
    L4_322 = A0_318.Owner
  end
  if A1_319.TextType == nil then
    A1_319.TextType = 0
  end
  Say(L4_322, L2_320, A1_319.TextType)
end
BBDebugSay = L0_0
function L0_0(A0_323, A1_324)
  GetTable(A0_323, A1_324.DestVarTable, true)[A1_324.DestVar] = BBLuaGetGold(A0_323, A1_324)
end
BBGetGold = L0_0
function L0_0(A0_325, A1_326)
  SpellBuffAdd(A0_325[A1_326.OwnerVar], A0_325[A1_326.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_325.NextBuffVars)
  BBTeleportToPositionHelper(A0_325, A1_326)
end
BBTeleportToPosition = L0_0
function L0_0(A0_327, A1_328)
  if A1_328.XVar ~= nil and GetTable(A0_327, A1_328.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_327, A1_328.XVarTable, true)[A1_328.XVar]
  else
    Xloc = A1_328.X
  end
  if A1_328.YVar ~= nil and GetTable(A0_327, A1_328.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_327, A1_328.YVarTable, true)[A1_328.YVar]
  else
    Yloc = A1_328.Y
  end
  if A1_328.ZVar ~= nil and GetTable(A0_327, A1_328.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_327, A1_328.ZVarTable, true)[A1_328.ZVar]
  else
    Zloc = A1_328.Z
  end
  A1_328.OwnerVar, A0_327.position = A1_328.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_328.CastPositionName = "position"
  BBTeleportToPosition(A0_327, A1_328)
end
BBTeleportToPoint = L0_0
function L0_0(A0_329, A1_330)
  DefUpdateAura(GetTable(A0_329, A1_330.CenterTable, false)[A1_330.CenterVar], A1_330.Range, A1_330.UnitScan, A1_330.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_331, A1_332)
  ReincarnateNonDeadHero(GetTable(A0_331, A1_332.TargetTable, false)[A1_332.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_333, A1_334)
  GetTable(A0_333, A1_334.DestVarTable, true)[A1_334.DestVar] = A1_334.Function(A0_333[A1_334.OwnerVar], A1_334.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_335, A1_336)
  local L2_337, L3_338, L4_339, L5_340
  L2_337 = A1_336.WhomToOrderVar
  L2_337 = A0_335[L2_337]
  L3_338 = A1_336.TargetOfOrderVar
  L3_338 = A0_335[L3_338]
  L4_339 = GetTable
  L5_340 = A0_335
  L4_339 = L4_339(L5_340, A1_336.SrcVarTable, false)
  L5_340 = nil
  if A1_336.SrcVar ~= nil and L4_339 ~= nil then
    L5_340 = L4_339[A1_336.SrcVar]
  else
    L5_340 = GetPosition(L3_338)
  end
  if L3_338 == nil then
    L3_338 = L2_337
  end
  IssueOrder(L2_337, A1_336.Order, L5_340, L3_338)
end
BBIssueOrder = L0_0
function L0_0(A0_341, A1_342)
  local L2_343
  L2_343 = GetParam
  L2_343 = L2_343("NewRange", A0_341, A1_342)
  SetSpellCastRange(L2_343)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_344, A1_345)
  GetTable(A0_344, A1_345.DestVarTable, true)[A1_345.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_346, A1_347)
  local L2_348, L3_349
  L2_348 = A1_347.ObjectVar1
  L2_348 = A0_346[L2_348]
  L3_349 = A1_347.ObjectVar2
  L3_349 = A0_346[L3_349]
  GetTable(A0_346, A1_347.DestVarTable, true)[A1_347.DestVar] = DistanceBetweenObjectBounds(L2_348, L3_349)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_350, A1_351)
  local L2_352, L3_353, L4_354
  L2_352 = A1_351.ObjectVar
  L2_352 = A0_350[L2_352]
  L3_353 = GetTable
  L4_354 = A0_350
  L3_353 = L3_353(L4_354, A1_351.PointVarTable, true)
  L4_354 = A1_351.PointVar
  L4_354 = L3_353[L4_354]
  GetTable(A0_350, A1_351.DestVarTable, true)[A1_351.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_352, L4_354)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_355, A1_356)
  local L2_357, L3_358
  L2_357 = GetParam
  L3_358 = "Point1"
  L2_357 = L2_357(L3_358, A0_355, A1_356)
  L3_358 = GetParam
  L3_358 = L3_358("Point2", A0_355, A1_356)
  GetTable(A0_355, A1_356.DestVarTable, true)[A1_356.DestVar] = DistanceBetweenPoints(L2_357, L3_358)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_359, A1_360, A2_361)
  local L3_362, L4_363, L5_364, L6_365, L7_366, L8_367
  L5_364 = 0
  L6_365 = nil
  L7_366 = A1_360.ObjectDistanceType
  L8_367 = A1_360.ObjectVar1
  L3_362 = A0_359[L8_367]
  L8_367 = A1_360.ObjectVar2
  L4_363 = A0_359[L8_367]
  if nil == L4_363 then
    L8_367 = A1_360.Point2Var
    if nil ~= L8_367 then
      L8_367 = GetTable
      L8_367 = L8_367(A0_359, A1_360.Point2VarTable, true)
      L4_363 = L8_367[A1_360.Point2Var]
      L5_364 = L5_364 + 1
    end
  end
  if nil == L3_362 then
    L8_367 = A1_360.Point1Var
    if nil ~= L8_367 then
      L8_367 = GetTable
      L8_367 = L8_367(A0_359, A1_360.Point1VarTable, true)
      L3_362 = L8_367[A1_360.Point1Var]
      L5_364 = L5_364 + 1
      if 1 == L5_364 then
        L3_362, L4_363 = L4_363, L3_362
      end
    end
  end
  if nil ~= L7_366 then
    if 0 == L5_364 then
      L8_367 = OBJECT_CENTER
      if L8_367 == L7_366 then
        L6_365 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_367 = OBJECT_BOUNDARY
        if L8_367 == L7_366 then
          L6_365 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_367 = A1_360.OwnerVar
          L8_367 = A0_359[L8_367]
          Say(L8_367, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_364 then
      L8_367 = OBJECT_CENTER
      if L8_367 == L7_366 then
        L6_365 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_367 = OBJECT_BOUNDARY
        if L8_367 == L7_366 then
          L6_365 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_367 = A1_360.OwnerVar
          L8_367 = A0_359[L8_367]
          Say(L8_367, "invalid object distance type", 0)
        end
      end
    else
      L6_365 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_367 = A1_360.Distance
  if A1_360.DistanceVar ~= nil and GetTable(A0_359, A1_360.DistanceVarTable, true) ~= nil then
    L8_367 = L8_367 + GetTable(A0_359, A1_360.DistanceVarTable, true)[A1_360.DistanceVar]
  end
  if L3_362 ~= nil and L4_363 ~= nil and L6_365 ~= nil and L8_367 ~= nil then
    if not L6_365(L3_362, L4_363, L8_367) then
      ExecuteBuildingBlocks(A2_361, A0_359)
      A0_359.LastIfSucceeded = true
    else
      A0_359.LastIfSucceeded = false
    end
  else
    A0_359.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_368, A1_369)
  local L2_370, L3_371
  L2_370 = A1_369.TargetVar
  L2_370 = A0_368[L2_370]
  L3_371 = A1_369.CasterVar
  L3_371 = A0_368[L3_371]
  GetTable(A0_368, A1_369.DestVarTable, true)[A1_369.DestVar] = SpellBuffCount(L2_370, A1_369.BuffName, L3_371)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_372, A1_373)
  local L2_374
  L2_374 = A1_373.TargetVar
  L2_374 = A0_372[L2_374]
  GetTable(A0_372, A1_373.DestVarTable, true)[A1_373.DestVar] = SpellBuffCount(L2_374, A1_373.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_375, A1_376)
  local L2_377, L3_378
  L2_377 = GetTable
  L3_378 = A0_375
  L2_377 = L2_377(L3_378, A1_376.ScaleVarTable, false)
  L3_378 = nil
  if A1_376.OwnerVar ~= nil then
    L3_378 = A0_375[A1_376.OwnerVar]
  else
    L3_378 = A0_375.Owner
  end
  if A1_376.ScaleVar ~= nil and A1_376.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_377[A1_376.ScaleVar], L3_378)
  else
    SetScaleSkinCoef(A1_376.Scale, L3_378)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_379, A1_380)
  SpellBuffAdd(A0_379[A1_380.TargetVar], A0_379[A1_380.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_379.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_381, A1_382, A2_383)
  local L3_384, L4_385
  L3_384 = A1_382.TargetVar
  L3_384 = A0_381[L3_384]
  L4_385 = A1_382.NumStacks
  if GetParam("NumStacks", A0_381, A1_382) == 0 then
    L4_385 = SpellBuffCount(L3_384, A1_382.BuffName, caster)
  else
    L4_385 = GetParam("NumStacks", A0_381, A1_382)
  end
  while L4_385 > 0 do
    SpellBuffRemove(L3_384, A1_382.BuffName, A0_381[A1_382.AttackerVar])
    L4_385 = L4_385 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_386, A1_387, A2_388)
  if A0_386.EmoteId == A1_387.EmoteId then
    ExecuteBuildingBlocks(A2_388, A0_386)
    A0_386.LastIfSucceeded = true
  else
    A0_386.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_389, A1_390, A2_391)
  if A0_389.EmoteId ~= A1_390.EmoteId then
    ExecuteBuildingBlocks(A2_391, A0_389)
    A0_389.LastIfSucceeded = true
  else
    A0_389.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
