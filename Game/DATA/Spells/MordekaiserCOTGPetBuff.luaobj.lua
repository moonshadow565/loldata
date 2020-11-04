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
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Attacker",
      DestVar = "MordAP"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "StatMultiplier",
      SrcValueByLevel = {
        0.65,
        0.75,
        0.85
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MordAP",
      Src1Value = 0,
      Src2Value = 2.0E-4,
      DestVar = "StatAPCoeff",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "StatAPCoeff",
      Src2Var = "StatMultiplier",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "StatMultiplier",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBGetTotalAttackDamage,
    Params = {TargetVar = "Attacker", DestVar = "MordDamage"}
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetBaseAttackDamage,
      TargetVar = "Attacker",
      DestVar = "baseDamage"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatPhysicalDamageMod,
      TargetVar = "Attacker",
      DestVar = "additionalDamage"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "baseDamage",
      Src2Var = "additionalDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "MordDamage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "StatMultiplier",
      Src2Var = "MordDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "MordDamage",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
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
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "MordDamage",
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
      Src2Var = "StatAPCoeff",
      Src1Value = 0.5,
      Src2Value = 0,
      DestVar = "MordHealthMod",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MordHealthMod",
      Src2Var = "MordHealth",
      Src1Value = 0,
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
