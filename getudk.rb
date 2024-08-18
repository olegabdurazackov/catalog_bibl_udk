#!/usr/ruby
# filename => @katalog UDK
def getudk( val ) 
  data=File.open "./data.udk"
  printf "start getudk( %s )\n", val
  @katalog = ""
  p @katalog
  data.each_line do |x|
      k,w = x.split
#     puts k ;
      #puts w
      pat=Regexp.new(k)
#     p pat
      if pat.match(val)
#         p pat.match(val)
          @katalog=w
          p @katalog
          break
      else 
          @katalog=""
      end
  end
  data.close
  printf "end getudk( %s : %s )\n",val,@katalog
end
if $0==__FILE__
getudk( " Ruby " )
getudk( " Хакера " )
getudk( " Си " )
getudk( " Go C " )
getudk( " python " )
end

