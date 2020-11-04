BuffTextureName = "KogMaw_IcathianSurprise.dds"
BuffName = "KogMawIcathianSurpriseReady"
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetSkinID,
    Params = {
      UnitVar = "Attacker",
      SkinIDVar = "KogMawSkinID"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "KogMawSkinID",
      Value2 = 4,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "KogNoseGlow.troy",
          Flags = 0,
          EffectIDVar = "a",
          EffectIDVarTable = "InstanceVars",
          BoneName = "BUFFBONE_CSTM_nose",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = false,
          PersistsThroughReconnect = false,
          BindFlexToOwnerPAR = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "KogMawSkinID",
      Value2 = 6,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "Kogmaw_deepsea_glow.troy",
          Flags = 0,
          EffectIDVar = "a",
          EffectIDVarTable = "InstanceVars",
          BoneName = "BUFFBONE_CSTM_ANGLER",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = false,
          PersistsThroughReconnect = false,
          BindFlexToOwnerPAR = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      }
    }
  }
}
BuffOnDeathBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BecomeZombie",
          SrcValue = true
        }
      }
    }
  }
}
BuffOnZombieBuildingBlocks = {
  {
    Function = BBGetSkinID,
    Params = {
      UnitVar = "Owner",
      SkinIDVar = "KogMawSkinID"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "KogMawSkinID",
      Value2 = 4,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "a",
          EffectIDVarTable = "InstanceVars"
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "KogMawSkinID",
      Value2 = 6,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "a",
          EffectIDVarTable = "InstanceVars"
        }
      }
    }
  },
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "KogMawIcathianSurprise"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "KogMawIcathianSurprise",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 4,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "KogmawIcathianSurprise"
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamageAmount",
          SrcValue = 0
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kognoseglow.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kogmaw_deepsea_glow.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kogmawicathiansurprise"
    }
  }
}
