# fb2[.zip|.gz] => fb2.bz2
#
def fb2bz2 val
  printf "start fb2bz2( %s )\n", val
  s=sprintf "bzip2 '%s'",val
  system s
  @fb2bz=val+".bz2"
  printf "end fb2bz2( %s : %s )\n",val,@fb2bz
end 
