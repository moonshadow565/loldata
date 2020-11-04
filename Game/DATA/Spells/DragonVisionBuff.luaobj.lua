BuffTextureName = "Summoner_clairvoyance.dds"
BuffName = "Dragon Vision Buff"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "ParticlePosition",
          SrcVar = "ParticlePosition",
          SrcVarTable = "InstanceVars"
        }
      },
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Owner", DestVar = "teamID"}
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "teamID",
          Value2 = TEAM_ORDER,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Nothing",
              PosVar = "ParticlePosition",
              EffectName = "TwistedTreelineClairvoyance.troy",
              Flags = 0,
              EffectIDVar = "CastParticle",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false
            }
          },
          {
            Function = BBAddPosPerceptionBubble,
            Params = {
              TeamVar = "teamID",
              Radius = 1400,
              PosVar = "ParticlePosition",
              Duration = 90,
              SpecificUnitsClientOnlyVar = "Nothing",
              RevealSteath = false,
              BubbleIDVar = "Bubble",
              BubbleIDVarTable = "InstanceVars"
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "teamID",
          Value2 = TEAM_CHAOS,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Nothing",
              PosVar = "ParticlePosition",
              EffectName = "TwistedTreelineClairvoyance.troy",
              Flags = 0,
              EffectIDVar = "CastParticle",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false
            }
          },
          {
            Function = BBAddPosPerceptionBubble,
            Params = {
              TeamVar = "teamID",
              Radius = 1400,
              PosVar = "ParticlePosition",
              Duration = 90,
              SpecificUnitsClientOnlyVar = "Nothing",
              RevealSteath = false,
              BubbleIDVar = "Bubble",
              BubbleIDVarTable = "InstanceVars"
            }
          }
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBGetUnitPosition,
        Params = {
          UnitVar = "Owner",
          PositionVar = "ParticlePosition",
          PositionVarTable = "InstanceVars"
        }
      }
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ParticlePosition",
      RequiredVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "CastParticle",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRemovePerceptionBubble,
    Params = {
      BubbleIDVar = "Bubble",
      BubbleIDVarTable = "InstanceVars"
    }
  }
}
BuffOnDeathBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_NOT_HERO},
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "ParticlePosition",
          DestVarTable = "NextBuffVars",
          SrcVar = "ParticlePosition",
          SrcVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Attacker",
          BuffName = "DragonVisionBuff",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 90,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "twistedtreelineclairvoyance.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "dragonvisionbuff"
    }
  }
}
