NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
SpellDamageRatio = 0.5
IsPetDurationBuff = true
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBSpawnPet,
    Params = {
      Name = "Tibbers",
      Skin = "TempMovableChar",
      Buff = "InfernalGuardian",
      AiScript = "StormIdle.lua",
      Duration = 7,
      PosVar = "TargetPos",
      HealthBonus = 0,
      DamageBonus = 0,
      HealthBonusByLevel = {
        0,
        400,
        800,
        600,
        800
      },
      DamageBonusByLevel = {
        0,
        25,
        50
      },
      DestVar = "Other1"
    }
  },
  {
    Function = BBForNClosestUnitsInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "TargetPos",
      Range = 350,
      Flags = "AffectEnemies AffectHeroes ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1,
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Owner",
          BuffName = "ViktorChaosStormGuide",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 7,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Other1",
      SrcValue = false,
      Status = SetTargetable
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Other1",
      SrcValue = true,
      Status = SetInvulnerable
    }
  },
  {
    Function = BBStopMove,
    Params = {TargetVar = "Other1"}
  },
  {
    Function = BBPushCharacterFade,
    Params = {
      TargetVar = "Other1",
      FadeAmount = 0,
      fadeTime = 0,
      IDVar = "blah",
      IDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other1",
      AttackerVar = "Owner",
      BuffName = "ViktorChaosStormAOE",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 7,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "ViktorChaosStormTimer",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 7,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other1",
      AttackerVar = "Attacker",
      BuffName = "ViktorExpirationTimer",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 7,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 3,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "ViktorChaosStormGuide",
      TargetVar = "Owner"
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetCastSpellTargetPos,
    Params = {
      DestVar = "SpellTargetPos"
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamage",
      SrcValueByLevel = {
        150,
        250,
        350
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "APPreMod"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "APPreMod",
      Src1Value = 0.55,
      Src2Value = 0,
      DestVar = "APPostMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseDamage",
      Src2Var = "APPostMod",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "FinalDamage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBBreakSpellShields,
    Params = {TargetVar = "Target"}
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "FinalDamage",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLAOE,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 0,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBApplySilence,
    Params = {
      AttackerVar = "Owner",
      TargetVar = "Target",
      Duration = 0.5
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 2000,
      Flags = "AffectFriends AffectMinions AffectHeroes AffectUntargetable ",
      IteratorVar = "Unit",
      BuffNameFilter = "ViktorChaosStormAOE",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Unit",
          EffectName = "Viktor_ChaosStorm_hit.troy",
          Flags = 0,
          EffectIDVar = "hi",
          BoneName = "Head",
          TargetObjectVar = "Target",
          TargetBoneName = "Spine",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_NEUTRAL,
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "tempmovablechar"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "infernalguardian"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "viktorchaosstormguide"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "viktorchaosstormaoe"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "viktorchaosstormtimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "viktorexpirationtimer"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "viktor_chaosstorm_beam.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "viktor_chaosstorm_hit.troy"
    }
  }
}
