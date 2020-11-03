BuffTextureName = "Regeneration_Sigil.dds"
BuffName = "RegenerationAura"
PersistsThroughDeath = true
Nondispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "teamID"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "regen_rune_new_buf.troy",
      Flags = 0,
      EffectIDVar = "buffParticle",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "teamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = true,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBGetGameTime,
    Params = {SecondsVar = "gameTime"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "gameTime",
      Value2 = 210,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "RegenerationRune",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "buffParticle",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnDeathBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_NOT_TURRET},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_AI},
        SubBlocks = {
          {
            Function = BBGetTeamID,
            Params = {TargetVar = "Attacker", DestVar = "TeamID"}
          },
          {
            Function = BBGetUnitPosition,
            Params = {UnitVar = "Owner", PositionVar = "CastPos"}
          },
          {
            Function = BBSpawnMinion,
            Params = {
              Name = "k",
              Skin = "TestCubeRender",
              AiScript = "idle.lua",
              PosVar = "CastPos",
              Team = TEAM_UNKNOWN,
              TeamVar = "TeamID",
              Stunned = true,
              Rooted = true,
              Silenced = false,
              Invulnerable = true,
              MagicImmune = true,
              IgnoreCollision = true,
              IsWard = false,
              Placemarker = true,
              VisibilitySize = 0,
              DestVar = "Other2",
              GoldRedirectTargetVar = "Nothing"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Other2",
              AttackerVar = "Attacker",
              BuffName = "ExpirationTimer",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0.5,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBSetSpell,
            Params = {
              SlotNumber = 0,
              SlotType = SpellSlots,
              SlotBook = SPELLBOOK_CHAMPION,
              SpellName = "MonsterRegenSpell",
              TargetVar = "Other2"
            }
          },
          {
            Function = BBSpellCast,
            Params = {
              CasterVar = "Other2",
              TargetVar = "Attacker",
              PosVar = "CastPos",
              OverrideCastPosition = true,
              OverrideCastPosVar = "CastPos",
              SlotNumber = 0,
              SlotType = SpellSlots,
              OverrideForceLevel = 1,
              OverrideCoolDownCheck = false,
              FireWithoutCasting = true,
              UseAutoAttackSpell = false,
              ForceCastingOrChannelling = false,
              UpdateAutoAttackTimer = false
            }
          }
        }
      }
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 5,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "RegenerationRune"
        },
        SubBlocks = {
          {
            Function = BBGetGameTime,
            Params = {SecondsVar = "gameTime"}
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "gameTime",
              Value2 = 210,
              CompareOp = CO_GREATER_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "RegenerationRune",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 25000,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              }
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "regen_rune_new_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "regenerationrune"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "testcuberender"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monsterregenspell"
    }
  }
}
