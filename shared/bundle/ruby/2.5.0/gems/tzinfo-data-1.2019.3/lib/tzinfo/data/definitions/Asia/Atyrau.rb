# encoding: UTF-8

# This file contains data derived from the IANA Time Zone Database
# (http://www.iana.org/time-zones).

module TZInfo
  module Data
    module Definitions
      module Asia
        module Atyrau
          include TimezoneDefinition
          
          timezone 'Asia/Atyrau' do |tz|
            tz.offset :o0, 12464, 0, :LMT
            tz.offset :o1, 10800, 0, :'+03'
            tz.offset :o2, 18000, 0, :'+05'
            tz.offset :o3, 21600, 0, :'+06'
            tz.offset :o4, 18000, 3600, :'+06'
            tz.offset :o5, 14400, 3600, :'+05'
            tz.offset :o6, 14400, 0, :'+04'
            
            tz.transition 1924, 5, :o1, -1441164464, 13089099721, 5400
            tz.transition 1930, 6, :o2, -1247540400, 19409187, 8
            tz.transition 1981, 9, :o3, 370724400
            tz.transition 1982, 3, :o4, 386445600
            tz.transition 1982, 9, :o2, 402256800
            tz.transition 1983, 3, :o4, 417985200
            tz.transition 1983, 9, :o2, 433792800
            tz.transition 1984, 3, :o4, 449607600
            tz.transition 1984, 9, :o2, 465339600
            tz.transition 1985, 3, :o4, 481064400
            tz.transition 1985, 9, :o2, 496789200
            tz.transition 1986, 3, :o4, 512514000
            tz.transition 1986, 9, :o2, 528238800
            tz.transition 1987, 3, :o4, 543963600
            tz.transition 1987, 9, :o2, 559688400
            tz.transition 1988, 3, :o4, 575413200
            tz.transition 1988, 9, :o2, 591138000
            tz.transition 1989, 3, :o4, 606862800
            tz.transition 1989, 9, :o2, 622587600
            tz.transition 1990, 3, :o4, 638312400
            tz.transition 1990, 9, :o2, 654642000
            tz.transition 1991, 3, :o5, 670366800
            tz.transition 1991, 9, :o6, 686095200
            tz.transition 1992, 1, :o2, 695772000
            tz.transition 1992, 3, :o4, 701816400
            tz.transition 1992, 9, :o2, 717541200
            tz.transition 1993, 3, :o4, 733266000
            tz.transition 1993, 9, :o2, 748990800
            tz.transition 1994, 3, :o4, 764715600
            tz.transition 1994, 9, :o2, 780440400
            tz.transition 1995, 3, :o4, 796165200
            tz.transition 1995, 9, :o2, 811890000
            tz.transition 1996, 3, :o4, 828219600
            tz.transition 1996, 10, :o2, 846363600
            tz.transition 1997, 3, :o4, 859669200
            tz.transition 1997, 10, :o2, 877813200
            tz.transition 1998, 3, :o4, 891118800
            tz.transition 1998, 10, :o2, 909262800
            tz.transition 1999, 3, :o5, 922568400
            tz.transition 1999, 10, :o6, 941320800
            tz.transition 2000, 3, :o5, 954021600
            tz.transition 2000, 10, :o6, 972770400
            tz.transition 2001, 3, :o5, 985471200
            tz.transition 2001, 10, :o6, 1004220000
            tz.transition 2002, 3, :o5, 1017525600
            tz.transition 2002, 10, :o6, 1035669600
            tz.transition 2003, 3, :o5, 1048975200
            tz.transition 2003, 10, :o6, 1067119200
            tz.transition 2004, 3, :o5, 1080424800
            tz.transition 2004, 10, :o2, 1099173600
          end
        end
      end
    end
  end
end
