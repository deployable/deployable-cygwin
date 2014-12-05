require 'spec_helper'
require_relative '../lib/deployable/cygwin/path'
require 'tmpdir'

describe 'Cygwin::Path' do

  before :all do
    @dir = Dir.tmpdir
    Dir.chdir @dir
  end

  it 'to_cyg tmp' do
    expect( Cygwin::Path.to_cyg('c:\tmp') ).to  eql('/cygdrive/c/tmp') 
  end

  it 'to_cyg_relative tmp' do
    expect( Cygwin::Path.to_cyg_relative('tmp') ).to  match(/\A#{@dir}\/tmp\Z/) 
  end

  it 'to_win tmp' do
    expect( Cygwin::Path.to_win('/cygdrive/c/tmp') ).to  eql('C:\tmp') 
  end

  it 'to_win_relative tmp' do
    expect( Cygwin::Path.to_win_relative('tmp') ).to  match(/\A[A-Z]:\\.+\\tmp\Z/) 
  end
  
end

