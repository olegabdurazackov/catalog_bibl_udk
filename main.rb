#!/usr/bin/ruby
#Распределение книг по каталогам УДК

require "./fb2bz2"
require "./getudk"
require "pathname"
require "fileutils"

version='0.0.0'
basebib_dir="/home/o/bib/scat/"
catalog_from="/home/o/bib/1/"
usage= <<EOF
#{$0} version #{version}
Распределение книг по каталогам УДК
_Usage : #{$0} catalog-from base_bibl-dir(#{basebib_dir})
EOF
puts usage

log=File.open( "copy.log","w" )
nocopy=File.open( "nocopy.log","w" )
catalog_from= ARGV[0]?ARGV[0]:catalog_from
basebib_dir= ARGV[1]?ARGV[1]:basebib_dir

cat = Pathname.new catalog_from
c= cat.children
p c
patern=Regexp.new("(fb2$)|(txt$)|(rtf$)")
for j in c
  flp=File.expand_path j
  #p flp
  if patern.match flp
    fb2bz2 flp
    j=File.expand_path @fb2bz
  end
  i=File.basename j
  puts i
  getudk i
  puts @katalog
  if @katalog.size!=0
    fp=basebib_dir+@katalog
    FileUtils.makedirs( fp )
    fp=fp+i
    puts fp
    FileUtils.install( j, fp )
#    exe=sprintf( "cp %s %s",j,fp ) 
#    system exe
    log.write "#{@katalog} <- "
    log.write "#{i}\n"
  else
    nocopy.write "#{i}\n"
  end
  @katalog=""
end


log.close
nocopy.close
