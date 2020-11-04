MAX_MINIONS_EVER = 180
TEAM_ORDER = 100
TEAM_CHAOS = 200
ORDER_HQ = 1
CHAOS_HQ = 2
FRONT_TOWER = 3
MIDDLE_TOWER = 2
BACK_TOWER = 1
HQ_TOWER2 = 4
HQ_TOWER1 = 5
RIGHT_LANE = 0
CENTER_LANE = 1
LEFT_LANE = 2
INITIAL_TIME_TO_SPAWN = 90
CASTER_MINION_SPAWN_FREQUENCY = 3
MINION_HEALTH_DENIAL_PERCENT = 0
MELEE_EXP_GIVEN = 64
MELEE_GOLD_GIVEN = 22
ARCHER_EXP_GIVEN = 32
ARCHER_GOLD_GIVEN = 16
CASTER_EXP_GIVEN = 100
CASTER_GOLD_GIVEN = 27
SUPER_EXP_GIVEN = 100
SUPER_GOLD_GIVEN = 27
MELEE_HEALTH_UPGRADE = 20
MELEE_DAMAGE_UPGRADE = 1
MELEE_GOLD_UPGRADE = 0.5
MELEE_EXP_UPGRADE = 5
MELEE_ARMOR_UPGRADE = 2
MELEE_MR_UPGRADE = 0.5
ARCHER_HEALTH_UPGRADE = 15
ARCHER_DAMAGE_UPGRADE = 2
ARCHER_GOLD_UPGRADE = 0.5
ARCHER_EXP_UPGRADE = 3
ARCHER_ARMOR_UPGRADE = 0.5
ARCHER_MR_UPGRADE = 2
CASTER_HEALTH_UPGRADE = 27
CASTER_DAMAGE_UPGRADE = 3
CASTER_GOLD_UPGRADE = 1
CASTER_EXP_UPGRADE = 7
CASTER_ARMOR_UPGRADE = 2
CASTER_MR_UPGRADE = 2
SUPER_HEALTH_UPGRADE = 200
SUPER_DAMAGE_UPGRADE = 10
SUPER_GOLD_UPGRADE = 0
SUPER_EXP_UPGRADE = 0
SUPER_ARMOR_UPGRADE = 0
SUPER_MR_UPGRADE = 0
MAXIMUM_MELEE_GOLD_BONUS = 10
MAXIMUM_ARCHER_GOLD_BONUS = 10
MAXIMUM_CASTER_GOLD_BONUS = 20
MAXIMUM_SUPER_GOLD_BONUS = 20
UPGRADE_MINION_TIMER = 180
MELEE_HEALTH_INHIBITOR = 100
MELEE_DAMAGE_INHIBITOR = 10
MELEE_GOLD_INHIBITOR = 0
MELEE_EXP_INHIBITOR = 0
ARCHER_HEALTH_INHIBITOR = 60
ARCHER_DAMAGE_INHIBITOR = 18
ARCHER_GOLD_INHIBITOR = 0
ARCHER_EXP_INHIBITOR = 0
CASTER_HEALTH_INHIBITOR = 200
CASTER_DAMAGE_INHIBITOR = 25
CASTER_GOLD_INHIBITOR = 0
CASTER_EXP_INHIBITOR = 0
SUPER_HEALTH_INHIBITOR = 0
SUPER_DAMAGE_INHIBITOR = 0
SUPER_GOLD_INHIBITOR = 0
SUPER_EXP_INHIBITOR = 0
EXP_GIVEN_RADIUS = 1250
DISABLE_MINION_SPAWN_BASE_TIME = 300
DISABLE_MINION_SPAWN_MAG_TIME = 0
LAST_WAVE = -1
SPECIAL_MINION_MODE = "none"
OrderNames = {
  MeleeMinionName = "Blue_Minion_Basic",
  ArcherMinionName = "Blue_Minion_Wizard",
  CasterMinionName = "Blue_Minion_MechCannon",
  SuperMinionName = "Blue_Minion_MechMelee"
}
ChaosNames = {
  MeleeMinionName = "Red_Minion_Basic",
  ArcherMinionName = "Red_Minion_Wizard",
  CasterMinionName = "Red_Minion_MechCannon",
  SuperMinionName = "Red_Minion_MechMelee"
}
SpawnTable = {
  WaveSpawnRate = 0,
  NumOfMeleeMinionsPerWave = 0,
  NumOfArcherMinionsPerWave = 0,
  NumOfCasterMinionsPerWave = 0,
  NumOfSuperMinionsPerWave = 0,
  SingleMinionSpawnDelay = 0,
  DidPowerGroup = 0,
  MeleeMinionName = 0,
  ArcherMinionName = 0,
  CasterMinionName = 0,
  SuperMinionName = 0
}
ChaosBarrack0 = {
  IsDestroyed = false,
  MeleeMinionArmor = 0,
  MeleeMinionMagicResistance = 0,
  MeleeHPBonus = 0,
  MeleeDamageBonus = 0,
  MeleeGoldBonus = 0,
  MeleeExpBonus = 0,
  MeleeExpGiven = MELEE_EXP_GIVEN,
  MeleeGoldGiven = MELEE_GOLD_GIVEN,
  ArcherMinionArmor = 0,
  ArcherMinionMagicResistance = 0,
  ArcherHPBonus = 0,
  ArcherDamageBonus = 0,
  ArcherGoldBonus = 0,
  ArcherExpBonus = 0,
  ArcherExpGiven = ARCHER_EXP_GIVEN,
  ArcherGoldGiven = ARCHER_GOLD_GIVEN,
  CasterMinionArmor = 0,
  CasterMinionMagicResistance = 0,
  CasterHPBonus = 0,
  CasterDamageBonus = 0,
  CasterGoldBonus = 0,
  CasterExpBonus = 0,
  CasterExpGiven = CASTER_EXP_GIVEN,
  SuperMinionArmor = 0,
  SuperMinionMagicResistance = 0,
  SuperHPBonus = 0,
  SuperDamageBonus = 0,
  SuperGoldBonus = 0,
  SuperExpBonus = 0,
  SuperExpGiven = SUPER_EXP_GIVEN,
  NumOfSpawnDisables = 0,
  WillSpawnSuperMinion = 0,
  MeleeMinionName = 0,
  RangedMinionName = 0,
  CasterMinionName = 0,
  CasterGoldGiven = CASTER_GOLD_GIVEN,
  SuperMinionName = 0,
  SuperGoldGiven = CASTER_GOLD_GIVEN
}
ChaosBarrack1 = {
  IsDestroyed = false,
  MeleeMinionArmor = 0,
  MeleeMinionMagicResistance = 0,
  MeleeHPBonus = 0,
  MeleeDamageBonus = 0,
  MeleeGoldBonus = 0,
  MeleeExpBonus = 0,
  MeleeExpGiven = MELEE_EXP_GIVEN,
  MeleeGoldGiven = MELEE_GOLD_GIVEN,
  ArcherMinionArmor = 0,
  ArcherMinionMagicResistance = 0,
  ArcherHPBonus = 0,
  ArcherDamageBonus = 0,
  ArcherGoldBonus = 0,
  ArcherExpBonus = 0,
  ArcherExpGiven = ARCHER_EXP_GIVEN,
  ArcherGoldGiven = ARCHER_GOLD_GIVEN,
  CasterMinionArmor = 0,
  CasterMinionMagicResistance = 0,
  CasterHPBonus = 0,
  CasterDamageBonus = 0,
  CasterGoldBonus = 0,
  CasterExpBonus = 0,
  CasterExpGiven = CASTER_EXP_GIVEN,
  SuperMinionArmor = 0,
  SuperMinionMagicResistance = 0,
  SuperHPBonus = 0,
  SuperDamageBonus = 0,
  SuperGoldBonus = 0,
  SuperExpBonus = 0,
  SuperExpGiven = SUPER_EXP_GIVEN,
  NumOfSpawnDisables = 0,
  WillSpawnSuperMinion = 0,
  MeleeMinionName = 0,
  RangedMinionName = 0,
  CasterMinionName = 0,
  CasterGoldGiven = CASTER_GOLD_GIVEN,
  SuperMinionName = 0,
  SuperGoldGiven = CASTER_GOLD_GIVEN
}
ChaosBarrack2 = {
  IsDestroyed = false,
  MeleeMinionArmor = 0,
  MeleeMinionMagicResistance = 0,
  MeleeHPBonus = 0,
  MeleeDamageBonus = 0,
  MeleeGoldBonus = 0,
  MeleeExpBonus = 0,
  MeleeExpGiven = MELEE_EXP_GIVEN,
  MeleeGoldGiven = MELEE_GOLD_GIVEN,
  ArcherMinionArmor = 0,
  ArcherMinionMagicResistance = 0,
  ArcherHPBonus = 0,
  ArcherDamageBonus = 0,
  ArcherGoldBonus = 0,
  ArcherExpBonus = 0,
  ArcherExpGiven = ARCHER_EXP_GIVEN,
  ArcherGoldGiven = ARCHER_GOLD_GIVEN,
  CasterMinionArmor = 0,
  CasterMinionMagicResistance = 0,
  CasterHPBonus = 0,
  CasterDamageBonus = 0,
  CasterGoldBonus = 0,
  CasterExpBonus = 0,
  CasterExpGiven = CASTER_EXP_GIVEN,
  SuperMinionArmor = 0,
  SuperMinionMagicResistance = 0,
  SuperHPBonus = 0,
  SuperDamageBonus = 0,
  SuperGoldBonus = 0,
  SuperExpBonus = 0,
  SuperExpGiven = SUPER_EXP_GIVEN,
  NumOfSpawnDisables = 0,
  WillSpawnSuperMinion = 0,
  MeleeMinionName = 0,
  RangedMinionName = 0,
  CasterMinionName = 0,
  CasterGoldGiven = CASTER_GOLD_GIVEN,
  SuperMinionName = 0,
  SuperGoldGiven = CASTER_GOLD_GIVEN
}
OrderBarrack0 = {
  IsDestroyed = false,
  MeleeMinionArmor = 0,
  MeleeMinionMagicResistance = 0,
  MeleeHPBonus = 0,
  MeleeDamageBonus = 0,
  MeleeGoldBonus = 0,
  MeleeExpBonus = 0,
  MeleeExpGiven = MELEE_EXP_GIVEN,
  MeleeGoldGiven = MELEE_GOLD_GIVEN,
  ArcherMinionArmor = 0,
  ArcherMinionMagicResistance = 0,
  ArcherHPBonus = 0,
  ArcherDamageBonus = 0,
  ArcherGoldBonus = 0,
  ArcherExpBonus = 0,
  ArcherExpGiven = ARCHER_EXP_GIVEN,
  ArcherGoldGiven = ARCHER_GOLD_GIVEN,
  CasterMinionArmor = 0,
  CasterMinionMagicResistance = 0,
  CasterHPBonus = 0,
  CasterDamageBonus = 0,
  CasterGoldBonus = 0,
  CasterExpBonus = 0,
  CasterExpGiven = CASTER_EXP_GIVEN,
  SuperMinionArmor = 0,
  SuperMinionMagicResistance = 0,
  SuperHPBonus = 0,
  SuperDamageBonus = 0,
  SuperGoldBonus = 0,
  SuperExpBonus = 0,
  SuperExpGiven = SUPER_EXP_GIVEN,
  NumOfSpawnDisables = 0,
  WillSpawnSuperMinion = 0,
  MeleeMinionName = 0,
  RangedMinionName = 0,
  CasterMinionName = 0,
  CasterGoldGiven = CASTER_GOLD_GIVEN,
  SuperMinionName = 0,
  SuperGoldGiven = CASTER_GOLD_GIVEN
}
OrderBarrack1 = {
  IsDestroyed = false,
  MeleeMinionArmor = 0,
  MeleeMinionMagicResistance = 0,
  MeleeHPBonus = 0,
  MeleeDamageBonus = 0,
  MeleeGoldBonus = 0,
  MeleeExpBonus = 0,
  MeleeExpGiven = MELEE_EXP_GIVEN,
  MeleeGoldGiven = MELEE_GOLD_GIVEN,
  ArcherMinionArmor = 0,
  ArcherMinionMagicResistance = 0,
  ArcherHPBonus = 0,
  ArcherDamageBonus = 0,
  ArcherGoldBonus = 0,
  ArcherExpBonus = 0,
  ArcherExpGiven = ARCHER_EXP_GIVEN,
  ArcherGoldGiven = ARCHER_GOLD_GIVEN,
  CasterMinionArmor = 0,
  CasterMinionMagicResistance = 0,
  CasterHPBonus = 0,
  CasterDamageBonus = 0,
  CasterGoldBonus = 0,
  CasterExpBonus = 0,
  CasterExpGiven = CASTER_EXP_GIVEN,
  SuperMinionArmor = 0,
  SuperMinionMagicResistance = 0,
  SuperHPBonus = 0,
  SuperDamageBonus = 0,
  SuperGoldBonus = 0,
  SuperExpBonus = 0,
  SuperExpGiven = SUPER_EXP_GIVEN,
  NumOfSpawnDisables = 0,
  WillSpawnSuperMinion = 0,
  MeleeMinionName = 0,
  RangedMinionName = 0,
  CasterMinionName = 0,
  CasterGoldGiven = CASTER_GOLD_GIVEN,
  SuperMinionName = 0,
  SuperGoldGiven = CASTER_GOLD_GIVEN
}
OrderBarrack2 = {
  IsDestroyed = false,
  MeleeMinionArmor = 0,
  MeleeMinionMagicResistance = 0,
  MeleeHPBonus = 0,
  MeleeDamageBonus = 0,
  MeleeGoldBonus = 0,
  MeleeExpBonus = 0,
  MeleeExpGiven = MELEE_EXP_GIVEN,
  MeleeGoldGiven = MELEE_GOLD_GIVEN,
  ArcherMinionArmor = 0,
  ArcherMinionMagicResistance = 0,
  ArcherHPBonus = 0,
  ArcherDamageBonus = 0,
  ArcherGoldBonus = 0,
  ArcherExpBonus = 0,
  ArcherExpGiven = ARCHER_EXP_GIVEN,
  ArcherGoldGiven = ARCHER_GOLD_GIVEN,
  CasterMinionArmor = 0,
  CasterMinionMagicResistance = 0,
  CasterHPBonus = 0,
  CasterDamageBonus = 0,
  CasterGoldBonus = 0,
  CasterExpBonus = 0,
  CasterExpGiven = CASTER_EXP_GIVEN,
  SuperMinionArmor = 0,
  SuperMinionMagicResistance = 0,
  SuperHPBonus = 0,
  SuperDamageBonus = 0,
  SuperGoldBonus = 0,
  SuperExpBonus = 0,
  SuperExpGiven = SUPER_EXP_GIVEN,
  NumOfSpawnDisables = 0,
  WillSpawnSuperMinion = 0,
  MeleeMinionName = 0,
  RangedMinionName = 0,
  CasterMinionName = 0,
  CasterGoldGiven = CASTER_GOLD_GIVEN,
  SuperMinionName = 0,
  SuperGoldGiven = CASTER_GOLD_GIVEN
}
ChaosBarracksBonuses = {
  ChaosBarrack0,
  ChaosBarrack1,
  ChaosBarrack2
}
OrderBarracksBonuses = {
  OrderBarrack0,
  OrderBarrack1,
  OrderBarrack2
}
NeutralMinionNames = {
  "AncientGolem",
  "Dragon",
  "YoungLizard"
}
function CreateLaneBuildingTable()
  return {
    Turret3 = true,
    Turret2 = true,
    Turret1 = true,
    Barracks = true
  }
end
OrderBuildingStatus = {
  CreateLaneBuildingTable(),
  CreateLaneBuildingTable(),
  CreateLaneBuildingTable(),
  HQTower2 = true,
  HQTower1 = true,
  HQ = true
}
ChaosBuildingStatus = {
  CreateLaneBuildingTable(),
  CreateLaneBuildingTable(),
  CreateLaneBuildingTable(),
  HQTower2 = true,
  HQTower1 = true,
  HQ = true
}
TotalNumberOfMinions = 0
totalNumberOfChaosBarracks = 3
totalNumberOfOrderBarracks = 3
function OnLevelInit()
  for _FORV_3_, _FORV_4_ in pairs(OrderNames) do
    PreloadCharacter(_FORV_4_)
  end
  for _FORV_3_, _FORV_4_ in pairs(ChaosNames) do
    PreloadCharacter(_FORV_4_)
  end
  PreloadSpell("RespawnClassic")
  PreloadCharacter("crystal_platform")
  PreloadCharacter("OdinNeutralGuardian")
  PreloadSpell("odinguardianbuff")
  PreloadSpell("odinminiontaunt")
  PreloadSpell("odinguardianui")
  PreloadSpell("odinguardianuidamage")
  PreloadSpell("OdinCaptureChannel")
  PreloadCharacter("Odin_Blue_Minion_Caster")
  PreloadCharacter("OdinBlueSuperminion")
  PreloadCharacter("Odin_Red_Minion_Caster")
  PreloadCharacter("OdinRedSuperminion")
  PreloadSpell("OdinMinionSpellAttack")
  PreloadCharacter("OdinSpeedShrine")
  PreloadSpell("OdinSpeedShrineAura")
  PreloadSpell("OdinShrineAura")
  PreloadCharacter("OdinShieldRelic")
  PreloadCharacter("OdinCenterRelic")
  PreloadCharacter("OdinQuestIndicator")
  PreloadCharacter("OdinTestCubeRender")
  PreloadSpell("OdinCaptureChannelBomb")
  PreloadSpell("OdinChannelVision")
  PreloadSpell("OdinParticlePHBuff")
  PreloadSpell("OdinScoreSurvivor")
  PreloadCharacter("OdinQuestBuff")
  PreloadCharacter("OdinQuestIndicator")
  PreloadSpell("OdinQuestBuff")
  PreloadSpell("OdinQuestBuffParticle")
  PreloadSpell("OdinQuestIndicator")
  PreloadSpell("OdinQuestParticleRemover")
  PreloadSpell("SpellShieldMarker")
  PreloadSpell("hpbyplayerlevel")
  PreloadSpell("burning")
  PreloadSpell("monsterbuffs")
  PreloadSpell("monsterbuffs2")
  PreloadSpell("lifestealattack")
  math.randomseed(os.time())
  LoadLevelScriptIntoScript("EndOfGame.lua", 8)
  SpawnTable.WaveSpawnRate = 30000
  SpawnTable.NumOfMeleeMinionsPerWave = 3
  SpawnTable.NumOfArcherMinionsPerWave = 3
  SpawnTable.SingleMinionSpawnDelay = 800
  SpawnTable.DidPowerGroup = false
  InitTimer("AllowDamageOnBuildings", 1, false)
end
function OnPostLevelLoad()
  LoadLevelScriptIntoScript("CreateLevelProps.lua", 8)
  CreateLevelProps()
end
function OppositeTeam(_ARG_0_)
  if _ARG_0_ == TEAM_CHAOS then
    return TEAM_ORDER
  else
    return TEAM_CHAOS
  end
end
function UpgradeMinionTimer()
end
function AllowDamageOnBuildings()
  orderTurret = GetTurret(TEAM_ORDER, 0, 1)
  SetInvulnerable(orderTurret, true)
  SetTargetable(orderTurret, false)
  chaosTurret = GetTurret(TEAM_CHAOS, 0, 1)
  SetInvulnerable(chaosTurret, true)
  SetTargetable(chaosTurret, false)
end
function GetMinionSpawnInfo(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  TableForBarrack = SpawnTable
  if TableForBarrack.DidPowerGroup then
    TableForBarrack.NumOfCasterMinionsPerWave = TableForBarrack.NumOfCasterMinionsPerWave - 1
    TableForBarrack.DidPowerGroup = false
  end
  if _ARG_1_ % CASTER_MINION_SPAWN_FREQUENCY == 0 then
    TableForBarrack.NumOfCasterMinionsPerWave = TableForBarrack.NumOfCasterMinionsPerWave + 1
    TableForBarrack.DidPowerGroup = true
  end
  if _ARG_3_ == TEAM_ORDER then
  else
  end
  TableForBarrack.ExpRadius = EXP_GIVEN_RADIUS
  lNumOfMeleeMinionsPerWave = TableForBarrack.NumOfMeleeMinionsPerWave
  lNumOfArcherMinionsPerWave = TableForBarrack.NumOfArcherMinionsPerWave
  lNumOfCasterMinionsPerWave = TableForBarrack.NumOfCasterMinionsPerWave
  lNumOfSuperMinionsPerWave = TableForBarrack.NumOfSuperMinionsPerWave
  if _ARG_4_ ~= LAST_WAVE then
    BARRACKSCOUNT = 6
    totalMinionsRemaining = MAX_MINIONS_EVER - GetTotalTeamMinionsSpawned()
    if totalMinionsRemaining <= BARRACKSCOUNT * 7 then
      if 0 >= totalMinionsRemaining then
        SPECIAL_MINION_MODE = "None"
      elseif totalMinionsRemaining >= BARRACKSCOUNT * 3 then
        SPECIAL_MINION_MODE = "3Archers"
      elseif totalMinionsRemaining >= BARRACKSCOUNT then
        SPECIAL_MINION_MODE = "SpecialPowerMinion"
      else
        SPECIAL_MINION_MODE = "None"
      end
    else
      SPECIAL_MINION_MODE = ""
    end
    LAST_WAVE = _ARG_4_
  end
  if SPECIAL_MINION_MODE == "3Archers" then
    lNumOfMeleeMinionsPerWave = 0
    lNumOfArcherMinionsPerWave = 3
    lNumOfCasterMinionsPerWave = 0
    lNumOfSuperMinionsPerWave = 0
  elseif SPECIAL_MINION_MODE == "SpecialPowerMinion" then
    lNumOfMeleeMinionsPerWave = 0
    lNumOfArcherMinionsPerWave = 0
    lNumOfCasterMinionsPerWave = 0
    lNumOfSuperMinionsPerWave = 2
  elseif SPECIAL_MINION_MODE == "None" then
    lNumOfMeleeMinionsPerWave = 0
    lNumOfArcherMinionsPerWave = 0
    lNumOfCasterMinionsPerWave = 0
    lNumOfSuperMinionsPerWave = 0
  end
  if ChaosBarracksBonuses[_ARG_0_ + 1].WillSpawnSuperMinion == 1 then
    if _ARG_3_ == TEAM_ORDER and totalNumberOfChaosBarracks == 0 or _ARG_3_ == TEAM_CHAOS and totalNumberOfOrderBarracks == 0 then
      lNumOfSuperMinionsPerWave = 2
    else
      lNumOfSuperMinionsPerWave = 1
    end
    lNumOfCasterMinionsPerWave = 0
  end
  if _ARG_3_ == TEAM_ORDER then
    ChaosBarracksBonuses[_ARG_0_ + 1].MeleeMinionName = OrderNames.MeleeMinionName
    ChaosBarracksBonuses[_ARG_0_ + 1].ArcherMinionName = OrderNames.ArcherMinionName
    ChaosBarracksBonuses[_ARG_0_ + 1].CasterMinionName = OrderNames.CasterMinionName
    ChaosBarracksBonuses[_ARG_0_ + 1].SuperMinionName = OrderNames.SuperMinionName
  else
    ChaosBarracksBonuses[_ARG_0_ + 1].MeleeMinionName = ChaosNames.MeleeMinionName
    ChaosBarracksBonuses[_ARG_0_ + 1].ArcherMinionName = ChaosNames.ArcherMinionName
    ChaosBarracksBonuses[_ARG_0_ + 1].CasterMinionName = ChaosNames.CasterMinionName
    ChaosBarracksBonuses[_ARG_0_ + 1].SuperMinionName = ChaosNames.SuperMinionName
  end
  ReturnTable = {
    NumOfMeleeMinionsPerWave = lNumOfMeleeMinionsPerWave,
    NumOfArcherMinionsPerWave = lNumOfArcherMinionsPerWave,
    NumOfCasterMinionsPerWave = lNumOfCasterMinionsPerWave,
    NumOfSuperMinionsPerWave = lNumOfSuperMinionsPerWave,
    WaveSpawnRate = TableForBarrack.WaveSpawnRate,
    SingleMinionSpawnDelay = TableForBarrack.SingleMinionSpawnDelay,
    MeleeMinionName = ChaosBarracksBonuses[_ARG_0_ + 1].MeleeMinionName,
    ArcherMinionName = ChaosBarracksBonuses[_ARG_0_ + 1].ArcherMinionName,
    CasterMinionName = ChaosBarracksBonuses[_ARG_0_ + 1].CasterMinionName,
    SuperMinionName = ChaosBarracksBonuses[_ARG_0_ + 1].SuperMinionName,
    IsDestroyed = ChaosBarracksBonuses[_ARG_0_ + 1].IsDestroyed,
    MeleeMinionArmor = ChaosBarracksBonuses[_ARG_0_ + 1].MeleeMinionArmor,
    MeleeMinionMagicResistance = ChaosBarracksBonuses[_ARG_0_ + 1].MeleeMinionMagicResistance,
    MeleeHPBonus = ChaosBarracksBonuses[_ARG_0_ + 1].MeleeHPBonus,
    MeleeDamageBonus = ChaosBarracksBonuses[_ARG_0_ + 1].MeleeDamageBonus,
    MeleeExpGiven = ChaosBarracksBonuses[_ARG_0_ + 1].MeleeExpGiven,
    MeleeGoldGiven = ChaosBarracksBonuses[_ARG_0_ + 1].MeleeGoldGiven,
    ArcherMinionArmor = ChaosBarracksBonuses[_ARG_0_ + 1].ArcherMinionArmor,
    ArcherMinionMagicResistance = ChaosBarracksBonuses[_ARG_0_ + 1].ArcherMinionMagicResistance,
    ArcherHPBonus = ChaosBarracksBonuses[_ARG_0_ + 1].ArcherHPBonus,
    ArcherDamageBonus = ChaosBarracksBonuses[_ARG_0_ + 1].ArcherDamageBonus,
    ArcherExpGiven = ChaosBarracksBonuses[_ARG_0_ + 1].ArcherExpGiven,
    ArcherGoldGiven = ChaosBarracksBonuses[_ARG_0_ + 1].ArcherGoldGiven,
    CasterMinionArmor = ChaosBarracksBonuses[_ARG_0_ + 1].CasterMinionArmor,
    CasterMinionMagicResistance = ChaosBarracksBonuses[_ARG_0_ + 1].CasterMinionMagicResistance,
    CasterHPBonus = ChaosBarracksBonuses[_ARG_0_ + 1].CasterHPBonus,
    CasterDamageBonus = ChaosBarracksBonuses[_ARG_0_ + 1].CasterDamageBonus,
    CasterExpGiven = ChaosBarracksBonuses[_ARG_0_ + 1].CasterExpGiven,
    CasterGoldGiven = ChaosBarracksBonuses[_ARG_0_ + 1].CasterGoldGiven,
    SuperMinionArmor = ChaosBarracksBonuses[_ARG_0_ + 1].SuperMinionArmor,
    SuperMinionMagicResistance = ChaosBarracksBonuses[_ARG_0_ + 1].SuperMinionMagicResistance,
    SuperHPBonus = ChaosBarracksBonuses[_ARG_0_ + 1].SuperHPBonus,
    SuperDamageBonus = ChaosBarracksBonuses[_ARG_0_ + 1].SuperDamageBonus,
    SuperExpGiven = ChaosBarracksBonuses[_ARG_0_ + 1].SuperExpGiven,
    SuperGoldGiven = ChaosBarracksBonuses[_ARG_0_ + 1].SuperGoldGiven,
    ExperienceRadius = TableForBarrack.ExpRadius
  }
  return ReturnTable
end
function DeactivateCorrectStructure(_ARG_0_, _ARG_1_, _ARG_2_)
end
function GetLuaBarracks(_ARG_0_, _ARG_1_)
  if _ARG_0_ == TEAM_ORDER then
  else
  end
  return ChaosBarracksBonuses[_ARG_1_ + 1]
end
function GetDisableMinionSpawnTime(_ARG_0_, _ARG_1_)
  barrack = GetLuaBarracks(_ARG_1_, _ARG_0_)
  return DISABLE_MINION_SPAWN_BASE_TIME + DISABLE_MINION_SPAWN_MAG_TIME * barrack.NumOfSpawnDisables
end
function DisableBarracksSpawn(_ARG_0_, _ARG_1_)
  cLangBarracks = GetBarracks(_ARG_1_, _ARG_0_)
  luaBarrack = GetLuaBarracks(_ARG_1_, _ARG_0_)
  SetDisableMinionSpawn(cLangBarracks, GetDisableMinionSpawnTime(_ARG_0_, _ARG_1_))
  luaBarrack.NumOfSpawnDisables = luaBarrack.NumOfSpawnDisables + 1
end
BonusesCounter = 0
function ApplyBarracksDestructionBonuses(_ARG_0_, _ARG_1_)
end
ReductionCounter = 0
function ApplyBarracksRespawnReductions(_ARG_0_, _ARG_1_)
end
ReactiveCounter = 0
function BarrackReactiveEvent(_ARG_0_, _ARG_1_)
end
DisactivatedCounter = 0
function HandleDestroyedObject(_ARG_0_)
  return true
end
TEAM_UNKNOWN = 0
EOG_PAN_TO_NEXUS_TIME = 3
EOG_NEXUS_EXPLOSION_TIME = EOG_PAN_TO_NEXUS_TIME + 0.5
EOG_SCOREBOARD_PHASE_DELAY_TIME = 3
EOG_NEXUS_REVIVE_TIME = 5
EOG_ALIVE_NEXUS_SKIN = 0
EOG_DESTROYED_NEXUS_SKIN = 1
function EndOfGameCeremony(_ARG_0_, _ARG_1_)
  winningTeam = _ARG_0_
  if winningTeam == TEAM_ORDER then
    losingTeam = TEAM_CHAOS
  else
    losingTeam = TEAM_ORDER
  end
  losingHQPosition = GetPosition(_ARG_1_)
  orderHQ = GetHQ(TEAM_ORDER)
  SetInvulnerable(orderHQ, true)
  SetTargetable(orderHQ, false)
  SetBuildingHealthRegenEnabled(orderHQ, false)
  chaosHQ = GetHQ(TEAM_CHAOS)
  SetInvulnerable(chaosHQ, true)
  SetTargetable(chaosHQ, false)
  SetBuildingHealthRegenEnabled(chaosHQ, false)
  SetInputLockingFlag(INPUT_CAMERALOCKING, true)
  SetInputLockingFlag(INPUT_CAMERAMOVEMENT, true)
  SetInputLockingFlag(INPUT_ABILITIES, true)
  SetInputLockingFlag(INPUT_SUMMONERSPELLS, true)
  SetInputLockingFlag(INPUT_MOVEMENT, true)
  SetInputLockingFlag(INPUT_SHOP, true)
  SetInputLockingFlag(INPUT_CHAT, true)
  SetInputLockingFlag(INPUT_MINIMAPMOVEMENT, true)
  DisableHUDForEndOfGame()
  ToggleBarracks()
  CloseShop()
  HaltAllAI()
  LuaForEachChampion(TEAM_UNKNOWN, "ChampionEoGCeremony")
  InitTimer("DestroyNexusPhase", EOG_NEXUS_EXPLOSION_TIME, false)
end
function ChampionEoGCeremony(_ARG_0_)
  MoveCameraFromCurrentPositionToPoint(_ARG_0_, losingHQPosition, EOG_PAN_TO_NEXUS_TIME)
  SetGreyscaleEnabledWhenDead(_ARG_0_, false)
end
function DestroyNexusPhase()
  SetHQCurrentSkin(losingTeam, EOG_DESTROYED_NEXUS_SKIN)
  InitTimer("ScoreboardPhase", EOG_SCOREBOARD_PHASE_DELAY_TIME, false)
end
function ScoreboardPhase()
  EndGame(winningTeam)
end
function TestReviveNexus()
  SetHQCurrentSkin(losingTeam, EOG_ALIVE_NEXUS_SKIN)
end
