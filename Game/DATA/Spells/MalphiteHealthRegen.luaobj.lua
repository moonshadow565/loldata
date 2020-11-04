BuffTextureName = "Minotaur_FerociousHowl.dds"
BuffName = "MalphiteHealthRegen"
AutoBuffActivateEffect = ""
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "HealthRegen",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "RallyingBanner_itm.troy",
      Flags = 0,
      EffectIDVar = "SandSwirl",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Target",
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
      EffectIDVar = "SandSwirl",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatHPRegenMod,
      TargetVar = "Owner",
      DeltaVar = "HealthRegen",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rallyingbanner_itm.troy"
    }
  }
}
