#!/usr/bin/env ruby
# encoding: iso-8859-1
# frozen_string_literal: true

#--
# Portions copyright 2004 by Jim Weirich (jim@weirichhouse.org).
# Portions copyright 2005 by Sam Ruby (rubys@intertwingly.net).
# All rights reserved.

# Permission is granted for use, copying, modification, distribution,
# and distribution of modified versions of this work as long as the
# above copyright notice is included.
#++

require 'builder/xmlmarkup'
require 'benchmark'

text = "This is a test of the new xml markup. Iï¿½tï¿½rnï¿½tiï¿½nï¿½lizï¿½tiï¿½n\n" * 10000

include Benchmark # we need the CAPTION and FMTSTR constants
include Builder
n = 50
Benchmark.benchmark do |bm|
  tf = bm.report("base") do
    n.times do
      x = XmlMarkup.new
      x.text(text)
      x.target!
    end
  end
  def XmlMarkup._escape(text)
    text.to_xs
  end
  tf = bm.report("to_xs") do
    n.times do
      x = XmlMarkup.new
      x.text(text)
      x.target!
    end
  end
end
