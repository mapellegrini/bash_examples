#!/usr/bin/bash


walktree(tfile, cdir)
{
  for fname in $cdir do    
    echo "$fname"  
    if [ -d $fname ];
    then
      echo "directory"
      walktree($tfile, $cdir)
    else
      echo "file"
      if [[$fname == *$tfile* ]]; then
	  echo "Match!"
      fi
    fi
  done
}

tfilename=""
for var in "$@"
do
  if [ -z $tfilename] then
    tfilename=$var
  else
    walktree($tfilename, $var) 	 
  fi     
done
