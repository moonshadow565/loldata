NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "3049_Prismatic_Sphere.dds"
BuffName = "Breathstealer"
AutoBuffActivateEffect = "GLOBAL_SLOW.TROY"
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = "ItemBreathStealer_buf.troy"
AutoBuffActivateAttachBoneName2 = "head"
SpellDamageRatio = 1
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "AbilityPowerMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "PhysicalDamageMod",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AbilityPowerMod",
      SrcVar = "AbilityPowerMod",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamageMod",
      SrcVar = "BaseDamageMod",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusDamageMod",
      SrcVar = "BonusDamageMod",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "AbilityPowerMod",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "BonusDamageMod",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "BaseDamageMod",
      Delta = 0
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "DebuffMod", SrcValue = -0.7}
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Target",
      DestVar = "CurrentAbilityPower"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatPhysicalDamageMod,
      TargetVar = "Target",
      DestVar = "CurrentBonusDamage"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetBaseAttackDamage,
      TargetVar = "Target",
      DestVar = "CurrentBaseDamage"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DebuffMod",
      Src2Var = "CurrentAbilityPower",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "AbilityPowerMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DebuffMod",
      Src2Var = "CurrentBonusDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "BonusDamageMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DebuffMod",
      Src2Var = "CurrentBaseDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "BaseDamageMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AbilityPowerMod",
      DestVarTable = "NextBuffVars",
      SrcVar = "AbilityPowerMod"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusDamageMod",
      DestVarTable = "NextBuffVars",
      SrcVar = "BonusDamageMod"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamageMod",
      DestVarTable = "NextBuffVars",
      SrcVar = "BaseDamageMod"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Owner",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatDehancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 4,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
