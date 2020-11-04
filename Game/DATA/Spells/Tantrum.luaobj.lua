NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "SadMummy_Tantrum.dds"
BuffName = "Tantrum"
PersistsThroughDeath = true
Nondispellable = true
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Level",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageReduction",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalReduction,
      TargetVar = "Owner",
      DeltaVar = "DamageReduction",
      Delta = 0
    }
  }
}
BuffOnBeingHitBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Cooldown",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellCooldownTime
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Cooldown",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "Cooldown",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "NewCooldown",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBSetSlotSpellCooldownTime,
        Params = {
          SrcVar = "NewCooldown",
          SrcValue = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          SpellSlotValue = 2,
          OwnerVar = "Owner"
        }
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Tantrum_cas.troy",
      Flags = 0,
      EffectIDVar = "hi",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 155,
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELL,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.5
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tantrum_cas.troy"
    }
  }
}
