DoLuaLevel("GlobalLevelScript")
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
CANNON_MINION_SPAWN_FREQUENCY = 3
MINION_HEALTH_DENIAL_PERCENT = 0
MELEE_EXP_GIVEN = 64
MELEE_GOLD_GIVEN = 22
CASTER_EXP_GIVEN = 32
CASTER_GOLD_GIVEN = 16
CANNON_EXP_GIVEN = 100
CANNON_GOLD_GIVEN = 27
SUPER_EXP_GIVEN = 100
SUPER_GOLD_GIVEN = 27
MELEE_HEALTH_UPGRADE = 20
MELEE_DAMAGE_UPGRADE = 1
MELEE_GOLD_UPGRADE = 0.5
MELEE_EXP_UPGRADE = 5
MELEE_ARMOR_UPGRADE = 2
MELEE_MR_UPGRADE = 0.5
CASTER_HEALTH_UPGRADE = 15
CASTER_DAMAGE_UPGRADE = 2
CASTER_GOLD_UPGRADE = 0.5
CASTER_EXP_UPGRADE = 3
CASTER_ARMOR_UPGRADE = 0.5
CASTER_MR_UPGRADE = 2
CANNON_HEALTH_UPGRADE = 27
CANNON_DAMAGE_UPGRADE = 3
CANNON_GOLD_UPGRADE = 1
CANNON_EXP_UPGRADE = 7
CANNON_ARMOR_UPGRADE = 2
CANNON_MR_UPGRADE = 2
SUPER_HEALTH_UPGRADE = 200
SUPER_DAMAGE_UPGRADE = 10
SUPER_GOLD_UPGRADE = 0
SUPER_EXP_UPGRADE = 0
SUPER_ARMOR_UPGRADE = 0
SUPER_MR_UPGRADE = 0
MAXIMUM_MELEE_GOLD_BONUS = 10
MAXIMUM_CASTER_GOLD_BONUS = 10
MAXIMUM_CANNON_GOLD_BONUS = 20
MAXIMUM_SUPER_GOLD_BONUS = 20
UPGRADE_MINION_TIMER = 180
MELEE_HEALTH_INHIBITOR = 100
MELEE_DAMAGE_INHIBITOR = 10
MELEE_GOLD_INHIBITOR = 0
MELEE_EXP_INHIBITOR = 0
CASTER_HEALTH_INHIBITOR = 60
CASTER_DAMAGE_INHIBITOR = 18
CASTER_GOLD_INHIBITOR = 0
CASTER_EXP_INHIBITOR = 0
CANNON_HEALTH_INHIBITOR = 200
CANNON_DAMAGE_INHIBITOR = 25
CANNON_GOLD_INHIBITOR = 0
CANNON_EXP_INHIBITOR = 0
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
  MeleeMinionName = "SRU_OrderMinionMelee",
  CasterMinionName = "SRU_OrderMinionRanged",
  CannonMinionName = "SRU_OrderMinionSiege",
  SuperMinionName = "SRU_OrderMinionSuper"
}
ChaosNames = {
  MeleeMinionName = "SRU_ChaosMinionMelee",
  CasterMinionName = "SRU_ChaosMinionRanged",
  CannonMinionName = "SRU_ChaosMinionSiege",
  SuperMinionName = "SRU_ChaosMinionSuper"
}
SpawnTable = {
  WaveSpawnRate = 0,
  NumOfMeleeMinionsPerWave = 0,
  NumOfCasterMinionsPerWave = 0,
  NumOfCannonMinionsPerWave = 0,
  NumOfSuperMinionsPerWave = 0,
  SingleMinionSpawnDelay = 0,
  DidPowerGroup = 0,
  MeleeMinionName = 0,
  CasterMinionName = 0,
  CannonMinionName = 0,
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
  CasterMinionArmor = 0,
  CasterMinionMagicResistance = 0,
  CasterHPBonus = 0,
  CasterDamageBonus = 0,
  CasterGoldBonus = 0,
  CasterExpBonus = 0,
  CasterExpGiven = CASTER_EXP_GIVEN,
  CasterGoldGiven = CASTER_GOLD_GIVEN,
  CannonMinionArmor = 0,
  CannonMinionMagicResistance = 0,
  CannonHPBonus = 0,
  CannonDamageBonus = 0,
  CannonGoldBonus = 0,
  CannonExpBonus = 0,
  CannonExpGiven = CANNON_EXP_GIVEN,
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
  CannonMinionName = 0,
  CannonGoldGiven = CANNON_GOLD_GIVEN,
  SuperMinionName = 0,
  SuperGoldGiven = CANNON_GOLD_GIVEN
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
  CasterMinionArmor = 0,
  CasterMinionMagicResistance = 0,
  CasterHPBonus = 0,
  CasterDamageBonus = 0,
  CasterGoldBonus = 0,
  CasterExpBonus = 0,
  CasterExpGiven = CASTER_EXP_GIVEN,
  CasterGoldGiven = CASTER_GOLD_GIVEN,
  CannonMinionArmor = 0,
  CannonMinionMagicResistance = 0,
  CannonHPBonus = 0,
  CannonDamageBonus = 0,
  CannonGoldBonus = 0,
  CannonExpBonus = 0,
  CannonExpGiven = CANNON_EXP_GIVEN,
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
  CannonMinionName = 0,
  CannonGoldGiven = CANNON_GOLD_GIVEN,
  SuperMinionName = 0,
  SuperGoldGiven = CANNON_GOLD_GIVEN
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
  CasterMinionArmor = 0,
  CasterMinionMagicResistance = 0,
  CasterHPBonus = 0,
  CasterDamageBonus = 0,
  CasterGoldBonus = 0,
  CasterExpBonus = 0,
  CasterExpGiven = CASTER_EXP_GIVEN,
  CasterGoldGiven = CASTER_GOLD_GIVEN,
  CannonMinionArmor = 0,
  CannonMinionMagicResistance = 0,
  CannonHPBonus = 0,
  CannonDamageBonus = 0,
  CannonGoldBonus = 0,
  CannonExpBonus = 0,
  CannonExpGiven = CANNON_EXP_GIVEN,
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
  CannonMinionName = 0,
  CannonGoldGiven = CANNON_GOLD_GIVEN,
  SuperMinionName = 0,
  SuperGoldGiven = CANNON_GOLD_GIVEN
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
  CasterMinionArmor = 0,
  CasterMinionMagicResistance = 0,
  CasterHPBonus = 0,
  CasterDamageBonus = 0,
  CasterGoldBonus = 0,
  CasterExpBonus = 0,
  CasterExpGiven = CASTER_EXP_GIVEN,
  CasterGoldGiven = CASTER_GOLD_GIVEN,
  CannonMinionArmor = 0,
  CannonMinionMagicResistance = 0,
  CannonHPBonus = 0,
  CannonDamageBonus = 0,
  CannonGoldBonus = 0,
  CannonExpBonus = 0,
  CannonExpGiven = CANNON_EXP_GIVEN,
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
  CannonMinionName = 0,
  CannonGoldGiven = CANNON_GOLD_GIVEN,
  SuperMinionName = 0,
  SuperGoldGiven = CANNON_GOLD_GIVEN
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
  CasterMinionArmor = 0,
  CasterMinionMagicResistance = 0,
  CasterHPBonus = 0,
  CasterDamageBonus = 0,
  CasterGoldBonus = 0,
  CasterExpBonus = 0,
  CasterExpGiven = CASTER_EXP_GIVEN,
  CasterGoldGiven = CASTER_GOLD_GIVEN,
  CannonMinionArmor = 0,
  CannonMinionMagicResistance = 0,
  CannonHPBonus = 0,
  CannonDamageBonus = 0,
  CannonGoldBonus = 0,
  CannonExpBonus = 0,
  CannonExpGiven = CANNON_EXP_GIVEN,
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
  CannonMinionName = 0,
  CannonGoldGiven = CANNON_GOLD_GIVEN,
  SuperMinionName = 0,
  SuperGoldGiven = CANNON_GOLD_GIVEN
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
  CasterMinionArmor = 0,
  CasterMinionMagicResistance = 0,
  CasterHPBonus = 0,
  CasterDamageBonus = 0,
  CasterGoldBonus = 0,
  CasterExpBonus = 0,
  CasterExpGiven = CASTER_EXP_GIVEN,
  CasterGoldGiven = CASTER_GOLD_GIVEN,
  CannonMinionArmor = 0,
  CannonMinionMagicResistance = 0,
  CannonHPBonus = 0,
  CannonDamageBonus = 0,
  CannonGoldBonus = 0,
  CannonExpBonus = 0,
  CannonExpGiven = CANNON_EXP_GIVEN,
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
  CannonMinionName = 0,
  CannonGoldGiven = CANNON_GOLD_GIVEN,
  SuperMinionName = 0,
  SuperGoldGiven = CANNON_GOLD_GIVEN
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
  local L0_0, L1_1
  L0_0 = {}
  L0_0.Turret3 = true
  L0_0.Turret2 = true
  L0_0.Turret1 = true
  L0_0.Barracks = true
  return L0_0
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
  local L0_2, L1_3, L2_4, L3_5, L4_6
  for L3_5, L4_6 in L0_2(L1_3) do
    PreloadCharacter(L4_6)
  end
  for L3_5, L4_6 in L0_2(L1_3) do
    PreloadCharacter(L4_6)
  end
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L0_2(L1_3)
  L4_6 = L1_3()
  L0_2(L1_3, L2_4, L3_5, L4_6, L1_3())
  L0_2(L1_3)
  L0_2.WaveSpawnRate = 30000
  L0_2.NumOfMeleeMinionsPerWave = 3
  L0_2.NumOfCasterMinionsPerWave = 3
  L0_2.SingleMinionSpawnDelay = 800
  L0_2.DidPowerGroup = false
end
function OnLevelInitServer()
  InitTimer("AllowDamageOnBuildings", 1, false)
end
function OnGameStartup()
  LuaForEachChampion(TEAM_UNKNOWN, "ApplyBountyTrackerBuff")
end
function ApplyBountyTrackerBuff(A0_7)
  ApplyPersistentBuff(A0_7, "S6_BountyTracker", false, 1, 1)
end
function OnPostLevelLoad()
  LoadLevelScriptIntoScript("CreateLevelProps.lua")
  CreateLevelProps()
end
function OppositeTeam(A0_8)
  if A0_8 == TEAM_CHAOS then
    return TEAM_ORDER
  else
    return TEAM_CHAOS
  end
end
function UpgradeMinionTimer()
  local L0_9, L1_10
end
function AllowDamageOnBuildings()
  orderTurret = GetTurret(TEAM_ORDER, 0, 1)
  SetInvulnerable(orderTurret, true)
  SetTargetable(orderTurret, false)
  chaosTurret = GetTurret(TEAM_CHAOS, 0, 1)
  SetInvulnerable(chaosTurret, true)
  SetTargetable(chaosTurret, false)
end
function GetMinionSpawnInfo(A0_11, A1_12, A2_13, A3_14, A4_15)
  local L5_16
  L5_16 = SpawnTable
  TableForBarrack = L5_16
  L5_16 = TableForBarrack
  L5_16 = L5_16.DidPowerGroup
  if L5_16 then
    L5_16 = TableForBarrack
    L5_16.NumOfCannonMinionsPerWave = TableForBarrack.NumOfCannonMinionsPerWave - 1
    L5_16 = TableForBarrack
    L5_16.DidPowerGroup = false
  end
  L5_16 = CANNON_MINION_SPAWN_FREQUENCY
  L5_16 = A1_12 % L5_16
  if L5_16 == 0 then
    L5_16 = TableForBarrack
    L5_16.NumOfCannonMinionsPerWave = TableForBarrack.NumOfCannonMinionsPerWave + 1
    L5_16 = TableForBarrack
    L5_16.DidPowerGroup = true
  end
  L5_16 = 0
  if A3_14 == TEAM_ORDER then
    L5_16 = OrderBarracksBonuses[A0_11 + 1]
  else
    L5_16 = ChaosBarracksBonuses[A0_11 + 1]
  end
  TableForBarrack.ExpRadius = EXP_GIVEN_RADIUS
  lNumOfMeleeMinionsPerWave = TableForBarrack.NumOfMeleeMinionsPerWave
  lNumOfCasterMinionsPerWave = TableForBarrack.NumOfCasterMinionsPerWave
  lNumOfCannonMinionsPerWave = TableForBarrack.NumOfCannonMinionsPerWave
  lNumOfSuperMinionsPerWave = TableForBarrack.NumOfSuperMinionsPerWave
  if A4_15 ~= LAST_WAVE then
    BARRACKSCOUNT = 6
    totalMinionsRemaining = MAX_MINIONS_EVER - GetTotalTeamMinionsSpawned()
    if totalMinionsRemaining <= BARRACKSCOUNT * 7 then
      if 0 >= totalMinionsRemaining then
        SPECIAL_MINION_MODE = "None"
      elseif totalMinionsRemaining >= BARRACKSCOUNT then
        SPECIAL_MINION_MODE = "2MeleeMinions"
      else
        SPECIAL_MINION_MODE = "None"
      end
    else
      SPECIAL_MINION_MODE = ""
    end
    LAST_WAVE = A4_15
  end
  if SPECIAL_MINION_MODE == "2MeleeMinions" then
    lNumOfMeleeMinionsPerWave = math.max(2 - lNumOfSuperMinionsPerWave, 0)
    lNumOfCasterMinionsPerWave = 0
    lNumOfCannonMinionsPerWave = 0
  elseif SPECIAL_MINION_MODE == "None" then
    lNumOfMeleeMinionsPerWave = 0
    lNumOfCasterMinionsPerWave = 0
    lNumOfCannonMinionsPerWave = 0
    lNumOfSuperMinionsPerWave = 0
  end
  if L5_16.WillSpawnSuperMinion == 1 then
    if A3_14 == TEAM_ORDER and totalNumberOfChaosBarracks == 0 or A3_14 == TEAM_CHAOS and totalNumberOfOrderBarracks == 0 then
      lNumOfSuperMinionsPerWave = 2
    else
      lNumOfSuperMinionsPerWave = 1
    end
    lNumOfCannonMinionsPerWave = 0
  end
  if A3_14 == TEAM_ORDER then
    L5_16.MeleeMinionName = OrderNames.MeleeMinionName
    L5_16.CasterMinionName = OrderNames.CasterMinionName
    L5_16.CannonMinionName = OrderNames.CannonMinionName
    L5_16.SuperMinionName = OrderNames.SuperMinionName
  else
    L5_16.MeleeMinionName = ChaosNames.MeleeMinionName
    L5_16.CasterMinionName = ChaosNames.CasterMinionName
    L5_16.CannonMinionName = ChaosNames.CannonMinionName
    L5_16.SuperMinionName = ChaosNames.SuperMinionName
  end
  ReturnTable = {
    NumOfMeleeMinionsPerWave = lNumOfMeleeMinionsPerWave,
    NumOfCasterMinionsPerWave = lNumOfCasterMinionsPerWave,
    NumOfCannonMinionsPerWave = lNumOfCannonMinionsPerWave,
    NumOfSuperMinionsPerWave = lNumOfSuperMinionsPerWave,
    WaveSpawnRate = TableForBarrack.WaveSpawnRate,
    SingleMinionSpawnDelay = TableForBarrack.SingleMinionSpawnDelay,
    MeleeMinionName = L5_16.MeleeMinionName,
    CasterMinionName = L5_16.CasterMinionName,
    CannonMinionName = L5_16.CannonMinionName,
    SuperMinionName = L5_16.SuperMinionName,
    IsDestroyed = L5_16.IsDestroyed,
    MeleeMinionArmor = L5_16.MeleeMinionArmor,
    MeleeMinionMagicResistance = L5_16.MeleeMinionMagicResistance,
    MeleeHPBonus = L5_16.MeleeHPBonus,
    MeleeDamageBonus = L5_16.MeleeDamageBonus,
    MeleeExpGiven = L5_16.MeleeExpGiven,
    MeleeGoldGiven = L5_16.MeleeGoldGiven,
    CasterMinionArmor = L5_16.CasterMinionArmor,
    CasterMinionMagicResistance = L5_16.CasterMinionMagicResistance,
    CasterHPBonus = L5_16.CasterHPBonus,
    CasterDamageBonus = L5_16.CasterDamageBonus,
    CasterExpGiven = L5_16.CasterExpGiven,
    CasterGoldGiven = L5_16.CasterGoldGiven,
    CannonMinionArmor = L5_16.CannonMinionArmor,
    CannonMinionMagicResistance = L5_16.CannonMinionMagicResistance,
    CannonHPBonus = L5_16.CannonHPBonus,
    CannonDamageBonus = L5_16.CannonDamageBonus,
    CannonExpGiven = L5_16.CannonExpGiven,
    CannonGoldGiven = L5_16.CannonGoldGiven,
    SuperMinionArmor = L5_16.SuperMinionArmor,
    SuperMinionMagicResistance = L5_16.SuperMinionMagicResistance,
    SuperHPBonus = L5_16.SuperHPBonus,
    SuperDamageBonus = L5_16.SuperDamageBonus,
    SuperExpGiven = L5_16.SuperExpGiven,
    SuperGoldGiven = L5_16.SuperGoldGiven,
    ExperienceRadius = TableForBarrack.ExpRadius
  }
  return ReturnTable
end
function DeactivateCorrectStructure(A0_17, A1_18, A2_19)
end
function GetLuaBarracks(A0_20, A1_21)
  local L2_22, L3_23, L4_24
  L3_23 = TEAM_ORDER
  if A0_20 == L3_23 then
    L3_23 = OrderBarracksBonuses
    L4_24 = A1_21 + 1
    L2_22 = L3_23[L4_24]
  else
    L3_23 = ChaosBarracksBonuses
    L4_24 = A1_21 + 1
    L2_22 = L3_23[L4_24]
  end
  return L2_22
end
function GetDisableMinionSpawnTime(A0_25, A1_26)
  barrack = GetLuaBarracks(A1_26, A0_25)
  return DISABLE_MINION_SPAWN_BASE_TIME + DISABLE_MINION_SPAWN_MAG_TIME * barrack.NumOfSpawnDisables
end
function DisableBarracksSpawn(A0_27, A1_28)
  cLangBarracks = GetBarracks(A1_28, A0_27)
  luaBarrack = GetLuaBarracks(A1_28, A0_27)
  SetDisableMinionSpawn(cLangBarracks, GetDisableMinionSpawnTime(A0_27, A1_28))
  luaBarrack.NumOfSpawnDisables = luaBarrack.NumOfSpawnDisables + 1
end
BonusesCounter = 0
function ApplyBarracksDestructionBonuses(A0_29, A1_30)
end
ReductionCounter = 0
function ApplyBarracksRespawnReductions(A0_31, A1_32)
end
ReactiveCounter = 0
function BarrackReactiveEvent(A0_33, A1_34)
end
DisactivatedCounter = 0
function HandleDestroyedObject(A0_35)
  local L1_36
  L1_36 = true
  return L1_36
end
TEAM_UNKNOWN = 0
EOG_PAN_TO_NEXUS_TIME = 3
EOG_NEXUS_EXPLOSION_TIME = EOG_PAN_TO_NEXUS_TIME + 0.5
EOG_SCOREBOARD_PHASE_DELAY_TIME = 3
EOG_NEXUS_REVIVE_TIME = 5
EOG_ALIVE_NEXUS_SKIN = 0
EOG_DESTROYED_NEXUS_SKIN = 1
function EndOfGameCeremony(A0_37, A1_38)
  winningTeam = A0_37
  if winningTeam == TEAM_ORDER then
    losingTeam = TEAM_CHAOS
  else
    losingTeam = TEAM_ORDER
  end
  losingHQPosition = GetPosition(A1_38)
  orderHQ = GetHQ(TEAM_ORDER)
  SetInvulnerable(orderHQ, true)
  SetTargetable(orderHQ, false)
  SetBuildingHealthRegenEnabled(orderHQ, false)
  chaosHQ = GetHQ(TEAM_CHAOS)
  SetInvulnerable(chaosHQ, true)
  SetTargetable(chaosHQ, false)
  SetBuildingHealthRegenEnabled(chaosHQ, false)
  SetInputLockFlag(playerID, INPUT_LOCK_CAMERA_LOCKING, true)
  SetInputLockFlag(playerID, INPUT_LOCK_CAMERA_MOVEMENT, true)
  SetInputLockFlag(playerID, INPUT_LOCK_ABILITIES, true)
  SetInputLockFlag(playerID, INPUT_LOCK_SUMMONER_SPELLS, true)
  SetInputLockFlag(playerID, INPUT_LOCK_MOVEMENT, true)
  SetInputLockFlag(playerID, INPUT_LOCK_SHOP, true)
  SetInputLockFlag(playerID, INPUT_LOCK_CHAT, true)
  SetInputLockFlag(playerID, INPUT_LOCK_MINIMAP_MOVEMENT, true)
  DisableHUDForEndOfGame()
  ToggleBarracks()
  CloseShop()
  HaltAllAI()
  LuaForEachChampion(TEAM_UNKNOWN, "ChampionEoGCeremony")
  InitTimer("DestroyNexusPhase", EOG_NEXUS_EXPLOSION_TIME, false)
end
function ChampionEoGCeremony(A0_39)
  MoveCameraFromCurrentPositionToPoint(A0_39, losingHQPosition, EOG_PAN_TO_NEXUS_TIME, true)
  SetGreyscaleEnabledWhenDead(A0_39, false)
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
