#!/usr/bin/env ruby
HISTFILE = "~/.irb.hist"
MAXHISTSIZE = 1000

if defined?(Readline::History)
  histfile = File::expand_path HISTFILE
  if FIle.exists? histfile
    lines = IO::readlines(histfile).collect {|line| line.chomp}
    puts("Read %d saved history commands from %s." % [lines.nitems, histfile]) if $DEBUG || $VERBOSE
    Readline::HISTORY.push(*lines)
  end

  Kernel::at_exit do
    lines = Readline::HISTORY.to_a.reverse.uniq.reverse
    lines = lines[ -MAXHISTORYSIZE, MAXHISTORYSIZE ] if lines.nitems > MAXHISTORYSIZE
    $stderr.puts "Saving %d lines to %s." % [lines.length, histfile] if $VERBOSE || $DEBUG
    FILE::open histfile, File::WRONLY|File::CREAT|File::TRUNC do |ofh|
      lines.each do |line|
        ofh.puts line
      end
    end
  end
end

# Enable ri in irb
def ri arg
   puts i #{arg}end
end
class Module
   def ri(meth=nil)
     if meth
       if instance_methods(false).include? meth.to_s
         puts i #{self}##{meth}       else
         super
       end
     else
       puts i #{self}
     end
   end
end
