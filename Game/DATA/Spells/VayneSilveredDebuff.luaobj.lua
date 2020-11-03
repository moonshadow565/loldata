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
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Count",
      Value2 = 3,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 1,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Caster",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatMagicDamageMod,
          TargetVar = "Caster",
          DestVar = "AbilityPower"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "AbilityPower",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "BonusMaxHealthDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSpellBuffRemoveStacks,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Caster",
          BuffName = "VayneSilveredDebuff",
          NumStacks = 3
        }
      },
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "TarMaxHealth",
          OwnerVar = "Owner",
          Function = GetMaxHealth,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "RankScaling",
          SrcValueByLevel = {
            0.04,
            0.05,
            0.06,
            0.07,
            0.08
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "FlatScaling",
          SrcValueByLevel = {
            20,
            30,
            40,
            50,
            60
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "RankScaling",
          Src2Var = "BonusMaxHealthDamage",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "RankScaling",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "TarMaxHealth",
          Src2Var = "RankScaling",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageToDeal",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageToDeal",
          Src2Var = "FlatScaling",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageToDeal",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "TeamIDTarget",
          Value2 = TEAM_NEUTRAL,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageToDeal",
              Src1Value = 0,
              Src2Value = 200,
              DestVar = "DamageToDeal",
              MathOp = MO_MIN
            }
          }
        }
      },
      {
        Function = BBBreakSpellShields,
        Params = {TargetVar = "Owner"}
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Caster",
          CallForHelpAttackerVar = "Caster",
          TargetVar = "Owner",
          Damage = 0,
          DamageVar = "DamageToDeal",
          DamageType = TRUE_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELL,
          PercentOfAttack = 1,
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
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
      Name = "vaynesilvereddebuff"
    }
  },
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
