NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Nidalee_PrimalSurge.dds"
BuffName = "PrimalSurge"
AutoBuffActivateEffect = "nidalee_primalSurge_tar.troy"
AutoBuffActivateEffect2 = "nidalee_primalSurge_tar_flash.troy"
AutoBuffActivateAttachBoneName2 = "pelvis"
AutoBuffActivateEffect3 = "nidalee_primal_surge_attack_buf.troy"
AutoBuffActivateAttachBoneName3 = "L_hand"
AutoBuffActivateEffect4 = "nidalee_primal_surge_attack_buf.troy"
AutoBuffActivateAttachBoneName4 = "R_hand"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ASMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "ASMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ASMod",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 100,
      DestVar = "tooltip",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "tooltip",
      Index = 1
    }
  },
  {
    Function = BBApplyAssistMarker,
    Params = {
      Duration = 10,
      TargetVar = "Owner",
      SourceVar = "Attacker"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "ASMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ASMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.2,
        0.3,
        0.4,
        0.5,
        0.6
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "TempAbilityPower"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HealthToRestore",
      SrcValueByLevel = {
        75,
        120,
        165,
        210,
        255
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "TempAbilityPower",
      Src1Value = 0,
      Src2Value = 0.8,
      DestVar = "HealingBonus",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "HealingBonus",
      Src2Var = "HealthToRestore",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "HealthToRestore",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 7,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBIncHealth,
    Params = {
      TargetVar = "Target",
      Delta = 0,
      DeltaVar = "HealthToRestore",
      HealerVar = "Owner"
    }
  }
}
