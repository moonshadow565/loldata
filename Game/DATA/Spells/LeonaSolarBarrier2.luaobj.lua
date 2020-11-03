NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "LeonaSolarBarrier.dds"
BuffName = "LeonaSolarBarrier"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
SpellToggleSlot = 2
TriggersSpellCasts = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DefenseBonus",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "DefenseBonus",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "DefenseBonus",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Leona_SolarBarrier2_buf.troy",
      Flags = 0,
      EffectIDVar = "Particle",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Idle1",
      OverrideAnim = "Spell2_idle",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Idle2",
      OverrideAnim = "Spell2_idle",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Idle3",
      OverrideAnim = "Spell2_idle",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Idle4",
      OverrideAnim = "Spell2_idle",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Attack1",
      OverrideAnim = "Spell2_attack",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Attack2",
      OverrideAnim = "Spell2_attack",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Attack3",
      OverrideAnim = "Spell2_attack",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Crit",
      OverrideAnim = "Spell2_attack",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Run",
      OverrideAnim = "Spell2_run",
      OwnerVar = "Owner"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Idle1", OwnerVar = "Owner"}
  },
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Idle2", OwnerVar = "Owner"}
  },
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Idle3", OwnerVar = "Owner"}
  },
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Idle4", OwnerVar = "Owner"}
  },
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Attack1", OwnerVar = "Owner"}
  },
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Attack2", OwnerVar = "Owner"}
  },
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Attack3", OwnerVar = "Owner"}
  },
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Crit", OwnerVar = "Owner"}
  },
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Run", OwnerVar = "Owner"}
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "DefenseBonus",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "DefenseBonus",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leona_solarbarrier2_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leonasolarbarrier3.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leonasolarbarrier2.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leonasolarbarrier1.troy"
    }
  }
}
