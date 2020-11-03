NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = ""
BuffName = ""
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
SpellFXOverrideSkins = {
  "ReefMalphite"
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Level",
      DestVarTable = "NextBuffVars",
      SrcVar = "Level"
    }
  },
  {
    Function = BBGetArmor,
    Params = {
      TargetVar = "Owner",
      DestVar = "ArmorAmount"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamage",
      SrcValueByLevel = {
        60,
        100,
        140,
        180,
        220
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ArmorAmount",
      Src1Value = 0,
      Src2Value = 0.7,
      DestVar = "ArmorAmount",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ArmorAmount",
      Src2Var = "BaseDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "ArmorDamage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBGetSkinID,
    Params = {
      UnitVar = "Owner",
      SkinIDVar = "MalphiteSkinID"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "MalphiteSkinID",
      Value2 = 2,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "Owner",
          EffectName = "landslide_blue_nova.troy",
          Flags = 0,
          EffectIDVar = "partname",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_NEUTRAL,
          FOWVisibilityRadius = 900,
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
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "Owner",
          EffectName = "landslide_nova.troy",
          Flags = 0,
          EffectIDVar = "partname",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_NEUTRAL,
          FOWVisibilityRadius = 900,
          SendIfOnScreenOrDiscard = true
        }
      }
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 355,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Unit",
          Damage = 0,
          DamageVar = "ArmorDamage",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Attacker",
          BuffName = "LandslideDebuff",
          BuffAddType = BUFF_STACKS_AND_OVERLAPS,
          StacksExclusive = true,
          BuffType = BUFF_Slow,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 4,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "landslide_blue_nova.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "landslide_nova.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "landslidedebuff"
    }
  }
}
