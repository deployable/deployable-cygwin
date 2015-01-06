require 'spec_helper'
require_relative '../lib/deployable/cygwin/path'
require 'tmpdir'

describe 'Deployable::Cygwin::Path' do

  before :all do
    CygPath = Deployable::Cygwin::Path
    @dir    = Dir.tmpdir
    Dir.chdir @dir
  end

  it 'to_cyg tmp' do
    expect( CygPath.to_cyg('c:\tmp') ).to  eql '/cygdrive/c/tmp'
  end

  it 'to_cyg_relative tmp' do
    # re /tmpdir/tmp
    re_unix_path = /\A#{@dir}\/tmp\Z/
    expect( CygPath.to_cyg_relative('tmp') ).to  match re_unix_path
  end

  it 'to_win tmp' do
    expect( CygPath.to_win('/cygdrive/c/tmp') ).to  eql 'C:\tmp' 
  end

  it 'to_win_relative tmp' do
    # re Z:\tmpdir\tmp
    re_win_path = /\A[A-Z]:\\.+\\tmp\Z/
    expect( CygPath.to_win_relative('tmp') ).to  match re_win_path
  end
  
  it 'to_win_relative tmp exact' do
    win_tmp_dir = CygPath.to_win @dir
    expect( CygPath.to_win_relative('tmp') ).to  eql "#{win_tmp_dir}\\tmp" 
  end

end

