BuffTextureName = "48thSlave_Tattoo.dds"
BuffName = "CrestoftheAncientGolem"
AutoBuffActivateEffect = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "NeutralMonster_buf_blue_defense.troy",
      Flags = 0,
      EffectIDVar = "buffParticle",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "buffParticle",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentCooldownMod,
      TargetVar = "Owner",
      Delta = -0.25
    }
  },
  {
    Function = BBGetManaOrHealth,
    Params = {
      DestVar = "MaxMana",
      OwnerVar = "Target",
      Function = GetMaxMana
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MaxMana",
      Src1Value = 0,
      Src2Value = 0.015,
      DestVar = "ManaRegen",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMPRegenMod,
      TargetVar = "Owner",
      DeltaVar = "ManaRegen",
      Delta = 0
    }
  }
}
BuffOnDeathBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Attacker",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 150,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  }
}
BuffOnPreDamageBuildingBlocks = {}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "neutralmonster_buf_blue_defense.troy"
    }
  }
}
