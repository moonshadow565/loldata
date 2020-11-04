OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BounceCounter",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "TeamID"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "BounceCounter",
      Src1VarTable = "InstanceVars",
      Value2 = 3,
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBForNClosestUnitsInTargetArea,
        Params = {
          AttackerVar = "Attacker",
          CenterVar = "Owner",
          Range = 400,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          MaximumUnitsToPick = 1,
          BuffNameFilter = "LightningRodChain",
          InclusiveBuffFilter = false
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "kennen_btl_beam.troy",
              Flags = 0,
              EffectIDVar = "ParticleID",
              EffectIDVarTable = "InstanceVars",
              BoneName = "head",
              TargetObjectVar = "Unit",
              TargetBoneName = "root",
              SpecificUnitOnlyVar = "Unit",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamID",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true,
              PersistsThroughReconnect = false,
              BindFlexToOwnerPAR = false,
              FollowsGroundTilt = false,
              FacesTarget = false
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "BounceCounter",
              Src1VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 1,
              DestVar = "BounceCounter",
              DestVarTable = "InstanceVars",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "BounceCounter",
              DestVarTable = "NextBuffVars",
              SrcVar = "BounceCounter",
              SrcVarTable = "InstanceVars",
              SrcValue = 0
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Attacker",
              BuffName = "LightningRodChain",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 1.5,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          }
        }
      }
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Owner",
      Damage = 110,
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_PROC,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "kennen_btl_tar.troy",
      Flags = 0,
      EffectIDVar = "hi",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kennen_btl_beam.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "lightningrodchain"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kennen_btl_tar.troy"
    }
  }
}
