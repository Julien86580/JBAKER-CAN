-- Do not touch these codes as much as possible (touch them if you are familiar and confident)

Events = {
    -- Job --
    'NB:recruterplayer',
    'NB:destituerplayer',
    'Esx-MenuPessoal:Boss_recruterplayer',
    -- Revive --
    'ems:revive',
    'paramedic:revive',
    'whoapd:revive',
    'ambulancier:selfRespawn',
    -- Add Money --
    'esx_fueldeliver',
    'esx_truckerjob:pay',
    'esx_godirtyjob:pay',
    'esx_ranger:pay',
    'PayForRepairNow',
    'vrp_slotmachine:server:2',
    'esx_pizza:pay',
    'esx_jobs:caution',
    'bank:transfer',
    'lscustoms:payGarag',
    'esx_vangelico_robbery:gioielli1',
    '99kr-burglary:addMoney',
    'burglary:money',
    'lenzh_chopshop:sell',
    'esx_deliveries:AddCashMoney',
    'loffe_prisonwork',
    'esx_tankerjob:pay',
    'napadtransport:graczZrobilnapad',
    'tost:zgarnijsiano',
    'esx_loffe_fangelse:Pay',
    'esx_mugging:giveMoney',
    'esx_robnpc:giveMoney',
    'esx_vehicletrunk:giveDirty',
    'esx_gopostaljob:pay',
    'f0ba1292-b68d-4d95-8823-6230cdf282b6',
    'gambling:spend',
    '265df2d8-421b-4727-b01d-b92fd6503f5e',
    'AdminMenu:giveDirtyMoney',
    'AdminMenu:giveBank',
    'AdminMenu:giveCash',
    'esx_slotmachine:sv:2',
    'esx_moneywash:deposit',
    'esx_moneywash:withdraw',
    'esx_moneywash:deposit',
    'mission:completed',
    'truckerJob:success',
    'esx_fishing:receiveFish',
    'c65a46c5-5485-4404-bacf-06a106900258',
    'dropOff',
    'truckerfuel:success',
    'delivery:success',
    'lscustoms:payGarage',
    'esx_brinksjob:pay',
    'esx_garbagejob:pay',
    'esx_postejob:pay',
    'esx_garbage:pay',
    'esx_carteirojob:pay',
    'esx_pilot:success',
    'esx_taxijob:success',
    'adminmenu:setsalary',
    'esx_mugging:giveMoney',
    'paycheck:salary',
    'vrp_slotmachine:server:2',
    -- Bank --
    'bank:withdraw',
    'bank:deposit',
    -- Mechanic --
    'esx_mecanojob:onNPCJobCompleted',
    'esx_mechanicjob:startCraft',
    'esx_mechanicjob:startHarvest',
    -- Discord Log --
    'DiscordBot:playerDied',
    -- Drug --
    'esx_drugs:startHarvestWeed',
    'esx_drugs:startTransformWeed',
    'esx_drugs:startSellWeed',
    'esx_drugs:startHarvestCoke',
    'esx_drugs:startTransformCoke',
    'esx_drugs:startSellCoke',
    'esx_drugs:startHarvestMeth',
    'esx_drugs:startTransformMeth',
    'esx_drugs:startSellMeth',
    'esx_drugs:startHarvestOpium',
    'esx_drugs:startTransformOpium',
    'esx_drugs:startSellOpium',
    'esx_blanchisseur:startWhitening',
    'esx_drugs:stopTransformCoke',
    -- Cuff --
    'BsCuff:Cuff696999',
    'CheckHandcuff',
    'unCuffServer',
    'uncuffGranted',
    'police:cuffGranted',
    'esx_handcuffs:unlocking',
    'esx_policejob:requestarrest',
    'esx_policejob:handcuffPasta',
    'OG_cuffs:cuffCheckNearest',
    'cuffServer',
    'cuffGranted',
    -- Public --
    'hentailover:xdlol',
    'adminmenu:allowall',
    -- Carthief --
    'esx_carthief:alertcops',
    'esx_carthief:pay',
    -- Jail --
    'esx-qalle-jail:jailPlayer',
    'esx_jailer:sendToJail',
    'esx_jail:sendToJail',
    'js:jailuser',
    'JailUpdate',
    'ljail:jailplayer',
    '17A34C820A685513C5B4ADDD85968B9E905CC300A261EB55D299ABCB6C90AAA872712B3B6C13DC41913FCC2BE84A07EF9300DC4E89669A4B0E6FBB344A69D239',
    -- Kick --
    'llotrainer:adminKick',
    'esx_mafiajob:confiscatePlayerItem',
    'InteractSound_SV:PlayOnAll',
    -- Dynamic --
    'SEM_InteractionMenu:Jail',
    'SEM_InteractionMenu:DragNear',
}

-- You can add or remove your custom events
SpamCheck = {
    { EVENT = "esx_policejob:handcuff",          MAX_TIME = 4 },
    { EVENT = "esx-qalle-hunting:reward",        MAX_TIME = 3 },
    { EVENT = "esx:giveInventoryItem",           MAX_TIME = 4 },
    { EVENT = "esx_billing:sendBill",            MAX_TIME = 3 },
    { EVENT = "esx_billing:sendBill",            MAX_TIME = 3 },
    { EVENT = "chatE3vent",                      MAX_TIME = 2 },
    { EVENT = "_chat:messageEntered3",           MAX_TIME = 2 },
    { EVENT = "playerDi3ed",                     MAX_TIME = 2 },
    { EVENT = "gcPhone:_internalAddMessage",     MAX_TIME = 4 },
    { EVENT = "gcPhone:tchat_channel",           MAX_TIME = 4 },
    { EVENT = "ServerValidEmote",                MAX_TIME = 4 },
    { EVENT = "lester:vendita",                  MAX_TIME = 20 },
    { EVENT = "esx:confiscatePlayerItem",        MAX_TIME = 4 },
    { EVENT = "esx_vehicleshop:setVehicleOwned", MAX_TIME = 4 },
    { EVENT = "LegacyFuel:PayFuel",              MAX_TIME = 4 },
    { EVENT = "CarryPeople:sync",                MAX_TIME = 3 },
    { EVENT = "EasyAdmin:CaptureScreenshot",     MAX_TIME = 3 },
}
