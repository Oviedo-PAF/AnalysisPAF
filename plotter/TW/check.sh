source pre_start.sh

cd ../..

slash="/"
allok=0

# Minimum size (in bytes!):
minimumsize=50000

init="Tree_"
final=".root"

workingpath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Number of total samples: 60

# samples=("TTbar_Powheg" "TTbar_PowhegSemi" "DYJetsToLL_M50_aMCatNLO" "DYJetsToLL_M10to50_aMCatNLO" "WJetsToLNu_aMCatNLO" 
#   "WJetsToLNu_MLM" "ZZ" "WW" "WZ" "TTWToLNu" "TTZToQQ" "TTZToLLNuNu" "TTWToQQ" "TTGJets" 
#   "MuonEG" "SingleElec" "SingleMuon" "TW" "TbarW")
samples=("TTbar_Powheg" "TTbar_PowhegSemi" "DYJetsToLL_M50_aMCatNLO" "DYJetsToLL_M10to50_aMCatNLO" 
  "WJetsToLNu_MLM" "ZZ" "WW" "WZ" "TTWToLNu" "TTZToQQ" "TTZToLLNuNu" "TTWToQQ" "TTGJets" 
  "MuonEG" "SingleElec" "SingleMuon" "TW" "TbarW")
# samples_syst=("TTbar_Powheg_ueUp" "TTbar_Powheg_ueDown" "TTbar_Powheg_isrUp" "TTbar_Powheg_isrDown" "TTbar_Powheg_fsrUp" "TTbar_Powheg_fsrDown" 
#   "TTbar_Powheg_Herwig_ext2" "TTJets_aMCatNLO" "TTbar_Powheg_hdampUp" "TTbar_Powheg_hdampDown" "TW_DS" "TbarW_DS" 
#   "TW_noFullyHadr_isrUp" "TW_noFullyHadr_isrDown" "TW_noFullyHadr_fsrUp" "TW_noFullyHadr_fsrDown" "TW_noFullyHadr_MEscaleUp" "TW_noFullyHadr_MEscaleDown" "TbarW_noFullyHadr_isrUp" 
#   "TbarW_noFullyHadr_isrDown" "TbarW_noFullyHadr_fsrUp" "TbarW_noFullyHadr_fsrDown" "TbarW_noFullyHadr_MEscaleUp" "TbarW_noFullyHadr_MEscaleDown" 
#   "TTbar_Powheg_mtop1665" "TTbar_Powheg_mtop1695_backup" "TTbar_Powheg_mtop1735" 
#   "TTbar_Powheg_mtop1755" "TTbar_Powheg_mtop1785" "TTbar_Powheg_erdON" 
#   "TTbar_QCDbasedCRTune_erdON" "TTbar_GluonMoveCRTune" "TTbar_GluonMoveCRTune_erdON" "TW_noFullyHadr_mtop1695" "TW_noFullyHadr_mtop1755" 
#   "TbarW_noFullyHadr_mtop1695" "TbarW_noFullyHadr_mtop1755" "TW_noFullyHadr_herwigpp" "TbarW_noFullyHadr_herwigpp" 
#   "treeProducerSusyMultilepton_tree" "treeProducerSusyMultilepton_tree_TW" "treeProducerSusyMultilepton_tree_TbarW")
# samples_syst=("TTbar_Powheg_ueUp" "TTbar_Powheg_ueDown" "TTbar_Powheg_isrUp" "TTbar_Powheg_isrDown" "TTbar_Powheg_fsrUp" "TTbar_Powheg_fsrDown" 
#   "TTbar_Powheg_hdampUp" "TTbar_Powheg_hdampDown" 
#   "TW_noFullyHadr_isrUp" "TW_noFullyHadr_isrDown" "TW_noFullyHadr_fsrUp" "TW_noFullyHadr_fsrDown" "TW_noFullyHadr_MEscaleUp" "TW_noFullyHadr_MEscaleDown" "TbarW_noFullyHadr_isrUp" 
#   "TbarW_noFullyHadr_isrDown" "TbarW_noFullyHadr_fsrUp" "TbarW_noFullyHadr_fsrDown" "TbarW_noFullyHadr_MEscaleUp" "TbarW_noFullyHadr_MEscaleDown" 
#   "tree_TW" "tree_TbarW")
samples_syst=("TTbar_Powheg_ueUp" "TTbar_Powheg_ueDown" "TTbar_Powheg_isrUp" "TTbar_Powheg_isrDown" "TTbar_Powheg_fsrUp" "TTbar_Powheg_fsrDown" 
  "TTbar_Powheg_hdampUp" "TTbar_Powheg_hdampDown" 
  "TW_noFullyHadr_isrUp" "TW_noFullyHadr_isrDown" "TW_noFullyHadr_fsrUp" "TW_noFullyHadr_fsrDown" "TW_noFullyHadr_MEscaleUp" "TW_noFullyHadr_MEscaleDown" "TW_noFullyHadr_DS" 
  "TW_noFullyHadr_PSscaleUp" "TW_noFullyHadr_PSscaleDown" "TbarW_noFullyHadr_isrUp" "TbarW_noFullyHadr_isrDown" "TbarW_noFullyHadr_fsrUp" "TbarW_noFullyHadr_fsrDown" 
  "TbarW_noFullyHadr_MEscaleUp" "TbarW_noFullyHadr_MEscaleDown" "TbarW_noFullyHadr_DS" "TbarW_noFullyHadr_PSscaleUp" "TbarW_noFullyHadr_PSscaleDown")
  
# runsamples=("TTbar_Powheg" "TTbar_Powheg" "DYJetsToLL_M50_aMCatNLO" "DYJetsToLL_M10to50_aMCatNLO & DYJetsToLL_M10to50_aMCatNLO_ext" "WJetsToLNu_aMCatNLO" 
#   "WJetsToLNu_MLM & WJetsToLNu_MLM_ext2" "ZZ & ZZ_ext" "WW & WW_ext" "WZ & WZ_ext" "TTWToLNu_ext1 & TTWToLNu_ext2" "TTZToQQ" "TTZToLLNuNu_ext1 & TTZToLLNuNu_ext2" "TTWToQQ" "TTGJets" 
#   "MuonEG" "SingleElec" "SingleMuon" "TW_ext" "Tbar_ext")
runsamples=("TTbar_Powheg" "TTbar_Powheg" "DYJetsToLL_M50_aMCatNLO" "DYJetsToLL_M10to50_aMCatNLO & DYJetsToLL_M10to50_aMCatNLO_ext" 
  "WJetsToLNu_MLM & WJetsToLNu_MLM_ext2" "ZZ & ZZ_ext" "WW & WW_ext" "WZ & WZ_ext" "TTWToLNu_ext1 & TTWToLNu_ext2" "TTZToQQ" "TTZToLLNuNu_ext1 & TTZToLLNuNu_ext2" "TTWToQQ" "TTGJets" 
  "MuonEG" "SingleElec" "SingleMuon")
# runsamples_syst=("TTbar_Powheg_ueUp" "TTbar_Powheg_ueDown" "TTbar_Powheg_isrUp_ext" "TTbar_Powheg_isrDown" "TTbar_Powheg_fsrUp" "TTbar_Powheg_fsrDown" 
#   "TTbar_Powheg_Herwig_ext2" "TTJets_aMCatNLO" "TTbar_Powheg_hdampUp & TTbar_Powheg_hdampUp_ext" "TTbar_Powheg_hdampDown & TTbar_Powheg_hdampDown_ext" "TW_DS" "TbarW_DS" 
#   "TW_noFullyHadr_isrUp" "TW_noFullyHadr_isrDown" "TW_noFullyHadr_fsrUp" "TW_noFullyHadr_fsrDown" "TW_noFullyHadr_MEscaleUp" "TW_noFullyHadr_MEscaleDown" "TbarW_noFullyHadr_isrUp" 
#   "TbarW_noFullyHadr_isrDown" "TbarW_noFullyHadr_fsrUp" "TbarW_noFullyHadr_fsrDown" "TbarW_noFullyHadr_MEscaleUp" "TbarW_noFullyHadr_MEscaleDown" 
#   "TTbar_Powheg_mtop1665" "TTbar_Powheg_mtop1695_backup & TTbar_Powheg_mtop1695_ext & TTbar_Powheg_mtop1695_ext2" "TTbar_Powheg_mtop1735" 
#   "TTbar_Powheg_mtop1755 & TTbar_Powheg_mtop1755_ext & TTbar_Powheg_mtop1755_ext2" "TTbar_Powheg_mtop1785" "TTbar_Powheg_erdON & TTbar_Powheg_erdON_ext" 
#   "TTbar_QCDbasedCRTune_erdON & TTbar_QCDbasedCRTune_erdON_ext" "TTbar_GluonMoveCRTune" "TTbar_GluonMoveCRTune_erdON" "TW_noFullyHadr_mtop1695" "TW_noFullyHadr_mtop1755" 
#   "TbarW_noFullyHadr_mtop1695" "TbarW_noFullyHadr_mtop1755" "TW_noFullyHadr_herwigpp" "TbarW_noFullyHadr_herwigpp")
# runsamples_syst=("TTbar_Powheg_ueUp" "TTbar_Powheg_ueDown" "TTbar_Powheg_isrUp_ext" "TTbar_Powheg_isrDown" "TTbar_Powheg_fsrUp" "TTbar_Powheg_fsrDown" 
#   "TTbar_Powheg_hdampUp & TTbar_Powheg_hdampUp_ext" "TTbar_Powheg_hdampDown & TTbar_Powheg_hdampDown_ext" 
#   "TW_noFullyHadr_isrUp" "TW_noFullyHadr_isrDown" "TW_noFullyHadr_fsrUp" "TW_noFullyHadr_fsrDown" "TW_noFullyHadr_MEscaleUp" "TW_noFullyHadr_MEscaleDown" "TbarW_noFullyHadr_isrUp" 
#   "TbarW_noFullyHadr_isrDown" "TbarW_noFullyHadr_fsrUp" "TbarW_noFullyHadr_fsrDown" "TbarW_noFullyHadr_MEscaleUp" "TbarW_noFullyHadr_MEscaleDown")
runsamples_syst=("TTbar_Powheg_ueUp" "TTbar_Powheg_ueDown" "TTbar_Powheg_isrUp_ext" "TTbar_Powheg_isrDown" "TTbar_Powheg_fsrUp" "TTbar_Powheg_fsrDown" 
  "TTbar_Powheg_hdampUp & TTbar_Powheg_hdampUp_ext" "TTbar_Powheg_hdampDown & TTbar_Powheg_hdampDown_ext")

uplimit=$((${#samples[@]}-1))
uplimit_syst=$((${#samples_syst[@]}-1))

# ncores=("20" "20" "20" "20" "20" "8" 
#   "8" "8" "8" "8" "8" "8" "8" "8" "5" 
#   "10" "30" "30")
ncores=("20" "20" "20" "20" 
  "8" "8" "8" "8" "8" "8" "8" "8" "5" 
  "30" "30" "30" "15" "15")
# ncores_syst=("20" "20" "20" "20" "20" "20" 
#   "20" "20" "20" "20" "20" "20" 
#   "20" "20" "20" "20" "30" "30" "20" 
#   "20" "20" "20" "30" "30" 
#   "20" "20" "20" 
#   "20" "20" "20" 
#   "20" "20" "20" "20" "20" 
#   "20" "20" "20" "20")
# ncores_syst=("20" "20" "20" "20" "20" "20" 
#   "20" "20" 
#   "20" "20" "20" "20" "30" "30" "20" 
#   "20" "20" "20" "30" "30" )
ncores_syst=("20" "20" "20" "20" "20" "20" 
  "20" "20" 
  "20" "20" "20" "20" "20" "20" "20" 
  "20" "20" "20" "20" "20" "20" 
  "20" "20" "20" "20" "20")

plotspath="/nfs/fanae/user/vrbouza/Documents/TFM/AnalysisPAF/TW_temp"
if [ "$3" != "" ]; then
  plotspath=$3
fi

sel="TW"

if [ "$2" != "" ]; then
  sel=$2
fi

if [ "$1" == "" ]; then
  echo "ERROR - No valid arguments given"
  echo "Please, execute this script with a valid argument"
  cd plotter/TW
  return
fi

uplimit=$((${#samples[@]}-1))
echo " "
echo "Checking that the respective..."
echo $uplimit
echo "...root files exist in..."
echo $plotspath
echo "...with selection..."
echo $sel
echo "...with at least..."
echo $minimumsize
echo "...bytes of size. If they do not fulfil these requirements, they will be reanalysed with..."
echo $1
echo "...cores."
echo " "

path=""
checker=0
actualsize=0
especial="TTbar_PowhegSemi"
pathespecial=$plotspath$slash$init$especial$final

echo "%%%%%%%%> Checking general-purpose samples..."

while [ $allok != ${#samples[@]} ]; do
  checker=$(($checker+1))
  allok=0
  for ((i=0; i<=$uplimit; i++)); do
    unset path
    unset actualsize
    
    path=$plotspath$slash$init${samples[i]}$final
    
    if [ ! -e $path ]; then
      echo " "
      echo "%%%% => ROOT file not found. The sample that is missing is:"
      echo ${samples[i]}
      echo "Reanalysing..."
      echo " "
      
#       root -l -b -q "RunAnalyserPAF.C(\"${runsamples[i]}\", \"$sel\", $1)"
      if [ ${samples[i]} == "TW" ]; then
        root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TW_ext.root\", \"$sel\", $1, 0, 0, 35.85)"
      elif [ ${samples[i]} == "TbarW" ]; then
        root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TbarW_ext.root\", \"$sel\", $1, 0, 0, 35.85)"
      else
        root -l -b -q "RunAnalyserPAF.C(\"${runsamples[i]}\", \"$sel\", $1)"
      fi
      resetpaf -a
      
      allok=$(($allok-8))
    fi
    
    if [ -e $path ]; then
      actualsize=$(wc -c <"$path")
      if [ $actualsize -le $minimumsize ]; then
        echo " "
        echo "%%%% => ROOT file with..."
        echo $actualsize
        echo "...bytes of size, which are lower than the minimum. This sample is:"
        echo ${samples[i]}
        echo "Reanalysing..."
        echo " "
#         root -l -b -q "RunAnalyserPAF.C(\"${runsamples[i]}\", \"$sel\", $1)"
        
      if [ ${samples[i]} == "TW" ]; then
        root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TW_ext.root\", \"$sel\", $1, 0, 0, 35.85)"
      elif [ ${samples[i]} == "TbarW" ]; then
        root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TbarW_ext.root\", \"$sel\", $1, 0, 0, 35.85)"
      else
        root -l -b -q "RunAnalyserPAF.C(\"${runsamples[i]}\", \"$sel\", $1)"
      fi
        resetpaf -a
        
        allok=$(($allok-8))
      fi
    fi
    
    allok=$(($allok+1))
  done
  
  if [ ! -e $pathespecial ]; then
    echo " "
    echo "%%%% => ROOT file not found. The sample that is missing is:"
    echo $especial
    echo "Reanalysing..."
    echo " "
    
    root -l -b -q "RunAnalyserPAF.C(\"TTbar_Powheg\", \"TW_Semi\", $1)"
    resetpaf -a
    
    allok=$(($allok-8))
  fi
  
  if [ -e $pathespecial ]; then
    actualsize=$(wc -c <"$pathespecial")
    if [ $actualsize -le $minimumsize ]; then
      echo " "
      echo "%%%% => ROOT file with..."
      echo $actualsize
      echo "...bytes of size, which are lower than the minimum. This sample is:"
      echo $especial
      echo "Reanalysing..."
      echo " "
      
      root -l -b -q "RunAnalyserPAF.C(\"TTbar_Powheg\", \"TW_Semi\", $1)"
      resetpaf -a
      
      allok=$(($allok-8))
    fi
  fi
  
  if [ $checker == 10 ]; then
    echo " "
    echo "%%%% => ERROR: limit of iterations (10) reached. There has been a problem with the execution or the general-purpose sample files."
    echo "%%%% => The bash script will now end."
    echo " "
    cd plotter/TW
    exit
  fi
  sleep 5
done

path=""
checker=0
actualsize=0

echo "%%%%%%%%> Checking samples for systematic uncertanties..."

while [ $allok != ${#samples_syst[@]} ]; do
  checker=$(($checker+1))
  allok=0
  for ((i=0; i<=$uplimit_syst; i++)); do
    unset path
    unset actualsize
    
    path=$plotspath$slash$init${samples_syst[i]}$final
    
    if [ ! -e $path ]; then
      echo " "
      echo "%%%% => ROOT file not found. The sample that is missing is:"
      echo ${samples_syst[i]}
      echo "Reanalysing..."
      echo " "
#       if [ ${samples_syst[i]} == "treeProducerSusyMultilepton_tree" ]; then
#         root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/bfrag/treeProducerSusyMultilepton_tree.root\", \"$sel\", $1, 0, 0, 831.76)"
#       elif [ ${samples_syst[i]} == "treeProducerSusyMultilepton_tree_TW" ]; then
#       if [ ${samples_syst[i]} == "treeProducerSusyMultilepton_tree_TW" ]; then
#         root -l -b -q "RunAnalyserPAF.C(\"/pool/ciencias/userstorage/sscruz/TW/mar19/TW_ext/treeProducerSusyMultilepton/tree_TW.root.root\", \"$sel\", $1, 0, 0, 35.85)"
#       elif [ ${samples_syst[i]} == "treeProducerSusyMultilepton_tree_TbarW" ]; then
#         root -l -b -q "RunAnalyserPAF.C(\"/pool/ciencias/userstorage/sscruz/TW/mar19/TbarW_ext/treeProducerSusyMultilepton/tree_TbarW.root.root\", \"$sel\", $1, 0, 0, 35.85)"
      if [ ${samples_syst[i]} == "TbarW_noFullyHadr_isrUp" ]; then
        root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TbarW_noFullyHadr_isrUp.root\", \"$sel\", $1, 0, 0, 35.85)"
      elif [ ${samples_syst[i]} == "TbarW_noFullyHadr_isrDown" ]; then
        root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TbarW_noFullyHadr_isrDown.root\", \"$sel\", $1, 0, 0, 35.85)"
      elif [ ${samples_syst[i]} == "TbarW_noFullyHadr_fsrUp" ]; then
        root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TbarW_noFullyHadr_fsrUp.root\", \"$sel\", $1, 0, 0, 35.85)"
      elif [ ${samples_syst[i]} == "TbarW_noFullyHadr_fsrDown" ]; then
        root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TbarW_noFullyHadr_fsrDown.root\", \"$sel\", $1, 0, 0, 35.85)"
      elif [ ${samples_syst[i]} == "TbarW_noFullyHadr_MEscaleUp" ]; then
        root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TbarW_noFullyHadr_MEscaleUp.root\", \"$sel\", $1, 0, 0, 35.85)"
      elif [ ${samples_syst[i]} == "TbarW_noFullyHadr_MEscaleDown" ]; then
        root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TbarW_noFullyHadr_MEscaleDown.root\", \"$sel\", $1, 0, 0, 35.85)"
      elif [ ${samples_syst[i]} == "TbarW_noFullyHadr_DS" ]; then
        root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TbarW_noFullyHadr_DS.root\", \"$sel\", $1, 0, 0, 35.85)"
      elif [ ${samples_syst[i]} == "TbarW_noFullyHadr_PSscaleUp" ]; then
        root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TbarW_noFullyHadr_PSscaleUp.root\", \"$sel\", $1, 0, 0, 35.85)"
      elif [ ${samples_syst[i]} == "TbarW_noFullyHadr_PSscaleDown" ]; then
        root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TbarW_noFullyHadr_PSscaleDown.root\", \"$sel\", $1, 0, 0, 35.85)"
        
      elif [ ${samples_syst[i]} == "TW_noFullyHadr_isrUp" ]; then
        root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TW_noFullyHadr_isrUp.root\", \"$sel\", $1, 0, 0, 35.85)"
      elif [ ${samples_syst[i]} == "TW_noFullyHadr_isrDown" ]; then
        root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TW_noFullyHadr_isrDown.root\", \"$sel\", $1, 0, 0, 35.85)"
      elif [ ${samples_syst[i]} == "TW_noFullyHadr_fsrUp" ]; then
        root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TW_noFullyHadr_fsrUp.root\", \"$sel\", $1, 0, 0, 35.85)"
      elif [ ${samples_syst[i]} == "TW_noFullyHadr_fsrDown" ]; then
        root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TW_noFullyHadr_fsrDown.root\", \"$sel\", $1, 0, 0, 35.85)"
      elif [ ${samples_syst[i]} == "TW_noFullyHadr_MEscaleUp" ]; then
        root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TW_noFullyHadr_MEscaleUp.root\", \"$sel\", $1, 0, 0, 35.85)"
      elif [ ${samples_syst[i]} == "TW_noFullyHadr_MEscaleDown" ]; then
        root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TW_noFullyHadr_MEscaleDown.root\", \"$sel\", $1, 0, 0, 35.85)"
      elif [ ${samples_syst[i]} == "TW_noFullyHadr_DS" ]; then
        root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TW_noFullyHadr_DS.root\", \"$sel\", $1, 0, 0, 35.85)"
      elif [ ${samples_syst[i]} == "TW_noFullyHadr_PSscaleUp" ]; then
        root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TW_noFullyHadr_PSscaleUp.root\", \"$sel\", $1, 0, 0, 35.85)"
      elif [ ${samples_syst[i]} == "TW_noFullyHadr_PSscaleDown" ]; then
        root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TW_noFullyHadr_PSscaleDown.root\", \"$sel\", $1, 0, 0, 35.85)"
      else
        root -l -b -q "RunAnalyserPAF.C(\"${runsamples_syst[i]}\", \"$sel\", $1)"
      fi
      resetpaf -a
      
      allok=$(($allok-8))
    fi
    
    if [ -e $path ]; then
      actualsize=$(wc -c <"$path")
      if [ $actualsize -le $minimumsize ]; then
        echo " "
        echo "%%%% => ROOT file with..."
        echo $actualsize
        echo "...bytes of size, which are lower than the minimum. This sample is:"
        echo ${samples_syst[i]}
        echo "Reanalysing..."
        echo " "
#         root -l -b -q "RunAnalyserPAF.C(\"${runsamples_syst[i]}\", \"$sel\", $1)"

        if [ ${samples_syst[i]} == "TbarW_noFullyHadr_isrUp" ]; then
          root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TbarW_noFullyHadr_isrUp.root\", \"$sel\", $1, 0, 0, 35.85)"
        elif [ ${samples_syst[i]} == "TbarW_noFullyHadr_isrDown" ]; then
          root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TbarW_noFullyHadr_isrDown.root\", \"$sel\", $1, 0, 0, 35.85)"
        elif [ ${samples_syst[i]} == "TbarW_noFullyHadr_fsrUp" ]; then
          root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TbarW_noFullyHadr_fsrUp.root\", \"$sel\", $1, 0, 0, 35.85)"
        elif [ ${samples_syst[i]} == "TbarW_noFullyHadr_fsrDown" ]; then
          root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TbarW_noFullyHadr_fsrDown.root\", \"$sel\", $1, 0, 0, 35.85)"
        elif [ ${samples_syst[i]} == "TbarW_noFullyHadr_MEscaleUp" ]; then
          root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TbarW_noFullyHadr_MEscaleUp.root\", \"$sel\", $1, 0, 0, 35.85)"
        elif [ ${samples_syst[i]} == "TbarW_noFullyHadr_MEscaleDown" ]; then
          root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TbarW_noFullyHadr_MEscaleDown.root\", \"$sel\", $1, 0, 0, 35.85)"
        elif [ ${samples_syst[i]} == "TbarW_noFullyHadr_DS" ]; then
          root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TbarW_noFullyHadr_DS.root\", \"$sel\", $1, 0, 0, 35.85)"
        elif [ ${samples_syst[i]} == "TbarW_noFullyHadr_PSscaleUp" ]; then
          root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TbarW_noFullyHadr_PSscaleUp.root\", \"$sel\", $1, 0, 0, 35.85)"
        elif [ ${samples_syst[i]} == "TbarW_noFullyHadr_PSscaleDown" ]; then
          root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TbarW_noFullyHadr_PSscaleDown.root\", \"$sel\", $1, 0, 0, 35.85)"
          
        elif [ ${samples_syst[i]} == "TW_noFullyHadr_isrDown" ]; then
          root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TW_noFullyHadr_isrDown.root\", \"$sel\", $1, 0, 0, 35.85)"
        elif [ ${samples_syst[i]} == "TW_noFullyHadr_fsrUp" ]; then
          root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TW_noFullyHadr_fsrUp.root\", \"$sel\", $1, 0, 0, 35.85)"
        elif [ ${samples_syst[i]} == "TW_noFullyHadr_fsrDown" ]; then
          root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TW_noFullyHadr_fsrDown.root\", \"$sel\", $1, 0, 0, 35.85)"
        elif [ ${samples_syst[i]} == "TW_noFullyHadr_MEscaleUp" ]; then
          root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TW_noFullyHadr_MEscaleUp.root\", \"$sel\", $1, 0, 0, 35.85)"
        elif [ ${samples_syst[i]} == "TW_noFullyHadr_MEscaleDown" ]; then
          root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TW_noFullyHadr_MEscaleDown.root\", \"$sel\", $1, 0, 0, 35.85)"
        elif [ ${samples_syst[i]} == "TW_noFullyHadr_DS" ]; then
          root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TW_noFullyHadr_DS.root\", \"$sel\", $1, 0, 0, 35.85)"
        elif [ ${samples_syst[i]} == "TW_noFullyHadr_PSscaleUp" ]; then
          root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TW_noFullyHadr_PSscaleUp.root\", \"$sel\", $1, 0, 0, 35.85)"
        elif [ ${samples_syst[i]} == "TW_noFullyHadr_PSscaleDown" ]; then
          root -l -b -q "RunAnalyserPAF.C(\"LocalFile:/pool/ciencias/userstorage/sscruz/TW/mar27/TW_noFullyHadr_PSscaleDown.root\", \"$sel\", $1, 0, 0, 35.85)"
        else
          root -l -b -q "RunAnalyserPAF.C(\"${runsamples_syst[i]}\", \"$sel\", $1)"
        fi
        resetpaf -a
        allok=$(($allok-8))
      fi
    fi
    
    allok=$(($allok+1))
  done
  if [ $checker == 10 ]; then
    echo " "
    echo "%%%% => ERROR: limit of iterations (10) reached. There has been a problem with the execution or the sample files for systematic uncertanties."
    echo "%%%% => The bash script will now end."
    echo " "
    cd plotter/TW
    exit
  fi
  sleep 5
done



echo "%%%% => All expected ROOT files are in the folder"
cd plotter/TW
