require 'spec_helper'
require_relative '../lib/deployable/cygwin'


describe 'Deployable::Cygwin' do

  it 'CYGWIN constant' do
    expect( Deployable::Cygwin.const_defined? :CYGWIN ).to  be true
  end

  it 'cygwin? function exists' do
    expect( Deployable::Cygwin.respond_to? :cygwin? ).to  be true
  end

  it 'cygwin? boolean' do
    expect( Deployable::Cygwin.cygwin? ).to  be true or false
  end

end