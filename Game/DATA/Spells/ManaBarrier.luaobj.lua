NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Blitzcrank_ManaBarrier.dds"
BuffName = "ManaBarrier"
AutoBuffActivateEffect = ""
AutoCooldownByLevel = {
  0,
  0,
  0,
  0,
  0
}
NonDispellable = true
OnPreDamagePriority = 3
DoOnPreDamageInExpirationOrder = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "SteamGolemShield.troy",
      Flags = 0,
      EffectIDVar = "asdf1",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "CurMana",
      OwnerVar = "Owner",
      Function = GetPAR,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CurMana",
      Src1Value = 0,
      Src2Value = 0.5,
      DestVar = "ManaShield",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ManaShield",
      DestVarTable = "InstanceVars",
      SrcVar = "ManaShield"
    }
  },
  {
    Function = BBIncreaseShield,
    Params = {
      UnitVar = "Owner",
      AmountVar = "ManaShield",
      AmountVarTable = "InstanceVars",
      Amount = 0,
      MagicShield = true,
      PhysicalShield = true
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "asdf1",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "ManaShield",
      Src1VarTable = "InstanceVars",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBRemoveShield,
        Params = {
          UnitVar = "Owner",
          AmountVar = "ManaShield",
          AmountVarTable = "InstanceVars",
          Amount = 0,
          MagicShield = true,
          PhysicalShield = true
        }
      }
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "oldArmorAmount",
      DestVarTable = "InstanceVars",
      SrcVar = "ManaShield",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "ManaShield",
      Src1VarTable = "InstanceVars",
      Src2Var = "DamageAmount",
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "ManaShield",
          Src1VarTable = "InstanceVars",
          Src2Var = "DamageAmount",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "ManaShield",
          DestVarTable = "InstanceVars",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamageAmount",
          SrcValue = 0
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "oldArmorAmount",
          Src1VarTable = "InstanceVars",
          Src2Var = "ManaShield",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "oldArmorAmount",
          DestVarTable = "InstanceVars",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBReduceShield,
        Params = {
          UnitVar = "Owner",
          AmountVar = "oldArmorAmount",
          AmountVarTable = "InstanceVars",
          Amount = 0,
          MagicShield = true,
          PhysicalShield = true
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "SteamGolemShield_hit.troy",
          Flags = 0,
          TargetObjectVar = "Owner",
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
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageAmount",
          Src2Var = "ManaShield",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageAmount",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "ManaShield",
          DestVarTable = "InstanceVars",
          SrcValue = 0
        }
      },
      {
        Function = BBReduceShield,
        Params = {
          UnitVar = "Owner",
          AmountVar = "oldArmorAmount",
          AmountVarTable = "InstanceVars",
          Amount = 0,
          MagicShield = true,
          PhysicalShield = true
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "SteamGolemShield_hit.troy",
          Flags = 0,
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
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "steamgolemshield.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "steamgolemshield_hit.troy"
    }
  }
}
