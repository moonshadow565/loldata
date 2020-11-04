BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
        SubBlocks = {
          {
            Function = BBIncStat,
            Params = {
              Stat = IncPercentArmorPenetrationMod,
              TargetVar = "Owner",
              Delta = 0.26
            }
          }
        }
      }
    }
  }
}
