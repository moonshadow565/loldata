BuffTextureName = "DarkChampion_EndlessRage.dds"
BuffName = "MordekaiserChildrenOfTheGravePetBuff"
IsPetDurationBuff = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "StatMultiplier",
      SrcValueByLevel = {
        0.75,
        0.75,
        0.75
      }
    }
  },
  {
    Function = BBGetTotalAttackDamage,
    Params = {TargetVar = "Attacker", DestVar = "MordDmg"}
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Attacker",
      DestVar = "MordAP"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "StatMultiplier",
      Src2Var = "MordAP",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "MordAP",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "StatMultiplier",
      Src2Var = "MordDmg",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "MordDmg",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "MordDmg",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "MordAP",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "MordHealth",
      OwnerVar = "Attacker",
      Function = GetMaxHealth,
      PARType = PAR_SHIELD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "MordHealth",
      Src1Value = 0.15,
      Src2Value = 0,
      DestVar = "PetHealth",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "MordekaiserCOTGPetBuff2"
    },
    SubBlocks = {
      {
        Function = BBIncPermanentStat,
        Params = {
          Stat = IncPermanentFlatHPPoolMod,
          TargetVar = "Owner",
          DeltaVar = "PetHealth",
          Delta = 0
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "mordekaisercotgpetbuff2"
    }
  }
}
