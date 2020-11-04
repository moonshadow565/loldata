BuffTextureName = ""
BuffName = ""
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "OwnerVar"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Renekton_Weapon_CoolOff.troy",
      Flags = 0,
      EffectIDVar = "a",
      BoneName = "head",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Nothing",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "OwnerVar",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "renekton_weapon_cooloff.troy"
    }
  }
}
