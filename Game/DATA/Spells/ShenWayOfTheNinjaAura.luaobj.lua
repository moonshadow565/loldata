BuffTextureName = "Shen_KiStrike.dds"
BuffName = "Shen Passive Aura"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBOverrideAutoAttack,
    Params = {
      SpellSlot = 0,
      SlotType = ExtraSlots,
      OwnerVar = "Owner",
      AutoAttackSpellLevel = 1,
      CancelAttack = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "shen_kiStrike_ready_indicator.troy",
      Flags = 0,
      EffectIDVar = "LeftHand",
      EffectIDVarTable = "InstanceVars",
      BoneName = "l_hand",
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
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "shen_kiStrike_ready_indicator.troy",
      Flags = 0,
      EffectIDVar = "RightHand",
      EffectIDVarTable = "InstanceVars",
      BoneName = "r_hand",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "count",
      DestVarTable = "CharVars",
      SrcValue = 0
    }
  },
  {
    Function = BBRemoveOverrideAutoAttack,
    Params = {OwnerVar = "Owner", CancelAttack = false}
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "LeftHand",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "RightHand",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "shen_kistrike_ready_indicator.troy"
    }
  }
}
