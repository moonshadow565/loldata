DoesntBreakShields = true
BuffTextureName = "Vayne_SilveredBolts.dds"
BuffName = "VayneSilverDebuff"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Caster", DestVar = "TeamID"}
  },
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Target",
      DestVar = "TeamIDTarget"
    }
  },
  {
    Function = BBGetBuffCountFromCaster,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      CasterVar = "Caster",
      BuffName = "VayneSilveredDebuff"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Caster",
          Range = 3000,
          Flags = "AffectEnemies AffectFriends AffectNeutral AffectMinions AffectHeroes NotAffectSelf ",
          IteratorVar = "Unit",
          BuffNameFilter = "VayneSilveredDebuff",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Caster",
              BuffName = "VayneSilveredDebuff",
              ResetDuration = 0
            }
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Caster",
              BuffName = "VayneSilveredDebuff",
              ResetDuration = 0
            }
          }
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "VayneSilverParticle1",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 3.5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Count",
      Value2 = 2,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "VayneSilverParticle1",
          ResetDuration = 0
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DoOnce2",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "vayne_W_ring2.troy",
          Flags = 0,
          EffectIDVar = "GlobeTwo",
          EffectIDVarTable = "InstanceVars",
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
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "VayneSilverParticle1",
      ResetDuration = 0
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "DoOnce2",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "GlobeTwo",
          EffectIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DoOnce2",
          DestVarTable = "InstanceVars",
          SrcValue = false
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vaynesilverparticle1"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vayne_w_ring2.troy"
    }
  }
}
