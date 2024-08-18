#!/usr/bin/ruby
#Распределение книг по каталогам УДК

require "./getudk"
require "pathname"
require "fileutils"

version='0.0.0'
basebib_dir="/home/o/bib/scat/"
catalog_from="#{basebib_dir}1/"
usage= <<EOF
#{$0} version #{version}
Распределение книг по каталогам УДК
_Usage : #{$0} catalog-from base_bibl-dir(#{basebib_dir})
EOF
puts usage

log=File.open( "now.log","w" )
catalog_from= ARGV[0]?ARGV[0]:catalog_from
basebib_dir= ARGV[1]?ARGV[1]:basebib_dir

cat = Pathname.new catalog_from
c= cat.children
p c
for i in c
  i=File.basename i
  puts i
  getudk i
  puts @katalog
  if @katalog.size!=0
    fp=basebib_dir+@katalog
    puts fp
    FileUtils.makedirs( fp )
    FileUtils.install( i, fp )
    log.write "#{@katalog} <- "
    log.write "#{i}\n"
  end
  @katalog=""
end


log.close
