require 'spec_helper'

describe Cmdparser do
  it 'has a version number' do
    expect(Cmdparser::VERSION).not_to be nil
  end

  describe 'on' do
    it 'usage' do
      CmdParser.new{
        on ['help','-h'] do
          print "help command\n"
        end
        on 'server' do
        end
        on 'server',['port','-p'] do |port|
          print "port #{port}\n"
        end
        on 'server',['type','-t'] do |type|
          print "type #{type}\n"
        end
      }.invoke
    end
  end
end
