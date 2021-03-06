//##################################################################################################################    
// 
// Print plots with nominal and systematic variations for ttbar sample
//    root -l -b -1 'SystematicPlots("ElMu")'
//
//##################################################################################################################    
R__LOAD_LIBRARY(Histo.C+)
R__LOAD_LIBRARY(Looper.C+)
R__LOAD_LIBRARY(Plot.C+)
R__LOAD_LIBRARY(TResultsTable.C+)
#include "Histo.h"
#include "Looper.h"
#include "Plot.h"
#include "PDFunc.C"

//=== Functions
void SetMultiplot();
void SetMultiplotGen();
TString GetSignalName(float mstop, float mchi);

//=== Constants
TString pathToTree = "/pool/ciencias/userstorage/juanr/stop/jan5/";
TString NameOfTree = "tree";
TString outputFolder = "./output/";
TString BaselineCut = "TNJets >= 2 && TNBtags >= 1 && !TIsSS && TPassTrigger && TPassMETfilters && TNSelLeps == 2 && TLep0_Pt >= 25 && TNgenLeps == 2";
TString Dilepton    = "!TIsSS && TPassTrigger && TPassMETfilters && TNSelLeps == 2 && TLep0_Pt >= 25  && TNgenLeps == 2";
TString C2jets      = "TNJets >= 2 && !TIsSS && TPassTrigger && TPassMETfilters && TNSelLeps == 2 && TLep0_Pt >= 25 && TNgenLeps == 2";
TString dilepgen    = "TNgenLeps == 2 && fabs(TgenLep0_Eta) < 2.4 && fabs(TgenLep1_Eta) < 2.4 && TgenMT2 > 0";
TString binLabelsSR = "150-200, > 200, 0-0.4, 0.4-0.8, 0.8-1.2, 1.2-1.6, 1.6-2.0, > 2.0, 0-20, 20-40, 40-60, 60-80, 80-100, > 100";

const Int_t ngbins = 21; const Int_t ngpbins = 16;
Float_t gbins[ngbins+1] = {0,5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100,200};
Float_t gpbins[ngpbins+1] = {0, 20, 30, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100, 200};

const Int_t nmetbins = 2;
Float_t metbins[nmetbins+1] = {150, 200, 400};

const Int_t ndetabins = 8;
Float_t detabins[ndetabins+1] = {0, 0.1, 0.2, 0.4, 0.6, 0.8, 1.2, 1.6, 2.4};

const TString ttbar = "TTbar_Powheg";

void SavePlot(TString name, TString xtit = "", float ratiomax = 1.4, TString LegendPos = "", bool doSetLogy = false, bool doNorm = true, TString chanlab = "");
MultiPlot *mp;

//=== Main function
void CompMT2(){
  SetMultiplotGen();
  //SavePlot("SignalRegions", "", 3, "0.15, 0.70, 0.43, 0.93, 0.045");
/*
  SavePlot("MT2_21", "M_{T2} (GeV)");
  SavePlot("MET_2", "MET (GeV)");
  SavePlot("MT2_16", "M_{T2} (GeV)");
  SavePlot("DeltaEta_8", "\\Delta\\eta(\\ell\\ell)");
  SavePlot("MT2_16_METb150", "M_{T2} (GeV)");
  SavePlot("DeltaEta_8_METb150", "\\Delta\\eta(\\ell\\ell)");
*/
 // SavePlot("MT2_DiPt_DeltaEta");
 
  SavePlot("MT2", "M_{T2} (GeV)", 1.4, "0.15, 0.20, 0.65, 0.60, 0.06", 1, 1, "(a)");
/*
  SavePlot("DeltaPhi", "\\Delta\\varphi(\\ell\\ell)", 1.4, "0.15, 0.70, 0.43, 0.93, 0.045");
  SavePlot("MET", "MET (GeV)");
  SavePlot("LepPt0", "Leading lepton p_{T} (GeV)");
  SavePlot("LepPt1", "Subeading lepton p_{T} (GeV)");
  SavePlot("LepEta0", "Leading lepton #eta");
  SavePlot("LepEta1", "Subeading lepton #eta");
  SavePlot("DilepPt", "Dilepton p_{T} (GeV)");
  SavePlot("DeltaEta", "\\Delta\\eta(\\ell\\ell)");
  SavePlot("NBtagsNJets", "");
  SavePlot("NJets", "Jet multiplicity");
  SavePlot("NBtags", "b-tag multiplicity");
  SavePlot("JetPt", "Jet p_{T} (GeV)");
  SavePlot("JetEta", "Jet #eta"); 

  SavePlot("TopPt", "top p_{T}");
  SavePlot("TopM",  "top mass"); 


  SavePlot("nVert", "Number of primary verteces");
*/
//  SavePlot("WPt",   "W p_{T}");
//  SavePlot("WM",    "W mass");
}

//=== Plotting function
void SetMultiplot(){
  TString cut = BaselineCut; TString chan = "ElMu";
  mp = new MultiPlot();
  mp->SetPath(pathToTree); mp->SetTreeName(NameOfTree);
  mp->SetPathSignal(pathToTree + "/T2tt/FullSimScan/");
  mp->SetOutputName("");
  //TString out = "output/CompT2ttTopLike/";
  TString out = "output/T2ttScanValidation/compOld_reco/";
  if(chan == "All") out = "output/CompT2ttTopLike/allchannels/";
  mp->SetPlotFolder(out);
  mp->doYieldsInLeg = false;

  mp->SetWeight("TWeight");
/*
  mp->AddDistribution("NBtagsNJets",   "NBtagNJets(TNJets,TNBtags)",  Dilepton, chan,  16, 0, 16);
  mp->AddDistribution("NJets",         "TNJets",                      Dilepton, chan,   9, 0, 8);
  mp->AddDistribution("NBtags",        "TNBtags",                     C2jets,   chan,   5, 0, 4);
  mp->AddDistribution("JetPt",   "TJet_Pt",  cut, chan, 10, 0, 400);
  mp->AddDistribution("JetEta",  "TJet_Eta", cut, chan, 10, -5, 5);

  mp->AddDistribution("MT2",      "TMT2",      cut, chan, ngbins, 0, 0, gbins);
  mp->AddDistribution("MET",      "TMET",      cut, chan, 10, 0, 250);
  mp->AddDistribution("LepPt0",   "TLep0_Pt",  cut, chan, 10, 0, 200);
  mp->AddDistribution("LepPt1",   "TLep1_Pt",  cut, chan, 10, 0, 200);
  mp->AddDistribution("LepEta0",  "TLep0_Eta", cut, chan, 10, -2.4, 2.4);
  mp->AddDistribution("LepEta1",  "TLep1_Eta", cut, chan, 10, -2.4, 2.4);
  mp->AddDistribution("DilepPt",  "GetDilepPtDPhi(TLep0_Pt, TLep1_Pt, TDeltaPhi)", cut, chan, 10, 0, 250);
  mp->AddDistribution("DeltaPhi", "TDeltaPhi", cut, chan, 10, 0, 3.2);
  mp->AddDistribution("DeltaEta", "TDeltaEta", cut, chan, 10, 0, 2.5);
*/
  mp->AddDistribution("nVert", "TNVert", cut, chan, 50, 10, 60);

  //>>> Add nominal samples
  mp->SetPathSignal(pathToTree+ "/RecoComp/");
	mp->AddSample("MuonEG, SingleMuon, SingleElec, DoubleEG, DoubleMuon", "Data",      itSignal, 1, 1);
  mp->AddSample("TTbar_Powheg", "t#bar{t}", itSignal, kBlue);
  mp->AddSample("T2tt_mStop227_mLsp52",  "T2tt[227.5, 52.5]", itSignal, kRed+1); 
  //mp->AddSample("T2tt_mStop227_mLsp52_OLD",  "T2tt_bad[227.5, 52.5]", itSignal, kBlue+1); 

  //mp->AddSample("T2tt_200_50_FS_summer",  "SUSY-like [225,50]", itSignal, kRed+1); 
  //mp->AddSample("T2tt_225_50_FS_xqcut20", "TOP -like [225,50]", itSignal, 1); 
  //mp->AddSample("T2tt_mStop227_mLsp52",     "TOP -like [227.5,52.5]", itSignal, kRed+1); 
  //mp->AddSample("T2tt_mStop227_mLsp52",     "TOP -like [227.5,52.5]", itSignal, 1); 
  //mp->AddSample("T2tt_mStop227_mLsp52_0",   "1/3", itSignal, kRed+2); 
  //mp->AddSample("T2tt_mStop227_mLsp52_1",   "2/3", itSignal, kBlue+2); 
  //mp->AddSample("T2tt_mStop227_mLsp52_2",   "3/3", itSignal, kGreen+3); 
}


void SetMultiplotGen(){
  TString cut = dilepgen; TString chan = "1";
  mp = new MultiPlot();
  mp->SetPath(pathToTree); mp->SetTreeName(NameOfTree);
  mp->SetPathSignal(pathToTree + "/T2tt/Gen/");
  mp->SetOutputName("");
  mp->doYieldsInLeg = false;
  mp->SetRatioYtitle("Signal/t#bar{t}");
  //TString out = "output/T2ttScanValidation/compOld/";
  //TString out = "~/www/stop/mar2018/GenComp/Diagonal/MT2g0/";
  TString out = "~/www/stop/mar2018/GenComp/OutOfDiag/MT2g0/";
  TString weight = "1";

  mp->SetPlotFolder(out);
  mp->SetWeight(weight);
/*
  mp->AddDistribution("MT2_21",              "TgenMT2",      dilepgen, chan, ngbins,    0, 0, gbins);
  mp->AddDistribution("MET_2",               "TgenMET",      dilepgen, chan, nmetbins,  0, 0, metbins);
  mp->AddDistribution("DeltaEta_8",          "TgenDeltaEta", dilepgen + " && TgenMT2 == 0", chan, ndetabins, 0, 0, detabins);
  mp->AddDistribution("MT2_16",              "TgenMT2",      dilepgen + " && TgenMT2 > 0", chan, ngpbins,    0, 0, gpbins);
  mp->AddDistribution("DeltaEta_8_METb150",  "TgenDeltaEta", dilepgen + " && TgenMT2 == 0 && TgenMET < 150", chan, ndetabins, 0, 0, detabins);
  mp->AddDistribution("MT2_16_METb150",      "TgenMT2",      dilepgen + " && TgenMT2 > 0 && TgenMET < 150", chan, ngpbins,    0, 0, gpbins);
*/

  mp->AddDistribution("MT2",      "TgenMT2",      dilepgen, chan, 20, 0, 120);
/*
  mp->AddDistribution("DeltaPhi", "TgenDeltaPhi", cut, chan, 10, 0, 3.2);
  mp->AddDistribution("MET",      "TgenMET",      dilepgen, chan, 20, 0, 250);
  mp->AddDistribution("LepPt0",   "TgenLep0_Pt",  dilepgen, chan, 20, 0, 200);
  mp->AddDistribution("LepEta0",  "TgenLep0_Eta", dilepgen, chan, 10, -2.4, 2.4);
  mp->AddDistribution("LepPt1",   "TgenLep1_Pt",  dilepgen, chan, 20, 0, 200);
  mp->AddDistribution("LepEta1",  "TgenLep1_Eta", dilepgen, chan, 10, -2.4, 2.4);
  mp->AddDistribution("DilepPt",  "GetDilepPtDPhi(TgenLep0_Pt, TgenLep1_Pt, TgenDeltaPhi)", dilepgen, chan, 20, 0, 250);
  mp->AddDistribution("DeltaEta", "TgenDeltaEta", cut, chan, 10, 0, 2.5);

  mp->AddDistribution("NBtagsNJets",   "NBtagNJets(TNgenJets,TNgenBtags)", dilepgen, chan,  16, 0, 16);
  mp->AddDistribution("NJets",         "TNgenJets",                  dilepgen, chan,   9, 0, 8);
  mp->AddDistribution("NBtags",        "TNgenBtags",                 dilepgen, chan,   5, 0, 4);
  mp->AddDistribution("JetPt",   "TgenJet_Pt",  dilepgen, chan, 10, 0, 400);
  mp->AddDistribution("JetEta",  "TgenJet_Eta", dilepgen, chan, 10, -5, 5);

  mp->AddDistribution("TopPt", "TgenTop1Pt",  dilepgen, chan, 30, 0, 300);
  mp->AddDistribution("TopM",  "TgenTop1M" ,  dilepgen, chan, 40, 165, 185);
*/
 //  mp->AddDistribution("WPt",   "TgenW1Pt"  ,  dilepgen, chan, 30, 0, 300);
// Gen mp->AddDistribution("WM",    "TgenW1M"  ,  dilepgen, chan, 40, 76, 120);



//  mp->AddDistribution("SignalRegions", "GetMT2orDeltaEtaBins(TgenMT2, TgenMET, TgenDeltaEta)", cut, chan, 14, 1, 15);
  //mp->AddDistribution("DeltaEta", "TgenDeltaEta", cut + " && TgenMT2 == 0 && GetDilepPtDPhi(TgenLep0_Pt, TgenLep1_Pt, TgenDeltaPhi) > 30", chan, 10, 0, 2.5);
  //mp->AddDistribution("MT2_DiPt_DeltaEta", "GetMT2orDiPtorDeltaEtaBins(TMT2, TLep0_Pt, TLep1_Pt, TDeltaPhi, TDeltaEta)",  cut, chan, 14, 1, 15);

  //>>> Add nominal samples
  mp->AddSample("TTbar_Powheg", "t#bar{t}", itSignal, 1,       "", weight);
//  mp->AddSample("TTJets_MLM",   "t#bar{t} MLM",    itSignal, kGray+2, "", weight);
  //mp->AddSample("T2tt_200_50_FS_summer",  "SUSY-like [225,50]", itSignal, kRed+1); 
//  mp->AddSample("T2tt_225_50_FS_xqcut20", "TOP -like [225,50]", itSignal, 1, "", weight); 
//  mp->AddSample("T2tt_mStop227_mLsp52",   "TOP -like [227.5,52.5]", itSignal, kRed+1, "", weight); 
  //mp->AddSample("T2tt_225_50_FS_xqcut20", "Old", itSignal, kRed+1, "", weight); 
//  mp->AddSample("T2tt_mStop175_mLsp0",   "T2tt[175.0,  1.0]", itSignal, kGreen+2,  "", weight); 
//  mp->AddSample("T2tt_mStop182_mLsp7",   "T2tt[182.5,  7.5]", itSignal, kBlue+1,  "", weight); 
//  mp->AddSample("T2tt_mStop227_mLsp52_OLD",  "T2tt_bad[227.5, 52.5]", itSignal, kBlue+1, "", weight); 

//  mp->AddSample("T2tt_mStop182_mLsp7",   GetSignalName(182.5,  7.5), itSignal, kAzure-2, "", weight); 
//  mp->AddSample("T2tt_mStop205_mLsp30",  GetSignalName(205,  30), itSignal, kGreen+2, "", weight); 

  mp->AddSample("T2tt_mStop227_mLsp45",  GetSignalName(227.5, 45.0), itSignal, kViolet+1, "", weight); 
  mp->AddSample("T2tt_mStop227_mLsp52",  GetSignalName(227.5, 52.5), itSignal, kRed+1, "", weight); 
  mp->AddSample("T2tt_mStop227_mLsp60",  GetSignalName(227.5, 60.0), itSignal, kOrange+1, "", weight); 

//  mp->AddSample("T2tt_mStop205_mLsp30",  "T2tt[205.0, 30.0]", itSignal, kGreen+1, "", weight); 
//  mp->AddSample("T2tt_mStop182_mLsp7",   GetSignalName(182.5,  7.5), itSignal, kAzure-2, "", weight); 


//  mp->AddSample("T2tt_mStop227_mLsp52_0",  "T2tt[227.5, 52.5] 1/3", itSignal, kOrange+1, "", weight); 
//  mp->AddSample("T2tt_mStop227_mLsp52_1",  "T2tt[227.5, 52.5] 2/3", itSignal, kBlue+2, "", weight); 
//  mp->AddSample("T2tt_mStop227_mLsp52_2",  "T2tt[227.5, 52.5] 3/3", itSignal, kGreen+2, "", weight); 
//  mp->AddSample("T2tt_227p5_52p5_mod",    "mod1", itSignal, 1, "",        weight); 
}


void SavePlot(TString name, TString xtit, float ratiomax, TString LegendPos, bool doSetLogy, bool doNorm, TString chanlab){
  cout << "Setting plot " << name << "..." << endl;
  mp->SetPlot(name, xtit, "Signal/t#bar{t}");
  mp->doSetLogy = doSetLogy;
  mp->SetCMSmodeLabel("Simulation");
  if(chanlab != "") mp->SetChLabel(chanlab);
  mp->SetChLabelPos(0.13, 0.87);
  mp->SetCMSLabelPos(0.65,0.87);
  mp->SetCMSmodeLabelPos(0.722,0.87,24);
  mp->SetTextForLumi("13 TeV", 0.85, 0.97, 0.05);
  mp->SetTitleY("u.a. / 5 GeV");
  mp->SetYaxisOffset(0.82);
  mp->SetYratioOffset(0.32, 0.15);
  mp->SetPadPlotMargins( "0.06, 0.105, 0.05, 0.1"); // top, bottom, right, left
  mp->SetPadRatioMargins("0.03, 0.40 , 0.05, 0.1"); // top, bottom, right, left


  mp->SetLegendTextSize(0.045); mp->SetLegendPosition(0.55, 0.70, 0.93, 0.93);
  if(name == "NBtagsNJets")         mp->SetBinLabels("[0|0], [1|0], [1|1], [2|0], [2|1], [2|2], [3|0], [3|1], [3|2], [3|3], [4|0], [4|1], [4|2], [4|3], [4|4], [>4|]");
  else if(name == "SignalRegions")  mp->SetBinLabels(binLabelsSR);
  if(LegendPos == "") LegendPos = "0.75, 0.70, 0.93, 0.93, 0.040";
  vector<TString> v = TStringToVector(LegendPos);
  int vsiz = v.size();
  if(vsiz < 4){
    cout << "ERROR in legend entries for plot " << name << "..." << endl;
    return;
  }
  mp->SetLegendPosition(v.at(0).Atof(), v.at(1).Atof(), v.at(2).Atof(), v.at(3).Atof());
  if(vsiz >= 5) mp->SetLegendTextSize(v.at(4).Atof());

  mp->SetScaleMax(1.15);  
  mp->SetRatioMax(ratiomax);
  mp->SetRatioMin(2-ratiomax < 0? 0 : 2-ratiomax);
  if(name == "MT2"){
    mp->SetPlotMinimum(0.2e-3);
    mp->SetPlotMaximum(0.4);
  }
  mp->DrawComp(name, doNorm);
}


TString GetSignalName(float mstop, float mchi){
  TString t; 
  //t = Form("Signal m_{#tilde{t}_{1}} = %1.1f GeV, m_{#tilde{#chi}_{1}^{0}} = %1.1f GeV", mstop, mchi);
  t = Form("Signal(%1.1f, %1.1f)", mstop, mchi);
  return t;
}
