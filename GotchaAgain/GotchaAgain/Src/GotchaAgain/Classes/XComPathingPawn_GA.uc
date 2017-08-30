class XComPathingPawn_GA extends XComPathingPawn;

var private bool AlreadySearched;
var private bool PerfectInformationFound;


// This is done elsewhere in order to properly handle conflicts with our new markers
function protected UpdatePathMarkers() {
    if(!class'GotchaAgainSettings'.default.bUseCustomPathIndicatorSystem) {
        super.UpdatePathMarkers();
    }
}


// This override passes the entire PathingPawn instead of just the destination tile to the UnitFlagManager in order to create the path-indicators from there
// Requires pretty much all variables used in here to be changed from private to protected in order to compile
simulated function UpdatePathTileData() {
	local XComPresentationLayer Pres;

	if(LastActiveUnit != none ) {
		class'X2TacticalVisibilityHelpers'.static.FillPathTileData(LastActiveUnit.ObjectID, PathTiles, PathTileData);
		if(ShowLOSPreview) {
			Pres = `PRES;
            UIUnitFlagManager_GA(Pres.m_kUnitFlagManager).RealizePreviewMovementAndLOS(self);
		}
	}
}


// This override is here to ensure compatibility with the mod Perfect Information!
//function UpdateMeleeDamagePreview(XComGameState_BaseObject NewTargetObject, XComGameState_BaseObject OldTargetObject, XComGameState_Ability AbilityState) {
	//local XComPresentationLayer Pres;
	//local UIUnitFlag UnitFlag;
//
    //if(!IsPerfectInformationLoaded()) {
        //super.UpdateMeleeDamagePreview(NewTargetObject, OldTargetObject, AbilityState);
        //return;
    //}
    //
	//Pres = `PRES;
//
	//if(OldTargetObject != NewTargetObject)
	//{
		//Pres.m_kUnitFlagManager.ClearAbilityDamagePreview();
	//}
//
	//if(NewTargetObject != none && AbilityState != none)
	//{
		//UnitFlag = Pres.m_kUnitFlagManager.GetFlagForObjectID(NewTargetObject.ObjectID);
		//if(UnitFlag != none)
		//{
            //
			////if ( class'XCom_Perfect_Information_UITacticalHUD_ShotHUD'.default.PREVIEW_MINIMUM )
			////{
				////class'XCom_Perfect_Information_UITacticalHUD_ShotHUD'.static.SetAbilityMinDamagePreview(UnitFlag, AbilityState, NewTargetObject.GetReference());
			////}
			////else
			////{
				//Pres.m_kUnitFlagManager.SetAbilityDamagePreview(UnitFlag, AbilityState, NewTargetObject.GetReference());
			////}
		//}
	//}
//}
//
//
//function bool IsPerfectInformationLoaded() {
    //if(!AlreadySearched) {
        //PerfectInformationFound = class'X2DownloadableContentInfo_GotchaAgain'.static.IsOtherModLoaded('PerfectInformation');
        //AlreadySearched = true;
    //}
    //return PerfectInformationFound;
//}