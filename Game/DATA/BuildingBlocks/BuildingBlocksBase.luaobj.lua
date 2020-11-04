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
function L0_0(A0_17, A1_18, A2_19)
  if A1_18.IsConditionTrue(A0_17) then
    ExecuteBuildingBlocks(A2_19, A0_17)
  end
end
BBConditionallyExecute = L0_0
function L0_0(A0_20, A1_21)
  local L2_22, L3_23
  L2_22 = GetTable
  L3_23 = A0_20
  L2_22 = L2_22(L3_23, A1_21.SrcVarTable, false)
  L3_23 = A1_21.ToSay
  L3_23 = L3_23 or ""
  ClientPrint(tostring(L3_23) .. ": " .. type(L2_22[A1_21.SrcVar]))
end
BBPrintTypeToChat = L0_0
function L0_0(A0_24, A1_25)
  local L2_26, L3_27, L4_28, L5_29, L6_30
  L2_26 = A1_25.ToSay
  L2_26 = L2_26 or ""
  L3_27 = A1_25.Color
  L3_27 = L3_27 or "FFFFFF"
  L4_28 = GetTable
  L5_29 = A0_24
  L6_30 = A1_25.SrcVarTable
  L4_28 = L4_28(L5_29, L6_30, false)
  L5_29 = A1_25.SrcVar
  L5_29 = L4_28[L5_29]
  L6_30 = "<font color=\""
  L6_30 = L6_30 .. L3_27 .. "\">"
  L6_30 = L6_30 .. L2_26
  if type(L5_29) ~= "table" and type(L5_29) ~= "nil" then
    L6_30 = L6_30 .. " " .. tostring(L5_29)
  end
  L6_30 = L6_30 .. "</font>"
  ClientPrint(L6_30)
  if type(L5_29) == "table" then
    PrintTableToChat(L5_29)
  end
end
BBPrintToChat = L0_0
function L0_0(A0_31, A1_32)
  local L2_33, L3_34
  L2_33 = GetTable
  L3_34 = A0_31
  L2_33 = L2_33(L3_34, A1_32.TableName, true)
  L3_34 = A1_32.TableName
  L3_34 = L3_34 or "PassThroughParams"
  ClientPrint(L3_34)
  PrintTableToChat(L2_33)
end
BBPrintTableToChat = L0_0
function L0_0(A0_35, A1_36)
  local L2_37, L3_38, L4_39, L5_40, L6_41, L7_42, L8_43, L9_44, L10_45, L11_46, L12_47, L13_48
  A1_36 = A1_36 or 0
  if A1_36 > 10 then
    return
  end
  L2_37 = nil
  L3_38 = "|"
  for L7_42 = 1, A1_36 do
    L9_44 = "----"
    L3_38 = L8_43 .. L9_44
  end
  L6_41(L7_42)
  for L9_44, L10_45 in L6_41(L7_42) do
    L11_46 = nil
    L12_47 = tostring
    L13_48 = L9_44
    L12_47 = L12_47(L13_48)
    if L12_47 == "PassThroughParams" then
      L11_46 = "{{ PassThroughParams }}"
    else
      L13_48 = type
      L13_48 = L13_48(L10_45)
      if L13_48 == "table" then
        L11_46 = "Table"
      else
        L13_48 = tostring
        L13_48 = L13_48(L10_45)
        L11_46 = L13_48
      end
    end
    L13_48 = L3_38
    L13_48 = L13_48 .. L12_47 .. ": " .. L11_46
    ClientPrint(L13_48)
    if type(L10_45) == "table" then
      PrintTableToChat(L10_45, A1_36 + 1)
    end
  end
  L6_41(L7_42)
end
PrintTableToChat = L0_0
function L0_0(A0_49, A1_50, A2_51)
  local L3_52
  if A1_50 ~= nil then
    L3_52 = A0_49[A1_50]
    if L3_52 == nil and A2_51 then
      A0_49[A1_50] = {}
      return A0_49[A1_50]
    end
  end
  if L3_52 == nil then
    L3_52 = A0_49
  end
  return L3_52
end
GetTable = L0_0
function L0_0(A0_53, A1_54, A2_55)
  if A2_55[A0_53 .. "Var"] ~= nil and GetTable(A1_54, A2_55[A0_53 .. "VarTable"], false) ~= nil then
    return GetTable(A1_54, A2_55[A0_53 .. "VarTable"], false)[A2_55[A0_53 .. "Var"]]
  else
    return A2_55[A0_53]
  end
end
GetParam = L0_0
function L0_0(A0_56, A1_57)
  GetTable(A0_56, A1_57.DestVarTable, true)[A1_57.DestVar] = {}
end
BBCreateCustomTable = L0_0
function L0_0(A0_58, A1_59)
  GetTable(A0_58, A1_59.TableNameVarTable, false)[A1_59.TableNameVar] = nil
end
BBDestroyCustomTable = L0_0
function L0_0(A0_60, A1_61)
  if type(GetTable(A0_60, A1_61.DestTableVarTable, false)[A1_61.DestTableVar]) == "nil" then
    GetTable(A0_60, A1_61.DestTableVarTable, false)[A1_61.DestTableVar] = {}
  end
  if type(GetTable(A0_60, A1_61.DestTableVarTable, false)[A1_61.DestTableVar]) == "table" then
    GetTable(A0_60, A1_61.DestTableVarTable, false)[A1_61.DestTableVar][GetParam("Key", A0_60, A1_61)] = GetParam("Value", A0_60, A1_61)
  end
end
BBSetKeyValueInCustomTable = L0_0
function L0_0(A0_62, A1_63)
  if type(GetTable(A0_62, A1_63.SrcTableVarTable, false)[A1_63.SrcTableVar]) == "table" then
    GetTable(A0_62, A1_63.DestVarTable, true)[A1_63.DestVar] = GetTable(A0_62, A1_63.SrcTableVarTable, false)[A1_63.SrcTableVar][GetParam("SrcKey", A0_62, A1_63)]
  end
end
BBGetKeyValueInCustomTable = L0_0
function L0_0(A0_64, A1_65)
  local L2_66, L3_67, L4_68
  L2_66 = GetTable
  L3_67 = A0_64
  L4_68 = A1_65.DestTableVarTable
  L2_66 = L2_66(L3_67, L4_68, false)
  L3_67 = GetParam
  L4_68 = "DestIndex"
  L3_67 = L3_67(L4_68, A0_64, A1_65)
  L4_68 = GetParam
  L4_68 = L4_68("Value", A0_64, A1_65)
  if type(L2_66[A1_65.DestTableVar]) == "nil" then
    L2_66[A1_65.DestTableVar] = {}
  end
  if type(L2_66[A1_65.DestTableVar]) == "table" then
    if L3_67 then
      table.insert(L2_66[A1_65.DestTableVar], L3_67, L4_68)
      if A1_65.OutIndexVar then
        GetTable(A0_64, A1_65.OutIndexVarTable, true)[A1_65.OutIndexVar] = L3_67
      end
    else
      table.insert(L2_66[A1_65.DestTableVar], L4_68)
      if A1_65.OutIndexVar then
        GetTable(A0_64, A1_65.OutIndexVarTable, true)[A1_65.OutIndexVar] = table.getn(L2_66[A1_65.DestTableVar])
      end
    end
  end
end
BBInsertIntoInCustomTable = L0_0
function L0_0(A0_69, A1_70)
  local L2_71, L3_72
  L2_71 = GetTable
  L3_72 = A0_69
  L2_71 = L2_71(L3_72, A1_70.TableVarTable, false)
  L3_72 = GetParam
  L3_72 = L3_72("Index", A0_69, A1_70)
  if type(L2_71[A1_70.TableVar]) == "nil" then
    ClientPrint("Table specified does not exist: " .. tostring(A1_70.TableVarTable) .. "." .. tostring(A1_70.TableVar))
    return
  end
  if type(L2_71[A1_70.TableVar]) == "table" then
    if L3_72 then
      table.remove(L2_71[A1_70.TableVar], L3_72, valueData)
    else
      ClientPrint("Specified index was nil: " .. tostring(A1_70.IndexVarTable) .. "." .. tostring(A1_70.IndexVar))
    end
  end
end
BBRemoveFromCustomTable = L0_0
function L0_0(A0_73, A1_74, A2_75)
  local L3_76, L4_77, L5_78, L6_79, L7_80, L8_81
  L3_76 = GetTable
  L3_76 = L3_76(L4_77, L5_78, L6_79)
  if L4_77 == "table" then
    if L4_77 then
      for L8_81, _FORV_9_ in L5_78(L6_79) do
        table.insert(L4_77, L8_81)
      end
      L5_78(L6_79)
      for L8_81, _FORV_9_ in L5_78(L6_79) do
        GetTable(A0_73, A1_74.DestKeyVarTable, true)[A1_74.DestKeyVar] = _FORV_9_
        GetTable(A0_73, A1_74.DestValueVarTable, true)[A1_74.DestValueVar] = L3_76[A1_74.TableVar][_FORV_9_]
        ExecuteBuildingBlocks(A2_75, A0_73)
      end
    else
      for L7_80, L8_81 in L4_77(L5_78) do
        GetTable(A0_73, A1_74.DestKeyVarTable, true)[A1_74.DestKeyVar] = L7_80
        GetTable(A0_73, A1_74.DestValueVarTable, true)[A1_74.DestValueVar] = L8_81
        ExecuteBuildingBlocks(A2_75, A0_73)
      end
    end
  end
end
BBForEachInCustomTable = L0_0
function L0_0(A0_82, A1_83)
  local L2_84, L3_85
  L2_84 = GetTable
  L3_85 = A0_82
  L2_84 = L2_84(L3_85, A1_83.DestVarTable, true)
  L3_85 = nil
  if A1_83.SpellSlotVar ~= nil and GetTable(A0_82, A1_83.SpellSlotVarTable, false) ~= nil then
    L3_85 = GetTable(A0_82, A1_83.SpellSlotVarTable, false)[A1_83.SpellSlotVar]
  else
    L3_85 = A1_83.SpellSlotValue
  end
  L2_84[A1_83.DestVar] = A1_83.Function(A0_82[A1_83.OwnerVar], L3_85, A1_83.SpellbookType, A1_83.SlotType)
end
BBGetSlotSpellInfo = L0_0
function L0_0(A0_86, A1_87)
  local L2_88, L3_89, L4_90
  L2_88 = GetTable
  L3_89 = A0_86
  L4_90 = A1_87.SrcVarTable
  L2_88 = L2_88(L3_89, L4_90, false)
  L3_89 = nil
  L4_90 = A1_87.SrcVar
  if L4_90 ~= nil and L2_88 ~= nil then
    L4_90 = A1_87.SrcVar
    L3_89 = L2_88[L4_90]
  else
    L3_89 = A1_87.SrcValue
  end
  L4_90 = nil
  if A1_87.SpellSlotVar ~= nil and GetTable(A0_86, A1_87.SpellSlotVarTable, false) ~= nil then
    L4_90 = GetTable(A0_86, A1_87.SpellSlotVarTable, false)[A1_87.SpellSlotVar]
  else
    L4_90 = A1_87.SpellSlotValue
  end
  SetSlotSpellCooldownTime(A0_86[A1_87.OwnerVar], L4_90, A1_87.SpellbookType, A1_87.SlotType, L3_89)
end
BBSetSlotSpellCooldownTime = L0_0
function L0_0(A0_91, A1_92)
  if A0_91.Level ~= nil and A1_92.SrcValueByLevel ~= nil then
    A0_91.ReturnValue = A1_92.SrcValueByLevel[A0_91.Level]
  elseif A1_92.SrcVar ~= nil and GetTable(A0_91, A1_92.SrcVarTable, false) ~= nil then
    A0_91.ReturnValue = GetTable(A0_91, A1_92.SrcVarTable, false)[A1_92.SrcVar]
  else
    A0_91.ReturnValue = A1_92.SrcValue
  end
end
BBSetReturnValue = L0_0
function L0_0(A0_93, A1_94)
  if type(A0_93) == "string" and type(A1_94) == "string" then
    A0_93 = string.lower(A0_93)
    A1_94 = string.lower(A1_94)
  end
  return A0_93 == A1_94
end
CO_EQUAL = L0_0
function L0_0(A0_95, A1_96)
  if type(A0_95) == "string" and type(A1_96) == "string" then
    A0_95 = string.lower(A0_95)
    A1_96 = string.lower(A1_96)
  end
  return A0_95 ~= A1_96
end
CO_NOT_EQUAL = L0_0
function L0_0(A0_97, A1_98)
  local L2_99
  L2_99 = A0_97 < A1_98
  return L2_99
end
CO_LESS_THAN = L0_0
function L0_0(A0_100, A1_101)
  local L2_102
  L2_102 = A1_101 < A0_100
  return L2_102
end
CO_GREATER_THAN = L0_0
function L0_0(A0_103, A1_104)
  local L2_105
  L2_105 = A0_103 <= A1_104
  return L2_105
end
CO_LESS_THAN_OR_EQUAL = L0_0
function L0_0(A0_106, A1_107)
  local L2_108
  L2_108 = A1_107 <= A0_106
  return L2_108
end
CO_GREATER_THAN_OR_EQUAL = L0_0
function L0_0(A0_109, A1_110)
  return GetTeamID(A0_109) == GetTeamID(A1_110)
end
CO_SAME_TEAM = L0_0
function L0_0(A0_111, A1_112)
  return GetTeamID(A0_111) ~= GetTeamID(A1_112)
end
CO_DIFFERENT_TEAM = L0_0
function L0_0(A0_113, A1_114)
  return GetSourceType() == A1_114 or GetSourceType() == A0_113
end
CO_DAMAGE_SOURCETYPE_IS = L0_0
function L0_0(A0_115, A1_116)
  return GetSourceType() ~= A1_116 and GetSourceType() ~= A0_115
end
CO_DAMAGE_SOURCETYPE_IS_NOT = L0_0
function L0_0(A0_117)
  return IsObjectAI(A0_117)
end
CO_IS_TYPE_AI = L0_0
function L0_0(A0_118)
  return IsObjectAI(A0_118) ~= true
end
CO_IS_NOT_AI = L0_0
function L0_0(A0_119)
  return IsObjectHero(A0_119)
end
CO_IS_TYPE_HERO = L0_0
function L0_0(A0_120)
  return IsObjectHero(A0_120) ~= true
end
CO_IS_NOT_HERO = L0_0
function L0_0(A0_121)
  return IsClone(A0_121)
end
CO_IS_CLONE = L0_0
function L0_0(A0_122)
  return IsClone(A0_122) ~= true
end
CO_IS_NOT_CLONE = L0_0
function L0_0(A0_123)
  return IsMelee(A0_123)
end
CO_IS_MELEE = L0_0
function L0_0(A0_124)
  return IsMelee(A0_124) ~= true
end
CO_IS_RANGED = L0_0
function L0_0(A0_125)
  return A0_125 > math.random()
end
CO_RANDOM_CHANCE_LESS_THAN = L0_0
function L0_0(A0_126)
  return IsTurretAI(A0_126)
end
CO_IS_TYPE_TURRET = L0_0
function L0_0(A0_127)
  return IsTurretAI(A0_127) ~= true
end
CO_IS_NOT_TURRET = L0_0
function L0_0(A0_128)
  return IsDead(A0_128)
end
CO_IS_DEAD = L0_0
function L0_0(A0_129)
  return IsDead(A0_129) ~= true
end
CO_IS_NOT_DEAD = L0_0
function L0_0(A0_130)
  return IsDeadOrZombie(A0_130)
end
CO_IS_DEAD_OR_ZOMBIE = L0_0
function L0_0(A0_131, A1_132)
  return BBIsTargetInFrontOfMe(A0_131, A1_132)
end
CO_IS_TARGET_IN_FRONT_OF_ME = L0_0
function L0_0(A0_133, A1_134)
  return BBIsTargetBehindMe(A0_133, A1_134)
end
CO_IS_TARGET_BEHIND_ME = L0_0
function L0_0(A0_135)
  return IsWard(A0_135)
end
CO_IS_WARD = L0_0
function L0_0(A0_136)
  return IsStructure(A0_136)
end
CO_IS_STRUCTURE = L0_0
function L0_0(A0_137)
  return IsStructure(A0_137) ~= true
end
CO_IS_NOT_STRUCTURE = L0_0
function L0_0(A0_138, A1_139, A2_140)
  local L3_141, L4_142, L5_143, L6_144
  L3_141 = GetTable
  L4_142 = A0_138
  L5_143 = A1_139.Src1VarTable
  L6_144 = false
  L3_141 = L3_141(L4_142, L5_143, L6_144)
  L4_142 = GetTable
  L5_143 = A0_138
  L6_144 = A1_139.Src2VarTable
  L4_142 = L4_142(L5_143, L6_144, false)
  L5_143 = false
  L6_144 = nil
  if L3_141 ~= nil and A1_139.Src1Var ~= nil then
    L6_144 = L3_141[A1_139.Src1Var]
  else
    L6_144 = A1_139.Value1
  end
  if L4_142 ~= nil and A1_139.Src2Var ~= nil then
    L5_143 = A1_139.CompareOp(L6_144, L4_142[A1_139.Src2Var])
  else
    L5_143 = A1_139.CompareOp(L6_144, A1_139.Value2)
  end
  if L5_143 then
    ExecuteBuildingBlocks(A2_140, A0_138)
    A0_138.LastIfSucceeded = true
  else
    A0_138.LastIfSucceeded = false
  end
end
BBIf = L0_0
function L0_0(A0_145, A1_146, A2_147)
  if A0_145.LastIfSucceeded == false then
    ExecuteBuildingBlocks(A2_147, A0_145)
    A0_145.LastIfSucceeded = true
  end
end
BBElse = L0_0
function L0_0(A0_148, A1_149, A2_150)
  local L3_151, L4_152, L5_153, L6_154
  L3_151 = A0_148.LastIfSucceeded
  if L3_151 == false then
    L3_151 = GetTable
    L4_152 = A0_148
    L5_153 = A1_149.Src1VarTable
    L6_154 = false
    L3_151 = L3_151(L4_152, L5_153, L6_154)
    L4_152 = GetTable
    L5_153 = A0_148
    L6_154 = A1_149.Src2VarTable
    L4_152 = L4_152(L5_153, L6_154, false)
    L5_153 = false
    L6_154 = nil
    if L3_151 ~= nil and A1_149.Src1Var ~= nil then
      L6_154 = L3_151[A1_149.Src1Var]
    else
      L6_154 = A1_149.Value1
    end
    if L4_152 ~= nil and A1_149.Src2Var ~= nil then
      L5_153 = A1_149.CompareOp(L6_154, L4_152[A1_149.Src2Var])
    else
      L5_153 = A1_149.CompareOp(L6_154, A1_149.Value2)
    end
    if L5_153 then
      ExecuteBuildingBlocks(A2_150, A0_148)
      A0_148.LastIfSucceeded = true
    else
      A0_148.LastIfSucceeded = false
    end
  end
end
BBElseIf = L0_0
function L0_0(A0_155, A1_156, A2_157)
  local L3_158
  if A1_156.TargetVar ~= nil then
    L3_158 = A0_155[A1_156.TargetVar]
  else
    L3_158 = A0_155.Target
  end
  if HasBuffOfType(L3_158, A1_156.BuffType) then
    ExecuteBuildingBlocks(A2_157, A0_155)
    A0_155.LastIfSucceeded = true
  else
    A0_155.LastIfSucceeded = false
  end
end
BBIfHasBuffOfType = L0_0
function L0_0(A0_159, A1_160, A2_161)
  local L3_162, L4_163
  if A1_160.OwnerVar ~= nil then
    L3_162 = A0_159[A1_160.OwnerVar]
  else
    L3_162 = A0_159.Owner
  end
  if A1_160.AttackerVar ~= nil then
    L4_163 = A0_159[A1_160.AttackerVar]
  else
    L4_163 = A0_159.Attacker
  end
  if SpellBuffCount(L3_162, A1_160.BuffName, L4_163) > 0 then
    ExecuteBuildingBlocks(A2_161, A0_159)
    A0_159.LastIfSucceeded = true
  else
    A0_159.LastIfSucceeded = false
  end
end
BBIfHasBuff = L0_0
function L0_0(A0_164, A1_165, A2_166)
  if BBIsMissileAutoAttack(A0_164, A1_165) then
    ExecuteBuildingBlocks(A2_166, A0_164)
    A0_164.LastIfSucceeded = true
  else
    A0_164.LastIfSucceeded = false
  end
end
BBIfMissileIsAutoAttack = L0_0
function L0_0(A0_167, A1_168)
  A0_167.___BreakExecution___ = true
end
BBBreakExecution = L0_0
function L0_0(A0_169, A1_170, A2_171)
  local L3_172, L4_173
  if A1_170.OwnerVar ~= nil then
    L3_172 = A0_169[A1_170.OwnerVar]
  else
    L3_172 = A0_169.Owner
  end
  if A1_170.CasterVar ~= nil then
    L4_173 = A0_169[A1_170.CasterVar]
  else
    L4_173 = A0_169.Caster
  end
  if SpellBuffCount(L3_172, A1_170.BuffName, L4_173) <= 0 then
    ExecuteBuildingBlocks(A2_171, A0_169)
    A0_169.LastIfSucceeded = true
  else
    A0_169.LastIfSucceeded = false
  end
end
BBIfNotHasBuff = L0_0
function L0_0(A0_174, A1_175, A2_176)
  local L3_177, L4_178
  if A1_175.OwnerVar ~= nil then
    L3_177 = A0_174[A1_175.OwnerVar]
  else
    L3_177 = A0_174.Owner
  end
  if HasPARType(L3_177, A1_175.PARType) then
    ExecuteBuildingBlocks(A2_176, A0_174)
    A0_174.LastIfSucceeded = true
  else
    A0_174.LastIfSucceeded = false
  end
end
BBIfPARTypeEquals = L0_0
function L0_0(A0_179, A1_180, A2_181)
  local L3_182, L4_183
  if A1_180.OwnerVar ~= nil then
    L3_182 = A0_179[A1_180.OwnerVar]
  else
    L3_182 = A0_179.Owner
  end
  if not HasPARType(L3_182, A1_180.PARType) then
    ExecuteBuildingBlocks(A2_181, A0_179)
    A0_179.LastIfSucceeded = true
  else
    A0_179.LastIfSucceeded = false
  end
end
BBIfPARTypeNotEquals = L0_0
function L0_0(A0_184, A1_185, A2_186)
  local L3_187, L4_188, L5_189, L6_190, L7_191
  L3_187 = GetTable
  L4_188 = A0_184
  L5_189 = A1_185.Src1VarTable
  L6_190 = false
  L3_187 = L3_187(L4_188, L5_189, L6_190)
  L4_188 = GetTable
  L5_189 = A0_184
  L6_190 = A1_185.Src2VarTable
  L7_191 = false
  L4_188 = L4_188(L5_189, L6_190, L7_191)
  L5_189 = true
  while L5_189 do
    L6_190 = false
    L7_191 = nil
    if L3_187 ~= nil and A1_185.Src1Var ~= nil then
      L7_191 = L3_187[A1_185.Src1Var]
    else
      L7_191 = A1_185.Value1
    end
    if L4_188 ~= nil and A1_185.Src2Var ~= nil then
      L6_190 = A1_185.CompareOp(L7_191, L4_188[A1_185.Src2Var])
    else
      L6_190 = A1_185.CompareOp(L7_191, A1_185.Value2)
    end
    if L6_190 then
      ExecuteBuildingBlocks(A2_186, A0_184)
    else
      L5_189 = false
    end
  end
end
BBWhile = L0_0
function L0_0(A0_192, A1_193)
  return A0_192 * A1_193
end
MO_MULTIPLY = L0_0
function L0_0(A0_194, A1_195)
  return A0_194 + A1_195
end
MO_ADD = L0_0
function L0_0(A0_196, A1_197)
  return A0_196 - A1_197
end
MO_SUBTRACT = L0_0
function L0_0(A0_198, A1_199)
  return A0_198 / A1_199
end
MO_DIVIDE = L0_0
function L0_0(A0_200, A1_201)
  if A0_200 < A1_201 then
    return A0_200
  else
    return A1_201
  end
end
MO_MIN = L0_0
function L0_0(A0_202, A1_203)
  if A1_203 < A0_202 then
    return A0_202
  else
    return A1_203
  end
end
MO_MAX = L0_0
function L0_0(A0_204, A1_205)
  return A0_204 % A1_205
end
MO_MODULO = L0_0
function L0_0(A0_206)
  return math.floor(A0_206 + 0.5)
end
MO_ROUND = L0_0
function L0_0(A0_207)
  return math.ceil(A0_207)
end
MO_ROUNDUP = L0_0
function L0_0(A0_208)
  return math.floor(A0_208)
end
MO_ROUNDDOWN = L0_0
function L0_0(A0_209)
  return math.sin(math.rad(A0_209))
end
MO_SIN = L0_0
function L0_0(A0_210)
  return math.cos(math.rad(A0_210))
end
MO_COSINE = L0_0
function L0_0(A0_211)
  return math.tan(math.rad(A0_211))
end
MO_TANGENT = L0_0
function L0_0(A0_212)
  return math.deg(math.asin(A0_212))
end
MO_ASIN = L0_0
function L0_0(A0_213)
  return math.deg(math.acos(A0_213))
end
MO_ACOS = L0_0
function L0_0(A0_214)
  return math.deg(math.atan(A0_214))
end
MO_ATAN = L0_0
function L0_0(A0_215, A1_216)
  return math.pow(A0_215, A1_216)
end
MO_POW = L0_0
function L0_0(A0_217)
  return math.sqrt(A0_217)
end
MO_SQUARE_ROOT = L0_0
function L0_0(A0_218, A1_219)
  local L2_220
  L2_220 = A0_218 and A1_219
  return L2_220
end
MO_BOOLEAN_AND = L0_0
function L0_0(A0_221, A1_222)
  local L2_223
  L2_223 = A0_221 or A1_222
  return L2_223
end
MO_BOOLEAN_OR = L0_0
function L0_0(A0_224)
  local L1_225
  L1_225 = not A0_224
  return L1_225
end
MO_BOOLEAN_NOT = L0_0
function L0_0(A0_226)
  return math.abs(A0_226)
end
MO_ABS = L0_0
function L0_0(A0_227, A1_228)
  return math.random(A0_227, A1_228)
end
MO_RAND_INT_RANGE = L0_0
function L0_0(A0_229, A1_230)
  local L2_231, L3_232
  L2_231 = GetMathNumber
  L3_232 = A0_229
  L2_231 = L2_231(L3_232, A1_230.Src1VarTable, A1_230.Src1Var, A1_230.Src1Value)
  L3_232 = GetMathNumber
  L3_232 = L3_232(A0_229, A1_230.Src2VarTable, A1_230.Src2Var, A1_230.Src2Value)
  GetTable(A0_229, A1_230.DestVarTable)[A1_230.DestVar] = A1_230.MathOp(L2_231, L3_232)
end
BBMath = L0_0
function L0_0(A0_233, A1_234, A2_235, A3_236)
  if A2_235 ~= nil and GetTable(A0_233, A1_234)[A2_235] ~= nil then
    return GetTable(A0_233, A1_234)[A2_235]
  end
  return A3_236
end
GetMathNumber = L0_0
function L0_0(A0_237, A1_238)
  if type(A1_238) == "number" then
    return A1_238
  elseif type(A1_238) == "function" then
    return A1_238(A0_237)
  elseif type(A1_238) == "string" then
    return A0_237[A1_238]
  end
end
GetNumber = L0_0
function L0_0(A0_239, A1_240)
  return VectorAdd(A0_239, A1_240)
end
VEC_ADD = L0_0
function L0_0(A0_241, A1_242)
  return VectorSubtract(A0_241, A1_242)
end
VEC_SUBTRACT = L0_0
function L0_0(A0_243, A1_244)
  return VectorScalarMultiply(A0_243, A1_244)
end
VEC_SCALAR_MULTIPLY = L0_0
function L0_0(A0_245, A1_246)
  return VectorScalarDivide(A0_245, A1_246)
end
VEC_SCALAR_DIVIDE = L0_0
function L0_0(A0_247, A1_248)
  return VectorRotateY(A0_247, A1_248)
end
VEC_ROTATE = L0_0
function L0_0(A0_249, A1_250)
  BBMath(A0_249, A1_250)
end
BBVectorMath = L0_0
function L0_0(A0_251, A1_252)
  local L2_253, L3_254, L4_255, L5_256
  L2_253 = A0_251.InstanceVars
  L3_254 = L2_253.InterpDelta
  if L3_254 == nil then
    L3_254 = A1_252.Amount
    L4_255 = A1_252.AmountVar
    if L4_255 ~= nil then
      L4_255 = GetTable
      L5_256 = A0_251
      L4_255 = L4_255(L5_256, A1_252.AmountVarTable)
      L5_256 = A1_252.AmountVar
      L3_254 = L4_255[L5_256]
    end
    L4_255 = GetPosition
    L5_256 = A1_252.TargetVar
    L5_256 = A0_251[L5_256]
    L4_255 = L4_255(L5_256)
    L2_253.KnockBackStart = L4_255
    L4_255 = GetNormalizedPositionDelta
    L5_256 = A1_252.TargetVar
    L5_256 = A0_251[L5_256]
    L4_255 = L4_255(L5_256, A0_251[A1_252.AttackerVar], true)
    L5_256 = {}
    L5_256.x = L4_255.x * L3_254
    L5_256.y = 0
    L5_256.z = L4_255.z * L3_254
    L2_253.InterpDelta = L5_256
    L5_256 = GetTime
    L5_256 = L5_256()
    L2_253.StartTime = L5_256
    L5_256 = A1_252.KnockBackDuration
    L2_253.KnockBackDuration = L5_256
  end
  L3_254 = A1_252.TargetVar
  L3_254 = A0_251[L3_254]
  L4_255 = GetTime
  L4_255 = L4_255()
  L5_256 = L2_253.StartTime
  L4_255 = L4_255 - L5_256
  L5_256 = L2_253.KnockBackDuration
  L4_255 = L4_255 / L5_256
  L5_256 = {}
  L5_256.x = L2_253.KnockBackStart.x + L2_253.InterpDelta.x * L4_255
  L5_256.y = L2_253.KnockBackStart.y
  L5_256.z = L2_253.KnockBackStart.z + L2_253.InterpDelta.z * L4_255
  SetPosition(L3_254, L5_256)
end
BBKnockback = L0_0
function L0_0(A0_257, A1_258)
  local L2_259, L3_260
  L2_259 = GetParam
  L3_260 = "Left"
  L2_259 = L2_259(L3_260, A0_257, A1_258)
  L3_260 = GetParam
  L3_260 = L3_260("Right", A0_257, A1_258)
  GetTable(A0_257, A1_258.DestVarTable, true)[A1_258.DestVar] = tostring(L2_259) .. tostring(L3_260)
end
BBAppendString = L0_0
function L0_0(A0_261, A1_262)
  local L2_263
  L2_263 = 0
  if A1_262.Delta ~= nil then
    L2_263 = L2_263 + A1_262.Delta
  end
  if A1_262.DeltaByLevel ~= nil and A0_261.Level ~= nil then
    L2_263 = L2_263 + A1_262.DeltaByLevel[A0_261.Level]
  end
  if A1_262.DeltaVar ~= nil then
    L2_263 = L2_263 + GetTable(A0_261, A1_262.DeltaVarTable, true)[A1_262.DeltaVar]
  end
  if A1_262.TargetVar ~= nil then
    A1_262.Stat(L2_263, A0_261[A1_262.TargetVar])
  else
    A1_262.Stat(L2_263)
  end
end
BBIncStat = L0_0
function L0_0(A0_264, A1_265)
  local L2_266
  L2_266 = 0
  if A1_265.Delta ~= nil then
    L2_266 = L2_266 + A1_265.Delta
  end
  if A1_265.DeltaByLevel ~= nil and A0_264.Level ~= nil then
    L2_266 = L2_266 + A1_265.DeltaByLevel[A0_264.Level]
  end
  if A1_265.DeltaVar ~= nil then
    L2_266 = L2_266 + GetTable(A0_264, A1_265.DeltaVarTable, true)[A1_265.DeltaVar]
  end
  if A1_265.TargetVar ~= nil then
    A1_265.Stat(L2_266, A0_264[A1_265.TargetVar])
  else
    A1_265.Stat(L2_266)
  end
end
BBIncPermanentStat = L0_0
function L0_0(A0_267, A1_268)
  if A1_268.TargetVar ~= nil then
    GetTable(A0_267, A1_268.DestVarTable, false)[A1_268.DestVar] = A1_268.Stat(A0_267[A1_268.TargetVar])
  else
    GetTable(A0_267, A1_268.DestVarTable, false)[A1_268.DestVar] = A1_268.Stat()
  end
end
BBGetStat = L0_0
function L0_0(A0_269, A1_270)
  if A1_270.TargetVar ~= nil then
    GetTable(A0_269, A1_270.DestVarTable, false)[A1_270.DestVar] = GetLevel(A0_269[A1_270.TargetVar])
  else
    GetTable(A0_269, A1_270.DestVarTable, false)[A1_270.DestVar] = GetLevel()
  end
end
BBGetLevel = L0_0
function L0_0(A0_271, A1_272)
  if A1_272.TargetVar ~= nil then
    GetTable(A0_271, A1_272.DestVarTable, false)[A1_272.DestVar] = GetUnitSignificance(A0_271[A1_272.TargetVar])
  else
    GetTable(A0_271, A1_272.DestVarTable, false)[A1_272.DestVar] = GetUnitSignificance()
  end
end
BBGetUnitSignificance = L0_0
function L0_0(A0_273, A1_274)
  if A1_274.TargetVar ~= nil then
    GetTable(A0_273, A1_274.DestVarTable, false)[A1_274.DestVar] = GetArmor(A0_273[A1_274.TargetVar])
  else
    GetTable(A0_273, A1_274.DestVarTable, false)[A1_274.DestVar] = GetArmor()
  end
end
BBGetArmor = L0_0
function L0_0(A0_275, A1_276)
  if A1_276.TargetVar ~= nil then
    GetTable(A0_275, A1_276.DestVarTable, false)[A1_276.DestVar] = GetSpellBlock(A0_275[A1_276.TargetVar])
  else
    GetTable(A0_275, A1_276.DestVarTable, false)[A1_276.DestVar] = GetSpellBlock()
  end
end
BBGetSpellBlock = L0_0
function L0_0(A0_277, A1_278)
  if A1_278.TargetVar ~= nil then
    GetTable(A0_277, A1_278.DestVarTable, false)[A1_278.DestVar] = GetTeamID(A0_277[A1_278.TargetVar])
  else
    GetTable(A0_277, A1_278.DestVarTable, false)[A1_278.DestVar] = GetTeamID()
  end
end
BBGetTeamID = L0_0
function L0_0(A0_279, A1_280)
  local L2_281, L3_282, L4_283
  L2_281 = GetTable
  L3_282 = A0_279
  L4_283 = A1_280.DestVarTable
  L2_281 = L2_281(L3_282, L4_283, false)
  L3_282 = A1_280.TargetVar
  L4_283 = nil
  if L3_282 ~= nil then
    L4_283 = GetTeamID(A0_279[L3_282])
  else
    L4_283 = GetTeamID()
  end
  if L4_283 == TEAM_ORDER then
    L2_281[A1_280.DestVar] = TEAM_CHAOS
  elseif L4_283 == TEAM_CHAOS then
    L2_281[A1_280.DestVar] = TEAM_ORDER
  end
end
BBGetEnemyTeamID = L0_0
function L0_0(A0_284, A1_285)
  if A1_285.TargetVar ~= nil then
    GetTable(A0_284, A1_285.DestVarTable, false)[A1_285.DestVar] = GetUnitSkinName(A0_284[A1_285.TargetVar])
  end
end
BBGetUnitSkinName = L0_0
function L0_0(A0_286, A1_287)
  if A1_287.TargetVar ~= nil then
    GetTable(A0_286, A1_287.DestVarTable, false)[A1_287.DestVar] = GetTotalAttackDamage(A0_286[A1_287.TargetVar])
  else
    GetTable(A0_286, A1_287.DestVarTable, false)[A1_287.DestVar] = GetTotalAttackDamage()
  end
end
BBGetTotalAttackDamage = L0_0
function L0_0(A0_288, A1_289)
  GetTable(A0_288, A1_289.DestVarTable, true)[A1_289.DestVar] = A1_289.Status(A0_288[A1_289.TargetVar])
end
BBGetStatus = L0_0
function L0_0(A0_290, A1_291)
  local L2_292
  L2_292 = A1_291.TargetVar
  L2_292 = A0_290[L2_292]
  ClearAttackTarget(L2_292)
end
BBClearAttackTarget = L0_0
function L0_0(A0_293, A1_294)
  GetTable(A0_293, A1_294.DestVarTable, true)[A1_294.DestVar] = A1_294.Info(A0_293[A1_294.TargetVar])
end
BBGetCastInfo = L0_0
function L0_0(A0_295, A1_296, A2_297)
  local L3_298, L4_299, L5_300, L6_301
  L3_298 = GetTable
  L4_299 = A0_295
  L5_300 = A1_296.TrackTimeVarTable
  L6_301 = false
  L3_298 = L3_298(L4_299, L5_300, L6_301)
  L4_299 = GetTime
  L4_299 = L4_299()
  L5_300 = A1_296.ExecuteImmediately
  L6_301 = A1_296.TimeBetweenExecutions
  if A1_296.TickTimeVar ~= nil and GetTable(A0_295, A1_296.TickTimeVarTable, false)[A1_296.TickTimeVar] ~= nil then
    L6_301 = GetTable(A0_295, A1_296.TickTimeVarTable, false)[A1_296.TickTimeVar]
  end
  if L3_298[A1_296.TrackTimeVar] == nil then
    L3_298[A1_296.TrackTimeVar] = L4_299
    if L5_300 == true then
      ExecuteBuildingBlocks(A2_297, A0_295)
    end
  end
  if L4_299 >= L3_298[A1_296.TrackTimeVar] + L6_301 then
    L3_298[A1_296.TrackTimeVar] = L3_298[A1_296.TrackTimeVar] + L6_301
    ExecuteBuildingBlocks(A2_297, A0_295)
  end
end
BBExecutePeriodically = L0_0
function L0_0(A0_302, A1_303, A2_304)
  GetTable(A0_302, A1_303.TrackTimeVarTable, false)[A1_303.TrackTimeVar] = nil
end
BBExecutePeriodicallyReset = L0_0
function L0_0(A0_305, A1_306)
  local L2_307
  L2_307 = A1_306.SrcValue
  if A1_306.SrcVar ~= nil then
    L2_307 = GetTable(A0_305, A1_306.SrcVarTable, true)[A1_306.SrcVar]
  end
  A1_306.Status(A0_305[A1_306.TargetVar], L2_307)
end
BBSetStatus = L0_0
function L0_0(A0_308, A1_309)
  local L2_310
  L2_310 = A1_309.ToAlert
  if GetTable(A0_308, A1_309.SrcVarTable, false) ~= nil and A1_309.SrcVar ~= nil then
    L2_310 = L2_310 .. GetTable(A0_308, A1_309.SrcVarTable, false)[A1_309.SrcVar]
  end
  _ALERT(L2_310)
end
BBAlert = L0_0
function L0_0(A0_311, A1_312)
  local L2_313, L3_314, L4_315
  L2_313 = A1_312.ToSay
  L3_314 = GetTable
  L4_315 = A0_311
  L3_314 = L3_314(L4_315, A1_312.SrcVarTable, false)
  if L3_314 ~= nil then
    L4_315 = A1_312.SrcVar
    if L4_315 ~= nil then
      L4_315 = L2_313
      L2_313 = L4_315 .. tostring(L3_314[A1_312.SrcVar])
    end
  end
  L4_315 = nil
  if A1_312.OwnerVar ~= nil then
    L4_315 = A0_311[A1_312.OwnerVar]
  else
    L4_315 = A0_311.Owner
  end
  if A1_312.TextType == nil then
    A1_312.TextType = 0
  end
  Say(L4_315, L2_313, A1_312.TextType)
end
BBSay = L0_0
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
BBDebugSay = L0_0
function L0_0(A0_321, A1_322)
  GetTable(A0_321, A1_322.DestVarTable, true)[A1_322.DestVar] = BBLuaGetGold(A0_321, A1_322)
end
BBGetGold = L0_0
function L0_0(A0_323, A1_324)
  SpellBuffAdd(A0_323[A1_324.OwnerVar], A0_323[A1_324.OwnerVar], "TeleportMarker", 0, 1, 25000, A0_323.NextBuffVars)
  BBTeleportToPositionHelper(A0_323, A1_324)
end
BBTeleportToPosition = L0_0
function L0_0(A0_325, A1_326)
  if A1_326.XVar ~= nil and GetTable(A0_325, A1_326.XVarTable, true) ~= nil then
    Xloc = GetTable(A0_325, A1_326.XVarTable, true)[A1_326.XVar]
  else
    Xloc = A1_326.X
  end
  if A1_326.YVar ~= nil and GetTable(A0_325, A1_326.YVarTable, true) ~= nil then
    Yloc = GetTable(A0_325, A1_326.YVarTable, true)[A1_326.YVar]
  else
    Yloc = A1_326.Y
  end
  if A1_326.ZVar ~= nil and GetTable(A0_325, A1_326.ZVarTable, true) ~= nil then
    Zloc = GetTable(A0_325, A1_326.ZVarTable, true)[A1_326.ZVar]
  else
    Zloc = A1_326.Z
  end
  A1_326.OwnerVar, A0_325.position = A1_326.OwnerVar, Make3DPoint(Xloc, Yloc, Zloc)
  A1_326.CastPositionName = "position"
  BBTeleportToPosition(A0_325, A1_326)
end
BBTeleportToPoint = L0_0
function L0_0(A0_327, A1_328)
  DefUpdateAura(GetTable(A0_327, A1_328.CenterTable, false)[A1_328.CenterVar], A1_328.Range, A1_328.UnitScan, A1_328.BuffName)
end
BBDefUpdateAura = L0_0
function L0_0(A0_329, A1_330)
  ReincarnateNonDeadHero(GetTable(A0_329, A1_330.TargetTable, false)[A1_330.TargetVar])
end
BBReincarnateHero = L0_0
function L0_0(A0_331, A1_332)
  GetTable(A0_331, A1_332.DestVarTable, true)[A1_332.DestVar] = A1_332.Function(A0_331[A1_332.OwnerVar], A1_332.PARType)
end
BBGetPAROrHealth = L0_0
function L0_0(A0_333, A1_334)
  local L2_335, L3_336, L4_337, L5_338
  L2_335 = A1_334.WhomToOrderVar
  L2_335 = A0_333[L2_335]
  L3_336 = A1_334.TargetOfOrderVar
  L3_336 = A0_333[L3_336]
  L4_337 = GetTable
  L5_338 = A0_333
  L4_337 = L4_337(L5_338, A1_334.SrcVarTable, false)
  L5_338 = nil
  if A1_334.SrcVar ~= nil and L4_337 ~= nil then
    L5_338 = L4_337[A1_334.SrcVar]
  else
    L5_338 = GetPosition(L3_336)
  end
  if L3_336 == nil then
    L3_336 = L2_335
  end
  IssueOrder(L2_335, A1_334.Order, L5_338, L3_336)
end
BBIssueOrder = L0_0
function L0_0(A0_339, A1_340)
  local L2_341
  L2_341 = GetParam
  L2_341 = L2_341("NewRange", A0_339, A1_340)
  SetSpellCastRange(L2_341)
end
BBSetSpellCastRange = L0_0
function L0_0(A0_342, A1_343)
  GetTable(A0_342, A1_343.DestVarTable, true)[A1_343.DestVar] = GetTime()
end
BBGetTime = L0_0
function L0_0(A0_344, A1_345)
  local L2_346, L3_347
  L2_346 = A1_345.ObjectVar1
  L2_346 = A0_344[L2_346]
  L3_347 = A1_345.ObjectVar2
  L3_347 = A0_344[L3_347]
  GetTable(A0_344, A1_345.DestVarTable, true)[A1_345.DestVar] = DistanceBetweenObjectBounds(L2_346, L3_347)
end
BBDistanceBetweenObjects = L0_0
function L0_0(A0_348, A1_349)
  local L2_350, L3_351, L4_352
  L2_350 = A1_349.ObjectVar
  L2_350 = A0_348[L2_350]
  L3_351 = GetTable
  L4_352 = A0_348
  L3_351 = L3_351(L4_352, A1_349.PointVarTable, true)
  L4_352 = A1_349.PointVar
  L4_352 = L3_351[L4_352]
  GetTable(A0_348, A1_349.DestVarTable, true)[A1_349.DestVar] = DistanceBetweenObjectCenterAndPoint(L2_350, L4_352)
end
BBDistanceBetweenObjectAndPoint = L0_0
function L0_0(A0_353, A1_354)
  local L2_355, L3_356
  L2_355 = GetParam
  L3_356 = "Point1"
  L2_355 = L2_355(L3_356, A0_353, A1_354)
  L3_356 = GetParam
  L3_356 = L3_356("Point2", A0_353, A1_354)
  GetTable(A0_353, A1_354.DestVarTable, true)[A1_354.DestVar] = DistanceBetweenPoints(L2_355, L3_356)
end
BBDistanceBetweenPoints = L0_0
L0_0 = 1
OBJECT_CENTER = L0_0
L0_0 = 2
OBJECT_BOUNDARY = L0_0
function L0_0(A0_357, A1_358, A2_359)
  local L3_360, L4_361, L5_362, L6_363, L7_364, L8_365
  L5_362 = 0
  L6_363 = nil
  L7_364 = A1_358.ObjectDistanceType
  L8_365 = A1_358.ObjectVar1
  L3_360 = A0_357[L8_365]
  L8_365 = A1_358.ObjectVar2
  L4_361 = A0_357[L8_365]
  if nil == L4_361 then
    L8_365 = A1_358.Point2Var
    if nil ~= L8_365 then
      L8_365 = GetTable
      L8_365 = L8_365(A0_357, A1_358.Point2VarTable, true)
      L4_361 = L8_365[A1_358.Point2Var]
      L5_362 = L5_362 + 1
    end
  end
  if nil == L3_360 then
    L8_365 = A1_358.Point1Var
    if nil ~= L8_365 then
      L8_365 = GetTable
      L8_365 = L8_365(A0_357, A1_358.Point1VarTable, true)
      L3_360 = L8_365[A1_358.Point1Var]
      L5_362 = L5_362 + 1
      if 1 == L5_362 then
        L3_360, L4_361 = L4_361, L3_360
      end
    end
  end
  if nil ~= L7_364 then
    if 0 == L5_362 then
      L8_365 = OBJECT_CENTER
      if L8_365 == L7_364 then
        L6_363 = IfDistanceBetweenObjectCentersLessThan
      else
        L8_365 = OBJECT_BOUNDARY
        if L8_365 == L7_364 then
          L6_363 = IfDistanceBetweenObjectBoundsLessThan
        else
          L8_365 = A1_358.OwnerVar
          L8_365 = A0_357[L8_365]
          Say(L8_365, "invalid object distance type", 0)
        end
      end
    elseif 1 == L5_362 then
      L8_365 = OBJECT_CENTER
      if L8_365 == L7_364 then
        L6_363 = IfDistanceBetweenObjectCenterAndPointLessThan
      else
        L8_365 = OBJECT_BOUNDARY
        if L8_365 == L7_364 then
          L6_363 = IfDistanceBetweenObjectBoundAndPointLessThan
        else
          L8_365 = A1_358.OwnerVar
          L8_365 = A0_357[L8_365]
          Say(L8_365, "invalid object distance type", 0)
        end
      end
    else
      L6_363 = IfDistanceBetweenPointsLessThan
    end
  end
  L8_365 = A1_358.Distance
  if A1_358.DistanceVar ~= nil and GetTable(A0_357, A1_358.DistanceVarTable, true) ~= nil then
    L8_365 = L8_365 + GetTable(A0_357, A1_358.DistanceVarTable, true)[A1_358.DistanceVar]
  end
  if L3_360 ~= nil and L4_361 ~= nil and L6_363 ~= nil and L8_365 ~= nil then
    if not L6_363(L3_360, L4_361, L8_365) then
      ExecuteBuildingBlocks(A2_359, A0_357)
      A0_357.LastIfSucceeded = true
    else
      A0_357.LastIfSucceeded = false
    end
  else
    A0_357.LastIfSucceeded = false
  end
end
BBIfDistanceBetween = L0_0
function L0_0(A0_366, A1_367)
  local L2_368, L3_369
  L2_368 = A1_367.TargetVar
  L2_368 = A0_366[L2_368]
  L3_369 = A1_367.CasterVar
  L3_369 = A0_366[L3_369]
  GetTable(A0_366, A1_367.DestVarTable, true)[A1_367.DestVar] = SpellBuffCount(L2_368, A1_367.BuffName, L3_369)
end
BBGetBuffCountFromCaster = L0_0
function L0_0(A0_370, A1_371)
  local L2_372
  L2_372 = A1_371.TargetVar
  L2_372 = A0_370[L2_372]
  GetTable(A0_370, A1_371.DestVarTable, true)[A1_371.DestVar] = SpellBuffCount(L2_372, A1_371.BuffName, caster)
end
BBGetBuffCountFromAll = L0_0
function L0_0(A0_373, A1_374)
  local L2_375, L3_376
  L2_375 = GetTable
  L3_376 = A0_373
  L2_375 = L2_375(L3_376, A1_374.ScaleVarTable, false)
  L3_376 = nil
  if A1_374.OwnerVar ~= nil then
    L3_376 = A0_373[A1_374.OwnerVar]
  else
    L3_376 = A0_373.Owner
  end
  if A1_374.ScaleVar ~= nil and A1_374.ScaleVarTable ~= nil then
    SetScaleSkinCoef(L2_375[A1_374.ScaleVar], L3_376)
  else
    SetScaleSkinCoef(A1_374.Scale, L3_376)
  end
end
BBSetScaleSkinCoef = L0_0
function L0_0(A0_377, A1_378)
  SpellBuffAdd(A0_377[A1_378.TargetVar], A0_377[A1_378.TargetVar], "SpellShieldMarker", 0, 1, 37037, A0_377.NextBuffVars)
end
BBBreakSpellShields = L0_0
function L0_0(A0_379, A1_380, A2_381)
  local L3_382, L4_383
  L3_382 = A1_380.TargetVar
  L3_382 = A0_379[L3_382]
  L4_383 = A1_380.NumStacks
  if GetParam("NumStacks", A0_379, A1_380) == 0 then
    L4_383 = SpellBuffCount(L3_382, A1_380.BuffName, caster)
  else
    L4_383 = GetParam("NumStacks", A0_379, A1_380)
  end
  while L4_383 > 0 do
    SpellBuffRemove(L3_382, A1_380.BuffName, A0_379[A1_380.AttackerVar])
    L4_383 = L4_383 - 1
  end
end
BBSpellBuffRemoveStacks = L0_0
function L0_0(A0_384, A1_385, A2_386)
  if A0_384.EmoteId == A1_385.EmoteId then
    ExecuteBuildingBlocks(A2_386, A0_384)
    A0_384.LastIfSucceeded = true
  else
    A0_384.LastIfSucceeded = false
  end
end
BBIfEmoteIs = L0_0
function L0_0(A0_387, A1_388, A2_389)
  if A0_387.EmoteId ~= A1_388.EmoteId then
    ExecuteBuildingBlocks(A2_389, A0_387)
    A0_387.LastIfSucceeded = true
  else
    A0_387.LastIfSucceeded = false
  end
end
BBIfEmoteIsNot = L0_0
