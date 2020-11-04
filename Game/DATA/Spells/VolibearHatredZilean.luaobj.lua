BuffTextureName = "VolibearHatredZilean.dds"
BuffName = "VolibearHatredZilean"
PersistsThroughDeath = true
NonDispellable = true
BuffOnKillBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Target",
      AttackerVar = "Target",
      BuffName = "VolibearHatred"
    },
    SubBlocks = {
      {
        Function = BBIncGold,
        Params = {TargetVar = "Attacker", Delta = 10}
      }
    }
  }
}
BuffOnPreDealDamageBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Target",
      AttackerVar = "Target",
      BuffName = "VolibearHatred"
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageAmount",
          Src1Value = 0,
          Src2Value = 1.01,
          DestVar = "DamageAmount",
          MathOp = MO_MULTIPLY
        }
      }
    }
  }
}
