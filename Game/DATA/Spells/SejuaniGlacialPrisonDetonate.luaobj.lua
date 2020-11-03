NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Sejuani_GlacialPrison.dds"
BuffName = "SejuaniGlacialPrison"
AutoBuffActivateEffect = "Stun_glb.troy"
AutoBuffActivateAttachBoneName = "BUFFBONE_GLB_GROUND_LOC"
AutoBuffActivateEffect2 = ""
PopupMessage1 = "game_floatingtext_Stunned"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetStunned
    }
  },
  {
    Function = BBPauseAnimation,
    Params = {UnitVar = "Owner", Pause = true}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "sejuani_ult_tar_04.troy",
      Flags = 0,
      EffectIDVar = "crystalineParticle",
      EffectIDVarTable = "InstanceVars",
      BoneName = "BUFFBONE_GLB_GROUND_LOC",
      TargetObjectVar = "Attacker",
      TargetBoneName = "Bird_head",
      SpecificUnitOnlyVar = "Attacker",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetStunned
    }
  },
  {
    Function = BBPauseAnimation,
    Params = {UnitVar = "Owner", Pause = false}
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "crystalineParticle",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetStunned
    }
  },
  {
    Function = BBPauseAnimation,
    Params = {UnitVar = "Owner", Pause = true}
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sejuani_ult_tar_04.troy"
    }
  }
}
