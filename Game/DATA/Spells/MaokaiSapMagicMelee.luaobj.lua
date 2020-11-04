BuffTextureName = "Maokai_SapMagicReady.dds"
BuffName = "MaokaiSapMagicMelee"
AutoBuffActivateEffect = "maokai_passive_indicator_left_eye.troy"
AutoBuffActivateAttachBoneName = "BUFFBONE_CSTM_SHIELDEYE_L"
AutoBuffActivateEffect2 = "maokai_passive_indicator_right_eye.troy"
AutoBuffActivateAttachBoneName2 = "BUFFBONE_CSTM_SHIELDEYE_R"
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetBaseAttackDamage,
      TargetVar = "Owner",
      DestVar = "BaseDamage"
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "BaseDamage",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_ATTACK,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "maxHealth",
      OwnerVar = "Attacker",
      Function = GetMaxHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "RegenPercent",
      SrcValue = 0.07
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "maxHealth",
      Src2Var = "RegenPercent",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "HealthToInc",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncHealth,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      DeltaVar = "HealthToInc",
      HealerVar = "Owner"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Maokai_Heal.troy",
      Flags = 0,
      EffectIDVar = "ar",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true
    }
  },
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "MaokaiSapMagicMelee"
    }
  },
  {
    Function = BBRemoveOverrideAutoAttack,
    Params = {OwnerVar = "Owner", CancelAttack = false}
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "maokai_heal.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "maokaisapmagicmelee"
    }
  }
}
