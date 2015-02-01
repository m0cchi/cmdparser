class CmdParser

  def initialize args=ARGV,&block
    @procs = {}
    @ARGV = args
    if block
      instance_eval &block
    end
    self
  end

  def on declaration=nil,args, &block
    args = [args] if args.class != [].class
    block_args = block.parameters
    proc = { :arg_len => block_args.length, :block => block ,:declaration => declaration}
    args.each{ |arg| @procs[arg] = proc }
  end

  def declaration? name
    @procs.include? name
  end

  def invoke
    skip = 0
    @ARGV.each_with_index do |v,i|
      if skip > 0
        skip -= 1
        next
      end
      if !declaration? v
        next
      end
      args = []
      proc = @procs[v]
      len = proc[:arg_len]
      unless !proc[:declaration] || declaration?(proc[:declaration])
        next
      end
      if len > 0
        (1..len).each do |n|
          if n + i < @ARGV.length
            args << @ARGV[n + i]
            skip += 1
          end
        end
      end
      proc[:block].call *args
    end
  end

end
