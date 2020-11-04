NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = false
BuffTextureName = "Bowmaster_ArchersMark.dds"
BuffName = "Noxious Trap"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamagePerTick",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MoveSpeedMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Activated",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBPushCharacterFade,
    Params = {
      TargetVar = "Owner",
      FadeAmount = 0.2,
      fadeTime = 2,
      IDVar = "ID",
      IDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetGhosted
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_DEAD}
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Owner",
          TargetVar = "Owner",
          Damage = 4000,
          DamageType = TRUE_DAMAGE,
          SourceDamageType = DAMAGESOURCE_INTERNALRAW,
          PercentOfAttack = 1,
          SpellDamageRatio = 1
        }
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentBubbleRadiusMod,
      TargetVar = "Owner",
      Delta = -0.7
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Activated",
      Src1VarTable = "InstanceVars",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "LifeTime",
          Value2 = 2,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Activated",
              DestVarTable = "InstanceVars",
              SrcValue = true
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "Stealth",
              BuffAddType = BUFF_REPLACE_EXISTING,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberStacks = 1,
              Duration = 600,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "BantamArmor",
              BuffAddType = BUFF_REPLACE_EXISTING,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberStacks = 1,
              Duration = 600,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          }
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Activated",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBForNClosestUnitsInTargetArea,
        Params = {
          AttackerVar = "Attacker",
          CenterVar = "Owner",
          Range = 160,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          MaximumUnitsToPick = 1
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Activated",
              DestVarTable = "InstanceVars",
              SrcValue = false
            }
          },
          {
            Function = BBGetTeamID,
            Params = {TargetVar = "Attacker", DestVar = "TeamID"}
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "Stealth"
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Nothing",
              PosVar = "Owner",
              EffectName = "ShroomMine.troy",
              Flags = 0,
              EffectIDVar = "Particle",
              TargetObjectVar = "Owner",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false
            }
          },
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Attacker",
              CenterVar = "Owner",
              Range = 450,
              Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
              IteratorVar = "Unit"
            },
            SubBlocks = {
              {
                Function = BBBreakSpellShields,
                Params = {TargetVar = "Unit"}
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "DamagePerTick",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "DamagePerTick",
                  SrcVarTable = "InstanceVars"
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "MoveSpeedMod",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "MoveSpeedMod",
                  SrcVarTable = "InstanceVars"
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "BantamTrapTarget",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  BuffType = BUFF_Slow,
                  MaxStack = 1,
                  NumberStacks = 1,
                  Duration = 5,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0
                }
              }
            }
          },
          {
            Function = BBAddPosPerceptionBubble,
            Params = {
              TeamVar = "TeamID",
              Radius = 900,
              PosVar = "Owner",
              Duration = 7,
              SpecificUnitsClientOnlyVar = "Nothing",
              RevealSteath = false,
              BubbleIDVar = "bubbleID"
            }
          },
          {
            Function = BBPushCharacterFade,
            Params = {
              TargetVar = "Owner",
              FadeAmount = 1,
              fadeTime = 0.75,
              IDVar = "ID",
              IDVarTable = "InstanceVars"
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Owner",
              TargetVar = "Owner",
              Damage = 500,
              DamageType = TRUE_DAMAGE,
              SourceDamageType = DAMAGESOURCE_INTERNALRAW,
              PercentOfAttack = 1,
              SpellDamageRatio = 1
            }
          }
        }
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "Noxious Trap",
      Skin = "BantamTrap",
      AiScript = "idle.lua",
      PosVar = "TargetPos",
      Team = TEAM_UNKNOWN,
      TeamVar = "TeamID",
      Stunned = true,
      Rooted = true,
      Silenced = false,
      Invulnerable = false,
      MagicImmune = true,
      IgnoreCollision = false,
      VisibilitySize = 0,
      DestVar = "Other3",
      GoldRedirectTargetVar = "Owner"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamagePerTick",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        70,
        100,
        130
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        -0.3,
        -0.4,
        -0.5
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Activated",
      DestVarTable = "NextBuffVars",
      SrcValue = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other3",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Invisibility,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 600,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "stealth"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "bantamarmor"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "shroommine.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "bantamtraptarget"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "bantamtrap"}
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "bantamtrap"}
  }
}
