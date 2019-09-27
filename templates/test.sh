#!/bin/bash

hostname


plink --bfile $base $covariate $pheno_cmd --threads $num_assoc_cores --${test} $perm $adjust --out $outfname

if [[ \$(ls -A *.assoc.adjusted) ]]; then
  assoc="*.assoc.adjusted"
else
  assoc="*.assoc"
fi

awk -F' ' '{if($9<${params.snp_thresold}) print $2}' \$assoc > snps.txt