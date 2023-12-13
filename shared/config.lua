Config = Config or {}

Config.OnlyShowOnDuty = true
Config.UseCQCMugshot = true

-- Front, Back Side. Use 4 for both sides, we recommend leaving at 1 for default.
Config.MugPhotos = 1

Config.MugShotSpots = {
    ["missionrow"] = {
        signLabel = "LSPD Mission Row",
        camX = 479.0,
        camY = -984.8743,
        camZ = 21.8,
        camRot = {x = 0.0, y = 0.0, z = 90.0},
        suspectHeading = 269.6102,
        suspectX = 477.5081,
        suspectY = -984.9333,
        suspectZ = 20.5595,
    },    
    ["boling"] = {
        signLabel = "Pénitentier de Bolingbroke",
        camX = 1828.69,
        camY = 2581.72,
        camZ = 46.3,
        camRot = {x = 0.0, y = 0.0, z = 92.23},
        suspectHeading = 265.00,
        suspectX = 1827.63,
        suspectY = 2581.7,
        suspectZ = 44.89,
    },
    ["sandy"] = {
        signLabel = "BCSO Sandy Shore",
        camX = 1814.5914,
        camY = 3664.3955,
        camZ = 34.1892,
        camRot = {x = 0.0, y = 0.0, z = 92.0},
        suspectHeading = 298.7003,
        suspectX = 1813.3495,
        suspectY = 3663.9260,
        suspectZ = 33.1893,
    },
}

-- If set to true = Fine gets automatically removed from bank automatically charging the player.
-- If set to false = The fine gets sent as an Invoice to their phone and it us to the player to pay for it, can remain unpaid and ignored.
Config.BillVariation = true

-- If set to false (default) = The fine amount is just being removed from the player's bank account
-- If set to true = The fine amount is beeing added to the society account after being removed from the player's bank account
Config.QBManagementUse = false

-- Set up your inventory to automatically retrieve images when a weapon is registered at a weapon shop or self-registered.
-- If you're utilizing lj-inventory's latest version from GitHub, no further modifications are necessary. 
-- However, if you're using a different inventory system, please refer to the "Inventory Edit | Automatic Add Weapons with images" section in ps-mdt's README.
Config.InventoryForWeaponsImages = "ox_inventory"

-- "LegacyFuel", "lj-fuel", "ps-fuel"
Config.Fuel = "ps-fuel"

Config.dispatchName = "ps-dispatch-esx"

-- ['License Name'] = true/false. If false, license are set to false by default.
Config.Licenses = {
    ['dmv'] = false,
    ['drive'] = false,
    ['drive_bike'] = false,
    ['drive_truck'] = false,
    ['weapon_a'] = false,
    ['weapon_b'] = false,
    ['weapon_c'] = false,
}

-- Google Docs Link
Config.sopLink = {
    ['police'] = '',
    ['ambulance'] = '',
    ['bcso'] = '',
    ['doj'] = '',
    ['sast'] = '',
    ['sasp'] = '',
    ['doc'] = '',
    ['lssd'] = '',
    ['sapr'] = '',
}

-- Google Docs Link
Config.RosterLink = {
    ['police'] = 'https://docs.google.com/spreadsheets/d/1NDxo4Th_bAwD4q04b7QXEKC4SM22p7-yBjrWn8YJGbo/edit#gid=0',
    ['ambulance'] = '',
    ['bcso'] = '',
    ['doj'] = '',
    ['sast'] = '',
    ['sasp'] = '',
    ['doc'] = '',
    ['lssd'] = '',
    ['sapr'] = '',	
}

Config.PoliceJobs = {
    ['police'] = true,
    ['lspd'] = false,
    ['bcso'] = true,
    ['sast'] = false,
    ['sasp'] = false,
    ['doc'] = false,
    ['lssd'] = false,
    ['sapr'] = false,
    ['pa'] = false
}

Config.AmbulanceJobs = {
    ['ambulance'] = true,
    ['pompier'] = true
}

Config.DojJobs = {
    ['gouv'] = true,
    ['lawyer'] = false,
    ['judge'] = false
}

-- This is a workaround solution because the qb-menu present in qb-policejob fills in an impound location and sends it to the event. 
-- If the impound locations are modified in qb-policejob, the changes must also be implemented here to ensure consistency.

Config.ImpoundLocations = {
    [1] = vector4(436.68, -1007.42, 27.32, 180.0),
    [2] = vector4(-436.14, 5982.63, 31.34, 136.0),
}

-- Support for Wraith ARS 2X. 

Config.UseWolfknightRadar = true
Config.WolfknightNotifyTime = 15000 -- How long the notification displays for in milliseconds (30000 = 30 seconds)
Config.PlateScanForDriversLicense = false -- If true, plate scanner will check if the owner of the scanned vehicle has a drivers license

-- IMPORTANT: To avoid making excessive database queries, modify this config to true 'CONFIG.use_sonorancad = true' setting in the configuration file located at 'wk_wars2x/config.lua'. 
-- Enabling this setting will limit plate checks to only those vehicles that have been used by a player.

Config.LogPerms = {
	['ambulance'] = {
		[4] = true,
	},
	['police'] = {
		[4] = true,
	},
    ['bcso'] = {
		[4] = true,
	},
    ['sast'] = {
		[4] = true,
	},
    ['sasp'] = {
		[4] = true,
	},
    ['sapr'] = {
		[4] = true,
	},
    ['doc'] = {
		[4] = true,
	},
    ['lssd'] = {
		[4] = true,
	},
}

Config.RemoveIncidentPerms = {
	['ambulance'] = {
		[4] = true,
	},
	['police'] = {
		[4] = true,
	},
    ['bcso'] = {
		[4] = true,
	},
    ['sast'] = {
		[4] = true,
	},
    ['sasp'] = {
		[4] = true,
	},
    ['sapr'] = {
		[4] = true,
	},
    ['doc'] = {
		[4] = true,
	},
    ['lssd'] = {
		[4] = true,
	},
}

Config.RemoveReportPerms = {
	['ambulance'] = {
		[4] = true,
	},
	['police'] = {
		[4] = true,
	},
    ['bcso'] = {
		[4] = true,
	},
    ['sast'] = {
		[4] = true,
	},
    ['sasp'] = {
		[4] = true,
	},
    ['sapr'] = {
		[4] = true,
	},
    ['doc'] = {
		[4] = true,
	},
    ['lssd'] = {
		[4] = true,
	},
}

Config.RemoveWeaponsPerms = {
	['ambulance'] = {
		[4] = true,
	},
	['police'] = {
		[4] = true,
	},
    ['bcso'] = {
		[4] = true,
	},
    ['sast'] = {
		[4] = true,
	},
    ['sasp'] = {
		[4] = true,
	},
    ['sapr'] = {
		[4] = true,
	},
    ['doc'] = {
		[4] = true,
	},
    ['lssd'] = {
		[4] = true,
	},
}

Config.PenalCodeTitles = {
    [1] = "INFRACTIONS AU CODE DE LA ROUTE",
    [2] = "ATTEINTES A LA VIE",
    [3] = "ATTEINTES AU CORPS",
    [4] = "ATTEINTES A L'ESPRIT",
    [5] = "L'ACCAPAREMENT DE BIENS",
    [6] = "L'ALTÉRATION DE BIENS",
    [7] = "LA PROPRIÉTÉ",
    [8] = "ATTEINTES A L'AUTORITÉ",
    [9] = "ATTEINTES A LA SOCIÉTÉ",
    [10] = "ARMES ET STUPÉFIANTS",
}

Config.PenalCode = {
	[1] = {
	    [1] = {title = "Conduite sans permis", class = "Délit Routier", id = "C.P. 1001", months = 0, fine = 1200, color = "yellow", description = "Est qualifié de délit routier de conduite sans permis le fait de conduire un engin motorisé terrestre sans être titulaire du présent document."},
	    [2] = {title = "Défaut de matériel", class = "Infraction Routière", id = "C.P. 1002", months = 0, fine = 500, color = "green", description = "Est qualifiée d’infraction routière de défaut de matériel le fait de conduire un véhicule dont l’état peut mettre en danger la vie du conducteur ou celle des usagers."},
	    [3] = {title = "Dissimulation de plaque", class = "Infraction Routière", id = "C.P. 1003", months = 0, fine = 800, color = "green", description = "Est qualifié d’infraction routière dissimulation de plaque le fait de dissimuler, brouiller ou rendre illisible sa plaque par quelque moyen que ce soit."},
	    [4] = {title = "Faux avertisseurs lumineux", class = "Délit Routier", id = "C.P. 1004", months = 2, fine = 1500, color = "yellow", description = "Est qualifié de délit routier de faux avertisseurs lumineux le fait pour un conducteur d’un véhicule dit “non prioritaire” d’utiliser ces outils sur la voie publique."},
	    [5] = {title = "Non respect d'un stop", class = "Infraction Routière", id = "C.P. 1005", months = 0, fine = 100, color = "green", description = "Est qualifiée d’infraction routière de non-respect d’un stop le fait de ne pas s’arrêter lorsqu’une indication stop est indiquée."},
	    [6] = {title = "Excés de Vitesse", class = "Infraction Routière", id = "C.P. 1006", months = 0, fine = 200, color = "green", description = "Est qualifiée d’infraction routière d'excès de vitesse le fait de rouler à plus de 10 km/h au-dessus des limites fixées."},
	    [7] = {title = "Excés de Vitesse Aggravé", class = "Infraction Routière", id = "C.P. 1007", months = 0, fine = 500, color = "green", description = "Est considérée comme circonstance aggravante le fait de rouler au plus de 30 km/h au-dessus des limites prévues."},
	    [8] = {title = "Conduite à Contre-Sens", class = "Infraction Routière", id = "C.P. 1008", months = 0, fine = 250, color = "green", description = "Est qualifiée d’infraction routière de conduite à contre-sens le fait de rouler sur la mauvaise voie et dans le mauvais sens."},
	    [9] = {title = "Stationnement Gênant", class = "Infraction Routière", id = "C.P. 1009", months = 0, fine = 100, color = "green", description = "Est qualifiée d’infraction routière de stationnement gênant le fait de gêner le trafic ou d’obstruer le passage par le placement ou le stationnement de son véhicule."},
	    [10] = {title = "Conduite sans casque ou ceinture", class = "Infraction Routière", id = "C.P. 1010", months = 0, fine = 75, color = "green", description = "Est qualifiée d’infraction routière de conduite sans casque ou ceinture le fait de rouler en véhicule deux roues ou quatre roues sans port de casque ou de ceinture."},
	    [11] = {title = "Conduite Dangereuse", class = "Délit Routier", id = "C.P. 1011", months = 2, fine = 600, color = "green", description = "Est qualifié de délit routier de conduite dangereuse le fait de part l’attitude du conducteur, sa façon de conduire ou les différentes infractions qu’il commet."},
	    [12] = {title = "Téléphone au Volant", class = "Infraction Routière", id = "C.P. 1012", months = 0, fine = 0, color = "green", description = "Est qualifiée d’infraction routière de téléphone au volant le fait d’utiliser son téléphone en conduisant."},
	    [13] = {title = "Possession de NOS", class = "Infraction Routière", id = "C.P. 1013", months = 0, fine = 800, color = "green", description = "Est qualifiée d’infraction routière de possession de NOS le fait de posséder un tel accessoire."},
	    [14] = {title = "Conduite en État Altéré", class = "Infraction Routière", id = "C.P. 1014", months = 4, fine = 1000, color = "green", description = "Est qualifié de délit routier le fait de conduire sous l’emprise d’une substance illicite telle que de la drogue, même obtenue légalement pour usage médical, des médicaments contre-indiqués ou encore de l’alcool."},
	},
    
	[2] = {
	    [1] = {title = "L'homicide volontaire", class = "Crime", id = "C.P. 2001", months = 72, fine = 40000, color = "red", description = "Est qualifié de crime d’homicide volontaire le fait d’ôter la vie volontairement à autrui par quelque moyen que ce soit."},
	    [2] = {title = "L'homicide volontaire aggravé", class = "Crime", id = "C.P. 2002", months = 120, fine = 75000, color = "red", description = "Circonstances aggravantes : Agent de police ; Victime Mineure ; Torture ou violences ; Meurtres en Série"},
	    [3] = {title = "Assassinat", class = "Crime", id = "C.P. 2003", months = 280, fine = 50000, color = "red", description = "Est qualifié de crime d’assassinat le fait d’ôter volontairement la vie à autrui en organisant, préparant, préméditation l’acte à l’avance."},
	    [4] = {title = "Assassinat aggravé", class = "Crime infâmant", id = "C.P. 2004", months = 99999, fine = 80000, color = "red", description = "Le fait de commettre un Assassinat dans les circonstances prévues par l’Article I du présent chapitre concernant l’homicide volontaire transforme cet acte en violence volontaire ayant entraîné la mort “aggravée”. - Peine de Mort ou Perpétuité"},
	    [5] = {title = "Violence volontaire ayant entraînée la mort", class = "Crime", id = "C.P. 2005", months = 24, fine = 15000, color = "red", description = "Est qualifiée de crime violence volontaire ayant entraîné la mort le fait d’exercer des violences volontairement à l’encontre d’autrui sans intention de lui donner la mort et, par mégarde, de lui ôter la vie."},
	    [6] = {title = "Violence volontaire ayant entraînée la mort aggravée ", class = "Crime", id = "C.P. 2006", months = 30, fine = 25000, color = "red", description = "Le fait de commettre la violence volontaire ayant entraîné la mort dans les circonstances prévues par l’Article I du présent chapitre concernant l’homicide volontaire transforme cet acte en violence volontaire ayant entraîné la mort “aggravée”."},
	    [7] = {title = "Mise en péril de la vie d'autrui", class = "Délit mineur", id = "C.P. 2007", months = 6, fine = 6000, color = "yellow", description = "Est qualifiée de délit de mise en péril de la vie d’autrui le fait pour toute personne de par ses actes délibérément de mettre en danger la vie d’une autre personne. La résultante n’étant ni la blessure ou la mort de cette dernière."},
	    [8] = {title = "Incitation au suicide", class = "Délit mineur", id = "C.P. 2008", months = 2, fine = 2500, color = "yellow", description = "Est qualifié de délit d’incitation au suicide le fait d’inciter une personne à se donner la mort sans que cette dernière ne décède."},
	    [9] = {title = "Non assistance à personne en danger", class = "Délit mineur", id = "C.P. 2009", months = 3, fine = 7500, color = "yellow", description = "Est qualifié de délit de non assistance à personne en danger le fait de ne pas porter secours volontairement à une personne en péril alors que cela était possible. Ne peut être considéré comme coupable de non assistance à personne en danger la personne qui a contacté les secours."},
	    [10] = {title = "L'homicide involontaire'", class = "Crime", id = "C.P. 2010", months = 4, fine = 9500, color = "red", description = "Est qualifié de crime d’homicide involontaire le fait de donner la mort à autrui sans avoir eu l’intention de la donner. La mort peut résulter d’une acte d’imprudence, de négligence, de maladresse ou de manquement à une obligation de prudence ou de sécurité."},
	    [11] = {title = "L'homicide involontaire aggravé", class = "Crime", id = "C.P. 2011", months = 8, fine = 12000, color = "red", description = "Le fait que l’acte ayant causé la mort a été commis volontairement transforme alors le présent crime en “homicide volontaire aggravée”."},
	},
		
    [3] = {
        [1] = {title = 'La mutilation', class = 'Crime', id = 'P.C. 3001', months = 24, fine = 10500, color = 'red', description = 'Est qualifié de crime de mutilation le fait de causer sur une autre personne une mutilation persistante sur le long terme, une invalidité, une amputation ou l’ablation directe ou indirecte de quelque partie de son corps.'},
        [2] = {title = 'La mutilation aggravé', class = 'Crime', id = 'P.C. 3002', months = 30, fine = 25000, color = 'red', description = 'Circonstances aggravantes : Agent de police ; Victime Mineure ; Torture ou violences ; Crime de haine ; Acte commis en groupe'},
        [3] = {title = 'Violence majeure', class = 'Délit majeur', id = 'P.C. 3003', months = 6, fine = 8000, color = 'orange', description = 'Est qualifié de crime de violence majeure le fait d’exercer sur autrui par quelque moyen que ce soit, même sans contact physique une violence entraînant une blessure ou un traumatisme persistant sur plus de 10 jours.'},
        [4] = {title = 'Violence majeure aggravée', class = 'Crime', id = 'P.C. 3004', months = 12, fine = 15000, color = 'red', description = 'Le fait de commettre une violence majeure dans les circonstances prévues dans l’Article I du présent chapitre concernant la mutilation transforme cet acte en violence majeure “aggravée”.'},
        [5] = {title = 'Violence mineure', class = 'Délit mineur', id = 'P.C. 3005', months = 2, fine = 5000, color = 'yellow', description = 'Est qualifié de délit mineur de violence mineure le fait d’exercer sur autrui par quelque moyen que ce soit, même sans contact physique une violence entraînant une blessure ou un traumatisme persistant sur moins de 10 jours.'},
        [6] = {title = 'Violence mineure aggravée', class = 'Délit majeur', id = 'P.C. 3006', months = 6, fine = 7500, color = 'orange', description = 'Le fait de commettre une violence mineure dans les circonstances prévues dans l’Article I du présent chapitre concernant la mutilation transforme cet acte en violence mineure “aggravée”.'},
        [7] = {title = 'Séquestration', class = 'Crime', id = 'P.C. 3007', months = 24, fine = 8000, color = 'crime', description = 'Est qualifié de crime de séquestration le fait d’entraver la liberté de déplacement contre la loi et le plein gré d’autrui par la force, la contrainte, l’entrave ou l’intimidation.'},
        [8] = {title = 'Séquestration aggravée', class = 'Crime', id = 'P.C. 3008', months = 36, fine = 15000, color = 'red', description = 'Le fait de commettre une séquestration dans les circonstances prévues dans l’Article I du présent chapitre concernant la mutilation transforme cet acte en séquestration “aggravée”.'},
        [9] = {title = 'Viol', class = 'Crime', id = 'P.C. 3009', months = 600, fine = 175000, color = 'red', description = 'Est qualifié de crime de viol le fait de pénétrer sexuellement une autre personne sans son consentement, par la ruse, la force, l’entrave, la menace.'},
        [10] = {title = 'Viol aggravé', class = 'Crime', id = 'P.C. 3010', months = 9999, fine = 250.000, color = 'red', description = 'Le fait de commettre un viol dans les circonstances prévues dans l’Article I du présent chapitre I de la présente section concernant la mutilation transforme cet acte en viol “aggravé”. - Peine de mort ou perpétuité'},
        [11] = {title = 'Aggression sexuelle', class = 'Crime', id = 'P.C. 3011', months = 36, fine = 10000, color = 'red', description = 'Est qualifié de crime d’agression sexuelle l’acte physique, le comportement ou la parole qui par sa nature ou sa répétition induit une violence de nature sexuelle n’impliquant cependant aucunes pénétration.'},
        [12] = {title = 'Aggression sexuelle aggravée', class = 'Crime', id = 'P.C. 3012', months = 72, fine = 22500, color = 'red', description = 'Le fait de commettre une agression sexuelle dans les circonstances prévues dans l’Article I du présent chapitre I de la présente section concernant la mutilation transforme cet acte en agression sexuelle “aggravée”.'},
    },
    [4] = {
        [1] = {title = 'Injure', class = 'Infraction pénale', id = 'P.C. 4001', months = 0, fine = 500, color = 'green', description = 'Est qualifiée d’infraction le fait de tenir un propos, cri, discours, image, objet ou diffusion de tout élément hautement offensant atteignant la dignité, la réputation ou l’honneur d’autrui.'},
        [2] = {title = 'Injure aggravée', class = 'Infraction pénale', id = 'P.C. 4002', months = 0, fine = 1500, color = 'green', description = 'Injure aggravée si : Racisme, diffusion presse ou réseaux sociaux'},
        [3] = {title = 'Arson', class = 'Felony', id = 'P.C. 4003', months = 15, fine = 1500, color = 'orange', description = 'The use if fire and accelerants to will and maliciously destroy, harm or cause death to a person or property'},
        [4] = {title = 'Vandalism', class = 'Infraction', id = 'P.C. 4004', months = 0, fine = 300, color = 'green', description = 'The willful destruction of property'},
        [5] = {title = 'Vandalism of Government Property', class = 'Felony', id = 'P.C. 4005', months = 20, fine = 1500, color = 'green', description = 'The willful destruction of government property'},
        [6] = {title = 'Littering', class = 'Infraction', id = 'P.C. 4006', months = 0, fine = 200, color = 'green', description = 'The willful discard of refuse into to open and not in designated bin'},
    },
    [5] = {
        [1] = {title = 'Bribery of a Government Official', class = 'Felony', id = 'P.C. 5001', months = 20, fine = 3500, color = 'green', description = 'the use of money, favors and or property to gain favor with a government official'},
        [2] = {title = 'Anti-Mask Law', class = 'Infraction', id = 'P.C. 5002', months = 0, fine = 750, color = 'green', description = 'Wearing a mask in a prohibited zone'},
        [3] = {title = 'Possession of Contraband in a Government Facility', class = 'Felony', id = 'P.C. 5003', months = 25, fine = 1000, color = 'green', description = 'Being in possession of items that are illegal while within a government building'},
        [4] = {title = 'Criminal Possession of Stolen Property', class = 'Misdemeanor', id = 'P.C. 5004', months = 10, fine = 500, color = 'green', description = 'Being in possession of items stolen knowingly or not'},
        [5] = {title = 'Escaping', class = 'Felony', id = 'P.C. 5005', months = 10, fine = 450, color = 'green', description = 'The action of willful and knowingly leaving custody while legally being arrest, detained or in jail'},
        [6] = {title = 'Jailbreak', class = 'Felony', id = 'P.C. 5006', months = 30, fine = 2500, color = 'orange', description = 'The action of leaving state custody from a state or county detention facility'},
        [7] = {title = 'Accessory to Jailbreak', class = 'Felony', id = 'P.C. 5007', months = 25, fine = 2000, color = 'orange', description = 'Being present and or participating in the act of parent charge'},
        [8] = {title = 'Attempted Jailbreak', class = 'Felony', id = 'P.C. 5008', months = 20, fine = 1500, color = 'orange', description = 'The willful and intentional attempted escape from a state or county detention facility'},
        [9] = {title = 'Perjury', class = 'Felony', id = 'P.C. 5009', months = 0, fine = 0, color = 'green', description = 'The action of stating falsities while legally bound to speak the truth'},
        [10] = {title = 'Violation of a Restraining Order', class = 'Felony', id = 'P.C. 5010', months = 20, fine = 2250, color = 'green', description = 'The willful and knowing infringement upon court ordered protective documentation'},
        [11] = {title = 'Embezzlement', class = 'Felony', id = 'P.C. 5011', months = 45, fine = 10000, color = 'green', description = 'The willful and knowingly movement of funds from non personal bank accounts to personal bank accounts for personal gain'},
        [12] = {title = 'Unlawful Practice', class = 'Felony', id = 'P.C. 5012', months = 15, fine = 1500, color = 'orange', description = 'The action of performing a service without proper legal licensing and approval'},
        [13] = {title = 'Misuse of Emergency Systems', class = 'Infraction', id = 'P.C. 5013', months = 0, fine = 600, color = 'orange', description = 'Use of government emergency equipment for its non-intended purpose'},
        [14] = {title = 'Conspiracy', class = 'Misdemeanor', id = 'P.C. 5014', months = 10, fine = 450, color = 'green', description = 'The act of planning a crime but not yet commiting the crime'},
        [15] = {title = 'Violating a Court Order', class = 'Misdemeanor', id = 'P.C. 5015', months = 0, fine = 0, color = 'orange', description = 'The infringement of court ordered documentation'},
        [16] = {title = 'Failure to Appear', class = 'Misdemeanor', id = 'P.C. 5016', months = 0, fine = 0, color = 'orange', description = 'When someone who is legally bound to appear in court does not do so'},
        [17] = {title = 'Contempt of Court', class = 'Felony', id = 'P.C. 5017', months = 0, fine = 0, color = 'orange', description = 'The disruption of court proceedings in a courtroom while it is in session (judicial decision)'},
        [18] = {title = 'Resisting Arrest', class = 'Misdemeanor', id = 'P.C. 5018', months = 5, fine = 300, color = 'orange', description = 'The act of not allowing peace officers to take you into custody willingly'},
    },
    [6] = {
        [1] = {title = 'Disobeying a Peace Officer', class = 'infraction', id = 'P.C. 6001', months = 0, fine = 750, color = 'green', description = 'The willful disregard of a lawful order'},
        [2] = {title = 'Disorderly Conduct', class = 'Infraction', id = 'P.C. 6002', months = 0, fine = 250, color = 'green', description = 'Acting in a manner that creates a hazardous or physically offensive condition by any act which serves no legitimate purpose of the actor. '},
        [3] = {title = 'Disturbing the Peace', class = 'infraction', id = 'P.C. 6003', months = 0, fine = 350, color = 'green', description = 'Action in a manner that causes unrest and disrupts public order'},
        [4] = {title = 'False Reporting', class = 'Misdemeanor', id = 'P.C. 6004', months = 10, fine = 750, color = 'green', description = 'The act of reporting a crime that did not happen'},
        [5] = {title = 'Harassment', class = 'Misdemeanor', id = 'P.C. 6005', months = 10, fine = 500, color = 'orange', description = 'The repeated disruption or verbal attacks of another person'},
        [6] = {title = 'Misdemeanor Obstruction of Justice', class = 'Misdemeanor', id = 'P.C. 6006', months = 10, fine = 500, color = 'green', description = 'Acting in a way that hinders the process of Justice or lawful investigations'},
        [7] = {title = 'Felony Obstruction of Justice', class = 'Felony', id = 'P.C. 6007', months = 15, fine = 900, color = 'green', description = 'Acting in a way that hinders the process of Justice or lawful investigations while using violence'},
        [8] = {title = 'Inciting a Riot', class = 'Felony', id = 'P.C. 6008', months = 25, fine = 1000, color = 'orange', description = 'Causing civil unrest in a manner to incite a group to cause harm to people or property'},
        [9] = {title = 'Loitering on Government Properties', class = 'Infraction', id = 'P.C. 6009', months = 0, fine = 500, color = 'green', description = 'When someone is present in a government proper for an extended period of time'},
        [10] = {title = 'Tampering', class = 'Misdemeanor', id = 'P.C. 6010', months = 10, fine = 500, color = 'green', description = 'When someone willfully, knowingly and indirectly interfering with key points of a lawful investigation'},
        [11] = {title = 'Vehicle Tampering', class = 'Misdemeanor', id = 'P.C. 6011', months = 15, fine = 750, color = 'green', description = 'The willful and knowing interference the normal function of a vehicle'},
        [12] = {title = 'Evidence Tampering', class = 'Felony', id = 'P.C. 6012', months = 20, fine = 1000, color = 'green', description = 'The willful and knowing interference with evidence from a lawful investigation'},
        [13] = {title = 'Witness Tampering', class = 'Felony', id = 'P.C. 6013', months = 0, fine = 0, color = 'green', description = 'The willful and knowing coaching or coercing of a witness in a lawful investigation'},
        [14] = {title = 'Failure to Provide Identification', class = 'Misdemeanor', id = 'P.C. 6014', months = 15, fine = 1500, color = 'green', description = 'The act of not presenting identification when lawfully required to do so'},
        [15] = {title = 'Vigilantism', class = 'Felony', id = 'P.C. 6015', months = 30, fine = 1500, color = 'orange', description = 'The act of engaging in enforcing the law with legal authority to do so'},
        [16] = {title = 'Unlawful Assembly', class = 'Misdemeanor', id = 'P.C. 6016', months = 10, fine = 750, color = 'orange', description = 'when a large group gathers in a location that requires prior approval to do so'},
        [17] = {title = 'Government Corruption', class = 'Felony', id = 'P.C. 6017', months = 0, fine = 0, color = 'red', description = 'The act of using political position and power for self gain'},
        [18] = {title = 'Stalking', class = 'Felony', id = 'P.C. 6018', months = 40, fine = 1500, color = 'orange', description = 'When one person monitors another without their consent'},
        [19] = {title = 'Aiding and Abetting', class = 'Misdemeanor', id = 'P.C. 6019', months = 15, fine = 450, color = 'orange', description = 'To assist someone in committing or to encourage someone to commit a crime'},
        [20] = {title = 'Harboring a Fugitive', class = 'Misdemeanor', id = 'P.C. 6020', months = 10, fine = 1000, color = 'green', description = 'When someone willingly hides another who is wanted by the authorities'},
    },
    [7] = {
        [1] = {title = 'Misdemeanor Possession of Marijuana', class = 'Misdemeanor', id = 'P.C. 7001', months = 5, fine = 250, color = 'green', description = 'The possession of a quantity of marijuana in the amount of less the 4 blunts'},
        [2] = {title = 'Felony manufacturing of Marijuana', class = 'Felony', id = 'P.C. 7002', months = 15, fine = 1000, color = 'red', description = 'The possession of a quantity of marijuana that is from manufacturing'},
        [3] = {title = 'Cultivation of Marijuana A', class = 'Misdemeanor', id = 'P.C. 7003', months = 10, fine = 750, color = 'green', description = 'The possession of 4 or less marijuana plants'},
        [4] = {title = 'Cultivation of Marijuana B', class = 'Felony', id = 'P.C. 7004', months = 30, fine = 1500, color = 'orange', description = 'The possession of 5 or more marijuana plants'},
        [5] = {title = 'Possession of Marijuana with Intent to Distribute', class = 'Felony', id = 'P.C. 7005', months = 30, fine = 3000, color = 'orange', description = 'The possession of a quantity of Marijuana for distribution'},
        [6] = {title = 'Misdemeanor Possession of Cocaine', class = 'Misdemeanor', id = 'P.C. 7006', months = 7, fine = 500, color = 'green', description = 'The possession of cocaine in a small quantity usually for personal use'},
        [7] = {title = 'Felony manufacturing Possession of Cocaine', class = 'Felony', id = 'P.C. 7007', months = 25, fine = 1500, color = 'red', description = 'The possession of a quantity of cocaine that is from manufacturing'},
        [8] = {title = 'Possession of Cocaine with Intent to Distribute', class = 'Felony', id = 'P.C. 7008', months = 35, fine = 4500, color = 'orange', description = 'The possession of a quantity of Cocaine for distribution'},
        [9] = {title = 'Misdemeanor Possession of Methamphetamine', class = 'Misdemeanor', id = 'P.C. 7009', months = 7, fine = 500, color = 'green', description = 'The possession of methamphetamine in a small quantity usually for personal use'},
        [10] = {title = 'Felony manufacturing Possession of Methamphetamine', class = 'Felony', id = 'P.C. 7010', months = 25, fine = 1500, color = 'red', description = 'The possession of a quantity of methamphetamine that is from manufacturing'},
        [11] = {title = 'Possession of Methamphetamine with Intent to Distribute', class = 'Felony', id = 'P.C. 7011', months = 35, fine = 4500, color = 'orange', description = 'The possession of a quantity of Methamphetamine for distribution'},
        [12] = {title = 'Misdemeanor Possession of Oxy / Vicodin', class = 'Misdemeanor', id = 'P.C. 7012', months = 7, fine = 500, color = 'green', description = 'The possession of oxy / vicodin in a small quantity usually for personal use without prescription'},
        [13] = {title = 'Felony manufacturing Possession of Oxy / Vicodin', class = 'Felony', id = 'P.C. 7013', months = 25, fine = 1500, color = 'red', description = 'The possession of a quantity of oxy / vicodin that is from manufacturing'},
        [14] = {title = 'Felony Possession of Oxy / Vicodin with Intent to Distribute', class = 'Felony', id = 'P.C. 7014', months = 35, fine = 4500, color = 'orange', description = 'The possession of a quantity of oxy / vicodin for distribution'},
        [15] = {title = 'Misdemeanor Possession of Ecstasy', class = 'Misdemeanor', id = 'P.C. 7015', months = 7, fine = 500, color = 'green', description = 'The possession of ecstasy in a small quantity usually for personal use'},
        [16] = {title = 'Felony manufacturing Possession of Ecstasy', class = 'Felony', id = 'P.C. 7016', months = 25, fine = 1500, color = 'red', description = 'The possession of a quantity of ecstasy that is from manufacturing'},
        [17] = {title = 'Possession of Ecstasy with Intent to Distribute', class = 'Felony', id = 'P.C. 7017', months = 35, fine = 4500, color = 'orange', description = 'The possession of a quantity of ecstasy for distribution'},
        [18] = {title = 'Misdemeanor Possession of Opium', class = 'Misdemeanor', id = 'P.C. 7018', months = 7, fine = 500, color = 'green', description = 'The possession of opium in a small quantity usually for personal use'},
        [19] = {title = 'Felony manufacturing Possession of Opium', class = 'Felony', id = 'P.C. 7019', months = 25, fine = 1500, color = 'red', description = 'The possession of a quantity of opium that is from manufacturing'},
        [20] = {title = 'Possession of Opium with Intent to Distribute', class = 'Felony', id = 'P.C. 7020', months = 35, fine = 4500, color = 'orange', description = 'The possession of a quantity of Opium for distribution'},
        [21] = {title = 'Misdemeanor Possession of Adderall', class = 'Misdemeanor', id = 'P.C. 7021', months = 7, fine = 500, color = 'green', description = 'The possession of adderall in a small quantity usually for personal use without prescription'},
        [22] = {title = 'Felony manufacturing Possession of Adderall', class = 'Felony', id = 'P.C. 7022', months = 25, fine = 1500, color = 'red', description = 'The possession of a quantity of adderall that is from manufacturing'},
        [23] = {title = 'Possession of Adderall with Intent to Distribute', class = 'Felony', id = 'P.C. 7023', months = 35, fine = 4500, color = 'orange', description = 'The possession of a quantity of Adderall for distribution'},
        [24] = {title = 'Misdemeanor Possession of Xanax', class = 'Misdemeanor', id = 'P.C. 7024', months = 7, fine = 500, color = 'green', description = 'The possession of xanax in a small quantity usually for personal use without prescription'},
        [25] = {title = 'Felony manufacturing Possession of Xanax', class = 'Felony', id = 'P.C. 7025', months = 25, fine = 1500, color = 'red', description = 'The possession of a quantity of xanax that is from manufacturing'},
        [26] = {title = 'Possession of Xanax with Intent to Distribute', class = 'Felony', id = 'P.C. 7026', months = 35, fine = 4500, color = 'orange', description = 'The possession of a quantity of Xanax for distribution'},
        [27] = {title = 'Misdemeanor Possession of Shrooms', class = 'Misdemeanor', id = 'P.C. 7027', months = 7, fine = 500, color = 'green', description = 'The possession of shrooms in a small quantity usually for personal use'},
        [28] = {title = 'Felony manufacturing Possession of Shrooms', class = 'Felony', id = 'P.C. 7028', months = 25, fine = 1500, color = 'red', description = 'The possession of a quantity of shrooms that is from manufacturing'},
        [29] = {title = 'Possession of Shrooms with Intent to Distribute', class = 'Felony', id = 'P.C. 7029', months = 35, fine = 4500, color = 'orange', description = 'The possession of a quantity of Shrooms for distribution'},
        [30] = {title = 'Misdemeanor Possession of Lean', class = 'Misdemeanor', id = 'P.C. 7030', months = 7, fine = 500, color = 'green', description = 'The possession of lean in a small quantity usually for personal use'},
        [31] = {title = 'Felony manufacturing Possession of Lean', class = 'Felony', id = 'P.C. 7031', months = 25, fine = 1500, color = 'red', description = 'The possession of a quantity of lean that is from manufacturing'},
        [32] = {title = 'Possession of Lean with Intent to Distribute', class = 'Felony', id = 'P.C. 7032', months = 35, fine = 4500, color = 'orange', description = 'The possession of a quantity of lean for distribution'},
        [33] = {title = 'Sale of a controlled substance', class = 'Misdemeanor', id = 'P.C. 7033', months = 10, fine = 1000, color = 'green', description = 'The sale of a substance that is controlled by law'},
        [34] = {title = 'Drug Trafficking', class = 'Felony', id = 'P.C. 7034', months = 0, fine = 0, color = 'red', description = 'The large scale movement of illegal drugs'},
        [35] = {title = 'Desecration of a Human Corpse', class = 'Felony', id = 'P.C. 7035', months = 20, fine = 1500, color = 'orange', description = 'When someone harms, disturbs or destroys the remains of another person'},
        [36] = {title = 'Public Intoxication', class = 'Infraction', id = 'P.C. 7036', months = 0, fine = 500, color = 'green', description = 'When someone is intoxicated above legal limit in public'},
        [37] = {title = 'Public Indecency', class = 'Misdemeanor', id = 'P.C. 7037', months = 10, fine = 750, color = 'green', description = 'The act of someone exposing themself in a way that infringes in public morals'},
    },
    [8] = {
        [1] = {title = 'Criminal Possession of Weapon Class A', class = 'Felony', id = 'P.C. 8001', months = 10, fine = 500, color = 'green', description = 'Possession of a Class A firearm without licensing'},
        [2] = {title = 'Criminal Possession of Weapon Class B', class = 'Felony', id = 'P.C. 8002', months = 15, fine = 1000, color = 'green', description = 'Possession of a Class B firearm without licensing'},
        [3] = {title = 'Criminal Possession of Weapon Class C', class = 'Felony', id = 'P.C. 8003', months = 30, fine = 3500, color = 'green', description = 'Possession of a Class C firearm without licensing'},
        [4] = {title = 'Criminal Possession of Weapon Class D', class = 'Felony', id = 'P.C. 8004', months = 25, fine = 1500, color = 'green', description = 'Possession of a Class D firearm without licensing'},
        [5] = {title = 'Criminal Sale of Weapon Class A', class = 'Felony', id = 'P.C. 8005', months = 15, fine = 1000, color = 'orange', description = 'The act of selling a Class A firearm without licensing'},
        [6] = {title = 'Criminal Sale of Weapon Class B', class = 'Felony', id = 'P.C. 8006', months = 20, fine = 2000, color = 'orange', description = 'The act of selling a Class B firearm without licensing'},
        [7] = {title = 'Criminal Sale of Weapon Class C', class = 'Felony', id = 'P.C. 8007', months = 35, fine = 7000, color = 'orange', description = 'The act of selling a Class C firearm without licensing'},
        [8] = {title = 'Criminal Sale of Weapon Class D', class = 'Felony', id = 'P.C. 8008', months = 30, fine = 3000, color = 'orange', description = 'The act of selling a Class D firearm without licensing'},
        [9] = {title = 'Criminal Use of Weapon', class = 'Misdemeanor', id = 'P.C. 8009', months = 10, fine = 450, color = 'orange', description = 'Use of a weapon while in commission of a crime'},
        [10] = {title = 'Possession of Illegal Firearm Modifications', class = 'Misdemeanor', id = 'P.C. 8010', months = 10, fine = 300, color = 'green', description = 'Being in possession of firearm modifications unlawfully'},
        [11] = {title = 'Weapon Trafficking', class = 'Felony', id = 'P.C. 8011', months = 0, fine = 0, color = 'red', description = 'The transportation of a large amount of weapons for one point to another'},
        [12] = {title = 'Brandishing a Weapon', class = 'Misdemeanor', id = 'P.C. 8012', months = 15, fine = 500, color = 'orange', description = 'The act of making a firearm purposely visible'},
        [13] = {title = 'Insurrection', class = 'Felony', id = 'P.C. 8013', months = 0, fine = 0, color = 'red', description = 'Attempting to ogreenhrow the government with violence'},
        [14] = {title = 'Flying into Restricted Airspace', class = 'Felony', id = 'P.C. 8014', months = 20, fine = 1500, color = 'green', description = 'Piloting and aircraft into airspace that is governmentally controlled'},
        [15] = {title = 'Jaywalking', class = 'Infraction', id = 'P.C. 8015', months = 0, fine = 150, color = 'green', description = 'crossing a roadway in a manner that is hazardous to motor vehicles'},
        [16] = {title = 'Criminal Use of Explosives', class = 'Felony', id = 'P.C. 8016', months = 30, fine = 2500, color = 'orange', description = 'Use of explosives to committing a crime'},
    },
    [9] = {
        [1] = {title = 'Driving While Intoxicated', class = 'Misdemeanor', id = 'P.C. 9001', months = 5, fine = 300, color = 'green', description = 'Operating a motor vehicle while impaired by alcohol'},
        [2] = {title = 'Evading', class = 'Misdemeanor', id = 'P.C. 9002', months = 5, fine = 400, color = 'green', description = 'Hiding or running from lawful detainment'},
        [3] = {title = 'Reckless Evading', class = 'Felony', id = 'P.C. 9003', months = 10, fine = 800, color = 'orange', description = 'Recklessly disregarding safety and Hiding or running from lawful detainment while '},
        [4] = {title = 'Failure to Yield to Emergency Vehicle', class = 'Infraction', id = 'P.C. 9004', months = 0, fine = 600, color = 'green', description = 'Not giving way to emergency vehicles'},
        [5] = {title = 'Failure to Obey Traffic Control Device', class = 'Infraction', id = 'P.C. 9005', months = 0, fine = 150, color = 'green', description = 'Not following the safety devices of the roadway'},
        [6] = {title = 'Nonfunctional Vehicle', class = 'Infraction', id = 'P.C. 9006', months = 0, fine = 75, color = 'green', description = 'Having a vehicle that is no longer functional in the roadway'},
        [7] = {title = 'Negligent Driving', class = 'Infraction', id = 'P.C. 9007', months = 0, fine = 300, color = 'green', description = 'Driving in a manner as to unknowingly disregard safety'},
        [8] = {title = 'Reckless Driving', class = 'Misdemeanor', id = 'P.C. 9008', months = 10, fine = 750, color = 'orange', description = 'Driving in a manner as to knowingly disregard safety'},
        [9] = {title = 'Third Degree Speeding', class = 'Infraction', id = 'P.C. 9009', months = 0, fine = 225, color = 'green', description = 'Speeding 15 over the limit'},
        [10] = {title = 'Second Degree Speeding', class = 'Infraction', id = 'P.C. 9010', months = 0, fine = 450, color = 'green', description = 'Speeding 35 over the limit'},
        [11] = {title = 'First Degree Speeding', class = 'Infraction', id = 'P.C. 9011', months = 0, fine = 750, color = 'green', description = 'Speeding 50 over the limit'},
        [12] = {title = 'Unlicensed Operation of Vehicle', class = 'Infraction', id = 'P.C. 9012', months = 0, fine = 500, color = 'green', description = 'The operation of a motor vehicle without proper licensing'},
        [13] = {title = 'Illegal U-Turn', class = 'Infraction', id = 'P.C. 9013', months = 0, fine = 75, color = 'green', description = 'Performing a u-turn where it is prohibited'},
        [14] = {title = 'Illegal Passing', class = 'Infraction', id = 'P.C. 9014', months = 0, fine = 300, color = 'green', description = 'Passing other motor vehicles in a prohibited manner'},
        [15] = {title = 'Failure to Maintain Lane', class = 'Infraction', id = 'P.C. 9015', months = 0, fine = 300, color = 'green', description = 'Not staying in the correct lane with a motor vehicle'},
        [16] = {title = 'Illegal Turn', class = 'Infraction', id = 'P.C. 9016', months = 0, fine = 150, color = 'green', description = 'Performing a turn where it is prohibited'},
        [17] = {title = 'Failure to Stop', class = 'Infraction', id = 'P.C. 9017', months = 0, fine = 600, color = 'green', description = 'Not stopping for a lawful stop or traffic device'},
        [18] = {title = 'Unauthorized Parking', class = 'Infraction', id = 'P.C. 9018', months = 0, fine = 300, color = 'green', description = 'Parking a vehicle in a location that requires approval with any'},
        [19] = {title = 'Hit and Run', class = 'Misdemeanor', id = 'P.C. 9019', months = 10, fine = 500, color = 'green', description = 'Striking another person or vehicle and fleeing the location'},
        [20] = {title = 'Driving without Headlights or Signals', class = 'Infraction', id = 'P.C. 9020', months = 0, fine = 300, color = 'green', description = 'Operating a vehicle with no functional lights'},
        [21] = {title = 'Street Racing', class = 'Felony', id = 'P.C. 9021', months = 15, fine = 1500, color = 'green', description = 'Operating motorvehicles in a contest'},
        [22] = {title = 'Piloting without Proper Licensing', class = 'Felony', id = 'P.C. 9022', months = 20, fine = 1500, color = 'orange', description = 'Failure to be in possession of valid licensing when operating an aircraft'},
        [23] = {title = 'Unlawful Use of a Motor Vehicle', class = 'Misdemeanor', id = 'P.C. 9023', months = 10, fine = 750, color = 'green', description = 'The use of a motor vehicle without a lawful reason'},
    },
    [10] = {
        [1] = {title = 'Hunting in Restricted Areas', class = 'Infraction', id = 'P.C. 10001', months = 0, fine = 450, color = 'green', description = 'Harvesting game in areas where it is prohibited to do so'},
        [2] = {title = 'Unlicensed Hunting', class = 'Infraction', id = 'P.C. 10002', months = 0, fine = 450, color = 'green', description = 'Harvesting game without proper licensing'},
        [3] = {title = 'Animal Cruelty', class = 'Misdemeanor', id = 'P.C. 10003', months = 10, fine = 450, color = 'green', description = 'The act of abusing an animal knowingly or not'},
        [4] = {title = 'Hunting with a Non-Hunting Weapon', class = 'Misdemeanor', id = 'P.C. 10004', months = 10, fine = 750, color = 'green', description = 'To use a weapon not lawfully stated or manufactured to be used for the harvesting of wild game'},
        [5] = {title = 'Hunting outside of hunting hours', class = 'Infraction', id = 'P.C. 10005', months = 0, fine = 750, color = 'green', description = 'Harvesting animals outside of specified time to do so'},
        [6] = {title = 'Overhunting', class = 'Misdemeanor', id = 'P.C. 10006', months = 10, fine = 1000, color = 'green', description = 'Taking more than legally specified amount of game'},
        [7] = {title = 'Poaching', class = 'Felony', id = 'P.C. 10007', months = 20, fine = 1250, color = 'red', description = 'Harvesting an animal that is listed as legally non-harvestable'},
    }
}

Config.AllowedJobs = {}
for index, value in pairs(Config.PoliceJobs) do
    Config.AllowedJobs[index] = value
end
for index, value in pairs(Config.AmbulanceJobs) do
    Config.AllowedJobs[index] = value
end
for index, value in pairs(Config.DojJobs) do
    Config.AllowedJobs[index] = value
end

Config.SecurityCameras = {
    hideradar = false,
    cameras = {
        [1] = { label = 'Pacific Bank CAM#1', coords = vector3(257.45, 210.07, 109.08), r = { x = -25.0, y = 0.0, z = 28.05 }, canRotate = false, isOnline = true },
        [2] = { label = 'Pacific Bank CAM#2', coords = vector3(232.86, 221.46, 107.83), r = { x = -25.0, y = 0.0, z = -140.91 }, canRotate = false, isOnline = true },
        [3] = { label = 'Pacific Bank CAM#3', coords = vector3(252.27, 225.52, 103.99), r = { x = -35.0, y = 0.0, z = -74.87 }, canRotate = false, isOnline = true },
        [4] = { label = 'Limited Ltd Grove St. CAM#1', coords = vector3(-53.1433, -1746.714, 31.546), r = { x = -35.0, y = 0.0, z = -168.9182 }, canRotate = false, isOnline = true },
        [5] = { label = "Rob's Liqour Prosperity St. CAM#1", coords = vector3(-1482.9, -380.463, 42.363), r = { x = -35.0, y = 0.0, z = 79.53281 }, canRotate = false, isOnline = true },
        [6] = { label = "Rob's Liqour San Andreas Ave. CAM#1", coords = vector3(-1224.874, -911.094, 14.401), r = { x = -35.0, y = 0.0, z = -6.778894 }, canRotate = false, isOnline = true },
        [7] = { label = 'Limited Ltd Ginger St. CAM#1', coords = vector3(-718.153, -909.211, 21.49), r = { x = -35.0, y = 0.0, z = -137.1431 }, canRotate = false, isOnline = true },
        [8] = { label = '24/7 Supermarkt Innocence Blvd. CAM#1', coords = vector3(23.885, -1342.441, 31.672), r = { x = -35.0, y = 0.0, z = -142.9191 }, canRotate = false, isOnline = true },
        [9] = { label = "Rob's Liqour El Rancho Blvd. CAM#1", coords = vector3(1133.024, -978.712, 48.515), r = { x = -35.0, y = 0.0, z = -137.302 }, canRotate = false, isOnline = true },
        [10] = { label = 'Limited Ltd West Mirror Drive CAM#1', coords = vector3(1151.93, -320.389, 71.33), r = { x = -35.0, y = 0.0, z = -119.4468 }, canRotate = false, isOnline = true },
        [11] = { label = '24/7 Supermarkt Clinton Ave CAM#1', coords = vector3(383.402, 328.915, 105.541), r = { x = -35.0, y = 0.0, z = 118.585 }, canRotate = false, isOnline = true },
        [12] = { label = 'Limited Ltd Banham Canyon Dr CAM#1', coords = vector3(-1832.057, 789.389, 140.436), r = { x = -35.0, y = 0.0, z = -91.481 }, canRotate = false, isOnline = true },
        [13] = { label = "Rob's Liqour Great Ocean Hwy CAM#1", coords = vector3(-2966.15, 387.067, 17.393), r = { x = -35.0, y = 0.0, z = 32.92229 }, canRotate = false, isOnline = true },
        [14] = { label = '24/7 Supermarkt Ineseno Road CAM#1', coords = vector3(-3046.749, 592.491, 9.808), r = { x = -35.0, y = 0.0, z = -116.673 }, canRotate = false, isOnline = true },
        [15] = { label = '24/7 Supermarkt Barbareno Rd. CAM#1', coords = vector3(-3246.489, 1010.408, 14.705), r = { x = -35.0, y = 0.0, z = -135.2151 }, canRotate = false, isOnline = true },
        [16] = { label = '24/7 Supermarkt Route 68 CAM#1', coords = vector3(539.773, 2664.904, 44.056), r = { x = -35.0, y = 0.0, z = -42.947 }, canRotate = false, isOnline = true },
        [17] = { label = "Rob's Liqour Route 68 CAM#1", coords = vector3(1169.855, 2711.493, 40.432), r = { x = -35.0, y = 0.0, z = 127.17 }, canRotate = false, isOnline = true },
        [18] = { label = '24/7 Supermarkt Senora Fwy CAM#1', coords = vector3(2673.579, 3281.265, 57.541), r = { x = -35.0, y = 0.0, z = -80.242 }, canRotate = false, isOnline = true },
        [19] = { label = '24/7 Supermarkt Alhambra Dr. CAM#1', coords = vector3(1966.24, 3749.545, 34.143), r = { x = -35.0, y = 0.0, z = 163.065 }, canRotate = false, isOnline = true },
        [20] = { label = '24/7 Supermarkt Senora Fwy CAM#2', coords = vector3(1729.522, 6419.87, 37.262), r = { x = -35.0, y = 0.0, z = -160.089 }, canRotate = false, isOnline = true },
        [21] = { label = 'Fleeca Bank Hawick Ave CAM#1', coords = vector3(309.341, -281.439, 55.88), r = { x = -35.0, y = 0.0, z = -146.1595 }, canRotate = false, isOnline = true },
        [22] = { label = 'Fleeca Bank Legion Square CAM#1', coords = vector3(144.871, -1043.044, 31.017), r = { x = -35.0, y = 0.0, z = -143.9796 }, canRotate = false, isOnline = true },
        [23] = { label = 'Fleeca Bank Hawick Ave CAM#2', coords = vector3(-355.7643, -52.506, 50.746), r = { x = -35.0, y = 0.0, z = -143.8711 }, canRotate = false, isOnline = true },
        [24] = { label = 'Fleeca Bank Del Perro Blvd CAM#1', coords = vector3(-1214.226, -335.86, 39.515), r = { x = -35.0, y = 0.0, z = -97.862 }, canRotate = false, isOnline = true },
        [25] = { label = 'Fleeca Bank Great Ocean Hwy CAM#1', coords = vector3(-2958.885, 478.983, 17.406), r = { x = -35.0, y = 0.0, z = -34.69595 }, canRotate = false, isOnline = true },
        [26] = { label = 'Paleto Bank CAM#1', coords = vector3(-102.939, 6467.668, 33.424), r = { x = -35.0, y = 0.0, z = 24.66 }, canRotate = false, isOnline = true },
        [27] = { label = 'Del Vecchio Liquor Paleto Bay', coords = vector3(-163.75, 6323.45, 33.424), r = { x = -35.0, y = 0.0, z = 260.00 }, canRotate = false, isOnline = true },
        [28] = { label = "Don's Country Store Paleto Bay CAM#1", coords = vector3(166.42, 6634.4, 33.69), r = { x = -35.0, y = 0.0, z = 32.00 }, canRotate = false, isOnline = true },
        [29] = { label = "Don's Country Store Paleto Bay CAM#2", coords = vector3(163.74, 6644.34, 33.69), r = { x = -35.0, y = 0.0, z = 168.00 }, canRotate = false, isOnline = true },
        [30] = { label = "Don's Country Store Paleto Bay CAM#3", coords = vector3(169.54, 6640.89, 33.69), r = { x = -35.0, y = 0.0, z = 5.78 }, canRotate = false, isOnline = true },
        [31] = { label = 'Vangelico Jewelery CAM#1', coords = vector3(-627.54, -239.74, 40.33), r = { x = -35.0, y = 0.0, z = 5.78 }, canRotate = true, isOnline = true },
        [32] = { label = 'Vangelico Jewelery CAM#2', coords = vector3(-627.51, -229.51, 40.24), r = { x = -35.0, y = 0.0, z = -95.78 }, canRotate = true, isOnline = true },
        [33] = { label = 'Vangelico Jewelery CAM#3', coords = vector3(-620.3, -224.31, 40.23), r = { x = -35.0, y = 0.0, z = 165.78 }, canRotate = true, isOnline = true },
        [34] = { label = 'Vangelico Jewelery CAM#4', coords = vector3(-622.57, -236.3, 40.31), r = { x = -35.0, y = 0.0, z = 5.78 }, canRotate = true, isOnline = true },
    },
}

Config.SecurityCameras = {
    hideradar = false,
    cameras = {
        [1] = { label = 'Pacific Bank CAM#1', coords = vector3(257.45, 210.07, 109.08), r = { x = -25.0, y = 0.0, z = 28.05 }, canRotate = false, isOnline = true },
        [2] = { label = 'Pacific Bank CAM#2', coords = vector3(232.86, 221.46, 107.83), r = { x = -25.0, y = 0.0, z = -140.91 }, canRotate = false, isOnline = true },
        [3] = { label = 'Pacific Bank CAM#3', coords = vector3(252.27, 225.52, 103.99), r = { x = -35.0, y = 0.0, z = -74.87 }, canRotate = false, isOnline = true },
        [4] = { label = 'Limited Ltd Grove St. CAM#1', coords = vector3(-53.1433, -1746.714, 31.546), r = { x = -35.0, y = 0.0, z = -168.9182 }, canRotate = false, isOnline = true },
        [5] = { label = "Rob's Liqour Prosperity St. CAM#1", coords = vector3(-1482.9, -380.463, 42.363), r = { x = -35.0, y = 0.0, z = 79.53281 }, canRotate = false, isOnline = true },
        [6] = { label = "Rob's Liqour San Andreas Ave. CAM#1", coords = vector3(-1224.874, -911.094, 14.401), r = { x = -35.0, y = 0.0, z = -6.778894 }, canRotate = false, isOnline = true },
        [7] = { label = 'Limited Ltd Ginger St. CAM#1', coords = vector3(-718.153, -909.211, 21.49), r = { x = -35.0, y = 0.0, z = -137.1431 }, canRotate = false, isOnline = true },
        [8] = { label = '24/7 Supermarkt Innocence Blvd. CAM#1', coords = vector3(23.885, -1342.441, 31.672), r = { x = -35.0, y = 0.0, z = -142.9191 }, canRotate = false, isOnline = true },
        [9] = { label = "Rob's Liqour El Rancho Blvd. CAM#1", coords = vector3(1133.024, -978.712, 48.515), r = { x = -35.0, y = 0.0, z = -137.302 }, canRotate = false, isOnline = true },
        [10] = { label = 'Limited Ltd West Mirror Drive CAM#1', coords = vector3(1151.93, -320.389, 71.33), r = { x = -35.0, y = 0.0, z = -119.4468 }, canRotate = false, isOnline = true },
        [11] = { label = '24/7 Supermarkt Clinton Ave CAM#1', coords = vector3(383.402, 328.915, 105.541), r = { x = -35.0, y = 0.0, z = 118.585 }, canRotate = false, isOnline = true },
        [12] = { label = 'Limited Ltd Banham Canyon Dr CAM#1', coords = vector3(-1832.057, 789.389, 140.436), r = { x = -35.0, y = 0.0, z = -91.481 }, canRotate = false, isOnline = true },
        [13] = { label = "Rob's Liqour Great Ocean Hwy CAM#1", coords = vector3(-2966.15, 387.067, 17.393), r = { x = -35.0, y = 0.0, z = 32.92229 }, canRotate = false, isOnline = true },
        [14] = { label = '24/7 Supermarkt Ineseno Road CAM#1', coords = vector3(-3046.749, 592.491, 9.808), r = { x = -35.0, y = 0.0, z = -116.673 }, canRotate = false, isOnline = true },
        [15] = { label = '24/7 Supermarkt Barbareno Rd. CAM#1', coords = vector3(-3246.489, 1010.408, 14.705), r = { x = -35.0, y = 0.0, z = -135.2151 }, canRotate = false, isOnline = true },
        [16] = { label = '24/7 Supermarkt Route 68 CAM#1', coords = vector3(539.773, 2664.904, 44.056), r = { x = -35.0, y = 0.0, z = -42.947 }, canRotate = false, isOnline = true },
        [17] = { label = "Rob's Liqour Route 68 CAM#1", coords = vector3(1169.855, 2711.493, 40.432), r = { x = -35.0, y = 0.0, z = 127.17 }, canRotate = false, isOnline = true },
        [18] = { label = '24/7 Supermarkt Senora Fwy CAM#1', coords = vector3(2673.579, 3281.265, 57.541), r = { x = -35.0, y = 0.0, z = -80.242 }, canRotate = false, isOnline = true },
        [19] = { label = '24/7 Supermarkt Alhambra Dr. CAM#1', coords = vector3(1966.24, 3749.545, 34.143), r = { x = -35.0, y = 0.0, z = 163.065 }, canRotate = false, isOnline = true },
        [20] = { label = '24/7 Supermarkt Senora Fwy CAM#2', coords = vector3(1729.522, 6419.87, 37.262), r = { x = -35.0, y = 0.0, z = -160.089 }, canRotate = false, isOnline = true },
        [21] = { label = 'Fleeca Bank Hawick Ave CAM#1', coords = vector3(309.341, -281.439, 55.88), r = { x = -35.0, y = 0.0, z = -146.1595 }, canRotate = false, isOnline = true },
        [22] = { label = 'Fleeca Bank Legion Square CAM#1', coords = vector3(144.871, -1043.044, 31.017), r = { x = -35.0, y = 0.0, z = -143.9796 }, canRotate = false, isOnline = true },
        [23] = { label = 'Fleeca Bank Hawick Ave CAM#2', coords = vector3(-355.7643, -52.506, 50.746), r = { x = -35.0, y = 0.0, z = -143.8711 }, canRotate = false, isOnline = true },
        [24] = { label = 'Fleeca Bank Del Perro Blvd CAM#1', coords = vector3(-1214.226, -335.86, 39.515), r = { x = -35.0, y = 0.0, z = -97.862 }, canRotate = false, isOnline = true },
        [25] = { label = 'Fleeca Bank Great Ocean Hwy CAM#1', coords = vector3(-2958.885, 478.983, 17.406), r = { x = -35.0, y = 0.0, z = -34.69595 }, canRotate = false, isOnline = true },
        [26] = { label = 'Paleto Bank CAM#1', coords = vector3(-102.939, 6467.668, 33.424), r = { x = -35.0, y = 0.0, z = 24.66 }, canRotate = false, isOnline = true },
        [27] = { label = 'Del Vecchio Liquor Paleto Bay', coords = vector3(-163.75, 6323.45, 33.424), r = { x = -35.0, y = 0.0, z = 260.00 }, canRotate = false, isOnline = true },
        [28] = { label = "Don's Country Store Paleto Bay CAM#1", coords = vector3(166.42, 6634.4, 33.69), r = { x = -35.0, y = 0.0, z = 32.00 }, canRotate = false, isOnline = true },
        [29] = { label = "Don's Country Store Paleto Bay CAM#2", coords = vector3(163.74, 6644.34, 33.69), r = { x = -35.0, y = 0.0, z = 168.00 }, canRotate = false, isOnline = true },
        [30] = { label = "Don's Country Store Paleto Bay CAM#3", coords = vector3(169.54, 6640.89, 33.69), r = { x = -35.0, y = 0.0, z = 5.78 }, canRotate = false, isOnline = true },
        [31] = { label = 'Vangelico Jewelery CAM#1', coords = vector3(-627.54, -239.74, 40.33), r = { x = -35.0, y = 0.0, z = 5.78 }, canRotate = true, isOnline = true },
        [32] = { label = 'Vangelico Jewelery CAM#2', coords = vector3(-627.51, -229.51, 40.24), r = { x = -35.0, y = 0.0, z = -95.78 }, canRotate = true, isOnline = true },
        [33] = { label = 'Vangelico Jewelery CAM#3', coords = vector3(-620.3, -224.31, 40.23), r = { x = -35.0, y = 0.0, z = 165.78 }, canRotate = true, isOnline = true },
        [34] = { label = 'Vangelico Jewelery CAM#4', coords = vector3(-622.57, -236.3, 40.31), r = { x = -35.0, y = 0.0, z = 5.78 }, canRotate = true, isOnline = true },
    },
}

Config.ColorNames = {
    [0] = "Noir Métallisé",
    [1] = "Noir Graphite Métallisé",
    [2] = "Noir Acier Métallisé",
    [3] = "Gris Foncé Métallisé",
    [4] = "Argent Métallisé",
    [5] = "Bleu Argent Métallisé",
    [6] = "Gris Acier Métallisé",
    [7] = "Gris Argent Métallisé",
    [8] = "Gris Pierre Métallisé",
    [9] = "Gris Minuit Métallisé",
    [10] = "Gris Métal",
    [11] = "Gris Anthracite Mat",
    [12] = "Noir Mat",
    [13] = "Gris Mat",
    [14] = "Gris Clair Mat",
    [15] = "Noir Utilitaire",
    [16] = "Poly Noir Utilitaire",
    [17] = "Gris Foncé Utilitaire",
    [18] = "Argent Utilitaire",
    [19] = "Gris Métal Utilitaire",
    [20] = "Gris Argent Utilitaire",
    [21] = "Noir Usé",
    [22] = "Graphite Usé",
    [23] = "Gris Argent Usé",
    [24] = "Argent Usé",
    [25] = "Bleu Argent Usé",
    [26] = "Gris Argent Usé",
    [27] = "Rouge Métallisé",
    [28] = "Rouge Torino Métallisé",
    [29] = "Rouge Formule Métallisé",
    [30] = "Rouge Blaze Métallisé",
    [31] = "Rouge Gracieux Métallisé",
    [32] = "Rouge Grenat Métallisé",
    [33] = "Rouge Désert Métallisé",
    [34] = "Rouge Cabernet Métallisé",
    [35] = "Rouge Bonbon Métallisé",
    [36] = "Orange Lever de Soleil Métallisé",
    [37] = "Or Classique Métallisé",
    [38] = "Orange Métallisé",
    [39] = "Rouge Mat",
    [40] = "Rouge Foncé Mat",
    [41] = "Orange Mat",
    [42] = "Jaune Mat",
    [43] = "Rouge Utilitaire",
    [44] = "Rouge Vif Utilitaire",
    [45] = "Rouge Grenat Utilitaire",
    [46] = "Rouge Usé",
    [47] = "Rouge Doré Usé",
    [48] = "Rouge Foncé Usé",
    [49] = "Vert Foncé Métallisé",
    [50] = "Vert Course Métallisé",
    [51] = "Vert Marin Métallisé",
    [52] = "Vert Olive Métallisé",
    [53] = "Vert Métallisé",
    [54] = "Bleu Vert Essence Métallisé",
    [55] = "Vert Citron Mat",
    [56] = "Vert Foncé Utilitaire",
    [57] = "Vert Utilitaire",
    [58] = "Vert Foncé Usé",
    [59] = "Vert Usé",
    [60] = "Usé Lavage Marin",
    [61] = "Bleu Nuit Métallisé",
    [62] = "Bleu Foncé Métallisé",
    [63] = "Bleu Saxony Métallisé",
    [64] = "Bleu Métallisé",
    [65] = "Bleu Marin Métallisé",
    [66] = "Bleu Port Métallisé",
    [67] = "Bleu Diamant Métallisé",
    [68] = "Bleu Surf Métallisé",
    [69] = "Bleu Nautique Métallisé",
    [70] = "Bleu Brillant Métallisé",
    [71] = "Bleu Violet Métallisé",
    [72] = "Bleu Spinnaker Métallisé",
    [73] = "Bleu Ultra Métallisé",
    [74] = "Bleu Brillant Métallisé",
    [75] = "Bleu Foncé Utilitaire",
    [76] = "Bleu Nuit Utilitaire",
    [77] = "Bleu Utilitaire",
    [78] = "Bleu Mer Mousse Utilitaire",
    [79] = "Bleu Éclair Utilitaire",
    [80] = "Poly Maui Bleu Utilitaire",
    [81] = "Bleu Brillant Utilitaire",
    [82] = "Bleu Foncé Mat",
    [83] = "Bleu Mat",
    [84] = "Bleu Nuit Mat",
    [85] = "Bleu Foncé Usé",
    [86] = "Bleu Usé",
    [87] = "Bleu Clair Usé",
    [88] = "Jaune Taxi Métallisé",
    [89] = "Jaune Course Métallisé",
    [90] = "Bronze Métallisé",
    [91] = "Canari Jaune Métallisé",
    [92] = "Vert Citron Métallisé",
    [93] = "Champagne Métallisé",
    [94] = "Beige Pueblo Métallisé",
    [95] = "Ivoire Foncé Métallisé",
    [96] = "Brun Chocolat Métallisé",
    [97] = "Brun Doré Métallisé",
    [98] = "Brun Clair Métallisé",
    [99] = "Beige Paille Métallisé",
    [100] = "Brun Mousse Métallisé",
    [101] = "Brun Biston Métallisé",
    [102] = "Bois de Hêtre Métallisé",
    [103] = "Bois de Hêtre Foncé Métallisé",
    [104] = "Orange Chocolat Métallisé",
    [105] = "Sable de Plage Métallisé",
    [106] = "Sable Blanchi par le Soleil Métallisé",
    [107] = "Crème Métallisé",
    [108] = "Brun Utilitaire",
    [109] = "Brun Moyen Utilitaire",
    [110] = "Brun Clair Utilitaire",
    [111] = "Blanc Métallisé",
    [112] = "Blanc Givré Métallisé",
    [113] = "Beige Miel Usé",
    [114] = "Brun Usé",
    [115] = "Brun Foncé Usé",
    [116] = "Beige Paille Usé",
    [117] = "Acier Brossé",
    [118] = "Acier Noir Brossé",
    [119] = "Aluminium Brossé",
    [120] = "Chrome",
    [121] = "Blanc Cassé Usé",
    [122] = "Blanc Utilitaire Cassé",
    [123] = "Orange Usé",
    [124] = "Orange Clair Usé",
    [125] = "Vert Sécuricor Métallisé",
    [126] = "Jaune Taxi Usé",
    [127] = "Bleu de Voiture de Police",
    [128] = "Vert Mat",
    [129] = "Brun Mat",
    [130] = "Orange Usé",
    [131] = "Blanc Mat",
    [132] = "Blanc Usé",
    [133] = "Vert Armée Olive Usé",
    [134] = "Blanc Pur",
    [135] = "Rose Vif",
    [136] = "Rose Saumon",
    [137] = "Rose Vermillon Métallisé",
    [138] = "Orange",
    [139] = "Vert",
    [140] = "Bleu",
    [141] = "Noir Bleu Métallisé",
    [142] = "Noir Violet Métallisé",
    [143] = "Noir Rouge Métallisé",
    [144] = "Vert Chasseur",
    [145] = "Violet Métallisé",
    [146] = "Bleu Foncé Métallisé",
    [147] = "MODSHOP NOIR1",
    [148] = "Violet Mat",
    [149] = "Violet Foncé Mat",
    [150] = "Rouge Lave Métallisé",
    [151] = "Vert Forêt Mat",
    [152] = "Olive Mat",
    [153] = "Brun Désert Mat",
    [154] = "Brun Désert Tan Mat",
    [155] = "Vert Feuillage Mat",
    [156] = "COULEUR DE JANTE PAR DÉFAUT",
    [157] = "Bleu Epsilon",
    [158] = "Inconnu",
    [999] = "Couleur Custom",
}

Config.ColorInformation = {
    [0] = "black",
    [1] = "black",
    [2] = "black",
    [3] = "darksilver",
    [4] = "silver",
    [5] = "bluesilver",
    [6] = "silver",
    [7] = "darksilver",
    [8] = "silver",
    [9] = "bluesilver",
    [10] = "darksilver",
    [11] = "darksilver",
    [12] = "matteblack",
    [13] = "gray",
    [14] = "lightgray",
    [15] = "black",
    [16] = "black",
    [17] = "darksilver",
    [18] = "silver",
    [19] = "utilgunmetal",
    [20] = "silver",
    [21] = "black",
    [22] = "black",
    [23] = "darksilver",
    [24] = "silver",
    [25] = "bluesilver",
    [26] = "darksilver",
    [27] = "red",
    [28] = "torinored",
    [29] = "formulared",
    [30] = "blazered",
    [31] = "gracefulred",
    [32] = "garnetred",
    [33] = "desertred",
    [34] = "cabernetred",
    [35] = "candyred",
    [36] = "orange",
    [37] = "gold",
    [38] = "orange",
    [39] = "red",
    [40] = "mattedarkred",
    [41] = "orange",
    [42] = "matteyellow",
    [43] = "red",
    [44] = "brightred",
    [45] = "garnetred",
    [46] = "red",
    [47] = "red",
    [48] = "darkred",
    [49] = "darkgreen",
    [50] = "racingreen",
    [51] = "seagreen",
    [52] = "olivegreen",
    [53] = "green",
    [54] = "gasolinebluegreen",
    [55] = "mattelimegreen",
    [56] = "darkgreen",
    [57] = "green",
    [58] = "darkgreen",
    [59] = "green",
    [60] = "seawash",
    [61] = "midnightblue",
    [62] = "darkblue",
    [63] = "saxonyblue",
    [64] = "blue",
    [65] = "blue",
    [66] = "blue",
    [67] = "diamondblue",
    [68] = "blue",
    [69] = "blue",
    [70] = "brightblue",
    [71] = "purpleblue",
    [72] = "blue",
    [73] = "ultrablue",
    [74] = "brightblue",
    [75] = "darkblue",
    [76] = "midnightblue",
    [77] = "blue",
    [78] = "blue",
    [79] = "lightningblue",
    [80] = "blue",
    [81] = "brightblue",
    [82] = "mattedarkblue",
    [83] = "matteblue",
    [84] = "matteblue",
    [85] = "darkblue",
    [86] = "blue",
    [87] = "lightningblue",
    [88] = "yellow",
    [89] = "yellow",
    [90] = "bronze",
    [91] = "yellow",
    [92] = "lime",
    [93] = "champagne",
    [94] = "beige",
    [95] = "darkivory",
    [96] = "brown",
    [97] = "brown",
    [98] = "lightbrown",
    [99] = "beige",
    [100] = "brown",
    [101] = "brown",
    [102] = "beechwood",
    [103] = "beechwood",
    [104] = "chocoorange",
    [105] = "yellow",
    [106] = "yellow",
    [107] = "cream",
    [108] = "brown",
    [109] = "brown",
    [110] = "brown",
    [111] = "white",
    [112] = "white",
    [113] = "beige",
    [114] = "brown",
    [115] = "brown",
    [116] = "beige",
    [117] = "steel", 
    [118] = "blacksteel",
    [119] = "aluminium",
    [120] = "chrome",
    [121] = "wornwhite",
    [122] = "offwhite",
    [123] = "orange",
    [124] = "lightorange",
    [125] = "green",
    [126] = "yellow",
    [127] = "blue",
    [128] = "green",
    [129] = "brown",
    [130] = "orange",
    [131] = "white",
    [132] = "white",
    [133] = "darkgreen",
    [134] = "white",
    [135] = "pink",
    [136] = "pink",
    [137] = "pink",
    [138] = "orange",
    [139] = "green",
    [140] = "blue",
    [141] = "blackblue",
    [142] = "blackpurple",
    [143] = "blackred",
    [144] = "darkgreen",
    [145] = "purple",
    [146] = "darkblue",
    [147] = "black",
    [148] = "purple",
    [149] = "darkpurple",
    [150] = "red",
    [151] = "darkgreen",
    [152] = "olivedrab",
    [153] = "brown",
    [154] = "tan",
    [155] = "green",
    [156] = "silver",
    [157] = "blue",
    [158] = "black",
}

Config.ClassList = {
    [0] = "Compact",
    [1] = "Sedan",
    [2] = "SUV",
    [3] = "Coupe",
    [4] = "Muscle",
    [5] = "Sport Classic",
    [6] = "Sport",
    [7] = "Super",
    [8] = "Moto",
    [9] = "Off-Road",
    [10] = "Industriels",
    [11] = "Utilitaire",
    [12] = "Van",
    [13] = "Vélo",
    [14] = "Bateau",
    [15] = "Helicoptère",
    [16] = "Avion",
    [17] = "Services",
    [18] = "Urgence",
    [19] = "Militaire",
    [20] = "Commercial",
    [21] = "Train"
}

Config.WeaponClasses = {
    ['LIGHT_IMPACT'] = "Classe 0",
    ['HEAVY_IMPACT'] = "Classe 1",
    ['SMALL_CALIBER'] = "Classe 2",
    ['MEDIUM_CALIBER'] = "Classe 3",
    ['HIGH_CALIBER'] = "Classe 4",
    ['SHOTGUN'] = "Classe 5",
    ['CUTTING'] = "Classe 6",   
    ['FIRE'] = "Classe 8",
    ['SUFFOCATING'] = "Classe 9",
    ['OTHER'] = "Classe 10",
    ['EXPLOSIVE'] = "Classe 99",
    ['NOTHING'] = "Classe X",
}

Config.WeaponClass = {
    --[[ Small Caliber ]]--
    ['WEAPON_PISTOL'] = Config.WeaponClasses['SMALL_CALIBER'],
    ['WEAPON_COMBATPISTOL'] = Config.WeaponClasses['SMALL_CALIBER'],
    ['WEAPON_APPISTOL'] = Config.WeaponClasses['SMALL_CALIBER'],
    ['WEAPON_COMBATPDW'] = Config.WeaponClasses['SMALL_CALIBER'],
    ['WEAPON_MACHINEPISTOL'] = Config.WeaponClasses['SMALL_CALIBER'],
    ['WEAPON_MICROSMG'] = Config.WeaponClasses['SMALL_CALIBER'],
    ['WEAPON_MINISMG'] = Config.WeaponClasses['SMALL_CALIBER'],
    ['WEAPON_PISTOL_MK2'] = Config.WeaponClasses['SMALL_CALIBER'],
    ['WEAPON_SNSPISTOL'] = Config.WeaponClasses['SMALL_CALIBER'],
    ['WEAPON_SNSPISTOL_MK2'] = Config.WeaponClasses['SMALL_CALIBER'],
    ['WEAPON_VINTAGEPISTOL'] = Config.WeaponClasses['SMALL_CALIBER'],

    --[[ Medium Caliber ]]--
    ['WEAPON_ADVANCEDRIFLE'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_ASSAULTSMG'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_BULLPUPRIFLE'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_BULLPUPRIFLE_MK2'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_CARBINERIFLE'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_CARBINERIFLE_MK2'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_COMPACTRIFLE'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_DOUBLEACTION'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_GUSENBERG'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_HEAVYPISTOL'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_MARKSMANPISTOL'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_PISTOL50'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_REVOLVER'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_REVOLVER_MK2'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_SMG'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_SMG_MK2'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_SPECIALCARBINE'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_SPECIALCARBINE_MK2'] = Config.WeaponClasses['MEDIUM_CALIBER'],

    --[[ High Caliber ]]--
    ['WEAPON_ASSAULTRIFLE'] = Config.WeaponClasses['HIGH_CALIBER'],
    ['WEAPON_ASSAULTRIFLE_MK2'] = Config.WeaponClasses['HIGH_CALIBER'],
    ['WEAPON_COMBATMG'] = Config.WeaponClasses['HIGH_CALIBER'],
    ['WEAPON_COMBATMG_MK2'] = Config.WeaponClasses['HIGH_CALIBER'],
    ['WEAPON_HEAVYSNIPER'] = Config.WeaponClasses['HIGH_CALIBER'],
    ['WEAPON_HEAVYSNIPER_MK2'] = Config.WeaponClasses['HIGH_CALIBER'],
    ['WEAPON_MARKSMANRIFLE'] = Config.WeaponClasses['HIGH_CALIBER'],
    ['WEAPON_MARKSMANRIFLE_MK2'] = Config.WeaponClasses['HIGH_CALIBER'],
    ['WEAPON_MG'] = Config.WeaponClasses['HIGH_CALIBER'],
    ['WEAPON_MINIGUN'] = Config.WeaponClasses['HIGH_CALIBER'],
    ['WEAPON_MUSKET'] = Config.WeaponClasses['HIGH_CALIBER'],
    ['WEAPON_RAILGUN'] = Config.WeaponClasses['HIGH_CALIBER'],
    ['WEAPON_HEAVYRIFLE'] = Config.WeaponClasses['HIGH_CALIBER'],

    --[[ Shotguns ]]--
    ['WEAPON_ASSAULTSHOTGUN'] = Config.WeaponClasses['SHOTGUN'],
    ['WEAPON_BULLUPSHOTGUN'] = Config.WeaponClasses['SHOTGUN'],
    ['WEAPON_DBSHOTGUN'] = Config.WeaponClasses['SHOTGUN'],
    ['WEAPON_HEAVYSHOTGUN'] = Config.WeaponClasses['SHOTGUN'],
    ['WEAPON_PUMPSHOTGUN'] = Config.WeaponClasses['SHOTGUN'],
    ['WEAPON_PUMPSHOTGUN_MK2'] = Config.WeaponClasses['SHOTGUN'],
    ['WEAPON_SAWNOFFSHOTGUN'] = Config.WeaponClasses['SHOTGUN'],
    ['WEAPON_SWEEPERSHOTGUN'] = Config.WeaponClasses['SHOTGUN'],
    
    --[[ Cutting Weapons ]]--
    ['WEAPON_BATTLEAXE'] = Config.WeaponClasses['CUTTING'],
    ['WEAPON_BOTTLE'] = Config.WeaponClasses['CUTTING'],
    ['WEAPON_DAGGER'] = Config.WeaponClasses['CUTTING'],
    ['WEAPON_HATCHET'] = Config.WeaponClasses['CUTTING'],
    ['WEAPON_KNIFE'] = Config.WeaponClasses['CUTTING'],
    ['WEAPON_MACHETE'] = Config.WeaponClasses['CUTTING'],
    ['WEAPON_SWITCHBLADE'] = Config.WeaponClasses['CUTTING'],

    --[[ Light Impact ]]--
    ['WEAPON_STUNGUN'] = Config.WeaponClasses['LIGHT_IMPACT'],
    ['WEAPON_GARBAGEBAG'] = Config.WeaponClasses['LIGHT_IMPACT'], -- Garbage Bag
    ['WEAPON_BRIEFCASE'] = Config.WeaponClasses['LIGHT_IMPACT'], -- Briefcase
    ['WEAPON_BRIEFCASE_02'] = Config.WeaponClasses['LIGHT_IMPACT'], -- Briefcase 2
    ['WEAPON_BALL'] = Config.WeaponClasses['LIGHT_IMPACT'],
    ['WEAPON_FLASHLIGHT'] = Config.WeaponClasses['LIGHT_IMPACT'],
    ['WEAPON_KNUCKLE'] = Config.WeaponClasses['LIGHT_IMPACT'],
    ['WEAPON_NIGHTSTICK'] = Config.WeaponClasses['LIGHT_IMPACT'],
    ['WEAPON_SNOWBALL'] = Config.WeaponClasses['LIGHT_IMPACT'],
    ['WEAPON_UNARMED'] = Config.WeaponClasses['LIGHT_IMPACT'],
    
    --[[ Heavy Impact ]]--
    ['WEAPON_BAT'] = Config.WeaponClasses['HEAVY_IMPACT'],
    ['WEAPON_CROWBAR'] = Config.WeaponClasses['HEAVY_IMPACT'],
    ['WEAPON_FIREEXTINGUISHER'] = Config.WeaponClasses['HEAVY_IMPACT'],
    ['WEAPON_FIRWORK'] = Config.WeaponClasses['HEAVY_IMPACT'],
    ['WEAPON_GOLFLCUB'] = Config.WeaponClasses['HEAVY_IMPACT'],
    ['WEAPON_HAMMER'] = Config.WeaponClasses['HEAVY_IMPACT'],
    ['WEAPON_PETROLCAN'] = Config.WeaponClasses['HEAVY_IMPACT'],
    ['WEAPON_POOLCUE'] = Config.WeaponClasses['HEAVY_IMPACT'],
    ['WEAPON_WRENCH'] = Config.WeaponClasses['HEAVY_IMPACT'],
    
    --[[ Explosives ]]--
    ['WEAPON_EXPLOSION'] = Config.WeaponClasses['EXPLOSIVE'],
    ['WEAPON_GRENADE'] = Config.WeaponClasses['EXPLOSIVE'],
    ['WEAPON_COMPACTLAUNCHER'] = Config.WeaponClasses['EXPLOSIVE'],
    ['WEAPON_HOMINGLAUNCHER'] = Config.WeaponClasses['EXPLOSIVE'],
    ['WEAPON_PIPEBOMB'] = Config.WeaponClasses['EXPLOSIVE'],
    ['WEAPON_PROXMINE'] = Config.WeaponClasses['EXPLOSIVE'],
    ['WEAPON_RPG'] = Config.WeaponClasses['EXPLOSIVE'],
    ['WEAPON_STICKYBOMB'] = Config.WeaponClasses['EXPLOSIVE'],
    ['WEAPON_EMPLAUNCHER'] = Config.WeaponClasses['EXPLOSIVE'],
    
    --[[ Fire ]]--
    ['WEAPON_ELECTRIC_FENCE'] = Config.WeaponClasses['FIRE'], -- Electric Fence 
    ['WEAPON_FIRE'] = Config.WeaponClasses['FIRE'], -- Fire
    ['WEAPON_MOLOTOV'] = Config.WeaponClasses['FIRE'],
    ['WEAPON_FLARE'] = Config.WeaponClasses['FIRE'],
    ['WEAPON_FLAREGUN'] = Config.WeaponClasses['FIRE'],

    --[[ Suffocate ]]--
    ['WEAPON_BZGAS'] = Config.WeaponClasses['SUFFOCATING'],
    ['WEAPON_SMOKEGRENADE'] = Config.WeaponClasses['SUFFOCATING'],
}

function GetJobType(job)
	if Config.PoliceJobs[job] then
		return 'police'
	elseif Config.AmbulanceJobs[job] then
		return 'ambulance'
	elseif Config.DojJobs[job] then
		return 'doj'
	else
		return nil
	end
end

function IsJobAllowedToMDT(job)
	if Config.PoliceJobs[job] then
		return true
	elseif Config.AmbulanceJobs[job] then
		return true
	elseif Config.DojJobs[job] then
		return true
	else
		return false
	end
end
