NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "DarkChampion_EndlessRage.dds"
BuffName = "Undying Rage"
AutoBuffActivateEffect = "UndyingRage_buf.troy"
AutoBuffActivateAttachBoneName = "head"
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
AutoBuffActivateAttachBoneName3 = ""
AutoBuffActivateEffect4 = "UndyingRageSpine_glow.troy"
AutoBuffActivateAttachBoneName4 = "spine"
AutoCooldownByLevel = {
  110,
  100,
  90
}
NonDispellable = true
OnPreDamagePriority = 2
SpellFXOverrideSkins = {
  "TryndamereDemonsword"
}
SpellVOOverrideSkins = {
  "TryndamereDemonsword"
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "run",
      OverrideAnim = "run2",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "UndyingRage_glow.troy",
      Flags = 0,
      EffectIDVar = "a",
      EffectIDVarTable = "InstanceVars",
      BoneName = "L_BUFFBONE_GLB_FOOT_LOC",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "UndyingRage_glow.troy",
      Flags = 0,
      EffectIDVar = "b",
      EffectIDVarTable = "InstanceVars",
      BoneName = "R_BUFFBONE_GLB_FOOT_LOC",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "healthPercent",
      OwnerVar = "Owner",
      Function = GetHealthPercent,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "healthPercent",
      Value2 = 0.03,
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "health",
          OwnerVar = "Owner",
          Function = GetHealth,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "maxHealth",
          OwnerVar = "Owner",
          Function = GetMaxHealth,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "maxHealth",
          Src1Value = 0,
          Src2Value = 0.03,
          DestVar = "healthFactor",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "healthFactor",
          Src2Var = "health",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "healthToInc",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          DeltaVar = "healthToInc",
          HealerVar = "Owner"
        }
      }
    }
  },
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Run", OwnerVar = "Owner"}
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "a",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "b",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "CurHealth",
      OwnerVar = "Owner",
      Function = GetHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CurHealth",
      Src2Var = "DamageAmount",
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "CurHealth",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "DamageAmount",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBSay,
        Params = {
          OwnerVar = "Owner",
          ToSay = "game_lua_UndyingRage"
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
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
      Duration = 5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBIncPAR,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      PARType = PAR_OTHER,
      DeltaByLevel = {
        50,
        75,
        100
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "undyingrage_glow.troy"
    }
  }
}
